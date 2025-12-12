import SwiftUI

// MARK: - DSQuantityPicker Showcase View

/// Comprehensive showcase of the DSQuantityPicker component
///
/// Demonstrates:
/// - All sizes (small, medium, large)
/// - Both color variants (orange, grey)
/// - Different quantities
/// - Interactive examples
/// - Dark mode support
/// - Real-world usage examples

struct DSQuantityPickerView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing6) {
                
                // MARK: - Header Card
                VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                    Text("Quantity Picker")
                        .thdFont(.hero5)
                        .foregroundColor(textPrimary)

                    Text("A quantity picker component with increment/decrement buttons. Available in 3 sizes and 2 color variants.")
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
                    
                    // Sizes Section - Orange
                    sizesSection(color: .orange)
                    
                    Divider().padding(.vertical, TokensSpacing.Spacing2)
                    
                    // Sizes Section - Grey
                    sizesSection(color: .grey)
                    
                    Divider().padding(.vertical, TokensSpacing.Spacing2)
                    
                    // Interactive Example
                    interactiveSection
                    
                    Divider().padding(.vertical, TokensSpacing.Spacing2)
                    
                    // Quantity Ranges
                    quantityRangesSection
                    
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
    
    // MARK: - Sizes Section
    
    private func sizesSection(color: DSQuantityPicker.Color) -> some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "\(colorLabel(color)) Variant - Sizes",
                description: "Small (28pt), Medium (36pt), and Large (44pt)"
            )
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                // Small
                sizeExample("Small", size: .small, color: color, heightLabel: "28pt")
                
                // Medium
                sizeExample("Medium", size: .medium, color: color, heightLabel: "36pt")
                
                // Large
                sizeExample("Large", size: .large, color: color, heightLabel: "44pt")
            }
        }
    }
    
    private func sizeExample(
        _ title: String,
        size: DSQuantityPicker.Size,
        color: DSQuantityPicker.Color,
        heightLabel: String
    ) -> some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            HStack {
                Text(title)
                    .thdFont(.bodySm)
                    .foregroundColor(textSecondary)
                
                Spacer()
                
                Text(heightLabel)
                    .thdFont(.caption)
                    .foregroundColor(textTertiary)
            }
            
            QuantityPickerWrapper(size: size, color: color, initialQuantity: 1)
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
            sectionHeader("Interactive Example", description: "Try adjusting the quantities")
            
            VStack(spacing: TokensSpacing.Spacing4) {
                InteractiveQuantityExample(
                    title: "Orange Medium",
                    size: .medium,
                    color: .orange
                )
                
                InteractiveQuantityExample(
                    title: "Grey Medium",
                    size: .medium,
                    color: .grey
                )
            }
            .padding(TokensSpacing.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(containerGreige)
            )
        }
    }
    
    // MARK: - Quantity Ranges Section
    
    private var quantityRangesSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader("Quantity Ranges", description: "Different starting quantities")
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                quantityExample("Single Item", quantity: 1)
                quantityExample("Small Batch", quantity: 5)
                quantityExample("Medium Batch", quantity: 25)
                quantityExample("Large Batch", quantity: 99)
            }
        }
    }
    
    private func quantityExample(_ title: String, quantity: Int) -> some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            HStack {
                Text(title)
                    .thdFont(.bodySm)
                    .foregroundColor(textSecondary)
                
                Spacer()
                
                Text("Initial: \(quantity)")
                    .thdFont(.caption)
                    .foregroundColor(textTertiary)
            }
            
            QuantityPickerWrapper(size: .medium, color: .orange, initialQuantity: quantity)
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
            
            Text("Product Cart Item")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
            
            productCartExample
            
            Text("Add to Cart Sheet")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
                .padding(.top, TokensSpacing.Spacing2)
            
            addToCartExample
        }
    }
    
    private var productCartExample: some View {
        HStack(spacing: TokensSpacing.Spacing3) {
            // Product image placeholder
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(Color.gray.opacity(0.2))
                .frame(width: 60, height: 60)
            
            // Product details
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing1) {
                Text("Milwaukee M18 Drill")
                    .thdFont(.h6)
                    .foregroundColor(textPrimary)
                
                Text("$199.00")
                    .thdFont(.bodySm)
                    .foregroundColor(textSecondary)
            }
            
            Spacer()
            
            // Quantity picker
            QuantityPickerWrapper(size: .small, color: .grey, initialQuantity: 2)
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerWhite)
        )
    }
    
    private var addToCartExample: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            HStack {
                Text("Select Quantity")
                    .thdFont(.h5)
                    .foregroundColor(textPrimary)
                
                Spacer()
            }
            
            HStack {
                Text("How many would you like?")
                    .thdFont(.bodyMd)
                    .foregroundColor(textSecondary)
                
                Spacer()
                
                QuantityPickerWrapper(size: .large, color: .orange, initialQuantity: 1)
            }
            
            // Mock "Add to Cart" button
            Text("Add to Cart")
                .thdFont(.h6)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(TokensSpacing.Spacing3)
                .background(
                    RoundedRectangle(cornerRadius: borderRadiusFull)
                        .fill(tokens.BackgroundButtonColorBrandFilledDefault)
                )
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
                specRow("Component", value: "DSQuantityPicker")
                specRow("Sizes", value: "Small (28pt), Medium (36pt), Large (44pt)")
                specRow("Colors", value: "Orange, Grey")
                specRow("Button Size", value: "44pt (tap target)")
                specRow("Icon Size", value: "16pt")
                specRow("Min Quantity", value: "1")
                specRow("Corner Radius", value: "Full (pill shape)")
                specRow("Font", value: "THD SmVar Beta (Bold)")
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
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing1) {
                Text("@State private var quantity = 1")
                    .thdFont(.caption)
                    .foregroundColor(textSecondary)
                    .font(.system(.caption, design: .monospaced))
                
                Text("")
                    .thdFont(.caption)
                
                Text("DSQuantityPicker(")
                    .thdFont(.caption)
                    .foregroundColor(textSecondary)
                    .font(.system(.caption, design: .monospaced))
                
                Text("    quantity: $quantity,")
                    .thdFont(.caption)
                    .foregroundColor(textSecondary)
                    .font(.system(.caption, design: .monospaced))
                
                Text("    size: .medium,")
                    .thdFont(.caption)
                    .foregroundColor(textSecondary)
                    .font(.system(.caption, design: .monospaced))
                
                Text("    color: .orange")
                    .thdFont(.caption)
                    .foregroundColor(textSecondary)
                    .font(.system(.caption, design: .monospaced))
                
                Text(")")
                    .thdFont(.caption)
                    .foregroundColor(textSecondary)
                    .font(.system(.caption, design: .monospaced))
            }
            .padding(TokensSpacing.Spacing3)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(Color.black.opacity(0.05))
            )
        }
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
    
    private func colorLabel(_ color: DSQuantityPicker.Color) -> String {
        switch color {
        case .orange: return "Orange"
        case .grey: return "Grey"
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
    
    private var borderRadiusFull: CGFloat {
        tokens.BorderRadiusFull
    }
    
    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }
}

