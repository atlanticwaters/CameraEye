# iOS Subcategory Filtering Implementation Plan

## Overview

This document outlines the iOS code changes needed to enable subcategory filtering using the existing `DSPLPFilterPanel` component.

---

## Architecture Summary

```
┌─────────────────────────────────────────────────────────────────┐
│                     CategoryProductsView                        │
│  ┌───────────────────────────────────────────────────────────┐  │
│  │                  DSPlpFilterPanel                         │  │
│  │  ┌─────────────────────────────────────────────────────┐  │  │
│  │  │ Title: "TOOLS"                                       │  │  │
│  │  ├─────────────────────────────────────────────────────┤  │  │
│  │  │ Style Pills (Subcategories):                        │  │  │
│  │  │ [Air Compressors] [Drills] [Grinders] [Sanders]...  │  │  │
│  │  ├─────────────────────────────────────────────────────┤  │  │
│  │  │ Results: "899 RESULTS"                              │  │  │
│  │  ├─────────────────────────────────────────────────────┤  │  │
│  │  │ Filter Pills: [All Filters] [Brand] [Price]         │  │  │
│  │  └─────────────────────────────────────────────────────┘  │  │
│  └───────────────────────────────────────────────────────────┘  │
│  ┌───────────────────────────────────────────────────────────┐  │
│  │                    Product List                           │  │
│  │  (filtered by selected subcategory)                       │  │
│  └───────────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────┘
```

---

## Files to Modify

### 1. OrangeCatalogModels.swift

Add `subcategory` field to `OrangeCatalogProduct`:

```swift
struct OrangeCatalogProduct: Codable, Identifiable, Sendable, Hashable {
    let productId: String
    let modelNumber: String?
    let brand: String?
    let title: String
    let subcategory: String?  // NEW: For filtering
    let rating: ProductRating?
    let images: ProductImages?
    let badges: [String]?
    let availability: ProductAvailability?
    let price: ProductPrice?

    // ... rest of struct

    enum CodingKeys: String, CodingKey {
        case productId, modelNumber, brand, title
        case subcategory  // NEW
        case rating, images, badges, availability, price
    }
}
```

Add `imageUrl` to `CategorySummary`:

```swift
struct CategorySummary: Codable, Identifiable, Sendable, Hashable {
    let id: String
    let name: String
    let slug: String
    let productCount: Int
    let path: String?
    let imageUrl: String?  // NEW: For style pill images
    let subcategories: [CategorySummary]?
}
```

### 2. CatalogViewModel.swift

Add subcategory filtering state and logic:

```swift
@MainActor
@Observable
final class CatalogViewModel {
    // MARK: - Existing State
    var categorySummaries: [CategoriesIndexResponse.CategorySummary] = []
    var selectedCategory: OrangeCatalogCategory?
    var products: [OrangeCatalogProduct] = []
    var searchText: String = ""
    var isLoadingCategories: Bool = false
    var isLoadingProducts: Bool = false
    var errorMessage: String?

    // MARK: - NEW: Subcategory Filtering State
    var selectedSubcategory: String? = nil

    // MARK: - Computed (Updated)

    /// Filtered products based on search text AND subcategory
    var filteredProducts: [OrangeCatalogProduct] {
        var result = products

        // Filter by subcategory first
        if let subcategory = selectedSubcategory {
            result = result.filter { $0.subcategory == subcategory }
        }

        // Then filter by search text
        if !searchText.isEmpty {
            result = result.filter { product in
                product.name.localizedStandardContains(searchText) ||
                (product.brand?.localizedStandardContains(searchText) ?? false)
            }
        }

        return result
    }

    /// Available subcategories for the current category
    var availableSubcategories: [CategoriesIndexResponse.CategorySummary] {
        // Get subcategories from the category summary passed to loadProducts
        // This requires storing the category summary
        currentCategorySummary?.subcategories ?? []
    }

    // Store the current category summary for subcategory access
    private(set) var currentCategorySummary: CategoriesIndexResponse.CategorySummary?

    // MARK: - NEW: Actions

    /// Select a subcategory for filtering
    func selectSubcategory(_ subcategory: String?) {
        selectedSubcategory = subcategory
    }

    /// Clear subcategory filter
    func clearSubcategoryFilter() {
        selectedSubcategory = nil
    }

    // MARK: - Updated: loadProducts

    func loadProducts(for categorySummary: CategoriesIndexResponse.CategorySummary) async {
        isLoadingProducts = true
        errorMessage = nil
        currentCategorySummary = categorySummary  // Store for subcategory access
        selectedSubcategory = nil  // Reset filter when changing categories

        do {
            let category = try await CatalogService.shared.fetchCategory(slug: categorySummary.slug)
            selectedCategory = category

            if category.hasProductData {
                products = category.products ?? []
            } else {
                products = []
                errorMessage = "This category doesn't have product details available yet."
            }
        } catch {
            errorMessage = error.localizedDescription
        }

        isLoadingProducts = false
    }

    /// Clear products when navigating away
    func clearProducts() {
        selectedCategory = nil
        currentCategorySummary = nil
        products = []
        searchText = ""
        selectedSubcategory = nil
    }
}
```

