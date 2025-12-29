import SwiftUI

// MARK: - DSTextInputFieldResolvedStyle

/// Resolved style information for DSTextInputField testing.
///
/// This struct captures computed styles as concrete values using token names,
/// enabling unit tests without view rendering or environment dependencies.
public struct DSTextInputFieldResolvedStyle: Equatable, Sendable {
    // MARK: - Colors

    public let backgroundColorTokenName: String
    public let borderColorTokenName: String
    public let textColorTokenName: String
    public let labelColorTokenName: String
    public let helperTextColorTokenName: String
    public let adornmentColorTokenName: String

    // MARK: - Data

    public let label: String?
    public let placeholder: String
    public let isRequired: Bool
    public let state: DSTextInputFieldState
    public let isMultiLine: Bool
    public let hasLeadingAdornment: Bool
    public let hasTrailingAdornment: Bool
    public let helperText: String?

    // MARK: - Initializer

    public init(
        backgroundColorTokenName: String,
        borderColorTokenName: String,
        textColorTokenName: String,
        labelColorTokenName: String,
        helperTextColorTokenName: String,
        adornmentColorTokenName: String,
        label: String?,
        placeholder: String,
        isRequired: Bool,
        state: DSTextInputFieldState,
        isMultiLine: Bool,
        hasLeadingAdornment: Bool,
        hasTrailingAdornment: Bool,
        helperText: String?
    ) {
        self.backgroundColorTokenName = backgroundColorTokenName
        self.borderColorTokenName = borderColorTokenName
        self.textColorTokenName = textColorTokenName
        self.labelColorTokenName = labelColorTokenName
        self.helperTextColorTokenName = helperTextColorTokenName
        self.adornmentColorTokenName = adornmentColorTokenName
        self.label = label
        self.placeholder = placeholder
        self.isRequired = isRequired
        self.state = state
        self.isMultiLine = isMultiLine
        self.hasLeadingAdornment = hasLeadingAdornment
        self.hasTrailingAdornment = hasTrailingAdornment
        self.helperText = helperText
    }

    // MARK: - Factory

    /// Creates a resolved style for the given parameters.
    public static func create(
        label: String?,
        placeholder: String,
        isRequired: Bool,
        state: DSTextInputFieldState,
        isMultiLine: Bool,
        hasLeadingAdornment: Bool,
        hasTrailingAdornment: Bool,
        helperText: String?
    ) -> DSTextInputFieldResolvedStyle {
        DSTextInputFieldResolvedStyle(
            backgroundColorTokenName: DSTextInputFieldColorHelper.backgroundColorTokenName(),
            borderColorTokenName: DSTextInputFieldColorHelper.borderColorTokenName(state: state),
            textColorTokenName: DSTextInputFieldColorHelper.textColorTokenName(state: state),
            labelColorTokenName: DSTextInputFieldColorHelper.labelColorTokenName(state: state),
            helperTextColorTokenName: DSTextInputFieldColorHelper.helperTextColorTokenName(),
            adornmentColorTokenName: DSTextInputFieldColorHelper.adornmentColorTokenName(state: state),
            label: label,
            placeholder: placeholder,
            isRequired: isRequired,
            state: state,
            isMultiLine: isMultiLine,
            hasLeadingAdornment: hasLeadingAdornment,
            hasTrailingAdornment: hasTrailingAdornment,
            helperText: helperText
        )
    }
}
