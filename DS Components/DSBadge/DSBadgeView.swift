import SwiftUI

// MARK: - DSBadge Showcase View

/// Comprehensive showcase of the DSBadge component
///
/// Demonstrates:
/// - All 2 sizes (small, base)
/// - All 3 variants (outline, filledSubtle, filledStrong)
/// - All 7 colors (info, success, warning, danger, primary, medium, brand)
/// - Leading icon support
/// - Factory methods (info, success, warning, danger, primary, brand)
/// - Dark mode support
/// - Real-world usage examples

struct DSBadgeView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing6) {

                // MARK: - Header Card
                VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                    Text("Badge")
                        .thdFont(.hero5)
                        .foregroundStyle(textPrimary)

                    Text("A badge component for displaying status labels and tags. Supports 2 sizes, 3 variants, 7 colors, and optional leading icons.")
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

                    // Badge Colors
                    badgeColorsSection

                    Divider().padding(.vertical, TokensCoreLight.Spacing2)

                    // Badge Variants
                    badgeVariantsSection

                    Divider().padding(.vertical, TokensCoreLight.Spacing2)

                    // Badge Sizes
                    badgeSizesSection

                    Divider().padding(.vertical, TokensCoreLight.Spacing2)

                    // Leading Icons
                    leadingIconsSection

                    Divider().padding(.vertical, TokensCoreLight.Spacing2)

                    // Factory Methods
                    factoryMethodsSection

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

    // MARK: - Badge Colors Section