// MARK: - Supporting Views

/// Wrapper for DSQuantityPicker with @State management
private struct QuantityPickerWrapper: View {
    let size: DSQuantityPicker.Size
    let color: DSQuantityPicker.Color
    let initialQuantity: Int
    
    @State private var quantity: Int
    
    init(size: DSQuantityPicker.Size, color: DSQuantityPicker.Color, initialQuantity: Int) {
        self.size = size
        self.color = color
        self.initialQuantity = initialQuantity
        self._quantity = State(initialValue: initialQuantity)
    }
    
    var body: some View {
        DSQuantityPicker(
            quantity: $quantity,
            size: size,
            color: color
        )
    }
}

/// Interactive example with quantity display
private struct InteractiveQuantityExample: View {
    let title: String
    let size: DSQuantityPicker.Size
    let color: DSQuantityPicker.Color
    
    @State private var quantity = 1
    
    var body: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            HStack {
                Text(title)
                    .thdFont(.bodySm)
                    .foregroundColor(TokensSemanticLight.TextOnContainerColorSecondary)
                
                Spacer()
                
                Text("Quantity: \(quantity)")
                    .thdFont(.bodySm)
                    .foregroundColor(TokensSemanticLight.TextOnContainerColorPrimary)
            }
            
            DSQuantityPicker(
                quantity: $quantity,
                size: size,
                color: color
            )
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
    static var BackgroundButtonColorBrandFilledDefault: Color { get }
    static var BorderRadiusSm: CGFloat { get }
    static var BorderRadiusLg: CGFloat { get }
    static var BorderRadiusXl: CGFloat { get }
    static var BorderRadiusFull: CGFloat { get }
}

extension TokensSemanticLight: TokenSemanticProtocol {}
extension TokensSemanticDark: TokenSemanticProtocol {}

// MARK: - Preview
#Preview {
    DSQuantityPickerView()
}
