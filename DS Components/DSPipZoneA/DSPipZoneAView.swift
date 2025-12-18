import SwiftUI

// MARK: - DSPipZoneA Showcase View

/// Comprehensive showcase of the DSPipZoneA component
///
/// Demonstrates:
/// - Full Product Information Page (PIP) Zone A layout
/// - Breadcrumb navigation
/// - Product badges
/// - Brand and title display
/// - Star rating with Q&A links
/// - Product image carousel
/// - Pricing display
/// - Store information with stock and aisle/bay
/// - Pickup and delivery fulfillment options
/// - Delivery messaging with icons
/// - Action buttons (Add to Cart, Add to List, etc.)
/// - Dark mode support
/// - Real-world usage examples

struct DSPipZoneAView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing6) {

                // MARK: - Header Card
                VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                    Text("PIP Zone A")
                        .thdFont(.hero5)
                        .foregroundColor(textPrimary)

                    Text("Product Information Page Zone A - the primary product detail section displayed at the top of product pages. Includes navigation, product info, images, pricing, availability, and actions.")
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

                    // Full Example
                    fullExampleSection

                    Divider().padding(.vertical, TokensSpacing.Spacing2)

                    // Component Anatomy
                    anatomySection

                    Divider().padding(.vertical, TokensSpacing.Spacing2)

                    // Breadcrumbs
                    breadcrumbsSection

                    Divider().padding(.vertical, TokensSpacing.Spacing2)

                    // Badges
                    badgesSection

                    Divider().padding(.vertical, TokensSpacing.Spacing2)

                    // Ratings
                    ratingsSection

                    Divider().padding(.vertical, TokensSpacing.Spacing2)

                    // Fulfillment Options
                    fulfillmentSection

                    Divider().padding(.vertical, TokensSpacing.Spacing2)

                    // Delivery Messages
                    deliveryMessagesSection

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

    // MARK: - Full Example Section

