import SwiftUI
import Combine

// MARK: - Data Models

struct SearchProduct: Codable, Identifiable {
    let id: Int
    let name: String
    let category: String
    let thumbnail: String
    let price: Double

    var formattedPrice: String {
        return String(format: "$%.2f", price)
    }

    // Extract brand name (first word) for bold styling
    var brandName: String {
        return name.components(separatedBy: " ").first ?? ""
    }

    var productDescription: String {
        let words = name.components(separatedBy: " ")
        if words.count > 1 {
            return words.dropFirst().joined(separator: " ")
        }
        return ""
    }

    // Get the image name without extension for asset catalog
    var imageName: String {
        // Remove file extension for asset catalog lookup
        return thumbnail
            .replacingOccurrences(of: ".jpg", with: "")
            .replacingOccurrences(of: ".jpeg", with: "")
            .replacingOccurrences(of: ".png", with: "")
    }
}

struct SearchProductsData: Codable {
    let products: [SearchProduct]
}

// MARK: - Search Suggestion Model

struct SearchSuggestion: Identifiable {
    let id = UUID()
    let text: String
    let category: String?
    let isProductMatch: Bool
    let product: SearchProduct?

    init(text: String, category: String? = nil) {
        self.text = text
        self.category = category
        self.isProductMatch = false
        self.product = nil
    }

    init(product: SearchProduct) {
        self.text = product.name
        self.category = product.category
        self.isProductMatch = true
        self.product = product
    }
}

// MARK: - Product Image View

struct ProductImageView: View {
    let product: SearchProduct
    let size: CGFloat

    var body: some View {
        // Try to load from asset catalog first, then fall back to bundle
        Group {
            if let uiImage = loadImage() {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                // Fallback placeholder
                Image(systemName: "photo")
                    .font(.system(size: size * 0.4))
                    .foregroundColor(.gray.opacity(0.5))
            }
        }
        .frame(width: size, height: size)
        .background(Color(.systemBackground))
        .cornerRadius(8)
    }

    private func loadImage() -> UIImage? {
        // Option 1: Try asset catalog (images added without extension)
        if let image = UIImage(named: product.imageName) {
            return image
        }

        // Option 2: Try asset catalog with full filename
        if let image = UIImage(named: product.thumbnail) {
            return image
        }

        // Option 3: Try loading from bundle with extension
        if let path = Bundle.main.path(forResource: product.imageName, ofType: "jpg") {
            return UIImage(contentsOfFile: path)
        }
        if let path = Bundle.main.path(forResource: product.imageName, ofType: "jpeg") {
            return UIImage(contentsOfFile: path)
        }
        if let path = Bundle.main.path(forResource: product.imageName, ofType: "png") {
            return UIImage(contentsOfFile: path)
        }

        return nil
    }
}

// MARK: - View Model

class SearchViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var products: [SearchProduct] = []
    @Published var recentlyViewed: [SearchProduct] = []
    @Published var recentSearches: [String] = []
    @Published var isSearchFocused: Bool = false

    init() {
        loadProducts()
        // Start with empty state - no recently viewed or recent searches
    }

    func loadProducts() {
        // Try loading from bundle first (for production)
        if let url = Bundle.main.url(forResource: "products", withExtension: "json"),
           let data = try? Data(contentsOf: url),
           let decoded = try? JSONDecoder().decode(SearchProductsData.self, from: data) {
            products = decoded.products
            return
        }

        // Fallback: load from file path (for development/preview)
        let fileURL = URL(fileURLWithPath: "/Users/awaters/Desktop/Search Demo/products.json")
        if let data = try? Data(contentsOf: fileURL),
           let decoded = try? JSONDecoder().decode(SearchProductsData.self, from: data) {
            products = decoded.products
        }
    }

    var filteredProducts: [SearchProduct] {
        guard !searchText.isEmpty else { return [] }
        return products.filter {
            $0.name.localizedCaseInsensitiveContains(searchText) ||
            $0.category.localizedCaseInsensitiveContains(searchText)
        }
    }

    var searchSuggestions: [SearchSuggestion] {
        guard !searchText.isEmpty else { return [] }

        var suggestions: [SearchSuggestion] = []

        // Add exact match suggestion with category
        if let firstMatch = filteredProducts.first {
            suggestions.append(SearchSuggestion(text: searchText, category: firstMatch.category))
        } else {
            suggestions.append(SearchSuggestion(text: searchText))
        }

        // Add related search suggestions based on product names
        let relatedTerms = generateRelatedSearches(for: searchText)
        suggestions.append(contentsOf: relatedTerms.map { SearchSuggestion(text: $0) })

        return suggestions
    }

    var matchedProduct: SearchProduct? {
        // Return a product if there's a strong match
        return filteredProducts.first
    }

    private func generateRelatedSearches(for query: String) -> [String] {
        // Generate related search terms based on query
        let suffixes = ["drill", "drill rental", "drill bit", "stapler", "handle"]
        return suffixes.prefix(5).map { "\(query) \($0)" }
    }

    func addRecentSearch(_ query: String) {
        let trimmedQuery = query.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedQuery.isEmpty else { return }
        
        // Remove if already exists
        recentSearches.removeAll { $0.lowercased() == trimmedQuery.lowercased() }
        
        // Add to front
        recentSearches.insert(trimmedQuery, at: 0)
        
        // Keep only the most recent 10 searches
        if recentSearches.count > 10 {
            recentSearches = Array(recentSearches.prefix(10))
        }
    }
    
    func removeRecentSearch(_ query: String) {
        recentSearches.removeAll { $0 == query }
    }
    
    func clearAllRecentSearches() {
        recentSearches.removeAll()
    }
    
    func addRecentlyViewedProduct(_ product: SearchProduct) {
        // Remove if already exists
        recentlyViewed.removeAll { $0.id == product.id }
        
        // Add to front
        recentlyViewed.insert(product, at: 0)
        
        // Keep only the most recent 10 items
        if recentlyViewed.count > 10 {
            recentlyViewed = Array(recentlyViewed.prefix(10))
        }
    }
    
    func selectSearchSuggestion(_ suggestion: SearchSuggestion) {
        addRecentSearch(suggestion.text)
        if let product = suggestion.product {
            addRecentlyViewedProduct(product)
        } else if let product = matchedProduct {
            addRecentlyViewedProduct(product)
        }
    }

    func clearSearch() {
        searchText = ""
    }
}

