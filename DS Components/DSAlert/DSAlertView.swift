import SwiftUI

// MARK: - DSAlert Showcase View

/// Comprehensive showcase of the DSAlert component
///
/// Demonstrates:
/// - All 4 alert variants (informational, success, warning, error)
/// - With and without title
/// - Floating mode with shadow
/// - Dismissible alerts
/// - Interactive dismiss behavior
/// - Dark mode support
/// - Real-world usage examples

struct DSAlertView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing6) {

                // MARK: - Header Card
                VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                    Text("Alert")
                        .thdFont(.hero5)
                        .foregroundStyle(textPrimary)

                    Text("An alert component for displaying feedback messages. Supports 4 variants with optional title, floating mode, and dismiss action.")
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

                    // Alert Variants
                    alertVariantsSection

                    Divider().padding(.vertical, TokensCoreLight.Spacing2)

                    // Title Options
                    titleOptionsSection

                    Divider().padding(.vertical, TokensCoreLight.Spacing2)

                    // Floating Mode
                    floatingModeSection

                    Divider().padding(.vertical, TokensCoreLight.Spacing2)

                    // Dismiss Action
                    dismissActionSection

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

    // MARK: - Alert Variants Section

    private var alertVariantsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader(
                "Alert Variants",
                description: "4 status variants for different feedback types"
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                variantExample(
                    "Informational",
                    description: "General information (blue)",
                    variant: .informational
                )

                variantExample(
                    "Success",
                    description: "Positive confirmation (green)",
                    variant: .success
                )

                variantExample(
                    "Warning",
                    description: "Caution or attention needed (yellow)",
                    variant: .warning
                )

                variantExample(
                    "Error",
                    description: "Error or failure state (red)",
                    variant: .error
                )
            }
        }
    }

    private func variantExample(_ title: String, description: String, variant: DSAlertVariant) -> some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                Text(title)
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)

                Text(description)
                    .thdFont(.caption)
                    .foregroundStyle(textTertiary)
            }

            DSAlert(
                body: "This is a \(title.lowercased()) alert message.",
                variant: variant
            )
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }

    // MARK: - Title Options Section

    private var titleOptionsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader(
                "Title Options",
                description: "Alerts with and without headline"
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                titleOptionExample(
                    "Body Only",
                    description: "Simple alert with just body text",
                    alertTitle: nil
                )

                titleOptionExample(
                    "With Title",
                    description: "Alert with headline and body",
                    alertTitle: "Important Notice"
                )
            }
        }
    }

    private func titleOptionExample(_ title: String, description: String, alertTitle: String?) -> some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                Text(title)
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)

                Text(description)
                    .thdFont(.caption)
                    .foregroundStyle(textTertiary)
            }

            DSAlert(
                title: alertTitle,
                body: "This is the alert body text providing more details about the notification.",
                variant: .informational
            )
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }

    // MARK: - Floating Mode Section

    private var floatingModeSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader(
                "Floating Mode",
                description: "Alert with shadow elevation"
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                floatingExample(
                    "Inline (Default)",
                    description: "No shadow, flat appearance",
                    isFloating: false
                )

                floatingExample(
                    "Floating",
                    description: "With shadow for elevated appearance",
                    isFloating: true
                )
            }
        }
    }

    private func floatingExample(_ title: String, description: String, isFloating: Bool) -> some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                Text(title)
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)

                Text(description)
                    .thdFont(.caption)
                    .foregroundStyle(textTertiary)
            }

            DSAlert(
                title: "Notification",
                body: "This alert is displayed in \(isFloating ? "floating" : "inline") mode.",
                variant: .success,
                isFloating: isFloating
            )
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }

    // MARK: - Dismiss Action Section

    private var dismissActionSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader(
                "Dismiss Action",
                description: "Alerts with close button"
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                dismissExample(
                    "Without Dismiss",
                    description: "No close button",
                    hasDismiss: false
                )

                dismissExample(
                    "With Dismiss",
                    description: "Close button to dismiss alert",
                    hasDismiss: true
                )
            }
        }
    }

    private func dismissExample(_ title: String, description: String, hasDismiss: Bool) -> some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                Text(title)
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)

                Text(description)
                    .thdFont(.caption)
                    .foregroundStyle(textTertiary)
            }

            DSAlert(
                body: "This alert \(hasDismiss ? "can be dismissed" : "has no dismiss button").",
                variant: .warning,
                onDismiss: hasDismiss ? { print("Dismissed") } : nil
            )
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }

    // MARK: - Interactive Section

    private var interactiveSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader("Interactive Examples", description: "Try dismissing alerts")

            VStack(spacing: TokensCoreLight.Spacing4) {
                InteractiveDismissExample()

                InteractiveAlertToggle()
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

            Text("Form Validation")
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)

            formValidationExample

            Text("System Status")
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
                .padding(.top, TokensCoreLight.Spacing2)

            systemStatusExample

            Text("Checkout Flow")
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
                .padding(.top, TokensCoreLight.Spacing2)

            checkoutFlowExample
        }
    }

    private var formValidationExample: some View {
        VStack(spacing: TokensCoreLight.Spacing2) {
            DSAlert(
                title: "Validation Error",
                body: "Please check your email address and try again.",
                variant: .error,
                onDismiss: {}
            )
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerWhite)
        )
    }

    private var systemStatusExample: some View {
        VStack(spacing: TokensCoreLight.Spacing2) {
            DSAlert(
                title: "Scheduled Maintenance",
                body: "The system will be unavailable from 2:00 AM to 4:00 AM EST.",
                variant: .warning
            )
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerWhite)
        )
    }

    private var checkoutFlowExample: some View {
        VStack(spacing: TokensCoreLight.Spacing2) {
            DSAlert(
                title: "Order Confirmed!",
                body: "Your order #12345 has been placed successfully.",
                variant: .success,
                isFloating: true
            )
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerWhite)
        )
    }

    // MARK: - Specifications Section

    private var specificationsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader("Specifications", description: "Component details and dimensions")

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                specRow("Component", value: "DSAlert")
                specRow("Variants", value: "4 (info, success, warning, error)")
                specRow("Horizontal Padding", value: "8pt")
                specRow("Top Padding", value: "6pt")
                specRow("Bottom Padding", value: "12pt")
                specRow("Icon Size", value: "16pt")
                specRow("Corner Radius", value: "Xl")
                specRow("Close Button Size", value: "12pt (with 16pt tap area)")
            }
            .padding(TokensCoreLight.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(containerGreige)
            )

            Text("Variant Icons")
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
                .padding(.top, TokensCoreLight.Spacing2)

            variantIconsTable

            Text("Code Example")
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
                .padding(.top, TokensCoreLight.Spacing2)

            codeExample("""
// Simple alert
DSAlert(
    body: "Your changes have been saved.",
    variant: .success
)

// Full-featured alert
DSAlert(
    title: "Connection Error",
    body: "Unable to connect to the server.",
    variant: .error,
    isFloating: true
) {
    print("Alert dismissed")
}
""")
        }
    }

    private var variantIconsTable: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
            variantIconRow("Informational", icon: "info.circle.fill")
            variantIconRow("Success", icon: "checkmark.circle.fill")
            variantIconRow("Warning", icon: "exclamationmark.triangle.fill")
            variantIconRow("Error", icon: "xmark.circle.fill")
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }

    private func variantIconRow(_ variant: String, icon: String) -> some View {
        HStack {
            Text(variant)
                .thdFont(.caption)
                .foregroundStyle(textPrimary)

            Spacer()

            Text(icon)
                .thdFont(.caption)
                .foregroundStyle(textTertiary)
        }
        .padding(.vertical, 4)
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

    private var textPrimary: Color {
        tokens.TextOnContainerColorPrimary
    }

    private var textSecondary: Color {
        tokens.TextOnContainerColorSecondary
    }

    private var textTertiary: Color {
        tokens.TextOnContainerColorTertiary
    }

    private var containerWhite: Color {
        tokens.BackgroundContainerColorWhite
    }

    private var containerGreige: Color {
        tokens.BackgroundContainerColorGreige
    }

    private var surfaceGreige: Color {
        tokens.BackgroundSurfaceColorGreige
    }

    private var codeBlockBg: Color {
        tokens.BackgroundContainerColorTransparent05
    }

    private var borderRadiusLg: CGFloat {
        tokens.BorderRadiusLg
    }

    private var borderRadiusXl: CGFloat {
        tokens.BorderRadiusXl
    }

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }
}

