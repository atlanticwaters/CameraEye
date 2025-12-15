import SwiftUI

// MARK: - =============================================
// MARK: - PLP DATA MODELS (from pip-datasets.json)
// MARK: - =============================================

/// Root container for PIP datasets
struct PIPDatasetsContainer: Codable {
    let pipDatasets: [PIPDataset]
}

/// Complete product information page dataset
struct PIPDataset: Codable, Identifiable {
    let productId: String
    let identifiers: Identifiers
    let brand: Brand
    let title: String
    let shortDescription: String
    let longDescription: String
    let breadcrumbs: [Breadcrumb]
    let pricing: Pricing
    let rating: Rating
    let media: Media
    let variants: [Variant]
    let keyFeatures: [String]
    let highlights: [Highlight]
    let specifications: Specifications
    let badges: [Badge]
    let certifications: [Certification]
    let warranty: Warranty
    let protectionPlan: ProtectionPlan
    let availability: Availability
    let services: Services
    let requirements: [Requirement]
    let includedItems: [String]
    let relatedProducts: RelatedProducts
    
    var id: String { productId }
    
    // MARK: - Nested Types
    
    struct Identifiers: Codable {
        let internetNumber: String
        let modelNumber: String
        let storeSkuNumber: String
        let storeSoSkuNumber: String
        let upc: String
        let manufacturerPartNumber: String
    }
    
    struct Brand: Codable {
        let name: String
        let logoUrl: String
        let brandPageUrl: String
        let series: String
    }
    
    struct Breadcrumb: Codable {
        let label: String
        let url: String
    }
    
    struct Pricing: Codable {
        let currentPrice: Double
        let originalPrice: Double?
        let savings: Double?
        let savingsPercent: Int?
        let isOnSale: Bool
        let seeInCart: Bool
        let financing: Financing?
        
        struct Financing: Codable {
            let monthlyPayment: Double
            let term: Int
            let apr: Double
        }
    }
    
    struct Rating: Codable {
        let average: Double
        let count: Int
        let recommendationPercent: Int
        let distribution: Distribution
        
        struct Distribution: Codable {
            let fiveStar: Int
            let fourStar: Int
            let threeStar: Int
            let twoStar: Int
            let oneStar: Int
            
            enum CodingKeys: String, CodingKey {
                case fiveStar = "5star"
                case fourStar = "4star"
                case threeStar = "3star"
                case twoStar = "2star"
                case oneStar = "1star"
            }
        }
    }
    
    struct Media: Codable {
        let primaryImage: String
        let images: [MediaImage]
        let videos: [Video]?
        let threeSixtyView: String?
        let augmentedReality: Bool
        
        struct MediaImage: Codable {
            let url: String
            let altText: String
            let type: String
        }
        
        struct Video: Codable {
            let videoId: String
            let title: String
            let thumbnailUrl: String
            let videoUrl: String
            let duration: String
        }
    }
    
    struct Variant: Codable {
        let variantId: String
        let variantType: String
        let variantValue: String
        let price: Double
        let imageUrl: String
        let swatchUrl: String
        let inStock: Bool
        let isSelected: Bool
    }
    
    struct Highlight: Codable {
        let icon: String
        let label: String
        let value: String
    }
    
    struct Specifications: Codable {
        let dimensions: Dimensions
        let details: [SpecificationGroup]
        
        struct Dimensions: Codable {
            let productWidth: String
            let productHeight: String
            let productDepth: String
            let productWeight: String
            let packageWidth: String
            let packageHeight: String
            let packageDepth: String
            let packageWeight: String
        }
        
        struct SpecificationGroup: Codable {
            let groupName: String
            let attributes: [Attribute]
            
            struct Attribute: Codable {
                let name: String
                let value: String
            }
        }
    }
    
    struct Badge: Codable {
        let type: String
        let label: String
        let iconUrl: String
    }
    
    struct Certification: Codable {
        let name: String
        let logoUrl: String
        let description: String
    }
    
    struct Warranty: Codable {
        let manufacturerWarranty: String
        let extendedWarrantyAvailable: Bool
        let warrantyDetails: String
    }
    
    struct ProtectionPlan: Codable {
        let available: Bool
        let options: [Option]?
        
        struct Option: Codable {
            let term: Int
            let price: Double
            let coverage: String
        }
    }
    
    struct Availability: Codable {
        let inStorePickup: InStorePickup
        let delivery: Delivery
        let shipToHome: ShipToHome
        
        struct InStorePickup: Codable {
            let available: Bool
            let quantity: Int?
            let storeName: String?
            let storeId: String?
        }
        
        struct Delivery: Codable {
            let available: Bool
            let estimatedDate: String?
            let freeDelivery: Bool
            let deliveryCharge: Double
        }
        
        struct ShipToHome: Codable {
            let available: Bool
            let estimatedDate: String?
            let shippingCharge: Double?
            let freeShipping: Bool
        }
    }
    
