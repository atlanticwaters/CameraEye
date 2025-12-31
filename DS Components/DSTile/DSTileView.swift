import SwiftUI

// MARK: - DSTile Showcase View

/// Comprehensive showcase of the DSTile component
///
/// Demonstrates:
/// - All 3 variants (outlined, filled, ghost)
/// - Selection and disabled states
/// - Loading state
/// - Color swatches
/// - Image tiles
/// - Interactive selection behavior
/// - Dark mode support
/// - Real-world usage examples

struct DSTileView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing6) {

                // MARK: - Header Card
                VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                    Text("Tile")
                        .thdFont(.hero5)
                        .foregroundStyle(textPrimary)

                    Text("A selectable tile component for displaying options with optional media and text. Used for color swatches, size selectors, and option pickers.")
                        .thdFont(.bodyMd)
                        .foregroundStyle(textSecondary)
                }
                .padding(TokensCoreLight.Spacing4)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: borderRadiusXl)
                        .fill(containerWhite)
                )

                // MARK: - Content Card
                VStack(alignment: .leading, spacing: TokensCoreLight.Spacing6) {

                    // Tile Variants
                    tileVariantsSection

                    Divider().padding(.vertical, TokensCoreLight.Spacing2)

                    // Tile States
                    tileStatesSection

                    Divider().padding(.vertical, TokensCoreLight.Spacing2)

                    // Color Swatches
                    colorSwatchesSection

                    Divider().padding(.vertical, TokensCoreLight.Spacing2)

                    // Image Tiles
                    imageTilesSection

                    Divider().padding(.vertical, TokensCoreLight.Spacing2)

                    // Interactive Examples
                    interactiveSection

                    Divider().padding(.vertical, TokensCoreLight.Spacing2)

                    // Usage Examples
                    usageExamplesSection

                    Divider().padding(.vertical, TokensCoreLight.Spacing2)

                    // Specifications
                    specificationsSection
                }
                .padding(TokensCoreLight.Spacing4)
                .background(
                    RoundedRectangle(cornerRadius: borderRadiusXl)
                        .fill(containerWhite)
                )
            }
            .padding(TokensCoreLight.Spacing4)
            .padding(.top, TokensCoreLight.Spacing24)
            .padding(.bottom, TokensCoreLight.Spacing20)
        }
        .background(surfaceGreige)
        .applySoftScrollEdges()
    }

    // MARK: - Tile Variants Section

    private var tileVariantsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader(
                "Tile Variants",
                description: "3 visual style variants"
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                variantExample(
                    "Outlined",
                    description: "Border style with optional fill",
                    variant: .outlined
                )

                variantExample(
                    "Filled",
                    description: "Solid background fill",
                    variant: .filled
                )

                variantExample(
                    "Ghost",
                    description: "No background, minimal style",
                    variant: .ghost
                )
            }
        }
    }

    private func variantExample(_ title: String, description: String, variant: DSTileVariant) -> some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                Text(title)
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)

                Text(description)
                    .thdFont(.caption)
                    .foregroundStyle(textTertiary)
            }

            HStack(spacing: TokensCoreLight.Spacing2) {
                DSTile("Default", variant: variant) {}
                DSTile("Selected", variant: variant, isSelected: true) {}
                Spacer()
            }
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }

    // MARK: - Tile States Section

    private var tileStatesSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader(
                "Tile States",
                description: "Default, selected, disabled, and loading states"
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                stateExample(
                    "Default",
                    description: "Normal interactive state",
                    isSelected: false,
                    isDisabled: false,
                    isLoading: false
                )

                stateExample(
                    "Selected",
                    description: "Active/selected state with thicker border",
                    isSelected: true,
                    isDisabled: false,
                    isLoading: false
                )

                stateExample(
                    "Disabled",
                    description: "Non-interactive state",
                    isSelected: false,
                    isDisabled: true,
                    isLoading: false
                )

                stateExample(
                    "Loading",
                    description: "Loading state with spinner",
                    isSelected: false,
                    isDisabled: false,
                    isLoading: true
                )
            }
        }
    }

    private func stateExample(_ title: String, description: String, isSelected: Bool, isDisabled: Bool, isLoading: Bool) -> some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                Text(title)
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)

                Text(description)
                    .thdFont(.caption)
                    .foregroundStyle(textTertiary)
            }

            HStack(spacing: TokensCoreLight.Spacing2) {
                DSTile("Outlined", variant: .outlined, isSelected: isSelected, isDisabled: isDisabled, isLoading: isLoading) {}
                DSTile("Filled", variant: .filled, isSelected: isSelected, isDisabled: isDisabled, isLoading: isLoading) {}
                Spacer()
            }
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }

    // MARK: - Color Swatches Section

    private var colorSwatchesSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader(
                "Color Swatches",
                description: "Tiles with color indicators"
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                    VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                        Text("With Labels")
                            .thdFont(.bodySm)
                            .foregroundStyle(textPrimary)

                        Text("Color swatch with text label")
                            .thdFont(.caption)
                            .foregroundStyle(textTertiary)
                    }

                    HStack(spacing: TokensCoreLight.Spacing2) {
                        DSTile(color: .red, label: "Red") {}
                        DSTile(color: .blue, label: "Blue", isSelected: true) {}
                        DSTile(color: .green, label: "Green") {}
                        Spacer()
                    }
                }
                .padding(TokensCoreLight.Spacing3)
                .background(
                    RoundedRectangle(cornerRadius: borderRadiusLg)
                        .fill(containerGreige)
                )

                VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                    VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                        Text("Swatch Only")
                            .thdFont(.bodySm)
                            .foregroundStyle(textPrimary)

                        Text("Color swatch without label")
                            .thdFont(.caption)
                            .foregroundStyle(textTertiary)
                    }

                    HStack(spacing: TokensCoreLight.Spacing2) {
                        DSTile(color: .orange) {}
                        DSTile(color: .purple, isSelected: true) {}
                        DSTile(color: .brown) {}
                        DSTile(color: .cyan) {}
                        Spacer()
                    }
                }
                .padding(TokensCoreLight.Spacing3)
                .background(
                    RoundedRectangle(cornerRadius: borderRadiusLg)
                        .fill(containerGreige)
                )
            }
        }
    }

    // MARK: - Image Tiles Section

    private var imageTilesSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader(
                "Image Tiles",
                description: "Tiles with image thumbnails"
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                    Text("Product Images")
                        .thdFont(.bodySm)
                        .foregroundStyle(textPrimary)

                    Text("Image with optional label")
                        .thdFont(.caption)
                        .foregroundStyle(textTertiary)
                }

                HStack(spacing: TokensCoreLight.Spacing2) {
                    DSTile(image: Image(systemName: "photo.fill"), label: "Photo 1") {}
                    DSTile(image: Image(systemName: "photo.fill"), label: "Photo 2", isSelected: true) {}
                    DSTile(image: Image(systemName: "photo.fill"), label: "Photo 3") {}
                    Spacer()
                }
            }
            .padding(TokensCoreLight.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(containerGreige)
            )
        }
    }

    // MARK: - Interactive Section

    private var interactiveSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader("Interactive Examples", description: "Try selecting tiles")

            VStack(spacing: TokensCoreLight.Spacing4) {
                InteractiveSizeSelector()

                InteractiveColorSelector()

                InteractiveLoadingExample()
            }
            .padding(TokensCoreLight.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(containerGreige)
            )
        }
    }

    // MARK: - Usage Examples Section

    private var usageExamplesSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader("Usage Examples", description: "Real-world component usage")

            Text("Size Selection")
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)

            sizeSelectionExample

            Text("Color Selection")
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
                .padding(.top, TokensCoreLight.Spacing2)

            colorSelectionExample

            Text("Product Variants")
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
                .padding(.top, TokensCoreLight.Spacing2)

            productVariantsExample
        }
    }

    private var sizeSelectionExample: some View {
        HStack(spacing: TokensCoreLight.Spacing2) {
            DSTile("S", variant: .outlined) {}
            DSTile("M", variant: .outlined, isSelected: true) {}
            DSTile("L", variant: .outlined) {}
            DSTile("XL", variant: .outlined) {}
            DSTile("XXL", variant: .outlined, isDisabled: true) {}
            Spacer()
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerWhite)
        )
    }

    private var colorSelectionExample: some View {
        HStack(spacing: TokensCoreLight.Spacing2) {
            DSTile(color: .black, label: "Black", isSelected: true) {}
            DSTile(color: .white, label: "White") {}
            DSTile(color: .gray, label: "Gray") {}
            DSTile(color: .blue, label: "Navy") {}
            Spacer()
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerWhite)
        )
    }

    private var productVariantsExample: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            Text("Choose a finish:")
                .thdFont(.caption)
                .foregroundStyle(textTertiary)

            HStack(spacing: TokensCoreLight.Spacing2) {
                DSTile(image: Image(systemName: "square.fill"), label: "Matte") {}
                DSTile(image: Image(systemName: "sparkles"), label: "Gloss", isSelected: true) {}
                DSTile(image: Image(systemName: "wand.and.stars"), label: "Satin") {}
                Spacer()
            }
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerWhite)
        )
    }

    // MARK: - Specifications Section

    private var specificationsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader("Specifications", description: "Component details and dimensions")

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                specRow("Component", value: "DSTile")
                specRow("Variants", value: "3 (outlined, filled, ghost)")
                specRow("Min Height", value: "44pt")
                specRow("Horizontal Padding", value: "12pt")
                specRow("Vertical Padding", value: "8pt")
                specRow("Media Size", value: "28pt")
                specRow("Corner Radius", value: "Xl")
                specRow("Border Width", value: "1pt (2pt when selected)")
                specRow("Press Scale", value: "0.97x")
            }
            .padding(TokensCoreLight.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(containerGreige)
            )

            Text("Code Example")
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
                .padding(.top, TokensCoreLight.Spacing2)

            codeExample("""
// Simple text tile
DSTile("Small", isSelected: true) {
    print("Selected Small")
}

// Color swatch tile
DSTile(
    color: .red,
    label: "Red",
    isSelected: false
) {
    print("Selected Red")
}

// Image tile
DSTile(
    image: Image("product"),
    label: "Product",
    variant: .outlined,
    isSelected: true
) {
    print("Selected Product")
}

// Loading tile
DSTile("Processing", isLoading: true) {
    // Action
}
""")
        }
    }

    private func codeExample(_ code: String) -> some View {
        Text(code)
            .thdFont(.caption)
            .foregroundStyle(textSecondary)
            .font(.system(.caption, design: .monospaced))
            .padding(TokensCoreLight.Spacing3)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(codeBlockBg)
            )
    }

    private func specRow(_ label: String, value: String) -> some View {
        HStack {
            Text(label)
                .thdFont(.caption)
                .foregroundStyle(textTertiary)

            Spacer()

            Text(value)
                .thdFont(.caption)
                .foregroundStyle(textSecondary)
        }
    }

    // MARK: - Helper Methods

    private func sectionHeader(_ title: String, description: String) -> some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
            Text(title)
                .thdFont(.h3)
                .foregroundStyle(textPrimary)

            Text(description)
                .thdFont(.caption)
                .foregroundStyle(textTertiary)
        }
    }

    // MARK: - Theme-Aware Colors

    private var textPrimary: Color { tokens.TextOnContainerColorPrimary }
    private var textSecondary: Color { tokens.TextOnContainerColorSecondary }
    private var textTertiary: Color { tokens.TextOnContainerColorTertiary }
    private var containerWhite: Color { tokens.BackgroundContainerColorWhite }
    private var containerGreige: Color { tokens.BackgroundContainerColorGreige }
    private var codeBlockBg: Color { tokens.BackgroundContainerColorTransparent05 }
    private var surfaceGreige: Color { tokens.BackgroundSurfaceColorGreige }
    private var borderRadiusLg: CGFloat { tokens.BorderRadiusLg }
    private var borderRadiusXl: CGFloat { tokens.BorderRadiusXl }

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }
}