// MARK: - Supporting Views

/// Interactive dismiss example
private struct InteractiveDismissExample: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var showAlert = true
    @State private var dismissCount = 0

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            HStack {
                Text("Dismissible Alert")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorSecondary)

                Spacer()

                Text("Dismissed: \(dismissCount)x")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorPrimary)
            }

            if showAlert {
                DSAlert(
                    title: "Try Dismissing",
                    body: "Tap the X button to dismiss this alert.",
                    variant: .informational,
                    onDismiss: {
                        showAlert = false
                        dismissCount += 1
                    }
                )
            } else {
                DSButton("Show Alert Again", style: .outlined, size: .medium) {
                    showAlert = true
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

/// Interactive variant toggle example
private struct InteractiveAlertToggle: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var currentVariantIndex = 0

    private let variants: [(DSAlertVariant, String)] = [
        (.informational, "Informational"),
        (.success, "Success"),
        (.warning, "Warning"),
        (.error, "Error")
    ]

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            HStack {
                Text("Cycle Variants")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorSecondary)

                Spacer()

                Text(variants[currentVariantIndex].1)
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorPrimary)
            }

            DSAlert(
                title: variants[currentVariantIndex].1,
                body: "This is a \(variants[currentVariantIndex].1.lowercased()) alert variant.",
                variant: variants[currentVariantIndex].0
            )

            DSButton("Next Variant", style: .outlined, size: .medium) {
                currentVariantIndex = (currentVariantIndex + 1) % variants.count
            }
        }
        .padding(TokensCoreLight.Spacing2)
        .background(
            RoundedRectangle(cornerRadius: tokens.BorderRadiusSm)
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
    static var BackgroundSurfaceColorGreige: Color { get }
    static var BackgroundContainerColorTransparent05: Color { get }
    static var BorderRadiusSm: CGFloat { get }
    static var BorderRadiusLg: CGFloat { get }
    static var BorderRadiusXl: CGFloat { get }
}

extension TokensSemanticLight: TokenSemanticProtocol {}
extension TokensSemanticDark: TokenSemanticProtocol {}

// MARK: - Preview
#Preview {
    DSAlertView()
}
