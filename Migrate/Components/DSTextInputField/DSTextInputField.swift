import SwiftUI

// MARK: - DSTextInputFieldState

/// The visual state of the text input field.
public enum DSTextInputFieldState: Equatable, Sendable {
    /// Default state
    case `default`
    /// Focused/active state
    case focused
    /// Error state with optional message
    case error(message: String?)
    /// Success state
    case success
    /// Disabled/inactive state
    case disabled
}

// MARK: - DSTextInputFieldAdornment

/// Adornment configuration for input fields.
public struct DSTextInputFieldAdornment: Equatable, Sendable {
    public enum Content: Equatable, Sendable {
        case icon(Image)
        case text(String)
    }

    public let content: Content
    public let action: (() -> Void)?

    public init(content: Content, action: (() -> Void)? = nil) {
        self.content = content
        self.action = action
    }

    public static func == (lhs: DSTextInputFieldAdornment, rhs: DSTextInputFieldAdornment) -> Bool {
        lhs.content == rhs.content
    }

    // MARK: - Factory Methods

    /// Creates an icon adornment.
    public static func icon(_ image: Image, action: (() -> Void)? = nil) -> DSTextInputFieldAdornment {
        DSTextInputFieldAdornment(content: .icon(image), action: action)
    }

    /// Creates a text adornment (e.g., "$" prefix).
    public static func text(_ text: String) -> DSTextInputFieldAdornment {
        DSTextInputFieldAdornment(content: .text(text), action: nil)
    }

    /// Creates a clear button adornment.
    public static func clearButton(action: @escaping () -> Void) -> DSTextInputFieldAdornment {
        DSTextInputFieldAdornment(content: .icon(Image(systemName: "xmark.circle.fill")), action: action)
    }

    /// Creates a password visibility toggle adornment.
    public static func passwordToggle(isSecure: Bool, action: @escaping () -> Void) -> DSTextInputFieldAdornment {
        let icon = isSecure ? Image(systemName: "eye") : Image(systemName: "eye.slash")
        return DSTextInputFieldAdornment(content: .icon(icon), action: action)
    }
}

// MARK: - Layout Constants

private enum DSTextInputFieldLayout {
    static let cornerRadius: CGFloat = 8
    static let borderWidth: CGFloat = 1
    static let focusedBorderWidth: CGFloat = 2
    static let horizontalPadding: CGFloat = 12
    static let verticalPadding: CGFloat = 8
    static let minHeight: CGFloat = 48
    static let multiLineMinHeight: CGFloat = 100
    static let adornmentSize: CGFloat = 24
    static let adornmentSpacing: CGFloat = 8
    static let labelSpacing: CGFloat = 4
    static let helperTextSpacing: CGFloat = 4
    static let fontSize: CGFloat = 16
    static let labelFontSize: CGFloat = 14
    static let helperFontSize: CGFloat = 12
}

// MARK: - DSTextInputField

/// A styled text input field component matching the design system specifications.
///
/// DSTextInputField wraps the standard TextField/TextEditor with custom styling,
/// supporting labels, helper text, adornments, and various states.
///
/// Example usage:
/// ```swift
/// @State private var email = ""
///
/// DSTextInputField(
///     text: $email,
///     label: "Email Address",
///     placeholder: "Enter your email",
///     isRequired: true,
///     state: .default,
///     leadingAdornment: .icon(Image(systemName: "envelope")),
///     helperText: "We'll never share your email"
/// )
/// ```
public struct DSTextInputField: View {
    // MARK: - Properties

    @Binding private var text: String
    private let label: String?
    private let placeholder: String
    private let isRequired: Bool
    private let state: DSTextInputFieldState
    private let isMultiLine: Bool
    private let isSecure: Bool
    private let leadingAdornment: DSTextInputFieldAdornment?
    private let trailingAdornment: DSTextInputFieldAdornment?
    private let helperText: String?
    private let keyboardType: UIKeyboardType
    private let textContentType: UITextContentType?
    private let autocapitalization: UITextAutocapitalizationType
    private let onSubmit: (() -> Void)?

    @FocusState private var isFocused: Bool

    // MARK: - Computed Properties

    private var isDisabled: Bool {
        state == .disabled
    }

    private var effectiveState: DSTextInputFieldState {
        if isFocused && state != .error(message: nil) && state != .disabled {
            return .focused
        }
        return state
    }

    // MARK: - Initializers

