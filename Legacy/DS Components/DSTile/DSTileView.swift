import SwiftUI

// MARK: - DSTile Showcase View

/// Comprehensive showcase of the DSTile component
///
/// Demonstrates:
/// - All 3 variants (outlined, filled, ghost)
/// - Both sizes (regular, small)
/// - All interaction states (default, pressed, loading, inactive)
/// - Selected and available states
/// - Swatch support
/// - Interactive examples
/// - Dark mode support
/// - Real-world usage examples

struct DSTileView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing6) {
                
                // MARK: - Header Card
                VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                    Text("Tile Selector")
                        .thdFont(.hero5)
                        .foregroundColor(textPrimary)

                    Text("A tile selector component with 3 variants, 2 sizes, and multiple states. Supports images, swatches, and selection states.")
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
                    
                    // Tile Variants
                    tileVariantsSection
                    
                    Divider().padding(.vertical, TokensSpacing.Spacing2)
                    
                    // Tile Sizes
                    tileSizesSection
                    
                    Divider().padding(.vertical, TokensSpacing.Spacing2)
                    
                    // Tile States
                    tileStatesSection
                    
                    Divider().padding(.vertical, TokensSpacing.Spacing2)
                    
                    // Selection States
                    selectionStatesSection
                    
                    Divider().padding(.vertical, TokensSpacing.Spacing2)
                    
