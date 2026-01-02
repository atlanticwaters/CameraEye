import SwiftUI

// MARK: - Design System Alias

private typealias DS = DesignSystemGlobal

// MARK: - CatalogSearchView

/// Search view integrated with the Orange-Catalog.
/// Provides typeahead search with product suggestions from the catalog.
struct CatalogSearchView: View {
    @State private var viewModel = CatalogSearchViewModel()
    @FocusState private var isSearchFieldFocused: Bool
    @Environment(\.dismiss) private var dismiss

    /// Callback when a product is selected for navigation.
    var onProductSelected: ((OrangeCatalogProduct) -> Void)?

    /// Optional callback for custom dismiss behavior.
    var onDismiss: (() -> Void)?

    var body: some View {
        VStack(spacing: 0) {
            // Search Bar
            CatalogSearchBarView(
                searchText: $viewModel.searchText,
                isSearchFieldFocused: $isSearchFieldFocused,
                onClear: { viewModel.clearSearch() },
                onBack: {
                    viewModel.clearSearch()
                    isSearchFieldFocused = false

                    if let onDismiss {
                        onDismiss()
                    } else {
                        dismiss()
                    }
                }
            )
            .padding(.horizontal, 16)
            .padding(.top, 8)

            if viewModel.searchText.isEmpty {
                // Empty State - Recently Viewed and Recent Searches
                emptyStateContent
            } else {
                // Search Results with Typeahead
                searchResultsContent
            }

            Spacer()

            // Bottom Action Bar
            CatalogSearchActionBar()
                .padding(.bottom, 8)
        }
        .background(DS.BackgroundSurfaceColorGreige)
        .onChange(of: isSearchFieldFocused) { _, newValue in
            viewModel.isSearchFocused = newValue
        }
        .task {
            // Pre-load search index for fast typeahead
            await viewModel.loadSearchIndex()
        }
    }

    // MARK: - Empty State Content

    private var emptyStateContent: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                // Recently Viewed Section
                if !viewModel.recentlyViewed.isEmpty {
                    CatalogRecentlyViewedSection(
                        products: viewModel.recentlyViewed,
                        showCompactMode: viewModel.recentSearches.count > 5,
                        onProductSelected: { product in
                            onProductSelected?(product.asProduct)
                        }
                    )
                    .padding(.bottom, 24)
                }

                // Recent Searches Section
                if !viewModel.recentSearches.isEmpty {
                    CatalogRecentSearchesSection(
                        searches: viewModel.recentSearches,
                        onRemove: { query in
                            viewModel.removeRecentSearch(query)
                        },
                        onClearAll: {
                            viewModel.clearAllRecentSearches()
                        },
                        onSelect: { query in
                            viewModel.searchText = query
                        }
                    )
                }

                // Loading indicator for index
                if viewModel.isLoading {
                    HStack {
                        Spacer()
                        ProgressView()
                            .padding()
                        Spacer()
                    }
                }
            }
        }
    }

    // MARK: - Search Results Content

    private var searchResultsContent: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                // Loading indicator
                if viewModel.isLoading {
                    HStack {
                        Spacer()
                        ProgressView()
                            .padding()
                        Spacer()
                    }
                }

                // Matched Product Card (if exists)
                if let product = viewModel.matchedProduct {
                    Button {
                        viewModel.addRecentlyViewedProduct(product)
                        viewModel.addRecentSearch(viewModel.searchText)
                        onProductSelected?(product.asProduct)
                    } label: {
                        CatalogMatchedProductCard(product: product)
                            .padding(.horizontal, 16)
                            .padding(.top, 16)
                    }
                    .buttonStyle(.plain)
                }

                // Search Suggestions
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(viewModel.searchSuggestions) { suggestion in
                        Button {
                            viewModel.selectSearchSuggestion(suggestion)
                            if let product = suggestion.product {
                                onProductSelected?(product.asProduct)
                            }
                        } label: {
                            CatalogSearchSuggestionRow(
                                suggestion: suggestion,
                                searchText: viewModel.searchText
                            )
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.top, 8)

                // Additional Product Results
                if viewModel.filteredResults.count > 5 {
                    additionalResultsSection
                }
            }
        }
    }

    // MARK: - Additional Results Section

    private var additionalResultsSection: some View {
        VStack(alignment: .leading, spacing: DS.Spacing2) {
            Text("More Results")
                .thdFont(.h5)
                .foregroundStyle(DS.TextOnSurfaceColorPrimary)
                .padding(.horizontal, 16)
                .padding(.top, 16)

            ForEach(Array(viewModel.filteredResults.dropFirst(5).prefix(10))) { product in
                Button {
                    viewModel.addRecentlyViewedProduct(product)
                    viewModel.addRecentSearch(viewModel.searchText)
                    onProductSelected?(product.asProduct)
                } label: {
                    CatalogSearchProductRow(product: product)
                }
                .buttonStyle(.plain)
            }

            // Show all results button
            if viewModel.filteredResults.count > 15 {
                HStack {
                    Spacer()
                    Text("View all \(viewModel.filteredResults.count) results")
                        .thdFont(.bodySm)
                        .foregroundStyle(DS.Brand300)
                    Spacer()
                }
                .padding()
            }
        }
    }
}

