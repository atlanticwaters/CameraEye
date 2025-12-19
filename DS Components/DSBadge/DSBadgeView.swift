import SwiftUI

// MARK: - DSBadge Showcase View

/// Comprehensive showcase of the DSBadge component
///
/// Demonstrates:
/// - 2 sizes (small, base)
/// - 3 visual variants (outline, filled subtle, filled strong)
/// - 7 semantic colors (info, success, warning, danger, medium, primary, brand)
/// - Optional leading icons
/// - Dark mode support
/// - Real-world usage examples

struct DSBadgeView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing6) {
                
                // MARK: - Header Card
                VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                    Text("Badge")
                        .thdFont(.hero5)
                        .foregroundColor(textPrimary)

                    Text("A badge component for displaying status, categories, or informational labels with 2 sizes, 3 visual variants, and 7 semantic colors.")
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
                    
                    // Badge Sizes
                    badgeSizesSection
                    
                    Divider().padding(.vertical, TokensSpacing.Spacing2)
                    
                    // Badge Variants
                    badgeVariantsSection
                    
                    Divider().padding(.vertical, TokensSpacing.Spacing2)
                    
                    // Badge Colors
                    badgeColorsSection
                    
                    Divider().padding(.vertical, TokensSpacing.Spacing2)
                    
                    // With Icons
                    withIconsSection
                    
                    Divider().padding(.vertical, TokensSpacing.Spacing2)
                    