### 3. CategoryProductsView.swift

Replace the current header/search with `DSPlpFilterPanel`:

```swift
import SwiftUI

private typealias DS = DesignSystemGlobal

struct CategoryProductsView: View {
    let category: CategoriesIndexResponse.CategorySummary
    let onProductSelected: (OrangeCatalogProduct) -> Void

    @State private var viewModel = CatalogViewModel()
    @State private var searchText: String = ""

    var body: some View {
        ScrollView {
            LazyVStack(spacing: DS.Spacing3) {
                // NEW: DSPlpFilterPanel with subcategories
                filterPanel

                // Content
                if viewModel.isLoadingProducts {
                    loadingView
                } else if let error = viewModel.errorMessage {
                    errorView(message: error)
                } else if viewModel.filteredProducts.isEmpty {
                    emptyView
                } else {
                    productList
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 100)
        }
        .scrollEdgeEffectStyle(.soft, for: .top)
        .scrollEdgeEffectStyle(.soft, for: .bottom)
        .background(DS.BackgroundSurfaceColorGreige)
        .navigationTitle(category.name)
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.loadProducts(for: category)
        }
        .onChange(of: searchText) { _, newValue in
            viewModel.searchText = newValue
        }
    }

    // MARK: - Filter Panel

    private var filterPanel: some View {
        DSPlpFilterPanel(
            title: category.name.uppercased(),
            stylePills: subcategoryStylePills,
            resultsCount: "\(viewModel.filteredProducts.count) RESULTS",
            filterPills: filterPills,
            subFilterPills: activeFilters,
            onStylePillTap: { item in
                // Toggle subcategory filter
                if viewModel.selectedSubcategory == item.text {
                    viewModel.clearSubcategoryFilter()
                } else {
                    viewModel.selectSubcategory(item.text)
                }
            },
            onFilterPillTap: { item in
                // Handle filter pill tap (future: open filter sheet)
                print("Filter tapped: \(item.text)")
            },
            onSubFilterPillTap: { item in
                // Handle sub-filter tap (clear filter)
                if item.text == viewModel.selectedSubcategory {
                    viewModel.clearSubcategoryFilter()
                }
            }
        )
    }

    /// Convert subcategories to DSStylePillItem array
    private var subcategoryStylePills: [DSStylePillItem] {
        guard let subcategories = category.subcategories else { return [] }

        return subcategories.map { subcategory in
            DSStylePillItem(
                id: subcategory.id,
                text: subcategory.name,
                imageURL: subcategory.imageUrl  // Optional image from API
            )
        }
    }

    /// Standard filter pills
    private var filterPills: [DSFilterPillItem] {
        [
            DSFilterPillItem(
                text: "All Filters",
                icon: Image(systemName: "line.3.horizontal.decrease.circle")
            ),
            DSFilterPillItem(text: "Brand"),
            DSFilterPillItem(text: "Price"),
            DSFilterPillItem(text: "Rating")
        ]
    }

    /// Active filters shown as sub-filter pills
    private var activeFilters: [DSFilterPillItem] {
        var filters: [DSFilterPillItem] = []

        if let subcategory = viewModel.selectedSubcategory {
            filters.append(DSFilterPillItem(text: subcategory))
        }

        return filters
    }

    // MARK: - Product List (unchanged)

    private var productList: some View {
        ForEach(viewModel.filteredProducts) { product in
            Button {
                onProductSelected(product)
            } label: {
                CatalogProductCardView(product: product)
            }
            .buttonStyle(.plain)
        }
    }

    // MARK: - Loading/Error/Empty Views (unchanged)
    // ... keep existing implementations
}
```

