import SwiftUI

// MARK: - DSGalleryColorHelper

/// Helper for computing gallery colors based on theme.
enum DSGalleryColorHelper {
    // MARK: - Background

    /// Returns the main background color.
    static func backgroundColor() -> Color {
        DSColor.containerBackgroundPrimary
    }

    static func backgroundColorTokenName() -> String {
        "containerBackgroundPrimary"
    }

    // MARK: - Text Colors

    /// Returns the primary text color.
    static func textColor() -> Color {
        DSColor.textOnSurfaceColorPrimary
    }

    static func textColorTokenName() -> String {
        "textOnSurfaceColorPrimary"
    }

    /// Returns the secondary text color.
    static func secondaryTextColor() -> Color {
        DSColor.textOnSurfaceColorSecondary
    }

    static func secondaryTextColorTokenName() -> String {
        "textOnSurfaceColorSecondary"
    }

    // MARK: - Icon Colors

    /// Returns the icon color.
    static func iconColor() -> Color {
        DSColor.iconColorSecondary
    }

    static func iconColorTokenName() -> String {
        "iconColorSecondary"
    }

    // MARK: - Tab Colors

    /// Returns the selected tab color.
    static func selectedTabColor() -> Color {
        DSColor.textOnSurfaceColorPrimary
    }

    static func selectedTabColorTokenName() -> String {
        "textOnSurfaceColorPrimary"
    }

    /// Returns the unselected tab color.
    static func unselectedTabColor() -> Color {
        DSColor.textOnSurfaceColorTertiary
    }

    static func unselectedTabColorTokenName() -> String {
        "textOnSurfaceColorTertiary"
    }

    /// Returns the tab bar background color.
    static func tabBarBackground() -> Color {
        DSColor.containerBackgroundSecondary
    }

    static func tabBarBackgroundTokenName() -> String {
        "containerBackgroundSecondary"
    }

    // MARK: - Thumbnail Strip

    /// Returns the thumbnail strip background color.
    static func thumbnailStripBackground() -> Color {
        DSColor.containerBackgroundSecondary
    }

    static func thumbnailStripBackgroundTokenName() -> String {
        "containerBackgroundSecondary"
    }

    /// Returns the selected thumbnail border color.
    static func selectedBorderColor() -> Color {
        DSColor.borderColorPrimary
    }

    static func selectedBorderColorTokenName() -> String {
        "borderColorPrimary"
    }

    // MARK: - Placeholder

    /// Returns the placeholder background color.
    static func placeholderColor() -> Color {
        DSColor.containerBackgroundTransparent05
    }

    static func placeholderColorTokenName() -> String {
        "containerBackgroundTransparent05"
    }

    // MARK: - Button

    /// Returns the button background color.
    static func buttonColor() -> Color {
        DSColor.containerBackgroundBrand
    }

    static func buttonColorTokenName() -> String {
        "containerBackgroundBrand"
    }
}
