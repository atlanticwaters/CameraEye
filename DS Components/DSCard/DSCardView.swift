import SwiftUI

// MARK: - DSCard Showcase View

/// Comprehensive showcase of DSCard components
///
/// Demonstrates:
/// - DSContentCard with all body placement options
/// - DSMiniProductCard in horizontal and vertical orientations
/// - All card features (title actions, ratings, fulfillment, badges)
/// - Interactive examples
/// - Dark mode support
/// - Real-world usage examples

struct DSCardView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing6) {
                
                // MARK: - Header Card
                VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                    Text("Cards")
                        .thdFont(.hero5)
                        .foregroundColor(textPrimary)

                    Text("Flexible card containers for displaying content and product information. Includes content cards with customizable layouts and mini product cards in horizontal/vertical orientations.")
                        .thdFont(.bodyMd)
                        .foregroundColor(textSecondary)
                }
                .padding(TokensSpacing.Spacing4)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: borderRadiusXl)
                        .fill(containerWhite)
                )
                
                // MARK: - Content Card Section
                VStack(alignment: .leading, spacing: TokensSpacing.Spacing6) {
                    contentCardSection
                    
                    Divider().padding(.vertical, TokensSpacing.Spacing2)
                    
                    miniProductCardSection
                    
                    Divider().padding(.vertical, TokensSpacing.Spacing2)
                    
                    cardFeaturesSection
                    
                    Divider().padding(.vertical, TokensSpacing.Spacing2)
                    
                    interactiveSection
                    
                    Divider().padding(.vertical, TokensSpacing.Spacing2)
                    
                    usageExamplesSection
                    
                    Divider().padding(.vertical, TokensSpacing.Spacing2)
                    
                    specificationsSection
                }
                .padding(TokensSpacing.Spacing4)
                .background(
                    RoundedRectangle(cornerRadius: borderRadiusXl)
                        .fill(containerWhite)
                )
            }
            .padding(TokensSpacing.Spacing4)
            .padding(.top, 96)
            .padding(.bottom, 80)
        }
        .scrollEdgeEffectStyle(.soft, for: .vertical)
        .background(surfaceGreige)
    }
    
    // MARK: - Content Card Section
    
    private var contentCardSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Content Cards",
                description: "Flexible cards with title, subtitle, body content, and action button"
            )
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                bodyPlacementExample(
                    "Second with Padding (Default)",
                    description: "Body content after title with horizontal padding",
                    placement: .secondWithPadding
                )
                
                bodyPlacementExample(
                    "First with Padding",
                    description: "Body content before title with horizontal padding",
                    placement: .firstWithPadding
                )
                
                bodyPlacementExample(
                    "First Full Bleed",
                    description: "Body content first, edge-to-edge",
                    placement: .firstFullBleed
                )
                
                bodyPlacementExample(
                    "Second Full Bleed",
                    description: "Body content last, edge-to-edge",
                    placement: .secondFullBleed
                )
            }
        }
    }
    
    private func bodyPlacementExample(_ title: String, description: String, placement: DSContentCard.BodyPlacement) -> some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing1) {
                Text(title)
                    .thdFont(.bodySm)
                    .foregroundColor(textPrimary)
                
                Text(description)
                    .thdFont(.caption)
                    .foregroundColor(textTertiary)
            }
            
            DSContentCard(
                title: "Card Title",
                subtitle: "Subtitle text",
                bodyPlacement: placement,
                buttonText: "Action Button",
                onButtonTap: {
                    print("\(title) button tapped")
                }
            ) {
                AnyView(sampleBodyContent)
            }
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }
    
    private var sampleBodyContent: some View {
        HStack(spacing: 12) {
            Image(systemName: "photo")
                .font(.system(size: 40))
                .foregroundColor(.gray)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Body Content")
                    .font(.system(size: 14, weight: .semibold))
                Text("This is sample body content for the card")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    // MARK: - Mini Product Card Section
    
    private var miniProductCardSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Mini Product Cards",
                description: "Compact product cards with horizontal or vertical orientation"
            )
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                orientationExample(
                    "Horizontal Orientation",
                    description: "Product image and details side-by-side",
                    orientation: .horizontal
                )
                
                orientationExample(
                    "Vertical Orientation",
                    description: "Product details stacked above image",
                    orientation: .vertical
                )
            }
        }
    }
    
    private func orientationExample(_ title: String, description: String, orientation: DSMiniProductCard.Orientation) -> some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing1) {
                Text(title)
                    .thdFont(.bodySm)
                    .foregroundColor(textPrimary)
                
                Text(description)
                    .thdFont(.caption)
                    .foregroundColor(textTertiary)
            }
            
            DSMiniProductCard(
                orientation: orientation,
                sku: "SKU #1003274867",
                brandName: "BrandName",
                productName: "#9 x 3 in. Tan Star Flat-Head Wood Deck Screw (1 lb. / 73-Piece)",
                price: "$10.97",
                onButtonTap: {
                    print("\(title) button tapped")
                }
            )
            .frame(width: orientation == .horizontal ? nil : 180)
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }
    
    // MARK: - Card Features Section
    
    private var cardFeaturesSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Card Features",
                description: "Additional functionality and customization options"
            )
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                featureExample(
                    "Title Action",
                    description: "Content cards with tappable more button"
                ) {
                    DSContentCard(
                        title: "Card with Action",
                        subtitle: "Tap the ellipsis button",
                        buttonText: "Primary Action",
                        onTitleAction: {
                            print("More action tapped")
                        },
                        onButtonTap: {
                            print("Primary action tapped")
                        }
                    ) {
                        AnyView(sampleBodyContent)
                    }
                }
                
                featureExample(
                    "Product Rating",
                    description: "Mini product cards with star ratings"
                ) {
                    DSMiniProductCard(
                        orientation: .horizontal,
                        sku: "SKU #1003274867",
                        brandName: "BrandName",
                        productName: "#9 x 3 in. Tan Star Flat-Head Wood Deck Screw",
                        showRating: true,
                        rating: 4.5,
                        price: "$10.97",
                        onButtonTap: {}
                    )
                }
                
                featureExample(
                    "Fulfillment Info",
                    description: "Display pickup and delivery information"
                ) {
                    DSMiniProductCard(
                        orientation: .horizontal,
                        sku: "SKU #1003274867",
                        brandName: "BrandName",
                        productName: "#9 x 3 in. Tan Star Flat-Head Wood Deck Screw",
                        showRating: true,
                        rating: 5.0,
                        showFulfillment: true,
                        pickupInfo: "Pickup: 2,243 in stock at Midtown",
                        deliveryInfo: "Delivery: Free Tomorrow",
                        price: "$10.97",
                        onButtonTap: {}
                    )
                }
                
                featureExample(
                    "Badge and More Action",
                    description: "Product cards with badge labels and more options"
                ) {
                    DSMiniProductCard(
                        orientation: .horizontal,
                        sku: "SKU #1003274867",
                        brandName: "BrandName",
                        productName: "#9 x 3 in. Tan Star Flat-Head Wood Deck Screw",
                        price: "$10.97",
                        showBadge: true,
                        badgeText: "Sale",
                        onButtonTap: {},
                        onMoreAction: {
                            print("More options tapped")
                        }
                    )
                }
            }
        }
    }
    
    private func featureExample<Content: View>(
        _ title: String,
        description: String,
        @ViewBuilder content: () -> Content
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
            
            content()
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }
    
    // MARK: - Interactive Section
    
    private var interactiveSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader("Interactive Examples", description: "Try the cards")
            
            VStack(spacing: TokensSpacing.Spacing4) {
                InteractiveContentCardExample()
                
                InteractiveMiniProductCardExample()
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
            sectionHeader("Usage Examples", description: "Real-world card implementations")
            
            Text("Promotional Content")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
            
            promotionalCardExample
            
            Text("Product Grid")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
                .padding(.top, TokensSpacing.Spacing2)
            
            productGridExample
            
            Text("Featured Product")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
                .padding(.top, TokensSpacing.Spacing2)
            
            featuredProductExample
        }
    }
    
    private var promotionalCardExample: some View {
        DSContentCard(
            title: "Winter Sale",
            subtitle: "Save up to 40% on select items",
            buttonText: "Shop Now",
            onButtonTap: {
                print("Shop now tapped")
            }
        ) {
            AnyView(
                VStack(spacing: 12) {
                    Image(systemName: "snowflake")
                        .font(.system(size: 60))
                        .foregroundColor(.blue.opacity(0.6))
                    
                    Text("Limited Time Offer")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.primary)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 32)
            )
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerWhite)
        )
    }
    
    private var productGridExample: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                DSMiniProductCard.vertical(
                    productName: "Power Drill",
                    price: "$79.99",
                    brandName: "DeWalt",
                    sku: "SKU #1234567",
                    onButtonTap: { print("Product 1") }
                )
                .frame(width: 150)
                
                DSMiniProductCard.vertical(
                    productName: "Circular Saw",
                    price: "$129.99",
                    brandName: "Makita",
                    sku: "SKU #2345678",
                    onButtonTap: { print("Product 2") }
                )
                .frame(width: 150)
                
                DSMiniProductCard.vertical(
                    productName: "Impact Driver",
                    price: "$89.99",
                    brandName: "Milwaukee",
                    sku: "SKU #3456789",
                    onButtonTap: { print("Product 3") }
                )
                .frame(width: 150)
            }
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerWhite)
        )
    }
    
    private var featuredProductExample: some View {
        DSMiniProductCard(
            orientation: .horizontal,
            sku: "SKU #9876543",
            brandName: "Pro Series",
            productName: "18V Lithium-Ion Cordless Combo Kit (5-Tool)",
            showRating: true,
            rating: 5.0,
            showFulfillment: true,
            pickupInfo: "Pickup: In stock at your store",
            deliveryInfo: "Delivery: Free next day",
            price: "$299.99",
            buttonText: "Add to Cart",
            showBadge: true,
            badgeText: "Best Seller",
            onButtonTap: {
                print("Add to cart tapped")
            },
            onMoreAction: {
                print("More options tapped")
            }
        )
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
            
            Text("Content Card")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                specRow("Component", value: "DSContentCard")
                specRow("Corner Radius", value: "16pt (3xl)")
                specRow("Vertical Padding", value: "20pt (varies by placement)")
                specRow("Horizontal Padding", value: "20pt (title), 16pt (body)")
                specRow("Body Placements", value: "4 options")
                specRow("Title Font", value: "SF Pro Display, 18pt, Semibold")
                specRow("Subtitle Font", value: "THD Sm Beta, 14pt")
            }
            .padding(TokensSpacing.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(containerGreige)
            )
            
            Text("Mini Product Card")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
                .padding(.top, TokensSpacing.Spacing2)
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                specRow("Component", value: "DSMiniProductCard")
                specRow("Orientations", value: "Horizontal, Vertical")
                specRow("Corner Radius", value: "16pt (3xl)")
                specRow("Image Size", value: "100x100pt")
                specRow("Rating Stars", value: "5 stars (0-5 scale)")
                specRow("Button Size", value: "Small (28pt)")
                specRow("Product Name Font", value: "THD Sm Beta, 14pt")
                specRow("Price Font", value: "Display, 20pt, Heavy")
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
// Content Card
DSContentCard(
    title: "Title",
    subtitle: "Subtitle",
    bodyPlacement: .secondWithPadding,
    buttonText: "Action",
    onButtonTap: { /* action */ }
) {
    AnyView(YourBodyContent())
}