// MARK: - CatalogSearchBarView

struct CatalogSearchBarView: View {
    @Binding var searchText: String
    @FocusState.Binding var isSearchFieldFocused: Bool
    let onClear: () -> Void
    let onBack: () -> Void

    var body: some View {
        HStack(spacing: 12) {
            // Back Button with glass effect
            Button(action: onBack) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(DS.TextOnSurfaceColorPrimary)
                    .frame(width: 40, height: 40)
                    .background(
                        Circle()
                            .fill(.clear)
                            .glassEffect(.regular.interactive(), in: .circle)
                    )
            }
            .buttonStyle(.plain)

            // Search Field with glass effect
            HStack(spacing: 8) {
                Image(systemName: "magnifyingglass")
                    .foregroundStyle(DS.TextOnSurfaceColorTertiary)
                    .font(.system(size: 16))

                TextField("Search catalog", text: $searchText)
                    .focused($isSearchFieldFocused)
                    .font(.system(size: 16))
                    .foregroundStyle(DS.TextOnSurfaceColorPrimary)
                    .autocorrectionDisabled()

                if !searchText.isEmpty {
                    Button(action: onClear) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(DS.TextOnSurfaceColorTertiary)
                            .font(.system(size: 18))
                    }
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            .background(
                Capsule()
                    .fill(.clear)
                    .glassEffect(.regular, in: .capsule)
            )
        }
    }
}

// MARK: - CatalogRecentlyViewedSection

struct CatalogRecentlyViewedSection: View {
    let products: [CatalogSearchResult]
    let showCompactMode: Bool
    let onProductSelected: (CatalogSearchResult) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Recently Viewed")
                .thdFont(.h5)
                .foregroundStyle(DS.TextOnSurfaceColorPrimary)
                .padding(.horizontal, 16)
                .padding(.top, 20)

            ScrollView(.horizontal) {
                HStack(spacing: 12) {
                    ForEach(products) { product in
                        Button {
                            onProductSelected(product)
                        } label: {
                            CatalogRecentlyViewedCard(product: product, showCompactMode: showCompactMode)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal, 16)
            }
            .scrollIndicators(.hidden)
        }
    }
}

// MARK: - CatalogRecentlyViewedCard

struct CatalogRecentlyViewedCard: View {
    let product: CatalogSearchResult
    let showCompactMode: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Thumbnail
            AsyncImage(url: product.imageURL) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                case .failure:
                    Image(systemName: "photo")
                        .font(.system(size: 32))
                        .foregroundStyle(DS.IconOnContainerColorInactive)
                default:
                    ProgressView()
                }
            }
            .frame(width: 100, height: 100)
            .background(DS.BackgroundContainerColorWhite)
            .clipShape(.rect(cornerRadius: DS.BorderRadiusLg))
            .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)

            if !showCompactMode {
                // Product Name with bold brand
                Text("\(Text(product.brandName).fontWeight(.semibold)) \(product.productDescription)")
                    .thdFont(.bodySm)
                    .foregroundStyle(DS.TextOnSurfaceColorPrimary)
                    .lineLimit(2)
                    .frame(width: 100, alignment: .leading)

                // Price
                if let price = product.formattedPrice {
                    Text(price)
                        .thdFont(.h6)
                        .foregroundStyle(DS.TextOnSurfaceColorPrimary)
                }
            }
        }
    }
}

