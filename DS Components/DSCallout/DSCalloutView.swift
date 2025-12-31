import SwiftUI

// MARK: - DSCallout Showcase View

/// Comprehensive showcase of the DSCallout component
///
/// Demonstrates:
/// - All 3 variants (neutral, brand, inverse)
/// - Title and subtitle options
/// - Leading icon support
/// - Floating mode with shadow
/// - Action button integration
/// - Dark mode support
/// - Real-world usage examples

struct DSCalloutView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing6) {

                // MARK: - Header Card
                VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                    Text("Callout")
                        .thdFont(.hero5)
                        .foregroundStyle(textPrimary)

                    Text("A callout component for displaying contextual information with optional action. Supports 3 variants, leading icons, and action buttons.")
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

                    // Callout Variants
                    calloutVariantsSection

                    Divider().padding(.vertical, TokensCoreLight.Spacing2)

                    // Title Options
                    titleOptionsSection

                    Divider().padding(.vertical, TokensCoreLight.Spacing2)

                    // Leading Icons
                    leadingIconsSection

                    Divider().padding(.vertical, TokensCoreLight.Spacing2)

                    // Floating Mode
                    floatingModeSection

                    Divider().padding(.vertical, TokensCoreLight.Spacing2)

                    // Action Button
                    actionButtonSection

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

    // MARK: - Callout Variants Section

