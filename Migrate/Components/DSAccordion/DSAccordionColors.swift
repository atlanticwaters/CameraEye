import SwiftUI

// MARK: - DSAccordionColorHelper

/// Helper for computing accordion colors based on style and state.
public enum DSAccordionColorHelper {
    // MARK: - Background

    /// Returns the background color for the accordion.
    public static func backgroundColor(isBorderless: Bool) -> Color {
        isBorderless ? .clear : DSColor.containerBackgroundPrimary.resolve
    }

    /// Returns the background color token name for testing.
    public static func backgroundColorTokenName(isBorderless: Bool) -> String {
        isBorderless ? "clear" : "containerBackgroundPrimary"
    }

    // MARK: - Title

    /// Returns the title text color.
    public static func titleColor() -> Color {
        DSColor.textOnSurfaceColorPrimary.resolve
    }

    /// Returns the title color token name for testing.
    public static func titleColorTokenName() -> String {
        "textOnSurfaceColorPrimary"
    }

    // MARK: - Subtitle

    /// Returns the subtitle text color.
    public static func subtitleColor() -> Color {
        DSColor.textOnSurfaceColorSecondary.resolve
    }

    /// Returns the subtitle color token name for testing.
    public static func subtitleColorTokenName() -> String {
        "textOnSurfaceColorSecondary"
    }

    // MARK: - Icon

    /// Returns the icon color.
    public static func iconColor() -> Color {
        DSColor.textOnSurfaceColorSecondary.resolve
    }

    /// Returns the icon color token name for testing.
    public static func iconColorTokenName() -> String {
        "textOnSurfaceColorSecondary"
    }

    // MARK: - Divider

    /// Returns the divider color.
    public static func dividerColor() -> Color {
        DSColor.textOnSurfaceColorTertiary.resolve
    }

    /// Returns the divider color token name for testing.
    public static func dividerColorTokenName() -> String {
        "textOnSurfaceColorTertiary"
    }

    // MARK: - Border

    /// Returns the border color.
    public static func borderColor() -> Color {
        DSColor.textOnSurfaceColorTertiary.resolve
    }

    /// Returns the border color token name for testing.
    public static func borderColorTokenName() -> String {
        "textOnSurfaceColorTertiary"
    }
}
