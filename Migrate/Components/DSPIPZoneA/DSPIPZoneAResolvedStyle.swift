import SwiftUI

// MARK: - DSPIPZoneAResolvedStyle

/// Resolved style information for DSPIPZoneA testing.
///
/// This struct captures computed styles as concrete values using token names,
/// enabling unit tests without view rendering or environment dependencies.
public struct DSPIPZoneAResolvedStyle: Equatable, Sendable {
    // MARK: - Background

    public let backgroundColorTokenName: String

    // MARK: - Breadcrumbs

    public let breadcrumbColorTokenName: String
    public let breadcrumbActiveColorTokenName: String
    public let breadcrumbSeparatorColorTokenName: String

    // MARK: - Product Info

    public let brandColorTokenName: String
    public let productNameColorTokenName: String
    public let modelNumberColorTokenName: String

    // MARK: - Badge

    public let badgeTextColorTokenName: String
    public let badgeBackgroundColorTokenName: String

    // MARK: - Pricing

    public let priceColorTokenName: String
    public let pricingLabelColorTokenName: String
    public let originalPriceColorTokenName: String
    public let savingsColorTokenName: String
    public let unitPriceColorTokenName: String

    // MARK: - Stock Status

    public let stockStatusColorTokenName: String
    public let aisleColorTokenName: String
    public let storeInfoBackgroundColorTokenName: String

    // MARK: - Fulfillment

    public let fulfillmentIconColorTokenName: String
    public let fulfillmentTitleColorTokenName: String
    public let fulfillmentSubtitleColorTokenName: String
    public let fulfillmentTileBackgroundColorTokenName: String
    public let fulfillmentTileBorderColorTokenName: String

    // MARK: - Buttons

    public let addToCartButtonColorTokenName: String
    public let secondaryButtonTextColorTokenName: String
    public let secondaryButtonBackgroundColorTokenName: String
    public let secondaryButtonBorderColorTokenName: String
    public let iconButtonColorTokenName: String

    // MARK: - Data

    public let hasRating: Bool
    public let hasStoreInfo: Bool
    public let hasFulfillmentInfo: Bool
    public let breadcrumbCount: Int
    public let imageCount: Int

    // MARK: - Initializer

    public init(
        backgroundColorTokenName: String,
        breadcrumbColorTokenName: String,
        breadcrumbActiveColorTokenName: String,
        breadcrumbSeparatorColorTokenName: String,
        brandColorTokenName: String,
        productNameColorTokenName: String,
        modelNumberColorTokenName: String,
        badgeTextColorTokenName: String,
        badgeBackgroundColorTokenName: String,
        priceColorTokenName: String,
        pricingLabelColorTokenName: String,
        originalPriceColorTokenName: String,
        savingsColorTokenName: String,
        unitPriceColorTokenName: String,
        stockStatusColorTokenName: String,
        aisleColorTokenName: String,
        storeInfoBackgroundColorTokenName: String,
        fulfillmentIconColorTokenName: String,
        fulfillmentTitleColorTokenName: String,
        fulfillmentSubtitleColorTokenName: String,
        fulfillmentTileBackgroundColorTokenName: String,
        fulfillmentTileBorderColorTokenName: String,
        addToCartButtonColorTokenName: String,
        secondaryButtonTextColorTokenName: String,
        secondaryButtonBackgroundColorTokenName: String,
        secondaryButtonBorderColorTokenName: String,
        iconButtonColorTokenName: String,
        hasRating: Bool,
        hasStoreInfo: Bool,
        hasFulfillmentInfo: Bool,
        breadcrumbCount: Int,
        imageCount: Int
    ) {
        self.backgroundColorTokenName = backgroundColorTokenName
        self.breadcrumbColorTokenName = breadcrumbColorTokenName
        self.breadcrumbActiveColorTokenName = breadcrumbActiveColorTokenName
        self.breadcrumbSeparatorColorTokenName = breadcrumbSeparatorColorTokenName
        self.brandColorTokenName = brandColorTokenName
        self.productNameColorTokenName = productNameColorTokenName
        self.modelNumberColorTokenName = modelNumberColorTokenName
        self.badgeTextColorTokenName = badgeTextColorTokenName
        self.badgeBackgroundColorTokenName = badgeBackgroundColorTokenName
        self.priceColorTokenName = priceColorTokenName
        self.pricingLabelColorTokenName = pricingLabelColorTokenName
        self.originalPriceColorTokenName = originalPriceColorTokenName
        self.savingsColorTokenName = savingsColorTokenName
        self.unitPriceColorTokenName = unitPriceColorTokenName
        self.stockStatusColorTokenName = stockStatusColorTokenName
        self.aisleColorTokenName = aisleColorTokenName
        self.storeInfoBackgroundColorTokenName = storeInfoBackgroundColorTokenName
        self.fulfillmentIconColorTokenName = fulfillmentIconColorTokenName
        self.fulfillmentTitleColorTokenName = fulfillmentTitleColorTokenName
        self.fulfillmentSubtitleColorTokenName = fulfillmentSubtitleColorTokenName
        self.fulfillmentTileBackgroundColorTokenName = fulfillmentTileBackgroundColorTokenName
        self.fulfillmentTileBorderColorTokenName = fulfillmentTileBorderColorTokenName
        self.addToCartButtonColorTokenName = addToCartButtonColorTokenName
        self.secondaryButtonTextColorTokenName = secondaryButtonTextColorTokenName
        self.secondaryButtonBackgroundColorTokenName = secondaryButtonBackgroundColorTokenName
        self.secondaryButtonBorderColorTokenName = secondaryButtonBorderColorTokenName
        self.iconButtonColorTokenName = iconButtonColorTokenName
        self.hasRating = hasRating
        self.hasStoreInfo = hasStoreInfo
        self.hasFulfillmentInfo = hasFulfillmentInfo
        self.breadcrumbCount = breadcrumbCount
        self.imageCount = imageCount
    }

