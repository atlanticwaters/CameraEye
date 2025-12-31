import SwiftUI

// MARK: - DSTextInputField Showcase View

/// Comprehensive showcase of the DSTextInputField component
///
/// Demonstrates:
/// - All 5 states (default, focused, error, success, disabled)
/// - Labels and helper text
/// - Leading and trailing adornments
/// - Secure/password fields
/// - Multi-line text areas
/// - Factory methods (email, password, search, currency, phone, textArea)
/// - Interactive examples
/// - Dark mode support
/// - Real-world usage examples

struct DSTextInputFieldView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing6) {

                // MARK: - Header Card
                VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                    Text("Text Input Field")
                        .thdFont(.hero5)
                        .foregroundStyle(textPrimary)

                    Text("A styled text input component supporting labels, helper text, adornments, and various states. Includes factory methods for common field types.")
                        .thdFont(.bodyMd)
                        .foregroundStyle(textSecondary)
                }
                .padding(TokensCoreLight.Spacing4)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: borderRadiusXl)
                        .fill(containerWhite)
                )

                // MARK: - Content Card
                VStack(alignment: .leading, spacing: TokensCoreLight.Spacing6) {

                    // Input States
                    inputStatesSection

                    Divider().padding(.vertical, TokensCoreLight.Spacing2)

                    // Labels and Helper Text
                    labelsSection

                    Divider().padding(.vertical, TokensCoreLight.Spacing2)

                    // Adornments
                    adornmentsSection

                    Divider().padding(.vertical, TokensCoreLight.Spacing2)

                    // Factory Methods
                    factoryMethodsSection

                    Divider().padding(.vertical, TokensCoreLight.Spacing2)

                    // Interactive Examples
                    interactiveSection

                    Divider().padding(.vertical, TokensCoreLight.Spacing2)

                    // Usage Examples
                    usageExamplesSection

                    Divider().padding(.vertical, TokensCoreLight.Spacing2)

                    // Specifications
                    specificationsSection
                }
                .padding(TokensCoreLight.Spacing4)
                .background(
                    RoundedRectangle(cornerRadius: borderRadiusXl)
                        .fill(containerWhite)
                )
            }
            .padding(TokensCoreLight.Spacing4)
            .padding(.top, TokensCoreLight.Spacing24)
            .padding(.bottom, TokensCoreLight.Spacing20)
        }
        .background(surfaceGreige)
        .applySoftScrollEdges()
    }

    // MARK: - Input States Section

    private var inputStatesSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader(
                "Input States",
                description: "5 visual states for different contexts"
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                InputStateExample(title: "Default", description: "Normal idle state", state: .default)
                InputStateExample(title: "Focused", description: "Active/editing state", state: .focused)
                InputStateExample(title: "Error", description: "Validation error state", state: .error(message: "Invalid input"))
                InputStateExample(title: "Success", description: "Valid/confirmed state", state: .success)
                InputStateExample(title: "Disabled", description: "Non-interactive state", state: .disabled)
            }
        }
    }

    // MARK: - Labels Section

    private var labelsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader(
                "Labels & Helper Text",
                description: "Field labels, required indicators, and helper text"
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                LabelExample(
                    title: "Required Field",
                    description: "Shows asterisk indicator",
                    isRequired: true,
                    helperText: nil
                )

                LabelExample(
                    title: "Optional Field",
                    description: "Shows (optional) text",
                    isRequired: false,
                    helperText: nil
                )

                LabelExample(
                    title: "With Helper Text",
                    description: "Additional guidance below field",
                    isRequired: false,
                    helperText: "This is helper text"
                )
            }
        }
    }

    // MARK: - Adornments Section

    private var adornmentsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader(
                "Adornments",
                description: "Leading and trailing icons or text"
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                AdornmentExample(
                    title: "Leading Icon",
                    description: "Icon before input",
                    leading: .icon(Image(systemName: "envelope")),
                    trailing: nil
                )

                AdornmentExample(
                    title: "Trailing Icon",
                    description: "Icon after input (e.g., clear button)",
                    leading: nil,
                    trailing: .icon(Image(systemName: "xmark.circle.fill"))
                )

                AdornmentExample(
                    title: "Text Adornment",
                    description: "Text prefix (e.g., currency)",
                    leading: .text("$"),
                    trailing: nil
                )

                AdornmentExample(
                    title: "Both Adornments",
                    description: "Leading and trailing",
                    leading: .icon(Image(systemName: "magnifyingglass")),
                    trailing: .icon(Image(systemName: "xmark.circle.fill"))
                )
            }
        }
    }

    // MARK: - Factory Methods Section

    private var factoryMethodsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader(
                "Factory Methods",
                description: "Pre-configured field types"
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                EmailFactoryExample()
                PasswordFactoryExample()
                SearchFactoryExample()
                CurrencyFactoryExample()
                PhoneFactoryExample()
                TextAreaFactoryExample()
            }
        }
    }

    // MARK: - Interactive Section

    private var interactiveSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader("Interactive Examples", description: "Try the input fields")

            VStack(spacing: TokensCoreLight.Spacing4) {
                InteractiveValidationExample()

                InteractivePasswordToggle()
            }
            .padding(TokensCoreLight.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(containerGreige)
            )
        }
    }

    // MARK: - Usage Examples Section

    private var usageExamplesSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader("Usage Examples", description: "Real-world component usage")

            Text("Login Form")
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)

            LoginFormExample()

            Text("Contact Form")
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
                .padding(.top, TokensCoreLight.Spacing2)

            ContactFormExample()
        }
    }

    // MARK: - Specifications Section

    private var specificationsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader("Specifications", description: "Component details and dimensions")

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                specRow("Component", value: "DSTextInputField")
                specRow("States", value: "5 (default, focused, error, success, disabled)")
                specRow("Min Height", value: "48pt")
                specRow("Multi-line Min Height", value: "100pt")
                specRow("Horizontal Padding", value: "12pt")
                specRow("Vertical Padding", value: "8pt")
                specRow("Corner Radius", value: "8pt")
                specRow("Border Width", value: "1pt (2pt focused)")
                specRow("Adornment Size", value: "24pt")
                specRow("Font Size", value: "16pt")
            }
            .padding(TokensCoreLight.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(containerGreige)
            )

            Text("Code Example")
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
                .padding(.top, TokensCoreLight.Spacing2)

            codeExample("""
// Basic text field
DSTextInputField(
    text: $email,
    label: "Email Address",
    placeholder: "Enter your email",
    isRequired: true,
    leadingAdornment: .icon(Image(systemName: "envelope")),
    helperText: "We'll never share your email"
)

// Factory methods
DSTextInputField.email(text: $email)
DSTextInputField.password(
    text: $password,
    isSecure: isSecure,
    onToggleVisibility: { isSecure.toggle() }
)
DSTextInputField.search(text: $query, onClear: { query = "" })
DSTextInputField.currency(text: $amount, label: "Price")
DSTextInputField.textArea(text: $message, label: "Message")
""")
        }
    }

    private func codeExample(_ code: String) -> some View {
        Text(code)
            .thdFont(.caption)
            .foregroundStyle(textSecondary)
            .font(.system(.caption, design: .monospaced))
            .padding(TokensCoreLight.Spacing3)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(codeBlockBg)
            )
    }

    private func specRow(_ label: String, value: String) -> some View {
        HStack {
            Text(label)
                .thdFont(.caption)
                .foregroundStyle(textTertiary)

            Spacer()

            Text(value)
                .thdFont(.caption)
                .foregroundStyle(textSecondary)
        }
    }

    // MARK: - Helper Methods

    private func sectionHeader(_ title: String, description: String) -> some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
            Text(title)
                .thdFont(.h3)
                .foregroundStyle(textPrimary)

            Text(description)
                .thdFont(.caption)
                .foregroundStyle(textTertiary)
        }
    }

    // MARK: - Theme-Aware Colors

    private var textPrimary: Color { tokens.TextOnContainerColorPrimary }
    private var textSecondary: Color { tokens.TextOnContainerColorSecondary }
    private var textTertiary: Color { tokens.TextOnContainerColorTertiary }
    private var containerWhite: Color { tokens.BackgroundContainerColorWhite }
    private var containerGreige: Color { tokens.BackgroundContainerColorGreige }
    private var codeBlockBg: Color { tokens.BackgroundContainerColorTransparent05 }
    private var surfaceGreige: Color { tokens.BackgroundSurfaceColorGreige }
    private var borderRadiusLg: CGFloat { tokens.BorderRadiusLg }
    private var borderRadiusXl: CGFloat { tokens.BorderRadiusXl }

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }
}

