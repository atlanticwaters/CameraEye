import SwiftUI

// MARK: - DSPLPPodDetailsResolvedStyle

/// Resolved style information for DSPLPPodDetails testing.
///
/// This struct captures computed styles as concrete values using token names,
/// enabling unit tests without view rendering or environment dependencies.
public struct DSPLPPodDetailsResolvedStyle: Equatable, Sendable {
    // MARK: - Product Info

    public let productNameColorTokenName: String
    public let modelNumberColorTokenName: String

    // MARK: - Pricing

    public let priceColorTokenName: String
    public let perUnitColorTokenName: String
    public let perItemDetailColorTokenName: String
    public let originalPriceColorTokenName: String
    public let savingsColorTokenName: String
    public let rebateTextColorTokenName: String

    // MARK: - Fulfillment

    public let fulfillmentPrimaryColorTokenName: String
    public let fulfillmentSecondaryColorTokenName: String
    public let unavailableTextColorTokenName: String

    // MARK: - Data

    public let hasModelNumber: Bool
    public let hasRating: Bool
    public let hasFulfillment: Bool
    public let showSpecialBuy: Bool

    // MARK: - Initializer

    public init(
        productNameColorTokenName: String,
        modelNumberColorTokenName: String,
        priceColorTokenName: String,
        perUnitColorTokenName: String,
        perItemDetailColorTokenName: String,
        originalPriceColorTokenName: String,
        savingsColorTokenName: String,
        rebateTextColorTokenName: String,
        fulfillmentPrimaryColorTokenName: String,
        fulfillmentSecondaryColorTokenName: String,
        unavailableTextColorTokenName: String,
        hasModelNumber: Bool,
        hasRating: Bool,
        hasFulfillment: Bool,
        showSpecialBuy: Bool
    ) {
        self.productNameColorTokenName = productNameColorTokenName
        self.modelNumberColorTokenName = modelNumberColorTokenName
        self.priceColorTokenName = priceColorTokenName
        self.perUnitColorTokenName = perUnitColorTokenName
        self.perItemDetailColorTokenName = perItemDetailColorTokenName
        self.originalPriceColorTokenName = originalPriceColorTokenName
        self.savingsColorTokenName = savingsColorTokenName
        self.rebateTextColorTokenName = rebateTextColorTokenName
        self.fulfillmentPrimaryColorTokenName = fulfillmentPrimaryColorTokenName
        self.fulfillmentSecondaryColorTokenName = fulfillmentSecondaryColorTokenName
        self.unavailableTextColorTokenName = unavailableTextColorTokenName
        self.hasModelNumber = hasModelNumber
        self.hasRating = hasRating
        self.hasFulfillment = hasFulfillment
        self.showSpecialBuy = showSpecialBuy
    }

    // MARK: - Factory

    /// Creates a resolved style for the given configuration.
    public static func create(
        hasModelNumber: Bool,
        hasRating: Bool,
        hasFulfillment: Bool,
        showSpecialBuy: Bool
    ) -> DSPLPPodDetailsResolvedStyle {
        return DSPLPPodDetailsResolvedStyle(
            productNameColorTokenName: DSPLPPodDetailsColorHelper.productNameColorTokenName(),
            modelNumberColorTokenName: DSPLPPodDetailsColorHelper.modelNumberColorTokenName(),
            priceColorTokenName: DSPLPPodDetailsColorHelper.priceColorTokenName(),
            perUnitColorTokenName: DSPLPPodDetailsColorHelper.perUnitColorTokenName(),
            perItemDetailColorTokenName: DSPLPPodDetailsColorHelper.perItemDetailColorTokenName(),
            originalPriceColorTokenName: DSPLPPodDetailsColorHelper.originalPriceColorTokenName(),
            savingsColorTokenName: DSPLPPodDetailsColorHelper.savingsColorTokenName(),
            rebateTextColorTokenName: DSPLPPodDetailsColorHelper.rebateTextColorTokenName(),
            fulfillmentPrimaryColorTokenName: DSPLPPodDetailsColorHelper.fulfillmentPrimaryColorTokenName(),
            fulfillmentSecondaryColorTokenName: DSPLPPodDetailsColorHelper.fulfillmentSecondaryColorTokenName(),
            unavailableTextColorTokenName: DSPLPPodDetailsColorHelper.unavailableTextColorTokenName(),
            hasModelNumber: hasModelNumber,
            hasRating: hasRating,
            hasFulfillment: hasFulfillment,
            showSpecialBuy: showSpecialBuy
        )
    }
}
