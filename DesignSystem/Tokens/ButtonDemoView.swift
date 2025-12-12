import SwiftUI

// MARK: - Button Demo View
/// Comprehensive showcase of button components and variants.
///
/// Demonstrates:
/// - Button styles (orange filled, gradient filled, outlined, white filled, black 5%, black 10%, ghost)
/// - Button sizes (small, medium, large)
/// - Button states (default, pressed, loading, success, inactive)
/// - Icon buttons
/// - Various icon configurations

struct ButtonDemoView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing6) {
                // MARK: - Header Card
                VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                    Text("Button")
                        .thdFont(.hero5)
                        .foregroundColor(textPrimary)

                    Text("Primary action buttons with multiple style variants, sizes, and states.")
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
                    // MARK: - Orange Filled
                    sectionHeader("Orange Filled", description: "Primary brand action button")

                    VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                        Text("Sizes")
                            .thdFont(.bodySm)
                            .foregroundColor(textSecondary)

                        HStack(spacing: TokensSpacing.Spacing2) {
                            THDButton("Small", style: .orangeFilled, size: .small)
                            THDButton("Medium", style: .orangeFilled, size: .medium)
                            THDButton("Large", style: .orangeFilled, size: .large)
                        }

                        Text("With Icons")
                            .thdFont(.bodySm)
                            .foregroundColor(textSecondary)

                        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                            THDButton("Leading Icon", style: .orangeFilled, size: .small, leadingIcon: "cart.fill")
                            THDButton("Trailing Icon", style: .orangeFilled, size: .small, trailingIcon: "arrow.right")
                            THDButton("Both Icons", style: .orangeFilled, size: .small, leadingIcon: "star.fill", trailingIcon: "chevron.right")
                        }

                        Text("States")
                            .thdFont(.bodySm)
                            .foregroundColor(textSecondary)

                        HStack(spacing: TokensSpacing.Spacing2) {
                            THDButton("Default", style: .orangeFilled, size: .small)
                            THDButton("Pressed", style: .orangeFilled, size: .small, state: .pressed)
                            THDButton("Loading", style: .orangeFilled, size: .small, state: .loading)
                            THDButton("Success", style: .orangeFilled, size: .small, state: .success)
                            THDButton("Inactive", style: .orangeFilled, size: .small, state: .inactive)
                        }
                    }

                    Divider().padding(.vertical, TokensSpacing.Spacing2)

                    // MARK: - Gradient Filled
                    sectionHeader("Gradient Filled", description: "Enhanced brand action with gradient")

                    HStack(spacing: TokensSpacing.Spacing2) {
                        THDButton("Small", style: .gradientFilled, size: .small, leadingIcon: "sparkles")
                        THDButton("Medium", style: .gradientFilled, size: .medium, leadingIcon: "sparkles")
                        THDButton("Large", style: .gradientFilled, size: .large, leadingIcon: "sparkles")
                    }

                    Divider().padding(.vertical, TokensSpacing.Spacing2)

                    // MARK: - Outlined
                    sectionHeader("Outlined", description: "Secondary brand action button")

                    VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                        HStack(spacing: TokensSpacing.Spacing2) {
                            THDButton("Small", style: .outlined, size: .small)
                            THDButton("Medium", style: .outlined, size: .medium)
                            THDButton("Large", style: .outlined, size: .large)
                        }

                        Text("States")
                            .thdFont(.bodySm)
                            .foregroundColor(textSecondary)

                        HStack(spacing: TokensSpacing.Spacing2) {
                            THDButton("Default", style: .outlined, size: .small)
                            THDButton("Inactive", style: .outlined, size: .small, state: .inactive)
                        }
                    }

                    Divider().padding(.vertical, TokensSpacing.Spacing2)

                    // MARK: - White Filled
                    sectionHeader("White Filled", description: "For use on dark backgrounds")

                    ZStack {
                        RoundedRectangle(cornerRadius: borderRadiusXl)
                            .fill(greige900)
                            .frame(height: 80)

                        HStack(spacing: TokensSpacing.Spacing2) {
                            THDButton("Small", style: .whiteFilled, size: .small)
                            THDButton("Medium", style: .whiteFilled, size: .medium)
                            THDButton("Large", style: .whiteFilled, size: .large)
                        }
                    }

                    Divider().padding(.vertical, TokensSpacing.Spacing2)

                    // MARK: - Black 5%
                    sectionHeader("Black 5%", description: "Subtle transparent background")

                    HStack(spacing: TokensSpacing.Spacing2) {
                        THDButton("Small", style: .black5, size: .small)
                        THDButton("Medium", style: .black5, size: .medium)
                    }

                    Divider().padding(.vertical, TokensSpacing.Spacing2)

                    // MARK: - Black 10%
                    sectionHeader("Black 10%", description: "More visible transparent background")

                    HStack(spacing: TokensSpacing.Spacing2) {
                        THDButton("Small", style: .black10, size: .small)
                        THDButton("Medium", style: .black10, size: .medium)
                    }

                    Divider().padding(.vertical, TokensSpacing.Spacing2)

                    // MARK: - Ghost
                    sectionHeader("Ghost", description: "No background until pressed")

                    VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                        HStack(spacing: TokensSpacing.Spacing2) {
                            THDButton("Small", style: .ghost, size: .small)
                            THDButton("Medium", style: .ghost, size: .medium)
                            THDButton("Large", style: .ghost, size: .large)
                        }

                        HStack(spacing: TokensSpacing.Spacing2) {
                            THDButton("Default", style: .ghost, size: .small)
                            THDButton("Pressed", style: .ghost, size: .small, state: .pressed)
                            THDButton("Inactive", style: .ghost, size: .small, state: .inactive)
                        }
                    }

                    Divider().padding(.vertical, TokensSpacing.Spacing2)

                    // MARK: - Icon Buttons
                    sectionHeader("Icon Buttons", description: "Circular icon-only buttons")

                    VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                        Text("Orange Filled")
                            .thdFont(.bodySm)
                            .foregroundColor(textSecondary)

                        HStack(spacing: TokensSpacing.Spacing2) {
                            THDIconButton(icon: "plus", style: .orangeFilled, size: .small)
                            THDIconButton(icon: "plus", style: .orangeFilled, size: .medium)
                            THDIconButton(icon: "plus", style: .orangeFilled, size: .large)
                        }

                        Text("Outlined")
                            .thdFont(.bodySm)
                            .foregroundColor(textSecondary)

                        HStack(spacing: TokensSpacing.Spacing2) {
                            THDIconButton(icon: "heart", style: .outlined, size: .small)
                            THDIconButton(icon: "heart", style: .outlined, size: .medium)
                            THDIconButton(icon: "heart", style: .outlined, size: .large)
                        }

                        Text("Various Styles")
                            .thdFont(.bodySm)
                            .foregroundColor(textSecondary)

                        HStack(spacing: TokensSpacing.Spacing2) {
                            THDIconButton(icon: "star", style: .whiteFilled, size: .small)
                            THDIconButton(icon: "bookmark", style: .black5, size: .medium)
                            THDIconButton(icon: "ellipsis", style: .ghost, size: .large)
                        }

                        Text("States")
                            .thdFont(.bodySm)
                            .foregroundColor(textSecondary)

                        HStack(spacing: TokensSpacing.Spacing2) {
                            THDIconButton(icon: "plus", style: .orangeFilled, size: .small, state: .loading)
                            THDIconButton(icon: "plus", style: .outlined, size: .medium, state: .inactive)
                        }
                    }
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
    
    // MARK: - Helper Views
    
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
    
    private var surfaceGreige: Color {
        tokens.BackgroundSurfaceColorGreige
    }
    
    private var greige900: Color {
        tokens.Greige900
    }
    
    private var borderRadiusXl: CGFloat {
        tokens.BorderRadiusXl
    }
    
    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }
}

// MARK: - Token Protocol Helper
private protocol TokenSemanticProtocol {
    static var TextOnContainerColorPrimary: Color { get }
    static var TextOnContainerColorSecondary: Color { get }
    static var TextOnContainerColorTertiary: Color { get }
    static var BackgroundContainerColorWhite: Color { get }
    static var BackgroundSurfaceColorGreige: Color { get }
    static var Greige900: Color { get }
    static var BorderRadiusXl: CGFloat { get }
}

extension TokensSemanticLight: TokenSemanticProtocol {}
extension TokensSemanticDark: TokenSemanticProtocol {}

// MARK: - Preview
#Preview {
    ButtonDemoView()
}
