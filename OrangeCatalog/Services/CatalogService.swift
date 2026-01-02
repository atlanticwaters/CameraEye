import Foundation

// MARK: - Shared URLSession with Caching

/// Configured URLSession for catalog API requests with caching.
private let catalogURLSession: URLSession = {
    let config = URLSessionConfiguration.default
    config.urlCache = URLCache(
        memoryCapacity: 50 * 1024 * 1024,  // 50 MB memory
        diskCapacity: 200 * 1024 * 1024,   // 200 MB disk
        diskPath: "OrangeCatalogCache"
    )
    config.requestCachePolicy = .returnCacheDataElseLoad
    config.timeoutIntervalForRequest = 30
    return URLSession(configuration: config)
}()

/// Async/await networking service for the Orange-Catalog API.
/// Uses URLSession with configured caching (50MB memory, 200MB disk).
actor CatalogService {
    // MARK: - Singleton

    static let shared = CatalogService()

    // MARK: - Configuration

    private let baseURL = "https://raw.githubusercontent.com/atlanticwaters/Orange-Catalog/main/production%20data"

    // MARK: - Cached Data

    private var cachedConfig: OrangeCatalogConfig?
    private var cachedCategorySummaries: [CategoriesIndexResponse.CategorySummary]?

    // MARK: - Initialization

    private init() {}

    // MARK: - API Methods

    /// Fetch app configuration.
    func fetchConfig() async throws -> OrangeCatalogConfig {
        if let cached = cachedConfig {
            return cached
        }

        let url = try buildURL(path: "app-config.json")
        let config: OrangeCatalogConfig = try await fetch(url: url)
        cachedConfig = config
        return config
    }

    /// Fetch all category summaries from the index.
    func fetchCategorySummaries() async throws -> [CategoriesIndexResponse.CategorySummary] {
        if let cached = cachedCategorySummaries {
            return cached
        }

        let url = try buildURL(path: "categories/index.json")
        let response: CategoriesIndexResponse = try await fetch(url: url)
        cachedCategorySummaries = response.categories
        return response.categories
    }

    /// Fetch a full category with its products using the new _all.json endpoint.
    /// - Parameter slug: The category slug (e.g., "tools", "appliances", "appliances/refrigerators")
    func fetchCategory(slug: String) async throws -> OrangeCatalogCategory {
        let url = try buildURL(path: "categories/\(slug)/_all.json")
        return try await fetch(url: url)
    }

    /// Fetch a category ignoring cache, forcing a fresh network request using the new _all.json endpoint.
    /// - Parameter slug: The category slug (e.g., "tools", "appliances", "appliances/refrigerators")
    func fetchCategoryFresh(slug: String) async throws -> OrangeCatalogCategory {
        let url = try buildURL(path: "categories/\(slug)/_all.json")
        var request = URLRequest(url: url)
        request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse else {
            throw CatalogError.networkError(URLError(.badServerResponse))
        }

        guard (200...299).contains(httpResponse.statusCode) else {
            if httpResponse.statusCode == 404 {
                throw CatalogError.notFound
            }
            throw CatalogError.serverError(statusCode: httpResponse.statusCode)
        }

        return try decode(OrangeCatalogCategory.self, from: data)
    }

    /// Fetch products for a specific category.
    /// - Parameter categorySlug: The category slug
    func fetchProducts(categorySlug: String) async throws -> [OrangeCatalogProduct] {
        let category = try await fetchCategory(slug: categorySlug)
        return category.products ?? []
    }

    /// Fetch detailed product information.
    /// - Parameter id: The product ID
    func fetchProductDetail(id: String) async throws -> OrangeCatalogProductDetail {
        let url = try buildURL(path: "products/\(id)/details.json")
        return try await fetch(url: url)
    }

    /// Fetch the compact search index for mobile search.
    func fetchSearchIndex() async throws -> OrangeCatalogSearchIndex {
        let url = try buildURL(path: "search-index-compact.json")
        return try await fetch(url: url)
    }

    /// Fetch featured content for the home screen.
    func fetchFeaturedContent() async throws -> OrangeCatalogFeaturedContent {
        let url = try buildURL(path: "featured-content.json")
        return try await fetch(url: url)
    }

    /// Clear all cached data.
    func clearCache() {
        cachedConfig = nil
        cachedCategorySummaries = nil
        catalogURLSession.configuration.urlCache?.removeAllCachedResponses()
    }

    /// Refresh categories by clearing cache and fetching fresh data.
    func refreshCategories() async throws -> [CategoriesIndexResponse.CategorySummary] {
        cachedCategorySummaries = nil
        return try await fetchCategorySummaries()
    }

    // MARK: - Private Helpers

    private func buildURL(path: String) throws -> URL {
        let urlString = "\(baseURL)/\(path)"
        guard let url = URL(string: urlString) else {
            throw CatalogError.invalidURL
        }
        return url
    }

    private func fetchData(from url: URL) async throws -> Data {
        do {
            let (data, response) = try await catalogURLSession.data(from: url)

            guard let httpResponse = response as? HTTPURLResponse else {
                throw CatalogError.networkError(URLError(.badServerResponse))
            }

            switch httpResponse.statusCode {
            case 200...299:
                break
            case 404:
                throw CatalogError.notFound
            default:
                throw CatalogError.serverError(statusCode: httpResponse.statusCode)
            }

            guard !data.isEmpty else {
                throw CatalogError.noData
            }

            return data
        } catch let error as CatalogError {
            throw error
        } catch {
            throw CatalogError.networkError(error)
        }
    }

    private func decode<T: Decodable>(_ type: T.Type, from data: Data) throws -> T {
        do {
            return try JSONDecoder().decode(type, from: data)
        } catch {
            throw CatalogError.decodingError(error)
        }
    }

    private func fetch<T: Decodable>(url: URL) async throws -> T {
        let data = try await fetchData(from: url)
        return try decode(T.self, from: data)
    }
}
