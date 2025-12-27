import SwiftUI

// MARK: - DSPLPFilterSheetColorHelper

/// Helper for computing PLP Filter Sheet colors based on theme.
public enum DSPLPFilterSheetColorHelper {
    // MARK: - Background Colors

    public static func backgroundColor() -> Color {
        DSColor.containerBackgroundPrimary
    }

    public static func backgroundColorTokenName() -> String {
        "containerBackgroundPrimary"
    }

    public static func headerBackgroundColor() -> Color {
        DSColor.containerBackgroundPrimary
    }

    public static func headerBackgroundColorTokenName() -> String {
        "containerBackgroundPrimary"
    }

    public static func bottomBarBackgroundColor() -> Color {
        DSColor.containerBackgroundPrimary
    }

    public static func bottomBarBackgroundColorTokenName() -> String {
        "containerBackgroundPrimary"
    }

    // MARK: - Header Colors

    public static func titleColor() -> Color {
        DSColor.textOnSurfaceColorPrimary
    }

    public static func titleColorTokenName() -> String {
        "textOnSurfaceColorPrimary"
    }

    public static func closeButtonColor() -> Color {
        DSColor.iconColorPrimary
    }

    public static func closeButtonColorTokenName() -> String {
        "iconColorPrimary"
    }

    public static func clearButtonColor() -> Color {
        DSColor.textOnSurfaceColorLink
    }

    public static func clearButtonColorTokenName() -> String {
        "textOnSurfaceColorLink"
    }

    // MARK: - Category Colors

    public static func categoryBackgroundColor() -> Color {
        DSColor.containerBackgroundSecondary
    }

    public static func categoryBackgroundColorTokenName() -> String {
        "containerBackgroundSecondary"
    }

    public static func categoryTitleColor() -> Color {
        DSColor.textOnSurfaceColorPrimary
    }

    public static func categoryTitleColorTokenName() -> String {
        "textOnSurfaceColorPrimary"
    }

    public static func selectedCountColor() -> Color {
        DSColor.textOnSurfaceColorSecondary
    }

    public static func selectedCountColorTokenName() -> String {
        "textOnSurfaceColorSecondary"
    }

    public static func chevronColor() -> Color {
        DSColor.iconColorSecondary
    }

    public static func chevronColorTokenName() -> String {
        "iconColorSecondary"
    }

    // MARK: - Option Colors

    public static func optionBackgroundColor() -> Color {
        DSColor.containerBackgroundTertiary
    }

    public static func optionBackgroundColorTokenName() -> String {
        "containerBackgroundTertiary"
    }

    public static func optionLabelColor() -> Color {
        DSColor.textOnSurfaceColorPrimary
    }

    public static func optionLabelColorTokenName() -> String {
        "textOnSurfaceColorPrimary"
    }

    public static func optionCountColor() -> Color {
        DSColor.textOnSurfaceColorSecondary
    }

    public static func optionCountColorTokenName() -> String {
        "textOnSurfaceColorSecondary"
    }

    // MARK: - Checkbox Colors

    public static func checkboxBorderColor() -> Color {
        DSColor.borderColorPrimary
    }

    public static func checkboxBorderColorTokenName() -> String {
        "borderColorPrimary"
    }

    public static func checkboxSelectedColor() -> Color {
        DSColor.containerBackgroundBrand
    }

    public static func checkboxSelectedColorTokenName() -> String {
        "containerBackgroundBrand"
    }

    public static func checkmarkColor() -> Color {
        DSColor.iconOnBrandColorPrimary
    }

    public static func checkmarkColorTokenName() -> String {
        "iconOnBrandColorPrimary"
    }

    // MARK: - View Results Button Colors

    public static func viewResultsBackgroundColor() -> Color {
        DSColor.containerBackgroundBrand
    }

    public static func viewResultsBackgroundColorTokenName() -> String {
        "containerBackgroundBrand"
    }

    public static func viewResultsTextColor() -> Color {
        DSColor.textOnBrandColorPrimary
    }

    public static func viewResultsTextColorTokenName() -> String {
        "textOnBrandColorPrimary"
    }
}
