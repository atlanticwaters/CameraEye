import SwiftUI

// MARK: - DSPill Showcase View

/// Comprehensive showcase of the DSPill component
///
/// Demonstrates:
/// - All 2 styles (outlined, filled)
/// - All 4 sizes (sm, md, lg, xl)
/// - Selection and disabled states
/// - Leading/trailing icons
/// - Color swatches and images
/// - Interactive selection behavior
/// - Dark mode support
/// - Real-world usage examples

struct DSPillView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing6) {

                // MARK: - Header Card
                VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                    Text("Pill")
                        .thdFont(.hero5)
                        .foregroundStyle(textPrimary)

                    Text("A pill component for displaying selectable tags, filters, and chips. Supports icons, color swatches, images, and various interaction states.")
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

                    // Pill Styles
                    pillStylesSection

                    Divider().padding(.vertical, TokensCoreLight.Spacing2)

                    // Pill Sizes
                    pillSizesSection

                    Divider().padding(.vertical, TokensCoreLight.Spacing2)

                    // Pill States
                    pillStatesSection

                    Divider().padding(.vertical, TokensCoreLight.Spacing2)

                    // Icons
                    iconsSection

                    Divider().padding(.vertical, TokensCoreLight.Spacing2)

                    // Color Swatches
                    colorSwatchesSection

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

    // MARK: - Pill Styles Section

