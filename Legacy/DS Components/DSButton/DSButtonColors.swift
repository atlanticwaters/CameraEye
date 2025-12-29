import SwiftUI

// MARK: - DSButtonColorHelper

/// Helper structure for computing DSButton colors based on style, state, and color scheme.
enum DSButtonColorHelper {
    // MARK: - Background Colors

    static func backgroundColor(style: DSButton.Style, isDisabled: Bool, isDark: Bool) -> Color {
        switch style {
        case .orangeFilled: orangeFilledBackground(isDisabled: isDisabled, isDark: isDark)
        case .gradientFilled: gradientFilledBackground(isDisabled: isDisabled, isDark: isDark)
        case .outlined: Color.clear
        case .whiteFilled: whiteFilledBackground(isDisabled: isDisabled, isDark: isDark)
        case .black5: black5Background(isDisabled: isDisabled, isDark: isDark)
        case .black10: black10Background(isDisabled: isDisabled, isDark: isDark)
        case .ghost: ghostBackground(isDisabled: isDisabled, isDark: isDark)
        }
    }

    // MARK: - Foreground Colors

    static func foregroundColor(style: DSButton.Style, isDisabled: Bool, isDark: Bool) -> Color {
        switch style {
        case .orangeFilled: orangeFilledForeground(isDisabled: isDisabled, isDark: isDark)
        case .gradientFilled: gradientFilledForeground(isDisabled: isDisabled, isDark: isDark)
        case .outlined: outlinedForeground(isDisabled: isDisabled, isDark: isDark)
        case .whiteFilled: whiteFilledForeground(isDisabled: isDisabled, isDark: isDark)
        case .black5: black5Foreground(isDisabled: isDisabled, isDark: isDark)
        case .black10: black10Foreground(isDisabled: isDisabled, isDark: isDark)
        case .ghost: ghostForeground(isDisabled: isDisabled, isDark: isDark)
        }
    }
}

// MARK: - Background Color Helpers

extension DSButtonColorHelper {
    fileprivate typealias Light = TokensSemanticLight
    fileprivate typealias Dark = TokensSemanticDark

    fileprivate static func orangeFilledBackground(isDisabled: Bool, isDark: Bool) -> Color {
        if isDark {
            return isDisabled
                ? Dark.BackgroundButtonColorBrandFilledInactive
                : Dark.BackgroundButtonColorBrandFilledDefault
        }
        return isDisabled
            ? Light.BackgroundButtonColorBrandFilledInactive
            : Light.BackgroundButtonColorBrandFilledDefault
    }

    fileprivate static func gradientFilledBackground(isDisabled: Bool, isDark: Bool) -> Color {
        if isDark {
            return isDisabled
                ? Dark.BackgroundButtonColorBrandGradientFilledInactive
                : Dark.BackgroundButtonColorBrandGradientFilledDefault
        }
        return isDisabled
            ? Light.BackgroundButtonColorBrandGradientFilledInactive
            : Light.BackgroundButtonColorBrandGradientFilledDefault
    }

    fileprivate static func whiteFilledBackground(isDisabled: Bool, isDark: Bool) -> Color {
        if isDark {
            return isDisabled
                ? Dark.BackgroundButtonColorWhiteFilledInactive
                : Dark.BackgroundButtonColorWhiteFilledDefault
        }
        return isDisabled
            ? Light.BackgroundButtonColorWhiteFilledInactive
            : Light.BackgroundButtonColorWhiteFilledDefault
    }

    fileprivate static func black5Background(isDisabled: Bool, isDark: Bool) -> Color {
        if isDark {
            return isDisabled
                ? Dark.BackgroundButtonColorTransparent05Inactive
                : Dark.BackgroundButtonColorTransparent05Default
        }
        return isDisabled
            ? Light.BackgroundButtonColorTransparent05Inactive
            : Light.BackgroundButtonColorTransparent05Default
    }

    fileprivate static func black10Background(isDisabled: Bool, isDark: Bool) -> Color {
        if isDark {
            return isDisabled
                ? Dark.BackgroundButtonColorTransparent10Inactive
                : Dark.BackgroundButtonColorTransparent10Default
        }
        return isDisabled
            ? Light.BackgroundButtonColorTransparent10Inactive
            : Light.BackgroundButtonColorTransparent10Default
    }

    fileprivate static func ghostBackground(isDisabled: Bool, isDark: Bool) -> Color {
        if isDark {
            return isDisabled
                ? Dark.BackgroundButtonColorGhostFilledInactive
                : Dark.BackgroundButtonColorGhostFilledDefault
        }
        return isDisabled
            ? Light.BackgroundButtonColorGhostFilledInactive
            : Light.BackgroundButtonColorGhostFilledDefault
    }
}

