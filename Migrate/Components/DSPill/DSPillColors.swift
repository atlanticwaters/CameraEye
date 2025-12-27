import SwiftUI

// MARK: - DSPillColorHelper

/// Helper for computing pill colors based on style and state.
public enum DSPillColorHelper {
    // MARK: - Background Colors

    /// Returns the background color for the given configuration.
    public static func backgroundColor(
        style: DSPillStyle,
        isSelected: Bool,
        isDisabled: Bool,
        hasBackground: Bool
    ) -> Color {
        if isDisabled {
            return DSColor.containerBackgroundTransparent05.resolve
        }

        switch style {
        case .outlined:
            if !hasBackground {
                return .clear
            }
            return isSelected
                ? DSColor.containerBackgroundTransparent10.resolve
                : Color.white
        case .filled:
            return isSelected
                ? DSColor.textOnSurfaceColorPrimary.resolve
                : DSColor.containerBackgroundTransparent10.resolve
        }
    }

    /// Returns the background color token name for testing.
    public static func backgroundColorTokenName(
        style: DSPillStyle,
        isSelected: Bool,
        isDisabled: Bool,
        hasBackground: Bool
    ) -> String {
        if isDisabled {
            return "containerBackgroundTransparent05"
        }

        switch style {
        case .outlined:
            if !hasBackground {
                return "clear"
            }
            return isSelected ? "containerBackgroundTransparent10" : "white"
        case .filled:
            return isSelected ? "textOnSurfaceColorPrimary" : "containerBackgroundTransparent10"
        }
    }

    // MARK: - Border Colors

    /// Returns the border color for the given configuration.
    public static func borderColor(
        style: DSPillStyle,
        isSelected: Bool,
        isDisabled: Bool
    ) -> Color {
        if isDisabled {
            return DSColor.textOnSurfaceColorTertiary.resolve
        }

        switch style {
        case .outlined:
            return isSelected
                ? DSColor.textOnSurfaceColorPrimary.resolve
                : DSColor.textOnSurfaceColorTertiary.resolve
        case .filled:
            return .clear
        }
    }

    /// Returns the border color token name for testing.
    public static func borderColorTokenName(
        style: DSPillStyle,
        isSelected: Bool,
        isDisabled: Bool
    ) -> String {
        if isDisabled {
            return "textOnSurfaceColorTertiary"
        }

        switch style {
        case .outlined:
            return isSelected ? "textOnSurfaceColorPrimary" : "textOnSurfaceColorTertiary"
        case .filled:
            return "clear"
        }
    }

    // MARK: - Foreground Colors

    /// Returns the foreground (text/icon) color for the given configuration.
    public static func foregroundColor(
        style: DSPillStyle,
        isSelected: Bool,
        isDisabled: Bool
    ) -> Color {
        if isDisabled {
            return DSColor.textOnSurfaceColorTertiary.resolve
        }

        switch style {
        case .outlined:
            return isSelected
                ? DSColor.textOnSurfaceColorPrimary.resolve
                : DSColor.textOnSurfaceColorSecondary.resolve
        case .filled:
            if isSelected {
                return Color.white
            }
            return DSColor.textOnSurfaceColorPrimary.resolve
        }
    }

    /// Returns the foreground color token name for testing.
    public static func foregroundColorTokenName(
        style: DSPillStyle,
        isSelected: Bool,
        isDisabled: Bool
    ) -> String {
        if isDisabled {
            return "textOnSurfaceColorTertiary"
        }

        switch style {
        case .outlined:
            return isSelected ? "textOnSurfaceColorPrimary" : "textOnSurfaceColorSecondary"
        case .filled:
            if isSelected {
                return "white"
            }
            return "textOnSurfaceColorPrimary"
        }
    }
}
