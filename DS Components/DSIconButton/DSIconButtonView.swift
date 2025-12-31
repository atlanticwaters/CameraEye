import SwiftUI

// MARK: - DSIconButton Showcase View

/// Comprehensive showcase of the DSIconButton component
///
/// Demonstrates:
/// - All 6 styles (orangeFilled, outlined, whiteFilled, black5, black10, ghost)
/// - All 3 sizes (small, medium, large)
/// - Loading and disabled states
/// - System icons and custom images
/// - Interactive examples
/// - Dark mode support
/// - Real-world usage examples

struct DSIconButtonView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing6) {

                // MARK: - Header Card
                VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                    Text("Icon Button")
                        .thdFont(.hero5)
                        .foregroundStyle(textPrimary)

                    Text("An icon-only button component with 6 styles and 3 sizes. Supports loading states, disabled states, and accessibility labels.")
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

                    // Icon Button Styles
                    iconButtonStylesSection

                    Divider().padding(.vertical, TokensCoreLight.Spacing2)

                    // Icon Button Sizes
                    iconButtonSizesSection

                    Divider().padding(.vertical, TokensCoreLight.Spacing2)

                    // Icon Button States
                    iconButtonStatesSection

                    Divider().padding(.vertical, TokensCoreLight.Spacing2)

                    // Icon Types
                    iconTypesSection

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

    // MARK: - Icon Button Styles Section

