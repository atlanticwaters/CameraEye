import SwiftUI

// MARK: - Alert Demo View
/// Comprehensive showcase of alert components and variants.
///
/// Demonstrates:
/// - Alert variants (informational, success, warning, error)
/// - With/without titles
/// - Floating alerts (with shadow)
/// - Dismissible and non-dismissible variants
/// - Common use cases

struct AlertDemoView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing6) {
                // MARK: - Header Card
                VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                    Text("Alert")
                        .thdFont(.hero5)
                        .foregroundColor(textPrimary)

                    Text("Feedback messages for informational, success, warning, and error states.")
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
                    // MARK: - Informational Alerts
                    sectionHeader("Informational", description: "Neutral information alerts (teal/blue)")

                    VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                        Text("Standard")
                            .thdFont(.bodySm)
                            .foregroundColor(textSecondary)

                        InformationalAlert(
                            title: "Alert title (optional)",
                            message: "This is helpful information you should know.",
                            onDismiss: {}
                        )

                        Text("Without Title")
                            .thdFont(.bodySm)
                            .foregroundColor(textSecondary)

                        InformationalAlert(
                            message: "This is helpful information without a title.",
                            onDismiss: {}
                        )

                        Text("Floating (with shadow)")
                            .thdFont(.bodySm)
                            .foregroundColor(textSecondary)

                        InformationalAlert(
                            title: "Floating Alert",
                            message: "This alert has a shadow for elevated appearance.",
                            isFloating: true,
                            onDismiss: {}
                        )

                        Text("Non-dismissible")
                            .thdFont(.bodySm)
                            .foregroundColor(textSecondary)

                        InformationalAlert(
                            title: "Persistent Alert",
                            message: "This alert cannot be dismissed by the user."
                        )
                    }

                    Divider().padding(.vertical, TokensSpacing.Spacing2)

                    // MARK: - Success Alerts
                    sectionHeader("Success", description: "Positive outcome alerts (green)")

                    VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                        Text("Standard")
                            .thdFont(.bodySm)
                            .foregroundColor(textSecondary)

                        SuccessAlert(
                            title: "Success!",
                            message: "Your order has been placed successfully.",
                            onDismiss: {}
                        )

                        Text("Without Title")
                            .thdFont(.bodySm)
                            .foregroundColor(textSecondary)

                        SuccessAlert(
                            message: "Item added to cart.",
                            onDismiss: {}
                        )

                        Text("Floating")
                            .thdFont(.bodySm)
                            .foregroundColor(textSecondary)

                        SuccessAlert(
                            title: "Saved!",
                            message: "Your changes have been saved.",
                            isFloating: true,
                            onDismiss: {}
                        )
                    }

                    Divider().padding(.vertical, TokensSpacing.Spacing2)

                    // MARK: - Warning Alerts
                    sectionHeader("Warning", description: "Cautionary alerts (yellow)")

                    VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                        Text("Standard")
                            .thdFont(.bodySm)
                            .foregroundColor(textSecondary)

                        WarningAlert(
                            title: "Low Stock",
                            message: "Only 3 items left in stock. Order soon!",
                            onDismiss: {}
                        )

                        Text("Without Title")
                            .thdFont(.bodySm)
                            .foregroundColor(textSecondary)

                        WarningAlert(
                            message: "This action cannot be undone.",
                            onDismiss: {}
                        )

                        Text("Floating")
                            .thdFont(.bodySm)
                            .foregroundColor(textSecondary)

                        WarningAlert(
                            title: "Session Expiring",
                            message: "Your session will expire in 5 minutes.",
                            isFloating: true,
                            onDismiss: {}
                        )
                    }

                    Divider().padding(.vertical, TokensSpacing.Spacing2)

                    // MARK: - Error Alerts
                    sectionHeader("Error", description: "Error state alerts (red)")

                    VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                        Text("Standard")
                            .thdFont(.bodySm)
                            .foregroundColor(textSecondary)

                        ErrorAlert(
                            title: "Payment Failed",
                            message: "Your payment could not be processed. Please try again.",
                            onDismiss: {}
                        )

                        Text("Without Title")
                            .thdFont(.bodySm)
                            .foregroundColor(textSecondary)

                        ErrorAlert(
                            message: "Something went wrong. Please try again later.",
                            onDismiss: {}
                        )

                        Text("Floating")
                            .thdFont(.bodySm)
                            .foregroundColor(textSecondary)

                        ErrorAlert(
                            title: "Connection Lost",
                            message: "Unable to connect to the server.",
                            isFloating: true,
                            onDismiss: {}
                        )
                    }

                    Divider().padding(.vertical, TokensSpacing.Spacing2)

                    // MARK: - All Variants Comparison
                    sectionHeader("All Variants", description: "Side-by-side comparison")

                    VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                        THDAlert(
                            title: "Informational",
                            message: "Helpful information message.",
                            variant: .informational,
                            onDismiss: {}
                        )

                        THDAlert(
                            title: "Success",
                            message: "Positive outcome message.",
                            variant: .success,
                            onDismiss: {}
                        )

                        THDAlert(
                            title: "Warning",
                            message: "Cautionary message.",
                            variant: .warning,
                            onDismiss: {}
                        )

                        THDAlert(
                            title: "Error",
                            message: "Error state message.",
                            variant: .error,
                            onDismiss: {}
                        )
                    }

                    Divider().padding(.vertical, TokensSpacing.Spacing2)

                    // MARK: - Use Cases
                    sectionHeader("Common Use Cases", description: "Real-world alert applications")

                    VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                        SuccessAlert(
                            title: "Added to Cart",
                            message: "Milwaukee M18 Drill has been added to your cart.",
                            onDismiss: {}
                        )

                        WarningAlert(
                            title: "Store Pickup Only",
                            message: "This item is only available for in-store pickup at your selected store.",
                            onDismiss: {}
                        )

                        ErrorAlert(
                            title: "Out of Stock",
                            message: "Sorry, this item is currently out of stock at all nearby stores.",
                            onDismiss: {}
                        )

                        InformationalAlert(
                            title: "Free Delivery",
                            message: "Spend $45 more to qualify for free delivery.",
                            onDismiss: {}
                        )
                    }
                }
                .padding(TokensSpacing.Spacing4)
                .background(
                    RoundedRectangle(cornerRadius: borderRadiusXl)
                        .fill(containerWhite)
                )
            }
            .padding(TokensSpacing.Spacing4)
            .padding(.top, 60) // Extra padding for top navigation
            .padding(.bottom, 80) // Extra padding for bottom navigation
        }
        .background(surfaceGreige)
        .applySoftScrollEdges()
    }
    
    // MARK: - Helper Views
    
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
    
    private var surfaceGreige: Color {
        tokens.BackgroundSurfaceColorGreige
    }
    
    private var borderRadiusXl: CGFloat {
        tokens.BorderRadiusXl
    }
    
    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }
}

// MARK: - Token Protocol Helper
private protocol TokenSemanticProtocol {
    static var TextOnContainerColorPrimary: Color { get }
    static var TextOnContainerColorSecondary: Color { get }
    static var TextOnContainerColorTertiary: Color { get }
    static var BackgroundContainerColorWhite: Color { get }
    static var BackgroundSurfaceColorGreige: Color { get }
    static var BorderRadiusXl: CGFloat { get }
}

extension TokensSemanticLight: TokenSemanticProtocol {}
extension TokensSemanticDark: TokenSemanticProtocol {}

// MARK: - Preview
#Preview {
    AlertDemoView()
}
