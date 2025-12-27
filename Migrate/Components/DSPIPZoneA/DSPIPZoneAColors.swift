import SwiftUI

// MARK: - DSPIPZoneAColorHelper

/// Helper for computing PIP Zone A colors based on theme.
enum DSPIPZoneAColorHelper {
    // MARK: - Background

    /// Returns the main background color.
    static func backgroundColor() -> Color {
        DSColor.containerBackgroundPrimary
    }

    static func backgroundColorTokenName() -> String {
        "containerBackgroundPrimary"
    }

    // MARK: - Breadcrumbs

    /// Returns the breadcrumb text color.
    static func breadcrumbColor() -> Color {
        DSColor.textOnSurfaceColorTertiary
    }

    static func breadcrumbColorTokenName() -> String {
        "textOnSurfaceColorTertiary"
    }

    /// Returns the active breadcrumb text color.
    static func breadcrumbActiveColor() -> Color {
        DSColor.textOnSurfaceColorPrimary
    }

    static func breadcrumbActiveColorTokenName() -> String {
        "textOnSurfaceColorPrimary"
    }

    /// Returns the breadcrumb separator color.
    static func breadcrumbSeparatorColor() -> Color {
        DSColor.iconColorTertiary
    }

    static func breadcrumbSeparatorColorTokenName() -> String {
        "iconColorTertiary"
    }

    // MARK: - Product Info

    /// Returns the brand text color.
    static func brandColor() -> Color {
        DSColor.textOnSurfaceColorSecondary
    }

    static func brandColorTokenName() -> String {
        "textOnSurfaceColorSecondary"
    }

    /// Returns the product name text color.
    static func productNameColor() -> Color {
        DSColor.textOnSurfaceColorPrimary
    }

    static func productNameColorTokenName() -> String {
        "textOnSurfaceColorPrimary"
    }

    /// Returns the model number text color.
    static func modelNumberColor() -> Color {
        DSColor.textOnSurfaceColorTertiary
    }

    static func modelNumberColorTokenName() -> String {
        "textOnSurfaceColorTertiary"
    }

    // MARK: - Badge Colors

    /// Returns the badge text color.
    static func badgeTextColor() -> Color {
        DSColor.textOnBrandColorPrimary
    }

    static func badgeTextColorTokenName() -> String {
        "textOnBrandColorPrimary"
    }

    /// Returns the special savings badge color.
    static func badgeSpecialSavingsColor() -> Color {
        DSColor.containerBackgroundSpecialSavings
    }

    static func badgeSpecialSavingsColorTokenName() -> String {
        "containerBackgroundSpecialSavings"
    }

    /// Returns the new arrival badge color.
    static func badgeNewArrivalColor() -> Color {
        DSColor.containerBackgroundInfo
    }

    static func badgeNewArrivalColorTokenName() -> String {
        "containerBackgroundInfo"
    }

    /// Returns the best seller badge color.
    static func badgeBestSellerColor() -> Color {
        DSColor.containerBackgroundWarning
    }

    static func badgeBestSellerColorTokenName() -> String {
        "containerBackgroundWarning"
    }

    /// Returns the top rated badge color.
    static func badgeTopRatedColor() -> Color {
        DSColor.containerBackgroundSuccess
    }

    static func badgeTopRatedColorTokenName() -> String {
        "containerBackgroundSuccess"
    }

    /// Returns the default badge color.
    static func badgeDefaultColor() -> Color {
        DSColor.containerBackgroundSecondary
    }

    static func badgeDefaultColorTokenName() -> String {
        "containerBackgroundSecondary"
    }

    // MARK: - Links

    /// Returns the link text color.
    static func linkColor() -> Color {
        DSColor.textOnSurfaceColorLink
    }

    static func linkColorTokenName() -> String {
        "textOnSurfaceColorLink"
    }

    // MARK: - Pricing

    /// Returns the price text color.
    static func priceColor() -> Color {
        DSColor.textOnSurfaceColorPrimary
    }

    static func priceColorTokenName() -> String {
        "textOnSurfaceColorPrimary"
    }

    /// Returns the pricing label color.
    static func pricingLabelColor() -> Color {
        DSColor.textOnSurfaceColorSecondary
    }

    static func pricingLabelColorTokenName() -> String {
        "textOnSurfaceColorSecondary"
    }

    /// Returns the original price (strikethrough) color.
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

    /// Returns the unit price text color.
    static func unitPriceColor() -> Color {
        DSColor.textOnSurfaceColorTertiary
    }

    static func unitPriceColorTokenName() -> String {
        "textOnSurfaceColorTertiary"
    }

