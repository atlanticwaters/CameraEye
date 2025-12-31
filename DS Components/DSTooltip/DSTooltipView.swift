import SwiftUI

// MARK: - DSTooltip Showcase View

/// Comprehensive showcase of the DSTooltip component
///
/// Demonstrates:
/// - All 4 placements (above, below, leading, trailing)
/// - With and without close button
/// - Directional arrow indicators
/// - Interactive dismiss behavior
/// - Dark mode support
/// - Real-world usage examples

struct DSTooltipView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing6) {

                // MARK: - Header Card
                VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                    Text("Tooltip")
                        .thdFont(.hero5)
                        .foregroundStyle(textPrimary)

                    Text("A tooltip component for displaying contextual information. Supports 4 placements with directional arrows and optional close button.")
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

                    // Tooltip Placements
                    tooltipPlacementsSection

                    Divider().padding(.vertical, TokensCoreLight.Spacing2)

                    // Close Button
                    closeButtonSection

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

    // MARK: - Tooltip Placements Section

    private var tooltipPlacementsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader(
                "Tooltip Placements",
                description: "4 directional placements with arrows"
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                placementExample(
                    "Above",
                    description: "Arrow points up, tooltip appears above anchor",
                    placement: .above
                )

                placementExample(
                    "Below",
                    description: "Arrow points down, tooltip appears below anchor",
                    placement: .below
                )

                placementExample(
                    "Leading",
                    description: "Arrow points left, tooltip appears before anchor",
                    placement: .leading
                )

                placementExample(
                    "Trailing",
                    description: "Arrow points right, tooltip appears after anchor",
                    placement: .trailing
                )
            }
        }
    }

    private func placementExample(_ title: String, description: String, placement: DSTooltipPlacement) -> some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                Text(title)
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)

                Text(description)
                    .thdFont(.caption)
                    .foregroundStyle(textTertiary)
            }

            HStack {
                DSTooltip("Tooltip with \(title.lowercased()) placement", placement: placement)
                Spacer()
            }
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }

    // MARK: - Close Button Section

    private var closeButtonSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader(
                "Close Button",
                description: "Tooltips with optional dismiss action"
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                closeButtonExample(
                    "Without Close",
                    description: "Standard tooltip, no dismiss action",
                    showsClose: false
                )

                closeButtonExample(
                    "With Close",
                    description: "Includes close button for dismissal",
                    showsClose: true
                )
            }
        }
    }

    private func closeButtonExample(_ title: String, description: String, showsClose: Bool) -> some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                Text(title)
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)

                Text(description)
                    .thdFont(.caption)
                    .foregroundStyle(textTertiary)
            }

            HStack {
                DSTooltip(
                    "Tap to interact with this tooltip",
                    placement: .below,
                    showsClose: showsClose,
                    onClose: showsClose ? { print("Tooltip dismissed") } : nil
                )
                Spacer()
            }
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }

    // MARK: - Interactive Section

    private var interactiveSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader("Interactive Examples", description: "Try dismissing tooltips")

            VStack(spacing: TokensCoreLight.Spacing4) {
                InteractiveDismissExample()

                InteractivePlacementCycle()
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

            Text("Feature Hint")
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)

            featureHintExample

            Text("Form Help")
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
                .padding(.top, TokensCoreLight.Spacing2)

            formHelpExample

            Text("Onboarding")
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
                .padding(.top, TokensCoreLight.Spacing2)

            onboardingExample
        }
    }

    private var featureHintExample: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            HStack(spacing: TokensCoreLight.Spacing2) {
                DSIconButton(systemName: "heart", style: .outlined, size: .medium, accessibilityLabel: "Add to wishlist") {}

                DSTooltip("Add to your wishlist", placement: .trailing)

                Spacer()
            }
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerWhite)
        )
    }

    private var formHelpExample: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            DSTooltip("Password must be at least 8 characters", placement: .above)
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerWhite)
        )
    }

    private var onboardingExample: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            DSTooltip(
                "Tap here to view your saved items",
                showsClose: true,
                placement: .below,
                onClose: { print("Dismissed") }
            )
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
                specRow("Component", value: "DSTooltip")
                specRow("Placements", value: "4 (above, below, leading, trailing)")
                specRow("Base Padding", value: "12pt")
                specRow("Trailing Padding (with close)", value: "8pt")
                specRow("Close Button Size", value: "12pt (with 8pt padding)")
                specRow("Arrow Size (vertical)", value: "12pt × 6pt")
                specRow("Arrow Size (horizontal)", value: "6pt × 12pt")
                specRow("Corner Radius", value: "Xl")
                specRow("Shadow", value: "ElevationBelow3")
            }
            .padding(TokensCoreLight.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(containerGreige)
            )

            Text("Placement Arrows")
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
                .padding(.top, TokensCoreLight.Spacing2)

            placementArrowsTable

            Text("Code Example")
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
                .padding(.top, TokensCoreLight.Spacing2)

            codeExample("""
// Simple tooltip
DSTooltip("Add items to your cart")

// With placement and close button
DSTooltip(
    "Tap for more info",
    placement: .above,
    showsClose: true
) {
    print("Tooltip dismissed")
}

// Trailing closure syntax
DSTooltip("Dismissible", showsClose: true, placement: .below) {
    print("Dismissed")
}
""")
        }
    }

    private var placementArrowsTable: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
            placementRow("Above", arrow: "Arrow points up (↑)")
            placementRow("Below", arrow: "Arrow points down (↓)")
            placementRow("Leading", arrow: "Arrow points left (←)")
            placementRow("Trailing", arrow: "Arrow points right (→)")
        }
        .padding(TokensCoreLight.Spacing3)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }

    private func placementRow(_ placement: String, arrow: String) -> some View {
        HStack {
            Text(placement)
                .thdFont(.caption)
                .foregroundStyle(textPrimary)

            Spacer()

            Text(arrow)
                .thdFont(.caption)
                .foregroundStyle(textTertiary)
        }
        .padding(.vertical, 4)
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

    private var codeBlockBg: Color {
        tokens.BackgroundContainerColorTransparent05
    }

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }
}

// MARK: - Supporting Views

/// Interactive dismiss example
private struct InteractiveDismissExample: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var showTooltip = true
    @State private var dismissCount = 0

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            HStack {
                Text("Dismissible Tooltip")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorSecondary)

                Spacer()

                Text("Dismissed: \(dismissCount)x")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorPrimary)
            }

            if showTooltip {
                DSTooltip(
                    "Try dismissing this tooltip",
                    showsClose: true,
                    placement: .below,
                    onClose: {
                        showTooltip = false
                        dismissCount += 1
                    }
                )
            } else {
                DSButton("Show Tooltip Again", style: .outlined, size: .medium) {
                    showTooltip = true
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

/// Interactive placement cycle example
private struct InteractivePlacementCycle: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var currentPlacementIndex = 0

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    private let placements: [(DSTooltipPlacement, String)] = [
        (.above, "Above"),
        (.below, "Below"),
        (.leading, "Leading"),
        (.trailing, "Trailing")
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            HStack {
                Text("Cycle Placements")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorSecondary)

                Spacer()

                Text(placements[currentPlacementIndex].1)
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorPrimary)
            }

            HStack {
                DSTooltip(
                    "Placement: \(placements[currentPlacementIndex].1)",
                    placement: placements[currentPlacementIndex].0
                )
                Spacer()
            }

            DSButton("Next Placement", style: .outlined, size: .medium) {
                currentPlacementIndex = (currentPlacementIndex + 1) % placements.count
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
    DSTooltipView()
}