    private var calloutVariantsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader(
                "Callout Variants",
                description: "3 visual style variants"
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                variantExample(
                    "Neutral",
                    description: "Transparent background for subtle messaging",
                    variant: .neutral
                )

                variantExample(
                    "Brand",
                    description: "Orange accent for promotional content",
                    variant: .brand
                )

                variantExample(
                    "Inverse",
                    description: "Dark background for emphasis",
                    variant: .inverse
                )
            }
        }
    }

    private func variantExample(_ title: String, description: String, variant: DSCalloutVariant) -> some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                Text(title)
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)

                Text(description)
                    .thdFont(.caption)
                    .foregroundStyle(textTertiary)
            }

            DSCallout(
                title: "\(title) Callout",
                body: "This is a \(title.lowercased()) callout with example body text.",
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
                description: "Callouts with title, subtitle, or body only"
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                titleOptionExample(
                    "Body Only",
                    description: "Simple callout with just body text",
                    calloutTitle: nil,
                    calloutSubtitle: nil
                )

                titleOptionExample(
                    "With Title",
                    description: "Callout with headline",
                    calloutTitle: "Important Notice",
                    calloutSubtitle: nil
                )

                titleOptionExample(
                    "With Title & Subtitle",
                    description: "Full header with subtitle",
                    calloutTitle: "Special Offer",
                    calloutSubtitle: "Limited time only"
                )
            }
        }
    }

    private func titleOptionExample(_ title: String, description: String, calloutTitle: String?, calloutSubtitle: String?) -> some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                Text(title)
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)

                Text(description)
                    .thdFont(.caption)
                    .foregroundStyle(textTertiary)
            }

            DSCallout(
                title: calloutTitle,
                subtitle: calloutSubtitle,
                body: "This is the callout body text providing more details.",
                variant: .neutral
            )
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }

    // MARK: - Leading Icons Section

    private var leadingIconsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader(
                "Leading Icons",
                description: "Callouts with optional leading icon"
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                iconExample(
                    "Without Icon",
                    description: "Standard callout layout",
                    icon: nil
                )

                iconExample(
                    "With Icon",
                    description: "Icon at leading edge",
                    icon: Image(systemName: "info.circle.fill")
                )

                VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                    VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                        Text("Various Icons")
                            .thdFont(.bodySm)
                            .foregroundStyle(textPrimary)

                        Text("Different icon examples")
                            .thdFont(.caption)
                            .foregroundStyle(textTertiary)
                    }

                    VStack(spacing: TokensCoreLight.Spacing2) {
                        DSCallout(
                            title: "Pro Tip",
                            body: "Use keyboard shortcuts for faster navigation.",
                            leadingIcon: Image(systemName: "lightbulb.fill"),
                            variant: .brand
                        )

                        DSCallout(
                            title: "Security Notice",
                            body: "Your password will expire in 7 days.",
                            leadingIcon: Image(systemName: "lock.shield.fill"),
                            variant: .neutral
                        )
                    }
                }
                .padding(TokensCoreLight.Spacing3)
                .background(
                    RoundedRectangle(cornerRadius: borderRadiusLg)
                        .fill(containerGreige)
                )
            }
        }
    }

    private func iconExample(_ title: String, description: String, icon: Image?) -> some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                Text(title)
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)

                Text(description)
                    .thdFont(.caption)
                    .foregroundStyle(textTertiary)
            }

            DSCallout(
                title: "Information",
                body: "This callout \(icon != nil ? "includes" : "does not include") a leading icon.",
                leadingIcon: icon,
                variant: .neutral
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
                description: "Callout with shadow elevation"
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

            DSCallout(
                title: "Notification",
                body: "This callout is displayed in \(isFloating ? "floating" : "inline") mode.",
                variant: .brand,
                isFloating: isFloating
            )
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }

    // MARK: - Action Button Section

    private var actionButtonSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader(
                "Action Button",
                description: "Callouts with interactive action button"
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                actionExample(
                    "Without Action",
                    description: "Informational callout only",
                    buttonTitle: nil
                )

                actionExample(
                    "With Action",
                    description: "Includes call-to-action button",
                    buttonTitle: "Learn More"
                )
            }
        }
    }

    private func actionExample(_ title: String, description: String, buttonTitle: String?) -> some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                Text(title)
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)

                Text(description)
                    .thdFont(.caption)
                    .foregroundStyle(textTertiary)
            }

            DSCallout(
                title: "Special Offer",
                body: "Get 20% off your next purchase with code SAVE20.",
                variant: .brand,
                buttonTitle: buttonTitle,
                buttonAction: buttonTitle != nil ? { print("Button tapped") } : nil
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
            sectionHeader("Interactive Examples", description: "Try the action buttons")

            VStack(spacing: TokensCoreLight.Spacing4) {
                InteractiveCalloutExample()

                InteractiveVariantToggle()
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

            Text("Promotional Banner")
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)

            promotionalExample

            Text("Feature Announcement")
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
                .padding(.top, TokensCoreLight.Spacing2)

            featureAnnouncementExample

            Text("Onboarding Tip")
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
                .padding(.top, TokensCoreLight.Spacing2)

            onboardingTipExample
        }
    }

    private var promotionalExample: some View {
        DSCallout(
            title: "Flash Sale!",
            subtitle: "Ends at midnight",
            body: "Save up to 50% on power tools and accessories.",
            leadingIcon: Image(systemName: "tag.fill"),
            variant: .brand,
            isFloating: true,
            buttonTitle: "Shop Now",
            buttonAction: { print("Shop tapped") }
        )
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerWhite)
        )
    }

    private var featureAnnouncementExample: some View {
        DSCallout(
            title: "New Feature",
            body: "You can now save items to multiple lists. Try it out!",
            leadingIcon: Image(systemName: "sparkles"),
            variant: .neutral,
            buttonTitle: "Try Now",
            buttonAction: { print("Try tapped") }
        )
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerWhite)
        )
    }

    private var onboardingTipExample: some View {
        DSCallout(
            title: "Pro Tip",
            body: "Double-tap any product image to add it to your wishlist.",
            leadingIcon: Image(systemName: "lightbulb.fill"),
            variant: .inverse
        )
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
                specRow("Component", value: "DSCallout")
                specRow("Variants", value: "3 (neutral, brand, inverse)")
                specRow("Horizontal Padding", value: "16pt")
                specRow("Top Padding", value: "6pt")
                specRow("Bottom Padding", value: "12pt")
                specRow("Content Top Padding", value: "16pt")
                specRow("Content Spacing", value: "16pt")
                specRow("Icon Size", value: "16pt")
                specRow("Corner Radius", value: "Xl")
                specRow("Button Style", value: "orangeFilled, small")
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
// Simple callout
DSCallout(
    title: "Important Notice",
    body: "This is supplementary information."
)

// Full-featured callout
DSCallout(
    title: "Special Offer",
    subtitle: "Limited time only",
    body: "Get 20% off your next purchase.",
    leadingIcon: Image(systemName: "tag.fill"),
    variant: .brand,
    isFloating: true,
    buttonTitle: "Shop Now"
) {
    print("Button tapped")
}
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

/// Interactive callout example with button tap counter
private struct InteractiveCalloutExample: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var tapCount = 0

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            HStack {
                Text("Action Button")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorSecondary)

                Spacer()

                Text("Tapped: \(tapCount)x")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorPrimary)
            }

            DSCallout(
                title: "Interactive Example",
                body: "Tap the button to increment the counter.",
                variant: .brand,
                buttonTitle: "Tap Me",
                buttonAction: {
                    tapCount += 1
                }
            )
        }
        .padding(TokensCoreLight.Spacing2)
        .background(
            RoundedRectangle(cornerRadius: tokens.BorderRadiusSm)
                .fill(tokens.BackgroundContainerColorWhite)
        )
    }
}

/// Interactive variant toggle example
private struct InteractiveVariantToggle: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var currentVariantIndex = 0

    private let variants: [(DSCalloutVariant, String)] = [
        (.neutral, "Neutral"),
        (.brand, "Brand"),
        (.inverse, "Inverse")
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

            DSCallout(
                title: variants[currentVariantIndex].1,
                body: "This is a \(variants[currentVariantIndex].1.lowercased()) callout variant.",
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
    DSCalloutView()
}