    /// Returns the pricing badge color.
    static func pricingBadgeColor() -> Color {
        DSColor.textOnSurfaceColorWarning
    }

    static func pricingBadgeColorTokenName() -> String {
        "textOnSurfaceColorWarning"
    }

    // MARK: - Stock Status

    /// Returns the in-stock color.
    static func stockInStockColor() -> Color {
        DSColor.textOnSurfaceColorSuccess
    }

    static func stockInStockColorTokenName() -> String {
        "textOnSurfaceColorSuccess"
    }

    /// Returns the limited stock color.
    static func stockLimitedColor() -> Color {
        DSColor.textOnSurfaceColorWarning
    }

    static func stockLimitedColorTokenName() -> String {
        "textOnSurfaceColorWarning"
    }

    /// Returns the out of stock color.
    static func stockOutOfStockColor() -> Color {
        DSColor.textOnSurfaceColorError
    }

    static func stockOutOfStockColorTokenName() -> String {
        "textOnSurfaceColorError"
    }

    /// Returns the aisle location text color.
    static func aisleColor() -> Color {
        DSColor.textOnSurfaceColorSecondary
    }

    static func aisleColorTokenName() -> String {
        "textOnSurfaceColorSecondary"
    }

    /// Returns the store info background color.
    static func storeInfoBackgroundColor() -> Color {
        DSColor.containerBackgroundSecondary
    }

    static func storeInfoBackgroundColorTokenName() -> String {
        "containerBackgroundSecondary"
    }

    // MARK: - Fulfillment

    /// Returns the fulfillment icon color.
    static func fulfillmentIconColor() -> Color {
        DSColor.iconColorBrand
    }

    static func fulfillmentIconColorTokenName() -> String {
        "iconColorBrand"
    }

    /// Returns the fulfillment title color.
    static func fulfillmentTitleColor() -> Color {
        DSColor.textOnSurfaceColorPrimary
    }

    static func fulfillmentTitleColorTokenName() -> String {
        "textOnSurfaceColorPrimary"
    }

    /// Returns the fulfillment subtitle color.
    static func fulfillmentSubtitleColor() -> Color {
        DSColor.textOnSurfaceColorSuccess
    }

    static func fulfillmentSubtitleColorTokenName() -> String {
        "textOnSurfaceColorSuccess"
    }

    /// Returns the fulfillment location color.
    static func fulfillmentLocationColor() -> Color {
        DSColor.textOnSurfaceColorTertiary
    }

    static func fulfillmentLocationColorTokenName() -> String {
        "textOnSurfaceColorTertiary"
    }

    /// Returns the fulfillment disabled color.
    static func fulfillmentDisabledColor() -> Color {
        DSColor.textOnSurfaceColorDisabled
    }

    static func fulfillmentDisabledColorTokenName() -> String {
        "textOnSurfaceColorDisabled"
    }

    /// Returns the fulfillment tile background color.
    static func fulfillmentTileBackgroundColor() -> Color {
        DSColor.containerBackgroundPrimary
    }

    static func fulfillmentTileBackgroundColorTokenName() -> String {
        "containerBackgroundPrimary"
    }

    /// Returns the fulfillment tile border color.
    static func fulfillmentTileBorderColor() -> Color {
        DSColor.borderColorSecondary
    }

    static func fulfillmentTileBorderColorTokenName() -> String {
        "borderColorSecondary"
    }

    // MARK: - Buttons

    /// Returns the Add to Cart button color.
    static func addToCartButtonColor() -> Color {
        DSColor.containerBackgroundBrand
    }

    static func addToCartButtonColorTokenName() -> String {
        "containerBackgroundBrand"
    }

    /// Returns the secondary button text color.
    static func secondaryButtonTextColor() -> Color {
        DSColor.textOnSurfaceColorPrimary
    }

    static func secondaryButtonTextColorTokenName() -> String {
        "textOnSurfaceColorPrimary"
    }

    /// Returns the secondary button background color.
    static func secondaryButtonBackgroundColor() -> Color {
        DSColor.containerBackgroundPrimary
    }

    static func secondaryButtonBackgroundColorTokenName() -> String {
        "containerBackgroundPrimary"
    }

    /// Returns the secondary button border color.
    static func secondaryButtonBorderColor() -> Color {
        DSColor.borderColorPrimary
    }

    static func secondaryButtonBorderColorTokenName() -> String {
        "borderColorPrimary"
    }

    /// Returns the icon button color.
    static func iconButtonColor() -> Color {
        DSColor.iconColorPrimary
    }

    static func iconButtonColorTokenName() -> String {
        "iconColorPrimary"
    }
}
