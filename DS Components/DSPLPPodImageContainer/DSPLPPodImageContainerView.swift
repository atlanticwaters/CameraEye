import SwiftUI

// MARK: - DSPLPPodImageContainer Showcase View

/// Comprehensive showcase of the DSPLPPodImageContainer component.
///
/// Demonstrates:
/// - Product image display
/// - Badge configurations
/// - Sponsored indicator
/// - Swatch display options
/// - Usage examples

struct DSPLPPodImageContainerView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing6) {
                // Header Card
                headerCard

                // Content Card with all sections
                contentCard
            }
            .padding(TokensCoreLight.Spacing4)
            .padding(.top, TokensCoreLight.Spacing24)
            .padding(.bottom, TokensCoreLight.Spacing20)
        }
        .background(surfaceGreige)
        .applySoftScrollEdges()
    }

    // MARK: - Header Card

    private var headerCard: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            Text("DSPLPPodImageContainer")
                .thdFont(.h3)
                .foregroundStyle(textPrimary)

            Text("A container component for displaying product images in a PLP pod. Displays a product image with optional badges, sponsored tag, and various swatch display options.")
                .thdFont(.bodyMd)
                .foregroundStyle(textSecondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(TokensCoreLight.Spacing4)
        .background(surfaceWhite)
        .clipShape(.rect(cornerRadius: TokensCoreLight.Spacing3))
    }

    // MARK: - Content Card

    private var contentCard: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Badges Section
            badgesSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Sponsored Section
            sponsoredSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Swatch Display Section
            swatchDisplaySection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Full Example Section
            fullExampleSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Specifications Section
            specificationsSection
        }
        .background(surfaceWhite)
        .clipShape(.rect(cornerRadius: TokensCoreLight.Spacing3))
    }

    // MARK: - Badges Section

    private var badgesSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Badges",
                description: "Product badges with factory methods."
            )

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: TokensCoreLight.Spacing3) {
                    VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                        Text(".exclusive()")
                            .thdFont(.caption)
                            .foregroundStyle(textSecondary)

                        DSPLPPodImageContainer(
                            badges: [.exclusive()]
                        )
                    }

                    VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                        Text(".christmasDelivery()")
                            .thdFont(.caption)
                            .foregroundStyle(textSecondary)

                        DSPLPPodImageContainer(
                            badges: [.christmasDelivery()]
                        )
                    }

                    VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                        Text(".specialSavings()")
                            .thdFont(.caption)
                            .foregroundStyle(textSecondary)

                        DSPLPPodImageContainer(
                            badges: [.specialSavings()]
                        )
                    }

                    VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                        Text(".topRated()")
                            .thdFont(.caption)
                            .foregroundStyle(textSecondary)

                        DSPLPPodImageContainer(
                            badges: [.topRated()]
                        )
                    }

                    VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                        Text("Multiple")
                            .thdFont(.caption)
                            .foregroundStyle(textSecondary)

                        DSPLPPodImageContainer(
                            badges: [.exclusive(), .christmasDelivery()]
                        )
                    }
                }
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - Sponsored Section

    private var sponsoredSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Sponsored Indicator",
                description: "Shows when product is sponsored."
            )

            HStack(spacing: TokensCoreLight.Spacing4) {
                VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                    Text("Sponsored")
                        .thdFont(.caption)
                        .foregroundStyle(textSecondary)

                    DSPLPPodImageContainer(
                        isSponsored: true
                    )
                }

                VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                    Text("Not Sponsored")
                        .thdFont(.caption)
                        .foregroundStyle(textSecondary)

                    DSPLPPodImageContainer(
                        isSponsored: false
                    )
                }
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - Swatch Display Section

    private var swatchDisplaySection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Swatch Display Options",
                description: "Various ways to display color/style options."
            )

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: TokensCoreLight.Spacing3) {
                    VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                        Text("With Quantity")
                            .thdFont(.caption)
                            .foregroundStyle(textSecondary)

                        DSPLPPodImageContainer(
                            swatchDisplay: .swatchesWithQuantity(
                                swatches: [
                                    DSPLPPodSwatch(color: .red),
                                    DSPLPPodSwatch(color: .blue),
                                    DSPLPPodSwatch(color: .green)
                                ],
                                additionalCount: 5
                            )
                        )
                    }

                    VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                        Text("Swatches Only")
                            .thdFont(.caption)
                            .foregroundStyle(textSecondary)

                        DSPLPPodImageContainer(
                            swatchDisplay: .swatchesOnly(
                                swatches: [
                                    DSPLPPodSwatch(color: .purple),
                                    DSPLPPodSwatch(color: .orange)
                                ]
                            )
                        )
                    }

                    VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                        Text("More Options")
                            .thdFont(.caption)
                            .foregroundStyle(textSecondary)

                        DSPLPPodImageContainer(
                            swatchDisplay: .moreOptionsAvailable
                        )
                    }

                    VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                        Text("Custom Options")
                            .thdFont(.caption)
                            .foregroundStyle(textSecondary)

                        DSPLPPodImageContainer(
                            swatchDisplay: .customOptions(text: "3 Sizes, 5 Colors")
                        )
                    }

                    VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                        Text("None")
                            .thdFont(.caption)
                            .foregroundStyle(textSecondary)

                        DSPLPPodImageContainer(
                            swatchDisplay: .none
                        )
                    }
                }
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - Full Example Section

    private var fullExampleSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Full Example",
                description: "Complete image container with all features."
            )

            DSPLPPodImageContainer(
                badges: [.exclusive(), .christmasDelivery()],
                isSponsored: true,
                swatchDisplay: .swatchesWithQuantity(
                    swatches: [
                        DSPLPPodSwatch(color: .red),
                        DSPLPPodSwatch(color: .blue),
                        DSPLPPodSwatch(color: .green)
                    ],
                    additionalCount: 5
                ),
                onImageTap: { },
                onSwatchTap: { _ in }
            )
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - Specifications Section

    private var specificationsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Specifications",
                description: "Technical details and code examples."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                specRow(label: "Container Width", value: "145pt")
                specRow(label: "Hero Image Size", value: "144pt × 144pt")
                specRow(label: "Swatch Size", value: "26pt")
                specRow(label: "Corner Radius", value: "8pt")

                Text("Badge Factory Methods")
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)
                    .padding(.top, TokensCoreLight.Spacing2)

                VStack(alignment: .leading, spacing: 4) {
                    Text("• .exclusive() - Info color")
                    Text("• .christmasDelivery() - Success color")
                    Text("• .specialSavings() - Warning color")
                    Text("• .newArrival() - Info color")
                    Text("• .topRated() - Success color")
                }
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)

                Text("Swatch Display Options")
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)
                    .padding(.top, TokensCoreLight.Spacing2)

                VStack(alignment: .leading, spacing: 4) {
                    Text("• .swatchesWithQuantity(swatches:additionalCount:)")
                    Text("• .swatchesOnly(swatches:)")
                    Text("• .moreOptionsAvailable")
                    Text("• .customOptions(text:)")
                    Text("• .swatchError(swatches:errorMessage:)")
                    Text("• .none")
                }
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)

                Text("Code Example")
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)
                    .padding(.top, TokensCoreLight.Spacing2)

                Text("""
                DSPLPPodImageContainer(
                    image: productImage,
                    badges: [.exclusive(), .christmasDelivery()],
                    isSponsored: true,
                    swatchDisplay: .swatchesWithQuantity(
                        swatches: [
                            DSPLPPodSwatch(color: .red),
                            DSPLPPodSwatch(color: .blue)
                        ],
                        additionalCount: 5
                    ),
                    onImageTap: { print("Image tapped") },
                    onSwatchTap: { swatch in
                        print("Swatch: \\(swatch.id)")
                    }
                )
                """)
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
                .padding(TokensCoreLight.Spacing3)
                .background(surfaceGreige)
                .clipShape(.rect(cornerRadius: 8))
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - Helper Methods

    @ViewBuilder
    private func sectionHeader(title: String, description: String) -> some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
            Text(title)
                .thdFont(.h5)
                .foregroundStyle(textPrimary)

            Text(description)
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
        }
    }

    @ViewBuilder
    private func specRow(label: String, value: String) -> some View {
        HStack {
            Text(label)
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
            Spacer()
            Text(value)
                .thdFont(.bodySm)
                .foregroundStyle(textPrimary)
        }
    }

    // MARK: - Theme-Aware Colors

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    private var surfaceWhite: Color { tokens.BackgroundContainerColorWhite }
    private var surfaceGreige: Color { tokens.BackgroundSurfaceColorGreige }
    private var textPrimary: Color { tokens.TextOnContainerColorPrimary }
    private var textSecondary: Color { tokens.TextOnContainerColorSecondary }
}

// MARK: - Token Protocol Helper

private protocol TokenSemanticProtocol {
    static var TextOnContainerColorPrimary: Color { get }
    static var TextOnContainerColorSecondary: Color { get }
    static var BackgroundContainerColorWhite: Color { get }
    static var BackgroundSurfaceColorGreige: Color { get }
}

extension TokensSemanticLight: TokenSemanticProtocol {}
extension TokensSemanticDark: TokenSemanticProtocol {}

// MARK: - Preview

#Preview {
    DSPLPPodImageContainerView()
}
