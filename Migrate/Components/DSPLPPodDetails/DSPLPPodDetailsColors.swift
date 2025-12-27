import SwiftUI

// MARK: - DSPLPPodDetailsColorHelper

/// Helper for computing PLP Pod Details colors based on theme.
enum DSPLPPodDetailsColorHelper {
    // MARK: - Product Info

    /// Returns the product name color.
    static func productNameColor() -> Color {
        DSColor.textOnSurfaceColorPrimary
    }

    static func productNameColorTokenName() -> String {
        "textOnSurfaceColorPrimary"
    }

    /// Returns the model number color.
    static func modelNumberColor() -> Color {
        DSColor.textOnSurfaceColorTertiary
    }

    static func modelNumberColorTokenName() -> String {
        "textOnSurfaceColorTertiary"
    }

    // MARK: - Pricing

    /// Returns the price color.
    static func priceColor() -> Color {
        DSColor.textOnSurfaceColorPrimary
    }

    static func priceColorTokenName() -> String {
        "textOnSurfaceColorPrimary"
    }

    /// Returns the per unit text color.
    static func perUnitColor() -> Color {
        DSColor.textOnSurfaceColorSecondary
    }

    static func perUnitColorTokenName() -> String {
        "textOnSurfaceColorSecondary"
    }

    /// Returns the per item detail text color.
    static func perItemDetailColor() -> Color {
        DSColor.textOnSurfaceColorTertiary
    }

    static func perItemDetailColorTokenName() -> String {
        "textOnSurfaceColorTertiary"
    }

    /// Returns the starting at label color.
    static func startingAtLabelColor() -> Color {
        DSColor.textOnSurfaceColorSecondary
    }

    static func startingAtLabelColorTokenName() -> String {
        "textOnSurfaceColorSecondary"
    }

    /// Returns the original price color.
    static func originalPriceColor() -> Color {
        DSColor.textOnSurfaceColorTertiary
    }

    static func originalPriceColorTokenName() -> String {
        "textOnSurfaceColorTertiary"
    }

    /// Returns the savings text color.
    static func savingsColor() -> Color {
        DSColor.textOnSurfaceColorSuccess
    }

    static func savingsColorTokenName() -> String {
        "textOnSurfaceColorSuccess"
    }

    /// Returns the rebate text color.
    static func rebateTextColor() -> Color {
        DSColor.textOnSurfaceColorLink
    }

    static func rebateTextColorTokenName() -> String {
        "textOnSurfaceColorLink"
    }

    /// Returns the lower price text color.
    static func lowerPriceTextColor() -> Color {
        DSColor.textOnSurfaceColorLink
    }

    static func lowerPriceTextColorTokenName() -> String {
        "textOnSurfaceColorLink"
    }

    /// Returns the see lower price text color.
    static func seeLowerPriceColor() -> Color {
        DSColor.textOnSurfaceColorLink
    }

    static func seeLowerPriceColorTokenName() -> String {
        "textOnSurfaceColorLink"
    }

    /// Returns the contact store text color.
    static func contactStoreTextColor() -> Color {
        DSColor.textOnSurfaceColorSecondary
    }

    static func contactStoreTextColorTokenName() -> String {
        "textOnSurfaceColorSecondary"
    }

    // MARK: - Special Order

    /// Returns the warning icon color.
    static func warningIconColor() -> Color {
        DSColor.iconColorWarning
    }

    static func warningIconColorTokenName() -> String {
        "iconColorWarning"
    }

    /// Returns the special order header color.
    static func specialOrderHeaderColor() -> Color {
        DSColor.textOnSurfaceColorPrimary
    }

    static func specialOrderHeaderColorTokenName() -> String {
        "textOnSurfaceColorPrimary"
    }

    /// Returns the special order body color.
    static func specialOrderBodyColor() -> Color {
        DSColor.textOnSurfaceColorSecondary
    }

    static func specialOrderBodyColorTokenName() -> String {
        "textOnSurfaceColorSecondary"
    }

    /// Returns the phone number color.
    static func phoneNumberColor() -> Color {
        DSColor.textOnSurfaceColorLink
    }

    static func phoneNumberColorTokenName() -> String {
        "textOnSurfaceColorLink"
    }

    // MARK: - Consultation

    /// Returns the consultation text color.
    static func consultationTextColor() -> Color {
        DSColor.textOnSurfaceColorPrimary
    }

    static func consultationTextColorTokenName() -> String {
        "textOnSurfaceColorPrimary"
    }

    /// Returns the consultation subtitle color.
    static func consultationSubtitleColor() -> Color {
        DSColor.textOnSurfaceColorTertiary
    }

    static func consultationSubtitleColorTokenName() -> String {
        "textOnSurfaceColorTertiary"
    }

    // MARK: - Special Buy

    /// Returns the special buy badge color.
    static func specialBuyColor() -> Color {
        DSColor.iconColorWarning
    }

    static func specialBuyColorTokenName() -> String {
        "iconColorWarning"
    }

    // MARK: - Fulfillment

    /// Returns the fulfillment primary text color.
    static func fulfillmentPrimaryColor() -> Color {
        DSColor.textOnSurfaceColorPrimary
    }

    static func fulfillmentPrimaryColorTokenName() -> String {
        "textOnSurfaceColorPrimary"
    }

    /// Returns the fulfillment secondary text color.
    static func fulfillmentSecondaryColor() -> Color {
        DSColor.textOnSurfaceColorTertiary
    }

    static func fulfillmentSecondaryColorTokenName() -> String {
        "textOnSurfaceColorTertiary"
    }

    /// Returns the unavailable icon color.
    static func unavailableIconColor() -> Color {
        DSColor.iconColorError
    }

    static func unavailableIconColorTokenName() -> String {
        "iconColorError"
    }

    /// Returns the unavailable text color.
    static func unavailableTextColor() -> Color {
        DSColor.textOnSurfaceColorError
    }

    static func unavailableTextColorTokenName() -> String {
        "textOnSurfaceColorError"
    }
}
