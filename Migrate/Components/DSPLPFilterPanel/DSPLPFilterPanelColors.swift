import SwiftUI

// MARK: - DSPLPFilterPanelColorHelper

/// Helper for computing PLP Filter Panel colors based on theme.
public enum DSPLPFilterPanelColorHelper {
    // MARK: - Category Title

    /// Returns the category title text color.
    public static func categoryTitleColor() -> Color {
        DSColor.textOnSurfaceColorPrimary
    }

    public static func categoryTitleColorTokenName() -> String {
        "textOnSurfaceColorPrimary"
    }

    // MARK: - Results Text

    /// Returns the results count text color.
    public static func resultsTextColor() -> Color {
        DSColor.textOnSurfaceColorSecondary
    }

    public static func resultsTextColorTokenName() -> String {
        "textOnSurfaceColorSecondary"
    }

    // MARK: - Background

    /// Returns the panel background color.
    public static func backgroundColor() -> Color {
        DSColor.containerBackgroundPrimary
    }

    public static func backgroundColorTokenName() -> String {
        "containerBackgroundPrimary"
    }
}