    private var pillStylesSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader(
                "Pill Styles",
                description: "2 visual style variants"
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                styleExample(
                    "Outlined",
                    description: "Border style with transparent or subtle background",
                    style: .outlined
                )

                styleExample(
                    "Filled",
                    description: "Solid background for selected/active states",
                    style: .filled
                )
            }
        }
    }

    private func styleExample(_ title: String, description: String, style: DSPillStyle) -> some View {
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
                DSPill("Category", style: style, size: .lg) {}
                DSPill("Filter", style: style, size: .lg, isSelected: true) {}
                Spacer()
            }
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }

    // MARK: - Pill Sizes Section

    private var pillSizesSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader(
                "Pill Sizes",
                description: "Small (24pt), Medium (28pt), Large (32pt), XL (40pt)"
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                sizeExample("Small", description: "24pt height", size: .sm)
                sizeExample("Medium", description: "28pt height", size: .md)
                sizeExample("Large", description: "32pt height", size: .lg)
                sizeExample("Extra Large", description: "40pt height", size: .xl)
            }
        }
    }

    private func sizeExample(_ title: String, description: String, size: DSPillSize) -> some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            HStack {
                Text(title)
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)

                Spacer()

                Text(description)
                    .thdFont(.caption)
                    .foregroundStyle(textTertiary)
            }

            HStack(spacing: TokensCoreLight.Spacing2) {
                DSPill("Outlined", style: .outlined, size: size) {}
                DSPill("Selected", style: .filled, size: size, isSelected: true) {}
                Spacer()
            }
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }

    // MARK: - Pill States Section

    private var pillStatesSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader(
                "Pill States",
                description: "Default, selected, and disabled states"
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                stateExample(
                    "Default",
                    description: "Normal interactive state",
                    isSelected: false,
                    isDisabled: false
                )

                stateExample(
                    "Selected",
                    description: "Active/selected state",
                    isSelected: true,
                    isDisabled: false
                )

                stateExample(
                    "Disabled",
                    description: "Non-interactive state",
                    isSelected: false,
                    isDisabled: true
                )
            }
        }
    }

    private func stateExample(_ title: String, description: String, isSelected: Bool, isDisabled: Bool) -> some View {
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
                DSPill("Outlined", style: .outlined, size: .lg, isSelected: isSelected, isDisabled: isDisabled) {}
                DSPill("Filled", style: .filled, size: .lg, isSelected: isSelected, isDisabled: isDisabled) {}
                Spacer()
            }
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }

    // MARK: - Icons Section

    private var iconsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader(
                "Icons",
                description: "Leading and trailing icons"
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                iconExample(
                    "Leading Icon",
                    description: "Icon before text",
                    leadingIcon: Image(systemName: "building.2"),
                    trailingIcon: nil
                )

                iconExample(
                    "Trailing Icon",
                    description: "Icon after text (e.g., dropdown)",
                    leadingIcon: nil,
                    trailingIcon: Image(systemName: "chevron.down")
                )

                iconExample(
                    "Both Icons",
                    description: "Icons before and after text",
                    leadingIcon: Image(systemName: "tag"),
                    trailingIcon: Image(systemName: "xmark")
                )
            }
        }
    }

    private func iconExample(_ title: String, description: String, leadingIcon: Image?, trailingIcon: Image?) -> some View {
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
                DSPill("Store", leadingIcon: leadingIcon, trailingIcon: trailingIcon, style: .outlined, size: .lg) {}
                DSPill("Active", leadingIcon: leadingIcon, trailingIcon: trailingIcon, style: .filled, size: .lg, isSelected: true) {}
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
                description: "Pills with color indicators"
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                    Text("Color Swatch Pills")
                        .thdFont(.bodySm)
                        .foregroundStyle(textPrimary)

                    Text("Use swatchColor parameter for color selection")
                        .thdFont(.caption)
                        .foregroundStyle(textTertiary)
                }

                HStack(spacing: TokensCoreLight.Spacing2) {
                    DSPill("Red", swatchColor: .red, style: .outlined, size: .lg) {}
                    DSPill("Blue", swatchColor: .blue, style: .outlined, size: .lg, isSelected: true) {}
                    DSPill("Green", swatchColor: .green, style: .outlined, size: .lg) {}
                    Spacer()
                }

                HStack(spacing: TokensCoreLight.Spacing2) {
                    DSPill(swatchColor: .orange, style: .outlined, size: .lg) {}
                    DSPill(swatchColor: .purple, style: .outlined, size: .lg, isSelected: true) {}
                    DSPill(swatchColor: .brown, style: .outlined, size: .lg) {}
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
            sectionHeader("Interactive Examples", description: "Try selecting pills")

            VStack(spacing: TokensCoreLight.Spacing4) {
                InteractiveSingleSelect()

                InteractiveMultiSelect()

                InteractiveFilterChips()
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

            Text("Category Filters")
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)

            categoryFiltersExample

            Text("Size Selection")
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
                .padding(.top, TokensCoreLight.Spacing2)

            sizeSelectionExample

            Text("Applied Filters")
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
                .padding(.top, TokensCoreLight.Spacing2)

            appliedFiltersExample
        }
    }

    private var categoryFiltersExample: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: TokensCoreLight.Spacing2) {
                DSPill("All", style: .filled, size: .lg, isSelected: true) {}
                DSPill("Power Tools", style: .outlined, size: .lg) {}
                DSPill("Hand Tools", style: .outlined, size: .lg) {}
                DSPill("Outdoor", style: .outlined, size: .lg) {}
                DSPill("Paint", style: .outlined, size: .lg) {}
            }
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerWhite)
        )
    }

    private var sizeSelectionExample: some View {
        HStack(spacing: TokensCoreLight.Spacing2) {
            DSPill("S", style: .outlined, size: .md) {}
            DSPill("M", style: .outlined, size: .md, isSelected: true) {}
            DSPill("L", style: .outlined, size: .md) {}
            DSPill("XL", style: .outlined, size: .md) {}
            DSPill("XXL", style: .outlined, size: .md, isDisabled: true) {}
            Spacer()
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerWhite)
        )
    }

    private var appliedFiltersExample: some View {
        HStack(spacing: TokensCoreLight.Spacing2) {
            DSPill("In Stock", trailingIcon: Image(systemName: "xmark"), style: .filled, size: .sm, isSelected: true) {}
            DSPill("$50-$100", trailingIcon: Image(systemName: "xmark"), style: .filled, size: .sm, isSelected: true) {}
            DSPill("4+ Stars", trailingIcon: Image(systemName: "xmark"), style: .filled, size: .sm, isSelected: true) {}
            Spacer()
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
                specRow("Component", value: "DSPill")
                specRow("Styles", value: "2 (outlined, filled)")
                specRow("Sizes", value: "4 (sm, md, lg, xl)")
                specRow("Small Height", value: "24pt")
                specRow("Medium Height", value: "28pt")
                specRow("Large Height", value: "32pt")
                specRow("XL Height", value: "40pt")
                specRow("Corner Radius", value: "height / 2 (pill shape)")
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
// Simple pill
DSPill("Category") {
    print("Tapped")
}

// Pill with icons
DSPill(
    "Store",
    leadingIcon: Image(systemName: "building.2"),
    trailingIcon: Image(systemName: "chevron.down"),
    style: .outlined,
    size: .lg
) {
    print("Tapped")
}

// Color swatch pill
DSPill("Red", swatchColor: .red, isSelected: true) {
    print("Selected")
}

// Selected pill
DSPill("Active", style: .filled, isSelected: true) {
    print("Tapped")
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
    private var surfaceGreige: Color { tokens.BackgroundSurfaceColorGreige }
    private var codeBlockBg: Color { tokens.BackgroundContainerColorTransparent05 }
    private var borderRadiusLg: CGFloat { tokens.BorderRadiusLg }
    private var borderRadiusXl: CGFloat { tokens.BorderRadiusXl }

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }
}

// MARK: - Supporting Views

/// Interactive single select example
private struct InteractiveSingleSelect: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var selectedIndex = 0
    private let options = ["All", "New", "Sale", "Popular"]

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            HStack {
                Text("Single Select")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorSecondary)

                Spacer()

                Text("Selected: \(options[selectedIndex])")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorPrimary)
            }

            HStack(spacing: TokensCoreLight.Spacing2) {
                ForEach(options.indices, id: \.self) { index in
                    DSPill(
                        options[index],
                        style: selectedIndex == index ? .filled : .outlined,
                        size: .lg,
                        isSelected: selectedIndex == index
                    ) {
                        selectedIndex = index
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

/// Interactive multi-select example
private struct InteractiveMultiSelect: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var selectedIndices: Set<Int> = [0, 2]
    private let options = ["Power Tools", "Hand Tools", "Outdoor", "Paint"]

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            HStack {
                Text("Multi-Select")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorSecondary)

                Spacer()

                Text("\(selectedIndices.count) selected")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorPrimary)
            }

            HStack(spacing: TokensCoreLight.Spacing2) {
                ForEach(options.indices, id: \.self) { index in
                    let isSelected = selectedIndices.contains(index)
                    DSPill(
                        options[index],
                        style: isSelected ? .filled : .outlined,
                        size: .md,
                        isSelected: isSelected
                    ) {
                        if isSelected {
                            selectedIndices.remove(index)
                        } else {
                            selectedIndices.insert(index)
                        }
                    }
                }
            }
        }
        .padding(TokensCoreLight.Spacing2)
        .background(
            RoundedRectangle(cornerRadius: tokens.BorderRadiusSm)
                .fill(tokens.BackgroundContainerColorWhite)
        )
    }
}

