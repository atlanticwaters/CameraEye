import SwiftUI

// MARK: - DSPLPPodButtonSetColorHelper

/// Helper for computing PLP Pod Button Set colors based on theme.
enum DSPLPPodButtonSetColorHelper {
    // MARK: - Quantity Picker

    /// Returns the quantity picker background color.
    static func quantityPickerBackgroundColor() -> Color {
        DSColor.containerBackgroundSecondary
    }

    static func quantityPickerBackgroundColorTokenName() -> String {
        "containerBackgroundSecondary"
    }

    /// Returns the quantity button background color.
    static func quantityButtonBackgroundColor() -> Color {
        DSColor.containerBackgroundPrimary
    }

    static func quantityButtonBackgroundColorTokenName() -> String {
        "containerBackgroundPrimary"
    }

    /// Returns the quantity button icon color.
    static func quantityButtonIconColor() -> Color {
        DSColor.iconColorPrimary
    }

    static func quantityButtonIconColorTokenName() -> String {
        "iconColorPrimary"
    }

    /// Returns the quantity button disabled color.
    static func quantityButtonDisabledColor() -> Color {
        DSColor.iconColorDisabled
    }

    static func quantityButtonDisabledColorTokenName() -> String {
        "iconColorDisabled"
    }

    /// Returns the quantity text color.
    static func quantityTextColor() -> Color {
        DSColor.textOnSurfaceColorPrimary
    }

    static func quantityTextColorTokenName() -> String {
        "textOnSurfaceColorPrimary"
    }

    // MARK: - Add to Cart Button

    /// Returns the add to cart button background color.
    static func addToCartBackgroundColor() -> Color {
        DSColor.containerBackgroundBrand
    }

    static func addToCartBackgroundColorTokenName() -> String {
        "containerBackgroundBrand"
    }

    /// Returns the add to cart button text color.
    static func addToCartTextColor() -> Color {
        DSColor.textOnBrandColorPrimary
    }

    static func addToCartTextColorTokenName() -> String {
        "textOnBrandColorPrimary"
    }

    // MARK: - Add to List Button

    /// Returns the add to list button background color.
    static func addToListBackgroundColor() -> Color {
        DSColor.containerBackgroundPrimary
    }

    static func addToListBackgroundColorTokenName() -> String {
        "containerBackgroundPrimary"
    }

    /// Returns the add to list button text color.
    static func addToListTextColor() -> Color {
        DSColor.textOnSurfaceColorPrimary
    }

    static func addToListTextColorTokenName() -> String {
        "textOnSurfaceColorPrimary"
    }

    /// Returns the add to list button border color.
    static func addToListBorderColor() -> Color {
        DSColor.borderColorPrimary
    }

    static func addToListBorderColorTokenName() -> String {
        "borderColorPrimary"
    }

    // MARK: - Disabled States

    /// Returns the disabled button background color.
    static func buttonDisabledBackgroundColor() -> Color {
        DSColor.containerBackgroundDisabled
    }

    static func buttonDisabledBackgroundColorTokenName() -> String {
        "containerBackgroundDisabled"
    }

    /// Returns the disabled button text color.
    static func buttonDisabledTextColor() -> Color {
        DSColor.textOnSurfaceColorDisabled
    }

    static func buttonDisabledTextColorTokenName() -> String {
        "textOnSurfaceColorDisabled"
    }

    /// Returns the disabled button border color.
    static func buttonDisabledBorderColor() -> Color {
        DSColor.borderColorDisabled
    }

    static func buttonDisabledBorderColorTokenName() -> String {
        "borderColorDisabled"
    }
}
