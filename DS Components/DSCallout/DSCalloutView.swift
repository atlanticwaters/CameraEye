import SwiftUI

// MARK: - DSCallout Showcase View

/// Comprehensive showcase of the DSCallout component
///
/// Demonstrates:
/// - 3 variant types (neutral, brand, inverse)
/// - Optional icon, title, subtitle, and message
/// - Optional action button
/// - Floating elevation style
/// - Dark mode support
/// - Real-world usage examples

struct DSCalloutView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing6) {
                
                // MARK: - Header Card
                VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                    Text("Callout")
                        .thdFont(.hero5)
                        .foregroundColor(textPrimary)

                    Text("A promotional or informational banner component with optional icon, title, subtitle, message, and action button for highlighting important content.")
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
                    
                    // Callout Variants
                    calloutVariantsSection
                    
                    Divider().padding(.vertical, TokensSpacing.Spacing2)
                    
                    // With Icons
                    withIconsSection
                    
                    Divider().padding(.vertical, TokensSpacing.Spacing2)
                    
                    // Without Button
                    withoutButtonSection
                    
                    Divider().padding(.vertical, TokensSpacing.Spacing2)
                    
                    // Message Only
                    messageOnlySection
                    
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
            .padding(.top, 60) // Extra padding for top navigation
            .padding(.bottom, 80) // Extra padding for bottom navigation
        }
        .background(surfaceGreige)
        .applySoftScrollEdges()
    }
    
    // MARK: - Callout Variants Section
    
    private var calloutVariantsSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Callout Variants",
                description: "3 style variants for different contexts"
            )
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                variantExample(
                    "Neutral",
                    description: "Default style for general information",
                    variant: .neutral
                )
                
                variantExample(
                    "Brand",
                    description: "Branded style for promotional content",
                    variant: .brand
                )
                
                variantExample(
                    "Inverse",
                    description: "Dark style for contrast and emphasis",
                    variant: .inverse
                )
            }
        }
    }
    
    private func variantExample(_ title: String, description: String, variant: DSCallout.Variant) -> some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing1) {
                Text(title)
                    .thdFont(.bodySm)
                    .foregroundColor(textPrimary)
                
                Text(description)
                    .thdFont(.caption)
                    .foregroundColor(textTertiary)
            }
            
            DSCallout(
                variant: variant,
                title: "Callout Title",
                subtitle: "Optional subtitle",
                message: "This is supplementary information that provides context and details.",
                buttonText: "Action",
                onButtonTap: { print("Tapped") }
            )
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }
    
    // MARK: - With Icons Section
    
    private var withIconsSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "With Icons",
                description: "Add visual emphasis with leading icons"
            )
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                DSCallout.neutral(
                    leadingIcon: Image(systemName: "tag.fill"),
                    title: "Special Offer",
                    subtitle: "Limited Time",
                    message: "Get 20% off your next purchase with code SAVE20.",
                    buttonText: "Shop Now",
                    onButtonTap: { print("Shop Now") }
                )
                
                DSCallout.brand(
                    leadingIcon: Image(systemName: "star.fill"),
                    title: "Featured Product",
                    subtitle: "Best Seller",
                    message: "This is our most popular item this season.",
                    buttonText: "Learn More",
                    onButtonTap: { print("Learn More") }
                )
                
                DSCallout.inverse(
                    leadingIcon: Image(systemName: "bell.fill"),
                    title: "New Arrival",
                    subtitle: "Just Added",
                    message: "Check out the latest additions to our collection.",
                    buttonText: "View All",
                    onButtonTap: { print("View All") }
                )
            }
            .padding(TokensSpacing.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(containerGreige)
            )
        }
    }
    
    // MARK: - Without Button Section
    
    private var withoutButtonSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Without Button",
                description: "Callouts can optionally omit the action button"
            )
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                DSCallout.neutral(
                    title: "Information",
                    subtitle: "Did you know?",
                    message: "This is helpful information without a call to action."
                )
                
                DSCallout.brand(
                    title: "Announcement",
                    subtitle: "New Feature",
                    message: "We've added a new feature to improve your experience."
                )
                
                DSCallout.inverse(
                    title: "Update",
                    subtitle: "System Notice",
                    message: "Our system will be updated tonight from 2-4 AM EST."
                )
            }
            .padding(TokensSpacing.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(containerGreige)
            )
        }
    }
    
    // MARK: - Message Only Section
    
    private var messageOnlySection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Message Only",
                description: "Simple callouts with just a message and optional button"
            )
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                DSCallout.neutral(
                    message: "This is a simple message callout.",
                    buttonText: "Action",
                    onButtonTap: { print("Action") }
                )
                
                DSCallout.brand(
                    message: "This is supplementary information.",
                    buttonText: "Learn More",
                    onButtonTap: { print("Learn More") }
                )
                
                DSCallout.inverse(
                    message: "This is an important notice.",
                    buttonText: "Got It",
                    onButtonTap: { print("Got It") }
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
                description: "Add elevation with shadow for floating callouts"
            )
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                DSCallout.neutral(
                    leadingIcon: Image(systemName: "gift.fill"),
                    title: "Floating Callout",
                    subtitle: "With Shadow",
                    message: "This callout has a subtle shadow and rounded corners.",
                    buttonText: "Claim Offer",
                    isFloating: true,
                    onButtonTap: { print("Claim") }
                )
                
                DSCallout.brand(
                    leadingIcon: Image(systemName: "sparkles"),
                    title: "Floating Callout",
                    subtitle: "With Shadow",
                    message: "This callout has a subtle shadow and rounded corners.",
                    buttonText: "Explore",
                    isFloating: true,
                    onButtonTap: { print("Explore") }
                )
                
                DSCallout.inverse(
                    leadingIcon: Image(systemName: "megaphone.fill"),
                    title: "Floating Callout",
                    subtitle: "With Shadow",
                    message: "This callout has a subtle shadow and rounded corners.",
                    buttonText: "Get Started",
                    isFloating: true,
                    onButtonTap: { print("Get Started") }
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
            sectionHeader("Interactive Examples", description: "Try interacting with callouts")
            
            VStack(spacing: TokensSpacing.Spacing4) {
                InteractiveButtonTapExample()
                
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
            sectionHeader("Usage Examples", description: "Real-world callout patterns")
            
            Text("Promotional Banners")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
            
            promotionalBannersExample
            
            Text("Feature Highlights")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
                .padding(.top, TokensSpacing.Spacing2)
            
            featureHighlightsExample
            
            Text("Informational Cards")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
                .padding(.top, TokensSpacing.Spacing2)
            
            informationalCardsExample
        }
    }
    
    private var promotionalBannersExample: some View {
        VStack(spacing: TokensSpacing.Spacing2) {
            DSCallout.brand(
                leadingIcon: Image(systemName: "percent"),
                title: "Spring Sale",
                subtitle: "Save Big Today",
                message: "Get up to 50% off select items. Free shipping on orders over $50.",
                buttonText: "Shop Sale",
                isFloating: true,
                onButtonTap: { print("Shop Sale") }
            )
            
            DSCallout.neutral(
                leadingIcon: Image(systemName: "creditcard.fill"),
                title: "New Payment Options",
                subtitle: "More Ways to Pay",
                message: "Now accepting Apple Pay, Google Pay, and PayPal for faster checkout.",
                buttonText: "Update Payment",
                isFloating: true,
                onButtonTap: { print("Update") }
            )
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerWhite)
        )
    }
    
    private var featureHighlightsExample: some View {
        VStack(spacing: TokensSpacing.Spacing2) {
            DSCallout.brand(
                leadingIcon: Image(systemName: "star.circle.fill"),
                title: "Rewards Program",
                subtitle: "Earn While You Shop",
                message: "Join our rewards program and earn points on every purchase.",
                buttonText: "Join Now",
                onButtonTap: { print("Join") }
            )
            
            DSCallout.inverse(
                leadingIcon: Image(systemName: "truck.box.fill"),
                title: "Free Shipping",
                subtitle: "No Minimum Purchase",
                message: "Enjoy free shipping on all orders for a limited time.",
                buttonText: "Start Shopping",
                onButtonTap: { print("Shop") }
            )
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerWhite)
        )
    }
    
    private var informationalCardsExample: some View {
        VStack(spacing: TokensSpacing.Spacing2) {
            DSCallout.neutral(
                leadingIcon: Image(systemName: "questionmark.circle.fill"),
                title: "Need Help?",
                subtitle: "We're Here for You",
                message: "Our customer service team is available 24/7 to assist you.",
                buttonText: "Contact Us",
                onButtonTap: { print("Contact") }
            )
            
            DSCallout.neutral(
                leadingIcon: Image(systemName: "book.fill"),
                title: "How-To Guides",
                subtitle: "Learn More",
                message: "Check out our comprehensive guides to get the most out of your products.",
                buttonText: "View Guides",
                onButtonTap: { print("View") }
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
                specRow("Component", value: "DSCallout")
                specRow("Variants", value: "3 (neutral, brand, inverse)")
                specRow("Icon Size", value: "16pt")
                specRow("Inner Padding", value: "16pt (TokensSpacing.Spacing4)")
                specRow("HStack Spacing", value: "8pt (TokensSpacing.Spacing2)")
                specRow("Content VStack Spacing", value: "16pt (TokensSpacing.Spacing4)")
                specRow("Title VStack Spacing", value: "8pt (TokensSpacing.Spacing2)")
                specRow("Title Font", value: "THD SmVar Beta, 18pt (Heavy)")
                specRow("Subtitle Font", value: "THD Sm Beta, 16pt")
                specRow("Message Font", value: "THD Sm Beta, 14pt")
                specRow("Button Height", value: "28pt")
                specRow("Corner Radius", value: "12pt (TokensSemanticLight.BorderRadius2xl)")
                specRow("Shadow", value: "6pt radius, 3pt Y offset (floating only)")
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
// Full callout with all options
DSCallout.brand(
    leadingIcon: Image(systemName: "star.fill"),
    title: "Featured",
    subtitle: "Limited Time",
    message: "Special offer available now.",
    buttonText: "Learn More",
    isFloating: true,
    onButtonTap: {
        // Handle button tap
    }
)

// Message only
DSCallout.neutral(
    message: "This is supplementary information."
)

// Without button
DSCallout.inverse(
    title: "Important Notice",
    subtitle: "Please Read",
    message: "System maintenance tonight."
)

// With icon but no button
DSCallout.brand(
    leadingIcon: Image(systemName: "gift.fill"),
    message: "Free gift with purchase!"
)
""")
        }
    }
    
    private var styleGuideTable: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing1) {
            styleGuideRow("Neutral", usage: "General information, help text, tips")
            styleGuideRow("Brand", usage: "Promotions, featured content, special offers")
            styleGuideRow("Inverse", usage: "High contrast, emphasis, important notices")
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

/// Interactive button tap example
private struct InteractiveButtonTapExample: View {
    @State private var tapCount = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            HStack {
                Text("Button Tap Counter")
                    .thdFont(.bodySm)
                    .foregroundColor(TokensSemanticLight.TextOnContainerColorSecondary)
                
                Spacer()
                
                Text("Taps: \(tapCount)")
                    .thdFont(.bodySm)
                    .foregroundColor(TokensSemanticLight.TextOnContainerColorPrimary)
            }
            
            DSCallout.brand(
                leadingIcon: Image(systemName: "hand.tap.fill"),
                title: "Interactive Callout",
                subtitle: "Try tapping the button",
                message: "Each tap increments the counter above.",
                buttonText: "Tap Me",
                onButtonTap: {
                    tapCount += 1
                }
            )
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
    @State private var selectedVariant: DSCallout.Variant = .neutral
    
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
            
            DSCallout(
                variant: selectedVariant,
                leadingIcon: Image(systemName: "paintpalette.fill"),
                title: "Dynamic Callout",
                subtitle: "Changes with variant",
                message: "This callout changes style based on the variant you select below.",
                buttonText: "Action",
                onButtonTap: { print("Action") }
            )
            
            HStack(spacing: TokensSpacing.Spacing2) {
                DSButton(
                    "Neutral",
                    style: selectedVariant == .neutral ? .orangeFilled : .outlined,
                    size: .small
                ) {
                    selectedVariant = .neutral
                }
                
                DSButton(
                    "Brand",
                    style: selectedVariant == .brand ? .orangeFilled : .outlined,
                    size: .small
                ) {
                    selectedVariant = .brand
                }
                
                DSButton(
                    "Inverse",
                    style: selectedVariant == .inverse ? .orangeFilled : .outlined,
                    size: .small
                ) {
                    selectedVariant = .inverse
                }
            }
        }
        .padding(TokensSpacing.Spacing2)
        .background(
            RoundedRectangle(cornerRadius: TokensSemanticLight.BorderRadiusSm)
                .fill(TokensSemanticLight.BackgroundContainerColorWhite)
        )
    }
    
    private func variantName(_ variant: DSCallout.Variant) -> String {
        switch variant {
        case .neutral: return "Neutral"
        case .brand: return "Brand"
        case .inverse: return "Inverse"
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
            
            DSCallout.brand(
                leadingIcon: Image(systemName: "sparkles"),
                title: "Floating Toggle",
                subtitle: "Watch the shadow",
                message: "Toggle the floating style to see the shadow and rounded corners.",
                buttonText: "Toggle",
                isFloating: isFloating,
                onButtonTap: {
                    isFloating.toggle()
                }
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
    DSCalloutView()
}