// Mini Product Card - Horizontal
DSMiniProductCard.horizontal(
    productName: "Product Name",
    price: "$99.99",
    brandName: "Brand",
    sku: "SKU #12345",
    onButtonTap: { /* action */ }
)

// Mini Product Card - Full Featured
DSMiniProductCard(
    orientation: .horizontal,
    sku: "SKU #12345",
    brandName: "Brand",
    productName: "Product Name",
    showRating: true,
    rating: 4.5,
    showFulfillment: true,
    pickupInfo: "Pickup: In stock",
    deliveryInfo: "Delivery: Free",
    price: "$99.99",
    showBadge: true,
    badgeText: "Sale",
    onButtonTap: { /* action */ },
    onMoreAction: { /* more */ }
)
""")
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

// MARK: - Supporting Views

/// Interactive content card example with dynamic content
private struct InteractiveContentCardExample: View {
    @State private var bodyPlacement: DSContentCard.BodyPlacement = .secondWithPadding
    @State private var showSubtitle = true
    
    var body: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            HStack {
                Text("Interactive Content Card")
                    .thdFont(.bodySm)
                    .foregroundColor(TokensSemanticLight.TextOnContainerColorSecondary)
                
                Spacer()
            }
            
            // Controls
            HStack(spacing: 8) {
                DSButton(
                    "Toggle Subtitle",
                    style: .ghost,
                    size: .small
                ) {
                    showSubtitle.toggle()
                }
                
                DSButton(
                    "Cycle Layout",
                    style: .ghost,
                    size: .small
                ) {
                    cyclePlacement()
                }
            }
            
            // Card Preview
            DSContentCard(
                title: "Dynamic Card",
                subtitle: showSubtitle ? placementDescription : nil,
                bodyPlacement: bodyPlacement,
                buttonText: "Action",
                onButtonTap: {
                    print("Card action tapped")
                }
            ) {
                AnyView(
                    Text("Body Content")
                        .frame(maxWidth: .infinity)
                        .padding(24)
                        .background(Color.blue.opacity(0.1))
                )
            }
        }
        .padding(TokensSpacing.Spacing2)
        .background(
            RoundedRectangle(cornerRadius: TokensSemanticLight.BorderRadiusSm)
                .fill(TokensSemanticLight.BackgroundContainerColorWhite)
        )
    }
    
    private func cyclePlacement() {
        switch bodyPlacement {
        case .secondWithPadding:
            bodyPlacement = .firstWithPadding
        case .firstWithPadding:
            bodyPlacement = .firstFullBleed
        case .firstFullBleed:
            bodyPlacement = .secondFullBleed
        case .secondFullBleed:
            bodyPlacement = .secondWithPadding
        }
    }
    
    private var placementDescription: String {
        switch bodyPlacement {
        case .secondWithPadding: "Second with Padding"
        case .firstWithPadding: "First with Padding"
        case .firstFullBleed: "First Full Bleed"
        case .secondFullBleed: "Second Full Bleed"
        }
    }
}

/// Interactive mini product card example
private struct InteractiveMiniProductCardExample: View {
    @State private var orientation: DSMiniProductCard.Orientation = .horizontal
    @State private var showRating = true
    @State private var rating: Double = 4.5
    
    var body: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            HStack {
                Text("Interactive Product Card")
                    .thdFont(.bodySm)
                    .foregroundColor(TokensSemanticLight.TextOnContainerColorSecondary)
                
                Spacer()
            }
            
            // Controls
            HStack(spacing: 8) {
                DSButton(
                    orientation == .horizontal ? "→ Vertical" : "→ Horizontal",
                    style: .ghost,
                    size: .small
                ) {
                    orientation = orientation == .horizontal ? .vertical : .horizontal
                }
                
                DSButton(
                    "Toggle Rating",
                    style: .ghost,
                    size: .small
                ) {
                    showRating.toggle()
                }
                
                DSButton(
                    "★ \(Int(rating))",
                    style: .ghost,
                    size: .small
                ) {
                    rating = rating >= 5.0 ? 1.0 : rating + 1.0
                }
            }
            
            // Card Preview
            DSMiniProductCard(
                orientation: orientation,
                sku: "SKU #1234567",
                brandName: "Brand",
                productName: "Interactive Product Demo Card",
                showRating: showRating,
                rating: rating,
                price: "$49.99",
                onButtonTap: {
                    print("Add to cart tapped")
                }
            )
            .frame(width: orientation == .horizontal ? nil : 180)
        }
        .padding(TokensSpacing.Spacing2)
        .background(
            RoundedRectangle(cornerRadius: TokensSemanticLight.BorderRadiusSm)
                .fill(TokensSemanticLight.BackgroundContainerColorWhite)
        )
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
    DSCardView()
}