    public init(
        text: Binding<String>,
        label: String? = nil,
        placeholder: String = "",
        isRequired: Bool = false,
        state: DSTextInputFieldState = .default,
        isMultiLine: Bool = false,
        isSecure: Bool = false,
        leadingAdornment: DSTextInputFieldAdornment? = nil,
        trailingAdornment: DSTextInputFieldAdornment? = nil,
        helperText: String? = nil,
        keyboardType: UIKeyboardType = .default,
        textContentType: UITextContentType? = nil,
        autocapitalization: UITextAutocapitalizationType = .sentences,
        onSubmit: (() -> Void)? = nil
    ) {
        self._text = text
        self.label = label
        self.placeholder = placeholder
        self.isRequired = isRequired
        self.state = state
        self.isMultiLine = isMultiLine
        self.isSecure = isSecure
        self.leadingAdornment = leadingAdornment
        self.trailingAdornment = trailingAdornment
        self.helperText = helperText
        self.keyboardType = keyboardType
        self.textContentType = textContentType
        self.autocapitalization = autocapitalization
        self.onSubmit = onSubmit
    }

    // MARK: - Body

    public var body: some View {
        VStack(alignment: .leading, spacing: DSTextInputFieldLayout.labelSpacing) {
            // Label
            if let label {
                labelView(label)
            }

            // Input Container
            inputContainer

            // Helper Text / Error Message
            helperTextView
        }
        .opacity(isDisabled ? 0.5 : 1.0)
    }

    // MARK: - Label View

    @ViewBuilder
    private func labelView(_ label: String) -> some View {
        HStack(spacing: 4) {
            Text(label)
                .font(.system(size: DSTextInputFieldLayout.labelFontSize, weight: .regular))
                .foregroundColor(DSTextInputFieldColorHelper.labelColor(state: effectiveState))

            if isRequired {
                Text("*")
                    .font(.system(size: DSTextInputFieldLayout.labelFontSize, weight: .regular))
                    .foregroundColor(DSTextInputFieldColorHelper.labelColor(state: effectiveState))
            } else {
                Text("(optional)")
                    .font(.system(size: DSTextInputFieldLayout.labelFontSize, weight: .regular))
                    .foregroundColor(DSTextInputFieldColorHelper.optionalLabelColor())
            }
        }
    }

    // MARK: - Input Container

    @ViewBuilder
    private var inputContainer: some View {
        HStack(spacing: DSTextInputFieldLayout.adornmentSpacing) {
            // Leading Adornment
            if let adornment = leadingAdornment {
                adornmentView(adornment)
            }

            // Text Input
            inputField
                .focused($isFocused)

            // Trailing Adornment
            if let adornment = trailingAdornment {
                adornmentView(adornment)
            }

            // State indicator icon
            stateIndicatorIcon
        }
        .padding(.horizontal, DSTextInputFieldLayout.horizontalPadding)
        .padding(.vertical, DSTextInputFieldLayout.verticalPadding)
        .frame(minHeight: isMultiLine ? DSTextInputFieldLayout.multiLineMinHeight : DSTextInputFieldLayout.minHeight)
        .background(backgroundView)
        .overlay(borderView)
    }

    // MARK: - Input Field

    @ViewBuilder
    private var inputField: some View {
        if isMultiLine {
            TextEditor(text: $text)
                .font(.system(size: DSTextInputFieldLayout.fontSize))
                .foregroundColor(DSTextInputFieldColorHelper.textColor(state: effectiveState))
                .scrollContentBackground(.hidden)
                .disabled(isDisabled)
        } else if isSecure {
            SecureField(placeholder, text: $text)
                .font(.system(size: DSTextInputFieldLayout.fontSize))
                .foregroundColor(DSTextInputFieldColorHelper.textColor(state: effectiveState))
                .textContentType(textContentType)
                .disabled(isDisabled)
                .onSubmit { onSubmit?() }
        } else {
            TextField(placeholder, text: $text)
                .font(.system(size: DSTextInputFieldLayout.fontSize))
                .foregroundColor(DSTextInputFieldColorHelper.textColor(state: effectiveState))
                .keyboardType(keyboardType)
                .textContentType(textContentType)
                .autocapitalization(autocapitalization)
                .disabled(isDisabled)
                .onSubmit { onSubmit?() }
        }
    }

    // MARK: - Adornment View

