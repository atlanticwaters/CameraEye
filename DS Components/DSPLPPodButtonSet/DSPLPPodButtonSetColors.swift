import SwiftUI

// MARK: - DSPLPPodButtonSetColorHelper

/// Helper for computing PLP Pod Button Set colors based on theme.
enum DSPLPPodButtonSetColorHelper {
    // MARK: - Quantity Picker

    /// Returns the quantity picker background color.
    static func quantityPickerBackgroundColor() -> Color {
        DSColor.backgroundSurfaceColorTertiary.resolve
    }

    static func quantityPickerBackgroundColorTokenName() -> String {
        "backgroundSurfaceColorTertiary"
    }

    /// Returns the quantity button background color.
    static func quantityButtonBackgroundColor() -> Color {
        DSColor.backgroundSurfaceColorSecondary.resolve
    }

    static func quantityButtonBackgroundColorTokenName() -> String {
        "backgroundSurfaceColorSecondary"
    }

    /// Returns the quantity button icon color.
    static func quantityButtonIconColor() -> Color {
        DSColor.textOnSurfaceColorPrimary.resolve
    }

    static func quantityButtonIconColorTokenName() -> String {
        "textOnSurfaceColorPrimary"
    }

    /// Returns the quantity button disabled color.
    static func quantityButtonDisabledColor() -> Color {
        DSColor.textOnSurfaceColorInactive.resolve
    }

    static func quantityButtonDisabledColorTokenName() -> String {
        "textOnSurfaceColorInactive"
    }

    /// Returns the quantity text color.
    static func quantityTextColor() -> Color {
        DSColor.textOnSurfaceColorPrimary.resolve
    }

    static func quantityTextColorTokenName() -> String {
        "textOnSurfaceColorPrimary"
    }

    // MARK: - Add to Cart Button

    /// Returns the add to cart button background color.
    static func addToCartBackgroundColor() -> Color {
        DSColor.containerBackgroundBrand.resolve
    }

    static func addToCartBackgroundColorTokenName() -> String {
        "containerBackgroundBrand"
    }

    /// Returns the add to cart button text color.
    static func addToCartTextColor() -> Color {
        DSColor.textOnContainerColorPrimary.resolve
    }

    static func addToCartTextColorTokenName() -> String {
        "textOnContainerColorPrimary"
    }

    // MARK: - Add to List Button

    /// Returns the add to list button background color.
    static func addToListBackgroundColor() -> Color {
        DSColor.backgroundSurfaceColorSecondary.resolve
    }

    static func addToListBackgroundColorTokenName() -> String {
        "backgroundSurfaceColorSecondary"
    }

    /// Returns the add to list button text color.
    static func addToListTextColor() -> Color {
        DSColor.textOnSurfaceColorPrimary.resolve
    }

    static func addToListTextColorTokenName() -> String {
        "textOnSurfaceColorPrimary"
    }

    /// Returns the add to list button border color.
    static func addToListBorderColor() -> Color {
        DSColor.borderOnContainerDefault.resolve
    }

    static func addToListBorderColorTokenName() -> String {
        "borderOnContainerDefault"
    }

    // MARK: - Disabled States

    /// Returns the disabled button background color.
    static func buttonDisabledBackgroundColor() -> Color {
        DSColor.backgroundSurfaceColorInverse.resolve
    }

    static func buttonDisabledBackgroundColorTokenName() -> String {
        "backgroundSurfaceColorInverse"
    }

    /// Returns the disabled button text color.
    static func buttonDisabledTextColor() -> Color {
        DSColor.textOnSurfaceColorInactive.resolve
    }

    static func buttonDisabledTextColorTokenName() -> String {
        "textOnSurfaceColorInactive"
    }

    /// Returns the disabled button border color.
    static func buttonDisabledBorderColor() -> Color {
        DSColor.borderOnContainerInactive.resolve
    }

    static func buttonDisabledBorderColorTokenName() -> String {
        "borderOnContainerInactive"
    }
}
