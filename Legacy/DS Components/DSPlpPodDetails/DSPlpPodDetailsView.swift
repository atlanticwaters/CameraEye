import SwiftUI

// MARK: - DSPlpPodDetails Showcase View

/// Comprehensive showcase of the DSPlpPodDetails component
///
/// Demonstrates:
/// - Product information display
/// - Brand and title
/// - Model numbers
/// - Pricing variations
/// - Star ratings
/// - Stock availability
/// - Pickup and delivery information
/// - Dark mode support
/// - Real-world usage examples

struct DSPlpPodDetailsView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing6) {
                
                // MARK: - Header Card
                VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                    Text("Product List Pod Details")
                        .thdFont(.hero5)
                        .foregroundColor(textPrimary)

                    Text("Comprehensive product information component for listing pages. Displays brand, title, model, pricing, ratings, and fulfillment details.")
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
                    
                    // Pricing Variations
                    pricingVariationsSection
                    
                    Divider().padding(.vertical, TokensSpacing.Spacing2)
                    
                    // Rating Variations
                    ratingVariationsSection
                    
                    Divider().padding(.vertical, TokensSpacing.Spacing2)
                    
                    // Stock & Fulfillment
                    stockFulfillmentSection
                    
                    Divider().padding(.vertical, TokensSpacing.Spacing2)
                    
