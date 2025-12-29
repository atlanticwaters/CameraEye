import SwiftUI

// MARK: - DSPLPFilterSheetColorHelper

/// Helper for computing PLP Filter Sheet colors based on theme.
public enum DSPLPFilterSheetColorHelper {
    // MARK: - Background Colors

    public static func backgroundColor() -> Color {
        DSColor.backgroundActionColorPrimary.resolve
    }

    public static func backgroundColorTokenName() -> String {
        "backgroundActionColorPrimary"
    }

    public static func headerBackgroundColor() -> Color {
        DSColor.backgroundActionColorPrimary.resolve
    }

    public static func headerBackgroundColorTokenName() -> String {
        "backgroundActionColorPrimary"
    }

    public static func bottomBarBackgroundColor() -> Color {
        DSColor.backgroundActionColorPrimary.resolve
    }

    public static func bottomBarBackgroundColorTokenName() -> String {
        "backgroundActionColorPrimary"
    }

    // MARK: - Header Colors

    public static func titleColor() -> Color {
        DSColor.textOnSurfaceColorPrimary.resolve
    }

    public static func titleColorTokenName() -> String {
        "textOnSurfaceColorPrimary"
    }

    public static func closeButtonColor() -> Color {
        DSColor.iconColorPrimary.resolve
    }

    public static func closeButtonColorTokenName() -> String {
        "iconColorPrimary"
    }

    public static func clearButtonColor() -> Color {
        DSColor.textOnSurfaceColorLink.resolve
    }

    public static func clearButtonColorTokenName() -> String {
        "textOnSurfaceColorLink"
    }

    // MARK: - Category Colors

    public static func categoryBackgroundColor() -> Color {
        DSColor.backgroundSurfaceColorSecondary.resolve
    }

    public static func categoryBackgroundColorTokenName() -> String {
        "backgroundSurfaceColorSecondary"
    }

    public static func categoryTitleColor() -> Color {
        DSColor.textOnSurfaceColorPrimary.resolve
    }

    public static func categoryTitleColorTokenName() -> String {
        "textOnSurfaceColorPrimary"
    }

    public static func selectedCountColor() -> Color {
        DSColor.textOnSurfaceColorSecondary.resolve
    }

    public static func selectedCountColorTokenName() -> String {
        "textOnSurfaceColorSecondary"
    }

    public static func chevronColor() -> Color {
        DSColor.iconColorSecondary.resolve
    }

    public static func chevronColorTokenName() -> String {
        "iconColorSecondary"
    }

    // MARK: - Option Colors

    public static func optionBackgroundColor() -> Color {
        DSColor.backgroundSurfaceColorTertiary.resolve
    }

    public static func optionBackgroundColorTokenName() -> String {
        "backgroundSurfaceColorTertiary"
    }

    public static func optionLabelColor() -> Color {
        DSColor.textOnSurfaceColorPrimary.resolve
    }

    public static func optionLabelColorTokenName() -> String {
        "textOnSurfaceColorPrimary"
    }

    public static func optionCountColor() -> Color {
        DSColor.textOnSurfaceColorSecondary.resolve
    }

    public static func optionCountColorTokenName() -> String {
        "textOnSurfaceColorSecondary"
    }

    // MARK: - Checkbox Colors

    public static func checkboxBorderColor() -> Color {
        DSColor.borderColorPrimary.resolve
    }

    public static func checkboxBorderColorTokenName() -> String {
        "borderColorPrimary"
    }

    public static func checkboxSelectedColor() -> Color {
        DSColor.containerBackgroundBrand.resolve
    }

    public static func checkboxSelectedColorTokenName() -> String {
        "containerBackgroundBrand"
    }

    public static func checkmarkColor() -> Color {
        DSColor.iconOnBrandColorPrimary.resolve
    }

    public static func checkmarkColorTokenName() -> String {
        "iconOnBrandColorPrimary"
    }

    // MARK: - View Results Button Colors

    public static func viewResultsBackgroundColor() -> Color {
        DSColor.containerBackgroundBrand.resolve
    }

    public static func viewResultsBackgroundColorTokenName() -> String {
        "containerBackgroundBrand"
    }

    public static func viewResultsTextColor() -> Color {
        DSColor.textOnBrandColorPrimary.resolve
    }

    public static func viewResultsTextColorTokenName() -> String {
        "textOnBrandColorPrimary"
    }
}
