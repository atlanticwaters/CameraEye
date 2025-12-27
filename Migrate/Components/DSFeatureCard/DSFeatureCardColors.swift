import SwiftUI

// MARK: - DSFeatureCardColorHelper

/// Helper for computing feature card colors based on theme.
enum DSFeatureCardColorHelper {
    // MARK: - Background

    /// Returns the background color for the feature card.
    static func backgroundColor() -> Color {
        DSColor.containerBackgroundPrimary
    }

    /// Returns the background color token name for testing.
    static func backgroundColorTokenName() -> String {
        "containerBackgroundPrimary"
    }

    // MARK: - Border

    /// Returns the border color for the feature card.
    static func borderColor() -> Color {
        DSColor.borderColorTransparent10
    }

    /// Returns the border color token name for testing.
    static func borderColorTokenName() -> String {
        "borderColorTransparent10"
    }

    // MARK: - Title

    /// Returns the title text color.
    static func titleColor() -> Color {
        DSColor.textOnSurfaceColorPrimary
    }

    /// Returns the title color token name for testing.
    static func titleColorTokenName() -> String {
        "textOnSurfaceColorPrimary"
    }

    // MARK: - Description

    /// Returns the description text color.
    static func descriptionColor() -> Color {
        DSColor.textOnSurfaceColorSecondary
    }

    /// Returns the description color token name for testing.
    static func descriptionColorTokenName() -> String {
        "textOnSurfaceColorSecondary"
    }

    // MARK: - Icon

    /// Returns the icon color.
    static func iconColor() -> Color {
        DSColor.iconColorSuccess
    }

    /// Returns the icon color token name for testing.
    static func iconColorTokenName() -> String {
        "iconColorSuccess"
    }
}