// MARK: - CatalogRecentSearchesSection

struct CatalogRecentSearchesSection: View {
    let searches: [String]
    let onRemove: (String) -> Void
    let onClearAll: () -> Void
    let onSelect: (String) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Header with Clear All button
            HStack {
                Text("Recent Searches")
                    .thdFont(.h5)
                    .foregroundStyle(DS.TextOnSurfaceColorPrimary)

                Spacer()

                Button(action: onClearAll) {
                    Text("Clear All")
                        .thdFont(.bodySm)
                        .foregroundStyle(DS.TextOnSurfaceColorSecondary)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(.clear)
                                .glassEffect(.regular.interactive(), in: .rect(cornerRadius: 16))
                        )
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal, 16)
            .padding(.top, 20)
            .padding(.bottom, 12)

            // Search items
            VStack(alignment: .leading, spacing: 0) {
                ForEach(searches, id: \.self) { search in
                    CatalogRecentSearchRow(
                        searchText: search,
                        onRemove: { onRemove(search) },
                        onSelect: { onSelect(search) }
                    )
                }
            }
        }
    }
}

// MARK: - CatalogRecentSearchRow

struct CatalogRecentSearchRow: View {
    let searchText: String
    let onRemove: () -> Void
    let onSelect: () -> Void

    var body: some View {
        Button(action: onSelect) {
            HStack(spacing: 12) {
                Image(systemName: "clock")
                    .font(.system(size: 16))
                    .foregroundStyle(DS.TextOnSurfaceColorSecondary)
                    .frame(width: 24)

                Text(searchText)
                    .thdFont(.bodyMd)
                    .foregroundStyle(DS.TextOnSurfaceColorPrimary)

                Spacer()

                Button(action: onRemove) {
                    Image(systemName: "xmark")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundStyle(DS.TextOnSurfaceColorSecondary)
                        .frame(width: 24, height: 24)
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }
}

// MARK: - CatalogMatchedProductCard

struct CatalogMatchedProductCard: View {
    let product: CatalogSearchResult

    var body: some View {
        HStack(spacing: 12) {
            // Thumbnail
            AsyncImage(url: product.imageURL) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                case .failure:
                    Image(systemName: "photo")
                        .font(.system(size: 24))
                        .foregroundStyle(DS.IconOnContainerColorInactive)
                default:
                    ProgressView()
                }
            }
            .frame(width: 56, height: 56)
            .background(DS.BackgroundSurfaceColorGreige)
            .clipShape(.rect(cornerRadius: DS.BorderRadiusMd))

            VStack(alignment: .leading, spacing: 4) {
                if let category = product.category {
                    Text("Top result in \(category)")
                        .thdFont(.bodySm)
                        .foregroundStyle(DS.TextOnContainerColorSecondary)
                }

                Text("\(Text(product.brandName).fontWeight(.semibold)) \(product.productDescription)")
                    .thdFont(.bodyMd)
                    .foregroundStyle(DS.TextOnContainerColorPrimary)
                    .lineLimit(2)

                if let price = product.formattedPrice {
                    Text(price)
                        .thdFont(.h6)
                        .foregroundStyle(DS.TextOnContainerColorPrimary)
                }
            }

            Spacer()

            Image(systemName: "chevron.right")
                .font(.system(size: 14, weight: .medium))
                .foregroundStyle(DS.TextOnContainerColorTertiary)
        }
        .padding(12)
        .background(DS.BackgroundContainerColorWhite)
        .clipShape(.rect(cornerRadius: DS.BorderRadiusLg))
        .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}

// MARK: - CatalogSearchSuggestionRow

struct CatalogSearchSuggestionRow: View {
    let suggestion: CatalogSearchSuggestion
    let searchText: String

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 12) {
                // Icon
                if suggestion.isProductMatch {
                    // Product thumbnail
                    if let product = suggestion.product {
                        AsyncImage(url: product.imageURL) { phase in
                            if case .success(let image) = phase {
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            } else {
                                Image(systemName: "cube.box")
                                    .foregroundStyle(DS.IconOnContainerColorInactive)
                            }
                        }
                        .frame(width: 32, height: 32)
                        .background(DS.BackgroundSurfaceColorGreige)
                        .clipShape(.rect(cornerRadius: 4))
                    }
                } else {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 14))
                        .foregroundStyle(DS.TextOnSurfaceColorTertiary)
                        .frame(width: 32)
                }

