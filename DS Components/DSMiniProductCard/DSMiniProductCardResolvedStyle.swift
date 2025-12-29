import SwiftUI

// MARK: - DSMiniProductCardResolvedStyle

/// Resolved style information for DSMiniProductCard testing.
///
/// This struct captures computed styles as concrete values using token names,
/// enabling unit tests without view rendering or environment dependencies.
public struct DSMiniProductCardResolvedStyle: Equatable, Sendable {
    // MARK: - Colors

    public let backgroundColorTokenName: String
    public let placeholderBackgroundColorTokenName: String
    public let productNameColorTokenName: String
    public let priceColorTokenName: String
    public let salePriceColorTokenName: String
    public let priceSecondaryColorTokenName: String
    public let starColorTokenName: String
    public let reviewCountColorTokenName: String
    public let sponsoredTextColorTokenName: String
    public let sponsoredBackgroundColorTokenName: String

    // MARK: - Data

    public let productName: String
    public let formattedPrice: String
    public let originalPrice: String?
    public let pricePrefix: String?
    public let badgeText: String?
    public let rating: Double?
    public let reviewCount: Int?
    public let isSponsored: Bool
    public let isSalePrice: Bool

    // MARK: - Initializer

    public init(
        backgroundColorTokenName: String,
        placeholderBackgroundColorTokenName: String,
        productNameColorTokenName: String,
        priceColorTokenName: String,
        salePriceColorTokenName: String,
        priceSecondaryColorTokenName: String,
        starColorTokenName: String,
        reviewCountColorTokenName: String,
        sponsoredTextColorTokenName: String,
        sponsoredBackgroundColorTokenName: String,
        productName: String,
        formattedPrice: String,
        originalPrice: String?,
        pricePrefix: String?,
        badgeText: String?,
        rating: Double?,
        reviewCount: Int?,
        isSponsored: Bool,
        isSalePrice: Bool
    ) {
        self.backgroundColorTokenName = backgroundColorTokenName
        self.placeholderBackgroundColorTokenName = placeholderBackgroundColorTokenName
        self.productNameColorTokenName = productNameColorTokenName
        self.priceColorTokenName = priceColorTokenName
        self.salePriceColorTokenName = salePriceColorTokenName
        self.priceSecondaryColorTokenName = priceSecondaryColorTokenName
        self.starColorTokenName = starColorTokenName
        self.reviewCountColorTokenName = reviewCountColorTokenName
        self.sponsoredTextColorTokenName = sponsoredTextColorTokenName
        self.sponsoredBackgroundColorTokenName = sponsoredBackgroundColorTokenName
        self.productName = productName
        self.formattedPrice = formattedPrice
        self.originalPrice = originalPrice
        self.pricePrefix = pricePrefix
        self.badgeText = badgeText
        self.rating = rating
        self.reviewCount = reviewCount
        self.isSponsored = isSponsored
        self.isSalePrice = isSalePrice
    }

    // MARK: - Factory

    /// Creates a resolved style for the given data.
    public static func create(data: DSMiniProductCardData) -> DSMiniProductCardResolvedStyle {
        let isSalePrice: Bool
        switch data.price {
        case .sale:
            isSalePrice = true
        default:
            isSalePrice = false
        }

        return DSMiniProductCardResolvedStyle(
            backgroundColorTokenName: DSMiniProductCardColorHelper.backgroundColorTokenName(),
            placeholderBackgroundColorTokenName: DSMiniProductCardColorHelper.placeholderBackgroundColorTokenName(),
            productNameColorTokenName: DSMiniProductCardColorHelper.productNameColorTokenName(),
            priceColorTokenName: DSMiniProductCardColorHelper.priceColorTokenName(),
            salePriceColorTokenName: DSMiniProductCardColorHelper.salePriceColorTokenName(),
            priceSecondaryColorTokenName: DSMiniProductCardColorHelper.priceSecondaryColorTokenName(),
            starColorTokenName: DSMiniProductCardColorHelper.starColorTokenName(),
            reviewCountColorTokenName: DSMiniProductCardColorHelper.reviewCountColorTokenName(),
            sponsoredTextColorTokenName: DSMiniProductCardColorHelper.sponsoredTextColorTokenName(),
            sponsoredBackgroundColorTokenName: DSMiniProductCardColorHelper.sponsoredBackgroundColorTokenName(),
            productName: data.productName,
            formattedPrice: data.price.formattedPrice,
            originalPrice: data.price.originalPrice,
            pricePrefix: data.price.prefix,
            badgeText: data.badge?.text,
            rating: data.rating?.rating,
            reviewCount: data.rating?.reviewCount,
            isSponsored: data.isSponsored,
            isSalePrice: isSalePrice
        )
    }
}
