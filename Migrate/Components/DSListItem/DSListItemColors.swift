import SwiftUI

// MARK: - DSListItemColorHelper

/// Helper for computing list item colors.
public enum DSListItemColorHelper {
    // MARK: - List Item Colors

    /// Returns the text color for list items.
    public static func textColor() -> Color {
        DSColor.textOnSurfaceColorPrimary.resolve
    }

    /// Returns the text color token name for testing.
    public static func textColorTokenName() -> String {
        "textOnSurfaceColorPrimary"
    }

    /// Returns the icon color for list items.
    public static func iconColor() -> Color {
        DSColor.iconColorSecondary.resolve
    }

    /// Returns the icon color token name for testing.
    public static func iconColorTokenName() -> String {
        "iconColorSecondary"
    }

    // MARK: - Menu Item Colors

    /// Returns the title color for menu items.
    public static func menuTitleColor() -> Color {
        DSColor.textOnSurfaceColorPrimary.resolve
    }

    /// Returns the menu title color token name for testing.
    public static func menuTitleColorTokenName() -> String {
        "textOnSurfaceColorPrimary"
    }

    /// Returns the subtitle color for menu items.
    public static func menuSubtitleColor() -> Color {
        DSColor.textOnSurfaceColorSecondary.resolve
    }

    /// Returns the menu subtitle color token name for testing.
    public static func menuSubtitleColorTokenName() -> String {
        "textOnSurfaceColorSecondary"
    }

    /// Returns the icon color for menu items.
    public static func menuIconColor() -> Color {
        DSColor.iconColorPrimary.resolve
    }

    /// Returns the menu icon color token name for testing.
    public static func menuIconColorTokenName() -> String {
        "iconColorPrimary"
    }

    /// Returns the background color for menu items.
    public static func menuBackgroundColor() -> Color {
        DSColor.containerBackgroundPrimary.resolve
    }

    /// Returns the menu background color token name for testing.
    public static func menuBackgroundColorTokenName() -> String {
        "containerBackgroundPrimary"
    }

    /// Returns the border color for menu items.
    public static func menuBorderColor() -> Color {
        DSColor.borderColorPrimary.resolve
    }

    /// Returns the menu border color token name for testing.
    public static func menuBorderColorTokenName() -> String {
        "borderColorPrimary"
    }

    /// Returns the selected border color for menu items.
    public static func menuSelectedBorderColor() -> Color {
        DSColor.borderColorBrand.resolve
    }

    /// Returns the menu selected border color token name for testing.
    public static func menuSelectedBorderColorTokenName() -> String {
        "borderColorBrand"
    }

    /// Returns the media background color for menu items.
    public static func mediaBackgroundColor() -> Color {
        DSColor.containerBackgroundSecondary.resolve
    }

    /// Returns the media background color token name for testing.
    public static func mediaBackgroundColorTokenName() -> String {
        "containerBackgroundSecondary"
    }
}