// MARK: - Main Search View

struct SearchDemoView: View {
    @StateObject private var viewModel = SearchViewModel()
    @FocusState private var isSearchFieldFocused: Bool

    var body: some View {
        VStack(spacing: 0) {
            // Search Bar
            SearchBarView(
                searchText: $viewModel.searchText,
                isSearchFieldFocused: $isSearchFieldFocused,
                onClear: { viewModel.clearSearch() },
                onBack: {
                    viewModel.clearSearch()
                    isSearchFieldFocused = false
                }
            )
            .padding(.horizontal, 16)
            .padding(.top, 8)

            if viewModel.searchText.isEmpty {
                // Empty State - Recently Viewed and Recent Searches
                ScrollView {
                    VStack(alignment: .leading, spacing: 0) {
                        // Recently Viewed Section
                        if !viewModel.recentlyViewed.isEmpty {
                            RecentlyViewedSection(
                                products: viewModel.recentlyViewed,
                                showCompactMode: viewModel.recentSearches.count > 5
                            )
                            .padding(.bottom, 24)
                        }
                        
                        // Recent Searches Section
                        if !viewModel.recentSearches.isEmpty {
                            RecentSearchesSection(
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
                    }
                }
                Spacer()
            } else {
                // Search Results
                SearchResultsView(viewModel: viewModel)
            }

            Spacer()

            // Bottom Action Bar
            BottomActionBar()
                .padding(.bottom, 8)
        }
        .background(Color(.systemGroupedBackground))
        .onChange(of: isSearchFieldFocused) { oldValue, newValue in
            viewModel.isSearchFocused = newValue
        }
    }
}

// MARK: - Search Bar

struct SearchBarView: View {
    @Binding var searchText: String
    @FocusState.Binding var isSearchFieldFocused: Bool
    let onClear: () -> Void
    let onBack: () -> Void

    var body: some View {
        HStack(spacing: 12) {
            // Back Button
            Button(action: onBack) {
                Image(systemName: "chevron.left")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.primary)
                    .frame(width: 40, height: 40)
                    .background(Color(.systemBackground))
                    .clipShape(Circle())
                    .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
            }

            // Search Field
            HStack(spacing: 8) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .font(.system(size: 16))

                TextField("", text: $searchText)
                    .focused($isSearchFieldFocused)
                    .font(.system(size: 16))

                if !searchText.isEmpty {
                    Button(action: onClear) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                            .font(.system(size: 18))
                    }
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            .background(Color(.systemBackground))
            .cornerRadius(24)
            .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
        }
    }
}

// MARK: - Recently Viewed Section

struct RecentlyViewedSection: View {
    let products: [SearchProduct]
    let showCompactMode: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Recently Viewed")
                .font(.thdH5)
                .foregroundColor(.primary)
                .padding(.horizontal, 16)
                .padding(.top, 20)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(products) { product in
                        RecentlyViewedCard(product: product, showCompactMode: showCompactMode)
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }
}

struct RecentlyViewedCard: View {
    let product: SearchProduct
    let showCompactMode: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Thumbnail
            ProductImageView(product: product, size: 100)
                .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)

            if !showCompactMode {
                // Product Name with bold brand
                Text("\(Text(product.brandName).fontWeight(.semibold)) \(product.productDescription)")
                    .font(.thdBodySm)
                    .foregroundColor(.primary)
                    .lineLimit(2)
                    .frame(width: 100, alignment: .leading)

                // Price
                Text(product.formattedPrice)
                    .font(.thdH6)
                    .foregroundColor(.primary)
            }
        }
    }
}

// MARK: - Recent Searches Section