---

## Implementation Steps

### Phase 1: Model Updates
1. Add `subcategory` field to `OrangeCatalogProduct`
2. Add `imageUrl` field to `CategorySummary`
3. Test that JSON decoding still works (field is optional)

### Phase 2: ViewModel Updates
1. Add `selectedSubcategory` state
2. Add `currentCategorySummary` storage
3. Update `filteredProducts` computed property
4. Add `selectSubcategory()` and `clearSubcategoryFilter()` methods
5. Update `loadProducts()` to store category summary and reset filter

### Phase 3: View Updates
1. Import `DSPlpFilterPanel` (if needed)
2. Replace `categoryHeader`, `searchBar`, `resultsBar` with single `filterPanel`
3. Add `subcategoryStylePills` computed property
4. Add `filterPills` and `activeFilters` computed properties
5. Wire up tap handlers

### Phase 4: Testing
1. Verify subcategory pills appear for categories with subcategories
2. Verify tapping a pill filters the product list
3. Verify tapping the same pill again clears the filter
4. Verify active filter appears as sub-filter pill
5. Verify clearing works from sub-filter pill tap

---

## Data Dependencies

The iOS implementation requires the catalog agent to:

1. **Add `subcategory` field to products** - Without this, filtering won't work
2. **Optionally add `imageUrl` to subcategories** - For visual pills

See [CATALOG_DATA_INSTRUCTIONS.md](./CATALOG_DATA_INSTRUCTIONS.md) for data format requirements.

---

## Component Reference

### DSStylePillItem
```swift
public struct DSStylePillItem: Identifiable {
    public let id: String
    public let text: String
    public let image: Image?      // Local image
    public let imageURL: String?  // Remote image URL
}
```

### DSFilterPillItem
```swift
public struct DSFilterPillItem: Identifiable {
    public let id: String
    public let text: String
    public let icon: Image?
}
```

### DSPlpFilterPanel
```swift
public struct DSPlpFilterPanel: View {
    init(
        title: String,
        stylePills: [DSStylePillItem] = [],
        resultsCount: String? = nil,
        filterPills: [DSFilterPillItem] = [],
        subFilterPills: [DSFilterPillItem] = [],
        onStylePillTap: ((DSStylePillItem) -> Void)? = nil,
        onFilterPillTap: ((DSFilterPillItem) -> Void)? = nil,
        onSubFilterPillTap: ((DSFilterPillItem) -> Void)? = nil
    )
}
```

---

## Future Enhancements

1. **Brand Filtering**: Add brand filter using `DSFilterPillItem` and product brand field
2. **Price Range Filtering**: Add price slider/range filter
3. **Rating Filtering**: Add minimum rating filter
4. **Search Integration**: Move search into the filter panel or keep separate
5. **Filter Sheet**: Implement full filter sheet when "All Filters" is tapped
6. **Persist Filters**: Remember selected filters when navigating back
