import SwiftUI

// MARK: - Alert Demo View
/// Comprehensive demo view showcasing all Alert component variants and states.
///
/// This view provides a complete inventory of alert components for design review
/// and development reference.
struct AlertDemoView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing6) {
                // Header
                Text("Alert")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

                Text("Feedback messages for informational, success, warning, and error states.")
                    .font(.system(size: DesignSystemGlobal.FontFontSizeBodyMd, weight: .regular))
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)

                // MARK: - Informational Alerts
                sectionHeader("Informational", description: "Neutral information alerts (teal/blue)")

                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                    Text("Standard")
                        .font(.subheadline)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    InformationalAlert(
                        title: "Alert title (optional)",
                        message: "This is helpful information you should know.",
                        onDismiss: {}
                    )

                    Text("Without Title")
                        .font(.subheadline)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    InformationalAlert(
                        message: "This is helpful information without a title.",
                        onDismiss: {}
                    )

                    Text("Floating (with shadow)")
                        .font(.subheadline)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    InformationalAlert(
                        title: "Floating Alert",
                        message: "This alert has a shadow for elevated appearance.",
                        isFloating: true,
                        onDismiss: {}
                    )

                    Text("Non-dismissible")
                        .font(.subheadline)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    InformationalAlert(
                        title: "Persistent Alert",
                        message: "This alert cannot be dismissed by the user."
                    )
                }

                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)

                // MARK: - Success Alerts
                sectionHeader("Success", description: "Positive outcome alerts (green)")

                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                    Text("Standard")
                        .font(.subheadline)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    SuccessAlert(
                        title: "Success!",
                        message: "Your order has been placed successfully.",
                        onDismiss: {}
                    )

                    Text("Without Title")
                        .font(.subheadline)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    SuccessAlert(
                        message: "Item added to cart.",
                        onDismiss: {}
                    )

                    Text("Floating")
                        .font(.subheadline)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    SuccessAlert(
                        title: "Saved!",
                        message: "Your changes have been saved.",
                        isFloating: true,
                        onDismiss: {}
                    )
                }

                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)

                // MARK: - Warning Alerts
                sectionHeader("Warning", description: "Cautionary alerts (yellow)")

                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                    Text("Standard")
                        .font(.subheadline)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    WarningAlert(
                        title: "Low Stock",
                        message: "Only 3 items left in stock. Order soon!",
                        onDismiss: {}
                    )

                    Text("Without Title")
                        .font(.subheadline)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    WarningAlert(
                        message: "This action cannot be undone.",
                        onDismiss: {}
                    )

                    Text("Floating")
                        .font(.subheadline)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    WarningAlert(
                        title: "Session Expiring",
                        message: "Your session will expire in 5 minutes.",
                        isFloating: true,
                        onDismiss: {}
                    )
                }

                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)

                // MARK: - Error Alerts
                sectionHeader("Error", description: "Error state alerts (red)")

                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                    Text("Standard")
                        .font(.subheadline)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    ErrorAlert(
                        title: "Payment Failed",
                        message: "Your payment could not be processed. Please try again.",
                        onDismiss: {}
                    )

                    Text("Without Title")
                        .font(.subheadline)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    ErrorAlert(
                        message: "Something went wrong. Please try again later.",
                        onDismiss: {}
                    )

                    Text("Floating")
                        .font(.subheadline)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    ErrorAlert(
                        title: "Connection Lost",
                        message: "Unable to connect to the server.",
                        isFloating: true,
                        onDismiss: {}
                    )
                }

                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)

                // MARK: - All Variants Comparison
                sectionHeader("All Variants", description: "Side-by-side comparison")

                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                    Alert(
                        title: "Informational",
                        message: "Helpful information message.",
                        variant: .informational,
                        onDismiss: {}
                    )

                    Alert(
                        title: "Success",
                        message: "Positive outcome message.",
                        variant: .success,
                        onDismiss: {}
                    )

                    Alert(
                        title: "Warning",
                        message: "Cautionary message.",
                        variant: .warning,
                        onDismiss: {}
                    )

                    Alert(
                        title: "Error",
                        message: "Error state message.",
                        variant: .error,
                        onDismiss: {}
                    )
                }

                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)

                // MARK: - Use Cases
                sectionHeader("Common Use Cases", description: "Real-world alert applications")

                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
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
            .padding(DesignSystemGlobal.Spacing4)
        }
        .background(DesignSystemGlobal.BackgroundContainerColorWhite)
    }

    // MARK: - Helper Views

    private func sectionHeader(_ title: String, description: String) -> some View {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing1) {
            Text(title)
                .font(.headline)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

            Text(description)
                .font(.caption)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorTertiary)
        }
    }
}

#Preview("Alert Demo") {
    AlertDemoView()
}
