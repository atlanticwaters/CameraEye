import SwiftUI

// MARK: - Design System Alias

private typealias DS = DesignSystemGlobal

// MARK: - CategoryProductsView

/// Displays a list of products for a selected category with subcategory filtering.
struct CategoryProductsView: View {
    let category: CategoriesIndexResponse.CategorySummary
    let onProductSelected: (OrangeCatalogProduct) -> Void

    @State private var viewModel = CatalogViewModel()
    @State private var searchText: String = ""

    var body: some View {
        ScrollView {
            LazyVStack(spacing: DS.Spacing3) {
                // Filter Panel with subcategories
                filterPanel

                // Search Bar
                searchBar

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
                viewModel.selectSubcategory(item.text)
            },
            onFilterPillTap: { item in
                // Future: open filter sheet
                print("Filter tapped: \(item.text)")
            },
            onSubFilterPillTap: { item in
                // Clear the filter when tapped
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
                imageURL: subcategory.imageUrl
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

    // MARK: - Search Bar

    private var searchBar: some View {
        HStack(spacing: DS.Spacing2) {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(DS.IconOnContainerColorInactive)

            TextField("Search in \(category.name)", text: $searchText)
                .textFieldStyle(.plain)
                .thdFont(.bodyMd)

            if !searchText.isEmpty {
                Button {
                    searchText = ""
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(DS.IconOnContainerColorInactive)
                }
            }
        }
        .padding(DS.Spacing3)
        .background(DS.BackgroundContainerColorWhite)
        .clipShape(.rect(cornerRadius: DS.BorderRadiusMd))
    }

    // MARK: - Product List

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

    // MARK: - Loading View

    private var loadingView: some View {
        VStack(spacing: DS.Spacing4) {
            ProgressView()
                .scaleEffect(1.5)
            Text("Loading products...")
                .thdFont(.bodyMd)
                .foregroundStyle(DS.TextOnSurfaceColorSecondary)
        }
        .frame(maxWidth: .infinity, minHeight: 200)
    }

    // MARK: - Error View

    private func errorView(message: String) -> some View {
        VStack(spacing: DS.Spacing4) {
            Image(systemName: "exclamationmark.triangle")
                .font(.system(size: 48))
                .foregroundStyle(DS.IconOnContainerColorError)

            Text(message)
                .thdFont(.bodyMd)
                .foregroundStyle(DS.TextOnSurfaceColorSecondary)
                .multilineTextAlignment(.center)

            DSButton("Retry", style: .outlined, size: .medium) {
                Task {
                    await viewModel.loadProducts(for: category)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 200)
    }

    // MARK: - Empty View

    private var emptyView: some View {
        VStack(spacing: DS.Spacing4) {
            let hasActiveFilters = viewModel.selectedSubcategory != nil || !searchText.isEmpty

            Image(systemName: hasActiveFilters ? "magnifyingglass" : "shippingbox")
                .font(.system(size: 48))
                .foregroundStyle(DS.IconOnContainerColorInactive)

            Text(hasActiveFilters ? "No products found" : "No products available")
                .thdFont(.h5)
                .foregroundStyle(DS.TextOnSurfaceColorPrimary)

            if hasActiveFilters {
                Text("Try adjusting your filters or search")
                    .thdFont(.bodyMd)
                    .foregroundStyle(DS.TextOnSurfaceColorSecondary)

                HStack(spacing: DS.Spacing3) {
                    if viewModel.selectedSubcategory != nil {
                        DSButton("Clear Filter", style: .outlined, size: .small) {
                            viewModel.clearSubcategoryFilter()
                        }
                    }
                    if !searchText.isEmpty {
                        DSButton("Clear Search", style: .outlined, size: .small) {
                            searchText = ""
                        }
                    }
                }
            } else {
                Text("This category may still be loading product data.")
                    .thdFont(.bodyMd)
                    .foregroundStyle(DS.TextOnSurfaceColorSecondary)
                    .multilineTextAlignment(.center)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 200)
    }
}

// MARK: - Preview

#Preview("Category Products") {
    NavigationStack {
        CategoryProductsView(
            category: CategoriesIndexResponse.CategorySummary(
                id: "tools",
                name: "Tools",
                slug: "tools",
                productCount: 899,
                path: "/categories/tools",
                imageUrl: nil,
                subcategories: [
                    CategoriesIndexResponse.CategorySummary(
                        id: "drills",
                        name: "Drills",
                        slug: "drills",
                        productCount: 32,
                        path: "/categories/tools/drills",
                        imageUrl: nil,
                        subcategories: nil
                    ),
                    CategoriesIndexResponse.CategorySummary(
                        id: "saws",
                        name: "Saws",
                        slug: "saws",
                        productCount: 41,
                        path: "/categories/tools/saws",
                        imageUrl: nil,
                        subcategories: nil
                    ),
                    CategoriesIndexResponse.CategorySummary(
                        id: "sanders",
                        name: "Sanders",
                        slug: "sanders",
                        productCount: 47,
                        path: "/categories/tools/sanders",
                        imageUrl: nil,
                        subcategories: nil
                    )
                ]
            ),
            onProductSelected: { _ in }
        )
    }
}
