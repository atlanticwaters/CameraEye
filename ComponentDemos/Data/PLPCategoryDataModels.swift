//
// PLPCategoryDataModels.swift
// Models for loading category-specific JSON files (like french-door-refrigerators.json)
//

import SwiftUI

// MARK: - =============================================
// MARK: - CATEGORY PAGE DATA MODELS
// MARK: - =============================================

/// Root container for category page data (e.g., french-door-refrigerators.json)
struct CategoryPageData: Codable {
    let pageInfo: PageInfo
    let featuredBrands: [FeaturedBrand]
    let quickFilters: [QuickFilter]
    let filters: [FilterGroup]
    let sortOptions: [SortOptionData]
    let products: [CategoryProduct]
    let pagination: Pagination
    let refrigeratorStyles: [RefrigeratorStyle]
    let parentCategory: ParentCategory
    
    struct PageInfo: Codable {
        let categoryId: String
        let categoryName: String
        let categorySlug: String
        let breadcrumbs: [Breadcrumb]
        let totalResults: Int
        let heroImage: HeroImage?
        let seoDescription: String?
        
        struct Breadcrumb: Codable {
            let label: String
            let url: String
        }
        
        struct HeroImage: Codable {
            let url: String
            let alt: String
            let promoText: String?
        }
    }
    
    struct FeaturedBrand: Codable {
        let brandId: String
        let brandName: String
        let logoUrl: String
        let filterUrl: String
    }
    
    struct QuickFilter: Codable {
        let filterId: String
        let label: String
        let imageUrl: String
        let filterUrl: String
    }
    
    struct FilterGroup: Codable {
        let filterGroupId: String
        let filterGroupName: String
        let filterType: String
        let options: [FilterOption]
        
        struct FilterOption: Codable {
            let optionId: String
            let label: String
            let value: String
            let count: Int
            let filterUrl: String?
        }
    }
    
    struct SortOptionData: Codable {
        let sortId: String
        let label: String
        let isDefault: Bool
    }
    
    struct CategoryProduct: Codable {
        let productId: String
        let modelNumber: String
        let storeSkuNumber: String
        let brand: String
        let title: String
        let shortDescription: String
        let price: Price
        let rating: Rating
        let images: Images
        let badges: [Badge]
        let keyFeatures: [String]
        let availability: Availability
        let productUrl: String
        let limitPerOrder: Int
        
        struct Price: Codable {
            let current: Double
            let original: Double?
            let savings: Double?
            let savingsPercent: Int?
            let isOnSale: Bool
            let seeInCart: Bool
        }
        
        struct Rating: Codable {
            let average: Double
            let count: Int
        }
        
        struct Images: Codable {
            let primary: String
            let alternate: String?
            let colorSwatches: [ColorSwatch]?
            
            struct ColorSwatch: Codable {
                let color: String
                let swatchUrl: String
                let variantId: String
            }
        }
        
        struct Badge: Codable {
            let type: String
            let label: String
        }
        
        struct Availability: Codable {
            let inStorePickup: Bool
            let delivery: Bool
            let shipToHome: Bool
        }
    }
    
    struct Pagination: Codable {
        let currentPage: Int
        let totalPages: Int
        let itemsPerPage: Int
        let startIndex: Int
        let endIndex: Int
    }
    
    struct RefrigeratorStyle: Codable {
        let styleId: String
        let styleName: String
        let description: String
        let productId: String
        let image: String           // This is the product image URL!
        let url: String
        let isCurrentCategory: Bool
    }
    
    struct ParentCategory: Codable {
        let categoryId: String
        let categoryName: String
        let url: String
        let department: String
    }
}

// MARK: - =============================================
// MARK: - CATEGORY DATA LOADER
// MARK: - =============================================

class CategoryDataLoader {
    static let shared = CategoryDataLoader()
    
    private init() {}
    
    /// Load category page data from JSON file
    func loadCategoryData(filename: String) -> CategoryPageData? {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
            print("❌ Error: Could not find \(filename).json in bundle")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let categoryData = try decoder.decode(CategoryPageData.self, from: data)
            print("✅ Successfully loaded category data from \(filename).json")
            print("   📊 Total products: \(categoryData.products.count)")
            print("   🎨 Style pills: \(categoryData.refrigeratorStyles.count)")
            return categoryData
        } catch {
            print("❌ Error loading \(filename).json: \(error)")
            return nil
        }
    }
    
    /// Create style pills from refrigerator styles with real product images
    func createStylePills(from styles: [CategoryPageData.RefrigeratorStyle]) -> [DSStylePillItem] {
        return styles.map { style in
            DSStylePillItem(
                text: style.styleName,
                image: Image(systemName: "refrigerator.fill"),  // Fallback
                imageURL: style.image  // Real product image URL!
            )
        }
    }
}

// MARK: - =============================================
// MARK: - CONVERSION TO PRODUCT MODEL
// MARK: - =============================================

extension CategoryPageData.CategoryProduct {
    /// Convert CategoryProduct to Product model for use with ProductCard
    func toProduct() -> Product {
        // Create pickup info
        let pickupInfo = availability.inStorePickup ? FulfillmentInfo(
            primaryValue: "Available",
            secondaryValue: "at store"
        ) : nil
        
        // Create delivery info
        let deliveryInfo = availability.delivery ? FulfillmentInfo(
            primaryValue: price.isOnSale ? "Free" : "Available",
            secondaryValue: nil
        ) : nil
        
        // Extract promotional badge
        let promotionalBadge = badges.first { $0.type != "energyStar" }?.label
        
        // Check for exclusive
        let isExclusive = badges.contains(where: { $0.type == "exclusive" })
        
        // Convert color swatches to product colors
        let colors: [Product.ProductColor]? = images.colorSwatches?.prefix(3).map { swatch in
            Product.ProductColor(
                colorHex: extractColorHex(from: swatch.color),
                borderColorHex: nil
            )
        }
        
        let additionalColorCount = max(0, (images.colorSwatches?.count ?? 0) - 3)
        
        return Product(
            id: productId,
            brand: brand,
            name: title,
            modelNumber: modelNumber,
            heroImage: images.primary,
            thumbnailImages: images.alternate.map { [$0] } ?? [],
            additionalImageCount: additionalColorCount,
            currentPrice: Decimal(price.current),
            originalPrice: price.original.map { Decimal($0) },
            savingsPercentage: price.savingsPercent,
            rating: rating.average,
            reviewCount: rating.count,
            isExclusive: isExclusive,
            promotionalBadge: promotionalBadge,
            pickupInfo: pickupInfo,
            deliveryInfo: deliveryInfo,
            fasterDeliveryInfo: nil,
            internetNumber: productId,
            storeSKU: storeSkuNumber,
            isSponsored: false,
            availableColors: colors,
            additionalColorCount: additionalColorCount
        )
    }
    
    /// Extract color hex from color name
    private func extractColorHex(from colorName: String) -> String {
        let name = colorName.lowercased()
        if name.contains("stainless") {
            return "#C0C0C0"
        } else if name.contains("white") {
            return "#FFFFFF"
        } else if name.contains("black") {
            return "#000000"
        } else if name.contains("slate") {
            return "#6B7280"
        } else {
            return "#808080"
        }
    }
}
