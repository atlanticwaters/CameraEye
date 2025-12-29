import SwiftUI

import SwiftUI

// Typealias for spacing tokens
typealias TokensSpacing = TokensCoreLight

// MARK: - DSAlert Showcase View

/// Comprehensive showcase of the DSAlert component
///
/// Demonstrates:
/// - 4 variant types (informational, success, warning, error)
/// - Optional title and message
/// - Optional dismiss action
/// - Floating elevation style
/// - Dark mode support
/// - Real-world usage examples

struct DSAlertView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing6) {
                
                // MARK: - Header Card
                VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                    Text("Alert")
                        .thdFont(.hero5)
                        .foregroundColor(textPrimary)

                    Text("A notification banner component that provides contextual feedback messages with 4 semantic variants, optional title, and dismissible functionality.")
                        .thdFont(.bodyMd)
                        .foregroundColor(textSecondary)
                }
                .padding(TokensSpacing.Spacing4)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: borderRadiusXl)
                        .fill(containerWhite)
                )
                
                // MARK: - Content Card
                VStack(alignment: .leading, spacing: TokensSpacing.Spacing6) {
                    
                    // Alert Variants
                    alertVariantsSection
                    
                    Divider().padding(.vertical, TokensSpacing.Spacing2)
                    
                    // Without Title
                    withoutTitleSection
                    
                    Divider().padding(.vertical, TokensSpacing.Spacing2)
                    
                    // With Dismiss
                    withDismissSection
                    
                    Divider().padding(.vertical, TokensSpacing.Spacing2)
                    
                    // Floating Style
                    floatingStyleSection
                    
                    Divider().padding(.vertical, TokensSpacing.Spacing2)
                    
                    // Interactive Examples
                    interactiveSection
                    
                    Divider().padding(.vertical, TokensSpacing.Spacing2)
                    
                    // Usage Examples
                    usageExamplesSection
                    
                    Divider().padding(.vertical, TokensSpacing.Spacing2)
                    
                    // Specifications
                    specificationsSection
                }
                .padding(TokensSpacing.Spacing4)
                .background(
                    RoundedRectangle(cornerRadius: borderRadiusXl)
                        .fill(containerWhite)
                )
            }
            .padding(TokensSpacing.Spacing4)
            .padding(.top, 96) // Extra padding for top navigation
            .padding(.bottom, 80) // Extra padding for bottom navigation
        }
        .background(surfaceGreige)
        .applySoftScrollEdges()
    }
    
    // MARK: - Alert Variants Section
    
    private var alertVariantsSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Alert Variants",
                description: "4 semantic variants for different message types"
            )
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                variantExample(
                    "Informational",
                    description: "General information or helpful tips",
                    variant: .informational
                )
                
                variantExample(
                    "Success",
                    description: "Positive feedback for completed actions",
                    variant: .success
                )
                
                variantExample(
                    "Warning",
                    description: "Important issues that need attention",
                    variant: .warning
                )
                
                variantExample(
                    "Error",
                    description: "Critical issues that block progress",
                    variant: .error
                )
            }
        }
    }
    
    private func variantExample(_ title: String, description: String, variant: DSAlert.Variant) -> some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing1) {
                Text(title)
                    .thdFont(.bodySm)
                    .foregroundColor(textPrimary)
                
                Text(description)
                    .thdFont(.caption)
                    .foregroundColor(textTertiary)
            }
            
            DSAlert(
                variant: variant,
                title: "Alert title (optional)",
                message: "This is the message text that provides context and information to the user."
            )
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }
    
    // MARK: - Without Title Section
    
    private var withoutTitleSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Without Title",
                description: "Alerts can optionally omit the title for simpler messages"
            )
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                DSAlert.informational(
                    message: "This is helpful information you should know."
                )
                
                DSAlert.success(
                    message: "Success! Whatever you did worked."
                )
                
                DSAlert.warning(
                    message: "There's an issue that you should know about."
                )
                
                DSAlert.error(
                    message: "You cannot proceed until you resolve this issue."
                )
            }
            .padding(TokensSpacing.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(containerGreige)
            )
        }
    }
    
    // MARK: - With Dismiss Section
    
    private var withDismissSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "With Dismiss Action",
                description: "Add a close button to allow users to dismiss the alert"
            )
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                DSAlert.informational(
                    title: "Alert title (optional)",
                    message: "This is helpful information you should know.",
                    onDismiss: { print("Dismissed") }
                )
                
                DSAlert.success(
                    title: "Alert title (optional)",
                    message: "Success! Whatever you did worked.",
                    onDismiss: { print("Dismissed") }
                )
                
                DSAlert.warning(
                    title: "Alert title (optional)",
                    message: "There's an issue that you should know about.",
                    onDismiss: { print("Dismissed") }
                )
                
                DSAlert.error(
                    title: "Alert title (optional)",
                    message: "You cannot proceed until you resolve this issue.",
                    onDismiss: { print("Dismissed") }
                )
            }
            .padding(TokensSpacing.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(containerGreige)
            )
        }
    }
    
    // MARK: - Floating Style Section
    
    private var floatingStyleSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Floating Style",
                description: "Add elevation with shadow for floating alerts"
            )
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                DSAlert.informational(
                    title: "Floating Alert",
                    message: "This alert has a shadow and rounded corners.",
                    isFloating: true,
                    onDismiss: { print("Dismissed") }
                )
                
                DSAlert.success(
                    title: "Floating Alert",
                    message: "This alert has a shadow and rounded corners.",
                    isFloating: true,
                    onDismiss: { print("Dismissed") }
                )
                
                DSAlert.warning(
                    title: "Floating Alert",
                    message: "This alert has a shadow and rounded corners.",
                    isFloating: true,
                    onDismiss: { print("Dismissed") }
                )
                
                DSAlert.error(
                    title: "Floating Alert",
                    message: "This alert has a shadow and rounded corners.",
                    isFloating: true,
                    onDismiss: { print("Dismissed") }
                )
            }
            .padding(TokensSpacing.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(containerGreige)
            )
        }
    }
    
    // MARK: - Interactive Section
    
    private var interactiveSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader("Interactive Examples", description: "Try interacting with alerts")
            
            VStack(spacing: TokensSpacing.Spacing4) {
                InteractiveDismissExample()
                
                InteractiveVariantToggleExample()
                
                InteractiveFloatingToggleExample()
            }
            .padding(TokensSpacing.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(containerGreige)
            )
        }
    }
    
    // MARK: - Usage Examples Section
    
    private var usageExamplesSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader("Usage Examples", description: "Real-world alert patterns")
            
            Text("Form Validation")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
            
            formValidationExample
            
            Text("Status Messages")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
                .padding(.top, TokensSpacing.Spacing2)
            
            statusMessagesExample
            
            Text("Page-Level Alerts")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
                .padding(.top, TokensSpacing.Spacing2)
            
            pageLevelAlertsExample
        }
    }
    
    private var formValidationExample: some View {
        VStack(spacing: TokensSpacing.Spacing2) {
            DSAlert.error(
                title: "Required field missing",
                message: "Please enter your email address to continue.",
                isFloating: true,
                onDismiss: { print("Dismissed") }
            )
            
            DSAlert.warning(
                title: "Password strength",
                message: "Your password should be at least 8 characters long.",
                isFloating: true,
                onDismiss: { print("Dismissed") }
            )
            
            DSAlert.success(
                message: "Your profile has been updated successfully!",
                isFloating: true,
                onDismiss: { print("Dismissed") }
            )
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerWhite)
        )
    }
    
    private var statusMessagesExample: some View {
        VStack(spacing: TokensSpacing.Spacing2) {
            DSAlert.success(
                title: "Order confirmed",
                message: "Your order #12345 has been confirmed and will ship soon."
            )
            
            DSAlert.informational(
                title: "Delivery update",
                message: "Your package is out for delivery and will arrive today."
            )
            
            DSAlert.warning(
                title: "Payment pending",
                message: "We're still processing your payment. This may take a few minutes."
            )
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerWhite)
        )
    }
    
    private var pageLevelAlertsExample: some View {
        VStack(spacing: TokensSpacing.Spacing2) {
            DSAlert.informational(
                message: "We've updated our privacy policy. Please review the changes.",
                onDismiss: { print("Dismissed") }
            )
            
            DSAlert.warning(
                message: "Your session will expire in 5 minutes. Please save your work.",
                onDismiss: { print("Dismissed") }
            )
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerWhite)
        )
    }
    
    // MARK: - Specifications Section
    
    private var specificationsSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader("Specifications", description: "Component details and dimensions")
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                specRow("Component", value: "DSAlert")
                specRow("Variants", value: "4 (info, success, warning, error)")
                specRow("Icon Size", value: "16pt")
                specRow("Inner Padding", value: "16pt (TokensSpacing.Spacing4)")
                specRow("HStack Spacing", value: "8pt (TokensSpacing.Spacing2)")
                specRow("VStack Spacing", value: "8pt (TokensSpacing.Spacing2)")
                specRow("Title Font", value: "THD SmVar Beta, 16pt (bodyMd)")
                specRow("Message Font", value: "THD SmVar Beta, 14pt (bodySm)")
                specRow("Corner Radius", value: "12pt (TokensSemanticLight.BorderRadius2xl)")
                specRow("Shadow", value: "6pt radius, 3pt Y offset (floating only)")
                specRow("Dismiss Button", value: "44pt touch target")
            }
            .padding(TokensSpacing.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(containerGreige)
            )
            
            Text("Style Guide")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
                .padding(.top, TokensSpacing.Spacing2)
            
            styleGuideTable
            
            Text("Code Example")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
                .padding(.top, TokensSpacing.Spacing2)
            
            codeExample("""
// Basic alert
DSAlert.success(
    title: "Success!",
    message: "Your changes have been saved."
)

// Alert without title
DSAlert.warning(
    message: "Please review your input."
)

// Dismissible alert
DSAlert.error(
    title: "Error",
    message: "Something went wrong.",
    onDismiss: {
        // Handle dismiss
    }
)

// Floating alert
DSAlert.informational(
    title: "Did you know?",
    message: "You can save items for later.",
    isFloating: true,
    onDismiss: { }
)
""")
        }
    }
    
    private var styleGuideTable: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing1) {
            styleGuideRow("Informational", usage: "General info, tips, updates")
            styleGuideRow("Success", usage: "Confirmations, completed actions")
            styleGuideRow("Warning", usage: "Important notices, cautions")
            styleGuideRow("Error", usage: "Errors, validation issues, blocking problems")
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }
    
    private func styleGuideRow(_ variant: String, usage: String) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(variant)
                .thdFont(.caption)
                .foregroundColor(textPrimary)
            Text(usage)
                .thdFont(.caption)
                .foregroundColor(textTertiary)
        }
        .padding(.vertical, 4)
    }
    
    private func codeExample(_ code: String) -> some View {
        Text(code)
            .thdFont(.caption)
            .foregroundColor(textSecondary)
            .font(.system(.caption, design: .monospaced))
            .padding(TokensSpacing.Spacing3)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(Color.black.opacity(0.05))
            )
    }
    
    private func specRow(_ label: String, value: String) -> some View {
        HStack {
            Text(label)
                .thdFont(.caption)
                .foregroundColor(textTertiary)
            
            Spacer()
            
            Text(value)
                .thdFont(.caption)
                .foregroundColor(textSecondary)
        }
    }
    
    // MARK: - Helper Methods
    
    private func sectionHeader(_ title: String, description: String) -> some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing1) {
            Text(title)
                .thdFont(.h3)
                .foregroundColor(textPrimary)

            Text(description)
                .thdFont(.caption)
                .foregroundColor(textTertiary)
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
    @State private var isVisible = true
    
    var body: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            HStack {
                Text("Dismissible Alert")
                    .thdFont(.bodySm)
                    .foregroundColor(TokensSemanticLight.TextOnContainerColorSecondary)
                
                Spacer()
                
                Text(isVisible ? "Visible" : "Dismissed")
                    .thdFont(.bodySm)
                    .foregroundColor(TokensSemanticLight.TextOnContainerColorPrimary)
            }
            
            if isVisible {
                DSAlert.informational(
                    title: "Try dismissing me",
                    message: "Click the X button to dismiss this alert.",
                    onDismiss: {
                        isVisible = false
                    }
                )
            } else {
                DSButton(
                    "Show Alert Again",
                    style: .outlined,
                    size: .medium
                ) {
                    isVisible = true
                }
            }
        }
        .padding(TokensSpacing.Spacing2)
        .background(
            RoundedRectangle(cornerRadius: TokensSemanticLight.BorderRadiusSm)
                .fill(TokensSemanticLight.BackgroundContainerColorWhite)
        )
    }
}

