import SwiftUI

// MARK: - DSButtonColorHelper

/// Helper structure for computing DSButton colors based on style and state.
///
/// Colors automatically resolve to light/dark mode via `DSColor`.
/// No `isDark` parameter needed - the color scheme is handled automatically.
enum DSButtonColorHelper {
    // MARK: - Background Colors

    /// Returns the background color for a button style and state.
    /// The color automatically adapts to light/dark mode.
    static func backgroundColor(style: DSButtonStyle, isDisabled: Bool) -> Color {
        switch style {
        case .orangeFilled:
            (isDisabled ? DSColor.buttonBackgroundBrandFilledInactive : DSColor.buttonBackgroundBrandFilledDefault)
                .resolve
        case .gradientFilled:
            (isDisabled
                ? DSColor.buttonBackgroundBrandGradientFilledInactive
                : DSColor.buttonBackgroundBrandGradientFilledDefault).resolve
        case .outlined:
            Color.clear
        case .whiteFilled:
            (isDisabled ? DSColor.buttonBackgroundWhiteFilledInactive : DSColor.buttonBackgroundWhiteFilledDefault)
                .resolve
        case .black5:
            (isDisabled ? DSColor.buttonBackgroundTransparent05Inactive : DSColor.buttonBackgroundTransparent05Default)
                .resolve
        case .black10:
            (isDisabled ? DSColor.buttonBackgroundTransparent10Inactive : DSColor.buttonBackgroundTransparent10Default)
                .resolve
        case .ghost:
            (isDisabled ? DSColor.buttonBackgroundGhostFilledInactive : DSColor.buttonBackgroundGhostFilledDefault)
                .resolve
        }
    }

    // MARK: - Foreground Colors

    /// Returns the foreground (text/icon) color for a button style and state.
    /// The color automatically adapts to light/dark mode.
    static func foregroundColor(style: DSButtonStyle, isDisabled: Bool) -> Color {
        switch style {
        case .orangeFilled:
            (isDisabled ? DSColor.buttonTextOrangeFilledInactive : DSColor.buttonTextOrangeFilledDefault).resolve
        case .gradientFilled:
            (isDisabled ? DSColor.buttonTextGradientFilledInactive : DSColor.buttonTextGradientFilledDefault).resolve
        case .outlined:
            (isDisabled ? DSColor.buttonTextOrangeOutlineInactive : DSColor.buttonTextOrangeOutlineDefault).resolve
        case .whiteFilled:
            (isDisabled ? DSColor.buttonTextWhiteFilledInactive : DSColor.buttonTextWhiteFilledDefault).resolve
        case .black5:
            (isDisabled ? DSColor.buttonTextTransparent05FilledInactive : DSColor.buttonTextTransparent05FilledDefault)
                .resolve
        case .black10:
            (isDisabled ? DSColor.buttonTextTransparent10FilledInactive : DSColor.buttonTextTransparent10FilledDefault)
                .resolve
        case .ghost:
            (isDisabled ? DSColor.buttonTextGhostFilledInactive : DSColor.buttonTextGhostFilledDefault).resolve
        }
    }

    // MARK: - Border Colors

    /// Returns the border color for outlined buttons.
    /// The color automatically adapts to light/dark mode.
    static func borderColor(isDisabled: Bool) -> Color {
        (isDisabled ? DSColor.buttonBorderOrangeOutlineInactive : DSColor.buttonBorderOrangeOutlineDefault).resolve
    }

    // MARK: - Background Fill

    /// Returns the background fill for a button style and state.
    /// Uses DSBackgroundFill for unified color/gradient handling with automatic theme support.
    static func backgroundFill(style: DSButtonStyle, isDisabled: Bool) -> DSBackgroundFill {
        switch style {
        case .gradientFilled:
            if isDisabled {
                return DSBackgroundFill(
                    light: DSColor.buttonBackgroundBrandGradientFilledInactive.lightColor,
                    dark: DSColor.buttonBackgroundBrandGradientFilledInactive.darkColor
                )
            } else {
                return .brandGradientPrimary
            }
        case .orangeFilled:
            let dsColor = isDisabled
                ? DSColor.buttonBackgroundBrandFilledInactive
                : DSColor.buttonBackgroundBrandFilledDefault
            return DSBackgroundFill(light: dsColor.lightColor, dark: dsColor.darkColor)
        case .whiteFilled:
            let dsColor = isDisabled
                ? DSColor.buttonBackgroundWhiteFilledInactive
                : DSColor.buttonBackgroundWhiteFilledDefault
            return DSBackgroundFill(light: dsColor.lightColor, dark: dsColor.darkColor)
        case .black5:
            let dsColor = isDisabled
                ? DSColor.buttonBackgroundTransparent05Inactive
                : DSColor.buttonBackgroundTransparent05Default
            return DSBackgroundFill(light: dsColor.lightColor, dark: dsColor.darkColor)
        case .black10:
            let dsColor = isDisabled
                ? DSColor.buttonBackgroundTransparent10Inactive
                : DSColor.buttonBackgroundTransparent10Default
            return DSBackgroundFill(light: dsColor.lightColor, dark: dsColor.darkColor)
        case .ghost:
            let dsColor = isDisabled
                ? DSColor.buttonBackgroundGhostFilledInactive
                : DSColor.buttonBackgroundGhostFilledDefault
            return DSBackgroundFill(light: dsColor.lightColor, dark: dsColor.darkColor)
        case .outlined:
            // Outlined uses transparent background
            return DSBackgroundFill(light: .clear, dark: .clear)
        }
    }

    // MARK: - Pressed Background Colors

    /// Returns the pressed background color for styles that need it.
    /// The color automatically adapts to light/dark mode.
    static func pressedBackgroundColor(style: DSButtonStyle) -> Color {
        switch style {
        case .ghost:
            DSColor.buttonBackgroundGhostFilledPressed.resolve
        case .black5:
            DSColor.buttonBackgroundTransparent05Pressed.resolve
        case .black10:
            DSColor.buttonBackgroundTransparent10Pressed.resolve
        default:
            Color.clear
        }
    }
}
