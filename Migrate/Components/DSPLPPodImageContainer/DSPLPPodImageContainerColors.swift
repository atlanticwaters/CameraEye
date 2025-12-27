import SwiftUI

// MARK: - DSPLPPodImageContainerColorHelper

/// Helper for computing PLP Pod Image Container colors based on theme.
enum DSPLPPodImageContainerColorHelper {
    // MARK: - Background

    /// Returns the main background color.
    static func backgroundColor() -> Color {
        DSColor.containerBackgroundPrimary
    }

    static func backgroundColorTokenName() -> String {
        "containerBackgroundPrimary"
    }

    /// Returns the content background color.
    static func contentBackgroundColor() -> Color {
        DSColor.containerBackgroundSecondary
    }

    static func contentBackgroundColorTokenName() -> String {
        "containerBackgroundSecondary"
    }

    // MARK: - Badge Info Colors

    /// Returns the info badge text color.
    static func badgeInfoTextColor() -> Color {
        DSColor.textOnSurfaceColorInfo
    }

    static func badgeInfoTextColorTokenName() -> String {
        "textOnSurfaceColorInfo"
    }

    /// Returns the info badge background color.
    static func badgeInfoBackgroundColor() -> Color {
        DSColor.containerBackgroundInfoSubtle
    }

    static func badgeInfoBackgroundColorTokenName() -> String {
        "containerBackgroundInfoSubtle"
    }

    // MARK: - Badge Success Colors

    /// Returns the success badge text color.
    static func badgeSuccessTextColor() -> Color {
        DSColor.textOnSurfaceColorSuccess
    }

    static func badgeSuccessTextColorTokenName() -> String {
        "textOnSurfaceColorSuccess"
    }

    /// Returns the success badge background color.
    static func badgeSuccessBackgroundColor() -> Color {
        DSColor.containerBackgroundSuccessSubtle
    }

    static func badgeSuccessBackgroundColorTokenName() -> String {
        "containerBackgroundSuccessSubtle"
    }

    // MARK: - Badge Warning Colors

    /// Returns the warning badge text color.
    static func badgeWarningTextColor() -> Color {
        DSColor.textOnSurfaceColorWarning
    }

    static func badgeWarningTextColorTokenName() -> String {
        "textOnSurfaceColorWarning"
    }

    /// Returns the warning badge background color.
    static func badgeWarningBackgroundColor() -> Color {
        DSColor.containerBackgroundWarningSubtle
    }

    static func badgeWarningBackgroundColorTokenName() -> String {
        "containerBackgroundWarningSubtle"
    }

    // MARK: - Badge Error Colors

    /// Returns the error badge text color.
    static func badgeErrorTextColor() -> Color {
        DSColor.textOnSurfaceColorError
    }

    static func badgeErrorTextColorTokenName() -> String {
        "textOnSurfaceColorError"
    }

    /// Returns the error badge background color.
    static func badgeErrorBackgroundColor() -> Color {
        DSColor.containerBackgroundErrorSubtle
    }

    static func badgeErrorBackgroundColorTokenName() -> String {
        "containerBackgroundErrorSubtle"
    }

    // MARK: - Badge Neutral Colors

    /// Returns the neutral badge text color.
    static func badgeNeutralTextColor() -> Color {
        DSColor.textOnSurfaceColorSecondary
    }

    static func badgeNeutralTextColorTokenName() -> String {
        "textOnSurfaceColorSecondary"
    }

    /// Returns the neutral badge background color.
    static func badgeNeutralBackgroundColor() -> Color {
        DSColor.containerBackgroundSecondary
    }

    static func badgeNeutralBackgroundColorTokenName() -> String {
        "containerBackgroundSecondary"
    }

    // MARK: - Sponsored

    /// Returns the sponsored text color.
    static func sponsoredTextColor() -> Color {
        DSColor.textOnSurfaceColorTertiary
    }

    static func sponsoredTextColorTokenName() -> String {
        "textOnSurfaceColorTertiary"
    }

    // MARK: - Swatches

    /// Returns the swatch selected border color.
    static func swatchSelectedBorderColor() -> Color {
        DSColor.borderColorPrimary
    }

    static func swatchSelectedBorderColorTokenName() -> String {
        "borderColorPrimary"
    }

    /// Returns the swatch unselected border color.
    static func swatchUnselectedBorderColor() -> Color {
        DSColor.borderColorSecondary
    }

    static func swatchUnselectedBorderColorTokenName() -> String {
        "borderColorSecondary"
    }

    /// Returns the swatch placeholder color.
    static func swatchPlaceholderColor() -> Color {
        DSColor.containerBackgroundTransparent05
    }

    static func swatchPlaceholderColorTokenName() -> String {
        "containerBackgroundTransparent05"
    }

    /// Returns the swatch count text color.
    static func swatchCountTextColor() -> Color {
        DSColor.textOnSurfaceColorSecondary
    }

    static func swatchCountTextColorTokenName() -> String {
        "textOnSurfaceColorSecondary"
    }

    /// Returns the swatch error text color.
    static func swatchErrorTextColor() -> Color {
        DSColor.textOnSurfaceColorError
    }

    static func swatchErrorTextColorTokenName() -> String {
        "textOnSurfaceColorError"
    }

    // MARK: - Options Text

    /// Returns the more options text color.
    static func moreOptionsTextColor() -> Color {
        DSColor.textOnSurfaceColorSecondary
    }

    static func moreOptionsTextColorTokenName() -> String {
        "textOnSurfaceColorSecondary"
    }

    /// Returns the custom options text color.
    static func customOptionsTextColor() -> Color {
        DSColor.textOnSurfaceColorSecondary
    }

    static func customOptionsTextColorTokenName() -> String {
        "textOnSurfaceColorSecondary"
    }
}
