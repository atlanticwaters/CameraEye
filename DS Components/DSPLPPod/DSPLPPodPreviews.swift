import SwiftUI

// MARK: - Previews

#Preview("B2C Variant") {
    DSPLPPod(
        variant: .b2c,
        data: DSPLPPodData(
            badges: [.exclusive()],
            isSponsored: true,
            swatchDisplay: .swatchesWithQuantity(
                swatches: [
                    DSPLPPodSwatch(color: .red),
                    DSPLPPodSwatch(color: .blue),
                    DSPLPPodSwatch(color: .green)
                ],
                additionalCount: 5
            ),
            productName: "DEWALT 20V MAX Cordless Drill/Driver Kit",
            modelNumber: "DCD791D2",
            pricingType: .standard(dollars: 149, cents: 99, perUnit: "/each"),
            ratingInfo: DSPLPPodRatingInfo(rating: 4.5, reviewCount: 1234),
            fulfillmentInfo: DSPLPPodFulfillmentInfo(
                pickup: .init(primaryText: "Free Pickup Today", locationText: "at Atlanta Midtown"),
                delivery: .init(primaryText: "Delivery: Free", dateText: "Tomorrow")
            )
        ),
        onAddToCart: { print("Add to cart") }
    )
    .padding()
}

#Preview("B2B Variant") {
    DSPLPPod(
        variant: .b2b,
        data: DSPLPPodData(
            badges: [.exclusive(), .christmasDelivery()],
            productName: "Milwaukee M18 FUEL Hammer Drill Kit",
            modelNumber: "2804-22",
            pricingType: .withSavings(
                dollars: 299,
                cents: 00,
                originalPrice: 349.00,
                savings: "Save $50.00",
                perUnit: "/each"
            ),
            showSpecialBuy: true,
            ratingInfo: DSPLPPodRatingInfo(rating: 4.8, reviewCount: 892),
            fulfillmentInfo: DSPLPPodFulfillmentInfo(
                pickup: .init(primaryText: "In Stock", locationText: "at Atlanta Midtown"),
                delivery: .init(primaryText: "Delivery", dateText: "Dec 28")
            ),
            quantity: 2
        ),
        onQuantityChanged: { print("Quantity: \($0)") },
        onAddToCart: { print("Add to cart") },
        onAddToList: { print("Add to list") }
    )
    .padding()
}

#Preview("B2C with Special Buy") {
    DSPLPPod(
        variant: .b2c,
        data: DSPLPPodData(
            badges: [.specialSavings()],
            productName: "Ryobi ONE+ 18V Cordless 6-Tool Combo Kit",
            modelNumber: "P1819",
            pricingType: .withSavings(
                dollars: 199,
                cents: 00,
                originalPrice: 299.00,
                savings: "Save $100.00",
                perUnit: nil
            ),
            showSpecialBuy: true,
            ratingInfo: DSPLPPodRatingInfo(rating: 4.6, reviewCount: 3456)
        ),
        onAddToCart: { print("Add to cart") }
    )
    .padding()
}

#Preview("B2B Disabled Buttons") {
    DSPLPPod(
        variant: .b2b,
        data: DSPLPPodData(
            productName: "Out of Stock Product",
            modelNumber: "OOS-123",
            pricingType: .standard(dollars: 99, cents: 99, perUnit: nil),
            fulfillmentInfo: DSPLPPodFulfillmentInfo(
                delivery: .init(primaryText: "Unavailable", isUnavailable: true)
            ),
            isAddToCartEnabled: false,
            isAddToListEnabled: false
        )
    )
    .padding()
}

#Preview("B2C Contact Store") {
    DSPLPPod(
        variant: .b2c,
        data: DSPLPPodData(
            badges: [.newArrival()],
            productName: "Trex Transcend Composite Decking",
            modelNumber: "TX-DECK-001",
            pricingType: .contactStore,
            ratingInfo: DSPLPPodRatingInfo(rating: 4.9, reviewCount: 567)
        ),
        onAddToCart: { print("Add to cart") }
    )
    .padding()
}

#Preview("B2C Starting At Price") {
    DSPLPPod(
        variant: .b2c,
        data: DSPLPPodData(
            swatchDisplay: .moreOptionsAvailable,
            productName: "Hampton Bay Outdoor Ceiling Fan",
            modelNumber: "HB-CF-52",
            pricingType: .startingAt(dollars: 89, cents: 99),
            ratingInfo: DSPLPPodRatingInfo(rating: 4.2, reviewCount: 234)
        ),
        onAddToCart: { print("Add to cart") }
    )
    .padding()
}

#Preview("B2B with Custom Options") {
    DSPLPPod(
        variant: .b2b,
        data: DSPLPPodData(
            swatchDisplay: .customOptions(text: "3 Sizes, 5 Colors Available"),
            productName: "Husky Heavy Duty Tool Chest",
            modelNumber: "H46TC",
            pricingType: .standard(dollars: 449, cents: 00, perUnit: nil),
            ratingInfo: DSPLPPodRatingInfo(rating: 4.7, reviewCount: 1890),
            fulfillmentInfo: DSPLPPodFulfillmentInfo(
                pickup: .init(primaryText: "Free Pickup", locationText: "Today at Atlanta"),
                fasterDelivery: .init(primaryText: "Same Day Delivery", timeText: "Order by 2pm")
            ),
            quantity: 1,
            addToCartText: "Add to Quote"
        ),
        onQuantityChanged: { print("Quantity: \($0)") },
        onAddToCart: { print("Add to quote") },
        onAddToList: { print("Add to list") }
    )
    .padding()
}

#Preview("Side by Side Comparison") {
    HStack(alignment: .top, spacing: 16) {
        VStack {
            Text("B2C")
                .font(.caption)
                .foregroundStyle(.gray)

            DSPLPPod(
                variant: .b2c,
                data: DSPLPPodData(
                    productName: "Product Name",
                    pricingType: .standard(dollars: 99, cents: 99, perUnit: nil)
                )
            )
        }

        VStack {
            Text("B2B")
                .font(.caption)
                .foregroundStyle(.gray)

            DSPLPPod(
                variant: .b2b,
                data: DSPLPPodData(
                    productName: "Product Name",
                    pricingType: .standard(dollars: 99, cents: 99, perUnit: nil)
                )
            )
        }
    }
    .padding()
}