// MARK: - Foreground Color Helpers

extension DSButtonColorHelper {
    fileprivate static func orangeFilledForeground(isDisabled: Bool, isDark: Bool) -> Color {
        if isDark {
            return isDisabled ? Dark.TextButtonColorOrangeFilledInactive : Dark.TextButtonColorOrangeFilledDefault
        }
        return isDisabled ? Light.TextButtonColorOrangeFilledInactive : Light.TextButtonColorOrangeFilledDefault
    }

    fileprivate static func gradientFilledForeground(isDisabled: Bool, isDark: Bool) -> Color {
        if isDark {
            return isDisabled ? Dark.TextButtonColorGradientFilledInactive : Dark.TextButtonColorGradientFilledDefault
        }
        return isDisabled ? Light.TextButtonColorGradientFilledInactive : Light.TextButtonColorGradientFilledDefault
    }

    fileprivate static func outlinedForeground(isDisabled: Bool, isDark: Bool) -> Color {
        if isDark {
            return isDisabled ? Dark.TextButtonColorOrangeOutlineInactive : Dark.TextButtonColorOrangeOutlineDefault
        }
        return isDisabled ? Light.TextButtonColorOrangeOutlineInactive : Light.TextButtonColorOrangeOutlineDefault
    }

    fileprivate static func whiteFilledForeground(isDisabled: Bool, isDark: Bool) -> Color {
        if isDark {
            return isDisabled ? Dark.TextButtonColorWhiteFilledInactive : Dark.TextButtonColorWhiteFilledDefault
        }
        return isDisabled ? Light.TextButtonColorWhiteFilledInactive : Light.TextButtonColorWhiteFilledDefault
    }

    fileprivate static func black5Foreground(isDisabled: Bool, isDark: Bool) -> Color {
        if isDark {
            return isDisabled
                ? Dark.TextButtonColorTransparent05FilledInactive
                : Dark.TextButtonColorTransparent05FilledDefault
        }
        return isDisabled
            ? Light.TextButtonColorTransparent05FilledInactive
            : Light.TextButtonColorTransparent05FilledDefault
    }

    fileprivate static func black10Foreground(isDisabled: Bool, isDark: Bool) -> Color {
        if isDark {
            return isDisabled
                ? Dark.TextButtonColorTransparent10FilledInactive
                : Dark.TextButtonColorTransparent10FilledDefault
        }
        return isDisabled
            ? Light.TextButtonColorTransparent10FilledInactive
            : Light.TextButtonColorTransparent10FilledDefault
    }

    fileprivate static func ghostForeground(isDisabled: Bool, isDark: Bool) -> Color {
        if isDark {
            return isDisabled ? Dark.TextButtonColorGhostFilledInactive : Dark.TextButtonColorGhostFilledDefault
        }
        return isDisabled ? Light.TextButtonColorGhostFilledInactive : Light.TextButtonColorGhostFilledDefault
    }
}

// MARK: - Border and Gradient Colors

extension DSButtonColorHelper {
    static func borderColor(isDisabled: Bool, isDark: Bool) -> Color {
        if isDark {
            return isDisabled ? Dark.BorderButtonColorOrangeOutlineInactive : Dark.BorderButtonColorOrangeOutlineDefault
        }
        return isDisabled ? Light.BorderButtonColorOrangeOutlineInactive : Light.BorderButtonColorOrangeOutlineDefault
    }

    static func gradientColors(isDark: Bool) -> [Color] {
        let startColor = isDark
            ? Dark.BackgroundButtonColorBrandFilledDefault
            : Light.BackgroundButtonColorBrandFilledDefault
        let endColor = isDark ? Dark.Brand400 : Light.Brand400
        return [startColor, endColor]
    }

    static func pressedBackgroundColor(style: DSButton.Style, isDark: Bool) -> Color {
        switch style {
        case .ghost: isDark
            ? Dark.BackgroundButtonColorGhostFilledPressed
            : Light.BackgroundButtonColorGhostFilledPressed
        case .black5: isDark
            ? Dark.BackgroundButtonColorTransparent05Pressed
            : Light.BackgroundButtonColorTransparent05Pressed
        case .black10: isDark
            ? Dark.BackgroundButtonColorTransparent10Pressed
            : Light.BackgroundButtonColorTransparent10Pressed
        default: Color.clear
        }
    }
}
