import SwiftUI

// MARK: - DSPLPPodColorHelper

/// Helper for computing PLP Pod colors based on theme.
///
/// Note: Most colors are handled by the sub-components (DSPLPPodImageContainer,
/// DSPLPPodDetails, DSPLPPodButtonSet). This helper provides colors specific
/// to the composite container.
public enum DSPLPPodColorHelper {
    // MARK: - Container Colors

    /// Returns the background color for the pod container.
    public static func backgroundColor() -> Color {
        DSColor.containerBackgroundPrimary
    }

    public static func backgroundColorTokenName() -> String {
        "containerBackgroundPrimary"
    }

    /// Returns the border color for the pod container.
    public static func borderColor() -> Color {
        DSColor.borderColorSecondary
    }

    public static func borderColorTokenName() -> String {
        "borderColorSecondary"
    }

    /// Returns the shadow color for the pod container.
    public static func shadowColor() -> Color {
        DSColor.shadowColorPrimary
    }

    public static func shadowColorTokenName() -> String {
        "shadowColorPrimary"
    }
}
