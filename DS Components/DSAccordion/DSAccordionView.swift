import SwiftUI

// MARK: - DSAccordion Showcase View

/// Comprehensive showcase of the DSAccordion component
///
/// Demonstrates:
/// - All 5 accordion types (text, question, rating, productSpecs, productDetails)
/// - Border and borderless variants
/// - Divider visibility options
/// - DSAccordionGroup for grouped accordions
/// - Interactive expand/collapse behavior
/// - Dark mode support
/// - Real-world usage examples

struct DSAccordionView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing6) {

                // MARK: - Header Card
                VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                    Text("Accordion")
                        .thdFont(.hero5)
                        .foregroundStyle(textPrimary)

                    Text("An expandable accordion component for displaying collapsible content sections. Supports 5 types, optional borders, and dividers.")
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

                    // Accordion Types
                    accordionTypesSection

                    Divider().padding(.vertical, TokensCoreLight.Spacing2)

                    // Border Variants
                    borderVariantsSection

                    Divider().padding(.vertical, TokensCoreLight.Spacing2)

                    // Divider Options
                    dividerOptionsSection

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

    // MARK: - Accordion Types Section

    private var accordionTypesSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader(
                "Accordion Types",
                description: "5 type variants for different contexts"
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                AccordionTypeExample(
                    title: "Text",
                    description: "Standard text accordion for general content",
                    type: .text
                )

                AccordionTypeExample(
                    title: "Question",
                    description: "FAQ-style with question mark icon",
                    type: .question
                )

                AccordionTypeExample(
                    title: "Rating",
                    description: "Review sections with star icon",
                    type: .rating
                )

                AccordionTypeExample(
                    title: "Product Specs",
                    description: "Technical specifications with list icon",
                    type: .productSpecs
                )

                AccordionTypeExample(
                    title: "Product Details",
                    description: "Product information with info icon",
                    type: .productDetails
                )
            }
        }
    }

    // MARK: - Border Variants Section

    private var borderVariantsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader(
                "Border Variants",
                description: "Bordered and borderless styles"
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                AccordionBorderExample(
                    title: "Borderless (Default)",
                    description: "No border, clean minimal look",
                    isBorderless: true
                )

                AccordionBorderExample(
                    title: "With Border",
                    description: "Outlined container for emphasis",
                    isBorderless: false
                )
            }
        }
    }

    // MARK: - Divider Options Section

    private var dividerOptionsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader(
                "Divider Options",
                description: "Show or hide divider between header and content"
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                AccordionDividerExample(
                    title: "Without Divider",
                    description: "Clean transition from header to content",
                    showDivider: false
                )

                AccordionDividerExample(
                    title: "With Divider",
                    description: "Visual separation when expanded",
                    showDivider: true
                )
            }
        }
    }

    // MARK: - Interactive Section

    private var interactiveSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader("Interactive Examples", description: "Try expanding and collapsing")

            VStack(spacing: TokensCoreLight.Spacing4) {
                InteractiveSingleAccordion()

                InteractiveAccordionGroup()
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

            Text("FAQ Section")
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)

            faqExample

            Text("Product Details")
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
                .padding(.top, TokensCoreLight.Spacing2)

            productDetailsExample
        }
    }

    private var faqExample: some View {
        FAQUsageExample()
    }

    private var productDetailsExample: some View {
        ProductDetailsUsageExample()
    }

    // MARK: - Specifications Section

    private var specificationsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader("Specifications", description: "Component details and dimensions")

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                specRow("Component", value: "DSAccordion")
                specRow("Types", value: "5 variants")
                specRow("Header Padding", value: "16pt")
                specRow("Content Padding", value: "16pt horizontal, bottom")
                specRow("Corner Radius", value: "Lg (bordered mode)")
                specRow("Min Header Height", value: "44pt")
                specRow("Icon Size", value: "20pt (leading), 16x9pt (chevron)")
                specRow("Animation", value: "Spring animation")
            }
            .padding(TokensCoreLight.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(containerGreige)
            )

            Text("Type Icons")
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
                .padding(.top, TokensCoreLight.Spacing2)

            typeIconsTable

            Text("Code Example")
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
                .padding(.top, TokensCoreLight.Spacing2)

            codeExample("""
// Simple accordion
DSAccordion(
    title: "Getting Started",
    isExpanded: $isExpanded
) {
    Text("Welcome to the app!")
}

// FAQ-style accordion
DSAccordion(
    title: "How do I return an item?",
    subtitle: "Returns & Refunds",
    type: .question,
    isBorderless: false,
    showDivider: true,
    isExpanded: $isExpanded
) {
    Text("You can return items within 90 days...")
}

// Accordion group
DSAccordionGroup {
    DSAccordion(title: "Section 1", isExpanded: $s1) { ... }
    DSAccordion(title: "Section 2", isExpanded: $s2) { ... }
}
""")
        }
    }

    private var typeIconsTable: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
            typeIconRow("Text", icon: "None")
            typeIconRow("Question", icon: "questionmark.circle")
            typeIconRow("Rating", icon: "star.fill")
            typeIconRow("Product Specs", icon: "list.bullet.clipboard")
            typeIconRow("Product Details", icon: "info.circle")
        }
        .padding(TokensCoreLight.Spacing3)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }

    private func typeIconRow(_ type: String, icon: String) -> some View {
        HStack {
            Text(type)
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

    private var borderRadiusLg: CGFloat {
        tokens.BorderRadiusLg
    }

    private var borderRadiusXl: CGFloat {
        tokens.BorderRadiusXl
    }

    private var codeBlockBg: Color {
        tokens.BackgroundContainerColorTransparent05
    }

    private var textAccent: Color {
        tokens.TextOnContainerColorAccent
    }

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }
}

