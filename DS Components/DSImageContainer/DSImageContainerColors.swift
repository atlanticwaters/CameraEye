import SwiftUI

// MARK: - DSImageContainerColorHelper

/// Helper for computing image container colors based on theme.
enum DSImageContainerColorHelper {
    // MARK: - Background

    /// Returns the background color for the image container.
    static func backgroundColor() -> Color {
        DSColor.containerBackgroundTransparent05.resolve
    }

    /// Returns the background color token name for testing.
    static func backgroundColorTokenName() -> String {
        "containerBackgroundTransparent05"
    }

    // MARK: - Border

    /// Returns the border color for the image container.
    static func borderColor() -> Color {
        return DSColor.borderColorTransparent10.resolve
    }

    /// Returns the border color token name for testing.
    static func borderColorTokenName() -> String {
        "borderColorTransparent10"
    }

    // MARK: - Placeholder Icon

    /// Returns the placeholder icon color.
    static func placeholderIconColor() -> Color {
        DSColor.textOnSurfaceColorTertiary.resolve
    }

    /// Returns the placeholder icon color token name for testing.
    static func placeholderIconColorTokenName() -> String {
        "textOnSurfaceColorTertiary"
    }
}