// MARK: - Supporting Views

/// Input state example
private struct InputStateExample: View {
    @Environment(\.colorScheme) var colorScheme

    let title: String
    let description: String
    let state: DSTextInputFieldState

    @State private var text = "Example text"

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                Text(title)
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorPrimary)

                Text(description)
                    .thdFont(.caption)
                    .foregroundStyle(tokens.TextOnContainerColorTertiary)
            }

            DSTextInputField(
                text: $text,
                label: "Field Label",
                placeholder: "Placeholder text",
                state: state
            )
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: tokens.BorderRadiusLg)
                .fill(tokens.BackgroundContainerColorGreige)
        )
    }
}

/// Label example
private struct LabelExample: View {
    @Environment(\.colorScheme) var colorScheme

    let title: String
    let description: String
    let isRequired: Bool
    let helperText: String?

    @State private var text = ""

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                Text(title)
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorPrimary)

                Text(description)
                    .thdFont(.caption)
                    .foregroundStyle(tokens.TextOnContainerColorTertiary)
            }

            DSTextInputField(
                text: $text,
                label: "Field Label",
                placeholder: "Enter text",
                isRequired: isRequired,
                helperText: helperText
            )
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: tokens.BorderRadiusLg)
                .fill(tokens.BackgroundContainerColorGreige)
        )
    }
}

