import SwiftUI

// MARK: - DSFeatureCard Showcase View

/// Comprehensive showcase of the DSFeatureCard component.
///
/// Demonstrates:
/// - 8 card type variants (icon/non-icon, half/double/full/doubleContent)
/// - Single feature configurations
/// - Multiple feature configurations
/// - Custom content slots
/// - Factory methods
/// - Usage examples

struct DSFeatureCardView: View {
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
            Text("DSFeatureCard")
                .thdFont(.h3)
                .foregroundStyle(textPrimary)

            Text("A feature card component for displaying product features and highlights. Supports single features, double features, and full-width layouts with optional icons.")
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
            // Icon Variants Section
            iconVariantsSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Non-Icon Variants Section
            nonIconVariantsSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Double Features Section
            doubleFeaturesSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Custom Content Section
            customContentSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Factory Methods Section
            factoryMethodsSection

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

    // MARK: - Icon Variants Section

    private var iconVariantsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Icon Variants",
                description: "Feature cards with leading icons."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                Text(".iconHalf")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSFeatureCard(
                    feature: DSFeatureItem(
                        title: "Fast Delivery",
                        description: "Free 2-day shipping on orders over $35",
                        icon: Image(systemName: "shippingbox.fill")
                    ),
                    type: .iconHalf
                )

                Text(".iconFull")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSFeatureCard(
                    feature: DSFeatureItem(
                        title: "Professional Installation Available",
                        description: "Let our experts handle the installation. Schedule a convenient time and we'll take care of everything.",
                        icon: Image(systemName: "wrench.and.screwdriver.fill")
                    ),
                    type: .iconFull
                )
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - Non-Icon Variants Section

    private var nonIconVariantsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Non-Icon Variants",
                description: "Feature cards without icons."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                Text(".half")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSFeatureCard(
                    feature: DSFeatureItem(
                        title: "30-Day Returns",
                        description: "Not satisfied? Return within 30 days."
                    ),
                    type: .half
                )

                Text(".full")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSFeatureCard(
                    feature: DSFeatureItem(
                        title: "Price Match Guarantee",
                        description: "Found a lower price? We'll match it. Our price match policy ensures you always get the best deal on all qualifying items."
                    ),
                    type: .full
                )
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - Double Features Section

    private var doubleFeaturesSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Double Features",
                description: "Side-by-side feature display."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                Text(".iconDouble")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSFeatureCard(
                    features: [
                        DSFeatureItem(
                            title: "In-Store Pickup",
                            description: "Ready in 2 hours",
                            icon: Image(systemName: "building.2.fill")
                        ),
                        DSFeatureItem(
                            title: "Same Day Delivery",
                            description: "Order by 2pm",
                            icon: Image(systemName: "clock.fill")
                        )
                    ],
                    type: .iconDouble
                )

                Text(".double")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSFeatureCard(
                    features: [
                        DSFeatureItem(
                            title: "Easy Assembly",
                            description: "Simple instructions included"
                        ),
                        DSFeatureItem(
                            title: "Tool Rental",
                            description: "Rent the tools you need"
                        )
                    ],
                    type: .double
                )
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - Custom Content Section

    private var customContentSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Custom Content",
                description: "Feature cards with custom view content."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                Text(".iconDoubleContent")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSFeatureCard(
                    type: .iconDoubleContent,
                    contentA: {
                        VStack(alignment: .leading, spacing: 4) {
                            HStack(spacing: 8) {
                                Image(systemName: "star.fill")
                                    .foregroundStyle(Color.yellow)
                                Text("4.8 Rating")
                                    .thdFont(.bodySm)
                            }
                            Text("Based on 2,345 reviews")
                                .thdFont(.bodySm)
                                .foregroundStyle(textSecondary)
                        }
                    },
                    contentB: {
                        VStack(alignment: .leading, spacing: 4) {
                            HStack(spacing: 8) {
                                Image(systemName: "heart.fill")
                                    .foregroundStyle(Color.red)
                                Text("Bestseller")
                                    .thdFont(.bodySm)
                            }
                            Text("#1 in Power Tools")
                                .thdFont(.bodySm)
                                .foregroundStyle(textSecondary)
                        }
                    }
                )

