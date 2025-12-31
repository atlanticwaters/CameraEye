import SwiftUI

// MARK: - DSPIPZoneA Showcase View

/// Comprehensive showcase of the DSPIPZoneA component.
///
/// Demonstrates:
/// - Breadcrumb navigation
/// - Product image gallery
/// - Product info (brand, name, model)
/// - Badge types (specialSavings, newArrival, bestSeller, topRated)
/// - Rating and Q&A display
/// - Pricing display (standard, sale, starting at)
/// - Store info and stock status
/// - Fulfillment options (pickup, delivery)
/// - Action buttons (Add to Cart, Buy Now, Favorite, Share)
/// - Interactive example
/// - Usage examples

struct DSPipZoneAView: View {
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
            Text("DSPIPZoneA")
                .thdFont(.h3)
                .foregroundStyle(textPrimary)

            Text("The main product information page (PIP) Zone A component. Displays primary product information including images, pricing, ratings, stock status, and fulfillment options.")
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
            // Breadcrumbs Section
            breadcrumbsSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Product Info Section
            productInfoSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Badge Types Section
            badgeTypesSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Pricing Section
            pricingSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Store Info Section
            storeInfoSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Fulfillment Section
            fulfillmentSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Action Buttons Section
            actionButtonsSection

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

    // MARK: - Breadcrumbs Section

    private var breadcrumbsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Breadcrumb Navigation",
                description: "Hierarchical navigation path to the product."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                breadcrumbPreview(crumbs: ["Tools", "Power Tools", "Drills"])
                breadcrumbPreview(crumbs: ["Appliances", "Refrigerators", "French Door"])
                breadcrumbPreview(crumbs: ["Home"])
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    @ViewBuilder
    private func breadcrumbPreview(crumbs: [String]) -> some View {
        HStack(spacing: TokensCoreLight.Spacing1) {
            ForEach(crumbs.enumerated(), id: \.element) { index, crumb in
                if index > 0 {
                    Image(systemName: "chevron.right")
                        .thdFont(.caption)
                        .foregroundStyle(textSecondary)
                }

                Text(crumb)
                    .thdFont(.caption)
                    .foregroundStyle(index == crumbs.count - 1 ? textPrimary : Color.blue)
            }
        }
        .padding(TokensCoreLight.Spacing2)
        .background(surfaceGreige)
        .clipShape(.rect(cornerRadius: TokensCoreLight.Spacing1))
    }

    // MARK: - Product Info Section

    private var productInfoSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Product Information",
                description: "Brand, product name, and model number."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                    Text("DEWALT")
                        .thdFont(.bodySm)
                        .bold()
                        .foregroundStyle(Color.blue)

                    Text("20V MAX Cordless Drill/Driver Kit with Battery")
                        .thdFont(.bodyLg)
                        .bold()
                        .foregroundStyle(textPrimary)
                        .lineLimit(3)

