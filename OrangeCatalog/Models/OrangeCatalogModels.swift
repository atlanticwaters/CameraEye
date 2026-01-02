import Foundation

// MARK: - App Configuration

/// Configuration for the Orange-Catalog API.
struct OrangeCatalogConfig: Codable, Sendable {
    let version: String
    let baseUrl: String
    let lastUpdated: String
    let endpoints: CatalogEndpoints
    let features: FeatureFlags
    let caching: CachingConfig

    enum CodingKeys: String, CodingKey {
        case version
        case baseUrl = "base_url"
        case lastUpdated = "last_updated"
        case endpoints, features, caching
    }

    struct CatalogEndpoints: Codable, Sendable {
        let appConfig: String
        let categories: String
        let products: String
        let productDetails: String
        let searchIndex: String

        enum CodingKeys: String, CodingKey {
            case appConfig = "app_config"
            case categories
            case products
            case productDetails = "product_details"
            case searchIndex = "search_index"
        }
    }

    struct FeatureFlags: Codable, Sendable {
        let searchEnabled: Bool
        let favoritesEnabled: Bool
        let offlineMode: Bool

        enum CodingKeys: String, CodingKey {
            case searchEnabled = "search_enabled"
            case favoritesEnabled = "favorites_enabled"
            case offlineMode = "offline_mode"
        }
    }

    struct CachingConfig: Codable, Sendable {
        let strategy: String
        let ttl: TTLConfig

        struct TTLConfig: Codable, Sendable {
            let appConfig: Int
            let categories: Int
            let products: Int
            let productDetails: Int
            let images: Int

            enum CodingKeys: String, CodingKey {
                case appConfig = "app_config"
                case categories
                case products
                case productDetails = "product_details"
                case images
            }
        }
    }
}

// MARK: - Category

/// A product category in the Orange-Catalog.
/// Supports both new format (with products array) and legacy format (with productIds).
struct OrangeCatalogCategory: Codable, Identifiable, Sendable, Hashable {
    let categoryId: String
    let name: String
    let slug: String?
    let path: String?
    let version: String?
    let lastUpdated: String?
    let pageInfo: PageInfo?
    let featuredBrands: [FeaturedBrand]?
    let products: [OrangeCatalogProduct]?
    // Legacy format fields
    let productIds: [String]?
    let totalProducts: Int?

    var id: String { categoryId }

    /// Product count from pageInfo, products array, totalProducts, or productIds
    var productCount: Int {
        pageInfo?.totalResults ?? products?.count ?? totalProducts ?? productIds?.count ?? 0
    }

    /// Whether this category has full product data (vs just IDs)
    var hasProductData: Bool {
        products != nil && !(products?.isEmpty ?? true)
    }

    enum CodingKeys: String, CodingKey {
        case categoryId
        case name, slug, path, version
        case lastUpdated
        case pageInfo, featuredBrands, products
        case productIds, totalProducts
    }

    struct PageInfo: Codable, Sendable, Hashable {
        let totalResults: Int
    }

    struct FeaturedBrand: Codable, Sendable, Hashable {
        let brandId: String
        let brandName: String
        let logoUrl: String?
        let count: Int
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(categoryId)
    }

    static func == (lhs: OrangeCatalogCategory, rhs: OrangeCatalogCategory) -> Bool {
        lhs.categoryId == rhs.categoryId
    }
}

// MARK: - Product (List Item)

/// A product in the catalog listing.
struct OrangeCatalogProduct: Codable, Identifiable, Sendable, Hashable {
    let productId: String
    let modelNumber: String?
    let brand: String?
    let title: String
    let subcategory: String?
    let rating: ProductRating?
    let images: ProductImages?
    let badges: [String]?
    let availability: ProductAvailability?
    let price: ProductPrice?

    var id: String { productId }

    /// The display name for the product
    var name: String { title }

    /// Primary image URL
    var imageUrl: String? {
        images?.primary
    }

    /// Computed URL for the image
    var imageURL: URL? {
        guard let urlString = imageUrl else { return nil }
        return URL(string: urlString)
    }

    /// Current price value
    var currentPrice: Double? {
        price?.current
    }

    /// Original price for sale items
    var originalPrice: Double? {
        price?.original
    }

    /// Rating average
    var ratingAverage: Double? {
        rating?.average
    }

    /// Review count
    var reviewCount: Int {
        rating?.count ?? 0
    }

    /// Whether the product is in stock
    var inStock: Bool {
        availability?.inStock ?? true
    }

    /// Savings percentage if on sale
    var savingsPercentage: Int? {
        guard let original = originalPrice, let current = currentPrice, original > current else {
            return nil
        }
        return Int(((original - current) / original) * 100)
    }

    enum CodingKeys: String, CodingKey {
        case productId, modelNumber, brand, title, subcategory
        case rating, images, badges, availability, price
    }

    struct ProductRating: Codable, Sendable, Hashable {
        let average: Double?
        let count: Int?
    }

