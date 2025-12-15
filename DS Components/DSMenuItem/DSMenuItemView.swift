import SwiftUI

// MARK: - DSMenuItem Showcase View

/// Comprehensive showcase of the DSMenuItem component
///
/// Demonstrates:
/// - Two style variants (outline, ghost)
/// - Multiple media types (icon, image, payment, custom, none)
/// - State management (default, selected)
/// - Optional chevron indicator
/// - Custom content support
/// - Dark mode support
/// - Real-world usage examples

struct DSMenuItemView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing6) {
                
                // MARK: - Header Card
                VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                    Text("Menu Item")
                        .thdFont(.hero5)
                        .foregroundColor(textPrimary)

                    Text("A versatile menu item component with media support, selection states, and multiple style variants for navigation and selection interfaces.")
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
                    
                    // Styles
                    stylesSection
                    
                    Divider().padding(.vertical, TokensSpacing.Spacing2)
                    
                    // States
                    statesSection
                    
                    Divider().padding(.vertical, TokensSpacing.Spacing2)
                    
                    // Media Types
                    mediaTypesSection
                    
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
            .padding(.top, 60)
            .padding(.bottom, 80)
        }
        .background(surfaceGreige)
        .applySoftScrollEdges()
    }
    
    // MARK: - Styles Section
    
    private var stylesSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Menu Item Styles",
                description: "Two style variants for different contexts"
            )
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                styleExample(
                    "Outline Style",
                    description: "Menu item with border and background",
                    style: .outline
                )
                
                styleExample(
                    "Ghost Style",
                    description: "Minimal style without border",
                    style: .ghost
                )
            }
        }
    }
    
    private func styleExample(_ title: String, description: String, style: DSMenuItem.Style) -> some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing1) {
                Text(title)
                    .thdFont(.bodySm)
                    .foregroundColor(textPrimary)
                
                Text(description)
                    .thdFont(.caption)
                    .foregroundColor(textTertiary)
            }
            
            DSMenuItem(
                style: style,
                media: .icon(Image(systemName: "person.fill")),
                title: "Bob J.",
                subtitle: "Subtitle",
                showChevron: true
            )
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }
    
    // MARK: - States Section
    
    private var statesSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Menu Item States",
                description: "Default and selected states"
            )
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                stateExample(
                    "Default State",
                    description: "Normal interactive state",
                    isSelected: false
                )
                
                stateExample(
                    "Selected State",
                    description: "Active/selected state with accent colors",
                    isSelected: true
                )
            }
        }
    }
    
    private func stateExample(_ title: String, description: String, isSelected: Bool) -> some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing1) {
                Text(title)
                    .thdFont(.bodySm)
                    .foregroundColor(textPrimary)
                
                Text(description)
                    .thdFont(.caption)
                    .foregroundColor(textTertiary)
            }
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                DSMenuItem.outline(
                    media: .icon(Image(systemName: "person.fill")),
                    title: "Outline Style",
                    subtitle: "Account Name",
                    isSelected: isSelected,
                    showChevron: true
                )
                
                DSMenuItem.ghost(
                    media: .icon(Image(systemName: "person.fill")),
                    title: "Ghost Style",
                    subtitle: "Account Name",
                    isSelected: isSelected,
                    showChevron: true
                )
            }
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }
    
    // MARK: - Media Types Section
    
    private var mediaTypesSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader(
                "Media Types",
                description: "Various leading media options"
            )
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                mediaExample(
                    "Icon Media",
                    description: "24x24pt icon"
                ) {
                    DSMenuItem.outline(
                        media: .icon(Image(systemName: "person.fill")),
                        title: "Bob J.",
                        subtitle: "Account"
                    )
                }
                
                mediaExample(
                    "Image Media",
                    description: "40x40pt image with rounded corners"
                ) {
                    DSMenuItem.outline(
                        media: .image(Image(systemName: "photo.fill")),
                        title: "Profile Picture",
                        subtitle: "Image type"
                    )
                }
                
                mediaExample(
                    "Payment Media",
                    description: "Credit card placeholder"
                ) {
                    DSMenuItem.outline(
                        media: .payment,
                        title: "Payment Method",
                        subtitle: "Apple Pay"
                    )
                }
                
                mediaExample(
                    "No Media",
                    description: "Text-only menu item"
                ) {
                    DSMenuItem.outline(
                        title: "Settings",
                        subtitle: "Preferences"
                    )
                }
            }
        }
    }
    
    private func mediaExample<Content: View>(
        _ title: String,
        description: String,
        @ViewBuilder content: () -> Content
    ) -> some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing1) {
                Text(title)
                    .thdFont(.bodySm)
                    .foregroundColor(textPrimary)
                
                Text(description)
                    .thdFont(.caption)
                    .foregroundColor(textTertiary)
            }
            
            content()
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
            sectionHeader("Interactive Examples", description: "Try the menu items")
            
            VStack(spacing: TokensSpacing.Spacing4) {
                InteractiveSelectionExample()
                
                InteractiveNavigationExample()
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
            sectionHeader("Usage Examples", description: "Real-world menu implementations")
            
            Text("Account Selector")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
            
            accountSelectorExample
            
            Text("Settings Menu")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
                .padding(.top, TokensSpacing.Spacing2)
            
            settingsMenuExample
            
            Text("Payment Methods")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
                .padding(.top, TokensSpacing.Spacing2)
            
            paymentMethodsExample
        }
    }
    
    private var accountSelectorExample: some View {
        VStack(spacing: 12) {
            DSMenuItem.outline(
                media: .icon(Image(systemName: "person.fill")),
                title: "Personal Account",
                subtitle: "john.doe@email.com",
                isSelected: true,
                showChevron: true,
                onTap: {
                    print("Personal account selected")
                }
            )
            
            DSMenuItem.outline(
                media: .icon(Image(systemName: "briefcase.fill")),
                title: "Business Account",
                subtitle: "company@business.com",
                isSelected: false,
                showChevron: true,
                onTap: {
                    print("Business account selected")
                }
            )
            
            DSMenuItem.outline(
                media: .icon(Image(systemName: "plus.circle.fill")),
                title: "Add Account",
                subtitle: "Sign in or create new",
                showChevron: true,
                onTap: {
                    print("Add account tapped")
                }
            )
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerWhite)
        )
    }
    
    private var settingsMenuExample: some View {
        VStack(spacing: 12) {
            DSMenuItem.ghost(
                media: .icon(Image(systemName: "person.fill")),
                title: "Account & Profile",
                subtitle: "Personal information",
                showChevron: true,
                onTap: {
                    print("Account tapped")
                }
            )
            
            DSMenuItem.ghost(
                media: .icon(Image(systemName: "bell.fill")),
                title: "Notifications",
                subtitle: "Manage alerts",
                showChevron: true,
                onTap: {
                    print("Notifications tapped")
                }
            )
            
            DSMenuItem.ghost(
                media: .icon(Image(systemName: "lock.fill")),
                title: "Privacy & Security",
                subtitle: "Control your data",
                showChevron: true,
                onTap: {
                    print("Privacy tapped")
                }
            )
            
            DSMenuItem.ghost(
                media: .icon(Image(systemName: "questionmark.circle.fill")),
                title: "Help & Support",
                subtitle: "Get assistance",
                showChevron: true,
                onTap: {
                    print("Help tapped")
                }
            )
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerWhite)
        )
    }
    
    private var paymentMethodsExample: some View {
        VStack(spacing: 12) {
            DSMenuItem.outline(
                media: .payment,
                title: "Apple Pay",
                subtitle: "•••• 4242",
                isSelected: true,
                showChevron: true,
                onTap: {
                    print("Apple Pay selected")
                }
            )
            
            DSMenuItem.outline(
                media: .payment,
                title: "Visa",
                subtitle: "•••• 1234",
                isSelected: false,
                showChevron: true,
                onTap: {
                    print("Visa selected")
                }
            )
            
            DSMenuItem.outline(
                media: .icon(Image(systemName: "plus")),
                title: "Add Payment Method",
                subtitle: "Credit or debit card",
                showChevron: true,
                onTap: {
                    print("Add payment tapped")
                }
            )
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
                specRow("Component", value: "DSMenuItem")
                specRow("Styles", value: "2 variants (outline, ghost)")
                specRow("States", value: "Default, Selected")
                specRow("Horizontal Padding", value: "16pt (outline), 0pt (ghost)")
                specRow("Vertical Padding", value: "12pt")
                specRow("Icon Size", value: "24x24pt")
                specRow("Image Size", value: "40x40pt")
                specRow("Corner Radius", value: "8pt")
                specRow("Border Width", value: "1pt (outline only)")
                specRow("Media Spacing", value: "12pt")
            }
            .padding(TokensSpacing.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(containerGreige)
            )
            
            Text("Typography")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
                .padding(.top, TokensSpacing.Spacing2)
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                specRow("Title Font", value: "System, 20pt, Semibold")
                specRow("Subtitle Font", value: "THD Sm Beta, 14pt")
            }
            .padding(TokensSpacing.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(containerGreige)
            )
            
            Text("Media Types")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
                .padding(.top, TokensSpacing.Spacing2)
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing1) {
                mediaTypeRow("icon", description: "24x24pt icon view")
                mediaTypeRow("image", description: "40x40pt image with 3pt radius")
                mediaTypeRow("payment", description: "40x24pt payment card placeholder")
                mediaTypeRow("custom", description: "Any custom view")
            }
            .padding(TokensSpacing.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(containerGreige)
            )
            
            Text("Code Example")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
                .padding(.top, TokensSpacing.Spacing2)
            
            codeExample("""
// Basic outline menu item
DSMenuItem.outline(
    media: .icon(Image(systemName: "person.fill")),
    title: "Bob J.",
    subtitle: "Account",
    showChevron: true
)

// Selected state
DSMenuItem.outline(
    media: .icon(Image(systemName: "person.fill")),
    title: "Bob J.",
    subtitle: "Account",
    isSelected: true,
    showChevron: true,
    onTap: { /* action */ }
)

// Ghost style
DSMenuItem.ghost(
    media: .icon(Image(systemName: "settings")),
    title: "Settings",
    subtitle: "Preferences",
    showChevron: true,
    onTap: { /* action */ }
)

// With payment media
DSMenuItem.outline(
    media: .payment,
    title: "Payment Method",
    subtitle: "•••• 4242",
    isSelected: true
)

// Custom content
DSMenuItem(
    style: .outline,
    customContent: HStack {
        Image(systemName: "star.fill")
        Text("Custom Content")
    }
)
""")
        }
    }
    
    private func mediaTypeRow(_ type: String, description: String) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(".\(type)")
                .thdFont(.caption)
                .foregroundColor(textPrimary)
                .font(.system(.caption, design: .monospaced))
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
    
    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }
}

