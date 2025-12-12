import SwiftUI

// MARK: - DSPodButtonSet Showcase View

/// Comprehensive showcase of the DSPodButtonSet component
///
/// Demonstrates:
/// - B2C variant (single "Add to Cart" button)
/// - B2B variant (multiple buttons with quantity picker)
/// - Interactive examples
/// - Dark mode support
/// - Real-world usage examples

struct DSPodButtonSetView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing6) {
                
                // MARK: - Header Card
                VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                    Text("Pod Button Set")
                        .thdFont(.hero5)
                        .foregroundColor(textPrimary)

                    Text("Button set component for product listing pages. Includes B2C and B2B variants with different button configurations.")
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
                    
                    // B2C Variant Section
                    b2cVariantSection
                    
                    Divider().padding(.vertical, TokensSpacing.Spacing2)
                    
                    // B2B Variant Section
                    b2bVariantSection
                    
                    Divider().padding(.vertical, TokensSpacing.Spacing2)
                    
                    // Interactive Examples
                    interactiveSection
                    
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
            .padding(.top, 60) // Extra padding for top navigation
            .padding(.bottom, 80) // Extra padding for bottom navigation
        }
        .background(surfaceGreige)
        .applySoftScrollEdges()
    }
    
    // MARK: - B2C Variant Section
    
    private var b2cVariantSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "B2C Variant",
                description: "Single outlined button for consumer users"
            )
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                Text("Features")
                    .thdFont(.bodySm)
                    .foregroundColor(textSecondary)
                
                VStack(alignment: .leading, spacing: TokensSpacing.Spacing1) {
                    featureBullet("Single 'Add to Cart' button")
                    featureBullet("Outlined (white filled) style")
                    featureBullet("Medium size (44pt height)")
                    featureBullet("205pt fixed width")
                }
                .padding(TokensSpacing.Spacing3)
                .background(
                    RoundedRectangle(cornerRadius: borderRadiusSm)
                        .fill(containerGreige)
                )
                
                Text("Example")
                    .thdFont(.bodySm)
                    .foregroundColor(textSecondary)
                    .padding(.top, TokensSpacing.Spacing2)
                
                HStack {
                    Spacer()
                    
                    DSPodButtonSet(variant: .b2c) {
                        print("Add to cart tapped")
                    }
                    
                    Spacer()
                }
                .padding(TokensSpacing.Spacing4)
                .background(
                    RoundedRectangle(cornerRadius: borderRadiusLg)
                        .fill(containerGreige)
                )
            }
        }
    }
    
    // MARK: - B2B Variant Section
    
    private var b2bVariantSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "B2B Variant",
                description: "Multiple buttons with quantity picker for business users"
            )
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                Text("Features")
                    .thdFont(.bodySm)
                    .foregroundColor(textSecondary)
                
                VStack(alignment: .leading, spacing: TokensSpacing.Spacing1) {
                    featureBullet("'Add to Cart' button (orange filled)")
                    featureBullet("Quantity picker with gradient")
                    featureBullet("'Add to...' list button (outlined)")
                    featureBullet("Stacked vertical layout")
                    featureBullet("10pt spacing between buttons")
                }
                .padding(TokensSpacing.Spacing3)
                .background(
                    RoundedRectangle(cornerRadius: borderRadiusSm)
                        .fill(containerGreige)
                )
                
                Text("Example")
                    .thdFont(.bodySm)
                    .foregroundColor(textSecondary)
                    .padding(.top, TokensSpacing.Spacing2)
                
                HStack {
                    Spacer()
                    
                    B2BExample()
                    
                    Spacer()
                }
                .padding(TokensSpacing.Spacing4)
                .background(
                    RoundedRectangle(cornerRadius: borderRadiusLg)
                        .fill(containerGreige)
                )
            }
        }
    }
    
    // MARK: - Interactive Section
    
    private var interactiveSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader("Interactive Examples", description: "Try the buttons")
            
            VStack(spacing: TokensSpacing.Spacing4) {
                // B2C Interactive
                VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                    Text("B2C Interactive")
                        .thdFont(.bodySm)
                        .foregroundColor(textSecondary)
                    
                    InteractiveB2CExample()
                }
                
                // B2B Interactive
                VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                    Text("B2B Interactive")
                        .thdFont(.bodySm)
                        .foregroundColor(textSecondary)
                    
                    InteractiveB2BExample()
                }
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
            sectionHeader("Usage Examples", description: "Real-world component usage")
            
            Text("Product Card - B2C")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
            
            productCardB2CExample
            
            Text("Product Card - B2B")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
                .padding(.top, TokensSpacing.Spacing2)
            
            productCardB2BExample
        }
    }
    
    private var productCardB2CExample: some View {
        HStack(alignment: .top, spacing: TokensSpacing.Spacing3) {
            // Product image
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(Color.gray.opacity(0.2))
                .frame(width: 120, height: 120)
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                // Product details
                VStack(alignment: .leading, spacing: TokensSpacing.Spacing1) {
                    Text("DEWALT 20V MAX")
                        .thdFont(.h6)
                        .foregroundColor(textPrimary)
                        .lineLimit(2)
                    
                    Text("Cordless Drill/Driver Kit")
                        .thdFont(.bodySm)
                        .foregroundColor(textSecondary)
                        .lineLimit(2)
                    
                    Text("$149.00")
                        .thdFont(.h5)
                        .foregroundColor(textPrimary)
                }
                
                Spacer()
                
                // Button set
                DSPodButtonSet(variant: .b2c) {
                    print("Add to cart")
                }
            }
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerWhite)
        )
    }
    
    private var productCardB2BExample: some View {
        HStack(alignment: .top, spacing: TokensSpacing.Spacing3) {
            // Product image
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(Color.gray.opacity(0.2))
                .frame(width: 120, height: 120)
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                // Product details
                VStack(alignment: .leading, spacing: TokensSpacing.Spacing1) {
                    Text("DEWALT 20V MAX")
                        .thdFont(.h6)
                        .foregroundColor(textPrimary)
                        .lineLimit(2)
                    
                    Text("Cordless Drill/Driver Kit")
                        .thdFont(.bodySm)
                        .foregroundColor(textSecondary)
                        .lineLimit(2)
                    
                    Text("$149.00")
                        .thdFont(.h5)
                        .foregroundColor(textPrimary)
                }
                
                Spacer()
                
                // Button set
                B2BExample()
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
            sectionHeader("Specifications", description: "Component details and dimensions")
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                specRow("Component", value: "DSPodButtonSet")
                specRow("Variants", value: "B2C, B2B")
                specRow("Width", value: "205pt (fixed)")
                specRow("Button Height", value: "44pt")
                specRow("Button Spacing", value: "10pt (B2B)")
                specRow("Button Size", value: "Medium")
                specRow("B2C Style", value: "Outlined (White Filled)")
                specRow("B2B Cart Style", value: "Orange Filled")
                specRow("B2B List Style", value: "Outlined (White Filled)")
            }
            .padding(TokensSpacing.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(containerGreige)
            )
            
            Text("Code Example - B2C")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
                .padding(.top, TokensSpacing.Spacing2)
            
            codeExample("""
DSPodButtonSet(variant: .b2c) {
    print("Add to cart tapped")
}
""")
            
            Text("Code Example - B2B")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
                .padding(.top, TokensSpacing.Spacing2)
            
            codeExample("""
@State private var quantity = 1

DSPodButtonSet(
    variant: .b2b,
    quantity: $quantity,
    onAddToCart: {
        print("Add to cart: \\(quantity)")
    },
    onAddToList: {
        print("Add to list")
    }
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
    
    private func featureBullet(_ text: String) -> some View {
        HStack(alignment: .top, spacing: TokensSpacing.Spacing1) {
            Text("•")
                .thdFont(.caption)
                .foregroundColor(textTertiary)
            
            Text(text)
                .thdFont(.caption)
                .foregroundColor(textSecondary)
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
    
    private var borderRadiusSm: CGFloat {
        tokens.BorderRadiusSm
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

/// B2B Example with state management
private struct B2BExample: View {
    @State private var quantity = 1
    
    var body: some View {
        DSPodButtonSet(
            variant: .b2b,
            quantity: $quantity,
            onAddToCart: {
                print("Add to cart: \(quantity)")
            },
            onAddToList: {
                print("Add to list")
            }
        )
    }
}

/// Interactive B2C example with action logging
private struct InteractiveB2CExample: View {
    @State private var actionLog: String = "No actions yet"
    
    var body: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            HStack {
                Spacer()
                
                DSPodButtonSet(variant: .b2c) {
                    actionLog = "Added to cart at \(Date().formatted(date: .omitted, time: .standard))"
                }
                
                Spacer()
            }
            
            Text(actionLog)
                .thdFont(.caption)
                .foregroundColor(TokensSemanticLight.TextOnContainerColorTertiary)
                .frame(maxWidth: .infinity, alignment: .center)
        }
        .padding(TokensSpacing.Spacing2)
        .background(
            RoundedRectangle(cornerRadius: TokensSemanticLight.BorderRadiusSm)
                .fill(TokensSemanticLight.BackgroundContainerColorWhite)
        )
    }
}

/// Interactive B2B example with action logging
private struct InteractiveB2BExample: View {
    @State private var quantity = 1
    @State private var actionLog: String = "No actions yet"
    
    var body: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            HStack {
                Spacer()
                
                DSPodButtonSet(
                    variant: .b2b,
                    quantity: $quantity,
                    onAddToCart: {
                        actionLog = "Added \(quantity) to cart"
                    },
                    onAddToList: {
                        actionLog = "Added to list"
                    }
                )
                
                Spacer()
            }
            
            Text(actionLog)
                .thdFont(.caption)
                .foregroundColor(TokensSemanticLight.TextOnContainerColorTertiary)
                .frame(maxWidth: .infinity, alignment: .center)
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
    static var BorderRadiusSm: CGFloat { get }
    static var BorderRadiusLg: CGFloat { get }
    static var BorderRadiusXl: CGFloat { get }
}

extension TokensSemanticLight: TokenSemanticProtocol {}
extension TokensSemanticDark: TokenSemanticProtocol {}

// MARK: - Preview
#Preview {
    DSPodButtonSetView()
}
