import SwiftUI

// MARK: - DSMiniProductCard Showcase View

/// Comprehensive showcase of the DSMiniProductCard component.
///
/// Demonstrates:
/// - Price display formats (standard, sale, range, startingAt)
/// - Badge variations (sale, new, exclusive, limited, custom)
/// - Rating display with review counts
/// - Sponsored product indicator
/// - Image and placeholder states
/// - Usage examples

struct DSMiniProductCardView: View {
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
            Text("DSMiniProductCard")
                .thdFont(.h3)
                .foregroundStyle(textPrimary)

            Text("A compact product card for displaying products in carousels or grids. Features image, name, price, optional badge, and optional rating.")
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
            // Price Formats Section
            priceFormatsSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Badges Section
            badgesSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Ratings Section
            ratingsSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Sponsored Section
            sponsoredSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Carousel Example Section
            carouselExampleSection

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

    // MARK: - Price Formats Section

    private var priceFormatsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Price Formats",
                description: "Different price display formats for various scenarios."
            )

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: TokensCoreLight.Spacing3) {
                    VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                        Text("Standard")
                            .thdFont(.caption)
                            .foregroundStyle(textSecondary)

                        DSMiniProductCard(
                            data: DSMiniProductCardData(
                                productName: "DEWALT 20V MAX Drill",
                                price: .standard(dollars: 129, cents: 99)
                            )
                        )
                    }

                    VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                        Text("Sale")
                            .thdFont(.caption)
                            .foregroundStyle(textSecondary)

                        DSMiniProductCard(
                            data: DSMiniProductCardData(
                                productName: "Milwaukee M18 Impact",
                                price: .sale(dollars: 99, cents: 00, originalDollars: 149, originalCents: 99)
                            )
                        )
                    }

                    VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                        Text("Range")
                            .thdFont(.caption)
                            .foregroundStyle(textSecondary)

                        DSMiniProductCard(
                            data: DSMiniProductCardData(
                                productName: "Outdoor Planters",
                                price: .range(minDollars: 24, minCents: 99, maxDollars: 89, maxCents: 99)
                            )
                        )
                    }

                    VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                        Text("Starting At")
                            .thdFont(.caption)
                            .foregroundStyle(textSecondary)

                        DSMiniProductCard(
                            data: DSMiniProductCardData(
                                productName: "Custom Blinds",
                                price: .startingAt(dollars: 35, cents: 00)
                            )
                        )
                    }
                }
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - Badges Section

    private var badgesSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Badges",
                description: "Badge factory methods for common promotional labels."
            )

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: TokensCoreLight.Spacing3) {
                    VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                        Text(".sale()")
                            .thdFont(.caption)
                            .foregroundStyle(textSecondary)

                        DSMiniProductCard(
                            data: DSMiniProductCardData(
                                productName: "Cordless Vacuum",
                                price: .sale(dollars: 199, cents: 00, originalDollars: 299, originalCents: 00),
                                badge: .sale()
                            )
                        )
                    }

                    VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                        Text(".new()")
                            .thdFont(.caption)
                            .foregroundStyle(textSecondary)

                        DSMiniProductCard(
                            data: DSMiniProductCardData(
                                productName: "Smart Thermostat",
                                price: .standard(dollars: 249, cents: 99),
                                badge: .new()
                            )
                        )
                    }

                    VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                        Text(".exclusive()")
                            .thdFont(.caption)
                            .foregroundStyle(textSecondary)

                        DSMiniProductCard(
                            data: DSMiniProductCardData(
                                productName: "Pro Tool Set",
                                price: .standard(dollars: 599, cents: 00),
                                badge: .exclusive()
                            )
                        )
                    }

                    VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                        Text(".limited()")
                            .thdFont(.caption)
                            .foregroundStyle(textSecondary)

                        DSMiniProductCard(
                            data: DSMiniProductCardData(
                                productName: "Collector's Edition",
                                price: .standard(dollars: 899, cents: 00),
                                badge: .limited()
                            )
                        )
                    }
                }
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - Ratings Section

    private var ratingsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Ratings",
                description: "Star ratings with review counts."
            )

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: TokensCoreLight.Spacing3) {
                    VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                        Text("5 Stars")
                            .thdFont(.caption)
                            .foregroundStyle(textSecondary)

                        DSMiniProductCard(
                            data: DSMiniProductCardData(
                                productName: "Top Rated Product",
                                price: .standard(dollars: 79, cents: 99),
                                rating: DSMiniProductCardRating(rating: 5.0, reviewCount: 2345)
                            )
                        )
                    }

                    VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                        Text("4.5 Stars")
                            .thdFont(.caption)
                            .foregroundStyle(textSecondary)

                        DSMiniProductCard(
                            data: DSMiniProductCardData(
                                productName: "Highly Rated Item",
                                price: .standard(dollars: 149, cents: 00),
                                rating: DSMiniProductCardRating(rating: 4.5, reviewCount: 892)
                            )
                        )
                    }

                    VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                        Text("3.5 Stars")
                            .thdFont(.caption)
                            .foregroundStyle(textSecondary)

                        DSMiniProductCard(
                            data: DSMiniProductCardData(
                                productName: "Average Rating",
                                price: .standard(dollars: 49, cents: 99),
                                rating: DSMiniProductCardRating(rating: 3.5, reviewCount: 156)
                            )
                        )
                    }

                    VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                        Text("No Reviews")
                            .thdFont(.caption)
                            .foregroundStyle(textSecondary)

                        DSMiniProductCard(
                            data: DSMiniProductCardData(
                                productName: "New Product",
                                price: .standard(dollars: 89, cents: 00)
                            )
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
                title: "Sponsored Products",
                description: "Products with sponsored indicator overlay."
            )

            HStack(spacing: TokensCoreLight.Spacing3) {
                VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                    Text("Sponsored")
                        .thdFont(.caption)
                        .foregroundStyle(textSecondary)

                    DSMiniProductCard(
                        data: DSMiniProductCardData(
                            productName: "Featured Product",
                            price: .standard(dollars: 199, cents: 99),
                            badge: .new(),
                            rating: DSMiniProductCardRating(rating: 4.7, reviewCount: 523),
                            isSponsored: true
                        )
                    )
                }

                VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                    Text("Not Sponsored")
                        .thdFont(.caption)
                        .foregroundStyle(textSecondary)

                    DSMiniProductCard(
                        data: DSMiniProductCardData(
                            productName: "Regular Product",
                            price: .standard(dollars: 199, cents: 99),
                            badge: .new(),
                            rating: DSMiniProductCardRating(rating: 4.7, reviewCount: 523),
                            isSponsored: false
                        )
                    )
                }
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - Carousel Example Section

    private var carouselExampleSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Carousel Example",
                description: "Mini product cards in a horizontal scrolling carousel."
            )

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(sampleProducts, id: \.productName) { product in
                        DSMiniProductCard(data: product) {
                            // Tap handler
                        }
                    }
                }
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    private var sampleProducts: [DSMiniProductCardData] {
        [
            DSMiniProductCardData(
                productName: "DEWALT 20V MAX Drill/Driver Kit",
                price: .sale(dollars: 129, cents: 00, originalDollars: 179, originalCents: 00),
                badge: .sale(),
                rating: DSMiniProductCardRating(rating: 4.8, reviewCount: 3456)
            ),
            DSMiniProductCardData(
                productName: "Milwaukee M18 FUEL Impact",
                price: .standard(dollars: 199, cents: 99),
                badge: .new(),
                rating: DSMiniProductCardRating(rating: 4.9, reviewCount: 1234)
            ),
            DSMiniProductCardData(
                productName: "Makita 18V LXT Combo Kit",
                price: .standard(dollars: 449, cents: 00),
                rating: DSMiniProductCardRating(rating: 4.7, reviewCount: 892)
            ),
            DSMiniProductCardData(
                productName: "Bosch 12V Max Drill",
                price: .startingAt(dollars: 99, cents: 00),
                rating: DSMiniProductCardRating(rating: 4.5, reviewCount: 567)
            ),
            DSMiniProductCardData(
                productName: "Ryobi ONE+ 18V Kit",
                price: .range(minDollars: 149, minCents: 00, maxDollars: 299, maxCents: 00),
                badge: .exclusive(),
                rating: DSMiniProductCardRating(rating: 4.3, reviewCount: 2100)
            )
        ]
    }

    // MARK: - Usage Examples Section

    private var usageExamplesSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Usage Examples",
                description: "Real-world implementations of mini product cards."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                Text("Full Featured Card")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSMiniProductCard(
                    data: DSMiniProductCardData(
                        productName: "Premium Power Tool Bundle",
                        price: .sale(dollars: 399, cents: 00, originalDollars: 599, originalCents: 00),
                        badge: .sale(),
                        rating: DSMiniProductCardRating(rating: 4.9, reviewCount: 1567),
                        isSponsored: true
                    )
                ) {
                    // Navigate to product detail
                }

                Text("Minimal Card")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSMiniProductCard(
                    data: DSMiniProductCardData(
                        productName: "Basic Hand Tool",
                        price: .standard(dollars: 12, cents: 99)
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
                specRow(label: "Card Width", value: "140pt")
                specRow(label: "Image Height", value: "140pt")
                specRow(label: "Corner Radius", value: "8pt")
                specRow(label: "Content Padding", value: "8pt")
                specRow(label: "Star Size", value: "12pt")

                Text("Price Types")
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)
                    .padding(.top, TokensCoreLight.Spacing2)

                VStack(alignment: .leading, spacing: 4) {
                    Text("• .standard(dollars:cents:)")
                    Text("• .sale(dollars:cents:originalDollars:originalCents:)")
                    Text("• .range(minDollars:minCents:maxDollars:maxCents:)")
                    Text("• .startingAt(dollars:cents:)")
                }
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)

                Text("Badge Factory Methods")
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)
                    .padding(.top, TokensCoreLight.Spacing2)

                VStack(alignment: .leading, spacing: 4) {
                    Text("• .sale() - Red danger badge")
                    Text("• .new() - Green success badge")
                    Text("• .exclusive() - Brand colored badge")
                    Text("• .limited() - Yellow warning badge")
                }
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)

                Text("Code Example")
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)
                    .padding(.top, TokensCoreLight.Spacing2)

                Text("""
                DSMiniProductCard(
                    data: DSMiniProductCardData(
                        productImage: productImage,
                        productName: "Product Name",
                        price: .sale(
                            dollars: 99, cents: 99,
                            originalDollars: 149, originalCents: 99
                        ),
                        badge: .sale(),
                        rating: DSMiniProductCardRating(
                            rating: 4.5,
                            reviewCount: 1234
                        ),
                        isSponsored: false
                    ),
                    onTap: { print("Tapped") }
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
    DSMiniProductCardView()
}