    @ViewBuilder
    private func adornmentView(_ adornment: DSTextInputFieldAdornment) -> some View {
        Group {
            switch adornment.content {
            case let .icon(image):
                if let action = adornment.action {
                    Button(action: action) {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: DSTextInputFieldLayout.adornmentSize, height: DSTextInputFieldLayout.adornmentSize)
                            .foregroundColor(DSTextInputFieldColorHelper.adornmentColor(state: effectiveState))
                    }
                    .buttonStyle(.plain)
                } else {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: DSTextInputFieldLayout.adornmentSize, height: DSTextInputFieldLayout.adornmentSize)
                        .foregroundColor(DSTextInputFieldColorHelper.adornmentColor(state: effectiveState))
                }
            case let .text(text):
                Text(text)
                    .font(.system(size: DSTextInputFieldLayout.fontSize, weight: .medium))
                    .foregroundColor(DSTextInputFieldColorHelper.adornmentColor(state: effectiveState))
            }
        }
    }

    // MARK: - State Indicator Icon

    @ViewBuilder
    private var stateIndicatorIcon: some View {
        switch effectiveState {
        case .error:
            Image(systemName: "exclamationmark.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 16, height: 16)
                .foregroundColor(DSTextInputFieldColorHelper.errorColor())
        case .success:
            Image(systemName: "checkmark.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 16, height: 16)
                .foregroundColor(DSTextInputFieldColorHelper.successColor())
        default:
            EmptyView()
        }
    }

    // MARK: - Background View

    @ViewBuilder
    private var backgroundView: some View {
        RoundedRectangle(cornerRadius: DSTextInputFieldLayout.cornerRadius)
            .fill(DSTextInputFieldColorHelper.backgroundColor(state: effectiveState))
    }

    // MARK: - Border View

    @ViewBuilder
    private var borderView: some View {
        RoundedRectangle(cornerRadius: DSTextInputFieldLayout.cornerRadius)
            .stroke(
                DSTextInputFieldColorHelper.borderColor(state: effectiveState),
                lineWidth: effectiveState == .focused ? DSTextInputFieldLayout.focusedBorderWidth : DSTextInputFieldLayout.borderWidth
            )
    }

    // MARK: - Helper Text View

    @ViewBuilder
    private var helperTextView: some View {
        if case let .error(message) = state, let errorMessage = message {
            Text(errorMessage)
                .font(.system(size: DSTextInputFieldLayout.helperFontSize, weight: .regular))
                .foregroundColor(DSTextInputFieldColorHelper.errorColor())
        } else if let helperText {
            Text(helperText)
                .font(.system(size: DSTextInputFieldLayout.helperFontSize, weight: .regular))
                .foregroundColor(DSTextInputFieldColorHelper.helperTextColor())
        }
    }
}

// MARK: - Convenience Initializers

extension DSTextInputField {
    /// Creates an email input field.
    public static func email(
        text: Binding<String>,
        label: String = "Email",
        isRequired: Bool = true,
        state: DSTextInputFieldState = .default
    ) -> DSTextInputField {
        DSTextInputField(
            text: text,
            label: label,
            placeholder: "Enter your email",
            isRequired: isRequired,
            state: state,
            leadingAdornment: .icon(Image(systemName: "envelope")),
            keyboardType: .emailAddress,
            textContentType: .emailAddress,
            autocapitalization: .none
        )
    }

    /// Creates a password input field.
    public static func password(
        text: Binding<String>,
        label: String = "Password",
        isRequired: Bool = true,
        isSecure: Bool = true,
        state: DSTextInputFieldState = .default,
        onToggleVisibility: @escaping () -> Void
    ) -> DSTextInputField {
        DSTextInputField(
            text: text,
            label: label,
            placeholder: "Enter your password",
            isRequired: isRequired,
            state: state,
            isSecure: isSecure,
            trailingAdornment: .passwordToggle(isSecure: isSecure, action: onToggleVisibility),
            textContentType: .password,
            autocapitalization: .none
        )
    }

    /// Creates a search input field.
    public static func search(
        text: Binding<String>,
        placeholder: String = "Search",
        onClear: @escaping () -> Void
    ) -> DSTextInputField {
        DSTextInputField(
            text: text,
            placeholder: placeholder,
            leadingAdornment: .icon(Image(systemName: "magnifyingglass")),
            trailingAdornment: text.wrappedValue.isEmpty ? nil : .clearButton(action: onClear),
            autocapitalization: .none
        )
    }

    /// Creates a currency input field.
    public static func currency(
        text: Binding<String>,
        label: String,
        isRequired: Bool = false,
        state: DSTextInputFieldState = .default
    ) -> DSTextInputField {
        DSTextInputField(
            text: text,
            label: label,
            placeholder: "0.00",
            isRequired: isRequired,
            state: state,
            leadingAdornment: .text("$"),
            keyboardType: .decimalPad
        )
    }

    /// Creates a phone number input field.
    public static func phone(
        text: Binding<String>,
        label: String = "Phone Number",
        isRequired: Bool = false,
        state: DSTextInputFieldState = .default
    ) -> DSTextInputField {
        DSTextInputField(
            text: text,
            label: label,
            placeholder: "(555) 555-5555",
            isRequired: isRequired,
            state: state,
            leadingAdornment: .icon(Image(systemName: "phone")),
            keyboardType: .phonePad,
            textContentType: .telephoneNumber
        )
    }

    /// Creates a multi-line text area.
    public static func textArea(
        text: Binding<String>,
        label: String,
        placeholder: String = "",
        isRequired: Bool = false,
        state: DSTextInputFieldState = .default,
        helperText: String? = nil
    ) -> DSTextInputField {
        DSTextInputField(
            text: text,
            label: label,
            placeholder: placeholder,
            isRequired: isRequired,
            state: state,
            isMultiLine: true,
            helperText: helperText
        )
    }
}