                    // Minimal Examples
                    minimalExamplesSection
                    
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
            .padding(.top, 96) // Extra padding for top navigation
            .padding(.bottom, 80) // Extra padding for bottom navigation
        }
        .background(surfaceGreige)
        .applySoftScrollEdges()
    }
    
    // MARK: - Complete Example Section
    
    private var completeExampleSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Complete Example",
                description: "Full product details with all features"
            )
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                Text("Maximum Information")
                    .thdFont(.bodySm)
                    .foregroundColor(textSecondary)
                
                DSPlpPodDetails.sample()
            }
            .padding(TokensSpacing.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(containerGreige)
            )
        }
    }
    
    // MARK: - Pricing Variations Section
    
    private var pricingVariationsSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Pricing Variations",
                description: "Different price display formats"
            )
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                pricingExample(
                    "Standard Price",
                    priceText: "$199.00"
                )
                
                pricingExample(
                    "Contact Store",
                    priceText: "Contact your local store for price"
                )
                
                pricingExample(
                    "Price Range",
                    priceText: "$49.99 - $299.99"
                )
                
                pricingExample(
                    "Starting Price",
                    priceText: "Starting at $29.99"
                )
            }
        }
    }
    
    private func pricingExample(_ title: String, priceText: String) -> some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            Text(title)
                .thdFont(.caption)
                .foregroundColor(textTertiary)
            
            DSPlpPodDetails(
                brand: "DEWALT",
                title: "20V MAX Cordless Drill/Driver Kit",
                modelNumber: "DCD771C2",
                priceText: priceText,
                rating: 4.5,
                ratingCount: 342
            )
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }
    
    // MARK: - Rating Variations Section
    
    private var ratingVariationsSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Rating Variations",
                description: "Star ratings from 1.0 to 5.0"
            )
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                ratingExample("5 Star Rating", rating: 5.0, count: 1250)
                ratingExample("4.5 Star Rating", rating: 4.5, count: 892)
                ratingExample("3.5 Star Rating", rating: 3.5, count: 456)
                ratingExample("2.0 Star Rating", rating: 2.0, count: 123)
                ratingExample("No Rating", rating: nil, count: nil)
            }
        }
    }
    
    private func ratingExample(_ title: String, rating: Double?, count: Int?) -> some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            Text(title)
                .thdFont(.caption)
                .foregroundColor(textTertiary)
            
            DSPlpPodDetails(
                brand: "Milwaukee",
                title: "M18 FUEL Hammer Drill",
                modelNumber: "2804-20",
                priceText: "$149.00",
                rating: rating,
                ratingCount: count
            )
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }
    
    // MARK: - Stock & Fulfillment Section
    
    private var stockFulfillmentSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Stock & Fulfillment",
                description: "Pickup and delivery availability"
            )
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                fulfillmentExample(
                    "In Stock - Available",
                    showAtYourStore: true,
                    storeStock: "25",
                    pickupInfo: "25 in stock, eligible for online order Pickup",
                    deliveryInfo: "Available"
                )
                
                fulfillmentExample(
                    "Low Stock - Pickup Only",
                    showAtYourStore: true,
                    storeStock: "3",
                    pickupInfo: "3 in stock, eligible for online order Pickup",
                    deliveryInfo: "Unavailable"
                )
                
                fulfillmentExample(
                    "Not Eligible",
                    showAtYourStore: true,
                    storeStock: "15",
                    pickupInfo: "15 in stock, not eligible for online order Pickup",
                    deliveryInfo: "Unavailable"
                )
                
                fulfillmentExample(
                    "No Stock Info",
                    showAtYourStore: false,
                    storeStock: nil,
                    pickupInfo: nil,
                    deliveryInfo: nil
                )
            }
        }
    }
    
    private func fulfillmentExample(
        _ title: String,
        showAtYourStore: Bool,
        storeStock: String?,
        pickupInfo: String?,
        deliveryInfo: String?
    ) -> some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            Text(title)
                .thdFont(.caption)
                .foregroundColor(textTertiary)
            
            DSPlpPodDetails(
                brand: "Makita",
                title: "18V LXT Brushless Drill Driver",
                modelNumber: "XFD131",
                priceText: "$179.00",
                rating: 4.7,
                ratingCount: 523,
                pickupInfo: pickupInfo,
                deliveryInfo: deliveryInfo,
                showAtYourStore: showAtYourStore,
                storeStock: storeStock
            )
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }
    
    // MARK: - Minimal Examples Section
    
    private var minimalExamplesSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Minimal Examples",
                description: "Basic configurations with limited information"
            )
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                minimalExample(
                    "Price Only",
                    includeModel: false,
                    includeRating: false,
                    includeFulfillment: false
                )
                
                minimalExample(
                    "Price + Model",
                    includeModel: true,
                    includeRating: false,
                    includeFulfillment: false
                )
                
                minimalExample(
                    "Price + Rating",
                    includeModel: false,
                    includeRating: true,
                    includeFulfillment: false
                )
            }
        }
    }
    
    private func minimalExample(
        _ title: String,
        includeModel: Bool,
        includeRating: Bool,
        includeFulfillment: Bool
    ) -> some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            Text(title)
                .thdFont(.caption)
                .foregroundColor(textTertiary)
            
            DSPlpPodDetails(
                brand: "Bosch",
                title: "12V Max Cordless Drill/Driver",
                modelNumber: includeModel ? "PS31-2A" : nil,
                priceText: "$89.00",
                rating: includeRating ? 4.3 : nil,
                ratingCount: includeRating ? 267 : nil,
                pickupInfo: includeFulfillment ? "10 in stock" : nil,
                deliveryInfo: includeFulfillment ? "Available" : nil
            )
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }
    
    // MARK: - Usage Examples Section
    
    private var usageExamplesSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader("Usage Examples", description: "Real-world component usage")
            
            Text("Product Listing Grid")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
            
            productListingExample
            
            Text("Search Results")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
                .padding(.top, TokensSpacing.Spacing2)
            
            searchResultsExample
        }
    }
    
    private var productListingExample: some View {
        VStack(spacing: TokensSpacing.Spacing3) {
            DSPlpPodDetails(
                brand: "DEWALT",
                title: "20V MAX XR Brushless Drill/Driver",
                modelNumber: "DCD996B",
                priceText: "$229.00",
                rating: 4.8,
                ratingCount: 1543,
                pickupInfo: "42 in stock, eligible for online order Pickup",
                deliveryInfo: "Available",
                showAtYourStore: true,
                storeStock: "42"
            )
            
            Divider()
            
            DSPlpPodDetails(
                brand: "Milwaukee",
                title: "M18 FUEL 1/2 in. Hammer Drill Driver",
                modelNumber: "2804-20",
                priceText: "$199.00",
                rating: 4.9,
                ratingCount: 892,
                pickupInfo: "18 in stock, eligible for online order Pickup",
                deliveryInfo: "Available",
                showAtYourStore: true,
                storeStock: "18"
            )
            
            Divider()
            
            DSPlpPodDetails(
                brand: "Makita",
                title: "18V LXT Brushless Cordless 1/2 in. Driver-Drill",
                modelNumber: "XFD131",
                priceText: "$179.00",
                rating: 4.7,
                ratingCount: 523,
                pickupInfo: "5 in stock, eligible for online order Pickup",
                deliveryInfo: "Unavailable",
                showAtYourStore: true,
                storeStock: "5"
            )
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerWhite)
        )
    }
    
    private var searchResultsExample: some View {
        VStack(spacing: TokensSpacing.Spacing3) {
            HStack(alignment: .top, spacing: TokensSpacing.Spacing3) {
                // Image placeholder
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 100, height: 100)
                
                // Product details
                DSPlpPodDetails(
                    brand: "Ryobi",
                    title: "ONE+ 18V Cordless Drill/Driver Kit",
                    modelNumber: "P1811",
                    priceText: "$79.00",
                    rating: 4.4,
                    ratingCount: 332,
                    pickupInfo: "12 in stock",
                    deliveryInfo: "Available"
                )
            }
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerWhite)
        )
    }
    
    // MARK: - Specifications Section
    
    private var specificationsSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader("Specifications", description: "Component details and typography")
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                specRow("Component", value: "DSPlpPodDetails")
                specRow("Brand Font", value: "Body Sm (14pt, Bold)")
                specRow("Title Font", value: "Body Sm (14pt, Regular)")
                specRow("Model Font", value: "Body XS (12pt)")
                specRow("Price Font", value: "Body Md (16pt, Bold)")
                specRow("Rating Font", value: "Body XS (12pt)")
                specRow("Stock Font", value: "Body Sm (14pt)")
                specRow("Star Size", value: "16pt × 16pt")
                specRow("Spacing", value: "4pt (details), 8pt (pricing), 16pt (sections)")
            }
            .padding(TokensSpacing.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(containerGreige)
            )
            
            Text("Text Colors")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
                .padding(.top, TokensSpacing.Spacing2)
            
            textColorTable
            
            Text("Code Example")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
                .padding(.top, TokensSpacing.Spacing2)
            
            codeExample("""
DSPlpPodDetails(
    brand: "DEWALT",
    title: "20V MAX Drill/Driver Kit",
    modelNumber: "DCD771C2",
    priceText: "$149.00",
    rating: 4.5,
    ratingCount: 342,
    pickupInfo: "25 in stock, eligible for pickup",
    deliveryInfo: "Available",
    showAtYourStore: true,
    storeStock: "25"
)
""")
        }
    }
    
    private var textColorTable: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing1) {
            textColorRow("Brand/Title", color: "TextOnSurfaceColorPrimary")
            textColorRow("Model Number", color: "TextOnSurfaceColorTertiary")
            textColorRow("Price", color: "TextOnSurfaceColorPrimary (Bold)")
            textColorRow("Stock (In Stock)", color: "TextOnContainerColorSuccess")
            textColorRow("Rating Stars", color: "Orange (#F96302)")
            textColorRow("Delivery Icon", color: "TextOnSurfaceColorTertiary")
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }
    
    private func textColorRow(_ label: String, color: String) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(label)
                .thdFont(.caption)
                .foregroundColor(textPrimary)
            Text(color)
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
    DSPlpPodDetailsView()
}
