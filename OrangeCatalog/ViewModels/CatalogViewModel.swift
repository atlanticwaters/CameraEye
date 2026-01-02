import SwiftUI

/// Main view model for catalog browsing.
/// Handles category listing, product listing, and search state.
@MainActor
@Observable
final class CatalogViewModel {
    // MARK: - State

    var categorySummaries: [CategoriesIndexResponse.CategorySummary] = []
    var selectedCategory: OrangeCatalogCategory?
    var products: [OrangeCatalogProduct] = []
    var searchText: String = ""
    var selectedSubcategory: String?
    var isLoadingCategories: Bool = false
    var isLoadingProducts: Bool = false
    var errorMessage: String?

    /// The current category summary (stored for subcategory access)
    private(set) var currentCategorySummary: CategoriesIndexResponse.CategorySummary?

    // MARK: - Computed

    /// Filtered products based on subcategory and search text.
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

    /// Available subcategories for the current category.
    var availableSubcategories: [CategoriesIndexResponse.CategorySummary] {
        currentCategorySummary?.subcategories ?? []
    }

    /// Filtered categories based on search text.
    var filteredCategories: [CategoriesIndexResponse.CategorySummary] {
        guard !searchText.isEmpty else { return categorySummaries }
        return categorySummaries.filter { category in
            category.name.localizedStandardContains(searchText)
        }
    }

    /// Whether any loading is in progress.
    var isLoading: Bool {
        isLoadingCategories || isLoadingProducts
    }

    // MARK: - Actions

    /// Load all category summaries from the index.
    func loadCategories() async {
        isLoadingCategories = true
        errorMessage = nil

        do {
            categorySummaries = try await CatalogService.shared.fetchCategorySummaries()
        } catch {
            errorMessage = error.localizedDescription
        }

        isLoadingCategories = false
    }

    /// Refresh categories, clearing cache first.
    func refreshCategories() async {
        isLoadingCategories = true
        errorMessage = nil

        do {
            categorySummaries = try await CatalogService.shared.refreshCategories()
        } catch {
            errorMessage = error.localizedDescription
        }

        isLoadingCategories = false
    }

    /// Load products for a specific category.
    /// - Parameter categorySummary: The category summary to load products for.
    func loadProducts(for categorySummary: CategoriesIndexResponse.CategorySummary) async {
        isLoadingProducts = true
        errorMessage = nil
        currentCategorySummary = categorySummary
        selectedSubcategory = nil

        do {
            let category = try await CatalogService.shared.fetchCategory(slug: categorySummary.slug)
            selectedCategory = category

            if category.hasProductData {
                products = category.products ?? []
            } else {
                // Category uses legacy format without embedded products
                products = []
                errorMessage = "This category doesn't have product details available yet."
            }
        } catch {
            errorMessage = error.localizedDescription
        }

        isLoadingProducts = false
    }

    /// Select a subcategory for filtering.
    func selectSubcategory(_ subcategory: String?) {
        if selectedSubcategory == subcategory {
            // Toggle off if already selected
            selectedSubcategory = nil
        } else {
            selectedSubcategory = subcategory
        }
    }

    /// Clear the subcategory filter.
    func clearSubcategoryFilter() {
        selectedSubcategory = nil
    }

    /// Clear the current error message.
    func clearError() {
        errorMessage = nil
    }

    /// Clear products when navigating away.
    func clearProducts() {
        selectedCategory = nil
        currentCategorySummary = nil
        products = []
        searchText = ""
        selectedSubcategory = nil
    }
}