    struct Services: Codable {
        let installation: Installation
        let haulAway: HaulAway
        let assembly: Assembly
        
        struct Installation: Codable {
            let available: Bool
            let price: Double?
            let description: String?
        }
        
        struct HaulAway: Codable {
            let available: Bool
            let price: Double?
        }
        
        struct Assembly: Codable {
            let available: Bool
            let price: Double?
        }
    }
    
    struct Requirement: Codable {
        let type: String
        let description: String
    }
    
    struct RelatedProducts: Codable {
        let accessories: [RelatedProduct]?
        let similar: [RelatedProduct]?
        
        struct RelatedProduct: Codable {
            let productId: String
            let title: String
            let price: Double
            let imageUrl: String
        }
    }
}

// MARK: - =============================================
// MARK: - CONVERSION EXTENSIONS
// MARK: - =============================================

extension PIPDataset {
    /// Convert PIPDataset to Product model for use with ProductCard
    func toProduct() -> Product {
        // Extract color variants if available
        let colors: [Product.ProductColor]? = variants.isEmpty ? nil : variants.prefix(3).map { variant in
            Product.ProductColor(
                colorHex: extractColorHex(from: variant.swatchUrl),
                borderColorHex: nil
            )
        }
        
        let additionalColorCount = max(0, variants.count - 3)
        
        // Create pickup info
        let pickupInfo = availability.inStorePickup.available ? FulfillmentInfo(
            primaryValue: "\(availability.inStorePickup.quantity ?? 0) in stock",
            secondaryValue: availability.inStorePickup.storeName,
            highlightedText: availability.inStorePickup.storeName
        ) : nil
        
        // Create delivery info
        let deliveryInfo = availability.delivery.available ? FulfillmentInfo(
            primaryValue: availability.delivery.freeDelivery ? "Free" : "$\(availability.delivery.deliveryCharge)",
            secondaryValue: availability.delivery.estimatedDate
        ) : nil
        
        // Check for promotional badges
        var promotionalBadge: String? = nil
        if let topSellerBadge = badges.first(where: { $0.type == "topSeller" }) {
            promotionalBadge = topSellerBadge.label
        } else if let firstBadge = badges.first {
            promotionalBadge = firstBadge.label
        }
        
        // Determine if exclusive
        let isExclusive = badges.contains(where: { $0.type == "exclusive" })
        
        return Product(
            id: productId,
            brand: brand.name,
            name: title,
            modelNumber: identifiers.modelNumber,
            heroImage: media.primaryImage,
            thumbnailImages: media.images.map { $0.url },
            additionalImageCount: max(0, media.images.count - 1),
            currentPrice: Decimal(pricing.currentPrice),
            originalPrice: pricing.originalPrice.map { Decimal($0) },
            savingsPercentage: pricing.savingsPercent,
            rating: rating.average,
            reviewCount: rating.count,
            isExclusive: isExclusive,
            promotionalBadge: promotionalBadge,
            pickupInfo: pickupInfo,
            deliveryInfo: deliveryInfo,
            fasterDeliveryInfo: nil,
            internetNumber: identifiers.internetNumber,
            storeSKU: identifiers.storeSkuNumber,
            isSponsored: false,
            availableColors: colors,
            additionalColorCount: additionalColorCount
        )
    }
    
    /// Extract color hex from swatch URL (simplified)
    private func extractColorHex(from url: String) -> String {
        if url.contains("stainless") {
            return "#C0C0C0"
        } else if url.contains("white") {
            return "#FFFFFF"
        } else if url.contains("black") {
            return "#000000"
        } else if url.contains("slate") {
            return "#6B7280"
        } else {
            return "#808080" // Default gray
        }
    }
}

// MARK: - =============================================
// MARK: - DATA LOADER
// MARK: - =============================================

class PLPDataLoader {
    static let shared = PLPDataLoader()
    
    private init() {}
    
    /// Load PIP datasets from JSON file
    func loadPIPDatasets() -> [PIPDataset] {
        guard let url = Bundle.main.url(forResource: "pip-datasets", withExtension: "json") else {
            print("❌ Error: Could not find pip-datasets.json in bundle")
            return []
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let container = try decoder.decode(PIPDatasetsContainer.self, from: data)
            print("✅ Successfully loaded \(container.pipDatasets.count) products from pip-datasets.json")
            return container.pipDatasets
        } catch {
            print("❌ Error loading pip-datasets.json: \(error)")
            return []
        }
    }
    
    /// Load and convert to Product models
    func loadProducts() -> [Product] {
        let pipDatasets = loadPIPDatasets()
        return pipDatasets.map { $0.toProduct() }
    }
    
    /// Load products filtered by category
    func loadProducts(category: String) -> [Product] {
        let allProducts = loadProducts()
        return allProducts.filter { product in
            // Filter by breadcrumb or category - for now return all
            return true
        }
    }
}
