import SwiftUI

// MARK: - DSShareSheetColorHelper

/// Helper for computing share sheet colors.
public enum DSShareSheetColorHelper {
    // MARK: - Background

    /// Returns the background color for the sheet.
    public static func backgroundColor() -> Color {
        DSColor.backgroundSurfaceColorSecondary.resolve
    }

    /// Returns the background color token name for testing.
    public static func backgroundColorTokenName() -> String {
        "backgroundSurfaceColorSecondary"
    }

    // MARK: - Handle

    /// Returns the drag handle color.
    public static func handleColor() -> Color {
        DSColor.borderOnContainerInactive.resolve
    }

    /// Returns the handle color token name for testing.
    public static func handleColorTokenName() -> String {
        "borderOnContainerInactive"
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

    // MARK: - Share Action

    /// Returns the share action background color.
    public static func shareActionBackgroundColor() -> Color {
        DSColor.backgroundSurfaceColorTertiary.resolve
    }

    /// Returns the share action background color token name for testing.
    public static func shareActionBackgroundColorTokenName() -> String {
        "backgroundSurfaceColorTertiary"
    }

    /// Returns the share action icon color.
    public static func shareActionIconColor() -> Color {
        DSColor.textOnSurfaceColorPrimary.resolve
    }

    /// Returns the share action icon color token name for testing.
    public static func shareActionIconColorTokenName() -> String {
        "textOnSurfaceColorPrimary"
    }

    /// Returns the share action label color.
    public static func shareActionLabelColor() -> Color {
        DSColor.textOnSurfaceColorPrimary.resolve
    }

    /// Returns the share action label color token name for testing.
    public static func shareActionLabelColorTokenName() -> String {
        "textOnSurfaceColorPrimary"
    }

    // MARK: - Action Row

    /// Returns the action row icon color.
    public static func actionRowIconColor() -> Color {
        DSColor.textOnSurfaceColorPrimary.resolve
    }

    /// Returns the action row icon color token name for testing.
    public static func actionRowIconColorTokenName() -> String {
        "textOnSurfaceColorPrimary"
    }

    /// Returns the action row label color.
    public static func actionRowLabelColor() -> Color {
        DSColor.textOnSurfaceColorPrimary.resolve
    }

    /// Returns the action row label color token name for testing.
    public static func actionRowLabelColorTokenName() -> String {
        "textOnSurfaceColorPrimary"
    }

    // MARK: - Destructive

    /// Returns the destructive action color.
    public static func destructiveColor() -> Color {
        DSColor.textOnSurfaceColorError.resolve
    }

    /// Returns the destructive color token name for testing.
    public static func destructiveColorTokenName() -> String {
        "textOnSurfaceColorError"
    }
}