/// Interactive variant toggle example
private struct InteractiveVariantToggleExample: View {
    @State private var selectedVariant: DSAlert.Variant = .informational
    
    var body: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            HStack {
                Text("Toggle Variants")
                    .thdFont(.bodySm)
                    .foregroundColor(TokensSemanticLight.TextOnContainerColorSecondary)
                
                Spacer()
                
                Text(variantName(selectedVariant))
                    .thdFont(.bodySm)
                    .foregroundColor(TokensSemanticLight.TextOnContainerColorPrimary)
            }
            
            DSAlert(
                variant: selectedVariant,
                title: "Dynamic Alert",
                message: "This alert changes based on the variant you select below."
            )
            
            HStack(spacing: TokensSpacing.Spacing2) {
                DSButton(
                    "Info",
                    style: selectedVariant == .informational ? .orangeFilled : .outlined,
                    size: .small
                ) {
                    selectedVariant = .informational
                }
                
                DSButton(
                    "Success",
                    style: selectedVariant == .success ? .orangeFilled : .outlined,
                    size: .small
                ) {
                    selectedVariant = .success
                }
                
                DSButton(
                    "Warning",
                    style: selectedVariant == .warning ? .orangeFilled : .outlined,
                    size: .small
                ) {
                    selectedVariant = .warning
                }
                
                DSButton(
                    "Error",
                    style: selectedVariant == .error ? .orangeFilled : .outlined,
                    size: .small
                ) {
                    selectedVariant = .error
                }
            }
        }
        .padding(TokensSpacing.Spacing2)
        .background(
            RoundedRectangle(cornerRadius: TokensSemanticLight.BorderRadiusSm)
                .fill(TokensSemanticLight.BackgroundContainerColorWhite)
        )
    }
    
    private func variantName(_ variant: DSAlert.Variant) -> String {
        switch variant {
        case .informational: return "Informational"
        case .success: return "Success"
        case .warning: return "Warning"
        case .error: return "Error"
        }
    }
}