// MARK: - Supporting Views

/// Example showing accordion type with static preview
private struct AccordionTypeExample: View {
    @Environment(\.colorScheme) var colorScheme

    let title: String
    let description: String
    let type: DSAccordionType

    @State private var isExpanded = false

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

            DSAccordion(
                title: "Example \(title) Accordion",
                subtitle: type == .text ? nil : "Optional subtitle",
                type: type,
                isBorderless: false,
                showDivider: true,
                isExpanded: $isExpanded
            ) {
                Text("This is the expandable content for the \(title.lowercased()) accordion type.")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorSecondary)
            }
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: tokens.BorderRadiusLg)
                .fill(tokens.BackgroundContainerColorGreige)
        )
    }
}

/// Example showing border variants
private struct AccordionBorderExample: View {
    @Environment(\.colorScheme) var colorScheme

    let title: String
    let description: String
    let isBorderless: Bool

    @State private var isExpanded = false

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

            DSAccordion(
                title: "Accordion Title",
                subtitle: "Subtitle text",
                type: .text,
                isBorderless: isBorderless,
                isExpanded: $isExpanded
            ) {
                Text("Content goes here. Tap the header to expand or collapse.")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorSecondary)
            }
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: tokens.BorderRadiusLg)
                .fill(tokens.BackgroundContainerColorGreige)
        )
    }
}

/// Example showing divider options
private struct AccordionDividerExample: View {
    @Environment(\.colorScheme) var colorScheme

    let title: String
    let description: String
    let showDivider: Bool

    @State private var isExpanded = true

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

            DSAccordion(
                title: "Accordion Title",
                type: .text,
                isBorderless: false,
                showDivider: showDivider,
                isExpanded: $isExpanded
            ) {
                Text("Notice the divider line between header and content.")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorSecondary)
            }
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: tokens.BorderRadiusLg)
                .fill(tokens.BackgroundContainerColorGreige)
        )
    }
}

/// Interactive single accordion example
private struct InteractiveSingleAccordion: View {
    @Environment(\.colorScheme) var colorScheme

    @State private var isExpanded = false

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            HStack {
                Text("Single Accordion")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorSecondary)

                Spacer()