// MARK: - Supporting Views

/// Interactive size selector example
private struct InteractiveSizeSelector: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var selectedSize = "M"
    private let sizes = ["XS", "S", "M", "L", "XL"]

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            HStack {
                Text("Size Selector")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorSecondary)

                Spacer()

                Text("Selected: \(selectedSize)")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorPrimary)
            }

            HStack(spacing: TokensCoreLight.Spacing2) {
                ForEach(sizes, id: \.self) { size in
                    DSTile(size, variant: .outlined, isSelected: size == selectedSize) {
                        selectedSize = size
                    }
                }
                Spacer()
            }
        }
        .padding(TokensCoreLight.Spacing2)
        .background(
            RoundedRectangle(cornerRadius: tokens.BorderRadiusSm)
                .fill(tokens.BackgroundContainerColorWhite)
        )
    }
}

/// Interactive color selector example
private struct InteractiveColorSelector: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var selectedColor = "Blue"
    private let colors: [(String, Color)] = [
        ("Red", .red),
        ("Blue", .blue),
        ("Green", .green),
        ("Purple", .purple)
    ]

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            HStack {
                Text("Color Selector")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorSecondary)

                Spacer()

                Text("Selected: \(selectedColor)")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorPrimary)
            }

            HStack(spacing: TokensCoreLight.Spacing2) {
                ForEach(colors, id: \.0) { name, color in
                    DSTile(color: color, label: name, isSelected: name == selectedColor) {
                        selectedColor = name
                    }
                }
                Spacer()
            }
        }
        .padding(TokensCoreLight.Spacing2)
        .background(
            RoundedRectangle(cornerRadius: tokens.BorderRadiusSm)
                .fill(tokens.BackgroundContainerColorWhite)
        )
    }
}

