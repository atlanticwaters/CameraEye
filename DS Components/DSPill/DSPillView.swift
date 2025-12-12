import SwiftUI

// MARK: - DSPill Showcase View

/// Comprehensive showcase of the DSPill component
///
/// Demonstrates:
/// - Both styles (outlined, filled)
/// - All 4 sizes (extraLarge, large, medium, small)
/// - All states (default, pressed, selected, disabled)
/// - Leading media (icon, image, swatch)
/// - Trailing icons
/// - showBackground option
/// - Interactive examples
/// - Dark mode support
/// - Real-world usage examples

struct DSPillView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing6) {
                
                // MARK: - Header Card
                VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                    Text("Pill")
                        .thdFont(.hero5)
                        .foregroundColor(textPrimary)

                    Text("A pill-shaped selector component with 2 styles, 4 sizes, and support for icons, images, swatches, and multiple states.")
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
                    
                    // Pill Styles
                    pillStylesSection
                    
                    Divider().padding(.vertical, TokensSpacing.Spacing2)
                    
                    // Pill Sizes
                    pillSizesSection
                    
                    Divider().padding(.vertical, TokensSpacing.Spacing2)
                    
                    // Pill States
                    pillStatesSection
                    
                    Divider().padding(.vertical, TokensSpacing.Spacing2)
                    
                    // Leading Media
                    leadingMediaSection
                    
                    Divider().padding(.vertical, TokensSpacing.Spacing2)
                    
                    // Icon Combinations
                    iconCombinationsSection
                    
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
    
    // MARK: - Pill Styles Section
    
