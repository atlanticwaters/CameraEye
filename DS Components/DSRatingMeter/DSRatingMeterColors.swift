import SwiftUI

// MARK: - DSRatingMeterColorHelper

/// Helper for computing rating meter colors based on theme.
enum DSRatingMeterColorHelper {
    // MARK: - Filled Star

    /// Returns the filled star color.
    static func filledColor() -> Color {
        DSColor.iconColorWarning
    }

    /// Returns the filled star color token name for testing.
    static func filledColorTokenName() -> String {
        "iconColorWarning"
    }

    // MARK: - Empty Star

    /// Returns the empty star color.
    static func emptyColor() -> Color {
        DSColor.iconColorTertiary
    }

    /// Returns the empty star color token name for testing.
    static func emptyColorTokenName() -> String {
        "iconColorTertiary"
    }

    // MARK: - Label

    /// Returns the label text color.
    static func labelColor() -> Color {
        DSColor.textOnSurfaceColorSecondary
    }

    /// Returns the label color token name for testing.
    static func labelColorTokenName() -> String {
        "textOnSurfaceColorSecondary"
    }

    // MARK: - Focus Border

    /// Returns the focus border color.
    static func focusBorderColor() -> Color {
        DSColor.borderColorFocus
    }

    /// Returns the focus border color token name for testing.
    static func focusBorderColorTokenName() -> String {
        "borderColorFocus"
    }
}