/// Interactive loading example
private struct InteractiveLoadingExample: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var isLoading = false

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            HStack {
                Text("Loading State")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorSecondary)

                Spacer()

                Text(isLoading ? "Loading..." : "Ready")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorPrimary)
            }

            HStack(spacing: TokensCoreLight.Spacing2) {
                DSTile("Add to Cart", variant: .outlined, isLoading: isLoading) {
                    isLoading = true
                    Task {
                        try? await Task.sleep(for: .seconds(2))
                        await MainActor.run {
                            isLoading = false
                        }
                    }
                }
                Spacer()
            }
        }
        .padding(TokensCoreLight.Spacing2)
        .background(
            RoundedRectangle(cornerRadius: tokens.BorderRadiusSm)
                .fill(tokens.BackgroundContainerColorWhite)
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
    static var BackgroundContainerColorTransparent05: Color { get }
    static var BackgroundSurfaceColorGreige: Color { get }
    static var BorderRadiusSm: CGFloat { get }
    static var BorderRadiusLg: CGFloat { get }
    static var BorderRadiusXl: CGFloat { get }
}

extension TokensSemanticLight: TokenSemanticProtocol {}
extension TokensSemanticDark: TokenSemanticProtocol {}

// MARK: - Preview
#Preview {
    DSTileView()
}