                Text(isExpanded ? "Expanded" : "Collapsed")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorPrimary)
            }

            DSAccordion(
                title: "Tap to Expand",
                subtitle: "Interactive example",
                type: .text,
                isBorderless: false,
                showDivider: true,
                isExpanded: $isExpanded
            ) {
                VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                    Text("This content is now visible!")
                        .thdFont(.bodySm)
                    Text("Tap the header again to collapse.")
                        .thdFont(.caption)
                        .foregroundStyle(tokens.TextOnContainerColorTertiary)
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

/// Interactive accordion group example
private struct InteractiveAccordionGroup: View {
    @Environment(\.colorScheme) var colorScheme

    @State private var section1Expanded = true
    @State private var section2Expanded = false
    @State private var section3Expanded = false

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            Text("Accordion Group")
                .thdFont(.bodySm)
                .foregroundStyle(tokens.TextOnContainerColorSecondary)

            DSAccordionGroup {
                DSAccordion(
                    title: "Section 1",
                    type: .text,
                    showDivider: true,
                    isExpanded: $section1Expanded
                ) {
                    Text("Content for section 1")
                        .thdFont(.bodySm)
                        .foregroundStyle(tokens.TextOnContainerColorSecondary)
                }

                Divider()

                DSAccordion(
                    title: "Section 2",
                    type: .text,
                    showDivider: true,
                    isExpanded: $section2Expanded
                ) {
                    Text("Content for section 2")
                        .thdFont(.bodySm)
                        .foregroundStyle(tokens.TextOnContainerColorSecondary)
                }

                Divider()

                DSAccordion(
                    title: "Section 3",
                    type: .text,
                    showDivider: true,
                    isExpanded: $section3Expanded
                ) {
                    Text("Content for section 3")
                        .thdFont(.bodySm)
                        .foregroundStyle(tokens.TextOnContainerColorSecondary)
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

/// FAQ usage example
private struct FAQUsageExample: View {
    @Environment(\.colorScheme) var colorScheme

    @State private var q1Expanded = false
    @State private var q2Expanded = false
    @State private var q3Expanded = false

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    var body: some View {
        VStack(spacing: 0) {
            DSAccordion(
                title: "How do I return an item?",
                type: .question,
                showDivider: true,
                isExpanded: $q1Expanded
            ) {
                Text("You can return most items within 90 days of purchase. Visit our Returns Center to start the process.")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorSecondary)
            }

            Divider()

            DSAccordion(
                title: "What is the warranty period?",
                type: .question,
                showDivider: true,
                isExpanded: $q2Expanded
            ) {
                Text("Most products come with a 1-year manufacturer warranty. Extended warranties are available at checkout.")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorSecondary)
            }

            Divider()

            DSAccordion(
                title: "Do you offer price matching?",
                type: .question,
                showDivider: true,
                isExpanded: $q3Expanded
            ) {
                Text("Yes! We match prices from major retailers. Bring proof of the lower price to any store or contact customer service.")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorSecondary)
            }
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: tokens.BorderRadiusLg)
                .fill(tokens.BackgroundContainerColorWhite)
        )
    }
}

/// Product details usage example
private struct ProductDetailsUsageExample: View {
    @Environment(\.colorScheme) var colorScheme

    @State private var descriptionExpanded = true
    @State private var specsExpanded = false
    @State private var reviewsExpanded = false

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    var body: some View {
        VStack(spacing: 0) {
            DSAccordion(
                title: "Product Description",
                subtitle: "Learn about this product",
                type: .productDetails,
                showDivider: true,
                isExpanded: $descriptionExpanded
            ) {
                VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                    Text("This premium power drill features:")
                        .thdFont(.bodySm)
                        .bold()
                    Text("• 20V MAX lithium-ion battery")
                    Text("• Variable speed trigger")
                    Text("• LED work light")
                    Text("• Ergonomic grip design")
                }
                .thdFont(.bodySm)
                .foregroundStyle(tokens.TextOnContainerColorSecondary)
            }

            Divider()

            DSAccordion(
                title: "Specifications",
                subtitle: "Technical details",
                type: .productSpecs,
                showDivider: true,
                isExpanded: $specsExpanded
            ) {
                VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                    specItem("Voltage", value: "20V MAX")
                    specItem("Speed", value: "0-1500 RPM")
                    specItem("Weight", value: "3.5 lbs")
                    specItem("Chuck Size", value: "1/2 inch")
                }
            }

            Divider()

            DSAccordion(
                title: "Customer Reviews",
                subtitle: "4.8 stars (2,453 reviews)",
                type: .rating,
                showDivider: true,
                isExpanded: $reviewsExpanded
            ) {
                VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                    HStack {
                        Text("★★★★★")
                            .foregroundStyle(tokens.TextOnContainerColorAccent)
                        Text("Great drill!")
                            .thdFont(.bodySm)
                            .bold()
                    }
                    Text("This drill exceeded my expectations. Powerful and lightweight.")
                        .thdFont(.bodySm)
                        .foregroundStyle(tokens.TextOnContainerColorSecondary)
                }
            }
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: tokens.BorderRadiusLg)
                .fill(tokens.BackgroundContainerColorWhite)
        )
    }

    private func specItem(_ label: String, value: String) -> some View {
        HStack {
            Text(label)
                .thdFont(.bodySm)
                .foregroundStyle(tokens.TextOnContainerColorTertiary)
            Spacer()
            Text(value)
                .thdFont(.bodySm)
                .foregroundStyle(tokens.TextOnContainerColorSecondary)
        }
    }
}

// MARK: - Token Protocol Helper
private protocol TokenSemanticProtocol {
    static var TextOnContainerColorPrimary: Color { get }
    static var TextOnContainerColorSecondary: Color { get }
    static var TextOnContainerColorTertiary: Color { get }
    static var TextOnContainerColorAccent: Color { get }
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
    DSAccordionView()
}