                VStack(alignment: .leading, spacing: 2) {
                    // Highlight matching text
                    highlightedText(suggestion.text, highlight: searchText)
                        .thdFont(.bodyMd)

                    // Category link (if available)
                    if let category = suggestion.category {
                        HStack(spacing: 4) {
                            Image(systemName: "arrow.turn.down.right")
                                .font(.system(size: 10))
                                .foregroundStyle(DS.TextOnSurfaceColorSecondary)

                            Text("in \(category)")
                                .thdFont(.bodySm)
                                .underline()
                                .foregroundStyle(DS.TextOnSurfaceColorSecondary)
                        }
                        .padding(.leading, 4)
                    }

                    // Price for product matches
                    if let product = suggestion.product, let price = product.formattedPrice {
                        Text(price)
                            .thdFont(.bodySm)
                            .foregroundStyle(DS.TextOnSurfaceColorPrimary)
                    }
                }

                Spacer()

                if suggestion.isProductMatch {
                    Image(systemName: "chevron.right")
                        .font(.system(size: 12))
                        .foregroundStyle(DS.TextOnSurfaceColorTertiary)
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
        }
    }

    @ViewBuilder
    private func highlightedText(_ text: String, highlight: String) -> some View {
        if let range = text.lowercased().range(of: highlight.lowercased()) {
            let before = String(text[..<range.lowerBound])
            let match = String(text[range])
            let after = String(text[range.upperBound...])

            Text("\(before)\(match)\(Text(after).fontWeight(.semibold))")
                .foregroundStyle(DS.TextOnSurfaceColorPrimary)
        } else {
            Text(text)
                .foregroundStyle(DS.TextOnSurfaceColorPrimary)
        }
    }
}

// MARK: - CatalogSearchProductRow

struct CatalogSearchProductRow: View {
    let product: CatalogSearchResult

    var body: some View {
        HStack(spacing: 12) {
            // Thumbnail
            AsyncImage(url: product.imageURL) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                case .failure:
                    Image(systemName: "photo")
                        .foregroundStyle(DS.IconOnContainerColorInactive)
                default:
                    ProgressView()
                }
            }
            .frame(width: 48, height: 48)
            .background(DS.BackgroundSurfaceColorGreige)
            .clipShape(.rect(cornerRadius: 6))

            VStack(alignment: .leading, spacing: 2) {
                Text(product.name)
                    .thdFont(.bodySm)
                    .foregroundStyle(DS.TextOnSurfaceColorPrimary)
                    .lineLimit(1)

                if let price = product.formattedPrice {
                    Text(price)
                        .thdFont(.bodySm)
                        .foregroundStyle(DS.TextOnSurfaceColorSecondary)
                }
            }

            Spacer()

            Image(systemName: "chevron.right")
                .font(.system(size: 12))
                .foregroundStyle(DS.TextOnSurfaceColorTertiary)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
    }
}

// MARK: - CatalogSearchActionBar

struct CatalogSearchActionBar: View {
    var body: some View {
        HStack(spacing: 12) {
            DSButton(
                "Barcode Scanner",
                style: .outlined,
                size: .medium,
                leadingIcon: Image(systemName: "barcode.viewfinder"),
                action: {}
            )

            DSButton(
                "Camera",
                style: .outlined,
                size: .medium,
                leadingIcon: Image(systemName: "camera"),
                action: {}
            )
        }
        .padding(.horizontal, 16)
    }
}

// MARK: - Preview

#Preview("Catalog Search") {
    CatalogSearchView()
}

#Preview("Catalog Search with Results") {
    CatalogSearchView()
}
