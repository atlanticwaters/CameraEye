import SwiftUI
import Combine

// MARK: - CatalogSearchResult

/// A search result from the Orange-Catalog.
struct CatalogSearchResult: Identifiable, Hashable {
    let id: String
    let name: String
    let brand: String?
    let category: String?
    let price: Double?
    let rating: Double?
    let imageUrl: String?
    let keywords: [String]

    /// The product for navigation
    var asProduct: OrangeCatalogProduct {
        OrangeCatalogProduct(
            productId: id,
            modelNumber: nil,
            brand: brand,
            title: name,
            subcategory: category,
            rating: rating.map { OrangeCatalogProduct.ProductRating(average: $0, count: nil) },
            images: imageUrl.map { OrangeCatalogProduct.ProductImages(primary: $0) },
            badges: nil,
            availability: OrangeCatalogProduct.ProductAvailability(inStock: true),
            price: price.map { OrangeCatalogProduct.ProductPrice(
                current: $0,
                original: nil,
                currency: "USD"
            ) }
        )
    }

    /// Image URL for display
    var imageURL: URL? {
        guard let urlString = imageUrl else { return nil }
        return URL(string: urlString)
    }

    /// Formatted price string
    var formattedPrice: String? {
        guard let price else { return nil }
        return price.formatted(.currency(code: "USD"))
    }

    /// Extract brand name for display
    var brandName: String {
        brand ?? name.components(separatedBy: " ").first ?? ""
    }

    /// Product description (name without brand)
    var productDescription: String {
        if let brand, name.hasPrefix(brand) {
            return String(name.dropFirst(brand.count)).trimmingCharacters(in: .whitespaces)
        }
        let words = name.components(separatedBy: " ")
        if words.count > 1 {
            return words.dropFirst().joined(separator: " ")
        }
        return name
    }
}

// MARK: - CatalogSearchSuggestion

/// A search suggestion with optional product match.
struct CatalogSearchSuggestion: Identifiable {
    let id = UUID()
    let text: String
    let category: String?
    let isProductMatch: Bool
    let product: CatalogSearchResult?

    init(text: String, category: String? = nil) {
        self.text = text
        self.category = category
        self.isProductMatch = false
        self.product = nil
    }

    init(product: CatalogSearchResult) {
        self.text = product.name
        self.category = product.category
        self.isProductMatch = true
        self.product = product
    }
}

// MARK: - CatalogSearchViewModel

/// View model for searching the Orange-Catalog with typeahead functionality.
@MainActor
@Observable
final class CatalogSearchViewModel {
    // MARK: - Published State

    var searchText: String = "" {
        didSet {
            searchTextSubject.send(searchText)
        }
    }
    var searchResults: [CatalogSearchResult] = []
    var recentlyViewed: [CatalogSearchResult] = []
    var recentSearches: [String] = []
    var isSearchFocused: Bool = false
    var isLoading: Bool = false
    var errorMessage: String?

    // MARK: - Private

    private var searchIndex: [OrangeCatalogSearchIndex.SearchProduct] = []
    private var searchTextSubject = PassthroughSubject<String, Never>()
    private var cancellables = Set<AnyCancellable>()
    private var isIndexLoaded = false

    // MARK: - Computed Properties

    /// Filtered results based on current search text.
    var filteredResults: [CatalogSearchResult] {
        guard !searchText.isEmpty else { return [] }
        return searchResults
    }

    /// Top matched product for display.
    var matchedProduct: CatalogSearchResult? {
        filteredResults.first
    }