/// Adornment example
private struct AdornmentExample: View {
    @Environment(\.colorScheme) var colorScheme

    let title: String
    let description: String
    let leading: DSTextInputFieldAdornment?
    let trailing: DSTextInputFieldAdornment?

    @State private var text = ""

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                Text(title)
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorPrimary)

                Text(description)
                    .thdFont(.caption)
                    .foregroundStyle(tokens.TextOnContainerColorTertiary)
            }

            DSTextInputField(
                text: $text,
                placeholder: "Enter text",
                leadingAdornment: leading,
                trailingAdornment: trailing
            )
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: tokens.BorderRadiusLg)
                .fill(tokens.BackgroundContainerColorGreige)
        )
    }
}

/// Email factory example
private struct EmailFactoryExample: View {
    @Environment(\.colorScheme) var colorScheme

    @State private var email = ""

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            Text("Email Field (.email)")
                .thdFont(.bodySm)
                .foregroundStyle(tokens.TextOnContainerColorPrimary)

            DSTextInputField.email(text: $email)
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: tokens.BorderRadiusLg)
                .fill(tokens.BackgroundContainerColorGreige)
        )
    }
}

/// Password factory example
private struct PasswordFactoryExample: View {
    @Environment(\.colorScheme) var colorScheme

    @State private var password = ""
    @State private var isSecure = true

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            Text("Password Field (.password)")
                .thdFont(.bodySm)
                .foregroundStyle(tokens.TextOnContainerColorPrimary)

            DSTextInputField.password(
                text: $password,
                isSecure: isSecure,
                onToggleVisibility: { isSecure.toggle() }
            )
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: tokens.BorderRadiusLg)
                .fill(tokens.BackgroundContainerColorGreige)
        )
    }
}

/// Search factory example
private struct SearchFactoryExample: View {
    @Environment(\.colorScheme) var colorScheme

    @State private var query = ""

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            Text("Search Field (.search)")
                .thdFont(.bodySm)
                .foregroundStyle(tokens.TextOnContainerColorPrimary)

            DSTextInputField.search(text: $query, onClear: { query = "" })
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: tokens.BorderRadiusLg)
                .fill(tokens.BackgroundContainerColorGreige)
        )
    }
}

/// Currency factory example
private struct CurrencyFactoryExample: View {
    @Environment(\.colorScheme) var colorScheme

    @State private var amount = ""

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            Text("Currency Field (.currency)")
                .thdFont(.bodySm)
                .foregroundStyle(tokens.TextOnContainerColorPrimary)

            DSTextInputField.currency(text: $amount, label: "Price")
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: tokens.BorderRadiusLg)
                .fill(tokens.BackgroundContainerColorGreige)
        )
    }
}

/// Phone factory example
private struct PhoneFactoryExample: View {
    @Environment(\.colorScheme) var colorScheme

    @State private var phone = ""

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            Text("Phone Field (.phone)")
                .thdFont(.bodySm)
                .foregroundStyle(tokens.TextOnContainerColorPrimary)

            DSTextInputField.phone(text: $phone)
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: tokens.BorderRadiusLg)
                .fill(tokens.BackgroundContainerColorGreige)
        )
    }
}

/// Text area factory example
private struct TextAreaFactoryExample: View {
    @Environment(\.colorScheme) var colorScheme

