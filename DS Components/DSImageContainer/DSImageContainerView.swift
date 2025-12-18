import SwiftUI

// MARK: - DSImageContainerView
/// A comprehensive showcase view for DSImageContainer component
/// Demonstrates all sizes, content modes, and usage patterns

struct DSImageContainerView: View {
    @Environment(\.colorScheme) var colorScheme

    // Demo image
    private var demoImage: Image {
        Image("Acorn")
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing6) {

                // MARK: - Header Card
                VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                    Text("Image Container")
                        .thdFont(.hero5)
                        .foregroundColor(textPrimary)

                    Text("A responsive image container component with 8 predefined sizes for consistent image display.")
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

                    // Complete Example
                    completeExampleSection

                    Divider().padding(.vertical, TokensSpacing.Spacing2)

                    // Anatomy
                    anatomySection

                    Divider().padding(.vertical, TokensSpacing.Spacing2)

                    // All Sizes
                    allSizesSection

                    Divider().padding(.vertical, TokensSpacing.Spacing2)

                    // Content Modes
                    contentModesSection

                    Divider().padding(.vertical, TokensSpacing.Spacing2)

                    // Size Comparison
                    sizeComparisonSection

                    Divider().padding(.vertical, TokensSpacing.Spacing2)

                    // Factory Methods
                    factoryMethodsSection

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
            .padding(.top, 60)
            .padding(.bottom, 80)
        }
        .background(surfaceGreige)
        .applySoftScrollEdges()
    }

    // MARK: - Complete Example Section
    private var completeExampleSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader("Complete Example", description: "Image container with default settings")

            HStack(spacing: TokensSpacing.Spacing4) {
                DSImageContainer(
                    image: demoImage,
                    size: .large,
                    contentMode: .fill
                )

                VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                    Text("Large Size (160×160)")
                        .thdFont(.bodySm)
                        .foregroundColor(textPrimary)
                    Text("Default content mode: fill")
                        .thdFont(.caption)
                        .foregroundColor(textSecondary)
                    Text("Images are clipped to bounds")
                        .thdFont(.caption)
                        .foregroundColor(textTertiary)
                }
            }
            .padding(TokensSpacing.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(containerGreige)
            )
        }
    }

    // MARK: - Anatomy Section
    private var anatomySection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader("Anatomy", description: "Component structure")

            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                anatomyRow("1", "Image", "SwiftUI Image to display")
                anatomyRow("2", "Size", "Container size (8 options)")
                anatomyRow("3", "Content Mode", "Fill or Fit")
                anatomyRow("4", "Clipping", "Clips to bounds")
            }
            .padding(TokensSpacing.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(containerGreige)
            )
        }
    }

    private func anatomyRow(_ number: String, _ title: String, _ description: String) -> some View {
        HStack(alignment: .top, spacing: TokensSpacing.Spacing3) {
            Text(number)
                .thdFont(.caption)
                .foregroundColor(.white)
                .frame(width: 20, height: 20)
                .background(Circle().fill(Color.orange))

            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .thdFont(.bodySm)
                    .foregroundColor(textPrimary)
                Text(description)
                    .thdFont(.caption)
                    .foregroundColor(textSecondary)
            }
        }
    }

    // MARK: - All Sizes Section
    private var allSizesSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader("All Sizes", description: "8 predefined container sizes")

            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                // Show smaller sizes inline
                sizeExample("large", dimension: "160×160", size: .large)
                sizeExample("medium", dimension: "120×120", size: .medium)
                sizeExample("small", dimension: "80×80", size: .small)
                sizeExample("xSmall", dimension: "64×64", size: .xSmall)
                sizeExample("xxSmall", dimension: "48×48", size: .xxSmall)
                sizeExample("micro", dimension: "32×32", size: .micro)

                // Larger sizes shown separately with note
                VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                    Text("Larger Sizes")
                        .thdFont(.bodySm)
                        .foregroundColor(textSecondary)

                    HStack(spacing: TokensSpacing.Spacing2) {
                        VStack(spacing: 4) {
                            Text(".xLarge")
                                .thdFont(.caption)
                                .foregroundColor(Color.orange)
                            Text("240×240")
                                .thdFont(.caption)
                                .foregroundColor(textTertiary)
                        }
                        VStack(spacing: 4) {
                            Text(".xxLarge")
                                .thdFont(.caption)
                                .foregroundColor(Color.orange)
                            Text("320×320")
                                .thdFont(.caption)
                                .foregroundColor(textTertiary)
                        }
                    }
                }
                .padding(TokensSpacing.Spacing3)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: borderRadiusLg)
                        .fill(containerGreige)
                )
            }
        }
    }

    private func sizeExample(_ name: String, dimension: String, size: DSImageContainer.Size) -> some View {
        HStack(spacing: TokensSpacing.Spacing3) {
            DSImageContainer(
                image: demoImage,
                size: size
            )

            VStack(alignment: .leading, spacing: 2) {
                Text(".\(name)")
                    .thdFont(.caption)
                    .foregroundColor(Color.orange)
                    .font(.system(.caption, design: .monospaced))
                Text(dimension)
                    .thdFont(.caption)
                    .foregroundColor(textSecondary)
            }

            Spacer()
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }

    // MARK: - Content Modes Section
    private var contentModesSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader("Content Modes", description: "Fill vs Fit aspect ratio")

            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                contentModeExample(
                    "Fill",
                    description: "Scales to fill, may crop",
                    contentMode: .fill
                )

                contentModeExample(
                    "Fit",
                    description: "Scales to fit, may have space",
                    contentMode: .fit
                )
            }
        }
    }

    private func contentModeExample(_ title: String, description: String, contentMode: DSImageContainer.ContentMode) -> some View {
        HStack(spacing: TokensSpacing.Spacing3) {
            DSImageContainer(
                image: demoImage,
                size: .medium,
                contentMode: contentMode
            )
            .background(Color.gray.opacity(0.1))
            .overlay(
                RoundedRectangle(cornerRadius: 2)
                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
            )

            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .thdFont(.bodySm)
                    .foregroundColor(textPrimary)
                Text(description)
                    .thdFont(.caption)
                    .foregroundColor(textSecondary)
            }

            Spacer()
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }

    // MARK: - Size Comparison Section
    private var sizeComparisonSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader("Size Comparison", description: "Visual comparison")

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .bottom, spacing: TokensSpacing.Spacing2) {
                    ForEach(Array(DSImageContainer.Size.allCases.reversed().enumerated()), id: \.offset) { _, size in
                        VStack(spacing: 4) {
                            DSImageContainer(
                                image: demoImage,
                                size: size
                            )

                            Text("\(Int(size.dimension))")
                                .font(.system(size: 10))
                                .foregroundColor(textTertiary)
                        }
                    }
                }
                .padding(TokensSpacing.Spacing3)
            }
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(containerGreige)
            )
        }
    }

    // MARK: - Factory Methods Section
    private var factoryMethodsSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader("Factory Methods", description: "Static constructors")

            VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                factoryMethodRow(".xxLarge(image)", size: "320pt")
                factoryMethodRow(".xLarge(image)", size: "240pt")
                factoryMethodRow(".large(image)", size: "160pt")
                factoryMethodRow(".medium(image)", size: "120pt")
                factoryMethodRow(".small(image)", size: "80pt")
                factoryMethodRow(".xSmall(image)", size: "64pt")
                factoryMethodRow(".xxSmall(image)", size: "48pt")
                factoryMethodRow(".micro(image)", size: "32pt")
            }
            .padding(TokensSpacing.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(containerGreige)
            )
        }
    }

    private func factoryMethodRow(_ method: String, size: String) -> some View {
        HStack {
            Text(method)
                .thdFont(.caption)
                .foregroundColor(textPrimary)
                .font(.system(.caption, design: .monospaced))
            Spacer()
            Text(size)
                .thdFont(.caption)
                .foregroundColor(textSecondary)
        }
    }

    // MARK: - Usage Examples Section
    private var usageExamplesSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader("Usage Examples", description: "Common patterns")

            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                usageExample(
                    "Product Thumbnail",
                    description: "Small image in cart/list"
                ) {
                    HStack(spacing: TokensSpacing.Spacing3) {
                        DSImageContainer(
                            image: demoImage,
                            size: .small
                        )

                        VStack(alignment: .leading) {
                            Text("Power Drill Kit")
                                .thdFont(.bodySm)
                                .foregroundColor(textPrimary)
                            Text("$149.99")
                                .thdFont(.caption)
                                .foregroundColor(textSecondary)
                        }
                    }
                }

                usageExample(
                    "Product Grid",
                    description: "Medium images in grid"
                ) {
                    HStack(spacing: TokensSpacing.Spacing2) {
                        ForEach(0..<3, id: \.self) { _ in
                            VStack(spacing: 4) {
                                DSImageContainer(
                                    image: demoImage,
                                    size: .small
                                )

                                Text("Product")
                                    .thdFont(.caption)
                                    .foregroundColor(textSecondary)
                            }
                        }
                    }
                }

                usageExample(
                    "Avatar/Icon",
                    description: "Micro size for avatars"
                ) {
                    HStack(spacing: TokensSpacing.Spacing2) {
                        DSImageContainer(
                            image: demoImage,
                            size: .micro
                        )

                        Text("John Doe")
                            .thdFont(.bodySm)
                            .foregroundColor(textPrimary)
                    }
                }
            }
        }
    }

    private func usageExample<Content: View>(_ title: String, description: String, @ViewBuilder content: () -> Content) -> some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            Text(title)
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)

            Text(description)
                .thdFont(.caption)
                .foregroundColor(textTertiary)

            content()
                .padding(TokensSpacing.Spacing3)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: borderRadiusLg)
                        .fill(containerWhite)
                )
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }

    // MARK: - Specifications Section
    private var specificationsSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader("Specifications", description: "Configuration options")

            VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                specRow("image", value: "Image (required)")
                specRow("size", value: ".large (default)")
                specRow("contentMode", value: ".fill (default)")
            }
            .padding(TokensSpacing.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(containerGreige)
            )

            Text("Code Example")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
                .padding(.top, TokensSpacing.Spacing2)

            codeExample("""
DSImageContainer(
    image: Image("Acorn"),
    size: .large,
    contentMode: .fill
)

// Factory method:
DSImageContainer.large(Image("Acorn"))
""")
        }
    }

    private func specRow(_ label: String, value: String) -> some View {
        HStack {
            Text(label)
                .thdFont(.caption)
                .foregroundColor(textTertiary)
                .font(.system(.caption, design: .monospaced))

            Spacer()

            Text(value)
                .thdFont(.caption)
                .foregroundColor(textSecondary)
        }
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

    private var tokens: any DSImageContainerTokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }
}

// MARK: - Token Protocol Helper
private protocol DSImageContainerTokenSemanticProtocol {
    static var TextOnContainerColorPrimary: Color { get }
    static var TextOnContainerColorSecondary: Color { get }
    static var TextOnContainerColorTertiary: Color { get }
    static var BackgroundContainerColorWhite: Color { get }
    static var BackgroundContainerColorGreige: Color { get }
    static var BackgroundSurfaceColorGreige: Color { get }
    static var BorderRadiusLg: CGFloat { get }
    static var BorderRadiusXl: CGFloat { get }
}

extension TokensSemanticLight: DSImageContainerTokenSemanticProtocol {}
extension TokensSemanticDark: DSImageContainerTokenSemanticProtocol {}

// MARK: - Preview
#Preview {
    DSImageContainerView()
}