    /// Search suggestions based on current query.
    var searchSuggestions: [CatalogSearchSuggestion] {
        guard !searchText.isEmpty else { return [] }

        var suggestions: [CatalogSearchSuggestion] = []

        // Add the search term itself with category if matched
        if let firstMatch = filteredResults.first {
            suggestions.append(CatalogSearchSuggestion(text: searchText, category: firstMatch.category))
        } else {
            suggestions.append(CatalogSearchSuggestion(text: searchText))
        }

        // Add top product matches as suggestions
        for result in filteredResults.prefix(5) {
            suggestions.append(CatalogSearchSuggestion(product: result))
        }

        // Add related search suggestions
        let relatedTerms = generateRelatedSearches(for: searchText)
        suggestions.append(contentsOf: relatedTerms.map { CatalogSearchSuggestion(text: $0) })

        return suggestions
    }

    // MARK: - Initialization

    init() {
        setupDebounce()
    }

    // MARK: - Setup

    private func setupDebounce() {
        // Debounce search input by 300ms for typeahead
        searchTextSubject
            .debounce(for: .milliseconds(300), scheduler: DispatchQueue.main)
            .sink { [weak self] query in
                Task { @MainActor in
                    await self?.performSearch(query: query)
                }
            }
            .store(in: &cancellables)
    }

    // MARK: - Public Methods

    /// Load the search index from the catalog.
    func loadSearchIndex() async {
        guard !isIndexLoaded else { return }

        isLoading = true
        errorMessage = nil

        do {
            let index = try await CatalogService.shared.fetchSearchIndex()
            searchIndex = index.products
            isIndexLoaded = true
        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }

    /// Perform a search with the given query.
    func performSearch(query: String) async {
        guard !query.isEmpty else {
            searchResults = []
            return
        }

        // Ensure index is loaded
        if !isIndexLoaded {
            await loadSearchIndex()
        }

        // Filter the search index
        let lowercasedQuery = query.lowercased()

        searchResults = searchIndex
            .filter { product in
                // Search in name
                if product.name.localizedStandardContains(query) {
                    return true
                }
                // Search in brand
                if let brand = product.brand, brand.localizedStandardContains(query) {
                    return true
                }
                // Search in category
                if let category = product.category, category.localizedStandardContains(query) {
                    return true
                }
                // Search in keywords
                if let keywords = product.keywords {
                    return keywords.contains { $0.lowercased().contains(lowercasedQuery) }
                }
                return false
            }
            .prefix(50) // Limit results
            .map { product in
                CatalogSearchResult(
                    id: product.id,
                    name: product.name,
                    brand: product.brand,
                    category: product.category,
                    price: product.price,
                    rating: product.rating,
                    imageUrl: product.imageUrl,
                    keywords: product.keywords ?? []
                )
            }
    }

    /// Add a search query to recent searches.
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

    /// Remove a search query from recent searches.
    func removeRecentSearch(_ query: String) {
        recentSearches.removeAll { $0 == query }
    }

    /// Clear all recent searches.
    func clearAllRecentSearches() {
        recentSearches.removeAll()
    }

    /// Add a product to recently viewed.
    func addRecentlyViewedProduct(_ product: CatalogSearchResult) {
        // Remove if already exists
        recentlyViewed.removeAll { $0.id == product.id }

        // Add to front
        recentlyViewed.insert(product, at: 0)

        // Keep only the most recent 10 items
        if recentlyViewed.count > 10 {
            recentlyViewed = Array(recentlyViewed.prefix(10))
        }
    }

    /// Select a search suggestion.
    func selectSearchSuggestion(_ suggestion: CatalogSearchSuggestion) {
        addRecentSearch(suggestion.text)
        if let product = suggestion.product {
            addRecentlyViewedProduct(product)
        } else if let product = matchedProduct {
            addRecentlyViewedProduct(product)
        }
    }

    /// Clear the search text.
    func clearSearch() {
        searchText = ""
        searchResults = []
    }

    // MARK: - Private Methods

    private func generateRelatedSearches(for query: String) -> [String] {
        // Generate related search terms based on the query and common patterns
        let commonSuffixes = ["kit", "set", "accessories", "parts", "replacement"]

        // Only add a couple related searches to avoid clutter
        return commonSuffixes.prefix(2).map { "\(query) \($0)" }
    }
}
