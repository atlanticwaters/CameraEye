import SwiftUI

// MARK: - DSPLPFilterSheet Showcase View

/// Comprehensive showcase of the DSPLPFilterSheet component.
///
/// Demonstrates:
/// - Filter categories (expandable/collapsible)
/// - Filter options with checkboxes
/// - Selected state indicators
/// - Color swatches in options
/// - View results button
/// - Clear all functionality
/// - Interactive example
/// - Usage examples

struct DSPLPFilterSheetView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing6) {
                // Header Card
                headerCard

                // Content Card with all sections
                contentCard
            }
            .padding(TokensCoreLight.Spacing4)
            .padding(.top, TokensCoreLight.Spacing24)
            .padding(.bottom, TokensCoreLight.Spacing20)
        }
        .background(surfaceGreige)
        .applySoftScrollEdges()
    }

    // MARK: - Header Card

    private var headerCard: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            Text("DSPLPFilterSheet")
                .thdFont(.h3)
                .foregroundStyle(textPrimary)

            Text("A full-screen filter sheet for the PLP (Product Listing Page) experience. Displays expandable filter categories with checkbox options, supporting color swatches and result counts.")
                .thdFont(.bodyMd)
                .foregroundStyle(textSecondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(TokensCoreLight.Spacing4)
        .background(surfaceWhite)
        .clipShape(.rect(cornerRadius: TokensCoreLight.Spacing3))
    }

    // MARK: - Content Card

    private var contentCard: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Categories Section
            categoriesSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Options Section
            optionsSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Color Swatches Section
            colorSwatchesSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Interactive Example Section
            interactiveSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Specifications Section
            specificationsSection
        }
        .background(surfaceWhite)
        .clipShape(.rect(cornerRadius: TokensCoreLight.Spacing3))
    }

    // MARK: - Categories Section

    private var categoriesSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Filter Categories",
                description: "Expandable categories with selection count."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                Text("Collapsed Category")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                categoryTilePreview(
                    title: "Brand",
                    selectedCount: 0,
                    isExpanded: false
                )

                Text("With Selection Count")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                categoryTilePreview(
                    title: "Get it Fast",
                    selectedCount: 2,
                    isExpanded: false
                )

                Text("Expanded Category")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                categoryTilePreview(
                    title: "Price",
                    selectedCount: 1,
                    isExpanded: true
                )
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    @ViewBuilder
    private func categoryTilePreview(title: String, selectedCount: Int, isExpanded: Bool) -> some View {
        HStack {
            Text(title)
                .thdFont(.bodyMd)
                .foregroundStyle(textPrimary)

            if selectedCount > 0 {
                Text("(\(selectedCount))")
                    .thdFont(.bodySm)
                    .foregroundStyle(textSecondary)
            }

            Spacer()

            Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
        }
        .padding(.horizontal, TokensCoreLight.Spacing4)
        .padding(.vertical, TokensCoreLight.Spacing4)
        .background(surfaceGreige)
        .clipShape(.rect(cornerRadius: TokensCoreLight.Spacing2))
    }

    // MARK: - Options Section

    private var optionsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Filter Options",
                description: "Checkbox options with labels and counts."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                Text("Unselected Option")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                optionTilePreview(
                    label: "In Stock Today",
                    count: 45,
                    isSelected: false
                )

                Text("Selected Option")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                optionTilePreview(
                    label: "Free Delivery",
                    count: 38,
                    isSelected: true
                )

                Text("Without Count")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                optionTilePreview(
                    label: "On Sale",
                    count: nil,
                    isSelected: false
                )
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    @ViewBuilder
    private func optionTilePreview(label: String, count: Int?, isSelected: Bool) -> some View {
        HStack(spacing: TokensCoreLight.Spacing3) {
            // Checkbox
            ZStack {
                RoundedRectangle(cornerRadius: TokensCoreLight.Spacing1)
                    .stroke(isSelected ? brandColor : borderDefault, lineWidth: isSelected ? 0 : 1)
                    .background(
                        RoundedRectangle(cornerRadius: TokensCoreLight.Spacing1)
                            .fill(isSelected ? brandColor : Color.clear)
                    )
                    .frame(width: TokensCoreLight.Spacing5, height: TokensCoreLight.Spacing5)

                if isSelected {
                    Image(systemName: "checkmark")
                        .thdFont(.caption)
                        .bold()
                        .foregroundStyle(checkmarkWhite)
                }
            }

            Text(label)
                .thdFont(.bodySm)
                .foregroundStyle(textPrimary)

            Spacer()

            if let count = count {
                Text("(\(count))")
                    .thdFont(.bodySm)
                    .foregroundStyle(textSecondary)
            }
        }
        .padding(.horizontal, TokensCoreLight.Spacing3)
        .padding(.vertical, TokensCoreLight.Spacing3)
        .background(surfaceGreige)
        .clipShape(.rect(cornerRadius: TokensCoreLight.Spacing2))
    }

    // MARK: - Color Swatches Section

    private var colorSwatchesSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Color Swatch Options",
                description: "Options with color swatches for filtering by color."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                colorSwatchOptionPreview(label: "White", color: .white, count: 234, isSelected: false)
                colorSwatchOptionPreview(label: "Black", color: .black, count: 189, isSelected: true)
                colorSwatchOptionPreview(label: "Stainless Steel", color: .gray, count: 156, isSelected: false)
                colorSwatchOptionPreview(label: "Blue", color: .blue, count: 45, isSelected: false)
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    @ViewBuilder
    private func colorSwatchOptionPreview(label: String, color: Color, count: Int, isSelected: Bool) -> some View {
        HStack(spacing: TokensCoreLight.Spacing3) {
            // Checkbox
            ZStack {
                RoundedRectangle(cornerRadius: TokensCoreLight.Spacing1)
                    .stroke(isSelected ? brandColor : borderDefault, lineWidth: isSelected ? 0 : 1)
                    .background(
                        RoundedRectangle(cornerRadius: TokensCoreLight.Spacing1)
                            .fill(isSelected ? brandColor : Color.clear)
                    )
                    .frame(width: TokensCoreLight.Spacing5, height: TokensCoreLight.Spacing5)

                if isSelected {
                    Image(systemName: "checkmark")
                        .thdFont(.caption)
                        .bold()
                        .foregroundStyle(checkmarkWhite)
                }
            }

            // Color swatch
            RoundedRectangle(cornerRadius: TokensCoreLight.Spacing1)
                .fill(color)
                .frame(width: TokensCoreLight.Spacing6, height: TokensCoreLight.Spacing6)
                .overlay(
                    RoundedRectangle(cornerRadius: TokensCoreLight.Spacing1)
                        .stroke(borderOverlay, lineWidth: 1)
                )

            Text(label)
                .thdFont(.bodySm)
                .foregroundStyle(textPrimary)

            Spacer()

            Text("(\(count))")
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
        }
        .padding(.horizontal, TokensCoreLight.Spacing3)
        .padding(.vertical, TokensCoreLight.Spacing3)
        .background(surfaceGreige)
        .clipShape(.rect(cornerRadius: TokensCoreLight.Spacing2))
    }

    // MARK: - Interactive Section

    private var interactiveSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Interactive Example",
                description: "Try the filter sheet interactions."
            )

            DSPLPFilterSheetInteractiveExample()
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - Specifications Section

    private var specificationsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Specifications",
                description: "Technical details and code examples."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                specRow(label: "Header Height", value: "56pt")
                specRow(label: "Content Padding", value: "16pt")
                specRow(label: "Category Spacing", value: "8pt")
                specRow(label: "Option Spacing", value: "4pt")
                specRow(label: "Checkbox Size", value: "20pt")

                Text("Data Models")
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)
                    .padding(.top, TokensCoreLight.Spacing2)

                VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                    Text("• DSPLPFilterSheetData - Main data container")
                    Text("• DSPLPFilterCategory - Category with options")
                    Text("• DSPLPFilterOption - Individual filter option")
                }
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)

                Text("Callbacks")
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)
                    .padding(.top, TokensCoreLight.Spacing2)

                VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                    Text("• onClose - Sheet closed")
                    Text("• onCategoryTap - Category expanded/collapsed")
                    Text("• onOptionTap - Option selected/deselected")
                    Text("• onViewResults - Results button tapped")
                    Text("• onClearAll - Clear all filters")
                }
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)

                Text("Code Example")
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)
                    .padding(.top, TokensCoreLight.Spacing2)

                Text("""
                DSPLPFilterSheet(
                    data: DSPLPFilterSheetData(
                        title: "Sort & Filter",
                        categories: [
                            DSPLPFilterCategory(
                                title: "Get it Fast",
                                options: [
                                    DSPLPFilterOption(
                                        label: "In Stock Today",
                                        count: 45,
                                        isSelected: true
                                    ),
                                    DSPLPFilterOption(
                                        label: "Free Delivery",
                                        count: 38
                                    )
                                ],
                                selectedCount: 1,
                                isExpanded: true
                            ),
                            DSPLPFilterCategory(title: "Brand"),
                            DSPLPFilterCategory(title: "Price")
                        ],
                        resultsCount: 102,
                        hasActiveFilters: true
                    ),
                    onClose: { print("Close") },
                    onCategoryTap: { category in
                        print("Category: \\(category.title)")
                    },
                    onOptionTap: { option in
                        print("Option: \\(option.label)")
                    },
                    onViewResults: { print("View Results") },
                    onClearAll: { print("Clear All") }
                )
                """)
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
                .padding(TokensCoreLight.Spacing3)
                .background(surfaceGreige)
                .clipShape(.rect(cornerRadius: TokensCoreLight.Spacing2))
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - Helper Methods

    @ViewBuilder
    private func sectionHeader(title: String, description: String) -> some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
            Text(title)
                .thdFont(.h5)
                .foregroundStyle(textPrimary)

            Text(description)
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
        }
    }

    @ViewBuilder
    private func specRow(label: String, value: String) -> some View {
        HStack {
            Text(label)
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
            Spacer()
            Text(value)
                .thdFont(.bodySm)
                .foregroundStyle(textPrimary)
        }
    }

    // MARK: - Theme-Aware Colors

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    private var surfaceWhite: Color { tokens.BackgroundContainerColorWhite }
    private var surfaceGreige: Color { tokens.BackgroundSurfaceColorGreige }
    private var textPrimary: Color { tokens.TextOnContainerColorPrimary }
    private var textSecondary: Color { tokens.TextOnContainerColorSecondary }
    private var brandColor: Color { tokens.Brand400 }
    private var borderDefault: Color { tokens.BorderOnContainerDefault }
    private var checkmarkWhite: Color { tokens.NeutralsWhite }
    private var borderOverlay: Color { tokens.BackgroundContainerColorTransparent10 }
}