    private var badgeColorsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader(
                "Badge Colors",
                description: "7 color variants for different contexts"
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                colorExample("Info", description: "Informational, teal color", color: .info)
                colorExample("Success", description: "Positive, green color", color: .success)
                colorExample("Warning", description: "Caution, yellow color", color: .warning)
                colorExample("Danger", description: "Error, red color", color: .danger)
                colorExample("Primary", description: "Default, black color", color: .primary)
                colorExample("Medium", description: "Neutral, gray color", color: .medium)
                colorExample("Brand", description: "THD brand, orange color", color: .brand)
            }
        }
    }

    private func colorExample(_ title: String, description: String, color: DSBadgeColor) -> some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                Text(title)
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)

                Text(description)
                    .thdFont(.caption)
                    .foregroundStyle(textTertiary)
            }

            HStack(spacing: TokensCoreLight.Spacing2) {
                DSBadge(title, variant: .outline, color: color)
                DSBadge(title, variant: .filledSubtle, color: color)
                DSBadge(title, variant: .filledStrong, color: color)
                Spacer()
            }
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }

    // MARK: - Badge Variants Section

    private var badgeVariantsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader(
                "Badge Variants",
                description: "3 visual style variants"
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                variantExample(
                    "Outline",
                    description: "Border only, no fill",
                    variant: .outline
                )

                variantExample(
                    "Filled Subtle",
                    description: "Light background fill",
                    variant: .filledSubtle
                )

                variantExample(
                    "Filled Strong",
                    description: "Bold background fill",
                    variant: .filledStrong
                )
            }
        }
    }

    private func variantExample(_ title: String, description: String, variant: DSBadgeVariant) -> some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                Text(title)
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)

                Text(description)
                    .thdFont(.caption)
                    .foregroundStyle(textTertiary)
            }

            HStack(spacing: TokensCoreLight.Spacing2) {
                DSBadge("Info", variant: variant, color: .info)
                DSBadge("Success", variant: variant, color: .success)
                DSBadge("Warning", variant: variant, color: .warning)
                DSBadge("Danger", variant: variant, color: .danger)
                Spacer()
            }
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }

    // MARK: - Badge Sizes Section

    private var badgeSizesSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader(
                "Badge Sizes",
                description: "Small (16pt) and Base (20pt) sizes"
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                sizeExample(
                    "Small",
                    description: "16pt min height, 12pt font",
                    size: .small
                )

                sizeExample(
                    "Base",
                    description: "20pt min height, 14pt font",
                    size: .base
                )
            }
        }
    }

    private func sizeExample(_ title: String, description: String, size: DSBadgeSize) -> some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                Text(title)
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)

                Text(description)
                    .thdFont(.caption)
                    .foregroundStyle(textTertiary)
            }

            HStack(spacing: TokensCoreLight.Spacing2) {
                DSBadge("Outline", size: size, variant: .outline, color: .info)
                DSBadge("Subtle", size: size, variant: .filledSubtle, color: .success)
                DSBadge("Strong", size: size, variant: .filledStrong, color: .brand)
                Spacer()
            }
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
                description: "Badges with optional leading icon"
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                iconExample(
                    "Without Icon",
                    description: "Text only badge",
                    icon: nil
                )

                iconExample(
                    "With Icon",
                    description: "Icon displayed before text",
                    icon: Image(systemName: "checkmark")
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

                    HStack(spacing: TokensCoreLight.Spacing2) {
                        DSBadge("New", variant: .filledStrong, color: .brand, leadingIcon: Image(systemName: "sparkles"))
                        DSBadge("Verified", variant: .filledStrong, color: .success, leadingIcon: Image(systemName: "checkmark.seal.fill"))
                        DSBadge("Hot", variant: .filledStrong, color: .danger, leadingIcon: Image(systemName: "flame.fill"))
                        Spacer()
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

            HStack(spacing: TokensCoreLight.Spacing2) {
                DSBadge("In Stock", variant: .filledSubtle, color: .success, leadingIcon: icon)
                DSBadge("Sale", variant: .filledStrong, color: .danger, leadingIcon: icon)
                Spacer()
            }
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }

    // MARK: - Factory Methods Section

    private var factoryMethodsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader(
                "Factory Methods",
                description: "Convenience methods for common badge types"
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                    Text("Available Factory Methods")
                        .thdFont(.bodySm)
                        .foregroundStyle(textPrimary)

                    Text(".info(), .success(), .warning(), .danger(), .primary(), .brand()")
                        .thdFont(.caption)
                        .foregroundStyle(textTertiary)
                }

                HStack(spacing: TokensCoreLight.Spacing2) {
                    DSBadge.info("Info")
                    DSBadge.success("Success")
                    DSBadge.warning("Warning")
                    DSBadge.danger("Danger")
                    Spacer()
                }

                HStack(spacing: TokensCoreLight.Spacing2) {
                    DSBadge.primary("Primary")
                    DSBadge.brand("Brand")
                    Spacer()
                }
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

            Text("Product Status")
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)

            productStatusExample

            Text("Order Status")
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
                .padding(.top, TokensCoreLight.Spacing2)

            orderStatusExample

            Text("User Badges")
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
                .padding(.top, TokensCoreLight.Spacing2)

            userBadgesExample
        }
    }

    private var productStatusExample: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            HStack(spacing: TokensCoreLight.Spacing2) {
                DSBadge("In Stock", variant: .filledSubtle, color: .success, leadingIcon: Image(systemName: "checkmark"))
                DSBadge("Low Stock", variant: .filledSubtle, color: .warning)
                DSBadge("Out of Stock", variant: .filledSubtle, color: .danger)
            }
            HStack(spacing: TokensCoreLight.Spacing2) {
                DSBadge("Sale", variant: .filledStrong, color: .danger)
                DSBadge("New", variant: .filledStrong, color: .brand)
                DSBadge("Exclusive", variant: .filledStrong, color: .primary)
            }
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerWhite)
        )
    }

    private var orderStatusExample: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            HStack(spacing: TokensCoreLight.Spacing2) {
                DSBadge("Pending", variant: .outline, color: .medium)
                DSBadge("Processing", variant: .filledSubtle, color: .info)
                DSBadge("Shipped", variant: .filledSubtle, color: .brand)
                DSBadge("Delivered", variant: .filledStrong, color: .success)
            }
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerWhite)
        )
    }

    private var userBadgesExample: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            HStack(spacing: TokensCoreLight.Spacing2) {
                DSBadge("Pro Member", size: .base, variant: .filledStrong, color: .brand, leadingIcon: Image(systemName: "star.fill"))
                DSBadge("Verified", size: .base, variant: .filledSubtle, color: .success, leadingIcon: Image(systemName: "checkmark.seal.fill"))
            }
        }
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
                specRow("Component", value: "DSBadge")
                specRow("Sizes", value: "2 (small, base)")
                specRow("Variants", value: "3 (outline, filledSubtle, filledStrong)")
                specRow("Colors", value: "7")
                specRow("Small Height", value: "16pt min")
                specRow("Base Height", value: "20pt min")
                specRow("Small Font", value: "12pt bold")
                specRow("Base Font", value: "14pt bold")
                specRow("Padding", value: "4pt")
                specRow("Icon Size", value: "12pt (small), 14pt (base)")
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
// Simple badge
DSBadge("New")

// Badge with all options
DSBadge(
    "In Stock",
    size: .base,
    variant: .filledStrong,
    color: .success,
    leadingIcon: Image(systemName: "checkmark")
)

// Using factory methods
DSBadge.success("Verified")
DSBadge.danger("Sale", variant: .filledStrong)
DSBadge.brand("Pro Member", size: .base)
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

    private var borderRadiusLg: CGFloat {
        tokens.BorderRadiusLg
    }

    private var borderRadiusXl: CGFloat {
        tokens.BorderRadiusXl
    }

    private var codeBlockBg: Color {
        tokens.BackgroundContainerColorTransparent05
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
    static var BackgroundContainerColorTransparent05: Color { get }
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
