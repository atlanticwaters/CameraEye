import SwiftUI

// MARK: - DSTabColorHelper

/// Helper for computing tab colors based on style and state.
public enum DSTabColorHelper {
    // MARK: - Background

    /// Returns the background color for the tab.
    public static func backgroundColor(
        style: DSTabStyle,
        isSelected: Bool,
        isDisabled: Bool
    ) -> Color {
        switch style {
        case .ghost:
            return .clear
        case .black5:
            if isDisabled {
                return DSColor.containerBackgroundTransparent05.resolve.opacity(0.5)
            }
            return isSelected
                ? DSColor.containerBackgroundTransparent10.resolve
                : DSColor.containerBackgroundTransparent05.resolve
        }
    }

    /// Returns the background color token name for testing.
    public static func backgroundColorTokenName(
        style: DSTabStyle,
        isSelected: Bool,
        isDisabled: Bool
    ) -> String {
        switch style {
        case .ghost:
            return "clear"
        case .black5:
            if isDisabled {
                return "containerBackgroundTransparent05"
            }
            return isSelected ? "containerBackgroundTransparent10" : "containerBackgroundTransparent05"
        }
    }

    // MARK: - Text Color

    /// Returns the text color for the tab.
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

    // MARK: - Indicator Color

    /// Returns the selection indicator color.
    public static func indicatorColor() -> Color {
        DSColor.textOnSurfaceColorPrimary.resolve
    }

    /// Returns the indicator color token name for testing.
    public static func indicatorColorTokenName() -> String {
        "textOnSurfaceColorPrimary"
    }

    // MARK: - Divider Color

    /// Returns the divider line color.
    public static func dividerColor() -> Color {
        DSColor.textOnSurfaceColorTertiary.resolve
    }

    /// Returns the divider color token name for testing.
    public static func dividerColorTokenName() -> String {
        "textOnSurfaceColorTertiary"
    }
}
