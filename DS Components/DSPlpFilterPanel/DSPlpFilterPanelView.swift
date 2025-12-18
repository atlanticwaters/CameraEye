import SwiftUI

// MARK: - DSPlpFilterPanel Showcase View

/// Comprehensive showcase of the DSPlpFilterPanel component
///
/// Demonstrates:
/// - Full PLP Filter Panel with all elements
/// - Title display (category name)
/// - Style Pills with images for browsing product styles
/// - Results count display
/// - Filter Pills (top-level filter categories)
/// - Sub-Filter Pills (applied filters/quick filters)
/// - Interactive tap handlers
/// - Dark mode support
/// - Real-world usage examples

struct DSPlpFilterPanelView: View {
    @Environment(\.colorScheme) var colorScheme

    // Interactive state
    @State private var selectedStylePill: String? = nil
    @State private var selectedFilterPill: String? = nil
    @State private var appliedFilters: [String] = []

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing6) {

                // MARK: - Header Card
                VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                    Text("PLP Filter Panel")
                        .thdFont(.hero5)
                        .foregroundColor(textPrimary)

                    Text("Product Listing Page filter panel with category title, style pills for browsing product types, results count, and filter options for refining search results.")
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

                    // Title Examples
                    titleSection

                    Divider().padding(.vertical, TokensSpacing.Spacing2)

                    // Style Pills
                    stylePillsSection

                    Divider().padding(.vertical, TokensSpacing.Spacing2)

                    // Results Count
                    resultsCountSection

                    Divider().padding(.vertical, TokensSpacing.Spacing2)

                    // Filter Pills
                    filterPillsSection

                    Divider().padding(.vertical, TokensSpacing.Spacing2)

                    // Sub-Filter Pills
                    subFilterPillsSection

                    Divider().padding(.vertical, TokensSpacing.Spacing2)

                    // Interactive Example
                    interactiveSection

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

    // MARK: - Full Example Section

    private var fullExampleSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Full Example",
                description: "Complete PLP Filter Panel with all elements"
            )

            DSPlpFilterPanel(
                title: "REFRIGERATORS",
                stylePills: [
                    DSStylePillItem(text: "French Door\nRefrigerators", image: Image(systemName: "rectangle.split.3x1")),
                    DSStylePillItem(text: "Side by Side\nRefrigerators", image: Image(systemName: "rectangle.split.2x1")),
                    DSStylePillItem(text: "Top Freezer\nRefrigerators", image: Image(systemName: "rectangle.split.1x2")),
                    DSStylePillItem(text: "Bottom Freezer\nRefrigerators", image: Image(systemName: "rectangle.split.1x2.fill"))
                ],
                resultsCount: "5,007 RESULTS",
                filterPills: [
                    DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle")),
                    DSFilterPillItem(text: "Category"),
                    DSFilterPillItem(text: "Brand"),
                    DSFilterPillItem(text: "Price"),
                    DSFilterPillItem(text: "Rating")
                ],
                subFilterPills: [
                    DSFilterPillItem(text: "In Stock At Store Today"),
                    DSFilterPillItem(text: "Free 1-2 Day Delivery"),
                    DSFilterPillItem(text: "Samsung"),
                    DSFilterPillItem(text: "$500 - $1000")
                ],
                onStylePillTap: { item in print("Style: \(item.text)") },
                onFilterPillTap: { item in print("Filter: \(item.text)") },
                onSubFilterPillTap: { item in print("Sub-filter: \(item.text)") }
            )
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
                description: "The building blocks of the PLP Filter Panel"
            )

            VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                anatomyRow("1. Title", description: "Category name in Display font (H1 size, bold)")
                anatomyRow("2. Style Pills", description: "Large horizontal scrolling pills with images for product types")
                anatomyRow("3. Results Count", description: "Number of results in Display font (H3 size, semibold)")
                anatomyRow("4. Filter Pills", description: "Top-level filter categories with optional icons")
                anatomyRow("5. Sub-Filter Pills", description: "Applied filters or quick filter options")
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

    // MARK: - Title Section

    private var titleSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Title",
                description: "Category name displayed prominently at the top"
            )

            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                titleExample("Short Title", title: "DRILLS")
                titleExample("Medium Title", title: "REFRIGERATORS")
                titleExample("Long Title", title: "OUTDOOR POWER EQUIPMENT")
            }
        }
    }

    private func titleExample(_ label: String, title: String) -> some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            Text(label)
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)

            DSPlpFilterPanel(
                title: title,
                stylePills: [],
                resultsCount: nil,
                filterPills: [],
                subFilterPills: []
            )
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }

    // MARK: - Style Pills Section

    private var stylePillsSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Style Pills",
                description: "Large pills with images for browsing product styles"
            )

            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                stylePillExample(
                    "With SF Symbols",
                    pills: [
                        DSStylePillItem(text: "French Door", image: Image(systemName: "rectangle.split.3x1")),
                        DSStylePillItem(text: "Side by Side", image: Image(systemName: "rectangle.split.2x1")),
                        DSStylePillItem(text: "Top Freezer", image: Image(systemName: "rectangle.split.1x2"))
                    ]
                )

                stylePillExample(
                    "Text Only (No Images)",
                    pills: [
                        DSStylePillItem(text: "Power Drills"),
                        DSStylePillItem(text: "Impact Drivers"),
                        DSStylePillItem(text: "Hammer Drills")
                    ]
                )

                stylePillExample(
                    "Multiline Text",
                    pills: [
                        DSStylePillItem(text: "French Door\nRefrigerators", image: Image(systemName: "rectangle.split.3x1")),
                        DSStylePillItem(text: "Counter-Depth\nRefrigerators", image: Image(systemName: "rectangle"))
                    ]
                )
            }
        }
    }

    private func stylePillExample(_ label: String, pills: [DSStylePillItem]) -> some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            Text(label)
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: TokensSpacing.Spacing3) {
                    ForEach(pills) { pill in
                        stylePillPreview(pill)
                    }
                }
            }
            .frame(height: 68)
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }

    private func stylePillPreview(_ item: DSStylePillItem) -> some View {
        HStack(spacing: 4) {
            if let image = item.image {
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                    .foregroundColor(textPrimary)
            }

            Text(item.text)
                .thdFont(.bodySm)
                .foregroundColor(textPrimary)
                .multilineTextAlignment(.leading)
        }
        .padding(.horizontal, TokensSpacing.Spacing4)
        .padding(.vertical, TokensSpacing.Spacing3)
        .frame(height: 68)
        .background(
            Capsule()
                .fill(Color.gray.opacity(0.1))
        )
    }

    // MARK: - Results Count Section

    private var resultsCountSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Results Count",
                description: "Display of total matching products"
            )

            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                resultsCountExample("Many Results", count: "5,007 RESULTS")
                resultsCountExample("Few Results", count: "23 RESULTS")
                resultsCountExample("Single Result", count: "1 RESULT")
                resultsCountExample("No Results", count: "0 RESULTS")
            }
        }
    }

    private func resultsCountExample(_ label: String, count: String) -> some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            Text(label)
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)

            Text(count)
                .font(.custom(DesignSystemGlobal.FontFamilyDisplay, size: DesignSystemGlobal.FontSizeH3))
                .fontWeight(.semibold)
                .foregroundColor(textPrimary)
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }

    // MARK: - Filter Pills Section

    private var filterPillsSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Filter Pills",
                description: "Top-level filter categories"
            )

            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                filterPillExample(
                    "With Icon",
                    pills: [
                        DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle"))
                    ]
                )

                filterPillExample(
                    "Text Only",
                    pills: [
                        DSFilterPillItem(text: "Category"),
                        DSFilterPillItem(text: "Brand"),
                        DSFilterPillItem(text: "Price"),
                        DSFilterPillItem(text: "Rating")
                    ]
                )

                filterPillExample(
                    "Mixed",
                    pills: [
                        DSFilterPillItem(text: "Sort", icon: Image(systemName: "arrow.up.arrow.down")),
                        DSFilterPillItem(text: "Color"),
                        DSFilterPillItem(text: "Size"),
                        DSFilterPillItem(text: "Features")
                    ]
                )
            }
        }
    }

    private func filterPillExample(_ label: String, pills: [DSFilterPillItem]) -> some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            Text(label)
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: TokensSpacing.Spacing2) {
                    ForEach(pills) { pill in
                        filterPillPreview(pill)
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

    private func filterPillPreview(_ item: DSFilterPillItem) -> some View {
        HStack(spacing: 4) {
            if let icon = item.icon {
                icon
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 14)
                    .foregroundColor(textPrimary)
            }

            Text(item.text)
                .thdFont(.bodySm)
                .foregroundColor(textPrimary)
        }
        .padding(.horizontal, TokensSpacing.Spacing3)
        .padding(.vertical, TokensSpacing.Spacing3)
        .frame(height: 44)
    }

    // MARK: - Sub-Filter Pills Section

    private var subFilterPillsSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Sub-Filter Pills",
                description: "Applied filters or quick filter options"
            )

            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                subFilterPillExample(
                    "Availability Filters",
                    pills: [
                        DSFilterPillItem(text: "In Stock At Store Today"),
                        DSFilterPillItem(text: "Free 1-2 Day Delivery")
                    ]
                )

                subFilterPillExample(
                    "Applied Filters",
                    pills: [
                        DSFilterPillItem(text: "Samsung"),
                        DSFilterPillItem(text: "LG"),
                        DSFilterPillItem(text: "$500 - $1000"),
                        DSFilterPillItem(text: "4+ Stars")
                    ]
                )

                subFilterPillExample(
                    "Feature Filters",
                    pills: [
                        DSFilterPillItem(text: "Ice Maker"),
                        DSFilterPillItem(text: "Water Dispenser"),
                        DSFilterPillItem(text: "Smart Home Compatible")
                    ]
                )
            }
        }
    }

    private func subFilterPillExample(_ label: String, pills: [DSFilterPillItem]) -> some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            Text(label)
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: TokensSpacing.Spacing2) {
                    ForEach(pills) { pill in
                        subFilterPillPreview(pill)
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

    private func subFilterPillPreview(_ item: DSFilterPillItem) -> some View {
        Text(item.text)
            .thdFont(.bodySm)
            .foregroundColor(textPrimary)
            .padding(.horizontal, TokensSpacing.Spacing4)
            .padding(.vertical, TokensSpacing.Spacing2)
            .frame(minHeight: 36)
            .background(
                Capsule()
                    .fill(Color.gray.opacity(0.1))
            )
    }

    // MARK: - Interactive Section

    private var interactiveSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Interactive Example",
                description: "Try tapping the pills to see interactions"
            )

            VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                // Status display
                VStack(alignment: .leading, spacing: 4) {
                    if let style = selectedStylePill {
                        Text("Selected Style: \(style)")
                            .thdFont(.bodySm)
                            .foregroundColor(.orange)
                    }
                    if let filter = selectedFilterPill {
                        Text("Selected Filter: \(filter)")
                            .thdFont(.bodySm)
                            .foregroundColor(.blue)
                    }
                    if !appliedFilters.isEmpty {
                        Text("Applied: \(appliedFilters.joined(separator: ", "))")
                            .thdFont(.bodySm)
                            .foregroundColor(.green)
                    }
                }
                .padding(TokensSpacing.Spacing2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(containerWhite)
                )

                // Interactive panel
                DSPlpFilterPanel(
                    title: "POWER TOOLS",
                    stylePills: [
                        DSStylePillItem(text: "Drills", image: Image(systemName: "screwdriver")),
                        DSStylePillItem(text: "Saws", image: Image(systemName: "scissors")),
                        DSStylePillItem(text: "Sanders", image: Image(systemName: "circle.dotted"))
                    ],
                    resultsCount: "1,234 RESULTS",
                    filterPills: [
                        DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle")),
                        DSFilterPillItem(text: "Brand"),
                        DSFilterPillItem(text: "Power Type")
                    ],
                    subFilterPills: [
                        DSFilterPillItem(text: "Cordless"),
                        DSFilterPillItem(text: "DeWalt"),
                        DSFilterPillItem(text: "Milwaukee")
                    ],
                    onStylePillTap: { item in
                        selectedStylePill = item.text.replacingOccurrences(of: "\n", with: " ")
                    },
                    onFilterPillTap: { item in
                        selectedFilterPill = item.text
                    },
                    onSubFilterPillTap: { item in
                        if appliedFilters.contains(item.text) {
                            appliedFilters.removeAll { $0 == item.text }
                        } else {
                            appliedFilters.append(item.text)
                        }
                    }
                )

                // Reset button
                DSButton("Reset Selections", style: .outlined, size: .medium) {
                    selectedStylePill = nil
                    selectedFilterPill = nil
                    appliedFilters = []
                }
            }
            .padding(TokensSpacing.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(containerGreige)
            )
        }
    }

    // MARK: - Specifications Section

    private var specificationsSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader("Specifications", description: "Component details and properties")

            VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                specRow("Component", value: "DSPlpFilterPanel")
                specRow("Title Font", value: "Display, H1, Bold")
                specRow("Results Font", value: "Display, H3, Semibold")
                specRow("Pill Font", value: "Informational, Body Sm")
                specRow("Style Pill Height", value: "68pt")
                specRow("Filter Pill Height", value: "44pt")
                specRow("Sub-Filter Pill Height", value: "36pt (min)")
                specRow("Vertical Padding", value: "16pt")
                specRow("Section Spacing", value: "24pt")
                specRow("Pill Spacing", value: "8-12pt")
            }
            .padding(TokensSpacing.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(containerGreige)
            )

            Text("Data Types")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
                .padding(.top, TokensSpacing.Spacing2)

            dataTypesTable

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
// Basic usage
DSPlpFilterPanel(
    title: "REFRIGERATORS",
    stylePills: [
        DSStylePillItem(
            text: "French Door\\nRefrigerators",
            image: Image("french-door")
        ),
        DSStylePillItem(
            text: "Side by Side",
            imageURL: "https://example.com/image.jpg"
        )
    ],
    resultsCount: "5,007 RESULTS",
    filterPills: [
        DSFilterPillItem(
            text: "All Filters",
            icon: Image(systemName: "line.3.horizontal.decrease.circle")
        ),
        DSFilterPillItem(text: "Category"),
        DSFilterPillItem(text: "Brand")
    ],
    subFilterPills: [
        DSFilterPillItem(text: "In Stock At Store Today"),
        DSFilterPillItem(text: "Free Delivery")
    ],
    onStylePillTap: { item in
        print("Tapped: \\(item.text)")
    },
    onFilterPillTap: { item in
        print("Filter: \\(item.text)")
    },
    onSubFilterPillTap: { item in
        print("Sub-filter: \\(item.text)")
    }
)
""")
        }
    }

    private var dataTypesTable: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            Text("DSStylePillItem")
                .thdFont(.bodySm)
                .foregroundColor(textPrimary)

            VStack(alignment: .leading, spacing: TokensSpacing.Spacing1) {
                propertyRow("id", type: "String", description: "Unique identifier (auto-generated)")
                propertyRow("text", type: "String", description: "Display text (supports multiline with \\n)")
                propertyRow("image", type: "Image?", description: "Local image or SF Symbol")
                propertyRow("imageURL", type: "String?", description: "Remote or local image URL")
            }
            .padding(.leading, TokensSpacing.Spacing2)

            Text("DSFilterPillItem")
                .thdFont(.bodySm)
                .foregroundColor(textPrimary)
                .padding(.top, TokensSpacing.Spacing2)

            VStack(alignment: .leading, spacing: TokensSpacing.Spacing1) {
                propertyRow("id", type: "String", description: "Unique identifier (auto-generated)")
                propertyRow("text", type: "String", description: "Filter label text")
                propertyRow("icon", type: "Image?", description: "Optional leading icon")
            }
            .padding(.leading, TokensSpacing.Spacing2)
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }

    private var propertiesTable: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing1) {
            propertyRow("title", type: "String", description: "Category name displayed at top")
            propertyRow("stylePills", type: "[DSStylePillItem]", description: "Style browsing pills with images")
            propertyRow("resultsCount", type: "String?", description: "Results count text (e.g., \"5,007 RESULTS\")")
            propertyRow("filterPills", type: "[DSFilterPillItem]", description: "Top-level filter categories")
            propertyRow("subFilterPills", type: "[DSFilterPillItem]", description: "Applied/quick filter pills")
            propertyRow("onStylePillTap", type: "((DSStylePillItem) -> Void)?", description: "Style pill tap handler")
            propertyRow("onFilterPillTap", type: "((DSFilterPillItem) -> Void)?", description: "Filter pill tap handler")
            propertyRow("onSubFilterPillTap", type: "((DSFilterPillItem) -> Void)?", description: "Sub-filter tap handler")
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

    private var tokens: any DSPlpFilterPanelTokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }
}

// MARK: - Token Protocol Helper
private protocol DSPlpFilterPanelTokenSemanticProtocol {
    static var TextOnContainerColorPrimary: Color { get }
    static var TextOnContainerColorSecondary: Color { get }
    static var TextOnContainerColorTertiary: Color { get }
    static var BackgroundContainerColorWhite: Color { get }
    static var BackgroundContainerColorGreige: Color { get }
    static var BackgroundSurfaceColorGreige: Color { get }
    static var BorderRadiusLg: CGFloat { get }
    static var BorderRadiusXl: CGFloat { get }
}

extension TokensSemanticLight: DSPlpFilterPanelTokenSemanticProtocol {}
extension TokensSemanticDark: DSPlpFilterPanelTokenSemanticProtocol {}

// MARK: - Preview
#Preview {
    DSPlpFilterPanelView()
}