/// Interactive filter chips with removal
private struct InteractiveFilterChips: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var filters = ["In Stock", "$50-$100", "4+ Stars", "Free Shipping"]

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            HStack {
                Text("Removable Filters")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorSecondary)

                Spacer()

                Text("\(filters.count) active")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorPrimary)
            }

            if filters.isEmpty {
                Text("No filters applied")
                    .thdFont(.caption)
                    .foregroundStyle(tokens.TextOnContainerColorTertiary)
            } else {
                HStack(spacing: TokensCoreLight.Spacing2) {
                    ForEach(filters, id: \.self) { filter in
                        DSPill(
                            filter,
                            trailingIcon: Image(systemName: "xmark"),
                            style: .filled,
                            size: .sm,
                            isSelected: true
                        ) {
                            filters.removeAll { $0 == filter }
                        }
                    }
                }
            }

            if filters.count < 4 {
                DSButton("Reset Filters", style: .ghost, size: .small) {
                    filters = ["In Stock", "$50-$100", "4+ Stars", "Free Shipping"]
                }
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
    static var BackgroundSurfaceColorGreige: Color { get }
    static var BackgroundContainerColorTransparent05: Color { get }
    static var BorderRadiusSm: CGFloat { get }
    static var BorderRadiusLg: CGFloat { get }
    static var BorderRadiusXl: CGFloat { get }
}

extension TokensSemanticLight: TokenSemanticProtocol {}
extension TokensSemanticDark: TokenSemanticProtocol {}

// MARK: - Preview
#Preview {
    DSPillView()
}