                    // With Swatches
                    swatchesSection
                    
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
            .padding(.top, 96) // Extra padding for top navigation
            .padding(.bottom, 80) // Extra padding for bottom navigation
        }
        .background(surfaceGreige)
        .applySoftScrollEdges()
    }
    
    // MARK: - Tile Variants Section
    
    private var tileVariantsSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Tile Variants",
                description: "3 style variants for different contexts"
            )
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                variantExample(
                    "Outlined",
                    description: "Default tile with border",
                    variant: .outlined
                )
                
                variantExample(
                    "Filled",
                    description: "Filled background tile",
                    variant: .filled
                )
                
                variantExample(
                    "Ghost",
                    description: "Minimal, borderless tile",
                    variant: .ghost
                )
            }
        }
    }
    
    private func variantExample(_ title: String, description: String, variant: DSTile.Variant) -> some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing1) {
                Text(title)
                    .thdFont(.bodySm)
                    .foregroundColor(textPrimary)
                
                Text(description)
                    .thdFont(.caption)
                    .foregroundColor(textTertiary)
            }
            
            HStack(spacing: TokensSpacing.Spacing2) {
                DSTile("Raccoon", variant: variant, image: Image("Acorn"))
                DSTile("Raccoon", variant: variant, isSelected: true, image: Image("Acorn"))
                Spacer()
            }
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }
    
    // MARK: - Tile Sizes Section
    
    private var tileSizesSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Tile Sizes",
                description: "Regular (44pt) and Small (28pt)"
            )
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                sizeExample(
                    "Regular",
                    size: .regular,
                    heightLabel: "44pt"
                )
                
                sizeExample(
                    "Small",
                    size: .small,
                    heightLabel: "28pt"
                )
            }
        }
    }
    
    private func sizeExample(_ title: String, size: DSTile.Size, heightLabel: String) -> some View {
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
            
            HStack {
                DSTile("Raccoon", variant: .outlined, size: size, image: Image("Acorn"))
                Spacer()
            }
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }
    
    // MARK: - Tile States Section
    
    private var tileStatesSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Interaction States",
                description: "Default, pressed, loading, and inactive states"
            )
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                stateExample(
                    "Default State",
                    description: "Normal interactive state",
                    interaction: .default
                )
                
                stateExample(
                    "Pressed State",
                    description: "Active press feedback",
                    interaction: .pressed
                )
                
                stateExample(
                    "Loading State",
                    description: "Shows spinner during async operations",
                    interaction: .loading
                )
                
                stateExample(
                    "Inactive State",
                    description: "Non-interactive disabled state",
                    interaction: .inactive
                )
            }
        }
    }
    
    private func stateExample(_ title: String, description: String, interaction: DSTile.Interaction) -> some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing1) {
                Text(title)
                    .thdFont(.bodySm)
                    .foregroundColor(textPrimary)
                
                Text(description)
                    .thdFont(.caption)
                    .foregroundColor(textTertiary)
            }
            
            HStack(spacing: TokensSpacing.Spacing2) {
                DSTile("Outlined", variant: .outlined, interaction: interaction, image: Image("Acorn"))
                DSTile("Filled", variant: .filled, interaction: interaction, image: Image("Acorn"))
                Spacer()
            }
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }
    
    // MARK: - Selection States Section
    
    private var selectionStatesSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Selection & Availability",
                description: "Selected and available states"
            )
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                selectionExample(
                    "Unselected",
                    description: "Default unselected state",
                    isSelected: false,
                    isAvailable: true
                )
                
                selectionExample(
                    "Selected",
                    description: "Active selection state",
                    isSelected: true,
                    isAvailable: true
                )
                
                selectionExample(
                    "Unavailable",
                    description: "Not available (diagonal strikethrough)",
                    isSelected: false,
                    isAvailable: false
                )
            }
        }
    }
    
    private func selectionExample(_ title: String, description: String, isSelected: Bool, isAvailable: Bool) -> some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing1) {
                Text(title)
                    .thdFont(.bodySm)
                    .foregroundColor(textPrimary)
                
                Text(description)
                    .thdFont(.caption)
                    .foregroundColor(textTertiary)
            }
            
            HStack(spacing: TokensSpacing.Spacing2) {
                DSTile(
                    "Raccoon",
                    variant: .outlined,
                    isSelected: isSelected,
                    isAvailable: isAvailable,
                    image: Image("Acorn")
                )
                DSTile(
                    "Raccoon",
                    variant: .filled,
                    isSelected: isSelected,
                    isAvailable: isAvailable,
                    image: Image("Acorn")
                )
                Spacer()
            }
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }
    
    // MARK: - Swatches Section
    
    private var swatchesSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "With Color Swatches",
                description: "Optional color indicator in bottom-right corner"
            )
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                Text("Color swatches can be added to show product colors or variants")
                    .thdFont(.caption)
                    .foregroundColor(textSecondary)
                
                HStack(spacing: TokensSpacing.Spacing2) {
                    DSTile(
                        "Orange",
                        variant: .outlined,
                        image: Image("Acorn"),
                        swatch: Color.orange
                    )
                    DSTile(
                        "Blue",
                        variant: .outlined,
                        image: Image("Acorn"),
                        swatch: Color.blue
                    )
                    DSTile(
                        "Green",
                        variant: .outlined,
                        image: Image("Acorn"),
                        swatch: Color.green
                    )
                    Spacer()
                }
            }
            .padding(TokensSpacing.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(containerGreige)
            )
        }
    }
    
    // MARK: - Interactive Section
    
    private var interactiveSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader("Interactive Examples", description: "Try selecting tiles")
            
            VStack(spacing: TokensSpacing.Spacing4) {
                InteractiveTileExample(
                    title: "Single Selection",
                    options: ["Raccoon", "Fox", "Bear"]
                )
                
                InteractiveTileWithSwatchExample()
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
            
            Text("Product Size Selector")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
            
            productSizeExample
            
            Text("Product Color Selector")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
                .padding(.top, TokensSpacing.Spacing2)
            
            productColorExample
            
            Text("Filter Options")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
                .padding(.top, TokensSpacing.Spacing2)
            
            filterExample
        }
    }
    
    private var productSizeExample: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            Text("Select Size")
                .thdFont(.h6)
                .foregroundColor(textPrimary)
            
            HStack(spacing: TokensSpacing.Spacing2) {
                DSTile("Small", variant: .outlined)
                DSTile("Medium", variant: .outlined, isSelected: true)
                DSTile("Large", variant: .outlined)
                DSTile("X-Large", variant: .outlined, isAvailable: false)
            }
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerWhite)
        )
    }
    
    private var productColorExample: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            Text("Select Color")
                .thdFont(.h6)
                .foregroundColor(textPrimary)
            
            HStack(spacing: TokensSpacing.Spacing2) {
                DSTile(
                    "Red",
                    variant: .filled,
                    isSelected: true,
                    image: Image("Acorn"),
                    swatch: Color.red
                )
                DSTile(
                    "Blue",
                    variant: .filled,
                    image: Image("Acorn"),
                    swatch: Color.blue
                )
                DSTile(
                    "Green",
                    variant: .filled,
                    image: Image("Acorn"),
                    swatch: Color.green
                )
                DSTile(
                    "Yellow",
                    variant: .filled,
                    isAvailable: false,
                    image: Image("Acorn"),
                    swatch: Color.yellow
                )
            }
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerWhite)
        )
    }
    
    private var filterExample: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            Text("Filter by Brand")
                .thdFont(.h6)
                .foregroundColor(textPrimary)
            
            HStack(spacing: TokensSpacing.Spacing2) {
                DSTile("DEWALT", variant: .ghost, isSelected: true)
                DSTile("Milwaukee", variant: .ghost)
                DSTile("Makita", variant: .ghost)
                DSTile("Bosch", variant: .ghost)
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
                specRow("Component", value: "DSTile")
                specRow("Variants", value: "Outlined, Filled, Ghost")
                specRow("Sizes", value: "Regular (44pt), Small (28pt)")
                specRow("Image Size", value: "28pt × 28pt")
                specRow("Swatch Size", value: "~10pt (35% of image)")
                specRow("Content Spacing", value: "8pt (image-text gap)")
                specRow("Horizontal Padding", value: "8pt")
                specRow("Font", value: "THD SmVar Beta (Semibold, 14pt)")
                specRow("Border Radius", value: "8pt")
                specRow("Image Radius", value: "4pt")
            }
            .padding(TokensSpacing.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(containerGreige)
            )
            
            Text("Variant Guide")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
                .padding(.top, TokensSpacing.Spacing2)
            
            variantGuideTable
            
            Text("Code Example")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
                .padding(.top, TokensSpacing.Spacing2)
            
            codeExample("""
// Basic tile
DSTile(
    "Medium",
    variant: .outlined,
    image: Image("product")
)

// With selection and action
DSTile(
    "Red",
    variant: .filled,
    isSelected: true,
    image: Image("product"),
    swatch: Color.red
) {
    // Handle selection
}

// Unavailable tile
DSTile(
    "X-Large",
    variant: .outlined,
    isAvailable: false
)
""")
        }
    }
    
    private var variantGuideTable: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing1) {
            variantGuideRow("Outlined", usage: "Default selectors (sizes, options)")
            variantGuideRow("Filled", usage: "Product variants (colors, finishes)")
            variantGuideRow("Ghost", usage: "Filters, tags, minimal selections")
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }
    
    private func variantGuideRow(_ variant: String, usage: String) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(variant)
                .thdFont(.caption)
                .foregroundColor(textPrimary)
            Text(usage)
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