    private var iconButtonStylesSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader(
                "Icon Button Styles",
                description: "6 style variants for different contexts"
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                styleExample(
                    "Orange Filled",
                    description: "Primary action buttons",
                    style: .orangeFilled
                )

                styleExample(
                    "Outlined",
                    description: "Secondary actions with border",
                    style: .outlined
                )

                styleExample(
                    "White Filled",
                    description: "Actions on dark backgrounds",
                    style: .whiteFilled
                )

                styleExample(
                    "Black 5%",
                    description: "Subtle transparent actions",
                    style: .black5
                )

                styleExample(
                    "Black 10%",
                    description: "Medium transparent actions",
                    style: .black10
                )

                styleExample(
                    "Ghost",
                    description: "Minimal, icon-only actions",
                    style: .ghost
                )
            }
        }
    }

    private func styleExample(_ title: String, description: String, style: DSIconButtonStyle) -> some View {
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
                DSIconButton(systemName: "heart.fill", style: style, size: .medium, accessibilityLabel: "Favorite") {}
                DSIconButton(systemName: "cart.fill", style: style, size: .medium, accessibilityLabel: "Add to cart") {}
                DSIconButton(systemName: "share", style: style, size: .medium, accessibilityLabel: "Share") {}
                Spacer()
            }
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }

    // MARK: - Icon Button Sizes Section

    private var iconButtonSizesSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader(
                "Icon Button Sizes",
                description: "Small (28pt), Medium (36pt), and Large (44pt)"
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                sizeExample(
                    "Small",
                    description: "28pt button, 44pt touch target",
                    size: .small
                )

                sizeExample(
                    "Medium",
                    description: "36pt button, 44pt touch target",
                    size: .medium
                )

                sizeExample(
                    "Large",
                    description: "44pt button, 44pt touch target",
                    size: .large
                )
            }
        }
    }

    private func sizeExample(_ title: String, description: String, size: DSIconButtonSize) -> some View {
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
                DSIconButton(systemName: "heart.fill", style: .orangeFilled, size: size, accessibilityLabel: "Favorite") {}
                DSIconButton(systemName: "cart.fill", style: .outlined, size: size, accessibilityLabel: "Cart") {}
                DSIconButton(systemName: "share", style: .ghost, size: size, accessibilityLabel: "Share") {}
                Spacer()
            }
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }

    // MARK: - Icon Button States Section

    private var iconButtonStatesSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader(
                "Icon Button States",
                description: "Default, loading, and disabled states"
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                stateExample(
                    "Default State",
                    description: "Normal interactive state",
                    isLoading: false,
                    isDisabled: false
                )

                stateExample(
                    "Loading State",
                    description: "Shows spinner during async operations",
                    isLoading: true,
                    isDisabled: false
                )

                stateExample(
                    "Disabled State",
                    description: "Non-interactive state",
                    isLoading: false,
                    isDisabled: true
                )
            }
        }
    }

    private func stateExample(_ title: String, description: String, isLoading: Bool, isDisabled: Bool) -> some View {
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
                DSIconButton(
                    systemName: "heart.fill",
                    style: .orangeFilled,
                    size: .medium,
                    accessibilityLabel: "Favorite",
                    isDisabled: isDisabled,
                    isLoading: isLoading
                ) {}

                DSIconButton(
                    systemName: "cart.fill",
                    style: .outlined,
                    size: .medium,
                    accessibilityLabel: "Cart",
                    isDisabled: isDisabled,
                    isLoading: isLoading
                ) {}

                DSIconButton(
                    systemName: "share",
                    style: .ghost,
                    size: .medium,
                    accessibilityLabel: "Share",
                    isDisabled: isDisabled,
                    isLoading: isLoading
                ) {}

                Spacer()
            }
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }

    // MARK: - Icon Types Section

    private var iconTypesSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader(
                "Icon Types",
                description: "System icons and custom images"
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                    VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                        Text("System Icons (SF Symbols)")
                            .thdFont(.bodySm)
                            .foregroundStyle(textPrimary)

                        Text("Use systemName parameter")
                            .thdFont(.caption)
                            .foregroundStyle(textTertiary)
                    }

                    HStack(spacing: TokensCoreLight.Spacing2) {
                        DSIconButton(systemName: "heart", style: .orangeFilled, size: .medium, accessibilityLabel: "Heart") {}
                        DSIconButton(systemName: "star", style: .orangeFilled, size: .medium, accessibilityLabel: "Star") {}
                        DSIconButton(systemName: "bell", style: .orangeFilled, size: .medium, accessibilityLabel: "Bell") {}
                        DSIconButton(systemName: "bookmark", style: .orangeFilled, size: .medium, accessibilityLabel: "Bookmark") {}
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
                        Text("Custom Images")
                            .thdFont(.bodySm)
                            .foregroundStyle(textPrimary)

                        Text("Use icon parameter with Image")
                            .thdFont(.caption)
                            .foregroundStyle(textTertiary)
                    }

                    HStack(spacing: TokensCoreLight.Spacing2) {
                        DSIconButton(icon: Image(systemName: "cart.fill"), style: .outlined, size: .medium, accessibilityLabel: "Cart") {}
                        DSIconButton(icon: Image(systemName: "bag.fill"), style: .outlined, size: .medium, accessibilityLabel: "Bag") {}
                        DSIconButton(icon: Image(systemName: "creditcard.fill"), style: .outlined, size: .medium, accessibilityLabel: "Card") {}
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

    // MARK: - Interactive Section

    private var interactiveSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader("Interactive Examples", description: "Try the buttons")

            VStack(spacing: TokensCoreLight.Spacing4) {
                InteractiveCounterExample()

                InteractiveLoadingExample()

                InteractiveToggleExample()
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

            Text("Product Actions")
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)

            productActionsExample

            Text("Media Controls")
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
                .padding(.top, TokensCoreLight.Spacing2)

            mediaControlsExample

            Text("Navigation")
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
                .padding(.top, TokensCoreLight.Spacing2)

            navigationExample
        }
    }

    private var productActionsExample: some View {
        HStack(spacing: TokensCoreLight.Spacing2) {
            DSIconButton(systemName: "heart", style: .outlined, size: .medium, accessibilityLabel: "Add to wishlist") {}
            DSIconButton(systemName: "square.and.arrow.up", style: .outlined, size: .medium, accessibilityLabel: "Share") {}
            DSIconButton(systemName: "arrow.left.arrow.right", style: .outlined, size: .medium, accessibilityLabel: "Compare") {}
            Spacer()
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerWhite)
        )
    }

    private var mediaControlsExample: some View {
        HStack(spacing: TokensCoreLight.Spacing2) {
            DSIconButton(systemName: "backward.fill", style: .ghost, size: .large, accessibilityLabel: "Previous") {}
            DSIconButton(systemName: "play.fill", style: .orangeFilled, size: .large, accessibilityLabel: "Play") {}
            DSIconButton(systemName: "forward.fill", style: .ghost, size: .large, accessibilityLabel: "Next") {}
            Spacer()
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerWhite)
        )
    }

    private var navigationExample: some View {
        HStack {
            DSIconButton(systemName: "chevron.left", style: .black5, size: .medium, accessibilityLabel: "Back") {}
            Spacer()
            DSIconButton(systemName: "xmark", style: .black5, size: .medium, accessibilityLabel: "Close") {}
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
                specRow("Component", value: "DSIconButton")
                specRow("Styles", value: "6 variants")
                specRow("Sizes", value: "3 (small, medium, large)")
                specRow("Touch Target", value: "44pt (all sizes)")
                specRow("Small Button", value: "28pt")
                specRow("Medium Button", value: "36pt")
                specRow("Large Button", value: "44pt")
                specRow("Icon Size", value: "16pt (all sizes)")
                specRow("Corner Radius", value: "Full (circular)")
                specRow("Press Scale", value: "0.98x")
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
// System icon
DSIconButton(systemName: "heart") {
    // Action
}

// With style and size
DSIconButton(
    systemName: "cart",
    style: .orangeFilled,
    size: .medium,
    accessibilityLabel: "Add to cart"
) {
    // Action
}

// Custom image
DSIconButton(
    icon: Image("custom-icon"),
    style: .outlined,
    accessibilityLabel: "Custom action"
) {
    // Action
}

// Loading state
DSIconButton(
    systemName: "arrow.down",
    isLoading: true,
    accessibilityLabel: "Download"
) {
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

/// Interactive counter example
private struct InteractiveCounterExample: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var count = 0

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            HStack {
                Text("Counter Button")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorSecondary)

                Spacer()

                Text("Count: \(count)")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorPrimary)
            }

            HStack(spacing: TokensCoreLight.Spacing2) {
                DSIconButton(systemName: "minus", style: .outlined, size: .medium, accessibilityLabel: "Decrement") {
                    count = max(0, count - 1)
                }

                DSIconButton(systemName: "plus", style: .orangeFilled, size: .medium, accessibilityLabel: "Increment") {
                    count += 1
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
                DSIconButton(
                    systemName: "arrow.down.circle",
                    style: .orangeFilled,
                    size: .medium,
                    accessibilityLabel: "Download",
                    isLoading: isLoading
                ) {
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

/// Interactive toggle example
private struct InteractiveToggleExample: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var isFavorite = false

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            HStack {
                Text("Toggle Favorite")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorSecondary)

                Spacer()

                Text(isFavorite ? "Favorited" : "Not Favorited")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorPrimary)
            }

            HStack(spacing: TokensCoreLight.Spacing2) {
                DSIconButton(
                    systemName: isFavorite ? "heart.fill" : "heart",
                    style: isFavorite ? .orangeFilled : .outlined,
                    size: .medium,
                    accessibilityLabel: isFavorite ? "Remove from favorites" : "Add to favorites"
                ) {
                    isFavorite.toggle()
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
    DSIconButtonView()
}
