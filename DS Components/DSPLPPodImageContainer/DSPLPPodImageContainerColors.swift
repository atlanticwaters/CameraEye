import SwiftUI

// MARK: - DSPLPPodImageContainerColorHelper

/// Helper for computing PLP Pod Image Container colors based on theme.
enum DSPLPPodImageContainerColorHelper {
    // MARK: - Background

    /// Returns the main background color.
    static func backgroundColor() -> Color {
        DSColor.backgroundSurfaceColorSecondary.resolve
    }

    static func backgroundColorTokenName() -> String {
        "backgroundSurfaceColorSecondary"
    }

    /// Returns the content background color.
    static func contentBackgroundColor() -> Color {
        DSColor.backgroundSurfaceColorTertiary.resolve
    }

    static func contentBackgroundColorTokenName() -> String {
        "backgroundSurfaceColorTertiary"
    }

    // MARK: - Badge Info Colors

    /// Returns the info badge text color.
    static func badgeInfoTextColor() -> Color {
        DSColor.textOnSurfaceColorInformational.resolve
    }

    static func badgeInfoTextColorTokenName() -> String {
        "textOnSurfaceColorInformational"
    }

    /// Returns the info badge background color.
    static func badgeInfoBackgroundColor() -> Color {
        DSColor.feedbackBackgroundInformationalAccent2.resolve
    }

    static func badgeInfoBackgroundColorTokenName() -> String {
        "feedbackBackgroundInformationalAccent2"
    }

    // MARK: - Badge Success Colors

    /// Returns the success badge text color.
    static func badgeSuccessTextColor() -> Color {
        DSColor.textOnSurfaceColorSuccess.resolve
    }

    static func badgeSuccessTextColorTokenName() -> String {
        "textOnSurfaceColorSuccess"
    }

    /// Returns the success badge background color.
    static func badgeSuccessBackgroundColor() -> Color {
        DSColor.feedbackBackgroundSuccessAccent2.resolve
    }

    static func badgeSuccessBackgroundColorTokenName() -> String {
        "feedbackBackgroundSuccessAccent2"
    }

    // MARK: - Badge Warning Colors

    /// Returns the warning badge text color.
    static func badgeWarningTextColor() -> Color {
        DSColor.textOnSurfaceColorWarning.resolve
    }

    static func badgeWarningTextColorTokenName() -> String {
        "textOnSurfaceColorWarning"
    }

    /// Returns the warning badge background color.
    static func badgeWarningBackgroundColor() -> Color {
        DSColor.feedbackBackgroundWarningAccent2.resolve
    }

    static func badgeWarningBackgroundColorTokenName() -> String {
        "feedbackBackgroundWarningAccent2"
    }

    // MARK: - Badge Error Colors

    /// Returns the error badge text color.
    static func badgeErrorTextColor() -> Color {
        DSColor.textOnSurfaceColorError.resolve
    }

    static func badgeErrorTextColorTokenName() -> String {
        "textOnSurfaceColorError"
    }

    /// Returns the error badge background color.
    static func badgeErrorBackgroundColor() -> Color {
        DSColor.feedbackBackgroundErrorAccent2.resolve
    }

    static func badgeErrorBackgroundColorTokenName() -> String {
        "feedbackBackgroundErrorAccent2"
    }

    // MARK: - Badge Neutral Colors

    /// Returns the neutral badge text color.
    static func badgeNeutralTextColor() -> Color {
        DSColor.textOnSurfaceColorSecondary.resolve
    }

    static func badgeNeutralTextColorTokenName() -> String {
        "textOnSurfaceColorSecondary"
    }

    /// Returns the neutral badge background color.
    static func badgeNeutralBackgroundColor() -> Color {
        DSColor.backgroundSurfaceColorTertiary.resolve
    }

    static func badgeNeutralBackgroundColorTokenName() -> String {
        "backgroundSurfaceColorTertiary"
    }

    // MARK: - Sponsored

    /// Returns the sponsored text color.
    static func sponsoredTextColor() -> Color {
        DSColor.textOnSurfaceColorTertiary.resolve
    }

    static func sponsoredTextColorTokenName() -> String {
        "textOnSurfaceColorTertiary"
    }

    // MARK: - Swatches

    /// Returns the swatch selected border color.
    static func swatchSelectedBorderColor() -> Color {
        DSColor.borderOnContainerDefault.resolve
    }

    static func swatchSelectedBorderColorTokenName() -> String {
        "borderOnContainerDefault"
    }

    /// Returns the swatch unselected border color.
    static func swatchUnselectedBorderColor() -> Color {
        DSColor.borderOnContainerInactive.resolve
    }

    static func swatchUnselectedBorderColorTokenName() -> String {
        "borderOnContainerInactive"
    }

    /// Returns the swatch placeholder color.
    static func swatchPlaceholderColor() -> Color {
        DSColor.containerBackgroundTransparent05.resolve
    }

    static func swatchPlaceholderColorTokenName() -> String {
        "containerBackgroundTransparent05"
    }

    /// Returns the swatch count text color.
    static func swatchCountTextColor() -> Color {
        DSColor.textOnSurfaceColorSecondary.resolve
    }

    static func swatchCountTextColorTokenName() -> String {
        "textOnSurfaceColorSecondary"
    }

    /// Returns the swatch error text color.
    static func swatchErrorTextColor() -> Color {
        DSColor.textOnSurfaceColorError.resolve
    }

    static func swatchErrorTextColorTokenName() -> String {
        "textOnSurfaceColorError"
    }

    // MARK: - Options Text

    /// Returns the more options text color.
    static func moreOptionsTextColor() -> Color {
        DSColor.textOnSurfaceColorSecondary.resolve
    }

    static func moreOptionsTextColorTokenName() -> String {
        "textOnSurfaceColorSecondary"
    }

    /// Returns the custom options text color.
    static func customOptionsTextColor() -> Color {
        DSColor.textOnSurfaceColorSecondary.resolve
    }

    static func customOptionsTextColorTokenName() -> String {
        "textOnSurfaceColorSecondary"
    }
}