    private var fullExampleSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Full Example",
                description: "Complete PIP Zone A with all elements"
            )

            DSPipZoneA.sample()
                .background(
                    RoundedRectangle(cornerRadius: borderRadiusLg)
                        .fill(containerGreige)
                )
                .clipShape(RoundedRectangle(cornerRadius: borderRadiusLg))
        }
    }

    // MARK: - Anatomy Section

    private var anatomySection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Component Anatomy",
                description: "The building blocks of PIP Zone A"
            )

            VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                anatomyRow("1. Breadcrumbs", description: "Navigation path showing product hierarchy")
                anatomyRow("2. Badge", description: "Optional product badge (Top Rated, Best Seller, etc.)")
                anatomyRow("3. Brand", description: "Product brand name in small text")
                anatomyRow("4. Title", description: "Product title/description in bold")
                anatomyRow("5. Rating & Q&A", description: "Star rating with count and Q&A link")
                anatomyRow("6. Image Carousel", description: "Product images with page indicators")
                anatomyRow("7. Price", description: "Product price in large bold text")
                anatomyRow("8. Store Info", description: "Stock count, store name, aisle/bay location")
                anatomyRow("9. Fulfillment Options", description: "Pickup and delivery tiles with ETA")
                anatomyRow("10. Delivery Messages", description: "Order timing, warnings, delivery info")
                anatomyRow("11. Action Buttons", description: "Add to Cart (primary), Add to List/Quote/Project")
            }
            .padding(TokensSpacing.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(containerGreige)
            )
        }
    }

    private func anatomyRow(_ title: String, description: String) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(title)
                .thdFont(.bodySm)
                .foregroundColor(textPrimary)
            Text(description)
                .thdFont(.caption)
                .foregroundColor(textTertiary)
        }
        .padding(.vertical, 4)
    }

    // MARK: - Breadcrumbs Section

    private var breadcrumbsSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Breadcrumbs",
                description: "Navigation hierarchy for product location"
            )

            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                breadcrumbExample(
                    "Standard Path",
                    breadcrumbs: ["Home", "Tools", "Hand Tools", "Hammers"]
                )

                breadcrumbExample(
                    "Deep Path",
                    breadcrumbs: ["Home", "Appliances", "Refrigerators", "French Door", "Samsung"]
                )

                breadcrumbExample(
                    "Short Path",
                    breadcrumbs: ["Home", "Paint"]
                )
            }
        }
    }

    private func breadcrumbExample(_ title: String, breadcrumbs: [String]) -> some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            Text(title)
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)

            HStack(spacing: 4) {
                ForEach(breadcrumbs.indices, id: \.self) { index in
                    Text(breadcrumbs[index])
                        .thdFont(.caption)
                        .foregroundColor(textPrimary)
                        .underline()

                    if index < breadcrumbs.count - 1 {
                        Text(">")
                            .thdFont(.caption)
                            .foregroundColor(textTertiary)
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

    // MARK: - Badges Section

    private var badgesSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Product Badges",
                description: "Optional badges for product highlights"
            )

            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                badgeExample(
                    "Top Rated",
                    description: "Products with high customer ratings",
                    badge: DSBadge(label: "Top Rated", size: .base, variant: .filledStrong, color: .brand)
                )

                badgeExample(
                    "Best Seller",
                    description: "Popular products in category",
                    badge: DSBadge(label: "Best Seller", size: .base, variant: .filledStrong, color: .success)
                )

                badgeExample(
                    "New",
                    description: "Recently added products",
                    badge: DSBadge(label: "New", size: .base, variant: .filledStrong, color: .info)
                )

                badgeExample(
                    "Sale",
                    description: "Products on sale",
                    badge: DSBadge(label: "Sale", size: .base, variant: .filledStrong, color: .danger)
                )
            }
        }
    }

    private func badgeExample(_ title: String, description: String, badge: DSBadge) -> some View {
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
                badge
                Spacer()
            }
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }

    // MARK: - Ratings Section

    private var ratingsSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Ratings & Q&A",
                description: "Product ratings and questions count"
            )

            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                ratingExample(
                    "High Rating",
                    rating: 4.8,
                    ratingCount: 1247,
                    qaCount: 52
                )

                ratingExample(
                    "Medium Rating",
                    rating: 3.5,
                    ratingCount: 89,
                    qaCount: 7
                )

                ratingExample(
                    "New Product (Few Reviews)",
                    rating: 5.0,
                    ratingCount: 3,
                    qaCount: 0
                )
            }
        }
    }

    private func ratingExample(_ title: String, rating: Double, ratingCount: Int, qaCount: Int) -> some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            Text(title)
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)

            HStack(spacing: 16) {
                // Stars
                HStack(spacing: 1) {
                    ForEach(0..<5) { index in
                        Image(systemName: rating >= Double(index + 1) ? "star.fill" : (rating > Double(index) ? "star.leadinghalf.filled" : "star"))
                            .font(.system(size: 14))
                            .foregroundColor(Color.orange)
                    }
                }

                Text("(\(ratingCount))")
                    .thdFont(.caption)
                    .foregroundColor(textPrimary)

                if qaCount > 0 {
                    Text("Q&A (\(qaCount))")
                        .thdFont(.caption)
                        .foregroundColor(textPrimary)
                        .underline()
                }
            }
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }

    // MARK: - Fulfillment Section

    private var fulfillmentSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Fulfillment Options",
                description: "Pickup and delivery availability tiles"
            )

            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                fulfillmentExample(
                    "Both Available",
                    pickup: DSPipZoneA.FulfillmentOption(eta: "Today", stock: "36 in stock", isFree: true, isSelected: true),
                    delivery: DSPipZoneA.FulfillmentOption(eta: "Tomorrow", stock: "Available", isFree: true, isSelected: false)
                )

                fulfillmentExample(
                    "Pickup Only",
                    pickup: DSPipZoneA.FulfillmentOption(eta: "Today", stock: "5 in stock", isFree: true, isSelected: true),
                    delivery: nil
                )

                fulfillmentExample(
                    "Delivery Selected",
                    pickup: DSPipZoneA.FulfillmentOption(eta: "Today", stock: "12 in stock", isFree: true, isSelected: false),
                    delivery: DSPipZoneA.FulfillmentOption(eta: "Dec 20", stock: "Ships from warehouse", isFree: false, isSelected: true)
                )
            }
        }
    }

    private func fulfillmentExample(_ title: String, pickup: DSPipZoneA.FulfillmentOption?, delivery: DSPipZoneA.FulfillmentOption?) -> some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            Text(title)
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)

            HStack(spacing: 8) {
                if let pickup = pickup {
                    fulfillmentTile("Pickup", option: pickup)
                }

                if let delivery = delivery {
                    fulfillmentTile("Delivery", option: delivery)
                }
            }
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }

    private func fulfillmentTile(_ title: String, option: DSPipZoneA.FulfillmentOption) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .thdFont(.bodySm)
                .foregroundColor(textPrimary)

            Text(option.eta)
                .thdFont(.bodySm)
                .foregroundColor(textPrimary)

            Text(option.stock)
                .thdFont(.caption)
                .foregroundColor(textTertiary)

            if option.isFree {
                Text("FREE")
                    .thdFont(.caption)
                    .foregroundColor(.green)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .stroke(
                    option.isSelected ? Color.orange : Color.gray.opacity(0.3),
                    lineWidth: option.isSelected ? 2 : 1
                )
        )
        .background(containerWhite)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }

    // MARK: - Delivery Messages Section

    private var deliveryMessagesSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Delivery Messages",
                description: "Informational messages about delivery"
            )

            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                deliveryMessageExample(
                    "Order Timing",
                    type: .orderTiming,
                    text: "Order within 6 hrs 49 mins"
                )

                deliveryMessageExample(
                    "Warning",
                    type: .warning,
                    text: "This item may be on backorder"
                )

                deliveryMessageExample(
                    "Scheduled Delivery",
                    type: .scheduledDelivery,
                    text: "Schedule your delivery in checkout"
                )
            }
        }
    }

    private func deliveryMessageExample(_ title: String, type: DSPipZoneA.DeliveryMessageType, text: String) -> some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            Text(title)
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)

            HStack(spacing: 8) {
                Image(systemName: type.iconName)
                    .font(.system(size: 14))
                    .foregroundColor(type == .warning ? .orange : textPrimary)

                Text(text)
                    .thdFont(.caption)
                    .foregroundColor(textPrimary)
            }
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
            sectionHeader("Specifications", description: "Component details and properties")

            VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                specRow("Component", value: "DSPipZoneA")
                specRow("Min iOS", value: "iOS 15.0+")
                specRow("Padding", value: "16pt all sides")
                specRow("Spacing", value: "16pt between sections")
                specRow("Image Max Height", value: "300pt")
                specRow("Price Font Size", value: "24pt bold")
                specRow("Title Font Size", value: "Body Medium bold")
                specRow("Brand Font Size", value: "Body XS")
            }
            .padding(TokensSpacing.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(containerGreige)
            )

            Text("Properties")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
                .padding(.top, TokensSpacing.Spacing2)

            propertiesTable

            Text("Code Example")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
                .padding(.top, TokensSpacing.Spacing2)

            codeExample("""
// Basic usage with sample data
DSPipZoneA.sample()

// Full customization
DSPipZoneA(
    breadcrumbs: ["Home", "Tools", "Hammers"],
    badge: DSBadge(label: "Top Rated",
                   variant: .filledStrong,
                   color: .brand),
    brand: "Husky",
    title: "16 oz. Fiberglass Claw Hammer",
    rating: 4.5,
    ratingCount: 394,
    qaCount: 7,
    productImages: [Image("hammer1")],
    currentImageIndex: 0,
    price: "$14.97",
    storeInfo: DSPipZoneA.StoreInfo(
        stockCount: 36,
        storeName: "Durham Store",
        aisle: "10",
        bay: "010"
    ),
    pickupOption: DSPipZoneA.FulfillmentOption(
        eta: "Today",
        stock: "36 in stock",
        isFree: true,
        isSelected: true
    ),
    deliveryOption: DSPipZoneA.FulfillmentOption(
        eta: "Tomorrow",
        stock: "Available",
        isFree: true,
        isSelected: false
    ),
    deliveryMessages: [
        DSPipZoneA.DeliveryMessage(
            type: .orderTiming,
            text: "Order within 6 hrs"
        )
    ],
    onAddToCart: { print("Add to cart") },
    onAddToList: { print("Add to list") }
)
""")
        }
    }

    private var propertiesTable: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing1) {
            propertyRow("breadcrumbs", type: "[String]", description: "Navigation hierarchy")
            propertyRow("badge", type: "DSBadge?", description: "Optional product badge")
            propertyRow("brand", type: "String", description: "Product brand name")
            propertyRow("title", type: "String", description: "Product title")
            propertyRow("rating", type: "Double?", description: "Star rating (0-5)")
            propertyRow("ratingCount", type: "Int?", description: "Number of ratings")
            propertyRow("qaCount", type: "Int?", description: "Q&A count")
            propertyRow("productImages", type: "[Image]", description: "Product images")
            propertyRow("price", type: "String", description: "Price display string")
            propertyRow("storeInfo", type: "StoreInfo?", description: "Store stock info")
            propertyRow("pickupOption", type: "FulfillmentOption?", description: "Pickup details")
            propertyRow("deliveryOption", type: "FulfillmentOption?", description: "Delivery details")
            propertyRow("deliveryMessages", type: "[DeliveryMessage]", description: "Info messages")
            propertyRow("onAddToCart", type: "() -> Void", description: "Cart action (required)")
            propertyRow("onAddToList", type: "(() -> Void)?", description: "List action")
            propertyRow("onAddToQuote", type: "(() -> Void)?", description: "Quote action")
            propertyRow("onAddToProject", type: "(() -> Void)?", description: "Project action")
            propertyRow("onStoreMapTap", type: "(() -> Void)?", description: "Store map action")
            propertyRow("onImageChange", type: "((Int) -> Void)?", description: "Image change callback")
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }

    private func propertyRow(_ name: String, type: String, description: String) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            HStack {
                Text(name)
                    .thdFont(.caption)
                    .foregroundColor(textPrimary)
                    .font(.system(.caption, design: .monospaced))

                Spacer()

                Text(type)
                    .thdFont(.caption)
                    .foregroundColor(Color.orange)
                    .font(.system(.caption, design: .monospaced))
            }
            Text(description)
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

    private var tokens: any DSPipZoneATokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }
}

// MARK: - Token Protocol Helper
private protocol DSPipZoneATokenSemanticProtocol {
    static var TextOnContainerColorPrimary: Color { get }
    static var TextOnContainerColorSecondary: Color { get }
    static var TextOnContainerColorTertiary: Color { get }
    static var BackgroundContainerColorWhite: Color { get }
    static var BackgroundContainerColorGreige: Color { get }
    static var BackgroundSurfaceColorGreige: Color { get }
    static var BorderRadiusLg: CGFloat { get }
    static var BorderRadiusXl: CGFloat { get }
}

extension TokensSemanticLight: DSPipZoneATokenSemanticProtocol {}
extension TokensSemanticDark: DSPipZoneATokenSemanticProtocol {}

// MARK: - Preview
#Preview {
    DSPipZoneAView()
}
