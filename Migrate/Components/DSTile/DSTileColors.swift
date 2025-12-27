import SwiftUI

// MARK: - DSTileColorHelper

/// Helper for computing tile colors based on variant and state.
public enum DSTileColorHelper {
    // MARK: - Background Colors

    /// Returns the background color for the given configuration.
    public static func backgroundColor(
        variant: DSTileVariant,
        isSelected: Bool,
        isDisabled: Bool
    ) -> Color {
        if isDisabled {
            return DSColor.containerBackgroundTransparent05.resolve
        }

        switch variant {
        case .outlined:
            return isSelected
                ? DSColor.containerBackgroundTransparent05.resolve
                : Color.white
        case .filled:
            return isSelected
                ? DSColor.textOnSurfaceColorPrimary.resolve
                : DSColor.containerBackgroundTransparent10.resolve
        case .ghost:
            return .clear
        }
    }

    /// Returns the background color token name for testing.
    public static func backgroundColorTokenName(
        variant: DSTileVariant,
        isSelected: Bool,
        isDisabled: Bool
    ) -> String {
        if isDisabled {
            return "containerBackgroundTransparent05"
        }

        switch variant {
        case .outlined:
            return isSelected ? "containerBackgroundTransparent05" : "white"
        case .filled:
            return isSelected ? "textOnSurfaceColorPrimary" : "containerBackgroundTransparent10"
        case .ghost:
            return "clear"
        }
    }

    // MARK: - Border Colors

    /// Returns the border color for the given configuration.
    public static func borderColor(
        variant: DSTileVariant,
        isSelected: Bool,
        isDisabled: Bool
    ) -> Color {
        if isDisabled {
            return DSColor.textOnSurfaceColorTertiary.resolve
        }

        switch variant {
        case .outlined:
            return isSelected
                ? DSColor.textOnSurfaceColorPrimary.resolve
                : DSColor.textOnSurfaceColorTertiary.resolve
        case .filled,
             .ghost:
            return .clear
        }
    }

    /// Returns the border color token name for testing.
    public static func borderColorTokenName(
        variant: DSTileVariant,
        isSelected: Bool,
        isDisabled: Bool
    ) -> String {
        if isDisabled {
            return "textOnSurfaceColorTertiary"
        }

        switch variant {
        case .outlined:
            return isSelected ? "textOnSurfaceColorPrimary" : "textOnSurfaceColorTertiary"
        case .filled,
             .ghost:
            return "clear"
        }
    }

    // MARK: - Text Colors

    /// Returns the text color for the given configuration.
    public static func textColor(isSelected: Bool, isDisabled: Bool) -> Color {
        if isDisabled {
            return DSColor.textOnSurfaceColorTertiary.resolve
        }
        return isSelected
            ? DSColor.textOnSurfaceColorPrimary.resolve
            : DSColor.textOnSurfaceColorSecondary.resolve
    }

    /// Returns the text color token name for testing.
    public static func textColorTokenName(isSelected: Bool, isDisabled: Bool) -> String {
        if isDisabled {
            return "textOnSurfaceColorTertiary"
        }
        return isSelected ? "textOnSurfaceColorPrimary" : "textOnSurfaceColorSecondary"
    }
}
