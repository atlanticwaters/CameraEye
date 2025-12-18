import SwiftUI

// MARK: - DSProductImageContainer Showcase View

/// Comprehensive showcase of the DSProductImageContainer component
///
/// Demonstrates:
/// - Badge combinations (Exclusive, Delivery)
/// - Sponsored tag
/// - Color swatches (with selection and overflow count)
/// - Dark mode support
/// - All configuration variations
/// - Real-world usage examples

struct DSProductImageContainerView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing6) {
                
                // MARK: - Header Card
                VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                    Text("Product Image Container")
                        .thdFont(.hero5)
                        .foregroundColor(textPrimary)

                    Text("A product image container for listing pages. Supports badges, sponsored tags, color swatches, and swatch overflow indicators.")
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
                    
                    // Badge Combinations
                    badgeCombinationsSection
                    
                    Divider().padding(.vertical, TokensSpacing.Spacing2)
                    
                    // Sponsored Tag
                    sponsoredTagSection
                    
                    Divider().padding(.vertical, TokensSpacing.Spacing2)
                    
                    // Swatches
                    swatchesSection
                    
                    Divider().padding(.vertical, TokensSpacing.Spacing2)
                    
                    // Complete Examples
                    completeExamplesSection
                    
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
    
    // MARK: - Badge Combinations Section
    
