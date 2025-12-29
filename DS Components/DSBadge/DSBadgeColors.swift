import SwiftUI

// MARK: - DSBadgeColorHelper

/// Helper for computing badge colors based on variant and color.
public enum DSBadgeColorHelper {
    // MARK: - Foreground Colors

    /// Returns the foreground (text/icon) color for the given configuration.
    public static func foregroundColor(variant: DSBadgeVariant, color: DSBadgeColor) -> Color {
        switch variant {
        case .outline,
             .filledSubtle:
            // Use the accent color for text
            return accentColor(for: color)
        case .filledStrong:
            // Use white or appropriate contrast color
            switch color {
            case .warning:
                // Dark text on yellow background
                return DSColor.textOnSurfaceColorPrimary.resolve
            default:
                // White text on colored backgrounds
                return Color.white
            }
        }
    }

    /// Returns the foreground color token name for testing.
    public static func foregroundColorTokenName(variant: DSBadgeVariant, color: DSBadgeColor) -> String {
        switch variant {
        case .outline,
             .filledSubtle:
            return accentColorTokenName(for: color)
        case .filledStrong:
            switch color {
            case .warning:
                return "textOnSurfaceColorPrimary"
            default:
                return "white"
            }
        }
    }

    // MARK: - Background Colors

    /// Returns the background color for the given configuration.
    public static func backgroundColor(variant: DSBadgeVariant, color: DSBadgeColor) -> Color {
        switch variant {
        case .outline:
            return .clear
        case .filledSubtle:
            return subtleBackgroundColor(for: color)
        case .filledStrong:
            return accentColor(for: color)
        }
    }

    /// Returns the background color token name for testing.
    public static func backgroundColorTokenName(variant: DSBadgeVariant, color: DSBadgeColor) -> String {
        switch variant {
        case .outline:
            return "clear"
        case .filledSubtle:
            return subtleBackgroundTokenName(for: color)
        case .filledStrong:
            return accentColorTokenName(for: color)
        }
    }

    // MARK: - Border Colors

    /// Returns the border color for outline variant.
    public static func borderColor(variant: DSBadgeVariant, color: DSBadgeColor) -> Color {
        switch variant {
        case .outline:
            return accentColor(for: color)
        default:
            return .clear
        }
    }

    // MARK: - Private Helpers

    private static func accentColor(for color: DSBadgeColor) -> Color {
        switch color {
        case .info:
            // Teal/blue color
            Color(red: 0.286, green: 0.329, blue: 0.537)
        case .success:
            // Green color
            Color(red: 0.29, green: 0.506, blue: 0.396)
        case .warning:
            // Yellow/amber color
            Color(red: 0.976, green: 0.886, blue: 0.439)
        case .danger:
            // Red color
            Color(red: 0.875, green: 0.204, blue: 0.153)
        case .primary:
            // Black color
            DSColor.textOnSurfaceColorPrimary.resolve
        case .medium:
            // Gray color
            DSColor.textOnSurfaceColorSecondary.resolve
        case .brand:
            // Orange color
            DSColor.buttonBackgroundBrandFilledDefault.resolve
        }
    }

    private static func accentColorTokenName(for color: DSBadgeColor) -> String {
        switch color {
        case .info:
            "badgeInfoAccent"
        case .success:
            "badgeSuccessAccent"
        case .warning:
            "badgeWarningAccent"
        case .danger:
            "badgeDangerAccent"
        case .primary:
            "textOnSurfaceColorPrimary"
        case .medium:
            "textOnSurfaceColorSecondary"
        case .brand:
            "buttonBackgroundBrandFilledDefault"
        }
    }

    private static func subtleBackgroundColor(for color: DSBadgeColor) -> Color {
        switch color {
        case .info:
            DSColor.feedbackBackgroundInformationalAccent1.resolve
        case .success:
            DSColor.feedbackBackgroundSuccessAccent1.resolve
        case .warning:
            DSColor.feedbackBackgroundWarningAccent1.resolve
        case .danger:
            DSColor.feedbackBackgroundErrorAccent1.resolve
        case .primary:
            DSColor.containerBackgroundTransparent10.resolve
        case .medium:
            DSColor.containerBackgroundTransparent05.resolve
        case .brand:
            DSColor.containerBackgroundBrandAccent.resolve
        }
    }

    private static func subtleBackgroundTokenName(for color: DSBadgeColor) -> String {
        switch color {
        case .info:
            "feedbackBackgroundInformationalAccent1"
        case .success:
            "feedbackBackgroundSuccessAccent1"
        case .warning:
            "feedbackBackgroundWarningAccent1"
        case .danger:
            "feedbackBackgroundErrorAccent1"
        case .primary:
            "containerBackgroundTransparent10"
        case .medium:
            "containerBackgroundTransparent05"
        case .brand:
            "containerBackgroundBrandAccent"
        }
    }
}