    private var pillStylesSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Pill Styles",
                description: "2 style variants for different contexts"
            )
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                styleExample(
                    "Outlined",
                    description: "Default style with border",
                    style: .outlined
                )
                
                styleExample(
                    "Filled",
                    description: "Filled background style",
                    style: .filled
                )
            }
        }
    }
    
    private func styleExample(_ title: String, description: String, style: DSPill.Style) -> some View {
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
                DSPill(
                    "Cumberland",
                    style: style,
                    size: .medium,
                    leadingIcon: Image(systemName: "mappin.circle.fill"),
                    trailingIcon: Image(systemName: "chevron.down")
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
    
    // MARK: - Pill Sizes Section
    
    private var pillSizesSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Pill Sizes",
                description: "Extra Large (44pt), Large (36pt), Medium (28pt), Small (20pt)"
            )
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                sizeExample("Extra Large", size: .extraLarge, heightLabel: "44pt")
                sizeExample("Large", size: .large, heightLabel: "36pt")
                sizeExample("Medium", size: .medium, heightLabel: "28pt")
                sizeExample("Small", size: .small, heightLabel: "20pt")
            }
        }
    }
    
    private func sizeExample(_ title: String, size: DSPill.Size, heightLabel: String) -> some View {
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
                DSPill(
                    "Cumberland",
                    style: .outlined,
                    size: size,
                    leadingIcon: Image(systemName: "mappin.circle.fill"),
                    trailingIcon: Image(systemName: "chevron.down")
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
    
    // MARK: - Pill States Section
    
    private var pillStatesSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Pill States",
                description: "Default, pressed, selected, and disabled states"
            )
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                stateExample(
                    "Default State",
                    description: "Normal interactive state",
                    state: .default
                )
                
                stateExample(
                    "Pressed State",
                    description: "Active press feedback",
                    state: .pressed
                )
                
                stateExample(
                    "Selected State",
                    description: "Active selection state",
                    state: .selected
                )
                
                stateExample(
                    "Disabled State",
                    description: "Non-interactive disabled state",
                    state: .disabled
                )
            }
        }
    }
    
    private func stateExample(_ title: String, description: String, state: DSPill.State) -> some View {
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
                DSPill(
                    "Outlined",
                    style: .outlined,
                    size: .medium,
                    state: state,
                    trailingIcon: Image(systemName: "chevron.down")
                )
                DSPill(
                    "Filled",
                    style: .filled,
                    size: .medium,
                    state: state,
                    trailingIcon: Image(systemName: "chevron.down")
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
    
    // MARK: - Leading Media Section
    
    private var leadingMediaSection: some View {
        let brandGradientStart = Color(red: 251/255, green: 162/255, blue: 104/255)
        let brandGradientEnd = Color(red: 249/255, green: 99/255, blue: 2/255)
        
        return VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Leading Media",
                description: "Icon, image, or color swatch options"
            )
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                mediaExample(
                    "Icon",
                    description: "SF Symbol or custom icon",
                    media: .icon(Image(systemName: "house.fill"))
                )
                
                mediaExample(
                    "Image",
                    description: "Photo or product image",
                    media: .image(Image("Fridge"))
                )
                
                mediaExample(
                    "Swatch",
                    description: "Color gradient indicator",
                    media: .swatch(brandGradientStart, brandGradientEnd)
                )
            }
        }
    }
    
    private func mediaExample(_ title: String, description: String, media: PillMedia) -> some View {
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
                DSPill(
                    "Cumberland",
                    style: .outlined,
                    size: .medium,
                    leadingMedia: media,
                    trailingIcon: Image(systemName: "chevron.down")
                )
                DSPill(
                    "Cumberland",
                    style: .filled,
                    size: .medium,
                    leadingMedia: media,
                    trailingIcon: Image(systemName: "chevron.down")
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
    
    // MARK: - Icon Combinations Section
    
    private var iconCombinationsSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Icon Combinations",
                description: "Leading, trailing, both, or no icons"
            )
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                iconComboExample(
                    "Leading Only",
                    description: "Icon before text",
                    leadingIcon: Image(systemName: "mappin.circle.fill"),
                    trailingIcon: nil
                )
                
                iconComboExample(
                    "Trailing Only",
                    description: "Icon after text",
                    leadingIcon: nil,
                    trailingIcon: Image(systemName: "chevron.down")
                )
                
                iconComboExample(
                    "Both Icons",
                    description: "Icons before and after text",
                    leadingIcon: Image(systemName: "mappin.circle.fill"),
                    trailingIcon: Image(systemName: "chevron.down")
                )
                
                iconComboExample(
                    "No Icons",
                    description: "Text only",
                    leadingIcon: nil,
                    trailingIcon: nil
                )
            }
        }
    }
    
    private func iconComboExample(_ title: String, description: String, leadingIcon: Image?, trailingIcon: Image?) -> some View {
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
                DSPill(
                    "Cumberland",
                    style: .outlined,
                    size: .medium,
                    leadingIcon: leadingIcon,
                    trailingIcon: trailingIcon
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
    
    // MARK: - Interactive Section
    
    private var interactiveSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader("Interactive Examples", description: "Try selecting pills")
            
            VStack(spacing: TokensSpacing.Spacing4) {
                InteractivePillExample()
                
                InteractivePillWithMediaExample()
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
            
            Text("Location Selector")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
            
            locationSelectorExample
            
            Text("Filter Pills")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
                .padding(.top, TokensSpacing.Spacing2)
            
            filterPillsExample
            
            Text("Category Navigation")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
                .padding(.top, TokensSpacing.Spacing2)
            
            categoryNavigationExample
        }
    }
    
    private var locationSelectorExample: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            Text("Select Your Store")
                .thdFont(.h6)
                .foregroundColor(textPrimary)
            
            DSPill(
                "Cumberland, GA",
                style: .filled,
                size: .large,
                leadingIcon: Image(systemName: "mappin.circle.fill"),
                trailingIcon: Image(systemName: "chevron.down")
            )
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerWhite)
        )
    }
    
    private var filterPillsExample: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            Text("Filters")
                .thdFont(.h6)
                .foregroundColor(textPrimary)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: TokensSpacing.Spacing2) {
                    DSPill("DEWALT", style: .filled, size: .small, state: .selected)
                    DSPill("Milwaukee", style: .outlined, size: .small)
                    DSPill("Makita", style: .outlined, size: .small)
                    DSPill("Bosch", style: .outlined, size: .small)
                    DSPill("Ryobi", style: .outlined, size: .small)
                }
            }
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerWhite)
        )
    }
    
    private var categoryNavigationExample: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            Text("Shop by Category")
                .thdFont(.h6)
                .foregroundColor(textPrimary)
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                HStack(spacing: TokensSpacing.Spacing2) {
                    DSPill(
                        "Tools",
                        style: .outlined,
                        size: .medium,
                        leadingIcon: Image(systemName: "hammer.fill")
                    )
                    DSPill(
                        "Appliances",
                        style: .outlined,
                        size: .medium,
                        leadingIcon: Image(systemName: "refrigerator.fill")
                    )
                }
                HStack(spacing: TokensSpacing.Spacing2) {
                    DSPill(
                        "Garden",
                        style: .outlined,
                        size: .medium,
                        leadingIcon: Image(systemName: "leaf.fill")
                    )
                    DSPill(
                        "Hardware",
                        style: .outlined,
                        size: .medium,
                        leadingIcon: Image(systemName: "wrench.fill")
                    )
                }
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
                specRow("Component", value: "DSPill")
                specRow("Styles", value: "Outlined, Filled")
                specRow("Sizes", value: "XL (44pt), L (36pt), M (28pt), S (20pt)")
                specRow("States", value: "Default, Pressed, Selected, Disabled")
                specRow("Leading Media", value: "Icon, Image, Swatch")
                specRow("Corner Radius", value: "Full (pill shape)")
                specRow("Font", value: "THD SmVar Beta (Semibold)")
                specRow("Press Scale", value: "0.98x")
                specRow("Animation Duration", value: "0.1s")
            }
            .padding(TokensSpacing.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(containerGreige)
            )
            
            Text("Style Guide")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
                .padding(.top, TokensSpacing.Spacing2)
            
            styleGuideTable
            
            Text("Code Example")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
                .padding(.top, TokensSpacing.Spacing2)
            
            codeExample("""
// Basic pill
DSPill(
    "Cumberland",
    style: .outlined,
    size: .medium,
    leadingIcon: Image(systemName: "mappin.circle.fill"),
    trailingIcon: Image(systemName: "chevron.down")
)

// With media and action
DSPill(
    "Location",
    style: .filled,
    size: .large,
    state: .selected,
    leadingMedia: .icon(Image(systemName: "mappin")),
    trailingIcon: Image(systemName: "chevron.down")
) {
    // Handle tap
}

// With color swatch
DSPill(
    "Orange",
    style: .outlined,
    leadingMedia: .swatch(startColor, endColor)
)
""")
        }
    }
    
    private var styleGuideTable: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing1) {
            styleGuideRow("Outlined", usage: "Default selection pills, filters")
            styleGuideRow("Filled", usage: "Prominent selections, location picker")
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }
    
    private func styleGuideRow(_ style: String, usage: String) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(style)
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