                    Text("Model# DCD771C2")
                        .thdFont(.caption)
                        .foregroundStyle(textSecondary)
                }
                .padding(TokensCoreLight.Spacing3)
                .background(surfaceGreige)
                .clipShape(.rect(cornerRadius: TokensCoreLight.Spacing2))
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - Badge Types Section

    private var badgeTypesSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Badge Types",
                description: "Product badges with factory methods."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                HStack(spacing: TokensCoreLight.Spacing2) {
                    badgePreview(text: "Special Savings", icon: "tag.fill", color: .orange)
                    badgePreview(text: "New Arrival", icon: "sparkles", color: .blue)
                }

                HStack(spacing: TokensCoreLight.Spacing2) {
                    badgePreview(text: "Best Seller", icon: "flame.fill", color: .red)
                    badgePreview(text: "Top Rated", icon: "star.fill", color: .green)
                }
            }

            Text("Factory Methods")
                .thdFont(.caption)
                .foregroundStyle(textSecondary)

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                Text("• .specialSavings()")
                Text("• .newArrival()")
                Text("• .bestSeller()")
                Text("• .topRated()")
            }
            .thdFont(.bodySm)
            .foregroundStyle(textSecondary)
        }
        .padding(TokensCoreLight.Spacing4)
    }

    @ViewBuilder
    private func badgePreview(text: String, icon: String, color: Color) -> some View {
        HStack(spacing: TokensCoreLight.Spacing1) {
            Image(systemName: icon)
                .thdFont(.caption)

            Text(text)
                .thdFont(.caption)
                .bold()
        }
        .foregroundStyle(neutralsWhite)
        .padding(.horizontal, TokensCoreLight.Spacing2)
        .padding(.vertical, TokensCoreLight.Spacing1)
        .background(color)
        .clipShape(.rect(cornerRadius: TokensCoreLight.Spacing1))
    }

    // MARK: - Pricing Section

    private var pricingSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Pricing Display",
                description: "Various pricing configurations."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
                Text("Standard Price")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                pricingPreview(
                    currentPrice: 149.00,
                    originalPrice: nil,
                    savings: nil,
                    isStartingAt: false
                )

                Text("Sale Price")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                pricingPreview(
                    currentPrice: 149.00,
                    originalPrice: 179.00,
                    savings: "Save $30",
                    isStartingAt: false
                )

                Text("Starting At")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                pricingPreview(
                    currentPrice: 99.00,
                    originalPrice: nil,
                    savings: nil,
                    isStartingAt: true
                )
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    @ViewBuilder
    private func pricingPreview(currentPrice: Double, originalPrice: Double?, savings: String?, isStartingAt: Bool) -> some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            if isStartingAt {
                Text("Starting at")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)
            }

            HStack(alignment: .firstTextBaseline, spacing: TokensCoreLight.Spacing2px) {
                Text("$")
                    .thdFont(.bodyMd)
                    .bold()
                    .foregroundStyle(textPrimary)

                Text("\(Int(currentPrice))")
                    .thdFont(.hero3)
                    .foregroundStyle(textPrimary)

                Text(currentPrice.truncatingRemainder(dividingBy: 1), format: .number.precision(.fractionLength(2)).sign(strategy: .never))
                    .thdFont(.bodyMd)
                    .bold()
                    .foregroundStyle(textPrimary)
            }

            if let original = originalPrice {
                HStack(spacing: TokensCoreLight.Spacing2) {
                    Text("Was $\(original, format: .number.precision(.fractionLength(2)))")
                        .thdFont(.bodySm)
                        .strikethrough()
                        .foregroundStyle(textSecondary)

                    if let savingsText = savings {
                        Text(savingsText)
                            .thdFont(.bodySm)
                            .bold()
                            .foregroundStyle(Color.green)
                    }
                }
            }
        }
        .padding(TokensCoreLight.Spacing3)
        .background(surfaceGreige)
        .clipShape(.rect(cornerRadius: TokensCoreLight.Spacing2))
    }

    // MARK: - Store Info Section

    private var storeInfoSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Store Information",
                description: "Stock status and aisle location."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                storeInfoPreview(status: "12 in stock", statusColor: .green, aisle: "Aisle 10, Bay 003")
                storeInfoPreview(status: "Limited Stock", statusColor: .orange, aisle: "Aisle 5, Bay 001")
                storeInfoPreview(status: "Out of Stock", statusColor: .red, aisle: nil)
                storeInfoPreview(status: "Check Nearby Stores", statusColor: .red, aisle: nil)
            }

            Text("Stock Status Types")
                .thdFont(.caption)
                .foregroundStyle(textSecondary)

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                Text("• .inStock(quantity: Int?)")
                Text("• .limitedStock")
                Text("• .outOfStock")
                Text("• .checkNearbyStores")
            }
            .thdFont(.bodySm)
            .foregroundStyle(textSecondary)
        }
        .padding(TokensCoreLight.Spacing4)
    }

    @ViewBuilder
    private func storeInfoPreview(status: String, statusColor: Color, aisle: String?) -> some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            HStack {
                HStack(spacing: TokensCoreLight.Spacing1) {
                    Circle()
                        .fill(statusColor)
                        .frame(width: TokensCoreLight.Spacing2, height: TokensCoreLight.Spacing2)

                    Text(status)
                        .thdFont(.bodySm)
                        .bold()
                        .foregroundStyle(statusColor)
                }

                Spacer()

                if aisle != nil {
                    HStack(spacing: TokensCoreLight.Spacing1) {
                        Image(systemName: "map")
                            .thdFont(.bodySm)
                        Text("Store Map")
                            .thdFont(.bodySm)
                    }
                    .foregroundStyle(Color.blue)
                }
            }

            if let aisleText = aisle {
                Text(aisleText)
                    .thdFont(.bodySm)
                    .foregroundStyle(textSecondary)
            }
        }
        .padding(TokensCoreLight.Spacing3)
        .background(surfaceGreige)
        .clipShape(.rect(cornerRadius: TokensCoreLight.Spacing2))
    }

    // MARK: - Fulfillment Section

    private var fulfillmentSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Fulfillment Options",
                description: "Pickup and delivery tiles."
            )

            HStack(spacing: TokensCoreLight.Spacing3) {
                fulfillmentTilePreview(
                    icon: "bag",
                    title: "Pickup",
                    subtitle: "Today",
                    location: "Midtown Atlanta",
                    isAvailable: true
                )

                fulfillmentTilePreview(
                    icon: "shippingbox",
                    title: "Delivery",
                    subtitle: "Tomorrow",
                    location: "30308",
                    isAvailable: true
                )
            }

            Text("Unavailable State")
                .thdFont(.caption)
                .foregroundStyle(textSecondary)

            HStack(spacing: TokensCoreLight.Spacing3) {
                fulfillmentTilePreview(
                    icon: "bag",
                    title: "Pickup",
                    subtitle: "Not Available",
                    location: nil,
                    isAvailable: false
                )

                fulfillmentTilePreview(
                    icon: "shippingbox",
                    title: "Delivery",
                    subtitle: "Check availability",
                    location: nil,
                    isAvailable: true
                )
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    @ViewBuilder
    private func fulfillmentTilePreview(icon: String, title: String, subtitle: String, location: String?, isAvailable: Bool) -> some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            HStack(spacing: TokensCoreLight.Spacing2) {
                Image(systemName: icon)
                    .thdFont(.bodyLg)
                    .foregroundStyle(isAvailable ? brandColor : textInactive)

                Text(title)
                    .thdFont(.bodySm)
                    .bold()
                    .foregroundStyle(textPrimary)
            }

            Text(subtitle)
                .thdFont(.caption)
                .foregroundStyle(isAvailable ? textSecondary : textInactive)

            if let loc = location {
                Text(loc)
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)
                    .lineLimit(1)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(TokensCoreLight.Spacing3)
        .background(surfaceGreige)
        .clipShape(.rect(cornerRadius: TokensCoreLight.Spacing2))
        .overlay(
            RoundedRectangle(cornerRadius: TokensCoreLight.Spacing2)
                .stroke(borderDefault, lineWidth: 1)
        )
    }

    // MARK: - Action Buttons Section

    private var actionButtonsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Action Buttons",
                description: "Primary and secondary actions."
            )

            VStack(spacing: TokensCoreLight.Spacing3) {
                // Add to Cart
                DSButton(
                    "Add to Cart",
                    style: .orangeFilled,
                    size: .large,
                    leadingIcon: Image(systemName: "cart.badge.plus")
                ) {}

                // Secondary Actions
                HStack(spacing: TokensCoreLight.Spacing3) {
                    DSButton(
                        "Buy Now",
                        style: .outlined,
                        size: .medium
                    ) {}
                    .frame(maxWidth: .infinity)

                    DSIconButton(
                        systemName: "heart",
                        style: .outlined,
                        size: .medium,
                        accessibilityLabel: "Add to favorites"
                    ) {}

                    DSIconButton(
                        systemName: "square.and.arrow.up",
                        style: .outlined,
                        size: .medium,
                        accessibilityLabel: "Share product"
                    ) {}
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
                description: "Complete Zone A with all elements."
            )

            DSPipZoneAInteractiveExample()
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
                specRow(label: "Image Height", value: "300pt")
                specRow(label: "Content Padding", value: "16pt")
                specRow(label: "Button Height", value: "44-50pt")
                specRow(label: "Corner Radius", value: "8pt")

                Text("Data Models")
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)
                    .padding(.top, TokensCoreLight.Spacing2)

                VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                    Text("• DSPIPProductInfo - Product details")
                    Text("• DSPIPBadge - Badge configuration")
                    Text("• DSPIPRatingInfo - Ratings and Q&A")
                    Text("• DSPIPPricingInfo - Price display")
                    Text("• DSPIPStoreInfo - Stock and location")
                    Text("• DSPIPFulfillmentInfo - Pickup/delivery")
                }
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)

                Text("Callbacks")
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)
                    .padding(.top, TokensCoreLight.Spacing2)

                VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                    Text("• onAddToCart, onBuyNow")
                    Text("• onFavorite, onShare")
                    Text("• onRatingsTap, onQuestionsTap")
                    Text("• onBreadcrumbTap(index:)")
                    Text("• onPickupTap, onDeliveryTap")
                    Text("• onStoreMapTap")
                }
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)

                Text("Code Example")
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)
                    .padding(.top, TokensCoreLight.Spacing2)

                Text("""
                DSPIPZoneA(
                    breadcrumbs: ["Tools", "Power Tools", "Drills"],
                    productInfo: DSPIPProductInfo(
                        brand: "DEWALT",
                        productName: "20V MAX Cordless Drill/Driver Kit",
                        modelNumber: "DCD771C2",
                        badge: .bestSeller()
                    ),
                    images: productImages,
                    ratingInfo: DSPIPRatingInfo(
                        rating: 4.5,
                        reviewCount: 1234,
                        questionCount: 56
                    ),
                    pricingInfo: DSPIPPricingInfo(
                        currentPrice: 149.00,
                        originalPrice: 179.00,
                        savingsText: "Save $30"
                    ),
                    storeInfo: DSPIPStoreInfo(
                        stockStatus: .inStock(quantity: 12),
                        aisleLocation: "Aisle 10, Bay 003"
                    ),
                    fulfillmentInfo: DSPIPFulfillmentInfo(
                        pickupDate: "Today",
                        pickupLocation: "Midtown Atlanta",
                        deliveryDate: "Tomorrow"
                    ),
                    onAddToCart: { print("Add to Cart") },
                    onBuyNow: { print("Buy Now") }
                )
                """)
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
                .padding(TokensCoreLight.Spacing3)
                .background(surfaceGreige)
                .clipShape(.rect(cornerRadius: TokensCoreLight.Spacing2))
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
    private var textInactive: Color { tokens.TextOnContainerColorInactive }
    private var borderDefault: Color { tokens.BorderOnContainerDefault }
    private var brandColor: Color { tokens.Brand400 }
    private var neutralsWhite: Color { tokens.NeutralsWhite }
}