    // MARK: - Factory

    /// Creates a resolved style for the given configuration.
    public static func create(
        badgeType: DSPIPBadge.BadgeType?,
        stockStatus: DSPIPStoreInfo.StockStatus?,
        hasRating: Bool,
        hasStoreInfo: Bool,
        hasFulfillmentInfo: Bool,
        breadcrumbCount: Int,
        imageCount: Int
    ) -> DSPIPZoneAResolvedStyle {
        let badgeBackgroundTokenName: String
        switch badgeType {
        case .specialSavings:
            badgeBackgroundTokenName = DSPIPZoneAColorHelper.badgeSpecialSavingsColorTokenName()
        case .newArrival:
            badgeBackgroundTokenName = DSPIPZoneAColorHelper.badgeNewArrivalColorTokenName()
        case .bestSeller:
            badgeBackgroundTokenName = DSPIPZoneAColorHelper.badgeBestSellerColorTokenName()
        case .topRated:
            badgeBackgroundTokenName = DSPIPZoneAColorHelper.badgeTopRatedColorTokenName()
        case .custom, .none:
            badgeBackgroundTokenName = DSPIPZoneAColorHelper.badgeDefaultColorTokenName()
        }

        let stockStatusTokenName: String
        switch stockStatus {
        case .inStock:
            stockStatusTokenName = DSPIPZoneAColorHelper.stockInStockColorTokenName()
        case .limitedStock:
            stockStatusTokenName = DSPIPZoneAColorHelper.stockLimitedColorTokenName()
        case .outOfStock, .checkNearbyStores:
            stockStatusTokenName = DSPIPZoneAColorHelper.stockOutOfStockColorTokenName()
        case .none:
            stockStatusTokenName = DSPIPZoneAColorHelper.stockInStockColorTokenName()
        }

        return DSPIPZoneAResolvedStyle(
            backgroundColorTokenName: DSPIPZoneAColorHelper.backgroundColorTokenName(),
            breadcrumbColorTokenName: DSPIPZoneAColorHelper.breadcrumbColorTokenName(),
            breadcrumbActiveColorTokenName: DSPIPZoneAColorHelper.breadcrumbActiveColorTokenName(),
            breadcrumbSeparatorColorTokenName: DSPIPZoneAColorHelper.breadcrumbSeparatorColorTokenName(),
            brandColorTokenName: DSPIPZoneAColorHelper.brandColorTokenName(),
            productNameColorTokenName: DSPIPZoneAColorHelper.productNameColorTokenName(),
            modelNumberColorTokenName: DSPIPZoneAColorHelper.modelNumberColorTokenName(),
            badgeTextColorTokenName: DSPIPZoneAColorHelper.badgeTextColorTokenName(),
            badgeBackgroundColorTokenName: badgeBackgroundTokenName,
            priceColorTokenName: DSPIPZoneAColorHelper.priceColorTokenName(),
            pricingLabelColorTokenName: DSPIPZoneAColorHelper.pricingLabelColorTokenName(),
            originalPriceColorTokenName: DSPIPZoneAColorHelper.originalPriceColorTokenName(),
            savingsColorTokenName: DSPIPZoneAColorHelper.savingsColorTokenName(),
            unitPriceColorTokenName: DSPIPZoneAColorHelper.unitPriceColorTokenName(),
            stockStatusColorTokenName: stockStatusTokenName,
            aisleColorTokenName: DSPIPZoneAColorHelper.aisleColorTokenName(),
            storeInfoBackgroundColorTokenName: DSPIPZoneAColorHelper.storeInfoBackgroundColorTokenName(),
            fulfillmentIconColorTokenName: DSPIPZoneAColorHelper.fulfillmentIconColorTokenName(),
            fulfillmentTitleColorTokenName: DSPIPZoneAColorHelper.fulfillmentTitleColorTokenName(),
            fulfillmentSubtitleColorTokenName: DSPIPZoneAColorHelper.fulfillmentSubtitleColorTokenName(),
            fulfillmentTileBackgroundColorTokenName: DSPIPZoneAColorHelper.fulfillmentTileBackgroundColorTokenName(),
            fulfillmentTileBorderColorTokenName: DSPIPZoneAColorHelper.fulfillmentTileBorderColorTokenName(),
            addToCartButtonColorTokenName: DSPIPZoneAColorHelper.addToCartButtonColorTokenName(),
            secondaryButtonTextColorTokenName: DSPIPZoneAColorHelper.secondaryButtonTextColorTokenName(),
            secondaryButtonBackgroundColorTokenName: DSPIPZoneAColorHelper.secondaryButtonBackgroundColorTokenName(),
            secondaryButtonBorderColorTokenName: DSPIPZoneAColorHelper.secondaryButtonBorderColorTokenName(),
            iconButtonColorTokenName: DSPIPZoneAColorHelper.iconButtonColorTokenName(),
            hasRating: hasRating,
            hasStoreInfo: hasStoreInfo,
            hasFulfillmentInfo: hasFulfillmentInfo,
            breadcrumbCount: breadcrumbCount,
            imageCount: imageCount
        )
    }
}
