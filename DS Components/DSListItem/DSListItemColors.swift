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
        DSColor.textOnSurfaceColorSecondary.resolve
    }

    /// Returns the icon color token name for testing.
    public static func iconColorTokenName() -> String {
        "textOnSurfaceColorSecondary"
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
        DSColor.textOnSurfaceColorPrimary.resolve
    }

    /// Returns the menu icon color token name for testing.
    public static func menuIconColorTokenName() -> String {
        "textOnSurfaceColorPrimary"
    }

    /// Returns the background color for menu items.
    public static func menuBackgroundColor() -> Color {
        DSColor.backgroundSurfaceColorSecondary.resolve
    }

    /// Returns the menu background color token name for testing.
    public static func menuBackgroundColorTokenName() -> String {
        "backgroundSurfaceColorSecondary"
    }

    /// Returns the border color for menu items.
    public static func menuBorderColor() -> Color {
        DSColor.borderOnContainerDefault.resolve
    }

    /// Returns the menu border color token name for testing.
    public static func menuBorderColorTokenName() -> String {
        "borderOnContainerDefault"
    }

    /// Returns the selected border color for menu items.
    public static func menuSelectedBorderColor() -> Color {
        DSColor.inputBorderFocus.resolve
    }

    /// Returns the menu selected border color token name for testing.
    public static func menuSelectedBorderColorTokenName() -> String {
        "inputBorderFocus"
    }

    /// Returns the media background color for menu items.
    public static func mediaBackgroundColor() -> Color {
        DSColor.backgroundSurfaceColorTertiary.resolve
    }

    /// Returns the media background color token name for testing.
    public static func mediaBackgroundColorTokenName() -> String {
        "backgroundSurfaceColorTertiary"
    }
}
