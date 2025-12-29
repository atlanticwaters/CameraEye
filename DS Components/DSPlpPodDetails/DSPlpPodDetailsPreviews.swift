import SwiftUI

// MARK: - Standard Pricing Preview

#Preview("Standard Pricing") {
    DSPLPPodDetails(
        productName: "DEWALT 20V MAX Cordless Drill/Driver Kit (2 Batteries)",
        modelNumber: "DCD791D2",
        pricingType: .standard(dollars: 149, cents: 99, perUnit: "/each"),
        showSpecialBuy: true,
        perItemPriceDetail: "($1.18/battery)",
        ratingInfo: DSPLPPodRatingInfo(rating: 4.5, reviewCount: 1234),
        fulfillmentInfo: DSPLPPodFulfillmentInfo(
            pickup: .init(primaryText: "Free Pickup Today", locationText: "at Atlanta Midtown"),
            delivery: .init(primaryText: "Delivery: Free", dateText: "Tomorrow")
        )
    )
    .padding()
}

// MARK: - Starting At Preview

#Preview("Starting At") {
    DSPLPPodDetails(
        productName: "TrafficMaster Laminate Flooring",
        modelNumber: "HL1044",
        pricingType: .startingAt(dollars: 0, cents: 89),
        ratingInfo: DSPLPPodRatingInfo(rating: 4.2, reviewCount: 567)
    )
    .padding()
}

// MARK: - With Savings Preview

#Preview("With Savings") {
    DSPLPPodDetails(
        productName: "Milwaukee M18 FUEL 18V Hammer Drill and Impact Driver Combo Kit",
        modelNumber: "2997-22",
        pricingType: .withSavings(
            dollars: 399,
            cents: 00,
            originalPrice: 499.00,
            savings: "Save $100.00",
            perUnit: "/package"
        ),
        showSpecialBuy: true,
        perItemPriceDetail: "($199.50/tool)",
        ratingInfo: DSPLPPodRatingInfo(rating: 4.8, reviewCount: 2543),
        fulfillmentInfo: DSPLPPodFulfillmentInfo(
            pickup: .init(primaryText: "15 in stock", locationText: "at Washington Courthouse, OH"),
            delivery: .init(primaryText: "Delivery: Free", dateText: "Tomorrow"),
            fasterDelivery: .init(primaryText: "Faster Delivery:", timeText: "Get it in 2 hours")
        )
    )
    .padding()
}

// MARK: - With Rebate Preview

#Preview("With Rebate") {
    DSPLPPodDetails(
        productName: "Energizer MAX AA Batteries (24 Pack)",
        modelNumber: "E91BP-24",
        pricingType: .withRebate(dollars: 19, cents: 98, rebateText: "Get up to $50 in Rebates"),
        ratingInfo: DSPLPPodRatingInfo(rating: 4.7, reviewCount: 892)
    )
    .padding()
}

// MARK: - Lower Price in Cart Preview

#Preview("Lower Price in Cart") {
    DSPLPPodDetails(
        productName: "Samsung 65\" Class QLED 4K Smart TV",
        modelNumber: "QN65Q60B",
        pricingType: .lowerPriceInCart,
        ratingInfo: DSPLPPodRatingInfo(rating: 4.6, reviewCount: 1456)
    )
    .padding()
}

// MARK: - Contact Store Preview

#Preview("Contact Store (TREX)") {
    DSPLPPodDetails(
        productName: "Trex Enhance Naturals Composite Decking Board",
        modelNumber: "EN5416TH",
        pricingType: .contactStore,
        ratingInfo: DSPLPPodRatingInfo(rating: 4.4, reviewCount: 234)
    )
    .padding()
}

// MARK: - Special Order Preview

#Preview("Special Order") {
    DSPLPPodDetails(
        productName: "Custom Solid Wood Cabinet Door",
        modelNumber: "CUST-001",
        pricingType: .specialOrder(
            headerText: "Special Order",
            bodyText: "This item requires a special order. Please contact us for pricing and availability.",
            phoneNumber: "1-800-466-3337"
        )
    )
    .padding()
}

// MARK: - Consultation (BRIO) Preview

#Preview("Consultation (BRIO)") {
    DSPLPPodDetails(
        productName: "Custom Kitchen Cabinet Installation",
        pricingType: .consultation(
            text: "Get a quote during a FREE in-home Consultation",
            subtitle: "Home Depot Installation Required"
        )
    )
    .padding()
}

// MARK: - MAP Pricing Preview

#Preview("MAP Pricing") {
    DSPLPPodDetails(
        productName: "Dyson V15 Detect Cordless Vacuum",
        modelNumber: "394472-01",
        pricingType: .mapPricing(
            dollars: 749,
            cents: 99,
            seeLowerPriceText: "See Lower Price",
            rebateText: "Rebates Available"
        ),
        ratingInfo: DSPLPPodRatingInfo(rating: 4.5, reviewCount: 678)
    )
    .padding()
}

// MARK: - Delivery Unavailable Preview

#Preview("Delivery Unavailable") {
    DSPLPPodDetails(
        productName: "Weber Genesis II E-310 3-Burner Gas Grill",
        modelNumber: "61011001",
        pricingType: .standard(dollars: 749, cents: 00, perUnit: nil),
        ratingInfo: DSPLPPodRatingInfo(rating: 4.7, reviewCount: 1890),
        fulfillmentInfo: DSPLPPodFulfillmentInfo(
            pickup: .init(primaryText: "15 in stock", locationText: "not eligible for online order Pickup"),
            delivery: .init(primaryText: "Delivery: Unavailable", isUnavailable: true)
        )
    )
    .padding()
}

// MARK: - Minimal Preview

#Preview("Minimal") {
    DSPLPPodDetails(
        productName: "HDX Heavy Duty Storage Tote",
        pricingType: .standard(dollars: 12, cents: 98, perUnit: nil)
    )
    .padding()
}