    @State private var message = ""

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            Text("Text Area (.textArea)")
                .thdFont(.bodySm)
                .foregroundStyle(tokens.TextOnContainerColorPrimary)

            DSTextInputField.textArea(text: $message, label: "Message", helperText: "Maximum 500 characters")
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: tokens.BorderRadiusLg)
                .fill(tokens.BackgroundContainerColorGreige)
        )
    }
}

/// Interactive validation example
private struct InteractiveValidationExample: View {
    @Environment(\.colorScheme) var colorScheme

    @State private var email = ""
    @State private var state: DSTextInputFieldState = .default

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            Text("Live Validation")
                .thdFont(.bodySm)
                .foregroundStyle(tokens.TextOnContainerColorSecondary)

            DSTextInputField(
                text: $email,
                label: "Email Address",
                placeholder: "Enter email to validate",
                isRequired: true,
                state: state,
                leadingAdornment: .icon(Image(systemName: "envelope"))
            )

            DSButton("Validate", style: .outlined, size: .small) {
                if email.isEmpty {
                    state = .error(message: "Email is required")
                } else if !email.contains("@") {
                    state = .error(message: "Invalid email format")
                } else {
                    state = .success
                }
            }
        }
        .padding(TokensCoreLight.Spacing2)
        .background(
            RoundedRectangle(cornerRadius: tokens.BorderRadiusSm)
                .fill(tokens.BackgroundContainerColorWhite)
        )
    }
}

/// Interactive password toggle
private struct InteractivePasswordToggle: View {
    @Environment(\.colorScheme) var colorScheme

    @State private var password = ""
    @State private var isSecure = true

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            HStack {
                Text("Password Visibility")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorSecondary)

                Spacer()

                Text(isSecure ? "Hidden" : "Visible")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorPrimary)
            }

            DSTextInputField.password(
                text: $password,
                isSecure: isSecure,
                onToggleVisibility: { isSecure.toggle() }
            )
        }
        .padding(TokensCoreLight.Spacing2)
        .background(
            RoundedRectangle(cornerRadius: tokens.BorderRadiusSm)
                .fill(tokens.BackgroundContainerColorWhite)
        )
    }
}

/// Login form example
private struct LoginFormExample: View {
    @Environment(\.colorScheme) var colorScheme

    @State private var email = ""
    @State private var password = ""
    @State private var isSecure = true

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    var body: some View {
        VStack(spacing: TokensCoreLight.Spacing3) {
            DSTextInputField.email(text: $email)
            DSTextInputField.password(text: $password, isSecure: isSecure, onToggleVisibility: { isSecure.toggle() })
            DSButton("Sign In", style: .orangeFilled, size: .large) {}
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: tokens.BorderRadiusLg)
                .fill(tokens.BackgroundContainerColorWhite)
        )
    }
}

/// Contact form example
private struct ContactFormExample: View {
    @Environment(\.colorScheme) var colorScheme

    @State private var name = ""
    @State private var email = ""
    @State private var message = ""

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    var body: some View {
        VStack(spacing: TokensCoreLight.Spacing3) {
            DSTextInputField(
                text: $name,
                label: "Name",
                placeholder: "Your name",
                isRequired: true,
                leadingAdornment: .icon(Image(systemName: "person"))
            )
            DSTextInputField.email(text: $email)
            DSTextInputField.textArea(text: $message, label: "Message", isRequired: true)
            DSButton("Send Message", style: .orangeFilled, size: .large) {}
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: tokens.BorderRadiusLg)
                .fill(tokens.BackgroundContainerColorWhite)
        )
    }
}

// MARK: - Token Protocol Helper
private protocol TokenSemanticProtocol {
    static var TextOnContainerColorPrimary: Color { get }
    static var TextOnContainerColorSecondary: Color { get }
    static var TextOnContainerColorTertiary: Color { get }
    static var BackgroundContainerColorWhite: Color { get }
    static var BackgroundContainerColorGreige: Color { get }
    static var BackgroundContainerColorTransparent05: Color { get }
    static var BackgroundSurfaceColorGreige: Color { get }
    static var BorderRadiusSm: CGFloat { get }
    static var BorderRadiusLg: CGFloat { get }
    static var BorderRadiusXl: CGFloat { get }
}

extension TokensSemanticLight: TokenSemanticProtocol {}
extension TokensSemanticDark: TokenSemanticProtocol {}

// MARK: - Preview
#Preview {
    DSTextInputFieldView()
}