// MARK: - Interactive Example

private struct DSPLPFilterSheetInteractiveExample: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var categories: [DSPLPFilterCategory] = [
        DSPLPFilterCategory(
            title: "Get it Fast",
            options: [
                DSPLPFilterOption(label: "In Stock Today", count: 45, isSelected: false),
                DSPLPFilterOption(label: "Free Delivery", count: 38, isSelected: false),
                DSPLPFilterOption(label: "Same Day Delivery", count: 12, isSelected: false)
            ],
            selectedCount: 0,
            isExpanded: true
        ),
        DSPLPFilterCategory(
            title: "Brand",
            options: [
                DSPLPFilterOption(label: "DEWALT", count: 89, isSelected: false),
                DSPLPFilterOption(label: "Milwaukee", count: 76, isSelected: false),
                DSPLPFilterOption(label: "Makita", count: 54, isSelected: false)
            ],
            selectedCount: 0,
            isExpanded: false
        ),
        DSPLPFilterCategory(
            title: "Price",
            options: [
                DSPLPFilterOption(label: "Under $50", count: 120, isSelected: false),
                DSPLPFilterOption(label: "$50 - $100", count: 89, isSelected: false),
                DSPLPFilterOption(label: "$100 - $200", count: 67, isSelected: false),
                DSPLPFilterOption(label: "Over $200", count: 34, isSelected: false)
            ],
            selectedCount: 0,
            isExpanded: false
        )
    ]
    @State private var lastAction: String = "Interact with filters..."

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            // Status Display
            Text("Last Action: \(lastAction)")
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
                .padding(TokensCoreLight.Spacing2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(surfaceGreige)
                .clipShape(.rect(cornerRadius: TokensCoreLight.Spacing2))

            // Filter Categories
            VStack(spacing: TokensCoreLight.Spacing2) {
                ForEach(categories.enumerated(), id: \.element.id) { index, category in
                    VStack(spacing: TokensCoreLight.Spacing1) {
                        // Category tile
                        Button(action: { toggleCategory(at: index) }) {
                            HStack {
                                Text(category.title)
                                    .thdFont(.bodyMd)
                                    .foregroundStyle(textPrimary)

                                if category.selectedCount > 0 {
                                    Text("(\(category.selectedCount))")
                                        .thdFont(.bodySm)
                                        .foregroundStyle(textSecondary)
                                }

                                Spacer()

                                Image(systemName: category.isExpanded ? "chevron.up" : "chevron.down")
                                    .thdFont(.bodySm)
                                    .foregroundStyle(textSecondary)
                            }
                            .padding(.horizontal, TokensCoreLight.Spacing4)
                            .padding(.vertical, TokensCoreLight.Spacing4)
                            .background(surfaceGreige)
                            .clipShape(.rect(cornerRadius: TokensCoreLight.Spacing2))
                        }
                        .buttonStyle(.plain)

                        // Options
                        if category.isExpanded {
                            VStack(spacing: TokensCoreLight.Spacing1) {
                                ForEach(category.options.enumerated(), id: \.element.id) { optionIndex, option in
                                    Button(action: { toggleOption(categoryIndex: index, optionIndex: optionIndex) }) {
                                        HStack(spacing: TokensCoreLight.Spacing3) {
                                            ZStack {
                                                RoundedRectangle(cornerRadius: TokensCoreLight.Spacing1)
                                                    .stroke(option.isSelected ? brandColor : borderDefault, lineWidth: option.isSelected ? 0 : 1)
                                                    .background(
                                                        RoundedRectangle(cornerRadius: TokensCoreLight.Spacing1)
                                                            .fill(option.isSelected ? brandColor : Color.clear)
                                                    )
                                                    .frame(width: TokensCoreLight.Spacing5, height: TokensCoreLight.Spacing5)

                                                if option.isSelected {
                                                    Image(systemName: "checkmark")
                                                        .thdFont(.caption)
                                                        .bold()
                                                        .foregroundStyle(checkmarkWhite)
                                                }
                                            }

                                            Text(option.label)
                                                .thdFont(.bodySm)
                                                .foregroundStyle(textPrimary)

                                            Spacer()

                                            if let count = option.count {
                                                Text("(\(count))")
                                                    .thdFont(.bodySm)
                                                    .foregroundStyle(textSecondary)
                                            }
                                        }
                                        .padding(.horizontal, TokensCoreLight.Spacing3)
                                        .padding(.vertical, TokensCoreLight.Spacing3)
                                        .background(surfaceGreige.opacity(0.5))
                                        .clipShape(.rect(cornerRadius: TokensCoreLight.Spacing2))
                                    }
                                    .buttonStyle(.plain)
                                    .padding(.leading, TokensCoreLight.Spacing4)
                                }
                            }
                        }
                    }
                }
            }

            // View Results Button
            DSButton(
                "View 102 Results",
                style: .orangeFilled,
                size: .large
            ) {
                let totalSelected = categories.reduce(0) { $0 + $1.selectedCount }
                lastAction = "View Results tapped (\(totalSelected) filters)"
            }
        }
    }

    private func toggleCategory(at index: Int) {
        var updatedCategory = categories[index]
        updatedCategory = DSPLPFilterCategory(
            id: updatedCategory.id,
            title: updatedCategory.title,
            options: updatedCategory.options,
            selectedCount: updatedCategory.selectedCount,
            isExpanded: !updatedCategory.isExpanded
        )
        categories[index] = updatedCategory
        lastAction = "\(updatedCategory.title) \(updatedCategory.isExpanded ? "expanded" : "collapsed")"
    }

    private func toggleOption(categoryIndex: Int, optionIndex: Int) {
        var category = categories[categoryIndex]
        var options = category.options
        let option = options[optionIndex]

        let updatedOption = DSPLPFilterOption(
            id: option.id,
            label: option.label,
            count: option.count,
            isSelected: !option.isSelected
        )
        options[optionIndex] = updatedOption

        let selectedCount = options.filter { $0.isSelected }.count

        categories[categoryIndex] = DSPLPFilterCategory(
            id: category.id,
            title: category.title,
            options: options,
            selectedCount: selectedCount,
            isExpanded: category.isExpanded
        )

        lastAction = "\(option.label) \(updatedOption.isSelected ? "selected" : "deselected")"
    }

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    private var surfaceGreige: Color { tokens.BackgroundSurfaceColorGreige }
    private var textPrimary: Color { tokens.TextOnContainerColorPrimary }
    private var textSecondary: Color { tokens.TextOnContainerColorSecondary }
    private var brandColor: Color { tokens.Brand400 }
    private var borderDefault: Color { tokens.BorderOnContainerDefault }
    private var checkmarkWhite: Color { tokens.NeutralsWhite }
}

// MARK: - Token Protocol Helper

private protocol TokenSemanticProtocol {
    static var TextOnContainerColorPrimary: Color { get }
    static var TextOnContainerColorSecondary: Color { get }
    static var BackgroundContainerColorWhite: Color { get }
    static var BackgroundSurfaceColorGreige: Color { get }
    static var BackgroundContainerColorTransparent10: Color { get }
    static var BorderOnContainerDefault: Color { get }
    static var Brand400: Color { get }
    static var NeutralsWhite: Color { get }
}

extension TokensSemanticLight: TokenSemanticProtocol {}
extension TokensSemanticDark: TokenSemanticProtocol {}

// MARK: - Preview

#Preview {
    DSPLPFilterSheetView()
}
