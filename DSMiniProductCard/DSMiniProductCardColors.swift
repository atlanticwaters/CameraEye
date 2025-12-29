import SwiftUI

// MARK: - DSMiniProductCardColorHelper

/// Helper for computing mini product card colors.
public enum DSMiniProductCardColorHelper {
    // MARK: - Background

    /// Returns the background color for the card.
    public static func backgroundColor() -> Color {
        DSColor.containerBackgroundPrimary.resolve
    }

    /// Returns the background color token name for testing.
    public static func backgroundColorTokenName() -> String {
        "containerBackgroundPrimary"
    }

    // MARK: - Placeholder

    /// Returns the placeholder background color.
    public static func placeholderBackgroundColor() -> Color {
        DSColor.containerBackgroundSecondary.resolve
    }

    /// Returns the placeholder background color token name for testing.
    public static func placeholderBackgroundColorTokenName() -> String {
        "containerBackgroundSecondary"
    }

    // MARK: - Product Name

    /// Returns the product name text color.
    public static func productNameColor() -> Color {
        DSColor.textOnSurfaceColorPrimary.resolve
    }

    /// Returns the product name color token name for testing.
    public static func productNameColorTokenName() -> String {
        "textOnSurfaceColorPrimary"
    }

    // MARK: - Price

    /// Returns the primary price text color.
    public static func priceColor() -> Color {
        DSColor.textOnSurfaceColorPrimary.resolve
    }

    /// Returns the price color token name for testing.
    public static func priceColorTokenName() -> String {
        "textOnSurfaceColorPrimary"
    }

    /// Returns the sale price text color.
    public static func salePriceColor() -> Color {
        DSColor.textOnSurfaceColorDanger.resolve
    }

    /// Returns the sale price color token name for testing.
    public static func salePriceColorTokenName() -> String {
        "textOnSurfaceColorDanger"
    }

    /// Returns the secondary price text color (original price, prefix).
    public static func priceSecondaryColor() -> Color {
        DSColor.textOnSurfaceColorSecondary.resolve
    }

    /// Returns the price secondary color token name for testing.
    public static func priceSecondaryColorTokenName() -> String {
        "textOnSurfaceColorSecondary"
    }

    // MARK: - Rating

    /// Returns the star color.
    public static func starColor() -> Color {
        DSColor.iconColorBrand.resolve
    }

    /// Returns the star color token name for testing.
    public static func starColorTokenName() -> String {
        "iconColorBrand"
    }

    /// Returns the review count text color.
    public static func reviewCountColor() -> Color {
        DSColor.textOnSurfaceColorSecondary.resolve
    }

    /// Returns the review count color token name for testing.
    public static func reviewCountColorTokenName() -> String {
        "textOnSurfaceColorSecondary"
    }

    // MARK: - Sponsored

    /// Returns the sponsored text color.
    public static func sponsoredTextColor() -> Color {
        DSColor.textOnSurfaceColorSecondary.resolve
    }

    /// Returns the sponsored text color token name for testing.
    public static func sponsoredTextColorTokenName() -> String {
        "textOnSurfaceColorSecondary"
    }

    /// Returns the sponsored background color.
    public static func sponsoredBackgroundColor() -> Color {
        DSColor.containerBackgroundPrimary.resolve.opacity(0.9)
    }

    /// Returns the sponsored background color token name for testing.
    public static func sponsoredBackgroundColorTokenName() -> String {
        "containerBackgroundPrimary"
    }
}
