import SwiftUI

// MARK: - DSProductCardView Showcase

/// Comprehensive showcase of the DSProductCard component
///
/// Demonstrates:
/// - B2C variant (Add to Cart button only)
/// - B2B variant (Quantity picker + multiple buttons)
/// - Various configurations
/// - Different badge combinations
/// - With and without ratings
/// - Dark mode support
/// - Real-world usage examples

struct DSProductCardView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var quantity = 1
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing6) {
                
                // MARK: - Header Card
                VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                    Text("Product Card")
                        .thdFont(.hero5)
                        .foregroundColor(textPrimary)

                    Text("A complete product card combining image container, details, and action buttons. Supports both B2C and B2B variants with configurable badges, swatches, ratings, and fulfillment information.")
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
                    
                    // B2C Variant
                    b2cVariantSection
                    
                    Divider().padding(.vertical, TokensSpacing.Spacing2)
                    
                    // B2B Variant
                    b2bVariantSection
                    
                    Divider().padding(.vertical, TokensSpacing.Spacing2)
                    
                    // Configuration Variations
                    configurationSection
                    
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
    
    // MARK: - B2C Variant Section
    
    private var b2cVariantSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "B2C Variant",
                description: "Consumer-facing product card with standard Add to Cart button"
            )
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                Text("Complete Product Card")
                    .thdFont(.bodySm)
                    .foregroundColor(textSecondary)
                
                DSProductCard.sampleB2C(
                    showExclusiveBadge: true,
                    showDeliveryBadge: true,
                    showSponsoredTag: true,
                    swatches: [.black, .gray, .brown],
                    selectedSwatchIndex: 0,
                    additionalSwatchCount: nil,
                    onAddToCart: {
                        print("B2C: Added to cart")
                    },
                    onAddToList: {
                        print("B2C: Added to list")
                    }
                )
                
                Text("Without Badges or Swatches")
                    .thdFont(.bodySm)
                    .foregroundColor(textSecondary)
                    .padding(.top, TokensSpacing.Spacing2)
                
                DSProductCard(
                    placeholderImage: Image("Fridge"),
                    brand: "Home Decorators Collection",
                    title: "Simple Product Card without extras",
                    modelNumber: "MODEL123",
                    priceText: "$19.99",
                    rating: 4.0,
                    ratingCount: 150,
                    pickupInfo: "100 in stock at Local Store",
                    deliveryInfo: "Free Shipping",
                    buttonVariant: .b2c,
                    onAddToCart: {},
                    onAddToList: {}
                )
            }
            .padding(TokensSpacing.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(containerGreige)
            )
        }
    }
    
    // MARK: - B2B Variant Section
    
    private var b2bVariantSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "B2B Variant",
                description: "Business-facing product card with quantity picker"
            )
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                Text("With Quantity Picker")
                    .thdFont(.bodySm)
                    .foregroundColor(textSecondary)
                
                DSProductCard.sampleB2B(
                    swatches: [.black, .gray, .brown],
                    quantity: $quantity,
                    onAddToCart: {
                        print("B2B: Added \(quantity) to cart")
                    },
                    onAddToList: {
                        print("B2B: Added to list")
                    }
                )
                
                Text("Current Quantity: \(quantity)")
                    .thdFont(.caption)
                    .foregroundColor(textTertiary)
            }
            .padding(TokensSpacing.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(containerGreige)
            )
        }
    }
    
    // MARK: - Configuration Section
    
    private var configurationSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Configuration Variations",
                description: "Different configurations for various use cases"
            )
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                Text("Sponsored Product")
                    .thdFont(.bodySm)
                    .foregroundColor(textSecondary)
                
                DSProductCard(
                    placeholderImage: Image("Fridge"),
                    showExclusiveBadge: false,
                    showDeliveryBadge: false,
                    showSponsoredTag: true,
                    swatches: [.red, .blue, .green],
                    brand: "Premium Brand",
                    title: "Sponsored Premium Product",
                    priceText: "$499.99",
                    rating: 4.8,
                    ratingCount: 523,
                    pickupInfo: "Available in store",
                    deliveryInfo: "2-day shipping",
                    buttonVariant: .b2c,
                    onAddToCart: {}
                )
                
                Text("With Price Label")
                    .thdFont(.bodySm)
                    .foregroundColor(textSecondary)
                    .padding(.top, TokensSpacing.Spacing2)
                
                DSProductCard(
                    placeholderImage: Image("Fridge"),
                    showExclusiveBadge: true,
                    swatches: [.black, .white],
                    brand: "Value Collection",
                    title: "Affordable Option with Starting Price",
                    modelNumber: "VAL456",
                    priceLabel: "Starting at",
                    priceText: "$29.00",
                    rating: 3.5,
                    ratingCount: 89,
                    buttonVariant: .b2c,
                    onAddToCart: {}
                )
                
                Text("No Ratings")
                    .thdFont(.bodySm)
                    .foregroundColor(textSecondary)
                    .padding(.top, TokensSpacing.Spacing2)
                
                DSProductCard(
                    placeholderImage: Image("Fridge"),
                    showDeliveryBadge: true,
                    brand: "New Product Line",
                    title: "Recently Launched - No Reviews Yet",
                    priceText: "$79.99",
                    pickupInfo: "Limited stock",
                    buttonVariant: .b2c,
                    onAddToCart: {}
                )
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
            sectionHeader("Usage Examples", description: "Real-world implementation scenarios")
            
            Text("Product List View")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
            
            productListExample
            
            codeExample("""
// B2C Product Card
DSProductCard(
    imageURL: URL(string: "https://..."),
    placeholderImage: Image("Fridge"),
    showExclusiveBadge: true,
    showDeliveryBadge: true,
    swatches: [.black, .gray, .brown],
    brand: "Home Decorators Collection",
    title: "35.4 in. Driftwood Cabinet",
    modelNumber: "A7A19A100WUL01",
    priceLabel: "Starting at",
    priceText: "$29.00",
    rating: 4.5,
    ratingCount: 281,
    pickupInfo: "2,243 in stock at Store",
    deliveryInfo: "Free Tomorrow",
    fasterDeliveryInfo: "Get it in 2 hours",
    buttonVariant: .b2c,
    onAddToCart: { 
        // Handle add to cart
    },
    onAddToList: {
        // Handle add to list
    }
)

// B2B Product Card with Quantity
@State private var quantity = 1

DSProductCard(
    brand: "Business Product",
    title: "Bulk Order Item",
    priceText: "$29.00",
    rating: 4.5,
    ratingCount: 281,
    buttonVariant: .b2b,
    quantity: $quantity,
    onAddToCart: {
        print("Adding \\(quantity) items")
    }
)
""")
        }
    }
    
    private var productListExample: some View {
        VStack(spacing: TokensSpacing.Spacing2) {
            DSProductCard.sampleB2C(
                showExclusiveBadge: true,
                showDeliveryBadge: false,
                showSponsoredTag: false,
                swatches: [.black, .gray],
                brand: "Product 1",
                title: "First item in list",
                priceText: "$29.99"
            )
            
            DSProductCard.sampleB2C(
                showExclusiveBadge: false,
                showDeliveryBadge: true,
                showSponsoredTag: false,
                swatches: [.red, .blue, .green],
                brand: "Product 2",
                title: "Second item in list",
                priceText: "$49.99"
            )
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(surfaceGreige)
        )
    }
    
    // MARK: - Specifications Section
    
    private var specificationsSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader("Specifications", description: "Component details and structure")
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                specRow("Component", value: "DSProductCard")
                specRow("Layout", value: "HStack (Image + Details)")
                specRow("Spacing", value: "8pt between sections")
                specRow("Padding", value: "8pt container padding")
                specRow("Corner Radius", value: "Border Radius XL")
                specRow("Button Variants", value: "B2C, B2B")
            }
            .padding(TokensSpacing.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(containerGreige)
            )
            
            Text("Composite Components")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
                .padding(.top, TokensSpacing.Spacing2)
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                componentRow("Image Container", description: "DSProductImageContainer with badges and swatches")
                componentRow("Product Details", description: "Brand, title, model, price, ratings, fulfillment")
                componentRow("Action Buttons", description: "B2C or B2B button configurations")
            }
            .padding(TokensSpacing.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(containerGreige)
            )
            
            Text("Features")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
                .padding(.top, TokensSpacing.Spacing2)
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                featureRow("✓ Exclusive and delivery badges")
                featureRow("✓ Sponsored tag support")
                featureRow("✓ Color swatch selection")
                featureRow("✓ Star ratings with count")
                featureRow("✓ Pickup and delivery info")
                featureRow("✓ Faster delivery options")
                featureRow("✓ B2C and B2B button variants")
                featureRow("✓ Quantity picker for B2B")
                featureRow("✓ Dark mode support")
                featureRow("✓ Async image loading")
            }
            .padding(TokensSpacing.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(containerGreige)
            )
        }
    }
    
    private func componentRow(_ title: String, description: String) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(title)
                .thdFont(.caption)
                .foregroundColor(textPrimary)
            Text(description)
                .thdFont(.caption)
                .foregroundColor(textTertiary)
        }
    }
    
    private func featureRow(_ text: String) -> some View {
        Text(text)
            .thdFont(.caption)
            .foregroundColor(textSecondary)
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
    DSProductCardView()
}
