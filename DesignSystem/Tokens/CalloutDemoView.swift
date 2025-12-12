import SwiftUI

// MARK: - Callout Demo View
/// Comprehensive showcase of callout components and variants.
///
/// Demonstrates:
/// - Callout variants (neutral, inverse, brand)
/// - Full, partial, and minimal configurations
/// - With/without titles, subtitles, buttons
/// - Icon variations
/// - Floating callouts (with shadow)
/// - Common use cases

struct CalloutDemoView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing6) {
                // MARK: - Header Card
                VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                    Text("Callout")
                        .thdFont(.hero5)
                        .foregroundColor(textPrimary)

                    Text("Promotional and informational callouts with optional actions.")
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
                    // MARK: - Neutral Callouts
                    sectionHeader("Neutral", description: "Subtle transparent background")

                    VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                        Text("Full Featured")
                            .thdFont(.bodySm)
                            .foregroundColor(textSecondary)

                        Callout(
                            title: "Callout Title",
                            subtitle: "Supporting subtitle text",
                            description: "This is the main descriptive content of the callout that provides more details.",
                            variant: .neutral,
                            buttonText: "Action",
                            onButtonTap: {}
                        )

                        Text("Title Only")
                            .thdFont(.bodySm)
                            .foregroundColor(textSecondary)

                        Callout(
                            title: "Pro Tip",
                            description: "Save time by using the barcode scanner to quickly add items to your list.",
                            variant: .neutral
                        )

                        Text("Description Only")
                            .thdFont(.bodySm)
                            .foregroundColor(textSecondary)

                        Callout(
                            description: "Need help? Visit our help center for answers to common questions.",
                            variant: .neutral,
                            buttonText: "Help Center",
                            onButtonTap: {}
                        )

                        Text("Floating (with shadow)")
                            .thdFont(.bodySm)
                            .foregroundColor(textSecondary)

                        Callout(
                            title: "Floating Callout",
                            description: "This callout has an elevated appearance with shadow.",
                            variant: .neutral,
                            isFloating: true
                        )
                    }

                    Divider().padding(.vertical, TokensSpacing.Spacing2)

                    // MARK: - Inverse Callouts
                    sectionHeader("Inverse", description: "Dark background with light text")

                    VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                        Text("Full Featured")
                            .thdFont(.bodySm)
                            .foregroundColor(textSecondary)

                        Callout(
                            title: "Exclusive Offer",
                            subtitle: "Pro Members Only",
                            description: "Get early access to Black Friday deals starting November 20th.",
                            variant: .inverse,
                            buttonText: "Join Pro",
                            onButtonTap: {}
                        )

                        Text("Simple")
                            .thdFont(.bodySm)
                            .foregroundColor(textSecondary)

                        Callout(
                            description: "Sign up for our newsletter to receive exclusive offers.",
                            variant: .inverse,
                            buttonText: "Sign Up",
                            onButtonTap: {}
                        )

                        Text("Floating")
                            .thdFont(.bodySm)
                            .foregroundColor(textSecondary)

                        Callout(
                            title: "Limited Time",
                            description: "This offer expires at midnight.",
                            variant: .inverse,
                            isFloating: true
                        )
                    }

                    Divider().padding(.vertical, TokensSpacing.Spacing2)

                    // MARK: - Brand Callouts
                    sectionHeader("Brand", description: "Orange accent background")

                    VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                        Text("Full Featured")
                            .thdFont(.bodySm)
                            .foregroundColor(textSecondary)

                        Callout(
                            title: "Special Savings",
                            subtitle: "Today Only",
                            description: "Take 20% off all power tools with code POWER20.",
                            variant: .brand,
                            buttonText: "Shop Now",
                            onButtonTap: {}
                        )

                        Text("Promotion")
                            .thdFont(.bodySm)
                            .foregroundColor(textSecondary)

                        Callout(
                            title: "Free Delivery",
                            description: "On orders over $45. Exclusions apply.",
                            variant: .brand
                        )

                        Text("Floating")
                            .thdFont(.bodySm)
                            .foregroundColor(textSecondary)

                        Callout(
                            title: "New Arrivals",
                            description: "Check out the latest products in power tools.",
                            variant: .brand,
                            buttonText: "Browse",
                            isFloating: true,
                            onButtonTap: {}
                        )
                    }

                    Divider().padding(.vertical, TokensSpacing.Spacing2)

                    // MARK: - Icon Variations
                    sectionHeader("Icon Options", description: "Different leading icons")

                    VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
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

                    Divider().padding(.vertical, TokensSpacing.Spacing2)

                    // MARK: - All Variants Comparison
                    sectionHeader("All Variants", description: "Side-by-side comparison")

                    VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
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

                    Divider().padding(.vertical, TokensSpacing.Spacing2)

                    // MARK: - Use Cases
                    sectionHeader("Common Use Cases", description: "Real-world callout applications")

                    VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
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
    CalloutDemoView()
}