// MARK: - Supporting Views

/// Interactive selection example
private struct InteractiveSelectionExample: View {
    @State private var selectedIndex = 0
    
    let accounts = [
        ("Personal", "john@email.com", "person.fill"),
        ("Business", "work@company.com", "briefcase.fill"),
        ("Family", "family@email.com", "house.fill")
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            HStack {
                Text("Interactive Selection")
                    .thdFont(.bodySm)
                    .foregroundColor(TokensSemanticLight.TextOnContainerColorSecondary)
                
                Spacer()
                
                Text("Selected: \(accounts[selectedIndex].0)")
                    .thdFont(.caption)
                    .foregroundColor(TokensSemanticLight.TextOnContainerColorPrimary)
            }
            
            VStack(spacing: 8) {
                ForEach(0..<accounts.count, id: \.self) { index in
                    DSMenuItem.outline(
                        media: .icon(Image(systemName: accounts[index].2)),
                        title: accounts[index].0,
                        subtitle: accounts[index].1,
                        isSelected: selectedIndex == index,
                        showChevron: true,
                        onTap: {
                            selectedIndex = index
                        }
                    )
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

/// Interactive navigation example
private struct InteractiveNavigationExample: View {
    @State private var tapCount = 0
    @State private var lastTapped = "None"
    
    let menuItems = [
        ("Settings", "Preferences", "gearshape.fill"),
        ("Profile", "Edit info", "person.fill"),
        ("Notifications", "Manage alerts", "bell.fill")
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            HStack {
                Text("Navigation Menu")
                    .thdFont(.bodySm)
                    .foregroundColor(TokensSemanticLight.TextOnContainerColorSecondary)
                
                Spacer()
                
                Text("Taps: \(tapCount)")
                    .thdFont(.caption)
                    .foregroundColor(TokensSemanticLight.TextOnContainerColorPrimary)
            }
            
            if tapCount > 0 {
                Text("Last: \(lastTapped)")
                    .thdFont(.caption)
                    .foregroundColor(TokensSemanticLight.TextOnContainerColorTertiary)
            }
            
            VStack(spacing: 8) {
                ForEach(0..<menuItems.count, id: \.self) { index in
                    DSMenuItem.ghost(
                        media: .icon(Image(systemName: menuItems[index].2)),
                        title: menuItems[index].0,
                        subtitle: menuItems[index].1,
                        showChevron: true,
                        onTap: {
                            tapCount += 1
                            lastTapped = menuItems[index].0
                        }
                    )
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
    DSMenuItemView()
}
