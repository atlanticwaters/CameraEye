import SwiftUI

// MARK: - DSAlertColorHelper

/// Helper for computing alert colors based on variant.
public enum DSAlertColorHelper {
    // MARK: - Background Colors

    /// Returns the background color for the given variant.
    public static func backgroundColor(variant: DSAlertVariant) -> Color {
        switch variant {
        case .informational:
            DSColor.feedbackBackgroundInformationalAccent2.resolve
        case .success:
            DSColor.feedbackBackgroundSuccessAccent2.resolve
        case .warning:
            DSColor.feedbackBackgroundWarningAccent2.resolve
        case .error:
            DSColor.feedbackBackgroundErrorAccent2.resolve
        }
    }

    /// Returns the background token name for testing.
    public static func backgroundTokenName(variant: DSAlertVariant) -> String {
        switch variant {
        case .informational:
            "feedbackBackgroundInformationalAccent2"
        case .success:
            "feedbackBackgroundSuccessAccent2"
        case .warning:
            "feedbackBackgroundWarningAccent2"
        case .error:
            "feedbackBackgroundErrorAccent2"
        }
    }

    // MARK: - Icon Colors

    /// Returns the icon color for the given variant.
    /// The icon uses a lighter/accent version of the variant color.
    public static func iconColor(variant: DSAlertVariant) -> Color {
        switch variant {
        case .informational:
            // Light blue icon on blue background
            Color(red: 0.69, green: 0.71, blue: 0.82)
        case .success:
            // Light green icon on green background
            Color(red: 0.69, green: 0.82, blue: 0.75)
        case .warning:
            // Dark text/icon for yellow background (contrast)
            DSColor.textOnSurfaceColorPrimary.resolve
        case .error:
            // Light red/pink icon on red background
            Color(red: 0.95, green: 0.75, blue: 0.73)
        }
    }

    /// Returns the icon color token name for testing.
    public static func iconColorTokenName(variant: DSAlertVariant) -> String {
        switch variant {
        case .informational:
            "customInformationalIconColor"
        case .success:
            "customSuccessIconColor"
        case .warning:
            "textOnSurfaceColorPrimary"
        case .error:
            "customErrorIconColor"
        }
    }

    // MARK: - Text Colors

    /// Returns the text color for the given variant.
    public static func textColor(variant: DSAlertVariant) -> Color {
        // All variants use primary text color
        DSColor.textOnSurfaceColorPrimary.resolve
    }

    /// Returns the text color token name for testing.
    public static func textColorTokenName(variant: DSAlertVariant) -> String {
        "textOnSurfaceColorPrimary"
    }
}