    private var badgeCombinationsSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Badge Combinations",
                description: "Exclusive and delivery badges"
            )
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                badgeExample(
                    "Both Badges",
                    description: "Exclusive + Delivery badges",
                    showExclusive: true,
                    showDelivery: true
                )
                
                badgeExample(
                    "Exclusive Only",
                    description: "Product exclusive badge",
                    showExclusive: true,
                    showDelivery: false
                )
                
                badgeExample(
                    "Delivery Only",
                    description: "Christmas delivery badge",
                    showExclusive: false,
                    showDelivery: true
                )
                
                badgeExample(
                    "No Badges",
                    description: "Clean product image",
                    showExclusive: false,
                    showDelivery: false
                )
            }
        }
    }
    
    private func badgeExample(
        _ title: String,
        description: String,
        showExclusive: Bool,
        showDelivery: Bool
    ) -> some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing1) {
                Text(title)
                    .thdFont(.bodySm)
                    .foregroundColor(textPrimary)
                
                Text(description)
                    .thdFont(.caption)
                    .foregroundColor(textTertiary)
            }
            
            HStack {
                DSProductImageContainer(
                    placeholderImage: Image("Fridge"),
                    showExclusiveBadge: showExclusive,
                    showDeliveryBadge: showDelivery,
                    showSponsoredTag: false,
                    swatches: [.black, .gray, .brown],
                    additionalSwatchCount: nil
                )
                Spacer()
            }
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }
    
    // MARK: - Sponsored Tag Section
    
    private var sponsoredTagSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Sponsored Tag",
                description: "Indicates sponsored product placement"
            )
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                sponsoredExample(
                    "With Sponsored Tag",
                    description: "Shows 'Sponsored' text below image",
                    showSponsored: true
                )
                
                sponsoredExample(
                    "Without Sponsored Tag",
                    description: "Regular product listing",
                    showSponsored: false
                )
            }
        }
    }
    
    private func sponsoredExample(
        _ title: String,
        description: String,
        showSponsored: Bool
    ) -> some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing1) {
                Text(title)
                    .thdFont(.bodySm)
                    .foregroundColor(textPrimary)
                
                Text(description)
                    .thdFont(.caption)
                    .foregroundColor(textTertiary)
            }
            
            HStack {
                DSProductImageContainer(
                    placeholderImage: Image("Fridge"),
                    showExclusiveBadge: true,
                    showDeliveryBadge: true,
                    showSponsoredTag: showSponsored,
                    swatches: [.black, .gray, .brown],
                    additionalSwatchCount: nil
                )
                Spacer()
            }
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }
    
    // MARK: - Swatches Section
    
    private var swatchesSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Color Swatches",
                description: "Product color variants with selection and overflow"
            )
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                swatchExample(
                    "Three Swatches",
                    description: "Maximum visible swatches",
                    swatchCount: 3,
                    additionalCount: nil
                )
                
                swatchExample(
                    "Two Swatches",
                    description: "Limited color options",
                    swatchCount: 2,
                    additionalCount: nil
                )
                
                swatchExample(
                    "One Swatch",
                    description: "Single color option",
                    swatchCount: 1,
                    additionalCount: nil
                )
                
                swatchExample(
                    "With Overflow Count",
                    description: "Shows +99 additional colors",
                    swatchCount: 3,
                    additionalCount: 99
                )
                
                swatchExample(
                    "No Swatches",
                    description: "No color variants",
                    swatchCount: 0,
                    additionalCount: nil
                )
            }
        }
    }
    
    private func swatchExample(
        _ title: String,
        description: String,
        swatchCount: Int,
        additionalCount: Int?
    ) -> some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing1) {
                Text(title)
                    .thdFont(.bodySm)
                    .foregroundColor(textPrimary)
                
                Text(description)
                    .thdFont(.caption)
                    .foregroundColor(textTertiary)
            }
            
            HStack {
                DSProductImageContainer(
                    placeholderImage: Image("Fridge"),
                    showExclusiveBadge: false,
                    showDeliveryBadge: false,
                    showSponsoredTag: false,
                    swatches: swatchCount > 0 ? [.black, .gray, .brown].prefix(swatchCount).map { $0 } : [],
                    selectedSwatchIndex: 0,
                    additionalSwatchCount: additionalCount
                )
                Spacer()
            }
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }
    
    // MARK: - Complete Examples Section
    
    private var completeExamplesSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Complete Examples",
                description: "Full configurations combining all features"
            )
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                completeExample(
                    "Maximum Features",
                    description: "All badges, sponsored, swatches + overflow",
                    configuration: .maximum
                )
                
                completeExample(
                    "Typical Product",
                    description: "Common product listing configuration",
                    configuration: .typical
                )
                
                completeExample(
                    "Minimal Product",
                    description: "Just image, no extras",
                    configuration: .minimal
                )
            }
        }
    }
    
    private enum CompleteExampleConfig {
        case maximum, typical, minimal
    }
    
    private func completeExample(
        _ title: String,
        description: String,
        configuration: CompleteExampleConfig
    ) -> some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing1) {
                Text(title)
                    .thdFont(.bodySm)
                    .foregroundColor(textPrimary)
                
                Text(description)
                    .thdFont(.caption)
                    .foregroundColor(textTertiary)
            }
            
            HStack {
                switch configuration {
                case .maximum:
                    DSProductImageContainer(
                        placeholderImage: Image("Fridge"),
                        showExclusiveBadge: true,
                        showDeliveryBadge: true,
                        showSponsoredTag: true,
                        swatches: [.black, .gray, .brown],
                        selectedSwatchIndex: 0,
                        additionalSwatchCount: 99
                    )
                case .typical:
                    DSProductImageContainer(
                        placeholderImage: Image("Fridge"),
                        showExclusiveBadge: false,
                        showDeliveryBadge: true,
                        showSponsoredTag: false,
                        swatches: [.black, .gray, .brown],
                        selectedSwatchIndex: 0,
                        additionalSwatchCount: nil
                    )
                case .minimal:
                    DSProductImageContainer(
                        placeholderImage: Image("Fridge"),
                        showExclusiveBadge: false,
                        showDeliveryBadge: false,
                        showSponsoredTag: false,
                        swatches: [],
                        selectedSwatchIndex: 0,
                        additionalSwatchCount: nil
                    )
                }
                Spacer()
            }
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }
    
    // MARK: - Usage Examples Section
    
    private var usageExamplesSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader("Usage Examples", description: "Real-world component usage")
            
            Text("Product Grid")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
            
            productGridExample
            
            Text("Sponsored Products Row")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
                .padding(.top, TokensSpacing.Spacing2)
            
            sponsoredRowExample
        }
    }
    
    private var productGridExample: some View {
        VStack(spacing: TokensSpacing.Spacing2) {
            HStack(spacing: TokensSpacing.Spacing2) {
                DSProductImageContainer(
                    placeholderImage: Image("Fridge"),
                    showExclusiveBadge: true,
                    showDeliveryBadge: false,
                    showSponsoredTag: false,
                    swatches: [.black, .gray, .brown],
                    selectedSwatchIndex: 0,
                    additionalSwatchCount: 5
                )
                
                DSProductImageContainer(
                    placeholderImage: Image("Fridge"),
                    showExclusiveBadge: false,
                    showDeliveryBadge: true,
                    showSponsoredTag: false,
                    swatches: [.black, .gray],
                    selectedSwatchIndex: 0,
                    additionalSwatchCount: nil
                )
            }
            
            HStack(spacing: TokensSpacing.Spacing2) {
                DSProductImageContainer(
                    placeholderImage: Image("Fridge"),
                    showExclusiveBadge: false,
                    showDeliveryBadge: false,
                    showSponsoredTag: false,
                    swatches: [],
                    selectedSwatchIndex: 0,
                    additionalSwatchCount: nil
                )
                
                DSProductImageContainer(
                    placeholderImage: Image("Fridge"),
                    showExclusiveBadge: true,
                    showDeliveryBadge: true,
                    showSponsoredTag: false,
                    swatches: [.black, .gray, .brown],
                    selectedSwatchIndex: 0,
                    additionalSwatchCount: nil
                )
            }
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerWhite)
        )
    }
    
    private var sponsoredRowExample: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: TokensSpacing.Spacing2) {
                ForEach(0..<3, id: \.self) { _ in
                    DSProductImageContainer(
                        placeholderImage: Image("Fridge"),
                        showExclusiveBadge: false,
                        showDeliveryBadge: false,
                        showSponsoredTag: true,
                        swatches: [.black, .gray, .brown],
                        selectedSwatchIndex: 0,
                        additionalSwatchCount: nil
                    )
                }
            }
            .padding(TokensSpacing.Spacing3)
        }
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
                specRow("Component", value: "DSProductImageContainer")
                specRow("Container Width", value: "145pt")
                specRow("Container Padding", value: "4pt")
                specRow("Image Size", value: "137pt × 137pt")
                specRow("Image Corner Radius", value: "2pt")
                specRow("Container Corner Radius", value: "Border Radius XL")
                specRow("Badge Font Size", value: "12pt (bold)")
                specRow("Sponsored Font Size", value: "12pt")
                specRow("Swatch Size", value: "26pt outer, 22pt inner")
                specRow("Max Visible Swatches", value: "3")
                specRow("Swatch Spacing", value: "4pt")
            }
            .padding(TokensSpacing.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(containerGreige)
            )
            
            Text("Badge Colors")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
                .padding(.top, TokensSpacing.Spacing2)
            
            badgeColorTable
            
            Text("Code Example")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
                .padding(.top, TokensSpacing.Spacing2)
            
            codeExample("""
// With URL (production)
DSProductImageContainer(
    imageURL: URL(string: "https://..."),
    placeholderImage: Image("Fridge"),
    showExclusiveBadge: true,
    showDeliveryBadge: true,
    showSponsoredTag: true,
    swatches: [.black, .gray, .brown],
    selectedSwatchIndex: 0,
    additionalSwatchCount: 99
)

// With placeholder only (preview)
DSProductImageContainer(
    placeholderImage: Image("Fridge"),
    showExclusiveBadge: true,
    swatches: [.red, .blue, .green]
)
""")
        }
    }
    
    private var badgeColorTable: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing1) {
            badgeColorRow("Exclusive", bg: "Moonlight 100 (#dfe1eb)", text: "Moonlight 800 (#3a446d)")
            badgeColorRow("Delivery", bg: "Bottle Green 100 (#d8e4de)", text: "Bottle Green 700 (#226242)")
            badgeColorRow("Sponsored", bg: "N/A", text: "Tertiary (#787675)")
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }
    
    private func badgeColorRow(_ badge: String, bg: String, text: String) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(badge)
                .thdFont(.caption)
                .foregroundColor(textPrimary)
            HStack {
                Text("BG: ")
                    .thdFont(.caption)
                    .foregroundColor(textTertiary)
                Text(bg)
                    .thdFont(.caption)
                    .foregroundColor(textSecondary)
            }
            HStack {
                Text("Text: ")
                    .thdFont(.caption)
                    .foregroundColor(textTertiary)
                Text(text)
                    .thdFont(.caption)
                    .foregroundColor(textSecondary)
            }
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
    DSProductImageContainerView()
}
