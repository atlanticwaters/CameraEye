import SwiftUI

// MARK: - Callout Demo View
/// Comprehensive demo view showcasing all Callout component variants and configurations.
///
/// This view provides a complete inventory of callout components for design review
/// and development reference.
struct CalloutDemoView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing6) {
                // Header
                Text("Callout")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

                Text("Promotional and informational callouts with optional actions.")
                    .font(.system(size: DesignSystemGlobal.FontFontSizeBodyMd, weight: .regular))
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)

                // MARK: - Neutral Callouts
                sectionHeader("Neutral", description: "Subtle transparent background")

                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                    Text("Full Featured")
                        .font(.subheadline)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    Callout(
                        title: "Callout Title",
                        subtitle: "Supporting subtitle text",
                        description: "This is the main descriptive content of the callout that provides more details.",
                        variant: .neutral,
                        buttonText: "Action",
                        onButtonTap: {}
                    )

                    Text("Title Only")
                        .font(.subheadline)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    Callout(
                        title: "Pro Tip",
                        description: "Save time by using the barcode scanner to quickly add items to your list.",
                        variant: .neutral
                    )

                    Text("Description Only")
                        .font(.subheadline)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    Callout(
                        description: "Need help? Visit our help center for answers to common questions.",
                        variant: .neutral,
                        buttonText: "Help Center",
                        onButtonTap: {}
                    )

                    Text("Floating (with shadow)")
                        .font(.subheadline)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    Callout(
                        title: "Floating Callout",
                        description: "This callout has an elevated appearance with shadow.",
                        variant: .neutral,
                        isFloating: true
                    )
                }

                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)

                // MARK: - Inverse Callouts
                sectionHeader("Inverse", description: "Dark background with light text")

                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                    Text("Full Featured")
                        .font(.subheadline)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    Callout(
                        title: "Exclusive Offer",
                        subtitle: "Pro Members Only",
                        description: "Get early access to Black Friday deals starting November 20th.",
                        variant: .inverse,
                        buttonText: "Join Pro",
                        onButtonTap: {}
                    )

                    Text("Simple")
                        .font(.subheadline)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    Callout(
                        description: "Sign up for our newsletter to receive exclusive offers.",
                        variant: .inverse,
                        buttonText: "Sign Up",
                        onButtonTap: {}
                    )

                    Text("Floating")
                        .font(.subheadline)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    Callout(
                        title: "Limited Time",
                        description: "This offer expires at midnight.",
                        variant: .inverse,
                        isFloating: true
                    )
                }

                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)

                // MARK: - Brand Callouts
                sectionHeader("Brand", description: "Orange accent background")

                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                    Text("Full Featured")
                        .font(.subheadline)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    Callout(
                        title: "Special Savings",
                        subtitle: "Today Only",
                        description: "Take 20% off all power tools with code POWER20.",
                        variant: .brand,
                        buttonText: "Shop Now",
                        onButtonTap: {}
                    )

                    Text("Promotion")
                        .font(.subheadline)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    Callout(
                        title: "Free Delivery",
                        description: "On orders over $45. Exclusions apply.",
                        variant: .brand
                    )

                    Text("Floating")
                        .font(.subheadline)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    Callout(
                        title: "New Arrivals",
                        description: "Check out the latest products in power tools.",
                        variant: .brand,
                        buttonText: "Browse",
                        isFloating: true,
                        onButtonTap: {}
                    )
                }

                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)

                // MARK: - Icon Variations
                sectionHeader("Icon Options", description: "Different leading icons")

                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                    Callout(
                        description: "Default tag icon for promotional content.",
                        variant: .neutral,
                        leadingIcon: "tag"
                    )

                    Callout(
                        description: "Info icon for informational content.",
                        variant: .neutral,
                        leadingIcon: "info.circle"
                    )

                    Callout(
                        description: "Lightbulb icon for tips and suggestions.",
                        variant: .neutral,
                        leadingIcon: "lightbulb"
                    )

                    Callout(
                        description: "Gift icon for offers and rewards.",
                        variant: .brand,
                        leadingIcon: "gift"
                    )

                    Callout(
                        description: "No icon callout for minimal appearance.",
                        variant: .neutral,
                        leadingIcon: nil
                    )
                }

                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)

                // MARK: - All Variants Comparison
                sectionHeader("All Variants", description: "Side-by-side comparison")

                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                    Callout(
                        title: "Neutral",
                        description: "Subtle promotional callout.",
                        variant: .neutral,
                        buttonText: "Action",
                        onButtonTap: {}
                    )

                    Callout(
                        title: "Inverse",
                        description: "High contrast promotional callout.",
                        variant: .inverse,
                        buttonText: "Action",
                        onButtonTap: {}
                    )

                    Callout(
                        title: "Brand",
                        description: "Brand-focused promotional callout.",
                        variant: .brand,
                        buttonText: "Action",
                        onButtonTap: {}
                    )
                }

                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)

                // MARK: - Use Cases
                sectionHeader("Common Use Cases", description: "Real-world callout applications")

                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                    Callout(
                        title: "Pro Xtra Members",
                        subtitle: "Earn Perks on Every Purchase",
                        description: "Join Pro Xtra for free and start earning perks and exclusive discounts.",
                        variant: .brand,
                        leadingIcon: "star.fill",
                        buttonText: "Join Free",
                        onButtonTap: {}
                    )

                    Callout(
                        title: "Curbside Pickup",
                        description: "Order online and pick up at your local store. Ready in 2 hours or less.",
                        variant: .neutral,
                        leadingIcon: "car.fill",
                        buttonText: "Learn More",
                        onButtonTap: {}
                    )

                    Callout(
                        title: "Tool Rental",
                        description: "Rent professional-grade tools at a fraction of the cost.",
                        variant: .inverse,
                        leadingIcon: "wrench.and.screwdriver.fill",
                        buttonText: "View Tools",
                        onButtonTap: {}
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

#Preview("Callout Demo") {
    CalloutDemoView()
}
