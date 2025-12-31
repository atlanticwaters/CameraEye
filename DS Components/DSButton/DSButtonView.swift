import SwiftUI

// MARK: - DSButton Showcase View

/// Comprehensive showcase of the DSButton component
///
/// Demonstrates:
/// - All 7 button styles (orangeFilled, gradientFilled, outlined, whiteFilled, black5, black10, ghost)
/// - All 3 sizes (small, medium, large)
/// - All states (default, pressed, loading, disabled)
/// - Icon support (leading, trailing, both)
/// - Interactive examples
/// - Dark mode support
/// - Real-world usage examples

struct DSButtonView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing6) {
                
                // MARK: - Header Card
                VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                    Text("Button")
                        .thdFont(.hero5)
                        .foregroundColor(textPrimary)

                    Text("A versatile button component with 7 styles, 3 sizes, and support for icons, loading states, and disabled states.")
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
                    
                    // Button Styles
                    buttonStylesSection
                    
                    Divider().padding(.vertical, TokensSpacing.Spacing2)
                    
                    // Button Sizes
                    buttonSizesSection
                    
                    Divider().padding(.vertical, TokensSpacing.Spacing2)
                    
                    // Button States
                    buttonStatesSection
                    
                    Divider().padding(.vertical, TokensSpacing.Spacing2)
                    
                    // Icons
                    iconsSection
                    
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
    
    // MARK: - Button Styles Section
    
