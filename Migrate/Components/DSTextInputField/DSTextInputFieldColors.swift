import SwiftUI

// MARK: - DSTextInputFieldColorHelper

/// Helper for computing text input field colors.
public enum DSTextInputFieldColorHelper {
    // MARK: - Background

    /// Returns the background color for the input field.
    public static func backgroundColor(state: DSTextInputFieldState) -> Color {
        DSColor.containerBackgroundPrimary.resolve
    }

    /// Returns the background color token name for testing.
    public static func backgroundColorTokenName() -> String {
        "containerBackgroundPrimary"
    }

    // MARK: - Border

    /// Returns the border color based on state.
    public static func borderColor(state: DSTextInputFieldState) -> Color {
        switch state {
        case .default:
            return DSColor.borderColorPrimary.resolve
        case .focused:
            return DSColor.borderColorBrand.resolve
        case .error:
            return DSColor.borderColorDanger.resolve
        case .success:
            return DSColor.borderColorSuccess.resolve
        case .disabled:
            return DSColor.borderColorSecondary.resolve
        }
    }

    /// Returns the border color token name for testing.
    public static func borderColorTokenName(state: DSTextInputFieldState) -> String {
        switch state {
        case .default:
            return "borderColorPrimary"
        case .focused:
            return "borderColorBrand"
        case .error:
            return "borderColorDanger"
        case .success:
            return "borderColorSuccess"
        case .disabled:
            return "borderColorSecondary"
        }
    }

    // MARK: - Text

    /// Returns the text color based on state.
    public static func textColor(state: DSTextInputFieldState) -> Color {
        switch state {
        case .disabled:
            return DSColor.textOnSurfaceColorTertiary.resolve
        default:
            return DSColor.textOnSurfaceColorPrimary.resolve
        }
    }

    /// Returns the text color token name for testing.
    public static func textColorTokenName(state: DSTextInputFieldState) -> String {
        switch state {
        case .disabled:
            return "textOnSurfaceColorTertiary"
        default:
            return "textOnSurfaceColorPrimary"
        }
    }

    // MARK: - Placeholder

    /// Returns the placeholder text color.
    public static func placeholderColor() -> Color {
        DSColor.textOnSurfaceColorSecondary.resolve
    }

    /// Returns the placeholder color token name for testing.
    public static func placeholderColorTokenName() -> String {
        "textOnSurfaceColorSecondary"
    }

    // MARK: - Label

    /// Returns the label text color based on state.
    public static func labelColor(state: DSTextInputFieldState) -> Color {
        switch state {
        case .error:
            return DSColor.textOnSurfaceColorDanger.resolve
        case .disabled:
            return DSColor.textOnSurfaceColorTertiary.resolve
        default:
            return DSColor.textOnSurfaceColorPrimary.resolve
        }
    }

    /// Returns the label color token name for testing.
    public static func labelColorTokenName(state: DSTextInputFieldState) -> String {
        switch state {
        case .error:
            return "textOnSurfaceColorDanger"
        case .disabled:
            return "textOnSurfaceColorTertiary"
        default:
            return "textOnSurfaceColorPrimary"
        }
    }

    /// Returns the optional label text color.
    public static func optionalLabelColor() -> Color {
        DSColor.textOnSurfaceColorSecondary.resolve
    }

    /// Returns the optional label color token name for testing.
    public static func optionalLabelColorTokenName() -> String {
        "textOnSurfaceColorSecondary"
    }

    // MARK: - Helper Text

    /// Returns the helper text color.
    public static func helperTextColor() -> Color {
        DSColor.textOnSurfaceColorSecondary.resolve
    }

    /// Returns the helper text color token name for testing.
    public static func helperTextColorTokenName() -> String {
        "textOnSurfaceColorSecondary"
    }

    // MARK: - Adornment

    /// Returns the adornment color based on state.
    public static func adornmentColor(state: DSTextInputFieldState) -> Color {
        switch state {
        case .disabled:
            return DSColor.iconColorTertiary.resolve
        default:
            return DSColor.iconColorSecondary.resolve
        }
    }

    /// Returns the adornment color token name for testing.
    public static func adornmentColorTokenName(state: DSTextInputFieldState) -> String {
        switch state {
        case .disabled:
            return "iconColorTertiary"
        default:
            return "iconColorSecondary"
        }
    }

    // MARK: - State Colors

    /// Returns the error color.
    public static func errorColor() -> Color {
        DSColor.textOnSurfaceColorDanger.resolve
    }

    /// Returns the error color token name for testing.
    public static func errorColorTokenName() -> String {
        "textOnSurfaceColorDanger"
    }

    /// Returns the success color.
    public static func successColor() -> Color {
        DSColor.textOnSurfaceColorSuccess.resolve
    }

    /// Returns the success color token name for testing.
    public static func successColorTokenName() -> String {
        "textOnSurfaceColorSuccess"
    }
}
