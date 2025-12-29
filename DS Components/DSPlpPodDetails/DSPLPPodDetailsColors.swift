import SwiftUI

// MARK: - DSPLPPodDetailsColorHelper

/// Helper for computing PLP Pod Details colors based on theme.
enum DSPLPPodDetailsColorHelper {
    // MARK: - Product Info

    /// Returns the product name color.
    static func productNameColor() -> Color {
        DSColor.textOnSurfaceColorPrimary.resolve
    }

    static func productNameColorTokenName() -> String {
        "textOnSurfaceColorPrimary"
    }

    /// Returns the model number color.
    static func modelNumberColor() -> Color {
        DSColor.textOnSurfaceColorTertiary.resolve
    }

    static func modelNumberColorTokenName() -> String {
        "textOnSurfaceColorTertiary"
    }

    // MARK: - Pricing

    /// Returns the price color.
    static func priceColor() -> Color {
        DSColor.textOnSurfaceColorPrimary.resolve
    }

    static func priceColorTokenName() -> String {
        "textOnSurfaceColorPrimary"
    }

    /// Returns the per unit text color.
    static func perUnitColor() -> Color {
        DSColor.textOnSurfaceColorSecondary.resolve
    }

    static func perUnitColorTokenName() -> String {
        "textOnSurfaceColorSecondary"
    }

    /// Returns the per item detail text color.
    static func perItemDetailColor() -> Color {
        DSColor.textOnSurfaceColorTertiary.resolve
    }

    static func perItemDetailColorTokenName() -> String {
        "textOnSurfaceColorTertiary"
    }

    /// Returns the starting at label color.
    static func startingAtLabelColor() -> Color {
        DSColor.textOnSurfaceColorSecondary.resolve
    }

    static func startingAtLabelColorTokenName() -> String {
        "textOnSurfaceColorSecondary"
    }

    /// Returns the original price color.
    static func originalPriceColor() -> Color {
        DSColor.textOnSurfaceColorTertiary.resolve
    }

    static func originalPriceColorTokenName() -> String {
        "textOnSurfaceColorTertiary"
    }

    /// Returns the savings text color.
    static func savingsColor() -> Color {
        DSColor.textOnSurfaceColorSuccess.resolve
    }

    static func savingsColorTokenName() -> String {
        "textOnSurfaceColorSuccess"
    }

    /// Returns the rebate text color.
    static func rebateTextColor() -> Color {
        DSColor.textOnSurfaceColorAccent.resolve
    }

    static func rebateTextColorTokenName() -> String {
        "textOnSurfaceColorAccent"
    }

    /// Returns the lower price text color.
    static func lowerPriceTextColor() -> Color {
        DSColor.textOnSurfaceColorAccent.resolve
    }

    static func lowerPriceTextColorTokenName() -> String {
        "textOnSurfaceColorAccent"
    }

    /// Returns the see lower price text color.
    static func seeLowerPriceColor() -> Color {
        DSColor.textOnSurfaceColorAccent.resolve
    }

    static func seeLowerPriceColorTokenName() -> String {
        "textOnSurfaceColorAccent"
    }

    /// Returns the contact store text color.
    static func contactStoreTextColor() -> Color {
        DSColor.textOnSurfaceColorSecondary.resolve
    }

    static func contactStoreTextColorTokenName() -> String {
        "textOnSurfaceColorSecondary"
    }

    // MARK: - Special Order

    /// Returns the warning icon color.
    static func warningIconColor() -> Color {
        DSColor.textOnSurfaceColorWarning.resolve
    }

    static func warningIconColorTokenName() -> String {
        "textOnSurfaceColorWarning"
    }

    /// Returns the special order header color.
    static func specialOrderHeaderColor() -> Color {
        DSColor.textOnSurfaceColorPrimary.resolve
    }

    static func specialOrderHeaderColorTokenName() -> String {
        "textOnSurfaceColorPrimary"
    }

    /// Returns the special order body color.
    static func specialOrderBodyColor() -> Color {
        DSColor.textOnSurfaceColorSecondary.resolve
    }

    static func specialOrderBodyColorTokenName() -> String {
        "textOnSurfaceColorSecondary"
    }

    /// Returns the phone number color.
    static func phoneNumberColor() -> Color {
        DSColor.textOnSurfaceColorAccent.resolve
    }

    static func phoneNumberColorTokenName() -> String {
        "textOnSurfaceColorAccent"
    }

    // MARK: - Consultation

    /// Returns the consultation text color.
    static func consultationTextColor() -> Color {
        DSColor.textOnSurfaceColorPrimary.resolve
    }

    static func consultationTextColorTokenName() -> String {
        "textOnSurfaceColorPrimary"
    }

    /// Returns the consultation subtitle color.
    static func consultationSubtitleColor() -> Color {
        DSColor.textOnSurfaceColorTertiary.resolve
    }

    static func consultationSubtitleColorTokenName() -> String {
        "textOnSurfaceColorTertiary"
    }

    // MARK: - Special Buy

    /// Returns the special buy badge color.
    static func specialBuyColor() -> Color {
        DSColor.textOnSurfaceColorWarning.resolve
    }

    static func specialBuyColorTokenName() -> String {
        "textOnSurfaceColorWarning"
    }

    // MARK: - Fulfillment

    /// Returns the fulfillment primary text color.
    static func fulfillmentPrimaryColor() -> Color {
        DSColor.textOnSurfaceColorPrimary.resolve
    }

    static func fulfillmentPrimaryColorTokenName() -> String {
        "textOnSurfaceColorPrimary"
    }

    /// Returns the fulfillment secondary text color.
    static func fulfillmentSecondaryColor() -> Color {
        DSColor.textOnSurfaceColorTertiary.resolve
    }

    static func fulfillmentSecondaryColorTokenName() -> String {
        "textOnSurfaceColorTertiary"
    }

    /// Returns the unavailable icon color.
    static func unavailableIconColor() -> Color {
        DSColor.textOnSurfaceColorError.resolve
    }

    static func unavailableIconColorTokenName() -> String {
        "textOnSurfaceColorError"
    }

    /// Returns the unavailable text color.
    static func unavailableTextColor() -> Color {
        DSColor.textOnSurfaceColorError.resolve
    }

    static func unavailableTextColorTokenName() -> String {
        "textOnSurfaceColorError"
    }
}