    private var buttonStylesSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Button Styles",
                description: "7 style variants for different contexts"
            )
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                styleExample(
                    "Orange Filled",
                    description: "Primary action button",
                    style: .orangeFilled
                )
                
                styleExample(
                    "Gradient Filled",
                    description: "Premium/featured actions",
                    style: .gradientFilled
                )
                
                styleExample(
                    "Outlined",
                    description: "Secondary actions",
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
                    description: "Minimal, text-like actions",
                    style: .ghost
                )
            }
        }
    }
    
    private func styleExample(_ title: String, description: String, style: DSButton.Style) -> some View {
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
                DSButton(title, style: style, size: .medium) {
                    print("\(title) tapped")
                }
                Spacer()
            }
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }
    
    // MARK: - Button Sizes Section
    
    private var buttonSizesSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Button Sizes",
                description: "Small (28pt), Medium (36pt), and Large (44pt full-width)"
            )
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                sizeExample(
                    "Small",
                    size: .small,
                    heightLabel: "28pt"
                )
                
                sizeExample(
                    "Medium",
                    size: .medium,
                    heightLabel: "36pt"
                )
                
                sizeExample(
                    "Large",
                    size: .large,
                    heightLabel: "44pt (full-width)"
                )
            }
        }
    }
    
    private func sizeExample(_ title: String, size: DSButton.Size, heightLabel: String) -> some View {
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
            
            DSButton("Button Text", style: .orangeFilled, size: size) {
                print("\(title) button tapped")
            }
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }
    
    // MARK: - Button States Section
    
    private var buttonStatesSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Button States",
                description: "Default, loading, and disabled states"
            )
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
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
                DSButton(
                    "Orange",
                    style: .orangeFilled,
                    size: .medium,
                    isDisabled: isDisabled,
                    isLoading: isLoading
                ) {
                    print("Orange tapped")
                }
                
                DSButton(
                    "Outlined",
                    style: .outlined,
                    size: .medium,
                    isDisabled: isDisabled,
                    isLoading: isLoading
                ) {
                    print("Outlined tapped")
                }
                
                Spacer()
            }
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }
    
    // MARK: - Icons Section
    
    private var iconsSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Icons",
                description: "Leading, trailing, or both icons"
            )
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                iconExample(
                    "Leading Icon",
                    description: "Icon before text",
                    leadingIcon: Image(systemName: "cart.fill"),
                    trailingIcon: nil
                )
                
                iconExample(
                    "Trailing Icon",
                    description: "Icon after text",
                    leadingIcon: nil,
                    trailingIcon: Image(systemName: "arrow.right")
                )
                
                iconExample(
                    "Both Icons",
                    description: "Icons before and after text",
                    leadingIcon: Image(systemName: "star.fill"),
                    trailingIcon: Image(systemName: "chevron.down")
                )
            }
        }
    }
    
    private func iconExample(_ title: String, description: String, leadingIcon: Image?, trailingIcon: Image?) -> some View {
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
                DSButton(
                    "Button Text",
                    style: .orangeFilled,
                    size: .medium,
                    leadingIcon: leadingIcon,
                    trailingIcon: trailingIcon
                ) {
                    print("\(title) tapped")
                }
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
            sectionHeader("Interactive Examples", description: "Try the buttons")
            
            VStack(spacing: TokensSpacing.Spacing4) {
                InteractiveButtonExample(
                    title: "Counter Button",
                    style: .orangeFilled
                )
                
                InteractiveLoadingExample()
                
                InteractiveToggleExample()
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
            
            Text("Form Actions")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
            
            formActionsExample
            
            Text("Product Actions")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
                .padding(.top, TokensSpacing.Spacing2)
            
            productActionsExample
            
            Text("Navigation")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
                .padding(.top, TokensSpacing.Spacing2)
            
            navigationExample
        }
    }
    
    private var formActionsExample: some View {
        VStack(spacing: TokensSpacing.Spacing2) {
            DSButton(
                "Save Changes",
                style: .orangeFilled,
                size: .large,
                leadingIcon: Image(systemName: "checkmark")
            ) {
                print("Save tapped")
            }
            
            DSButton(
                "Cancel",
                style: .outlined,
                size: .large
            ) {
                print("Cancel tapped")
            }
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerWhite)
        )
    }
    
    private var productActionsExample: some View {
        HStack(spacing: TokensSpacing.Spacing2) {
            DSButton(
                "Add to Cart",
                style: .orangeFilled,
                size: .medium,
                leadingIcon: Image(systemName: "cart.fill")
            ) {
                print("Add to cart tapped")
            }
            
            DSButton(
                "Wishlist",
                style: .outlined,
                size: .medium,
                leadingIcon: Image(systemName: "heart")
            ) {
                print("Wishlist tapped")
            }
            
            Spacer()
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerWhite)
        )
    }
    
    private var navigationExample: some View {
        VStack(spacing: TokensSpacing.Spacing2) {
            DSButton(
                "Continue",
                style: .orangeFilled,
                size: .large,
                trailingIcon: Image(systemName: "arrow.right")
            ) {
                print("Continue tapped")
            }
            
            DSButton(
                "Go Back",
                style: .ghost,
                size: .large,
                leadingIcon: Image(systemName: "arrow.left")
            ) {
                print("Go back tapped")
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
                specRow("Component", value: "DSButton")
                specRow("Styles", value: "7 variants")
                specRow("Sizes", value: "Small (28pt), Medium (36pt), Large (44pt)")
                specRow("Horizontal Padding", value: "16pt (all sizes)")
                specRow("Content Spacing", value: "8pt (icon-text gap)")
                specRow("Icon Size", value: "14pt (Sm/Md), 12pt (Lg)")
                specRow("Font", value: "THD SmVar Beta (Bold, 14pt)")
                specRow("Corner Radius", value: "Full (pill shape)")
                specRow("Press Scale", value: "0.97x")
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
// Basic usage
DSButton("Add to Cart", style: .orangeFilled) {
    // Action
}

// With icons and size
DSButton(
    "Continue",
    style: .orangeFilled,
    size: .large,
    leadingIcon: Image(systemName: "arrow.right")
) {
    // Action
}

// With loading state
DSButton(
    "Loading...",
    style: .outlined,
    isLoading: true
) {
    // Action
}
""")
        }
    }
    
    private var styleGuideTable: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing1) {
            styleGuideRow("Orange Filled", usage: "Primary actions (Add to Cart, Submit)")
            styleGuideRow("Gradient Filled", usage: "Premium features, CTAs")
            styleGuideRow("Outlined", usage: "Secondary actions (Cancel, Back)")
            styleGuideRow("White Filled", usage: "Dark backgrounds, hero sections")
            styleGuideRow("Black 5%", usage: "Subtle overlay actions")
            styleGuideRow("Black 10%", usage: "Medium overlay actions")
            styleGuideRow("Ghost", usage: "Tertiary actions, text-like links")
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

/// Interactive button example with counter
private struct InteractiveButtonExample: View {
    let title: String
    let style: DSButton.Style
    
    @State private var count = 0
    
    var body: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            HStack {
                Text(title)
                    .thdFont(.bodySm)
                    .foregroundColor(TokensSemanticLight.TextOnContainerColorSecondary)
                
                Spacer()
                
                Text("Count: \(count)")
                    .thdFont(.bodySm)
                    .foregroundColor(TokensSemanticLight.TextOnContainerColorPrimary)
            }
            
            HStack {
                DSButton(
                    "Increment",
                    style: style,
                    size: .medium
                ) {
                    count += 1
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

/// Interactive loading example
private struct InteractiveLoadingExample: View {
    @State private var isLoading = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            HStack {
                Text("Loading State")
                    .thdFont(.bodySm)
                    .foregroundColor(TokensSemanticLight.TextOnContainerColorSecondary)
                
                Spacer()
                
                Text(isLoading ? "Loading..." : "Ready")
                    .thdFont(.bodySm)
                    .foregroundColor(TokensSemanticLight.TextOnContainerColorPrimary)
            }
            
            HStack {
                DSButton(
                    "Simulate Loading",
                    style: .outlined,
                    size: .medium,
                    isLoading: isLoading
                ) {
                    isLoading = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        isLoading = false
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

/// Interactive toggle example
private struct InteractiveToggleExample: View {
    @State private var isDisabled = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            HStack {
                Text("Toggle Disabled")
                    .thdFont(.bodySm)
                    .foregroundColor(TokensSemanticLight.TextOnContainerColorSecondary)
                
                Spacer()
                
                Text(isDisabled ? "Disabled" : "Enabled")
                    .thdFont(.bodySm)
                    .foregroundColor(TokensSemanticLight.TextOnContainerColorPrimary)
            }
            
            HStack(spacing: TokensSpacing.Spacing2) {
                DSButton(
                    "Target Button",
                    style: .orangeFilled,
                    size: .medium,
                    isDisabled: isDisabled
                ) {
                    print("Target tapped")
                }
                
                DSButton(
                    isDisabled ? "Enable" : "Disable",
                    style: .ghost,
                    size: .medium
                ) {
                    isDisabled.toggle()
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
    DSButtonView()
}