// MARK: - Interactive Example

private struct DSPipZoneAInteractiveExample: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var lastAction: String = "Interact with the product page..."

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            // Status Display
            Text("Last Action: \(lastAction)")
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
                .padding(TokensCoreLight.Spacing2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(surfaceGreige)
                .clipShape(.rect(cornerRadius: TokensCoreLight.Spacing2))

            // Zone A Component
            DSPIPZoneA(
                breadcrumbs: ["Tools", "Power Tools", "Drills"],
                productInfo: DSPIPProductInfo(
                    brand: "DEWALT",
                    productName: "20V MAX Cordless Drill/Driver Kit with Battery",
                    modelNumber: "DCD771C2",
                    badge: .bestSeller()
                ),
                ratingInfo: DSPIPRatingInfo(rating: 4.5, reviewCount: 1234, questionCount: 56),
                pricingInfo: DSPIPPricingInfo(
                    currentPrice: 149.00,
                    originalPrice: 179.00,
                    savingsText: "Save $30",
                    pricingBadge: "Pro Xtra Member Price"
                ),
                storeInfo: DSPIPStoreInfo(
                    stockStatus: .inStock(quantity: 12),
                    aisleLocation: "Aisle 10, Bay 003"
                ),
                fulfillmentInfo: DSPIPFulfillmentInfo(
                    pickupDate: "Today",
                    pickupLocation: "Midtown Atlanta",
                    deliveryDate: "Tomorrow",
                    deliveryLocation: "30308"
                ),
                onAddToCart: { lastAction = "Add to Cart tapped" },
                onBuyNow: { lastAction = "Buy Now tapped" },
                onFavorite: { lastAction = "Favorite tapped" },
                onShare: { lastAction = "Share tapped" },
                onRatingsTap: { lastAction = "Ratings tapped" },
                onQuestionsTap: { lastAction = "Questions tapped" },
                onBreadcrumbTap: { index in lastAction = "Breadcrumb \(index) tapped" },
                onPickupTap: { lastAction = "Pickup tapped" },
                onDeliveryTap: { lastAction = "Delivery tapped" },
                onStoreMapTap: { lastAction = "Store Map tapped" }
            )
            .clipShape(.rect(cornerRadius: TokensCoreLight.Spacing2))
            .overlay(
                RoundedRectangle(cornerRadius: TokensCoreLight.Spacing2)
                    .stroke(tokens.BorderOnContainerDefault, lineWidth: 1)
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
    static var TextOnContainerColorInactive: Color { get }
    static var BackgroundContainerColorWhite: Color { get }
    static var BackgroundSurfaceColorGreige: Color { get }
    static var BorderOnContainerDefault: Color { get }
    static var Brand400: Color { get }
    static var NeutralsWhite: Color { get }
}

extension TokensSemanticLight: TokenSemanticProtocol {}
extension TokensSemanticDark: TokenSemanticProtocol {}

// MARK: - Preview

#Preview {
    DSPipZoneAView()
}