                    // Variant Comparison
                    variantComparisonSection
                    
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
        .scrollEdgeEffectStyle(.soft, for: .vertical)
        .background(surfaceGreige)
    }
    
    // MARK: - Badge Sizes Section
    
    private var badgeSizesSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Badge Sizes",
                description: "Small (12px) and Base (14px) text sizes"
            )
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                sizeExample(
                    "Small Size",
                    description: "12px font size, compact badge",
                    size: .small
                )
                
                sizeExample(
                    "Base Size",
                    description: "14px font size, standard badge",
                    size: .base
                )
            }
        }
    }
    
    private func sizeExample(_ title: String, description: String, size: DSBadge.Size) -> some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing1) {
                Text(title)
                    .thdFont(.bodySm)
                    .foregroundColor(textPrimary)
                
                Text(description)
                    .thdFont(.caption)
                    .foregroundColor(textTertiary)
            }
            
            HStack(spacing: TokensSpacing.Spacing2) {
                DSBadge(label: "Outline", size: size, variant: .outline, color: .info)
                DSBadge(label: "Subtle", size: size, variant: .filledSubtle, color: .success)
                DSBadge(label: "Strong", size: size, variant: .filledStrong, color: .brand)
                Spacer()
            }
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }
    
    // MARK: - Badge Variants Section
    
    private var badgeVariantsSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Badge Variants",
                description: "3 visual styles: outline, filled subtle, filled strong"
            )
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                variantExample(
                    "Outline",
                    description: "Border with transparent background",
                    variant: .outline
                )
                
                variantExample(
                    "Filled Subtle",
                    description: "Light background with darker text",
                    variant: .filledSubtle
                )
                
                variantExample(
                    "Filled Strong",
                    description: "Bold background with contrasting text",
                    variant: .filledStrong
                )
            }
        }
    }
    
    private func variantExample(_ title: String, description: String, variant: DSBadge.Variant) -> some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing1) {
                Text(title)
                    .thdFont(.bodySm)
                    .foregroundColor(textPrimary)
                
                Text(description)
                    .thdFont(.caption)
                    .foregroundColor(textTertiary)
            }
            
            HStack(spacing: TokensSpacing.Spacing2) {
                DSBadge(label: "Info", size: .base, variant: variant, color: .info)
                DSBadge(label: "Success", size: .base, variant: variant, color: .success)
                DSBadge(label: "Warning", size: .base, variant: variant, color: .warning)
                DSBadge(label: "Danger", size: .base, variant: variant, color: .danger)
                Spacer()
            }
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }
    
    // MARK: - Badge Colors Section
    
    private var badgeColorsSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Badge Colors",
                description: "7 semantic color options for different contexts"
            )
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                colorExample(
                    "Info",
                    description: "Teal/Moonlight - informational status",
                    color: .info,
                    icon: Image(systemName: "info.circle.fill")
                )
                
                colorExample(
                    "Success",
                    description: "Green/Bottle Green - positive status",
                    color: .success,
                    icon: Image(systemName: "checkmark.circle.fill")
                )
                
                colorExample(
                    "Warning",
                    description: "Yellow/Lemon - caution status",
                    color: .warning,
                    icon: Image(systemName: "exclamationmark.triangle.fill")
                )
                
                colorExample(
                    "Danger",
                    description: "Red/Cinnabar - error or critical status",
                    color: .danger,
                    icon: Image(systemName: "xmark.circle.fill")
                )
                
                colorExample(
                    "Medium",
                    description: "Gray/Greige - neutral status",
                    color: .medium,
                    icon: Image(systemName: "minus.circle.fill")
                )
                
                colorExample(
                    "Primary",
                    description: "Black/Greige - primary status",
                    color: .primary,
                    icon: Image(systemName: "circle.fill")
                )
                
                colorExample(
                    "Brand",
                    description: "Orange - brand highlighting",
                    color: .brand,
                    icon: Image(systemName: "star.fill")
                )
            }
        }
    }
    
    private func colorExample(
        _ title: String,
        description: String,
        color: DSBadge.Color,
        icon: Image
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
            
            HStack(spacing: TokensSpacing.Spacing2) {
                DSBadge(label: "Outline", size: .base, variant: .outline, color: color)
                DSBadge(label: "Subtle", size: .base, variant: .filledSubtle, color: color)
                DSBadge(label: "Strong", size: .base, variant: .filledStrong, color: color)
                Spacer()
            }
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
                description: "Optional leading icons for added context"
            )
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                iconExample(
                    "Small with Icons",
                    description: "9pt icon size",
                    size: .small
                )
                
                iconExample(
                    "Base with Icons",
                    description: "12.25pt icon size",
                    size: .base
                )
            }
        }
    }
    
    private func iconExample(_ title: String, description: String, size: DSBadge.Size) -> some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing1) {
                Text(title)
                    .thdFont(.bodySm)
                    .foregroundColor(textPrimary)
                
                Text(description)
                    .thdFont(.caption)
                    .foregroundColor(textTertiary)
            }
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                HStack(spacing: TokensSpacing.Spacing2) {
                    DSBadge(
                        label: "New",
                        size: size,
                        variant: .outline,
                        color: .info,
                        leadingIcon: Image(systemName: "star.fill")
                    )
                    DSBadge(
                        label: "Sale",
                        size: size,
                        variant: .filledSubtle,
                        color: .danger,
                        leadingIcon: Image(systemName: "tag.fill")
                    )
                    DSBadge(
                        label: "Featured",
                        size: size,
                        variant: .filledStrong,
                        color: .brand,
                        leadingIcon: Image(systemName: "crown.fill")
                    )
                    Spacer()
                }
            }
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }
    
    // MARK: - Variant Comparison Section
    
    private var variantComparisonSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Variant Comparison",
                description: "All colors across all variants"
            )
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                // Outline
                VStack(alignment: .leading, spacing: TokensSpacing.Spacing1) {
                    Text("Outline")
                        .thdFont(.caption)
                        .foregroundColor(textSecondary)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: TokensSpacing.Spacing2) {
                            DSBadge(label: "Info", variant: .outline, color: .info)
                            DSBadge(label: "Success", variant: .outline, color: .success)
                            DSBadge(label: "Warning", variant: .outline, color: .warning)
                            DSBadge(label: "Danger", variant: .outline, color: .danger)
                            DSBadge(label: "Medium", variant: .outline, color: .medium)
                            DSBadge(label: "Primary", variant: .outline, color: .primary)
                            DSBadge(label: "Brand", variant: .outline, color: .brand)
                        }
                    }
                }
                
                // Filled Subtle
                VStack(alignment: .leading, spacing: TokensSpacing.Spacing1) {
                    Text("Filled Subtle")
                        .thdFont(.caption)
                        .foregroundColor(textSecondary)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: TokensSpacing.Spacing2) {
                            DSBadge(label: "Info", variant: .filledSubtle, color: .info)
                            DSBadge(label: "Success", variant: .filledSubtle, color: .success)
                            DSBadge(label: "Warning", variant: .filledSubtle, color: .warning)
                            DSBadge(label: "Danger", variant: .filledSubtle, color: .danger)
                            DSBadge(label: "Medium", variant: .filledSubtle, color: .medium)
                            DSBadge(label: "Primary", variant: .filledSubtle, color: .primary)
                            DSBadge(label: "Brand", variant: .filledSubtle, color: .brand)
                        }
                    }
                }
                
                // Filled Strong
                VStack(alignment: .leading, spacing: TokensSpacing.Spacing1) {
                    Text("Filled Strong")
                        .thdFont(.caption)
                        .foregroundColor(textSecondary)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: TokensSpacing.Spacing2) {
                            DSBadge(label: "Info", variant: .filledStrong, color: .info)
                            DSBadge(label: "Success", variant: .filledStrong, color: .success)
                            DSBadge(label: "Warning", variant: .filledStrong, color: .warning)
                            DSBadge(label: "Danger", variant: .filledStrong, color: .danger)
                            DSBadge(label: "Medium", variant: .filledStrong, color: .medium)
                            DSBadge(label: "Primary", variant: .filledStrong, color: .primary)
                            DSBadge(label: "Brand", variant: .filledStrong, color: .brand)
                        }
                    }
                }
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
            sectionHeader("Usage Examples", description: "Real-world component usage")
            
            Text("Product Status Badges")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
            
            productStatusExample
            
            Text("Feature Highlights")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
                .padding(.top, TokensSpacing.Spacing2)
            
            featureHighlightsExample
            
            Text("Category Tags")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
                .padding(.top, TokensSpacing.Spacing2)
            
            categoryTagsExample
            
            Text("Notification Counts")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
                .padding(.top, TokensSpacing.Spacing2)
            
            notificationCountsExample
        }
    }
    
    private var productStatusExample: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            HStack(spacing: TokensSpacing.Spacing2) {
                DSBadge(
                    label: "New",
                    size: .small,
                    variant: .filledStrong,
                    color: .info,
                    leadingIcon: Image(systemName: "sparkles")
                )
                DSBadge(
                    label: "Sale",
                    size: .small,
                    variant: .filledStrong,
                    color: .danger,
                    leadingIcon: Image(systemName: "tag.fill")
                )
                DSBadge(
                    label: "Limited Stock",
                    size: .small,
                    variant: .outline,
                    color: .warning
                )
            }
            
            HStack(spacing: TokensSpacing.Spacing2) {
                DSBadge(
                    label: "In Stock",
                    size: .small,
                    variant: .filledSubtle,
                    color: .success,
                    leadingIcon: Image(systemName: "checkmark.circle.fill")
                )
                DSBadge(
                    label: "Out of Stock",
                    size: .small,
                    variant: .outline,
                    color: .medium
                )
                DSBadge(
                    label: "Exclusive",
                    size: .small,
                    variant: .filledStrong,
                    color: .brand,
                    leadingIcon: Image(systemName: "star.fill")
                )
            }
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerWhite)
        )
    }
    
    private var featureHighlightsExample: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            Text("Product Name")
                .thdFont(.h6)
                .foregroundColor(textPrimary)
            
            HStack(spacing: TokensSpacing.Spacing2) {
                DSBadge(
                    label: "Free Shipping",
                    size: .base,
                    variant: .filledSubtle,
                    color: .success,
                    leadingIcon: Image(systemName: "shippingbox.fill")
                )
                DSBadge(
                    label: "Same Day Delivery",
                    size: .base,
                    variant: .outline,
                    color: .info
                )
            }
            
            HStack(spacing: TokensSpacing.Spacing2) {
                DSBadge(
                    label: "Top Rated",
                    size: .base,
                    variant: .filledStrong,
                    color: .brand,
                    leadingIcon: Image(systemName: "star.fill")
                )
                DSBadge(
                    label: "Price Match",
                    size: .base,
                    variant: .filledSubtle,
                    color: .info
                )
            }
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerWhite)
        )
    }
    
    private var categoryTagsExample: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            Text("Browse by Category")
                .thdFont(.h6)
                .foregroundColor(textPrimary)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: TokensSpacing.Spacing2) {
                    DSBadge(label: "Tools", size: .base, variant: .outline, color: .primary)
                    DSBadge(label: "Hardware", size: .base, variant: .outline, color: .primary)
                    DSBadge(label: "Appliances", size: .base, variant: .outline, color: .primary)
                    DSBadge(label: "Garden", size: .base, variant: .outline, color: .primary)
                    DSBadge(label: "Lighting", size: .base, variant: .outline, color: .primary)
                }
            }
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerWhite)
        )
    }
    
    private var notificationCountsExample: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            HStack {
                Text("Orders")
                    .thdFont(.bodySm)
                Spacer()
                DSBadge(label: "3", size: .small, variant: .filledStrong, color: .danger)
            }
            
            HStack {
                Text("Cart Items")
                    .thdFont(.bodySm)
                Spacer()
                DSBadge(label: "12", size: .small, variant: .filledStrong, color: .brand)
            }
            
            HStack {
                Text("Saved Projects")
                    .thdFont(.bodySm)
                Spacer()
                DSBadge(label: "5", size: .small, variant: .filledSubtle, color: .info)
            }
            
            HStack {
                Text("Notifications")
                    .thdFont(.bodySm)
                Spacer()
                DSBadge(label: "New", size: .small, variant: .filledStrong, color: .success)
            }
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
                specRow("Component", value: "DSBadge")
                specRow("Sizes", value: "Small (12px), Base (14px)")
                specRow("Variants", value: "Outline, Filled Subtle, Filled Strong")
                specRow("Colors", value: "7 semantic colors")
                specRow("Icon Sizes", value: "Small: 9pt, Base: 12.25pt")
                specRow("Horizontal Padding", value: "4pt (spacing-1)")
                specRow("Corner Radius", value: "4pt (border-radius-md)")
                specRow("Border Width", value: "0.5pt (outline only)")
                specRow("Font Weight", value: "Bold")
                specRow("Font Family", value: "THD SmVar Beta")
            }
            .padding(TokensSpacing.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(containerGreige)
            )
            
            Text("Semantic Colors")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
                .padding(.top, TokensSpacing.Spacing2)
            
            semanticColorsTable
            
            Text("Code Example")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
                .padding(.top, TokensSpacing.Spacing2)
            
            codeExample("""
// Basic badge
DSBadge(label: "New")

// Custom variant and color
DSBadge(
    label: "Sale",
    size: .base,
    variant: .filledStrong,
    color: .danger
)

// With icon
DSBadge(
    label: "Top Rated",
    size: .base,
    variant: .filledSubtle,
    color: .brand,
    leadingIcon: Image(systemName: "star.fill")
)

// Small outline badge
DSBadge(
    label: "Featured",
    size: .small,
    variant: .outline,
    color: .info
)
""")
        }
    }
    
    private var semanticColorsTable: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing1) {
            semanticColorRow("Info", usage: "Teal/Moonlight - informational status")
            semanticColorRow("Success", usage: "Green - positive, confirmed status")
            semanticColorRow("Warning", usage: "Yellow/Lemon - caution, attention")
            semanticColorRow("Danger", usage: "Red/Cinnabar - errors, critical")
            semanticColorRow("Medium", usage: "Gray/Greige - neutral, inactive")
            semanticColorRow("Primary", usage: "Black/Greige - primary content")
            semanticColorRow("Brand", usage: "Orange - brand highlights, featured")
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }
    
    private func semanticColorRow(_ color: String, usage: String) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(color)
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
    DSBadgeView()
}