/// Interactive pill selection example
private struct InteractivePillExample: View {
    @State private var selectedLocation: String?
    
    private let locations = ["Atlanta", "Cumberland", "Charlotte", "Nashville"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            HStack {
                Text("Location Selector")
                    .thdFont(.bodySm)
                    .foregroundColor(TokensSemanticLight.TextOnContainerColorSecondary)
                
                Spacer()
                
                if let selectedLocation {
                    Text(selectedLocation)
                        .thdFont(.caption)
                        .foregroundColor(TokensSemanticLight.TextOnContainerColorPrimary)
                }
            }
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                ForEach(locations, id: \.self) { location in
                    DSPill(
                        location,
                        style: .outlined,
                        size: .medium,
                        state: selectedLocation == location ? .selected : .default,
                        leadingIcon: Image(systemName: "mappin.circle.fill"),
                        trailingIcon: Image(systemName: "chevron.down")
                    ) {
                        selectedLocation = location
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

/// Interactive pill with media selection example
private struct InteractivePillWithMediaExample: View {
    @State private var selectedBrand: String?
    
    private let brands = ["DEWALT", "Milwaukee", "Makita", "Bosch"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            HStack {
                Text("Brand Filter")
                    .thdFont(.bodySm)
                    .foregroundColor(TokensSemanticLight.TextOnContainerColorSecondary)
                
                Spacer()
                
                if let selectedBrand {
                    Text(selectedBrand)
                        .thdFont(.caption)
                        .foregroundColor(TokensSemanticLight.TextOnContainerColorPrimary)
                }
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: TokensSpacing.Spacing2) {
                    ForEach(brands, id: \.self) { brand in
                        DSPill(
                            brand,
                            style: .filled,
                            size: .small,
                            state: selectedBrand == brand ? .selected : .default
                        ) {
                            selectedBrand = brand
                        }
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
    DSPillView()
}