/// Interactive floating toggle example
private struct InteractiveFloatingToggleExample: View {
    @State private var isFloating = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            HStack {
                Text("Toggle Floating Style")
                    .thdFont(.bodySm)
                    .foregroundColor(TokensSemanticLight.TextOnContainerColorSecondary)
                
                Spacer()
                
                Text(isFloating ? "Floating" : "Standard")
                    .thdFont(.bodySm)
                    .foregroundColor(TokensSemanticLight.TextOnContainerColorPrimary)
            }
            
            DSAlert.success(
                title: "Floating Toggle",
                message: "Toggle the floating style to see the shadow and rounded corners.",
                isFloating: isFloating,
                onDismiss: { print("Dismissed") }
            )
            
            HStack {
                DSButton(
                    isFloating ? "Use Standard Style" : "Use Floating Style",
                    style: .outlined,
                    size: .medium
                ) {
                    isFloating.toggle()
                }
                
                Spacer()
            }
        }
        .padding(TokensSpacing.Spacing2)
        .background(
            RoundedRectangle(cornerRadius: TokensSemanticLight.BorderRadiusSm)
                .fill(TokensSemanticLight.BackgroundContainerColorWhite)
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
    static var BorderRadiusLg: CGFloat { get }
    static var BorderRadiusXl: CGFloat { get }
}

extension TokensSemanticLight: TokenSemanticProtocol {}
extension TokensSemanticDark: TokenSemanticProtocol {}

// MARK: - Preview
#Preview {
    DSAlertView()
}
