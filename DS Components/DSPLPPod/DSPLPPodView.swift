import SwiftUI

// MARK: - DSPLPPod Showcase View

/// Comprehensive showcase of the DSPLPPod component.
///
/// Demonstrates:
/// - B2C and B2B variants
/// - Complete product pod with image, details, and buttons
/// - Integration of sub-components
/// - Interactive examples
/// - Usage examples

struct DSPLPPodView: View {
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
            Text("DSPLPPod")
                .thdFont(.h3)
                .foregroundStyle(textPrimary)

            Text("A composite component for displaying a complete PLP (Product Listing Page) pod. Combines DSPLPPodImageContainer, DSPLPPodDetails, and DSPLPPodButtonSet into a single cohesive component.")
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
            // Variants Section
            variantsSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // B2C Example Section
            b2cExampleSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // B2B Example Section
            b2bExampleSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Interactive Example Section
            interactiveSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Usage Examples Section
            usageExamplesSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Specifications Section
            specificationsSection
        }
        .background(surfaceWhite)
        .clipShape(.rect(cornerRadius: TokensCoreLight.Spacing3))
    }

    // MARK: - Variants Section

    private var variantsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Pod Variants",
                description: "B2C (consumer) and B2B (business) variants."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                Text(".b2c - Consumer variant")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                Text("Features: Image, details, single Add to Cart button")
                    .thdFont(.bodySm)
                    .foregroundStyle(textSecondary)

                Text(".b2b - Business variant")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                Text("Features: Image, details, quantity picker, Add to Cart, Add to List buttons")
                    .thdFont(.bodySm)
                    .foregroundStyle(textSecondary)
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - B2C Example Section

    private var b2cExampleSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "B2C Variant",
                description: "Consumer-facing product pod with basic add to cart."
            )

            DSPLPPod(
                variant: .b2c,
                data: DSPLPPodData(
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
                    productName: "DEWALT 20V MAX Cordless Drill/Driver Kit",
                    modelNumber: "DCD771C2",
                    pricingType: .withSavings(
                        dollars: 149,
                        cents: 99,
                        originalPrice: 199.99,
                        savings: "Save $50.00",
                        perUnit: "/each"
                    ),
                    showSpecialBuy: true,
                    ratingInfo: DSPLPPodRatingInfo(rating: 4.5, reviewCount: 1234),
                    fulfillmentInfo: DSPLPPodFulfillmentInfo(
                        pickup: .init(primaryText: "Free Pickup Today", locationText: "at Atlanta Midtown"),
                        delivery: .init(primaryText: "Delivery: Free", dateText: "Tomorrow")
                    )
                )
            )
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - B2B Example Section

    private var b2bExampleSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "B2B Variant",
                description: "Business-facing product pod with quantity picker and list actions."
            )

            DSPLPPod(
                variant: .b2b,
                data: DSPLPPodData(
                    badges: [.topRated()],
                    swatchDisplay: .moreOptionsAvailable,
                    productName: "Milwaukee M18 FUEL 1/2 in. Hammer Drill Kit",
                    modelNumber: "2904-22",
                    pricingType: .standard(dollars: 299, cents: 00, perUnit: "/each"),
                    perItemPriceDetail: "($149.50/per tool)",
                    ratingInfo: DSPLPPodRatingInfo(rating: 4.8, reviewCount: 892),
                    fulfillmentInfo: DSPLPPodFulfillmentInfo(
                        pickup: .init(primaryText: "Ready in 2 Hours"),
                        delivery: .init(primaryText: "Free Delivery", dateText: "Dec 28")
                    ),
                    quantity: 2
                )
            )
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - Interactive Section

    private var interactiveSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Interactive Example",
                description: "Try the pod interactions."
            )

            DSPLPPodInteractiveExample()
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - Usage Examples Section

    private var usageExamplesSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Usage Examples",
                description: "Common pod configurations."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                Text("Minimal Pod")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSPLPPod(
                    variant: .b2c,
                    data: DSPLPPodData(
                        productName: "Basic Product",
                        pricingType: .standard(dollars: 49, cents: 99, perUnit: nil)
                    )
                )

                Text("Contact Store Pricing")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSPLPPod(
                    variant: .b2c,
                    data: DSPLPPodData(
                        productName: "Special Order Item",
                        pricingType: .contactStore
                    )
                )

                Text("Lower Price in Cart")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSPLPPod(
                    variant: .b2c,
                    data: DSPLPPodData(
                        badges: [.specialSavings()],
                        productName: "Promotional Product",
                        pricingType: .lowerPriceInCart,
                        ratingInfo: DSPLPPodRatingInfo(rating: 4.2, reviewCount: 567)
                    )
                )
            }
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
                specRow(label: "Image Container Width", value: "145pt")
                specRow(label: "Details Width", value: "205pt")
                specRow(label: "Corner Radius", value: "8pt")
                specRow(label: "Content Padding", value: "8pt")

                Text("Sub-Components")
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)
                    .padding(.top, TokensCoreLight.Spacing2)

                VStack(alignment: .leading, spacing: 4) {
                    Text("• DSPLPPodImageContainer - Product image, badges, swatches")
                    Text("• DSPLPPodDetails - Name, model, pricing, ratings, fulfillment")
                    Text("• DSPLPPodButtonSet - Add to cart, quantity, list buttons")
                }
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)

                Text("Code Example")
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)
                    .padding(.top, TokensCoreLight.Spacing2)

                Text("""
                DSPLPPod(
                    variant: .b2c,
                    data: DSPLPPodData(
                        productImage: productImage,
                        badges: [.exclusive()],
                        productName: "Product Name",
                        modelNumber: "ABC123",
                        pricingType: .standard(
                            dollars: 149, cents: 99,
                            perUnit: "/each"
                        ),
                        ratingInfo: DSPLPPodRatingInfo(
                            rating: 4.5,
                            reviewCount: 1234
                        )
                    ),
                    onAddToCart: { print("Add to cart") },
                    onProductTap: { print("Product tapped") }
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

// MARK: - Interactive Example

private struct DSPLPPodInteractiveExample: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var quantity: Int = 1
    @State private var lastAction: String = "Interact with the pod..."
    @State private var selectedVariant: DSPLPPodVariant = .b2c

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            // Variant Picker
            HStack {
                Text("Variant:")
                    .thdFont(.caption)

                Picker("Variant", selection: $selectedVariant) {
                    Text("B2C").tag(DSPLPPodVariant.b2c)
                    Text("B2B").tag(DSPLPPodVariant.b2b)
                }
                .pickerStyle(.segmented)
            }

            // Status Display
            Text("Last Action: \(lastAction)")
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
                .padding(TokensCoreLight.Spacing2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(surfaceGreige)
                .clipShape(.rect(cornerRadius: 8))

            // Pod
            DSPLPPod(
                variant: selectedVariant,
                data: DSPLPPodData(
                    badges: [.exclusive()],
                    productName: "Interactive Demo Product",
                    modelNumber: "DEMO-123",
                    pricingType: .standard(dollars: 99, cents: 99, perUnit: "/each"),
                    ratingInfo: DSPLPPodRatingInfo(rating: 4.5, reviewCount: 100),
                    quantity: quantity
                ),
                onImageTap: { lastAction = "Image tapped" },
                onProductTap: { lastAction = "Product name tapped" },
                onRatingsTap: { lastAction = "Ratings tapped" },
                onQuantityChanged: { newQty in
                    quantity = newQty
                    lastAction = "Quantity changed to \(newQty)"
                },
                onAddToCart: { lastAction = "Add to Cart tapped (qty: \(quantity))" },
                onAddToList: { lastAction = "Add to List tapped" }
            )
        }
    }

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    private var surfaceGreige: Color { tokens.BackgroundSurfaceColorGreige }
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
    DSPLPPodView()
}
