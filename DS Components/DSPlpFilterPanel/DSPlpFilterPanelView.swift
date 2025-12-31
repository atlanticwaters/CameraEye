import SwiftUI

// MARK: - DSPlpFilterPanel Showcase View

/// Comprehensive showcase of the DSPlpFilterPanel component.
///
/// Demonstrates:
/// - Category title display
/// - Style pills with images
/// - Results count display
/// - Filter pills (top-level filters)
/// - Sub-filter pills (applied filters)
/// - Interactive example
/// - Usage examples

struct DSPlpFilterPanelView: View {
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
            Text("DSPlpFilterPanel")
                .thdFont(.h3)
                .foregroundStyle(textPrimary)

            Text("A Product Listing Page (PLP) filter panel displaying title, style pills, results count, and filter options. Combines multiple interactive elements for browsing and filtering products.")
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
            // Title Section
            titleSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Style Pills Section
            stylePillsSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Filter Pills Section
            filterPillsSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Sub-Filter Pills Section
            subFilterPillsSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Full Example Section
            fullExampleSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Specifications Section
            specificationsSection
        }
        .background(surfaceWhite)
        .clipShape(.rect(cornerRadius: TokensCoreLight.Spacing3))
    }

    // MARK: - Title Section

    private var titleSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Category Title",
                description: "Bold heading showing the product category."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                Text("REFRIGERATOR")
                    .thdFont(.hero1)
                    .foregroundStyle(textPrimary)

                Text("Results Count")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                Text("5,007 RESULTS")
                    .thdFont(.h3)
                    .foregroundStyle(textSecondary)
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - Style Pills Section

    private var stylePillsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Style Pills",
                description: "Large pills with images for browsing product styles."
            )

            ScrollView(.horizontal) {
                HStack(spacing: TokensCoreLight.Spacing3) {
                    stylePillPreview(text: "French Door\nRefrigerators", hasImage: true)
                    stylePillPreview(text: "Side by Side\nRefrigerators", hasImage: true)
                    stylePillPreview(text: "Top Freezer\nRefrigerators", hasImage: true)
                    stylePillPreview(text: "Mini\nRefrigerators", hasImage: true)
                }
            }
            .scrollIndicators(.hidden)

            Text("Without Images")
                .thdFont(.caption)
                .foregroundStyle(textSecondary)

            ScrollView(.horizontal) {
                HStack(spacing: TokensCoreLight.Spacing3) {
                    stylePillPreview(text: "Power Tools", hasImage: false)
                    stylePillPreview(text: "Hand Tools", hasImage: false)
                    stylePillPreview(text: "Tool Storage", hasImage: false)
                }
            }
            .scrollIndicators(.hidden)
        }
        .padding(TokensCoreLight.Spacing4)
    }

    @ViewBuilder
    private func stylePillPreview(text: String, hasImage: Bool) -> some View {
        HStack(spacing: TokensCoreLight.Spacing1) {
            if hasImage {
                Circle()
                    .fill(transparentBg)
                    .frame(width: TokensCoreLight.Spacing12, height: TokensCoreLight.Spacing12)
                    .overlay(
                        Image(systemName: "photo")
                            .foregroundStyle(textTertiary)
                    )
            }

            Text(text)
                .thdFont(.bodySm)
                .lineLimit(2)
                .foregroundStyle(neutralsWhite)
                .multilineTextAlignment(.leading)
        }
        .padding(.horizontal, TokensCoreLight.Spacing4)
        .padding(.vertical, TokensCoreLight.Spacing3)
        .frame(height: TokensCoreLight.Spacing17)
        .background(accentBlue)
        .clipShape(Capsule())
    }

    // MARK: - Filter Pills Section

    private var filterPillsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Filter Pills",
                description: "Top-level filter categories."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                Text("With Icon")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                ScrollView(.horizontal) {
                    HStack(spacing: TokensCoreLight.Spacing2) {
                        filterPillPreview(text: "All Filters", hasIcon: true)
                        filterPillPreview(text: "Category", hasIcon: false)
                        filterPillPreview(text: "Brand", hasIcon: false)
                        filterPillPreview(text: "Price", hasIcon: false)
                    }
                }
                .scrollIndicators(.hidden)

                Text("Text Only")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                ScrollView(.horizontal) {
                    HStack(spacing: TokensCoreLight.Spacing2) {
                        filterPillPreview(text: "Sort By", hasIcon: false)
                        filterPillPreview(text: "Color", hasIcon: false)
                        filterPillPreview(text: "Size", hasIcon: false)
                        filterPillPreview(text: "Rating", hasIcon: false)
                    }
                }
                .scrollIndicators(.hidden)
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    @ViewBuilder
    private func filterPillPreview(text: String, hasIcon: Bool) -> some View {
        HStack(spacing: TokensCoreLight.Spacing1) {
            if hasIcon {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: TokensCoreLight.Spacing4, height: TokensCoreLight.Spacing4)
                    .foregroundStyle(textPrimary)
            }

            Text(text)
                .thdFont(.bodySm)
                .lineLimit(1)
                .foregroundStyle(textPrimary)
        }
        .padding(.horizontal, hasIcon ? TokensCoreLight.Spacing4 : TokensCoreLight.Spacing3)
        .padding(.vertical, TokensCoreLight.Spacing3)
        .frame(height: TokensCoreLight.Spacing11)
    }

    // MARK: - Sub-Filter Pills Section

    private var subFilterPillsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Sub-Filter Pills",
                description: "Applied filters or quick filter options."
            )

            ScrollView(.horizontal) {
                HStack(spacing: TokensCoreLight.Spacing2) {
                    subFilterPillPreview(text: "In Stock At Store Today")
                    subFilterPillPreview(text: "Free 1-2 Day Delivery")
                    subFilterPillPreview(text: "Top Rated")
                    subFilterPillPreview(text: "On Sale")
                }
            }
            .scrollIndicators(.hidden)
        }
        .padding(TokensCoreLight.Spacing4)
    }

    @ViewBuilder
    private func subFilterPillPreview(text: String) -> some View {
        Text(text)
            .thdFont(.bodySm)
            .lineLimit(1)
            .foregroundStyle(textPrimary)
            .padding(.horizontal, TokensCoreLight.Spacing4)
            .padding(.vertical, TokensCoreLight.Spacing2Tba)
            .frame(minHeight: TokensCoreLight.Spacing9)
            .background(surfaceWhite)
            .clipShape(Capsule())
            .overlay(
                Capsule()
                    .stroke(borderDefault, lineWidth: 1)
            )
    }

    // MARK: - Full Example Section

    private var fullExampleSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Full Example",
                description: "Complete filter panel with all elements."
            )

            DSPlpFilterPanelInteractiveExample()
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
                specRow(label: "Style Pill Height", value: "68pt")
                specRow(label: "Style Pill Image", value: "48pt circle")
                specRow(label: "Filter Pill Height", value: "44pt")
                specRow(label: "Sub-Filter Height", value: "36pt min")

                Text("Data Models")
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)
                    .padding(.top, TokensCoreLight.Spacing2)

                VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                    Text("• DSStylePillItem - Style pill with image/text")
                    Text("• DSFilterPillItem - Filter pill with optional icon")
                    Text("• DSPLPFilterPanelData - Complete panel data")
                }
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)

                Text("Parameters")
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)
                    .padding(.top, TokensCoreLight.Spacing2)

                VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                    Text("• title: String - Category title")
                    Text("• stylePills: [DSStylePillItem]")
                    Text("• resultsCount: String? - Results text")
                    Text("• filterPills: [DSFilterPillItem]")
                    Text("• subFilterPills: [DSFilterPillItem]")
                }
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)

                Text("Code Example")
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)
                    .padding(.top, TokensCoreLight.Spacing2)

                Text("""
                DSPlpFilterPanel(
                    title: "REFRIGERATOR",
                    stylePills: [
                        DSStylePillItem(
                            text: "French Door\\nRefrigerators",
                            image: Image("french-door")
                        ),
                        DSStylePillItem(
                            text: "Side by Side\\nRefrigerators",
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
                        DSFilterPillItem(text: "Free 1-2 Day Delivery")
                    ],
                    onStylePillTap: { item in
                        print("Style: \\(item.text)")
                    },
                    onFilterPillTap: { item in
                        print("Filter: \\(item.text)")
                    },
                    onSubFilterPillTap: { item in
                        print("Sub-filter: \\(item.text)")
                    }
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
    private var textTertiary: Color { tokens.TextOnContainerColorTertiary }
    private var transparentBg: Color { tokens.BackgroundContainerColorTransparent10 }
    private var borderDefault: Color { tokens.BorderOnContainerDefault }
    private var accentBlue: Color { tokens.BackgroundAccentColorBlue }
    private var neutralsWhite: Color { tokens.NeutralsWhite }
}

// MARK: - Interactive Example

private struct DSPlpFilterPanelInteractiveExample: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var lastAction: String = "Interact with the panel..."

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

            // Panel
            DSPlpFilterPanel(
                title: "POWER TOOLS",
                stylePills: [
                    DSStylePillItem(text: "Drills", image: Image(systemName: "wrench.and.screwdriver")),
                    DSStylePillItem(text: "Saws", image: Image(systemName: "scissors")),
                    DSStylePillItem(text: "Sanders", image: Image(systemName: "square.stack.3d.up"))
                ],
                resultsCount: "1,234 RESULTS",
                filterPills: [
                    DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle")),
                    DSFilterPillItem(text: "Brand"),
                    DSFilterPillItem(text: "Price"),
                    DSFilterPillItem(text: "Rating")
                ],
                subFilterPills: [
                    DSFilterPillItem(text: "In Stock Today"),
                    DSFilterPillItem(text: "Free Delivery"),
                    DSFilterPillItem(text: "Top Rated")
                ],
                onStylePillTap: { item in
                    lastAction = "Style pill tapped: \(item.text.replacingOccurrences(of: "\n", with: " "))"
                },
                onFilterPillTap: { item in
                    lastAction = "Filter pill tapped: \(item.text)"
                },
                onSubFilterPillTap: { item in
                    lastAction = "Sub-filter tapped: \(item.text)"
                }
            )
            .background(surfaceGreige)
            .clipShape(.rect(cornerRadius: TokensCoreLight.Spacing2))
        }
    }

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    private var surfaceGreige: Color { tokens.BackgroundSurfaceColorGreige }
    private var textSecondary: Color { tokens.TextOnContainerColorSecondary }
}

// MARK: - Token Protocol Helper

private protocol TokenSemanticProtocol {
    static var TextOnContainerColorPrimary: Color { get }
    static var TextOnContainerColorSecondary: Color { get }
    static var TextOnContainerColorTertiary: Color { get }
    static var BackgroundContainerColorWhite: Color { get }
    static var BackgroundSurfaceColorGreige: Color { get }
    static var BackgroundContainerColorTransparent10: Color { get }
    static var BorderOnContainerDefault: Color { get }
    static var BackgroundAccentColorBlue: Color { get }
    static var NeutralsWhite: Color { get }
}

extension TokensSemanticLight: TokenSemanticProtocol {}
extension TokensSemanticDark: TokenSemanticProtocol {}

// MARK: - Preview

#Preview {
    DSPlpFilterPanelView()
}
