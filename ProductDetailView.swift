import SwiftUI

// MARK: - ProductDetailView (PIP)

/// Product Information Page for the local Product type.
/// Uses DSPIPZoneA to display full product details with image gallery, pricing, ratings, and fulfillment info.
struct ProductDetailView: View {
    let product: Product

    var body: some View {
        DSPIPZoneA(
            breadcrumbs: [],
            productInfo: productInfo,
            images: galleryImages,
            ratingInfo: ratingInfo,
            pricingInfo: pricingInfo,
            storeInfo: storeInfo,
            fulfillmentInfo: fulfillmentInfo,
            onAddToCart: {
                // Cart action would go here
            },
            onBuyNow: {
                // Buy now action would go here
            },
            onFavorite: {
                // Favorite action would go here
            },
            onShare: {
                // Share action would go here
            }
        )
        .navigationTitle(product.name)
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - Data Mapping

    /// Maps Product to DSPIPProductInfo
    private var productInfo: DSPIPProductInfo {
        DSPIPProductInfo(
            brand: product.brand,
            productName: product.name,
            modelNumber: product.modelNumber.isEmpty ? nil : product.modelNumber,
            skuNumber: product.storeSKU,
            badge: mappedBadge
        )
    }

    /// Maps badges to DSPIPBadge
    private var mappedBadge: DSPIPBadge? {
        if product.isExclusive {
            return DSPIPBadge(text: "Exclusive", type: .bestSeller)
        } else if let promo = product.promotionalBadge {
            let lowercased = promo.lowercased()
            if lowercased.contains("best seller") {
                return .bestSeller()
            } else if lowercased.contains("new") {
                return .newArrival()
            } else if lowercased.contains("top rated") {
                return .topRated()
            } else if lowercased.contains("saving") || lowercased.contains("sale") {
                return .specialSavings()
            } else {
                return DSPIPBadge(text: promo, type: .custom)
            }
        }
        return nil
    }

    /// Creates gallery images from product image URLs
    private var galleryImages: [DSGalleryImage] {
        var images: [DSGalleryImage] = []

        // Add hero image first
        if let heroURL = URL(string: product.heroImage) {
            images.append(DSGalleryImage(id: "hero", url: heroURL))
        }

        // Add thumbnail images
        for (index, thumbnailURL) in product.thumbnailImages.enumerated() {
            if let url = URL(string: thumbnailURL) {
                images.append(DSGalleryImage(id: "thumb-\(index)", url: url))
            }
        }

        return images
    }

    /// Maps Product rating to DSPIPRatingInfo
    private var ratingInfo: DSPIPRatingInfo? {
        DSPIPRatingInfo(
            rating: product.rating,
            reviewCount: product.reviewCount,
            questionCount: 0
        )
    }

    /// Maps Product pricing to DSPIPPricingInfo
    private var pricingInfo: DSPIPPricingInfo {
        var savingsText: String?
        if let savings = product.savingsPercentage {
            savingsText = "Save \(savings)%"
        }

        let currentPriceDouble = Double(truncating: product.currentPrice as NSDecimalNumber)
        let originalPriceDouble = product.originalPrice.map { Double(truncating: $0 as NSDecimalNumber) }

        return DSPIPPricingInfo(
            currentPrice: currentPriceDouble,
            originalPrice: originalPriceDouble,
            savingsText: savingsText,
            perUnit: "each"
        )
    }

    /// Maps Product availability to DSPIPStoreInfo
    private var storeInfo: DSPIPStoreInfo? {
        // Determine stock status from delivery info
        let isOutOfStock = product.deliveryInfo?.primaryValue.lowercased().contains("out of stock") ?? false

        return DSPIPStoreInfo(
            stockStatus: isOutOfStock ? .outOfStock : .inStock(quantity: nil),
            aisleLocation: nil,
            storeName: nil
        )
    }

    /// Maps Product fulfillment to DSPIPFulfillmentInfo
    private var fulfillmentInfo: DSPIPFulfillmentInfo? {
        let pickupAvailable = product.pickupInfo != nil
        let deliveryAvailable = product.deliveryInfo != nil &&
            !(product.deliveryInfo?.primaryValue.lowercased().contains("out of stock") ?? false)

        return DSPIPFulfillmentInfo(
            pickupAvailable: pickupAvailable,
            pickupDate: product.pickupInfo?.primaryValue,
            pickupLocation: product.pickupInfo?.secondaryValue,
            deliveryAvailable: deliveryAvailable,
            deliveryDate: product.deliveryInfo?.primaryValue,
            deliveryLocation: product.deliveryInfo?.secondaryValue
        )
    }
}

// MARK: - Preview

#Preview("Product Detail") {
    NavigationStack {
        ProductDetailView(
            product: Product(
                id: "12345",
                brand: "Milwaukee",
                name: "M18 FUEL 18V Lithium-Ion Brushless Cordless Hammer Drill",
                modelNumber: "2804-20",
                heroImage: "https://images.thdstatic.com/productImages/sample.jpg",
                thumbnailImages: [],
                additionalImageCount: 0,
                currentPrice: 199.00,
                originalPrice: 249.00,
                savingsPercentage: 20,
                rating: 4.7,
                reviewCount: 1234,
                isExclusive: true,
                promotionalBadge: "Best Seller",
                pickupInfo: FulfillmentInfo(primaryValue: "Free", secondaryValue: "Pickup Today"),
                deliveryInfo: FulfillmentInfo(primaryValue: "Delivery", secondaryValue: "Available"),
                fasterDeliveryInfo: nil,
                internetNumber: "324567890",
                storeSKU: "1234567"
            )
        )
    }
}
