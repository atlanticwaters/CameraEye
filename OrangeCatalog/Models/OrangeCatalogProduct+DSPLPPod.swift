import SwiftUI

// MARK: - OrangeCatalogProduct + DSPLPPod Mapping

extension OrangeCatalogProduct {
    /// Converts an OrangeCatalogProduct to DSPLPPodData for display in DSPLPPod.
    func toPLPPodData() -> DSPLPPodData {
        DSPLPPodData(
            productImage: nil, // Will use async image instead
            badges: mappedBadges,
            isSponsored: false,
            swatchDisplay: .none,
            productName: name,
            modelNumber: modelNumber,
            pricingType: mappedPricingType,
            showSpecialBuy: false,
            perItemPriceDetail: nil,
            ratingInfo: mappedRatingInfo,
            fulfillmentInfo: mappedFulfillmentInfo
        )
    }

    // MARK: - Pricing Type Mapping

    /// Maps product price to DSPLPPodPricingType.
    private var mappedPricingType: DSPLPPodPricingType {
        guard let current = currentPrice else {
            return .contactStore
        }

        let (dollars, cents) = splitPrice(current)

        // Check if on sale
        if let original = originalPrice, original > current, let savings = savingsPercentage {
            return .withSavings(
                dollars: dollars,
                cents: cents,
                originalPrice: original,
                savings: "Save \(savings)%",
                perUnit: "/each"
            )
        }

        return .standard(dollars: dollars, cents: cents, perUnit: "/each")
    }

    /// Splits a price into dollars and cents components.
    private func splitPrice(_ price: Double) -> (dollars: Int, cents: Int) {
        let dollars = Int(price)
        let cents = Int((price - Double(dollars)) * 100)
        return (dollars, cents)
    }

    // MARK: - Rating Info Mapping

    /// Maps product rating to DSPLPPodRatingInfo.
    private var mappedRatingInfo: DSPLPPodRatingInfo? {
        guard let average = ratingAverage else { return nil }
        return DSPLPPodRatingInfo(
            rating: average,
            reviewCount: reviewCount
        )
    }

    // MARK: - Fulfillment Info Mapping

    /// Maps product availability to DSPLPPodFulfillmentInfo.
    private var mappedFulfillmentInfo: DSPLPPodFulfillmentInfo? {
        let pickupInfo: DSPLPPodFulfillmentInfo.PickupInfo?
        let deliveryInfo: DSPLPPodFulfillmentInfo.DeliveryInfo?

        if inStock {
            pickupInfo = DSPLPPodFulfillmentInfo.PickupInfo(
                primaryText: "Free Pickup Today",
                locationText: "at your local store"
            )
            deliveryInfo = DSPLPPodFulfillmentInfo.DeliveryInfo(
                primaryText: "Delivery Available",
                dateText: nil,
                isUnavailable: false
            )
        } else {
            pickupInfo = nil
            deliveryInfo = DSPLPPodFulfillmentInfo.DeliveryInfo(
                primaryText: "Out of Stock",
                dateText: nil,
                isUnavailable: true
            )
        }

        return DSPLPPodFulfillmentInfo(
            pickup: pickupInfo,
            delivery: deliveryInfo,
            fasterDelivery: nil
        )
    }

    // MARK: - Badge Mapping

    /// Maps product badges to DSPLPPodBadge array.
    private var mappedBadges: [DSPLPPodBadge] {
        guard let badges else { return [] }

        return badges.compactMap { badge -> DSPLPPodBadge? in
            let lowercased = badge.lowercased()

            switch lowercased {
            case "best seller", "bestseller":
                return .topRated()
            case "new", "new arrival":
                return .newArrival()
            case "exclusive":
                return .exclusive()
            case "special savings", "sale", "clearance":
                return .specialSavings()
            default:
                // Create a custom badge for unknown types
                return DSPLPPodBadge(text: badge, color: .info)
            }
        }
    }

    // MARK: - Image URL

    /// The primary image URL for AsyncImage loading.
    var primaryImageURL: URL? {
        imageURL
    }
}
