import SwiftUI

// MARK: - DSPLPPodDetails Showcase View

/// Comprehensive showcase of the DSPLPPodDetails component.
///
/// Demonstrates:
/// - Pricing types (standard, startingAt, withSavings, withRebate, etc.)
/// - Rating display
/// - Fulfillment information
/// - Special buy indicator
/// - Usage examples

struct DSPlpPodDetailsView: View {
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
            Text("DSPLPPodDetails")
                .thdFont(.h3)
                .foregroundStyle(textPrimary)

            Text("A component for displaying product details in a PLP pod. Shows product name, model number, pricing information, ratings, and fulfillment options.")
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
            // Pricing Types Section
            pricingTypesSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Special Pricing Section
            specialPricingSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Ratings Section
            ratingsSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Fulfillment Section
            fulfillmentSection

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

    // MARK: - Pricing Types Section

    private var pricingTypesSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Pricing Types",
                description: "Standard pricing display options."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
                Text(".standard")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSPLPPodDetails(
                    productName: "DEWALT 20V MAX Cordless Drill",
                    modelNumber: "DCD771C2",
                    pricingType: .standard(dollars: 149, cents: 99, perUnit: "/each")
                )
                .frame(width: 200)

                Text(".startingAt")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSPLPPodDetails(
                    productName: "Custom Blinds",
                    pricingType: .startingAt(dollars: 35, cents: 00)
                )
                .frame(width: 200)

                Text(".withSavings")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSPLPPodDetails(
                    productName: "Milwaukee M18 FUEL Impact",
                    modelNumber: "2853-22",
                    pricingType: .withSavings(
                        dollars: 179,
                        cents: 00,
                        originalPrice: 229.00,
                        savings: "Save $50.00",
                        perUnit: "/each"
                    ),
                    showSpecialBuy: true
                )
                .frame(width: 200)

                Text(".withRebate")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSPLPPodDetails(
                    productName: "Nest Thermostat",
                    pricingType: .withRebate(
                        dollars: 129,
                        cents: 99,
                        rebateText: "Get up to $50 rebate"
                    )
                )
                .frame(width: 200)
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - Special Pricing Section

    private var specialPricingSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Special Pricing",
                description: "Non-standard pricing scenarios."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
                Text(".lowerPriceInCart")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSPLPPodDetails(
                    productName: "Special Promo Item",
                    pricingType: .lowerPriceInCart
                )
                .frame(width: 200)

                Text(".contactStore")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSPLPPodDetails(
                    productName: "Custom Countertops",
                    pricingType: .contactStore
                )
                .frame(width: 200)

                Text(".specialOrder")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSPLPPodDetails(
                    productName: "Special Order Product",
                    pricingType: .specialOrder(
                        headerText: "Special Order",
                        bodyText: "This item requires special ordering",
                        phoneNumber: "1-800-555-0199"
                    )
                )
                .frame(width: 220)

                Text(".consultation")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSPLPPodDetails(
                    productName: "Kitchen Remodel",
                    pricingType: .consultation(
                        text: "Free In-Home Consultation",
                        subtitle: "Schedule with a specialist"
                    )
                )
                .frame(width: 200)
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - Ratings Section

    private var ratingsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Rating Display",
                description: "Integrated rating meter component."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                Text("With High Rating")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSPLPPodDetails(
                    productName: "Top Rated Product",
                    pricingType: .standard(dollars: 99, cents: 99, perUnit: nil),
                    ratingInfo: DSPLPPodRatingInfo(rating: 4.8, reviewCount: 2345)
                )
                .frame(width: 200)

                Text("With Low Rating")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSPLPPodDetails(
                    productName: "Budget Option",
                    pricingType: .standard(dollars: 29, cents: 99, perUnit: nil),
                    ratingInfo: DSPLPPodRatingInfo(rating: 3.2, reviewCount: 156)
                )
                .frame(width: 200)

                Text("No Rating")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSPLPPodDetails(
                    productName: "New Product",
                    pricingType: .standard(dollars: 59, cents: 99, perUnit: nil)
                )
                .frame(width: 200)
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - Fulfillment Section

    private var fulfillmentSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Fulfillment Information",
                description: "Pickup, delivery, and faster delivery options."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                Text("Full Fulfillment Options")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSPLPPodDetails(
                    productName: "Available Product",
                    pricingType: .standard(dollars: 79, cents: 99, perUnit: nil),
                    fulfillmentInfo: DSPLPPodFulfillmentInfo(
                        pickup: .init(primaryText: "Free Pickup Today", locationText: "at Atlanta Midtown"),
                        delivery: .init(primaryText: "Delivery: Free", dateText: "Tomorrow"),
                        fasterDelivery: .init(primaryText: "Express Delivery", timeText: "In 2 hours")
                    )
                )
                .frame(width: 220)

                Text("Delivery Unavailable")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSPLPPodDetails(
                    productName: "Pickup Only Product",
                    pricingType: .standard(dollars: 49, cents: 99, perUnit: nil),
                    fulfillmentInfo: DSPLPPodFulfillmentInfo(
                        pickup: .init(primaryText: "Available for Pickup"),
                        delivery: .init(primaryText: "Delivery Unavailable", isUnavailable: true)
                    )
                )
                .frame(width: 200)
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - Full Example Section

    private var fullExampleSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Full Example",
                description: "Complete details component with all features."
            )

            DSPLPPodDetails(
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
                perItemPriceDetail: "($74.99/per tool)",
                ratingInfo: DSPLPPodRatingInfo(rating: 4.7, reviewCount: 3456),
                fulfillmentInfo: DSPLPPodFulfillmentInfo(
                    pickup: .init(primaryText: "Free Pickup Today", locationText: "at Atlanta Midtown"),
                    delivery: .init(primaryText: "Delivery: Free", dateText: "Tomorrow")
                )
            )
            .frame(width: 220)
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
                Text("Pricing Types")
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)

                VStack(alignment: .leading, spacing: 4) {
                    Text("• .standard(dollars:cents:perUnit:)")
                    Text("• .startingAt(dollars:cents:)")
                    Text("• .withSavings(dollars:cents:originalPrice:savings:perUnit:)")
                    Text("• .withRebate(dollars:cents:rebateText:)")
                    Text("• .lowerPriceInCart")
                    Text("• .contactStore")
                    Text("• .specialOrder(headerText:bodyText:phoneNumber:)")
                    Text("• .consultation(text:subtitle:)")
                    Text("• .mapPricing(dollars:cents:seeLowerPriceText:rebateText:)")
                }
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)

                Text("Code Example")
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)
                    .padding(.top, TokensCoreLight.Spacing2)

                Text("""
                DSPLPPodDetails(
                    productName: "Product Name",
                    modelNumber: "ABC123",
                    pricingType: .withSavings(
                        dollars: 149, cents: 99,
                        originalPrice: 199.99,
                        savings: "Save $50.00",
                        perUnit: "/each"
                    ),
                    showSpecialBuy: true,
                    ratingInfo: DSPLPPodRatingInfo(
                        rating: 4.5,
                        reviewCount: 1234
                    ),
                    fulfillmentInfo: DSPLPPodFulfillmentInfo(
                        pickup: .init(primaryText: "Free Pickup"),
                        delivery: .init(primaryText: "Delivery: Free")
                    ),
                    onRatingsTap: { print("Ratings tapped") },
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
    DSPlpPodDetailsView()
}