    struct ProductImages: Codable, Sendable, Hashable {
        let primary: String?
    }

    struct ProductAvailability: Codable, Sendable, Hashable {
        let inStock: Bool?
    }

    struct ProductPrice: Codable, Sendable, Hashable {
        let current: Double?
        let original: Double?
        let currency: String?
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(productId)
    }

    static func == (lhs: OrangeCatalogProduct, rhs: OrangeCatalogProduct) -> Bool {
        lhs.productId == rhs.productId
    }
}

// MARK: - Product Detail

/// Detailed product information including specifications and features.
struct OrangeCatalogProductDetail: Codable, Identifiable, Sendable {
    let productId: String
    let title: String
    let brand: BrandInfo?
    let description: String?
    let pricing: PricingInfo?
    let rating: RatingInfo?
    let media: MediaInfo?
    let specifications: [String: String]?
    let features: [String]?
    let availability: AvailabilityInfo?

    var id: String { productId }

    /// Display name
    var name: String { title }

    /// Brand name
    var brandName: String {
        brand?.name ?? "Unknown"
    }

    /// Current price
    var currentPrice: Double? {
        pricing?.currentPrice
    }

    /// Original price
    var originalPrice: Double? {
        pricing?.originalPrice
    }

    /// Rating average
    var ratingAverage: Double {
        rating?.average ?? 0
    }

    /// Review count
    var reviewCount: Int {
        rating?.count ?? 0
    }

    /// Whether the product is in stock
    var inStock: Bool {
        availability?.inStock ?? true
    }

    /// Primary image URL
    var primaryImageURL: URL? {
        guard let primary = media?.images?.first else { return nil }
        return URL(string: primary.url)
    }

    /// All image URLs
    var imageURLs: [URL] {
        media?.images?.compactMap { URL(string: $0.url) } ?? []
    }

    /// Specifications as array of tuples for display
    var specificationsList: [(name: String, value: String)] {
        specifications?.map { ($0.key, $0.value) }.sorted { $0.name < $1.name } ?? []
    }

    struct BrandInfo: Codable, Sendable {
        let name: String
        let logoUrl: String?

        enum CodingKeys: String, CodingKey {
            case name
            case logoUrl = "logo_url"
        }
    }

    struct PricingInfo: Codable, Sendable {
        let currentPrice: Double?
        let originalPrice: Double?
        let currency: String?

        enum CodingKeys: String, CodingKey {
            case currentPrice = "current_price"
            case originalPrice = "original_price"
            case currency
        }
    }

    struct RatingInfo: Codable, Sendable {
        let average: Double?
        let count: Int?
    }

    struct MediaInfo: Codable, Sendable {
        let images: [ImageInfo]?
        let videos: [VideoInfo]?

        struct ImageInfo: Codable, Sendable {
            let url: String
            let alt: String?
            let isPrimary: Bool?

            enum CodingKeys: String, CodingKey {
                case url, alt
                case isPrimary = "is_primary"
            }
        }

        struct VideoInfo: Codable, Sendable {
            let url: String
            let thumbnail: String?
        }
    }

    struct AvailabilityInfo: Codable, Sendable {
        let inStock: Bool?
        let quantity: Int?

        enum CodingKeys: String, CodingKey {
            case inStock = "in_stock"
            case quantity
        }
    }
}

// MARK: - Search Index

/// Compact search index for mobile search.
struct OrangeCatalogSearchIndex: Codable, Sendable {
    let products: [SearchProduct]
    let lastUpdated: String?

    enum CodingKeys: String, CodingKey {
        case products
        case lastUpdated = "last_updated"
    }

    struct SearchProduct: Codable, Identifiable, Sendable {
        let id: String
        let name: String
        let brand: String?
        let category: String?
        let price: Double?
        let rating: Double?
        let keywords: [String]?
        let imageUrl: String?

        enum CodingKeys: String, CodingKey {
            case id, name, brand, category, price, rating, keywords
            case imageUrl = "image_url"
        }
    }
}

// MARK: - Featured Content

/// Featured content for the home screen.
struct OrangeCatalogFeaturedContent: Codable, Sendable {
    let sections: [ContentSection]?

    struct ContentSection: Codable, Sendable {
        let id: String
        let title: String
        let type: String?
        let displayType: String?
        let itemCount: Int?

        enum CodingKeys: String, CodingKey {
            case id, title, type
            case displayType = "display_type"
            case itemCount = "item_count"
        }
    }
}

// MARK: - Categories Index

/// Response from the categories index endpoint.
struct CategoriesIndexResponse: Codable, Sendable {
    let categories: [CategorySummary]
    let lastUpdated: String?
    let version: String?
    let totalCategories: Int?
    let totalProducts: Int?

    struct CategorySummary: Codable, Identifiable, Sendable, Hashable {
        let id: String
        let name: String
        let slug: String
        let productCount: Int
        let path: String?
        let imageUrl: String?
        let subcategories: [CategorySummary]?
    }
}