// MARK: - Supporting Views

/// Interactive tile selection example
private struct InteractiveTileExample: View {
    let title: String
    let options: [String]
    
    @State private var selectedOption: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            HStack {
                Text(title)
                    .thdFont(.bodySm)
                    .foregroundColor(TokensSemanticLight.TextOnContainerColorSecondary)
                
                Spacer()
                
                if let selectedOption {
                    Text("Selected: \(selectedOption)")
                        .thdFont(.caption)
                        .foregroundColor(TokensSemanticLight.TextOnContainerColorPrimary)
                }
            }
            
            HStack(spacing: TokensSpacing.Spacing2) {
                ForEach(options, id: \.self) { option in
                    DSTile(
                        option,
                        variant: .outlined,
                        isSelected: selectedOption == option,
                        image: Image("Acorn")
                    ) {
                        selectedOption = option
                    }
                }
                Spacer()
            }
        }
        .padding(TokensSpacing.Spacing2)
        .background(
            RoundedRectangle(cornerRadius: TokensSemanticLight.BorderRadiusSm)
                .fill(TokensSemanticLight.BackgroundContainerColorWhite)
        )
    }
}

/// Interactive tile with swatch selection example
private struct InteractiveTileWithSwatchExample: View {
    @State private var selectedColor: String?
    
    private let colors: [(name: String, color: Color)] = [
        ("Red", .red),
        ("Blue", .blue),
        ("Green", .green),
        ("Orange", .orange)
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            HStack {
                Text("Color Selection with Swatches")
                    .thdFont(.bodySm)
                    .foregroundColor(TokensSemanticLight.TextOnContainerColorSecondary)
                
                Spacer()
                
                if let selectedColor {
                    Text(selectedColor)
                        .thdFont(.caption)
                        .foregroundColor(TokensSemanticLight.TextOnContainerColorPrimary)
                }
            }
            
            HStack(spacing: TokensSpacing.Spacing2) {
                ForEach(colors, id: \.name) { item in
                    DSTile(
                        item.name,
                        variant: .filled,
                        isSelected: selectedColor == item.name,
                        image: Image("Acorn"),
                        swatch: item.color
                    ) {
                        selectedColor = item.name
                    }
                }
            }
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
    DSTileView()
}