                Text(".doubleContent")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSFeatureCard(
                    type: .doubleContent,
                    contentA: {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Ships From")
                                .thdFont(.caption)
                                .foregroundStyle(textSecondary)
                            Text("Atlanta, GA")
                                .thdFont(.bodySm)
                        }
                    },
                    contentB: {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Estimated Arrival")
                                .thdFont(.caption)
                                .foregroundStyle(textSecondary)
                            Text("Dec 28 - Jan 2")
                                .thdFont(.bodySm)
                        }
                    }
                )
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - Factory Methods Section

    private var factoryMethodsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Factory Methods",
                description: "Convenient factory methods for common use cases."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                Text(".icon()")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSFeatureCard.icon(
                    title: "Warranty Included",
                    description: "2-year manufacturer warranty",
                    icon: Image(systemName: "checkmark.shield.fill")
                )

                Text(".simple()")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSFeatureCard.simple(
                    title: "Satisfaction Guaranteed",
                    description: "We stand behind every product we sell"
                )
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - Usage Examples Section

    private var usageExamplesSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Usage Examples",
                description: "Real-world feature card implementations."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                Text("Product Page Features")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                VStack(spacing: 8) {
                    DSFeatureCard.icon(
                        title: "Free Shipping",
                        description: "On orders $45+",
                        icon: Image(systemName: "truck.box.fill")
                    )

                    DSFeatureCard(
                        features: [
                            DSFeatureItem(
                                title: "Store Pickup",
                                description: "Usually ready in 2 hours",
                                icon: Image(systemName: "storefront.fill")
                            ),
                            DSFeatureItem(
                                title: "Curbside",
                                description: "Free & contactless",
                                icon: Image(systemName: "car.fill")
                            )
                        ],
                        type: .iconDouble
                    )
                }

                Text("Service Highlights")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                VStack(spacing: 8) {
                    DSFeatureCard(
                        features: [
                            DSFeatureItem(
                                title: "Expert Advice",
                                description: "Talk to our specialists",
                                icon: Image(systemName: "person.fill.questionmark")
                            ),
                            DSFeatureItem(
                                title: "Installation",
                                description: "Professional service",
                                icon: Image(systemName: "hammer.fill")
                            )
                        ],
                        type: .iconDouble
                    )

                    DSFeatureCard(
                        feature: DSFeatureItem(
                            title: "Need Help Deciding?",
                            description: "Our project calculators and buying guides help you choose the right products for your needs.",
                            icon: Image(systemName: "questionmark.circle.fill")
                        ),
                        type: .iconFull
                    )
                }

                Text("Promotional Features")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSFeatureCard(
                    features: [
                        DSFeatureItem(
                            title: "Pro Xtra Members",
                            description: "Save an extra 10%",
                            icon: Image(systemName: "person.badge.key.fill")
                        ),
                        DSFeatureItem(
                            title: "Credit Card Offer",
                            description: "0% APR for 24 months",
                            icon: Image(systemName: "creditcard.fill")
                        )
                    ],
                    type: .iconDouble
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
                specRow(label: "Corner Radius", value: "8pt")
                specRow(label: "Padding", value: "16pt")
                specRow(label: "Icon Size", value: "20pt")
                specRow(label: "Spacing", value: "8pt")
                specRow(label: "Title Font", value: "14pt semibold")
                specRow(label: "Description Font", value: "12pt regular")

                Text("Card Types")
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)
                    .padding(.top, TokensCoreLight.Spacing2)

                VStack(alignment: .leading, spacing: 4) {
                    ForEach(DSFeatureCardType.allCases, id: \.self) { type in
                        HStack {
                            Text("•")
                            Text(typeName(type))
                                .thdFont(.bodySm)
                        }
                        .foregroundStyle(textSecondary)
                    }
                }

                Text("Code Example")
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)
                    .padding(.top, TokensCoreLight.Spacing2)

                Text("""
                // Single feature with icon
                DSFeatureCard(
                    feature: DSFeatureItem(
                        title: "Feature Title",
                        description: "Feature description",
                        icon: Image(systemName: "star.fill")
                    ),
                    type: .iconHalf
                )

                // Multiple features
                DSFeatureCard(
                    features: [
                        DSFeatureItem(title: "Feature 1", icon: icon1),
                        DSFeatureItem(title: "Feature 2", icon: icon2)
                    ],
                    type: .iconDouble
                )

                // Factory methods
                DSFeatureCard.icon(title: "Title", description: "Desc")
                DSFeatureCard.simple(title: "Title")
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

    private func typeName(_ type: DSFeatureCardType) -> String {
        switch type {
        case .iconHalf: return ".iconHalf"
        case .iconDouble: return ".iconDouble"
        case .iconFull: return ".iconFull"
        case .iconDoubleContent: return ".iconDoubleContent"
        case .half: return ".half"
        case .double: return ".double"
        case .full: return ".full"
        case .doubleContent: return ".doubleContent"
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
    DSFeatureCardView()
}
