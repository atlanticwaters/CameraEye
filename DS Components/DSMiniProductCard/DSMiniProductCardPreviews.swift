import SwiftUI

// MARK: - Previews

#Preview("Standard Price") {
    DSMiniProductCard(
        data: DSMiniProductCardData(
            productName: "DEWALT 20V MAX Cordless Drill/Driver Kit",
            price: .standard(dollars: 149, cents: 99),
            rating: DSMiniProductCardRating(rating: 4.5, reviewCount: 1234)
        )
    )
    .padding()
}

#Preview("Sale Price") {
    DSMiniProductCard(
        data: DSMiniProductCardData(
            productName: "Milwaukee M18 FUEL Impact Driver",
            price: .sale(dollars: 129, cents: 00, originalDollars: 179, originalCents: 99),
            badge: .sale(),
            rating: DSMiniProductCardRating(rating: 4.8, reviewCount: 892)
        )
    )
    .padding()
}

#Preview("New Badge") {
    DSMiniProductCard(
        data: DSMiniProductCardData(
            productName: "Ryobi ONE+ 18V Brushless Drill",
            price: .standard(dollars: 99, cents: 00),
            badge: .new(),
            rating: DSMiniProductCardRating(rating: 4.2, reviewCount: 156)
        )
    )
    .padding()
}

#Preview("Exclusive Badge") {
    DSMiniProductCard(
        data: DSMiniProductCardData(
            productName: "HDX Heavy Duty Storage Container",
            price: .standard(dollars: 24, cents: 98),
            badge: .exclusive()
        )
    )
    .padding()
}

#Preview("Price Range") {
    DSMiniProductCard(
        data: DSMiniProductCardData(
            productName: "Hampton Bay Ceiling Fan",
            price: .range(minDollars: 89, minCents: 00, maxDollars: 249, maxCents: 00),
            rating: DSMiniProductCardRating(rating: 4.0, reviewCount: 567)
        )
    )
    .padding()
}

#Preview("Starting At Price") {
    DSMiniProductCard(
        data: DSMiniProductCardData(
            productName: "Behr Premium Plus Paint",
            price: .startingAt(dollars: 38, cents: 98),
            rating: DSMiniProductCardRating(rating: 4.6, reviewCount: 2100)
        )
    )
    .padding()
}

#Preview("Sponsored Product") {
    DSMiniProductCard(
        data: DSMiniProductCardData(
            productName: "Makita 18V LXT Lithium-Ion Cordless Combo Kit",
            price: .standard(dollars: 299, cents: 00),
            isSponsored: true,
            rating: DSMiniProductCardRating(rating: 4.7, reviewCount: 445)
        )
    )
    .padding()
}

#Preview("No Rating") {
    DSMiniProductCard(
        data: DSMiniProductCardData(
            productName: "Werner 6 ft. Fiberglass Step Ladder",
            price: .standard(dollars: 89, cents: 97)
        )
    )
    .padding()
}

#Preview("Long Product Name") {
    DSMiniProductCard(
        data: DSMiniProductCardData(
            productName: "DEWALT 20V MAX XR Brushless Cordless Hammer Drill/Driver with POWER DETECT Tool Technology Kit",
            price: .sale(dollars: 199, cents: 00, originalDollars: 279, originalCents: 00),
            badge: .sale(),
            rating: DSMiniProductCardRating(rating: 4.9, reviewCount: 3456)
        )
    )
    .padding()
}

#Preview("Carousel Layout") {
    ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 12) {
            DSMiniProductCard(
                data: DSMiniProductCardData(
                    productName: "Product 1",
                    price: .standard(dollars: 49, cents: 99),
                    badge: .sale(),
                    rating: DSMiniProductCardRating(rating: 4.5, reviewCount: 100)
                )
            )

            DSMiniProductCard(
                data: DSMiniProductCardData(
                    productName: "Product 2",
                    price: .standard(dollars: 79, cents: 00),
                    badge: .new(),
                    rating: DSMiniProductCardRating(rating: 4.0, reviewCount: 50)
                )
            )

            DSMiniProductCard(
                data: DSMiniProductCardData(
                    productName: "Product 3",
                    price: .sale(dollars: 29, cents: 99, originalDollars: 39, originalCents: 99),
                    badge: .exclusive(),
                    rating: DSMiniProductCardRating(rating: 4.8, reviewCount: 200)
                )
            )

            DSMiniProductCard(
                data: DSMiniProductCardData(
                    productName: "Product 4",
                    price: .standard(dollars: 149, cents: 00),
                    rating: DSMiniProductCardRating(rating: 3.5, reviewCount: 75)
                )
            )
        }
        .padding()
    }
}
