import SwiftUI

// MARK: - DSFeatureCardColorHelper

/// Helper for computing feature card colors based on theme.
enum DSFeatureCardColorHelper {
    // MARK: - Background

    /// Returns the background color for the feature card.
    static func backgroundColor() -> Color {
        DSColor.backgroundSurfaceColorSecondary.resolve
    }

    /// Returns the background color token name for testing.
    static func backgroundColorTokenName() -> String {
        "backgroundSurfaceColorSecondary"
    }

    // MARK: - Border

    /// Returns the border color for the feature card.
    static func borderColor() -> Color {
        DSColor.borderOnContainerDefault.resolve
    }

    /// Returns the border color token name for testing.
    static func borderColorTokenName() -> String {
        "borderOnContainerDefault"
    }

    // MARK: - Title

    /// Returns the title text color.
    static func titleColor() -> Color {
        DSColor.textOnSurfaceColorPrimary.resolve
    }

    /// Returns the title color token name for testing.
    static func titleColorTokenName() -> String {
        "textOnSurfaceColorPrimary"
    }

    // MARK: - Description

    /// Returns the description text color.
    static func descriptionColor() -> Color {
        DSColor.textOnSurfaceColorSecondary.resolve
    }

    /// Returns the description color token name for testing.
    static func descriptionColorTokenName() -> String {
        "textOnSurfaceColorSecondary"
    }

    // MARK: - Icon

    /// Returns the icon color.
    static func iconColor() -> Color {
        DSColor.textOnSurfaceColorSuccess.resolve
    }

    /// Returns the icon color token name for testing.
    static func iconColorTokenName() -> String {
        "textOnSurfaceColorSuccess"
    }
}
