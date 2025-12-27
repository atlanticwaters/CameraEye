import SwiftUI

// MARK: - Full PIP Zone A Preview

#Preview("Full PIP Zone A") {
    DSPIPZoneA(
        breadcrumbs: ["Tools", "Power Tools", "Drills"],
        productInfo: DSPIPProductInfo(
            brand: "DEWALT",
            productName: "20V MAX XR Lithium-Ion Cordless Brushless 1/2 in. Drill/Driver Kit",
            modelNumber: "DCD791D2",
            skuNumber: "305795844",
            badge: .bestSeller()
        ),
        images: sampleImages,
        ratingInfo: DSPIPRatingInfo(rating: 4.7, reviewCount: 2543, questionCount: 89),
        pricingInfo: DSPIPPricingInfo(
            currentPrice: 199.00,
            originalPrice: 249.00,
            unitPrice: nil,
            savingsText: "Save $50.00 (20%)",
            pricingBadge: "Lowest Price"
        ),
        storeInfo: DSPIPStoreInfo(
            stockStatus: .inStock(quantity: 12),
            aisleLocation: "Aisle 11, Bay 003",
            storeName: "Atlanta Midtown"
        ),
        fulfillmentInfo: DSPIPFulfillmentInfo(
            pickupAvailable: true,
            pickupDate: "Today",
            pickupLocation: "Atlanta Midtown #0544",
            deliveryAvailable: true,
            deliveryDate: "Tomorrow",
            deliveryLocation: "30308"
        )
    )
}

// MARK: - Minimal PIP Zone A Preview

#Preview("Minimal PIP Zone A") {
    DSPIPZoneA(
        productInfo: DSPIPProductInfo(
            brand: "HDX",
            productName: "Heavy Duty Storage Tote"
        ),
        pricingInfo: DSPIPPricingInfo(currentPrice: 12.98)
    )
}

// MARK: - Special Savings Preview

#Preview("Special Savings Badge") {
    DSPIPZoneA(
        breadcrumbs: ["Appliances", "Refrigerators"],
        productInfo: DSPIPProductInfo(
            brand: "Samsung",
            productName: "28 cu. ft. 3-Door French Door Refrigerator",
            modelNumber: "RF28T5001SR",
            badge: .specialSavings()
        ),
        images: sampleImages,
        ratingInfo: DSPIPRatingInfo(rating: 4.2, reviewCount: 856, questionCount: 42),
        pricingInfo: DSPIPPricingInfo(
            currentPrice: 1499.00,
            originalPrice: 1899.00,
            savingsText: "Save $400.00",
            pricingBadge: "Special Buy"
        ),
        storeInfo: DSPIPStoreInfo(
            stockStatus: .limitedStock,
            storeName: "Atlanta Buckhead"
        )
    )
}

// MARK: - Out of Stock Preview

#Preview("Out of Stock") {
    DSPIPZoneA(
        breadcrumbs: ["Outdoors", "Grills"],
        productInfo: DSPIPProductInfo(
            brand: "Weber",
            productName: "Genesis II E-310 3-Burner Propane Gas Grill",
            modelNumber: "61011001",
            badge: .topRated()
        ),
        ratingInfo: DSPIPRatingInfo(rating: 4.8, reviewCount: 1234),
        pricingInfo: DSPIPPricingInfo(currentPrice: 749.00),
        storeInfo: DSPIPStoreInfo(
            stockStatus: .outOfStock,
            storeName: "Atlanta Midtown"
        ),
        fulfillmentInfo: DSPIPFulfillmentInfo(
            pickupAvailable: false,
            pickupDate: "Not Available",
            deliveryAvailable: true,
            deliveryDate: "Wed, Jan 15",
            deliveryLocation: "30308"
        )
    )
}

// MARK: - Starting At Price Preview

#Preview("Starting At Price") {
    DSPIPZoneA(
        breadcrumbs: ["Flooring", "Tile"],
        productInfo: DSPIPProductInfo(
            brand: "MSI",
            productName: "Carrara White 12 in. x 24 in. Polished Porcelain Floor Tile",
            modelNumber: "NCAR1224P"
        ),
        ratingInfo: DSPIPRatingInfo(rating: 4.5, reviewCount: 432),
        pricingInfo: DSPIPPricingInfo(
            currentPrice: 2.49,
            unitPrice: "$2.49/sq. ft.",
            isStartingAt: true,
            perUnit: "sq. ft."
        ),
        storeInfo: DSPIPStoreInfo(
            stockStatus: .inStock(quantity: nil),
            aisleLocation: "Aisle 44, Bay 012"
        )
    )
}

// MARK: - New Arrival Preview

#Preview("New Arrival") {
    DSPIPZoneA(
        breadcrumbs: ["Smart Home", "Lighting"],
        productInfo: DSPIPProductInfo(
            brand: "Philips Hue",
            productName: "White and Color Ambiance A19 LED Smart Bulb Starter Kit",
            modelNumber: "563296",
            badge: .newArrival()
        ),
        images: sampleImages,
        ratingInfo: DSPIPRatingInfo(rating: 4.6, reviewCount: 128, questionCount: 15),
        pricingInfo: DSPIPPricingInfo(currentPrice: 179.99),
        storeInfo: DSPIPStoreInfo(
            stockStatus: .inStock(quantity: 8),
            aisleLocation: "Aisle 8, Bay 015"
        ),
        fulfillmentInfo: DSPIPFulfillmentInfo(
            pickupAvailable: true,
            pickupDate: "Today by 6pm",
            deliveryAvailable: true,
            deliveryDate: "Free Delivery Tomorrow"
        )
    )
}

// MARK: - Sample Data

private let sampleImages: [DSGalleryImage] = [
    DSGalleryImage(id: "1"),
    DSGalleryImage(id: "2"),
    DSGalleryImage(id: "3"),
    DSGalleryImage(id: "4"),
]