struct RecentSearchesSection: View {
    let searches: [String]
    let onRemove: (String) -> Void
    let onClearAll: () -> Void
    let onSelect: (String) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Header with Clear All button
            HStack {
                Text("Recent Searches")
                    .font(.thdH5)
                    .foregroundColor(.primary)
                
                Spacer()
                
                Button(action: onClearAll) {
                    Text("Clear All")
                        .font(.thdBodySm)
                        .foregroundColor(.secondary)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 6)
                        .background(Color(.systemBackground))
                        .cornerRadius(16)
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 20)
            .padding(.bottom, 12)
            
            // Search items
            VStack(alignment: .leading, spacing: 0) {
                ForEach(searches, id: \.self) { search in
                    RecentSearchRow(
                        searchText: search,
                        onRemove: { onRemove(search) },
                        onSelect: { onSelect(search) }
                    )
                }
            }
        }
    }
}

struct RecentSearchRow: View {
    let searchText: String
    let onRemove: () -> Void
    let onSelect: () -> Void
    
    var body: some View {
        Button(action: onSelect) {
            HStack(spacing: 12) {
                Image(systemName: "clock")
                    .font(.system(size: 16))
                    .foregroundColor(.secondary)
                    .frame(width: 24)
                
                Text(searchText)
                    .font(.thdBodyMd)
                    .foregroundColor(.primary)
                
                Spacer()
                
                Button(action: onRemove) {
                    Image(systemName: "xmark")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.secondary)
                        .frame(width: 24, height: 24)
                }
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .contentShape(Rectangle())
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// MARK: - Search Results View

struct SearchResultsView: View {
    @ObservedObject var viewModel: SearchViewModel

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                // Matched Product Card (if exists)
                if let product = viewModel.matchedProduct {
                    Button(action: {
                        viewModel.addRecentlyViewedProduct(product)
                        viewModel.addRecentSearch(viewModel.searchText)
                    }) {
                        MatchedProductCard(product: product)
                            .padding(.horizontal, 16)
                            .padding(.top, 16)
                    }
                    .buttonStyle(PlainButtonStyle())
                }

                // Search Suggestions
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(viewModel.searchSuggestions) { suggestion in
                        Button(action: {
                            viewModel.selectSearchSuggestion(suggestion)
                        }) {
                            SearchSuggestionRow(suggestion: suggestion, searchText: viewModel.searchText)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.top, 8)
            }
        }
    }
}

// MARK: - Matched Product Card

struct MatchedProductCard: View {
    let product: SearchProduct

    var body: some View {
        HStack(spacing: 12) {
            // Thumbnail
            ProductImageView(product: product, size: 56)

            VStack(alignment: .leading, spacing: 4) {
                Text("Purchased September 24, 2025")
                    .font(.thdBodySm)
                    .foregroundColor(.secondary)

                Text("\(Text(product.brandName).fontWeight(.semibold)) \(product.productDescription)")
                    .font(.thdBodyMd)
                    .foregroundColor(.primary)
            }
            .foregroundColor(.primary)

            Spacer()
        }
        .padding(12)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}

// MARK: - Search Suggestion Row

struct SearchSuggestionRow: View {
    let suggestion: SearchSuggestion
    let searchText: String

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(spacing: 12) {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
                    .frame(width: 24)

                VStack(alignment: .leading, spacing: 2) {
                    // Highlight matching text
                    highlightedText(suggestion.text, highlight: searchText)
                        .font(.thdBodyMd)

                    // Category link (if available and first suggestion)
                    if let category = suggestion.category, suggestion.text.lowercased() == searchText.lowercased() {
                        HStack(spacing: 4) {
                            Image(systemName: "arrow.turn.down.right")
                                .font(.system(size: 10))
                                .foregroundColor(.secondary)

                            Text("in \(category)")
                                .font(.thdBodySm)
                                .underline()
                                .foregroundColor(.secondary)
                        }
                        .padding(.leading, 4)
                    }
                }

                Spacer()
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
                .font(.body)
                .foregroundColor(.primary)
        } else {
            Text(text)
                .foregroundColor(.primary)
        }
    }
}

// MARK: - Bottom Action Bar

struct BottomActionBar: View {
    var body: some View {
        HStack(spacing: 12) {
            ActionButton(icon: "barcode.viewfinder", title: "Barcode Scanner")
            ActionButton(icon: "camera", title: "Camera")
        }
        .padding(.horizontal, 16)
    }
}

struct ActionButton: View {
    let icon: String
    let title: String

    var body: some View {
        Button(action: {}) {
            HStack(spacing: 8) {
                Image(systemName: icon)
                    .font(.system(size: 14))
                Text(title)
                    .font(.thdBodySm)
                    .fontWeight(.medium)
            }
            .foregroundColor(.primary)
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .background(Color(.systemBackground))
            .cornerRadius(24)
            .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
        }
    }
}

// MARK: - Preview

struct SearchDemoView_Previews: PreviewProvider {
    static var previews: some View {
        SearchDemoView()
    }
}
