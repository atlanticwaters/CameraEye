import SwiftUI

// MARK: - DSTabs Showcase View

/// Comprehensive showcase of the DSTabs component
///
/// Demonstrates:
/// - All 3 sizes (small, medium, large)
/// - All 2 styles (ghost, black5)
/// - DSTab and DSTabGroup usage
/// - Scrollable tab groups
/// - Icons in tabs
/// - Interactive tab selection
/// - Dark mode support
/// - Real-world usage examples

struct DSTabsView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing6) {

                // MARK: - Header Card
                VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                    Text("Tabs")
                        .thdFont(.hero5)
                        .foregroundStyle(textPrimary)

                    Text("A horizontal tab navigation component. Supports 3 sizes, 2 styles, optional icons, and scrollable mode for many tabs.")
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

                    // Tab Sizes
                    tabSizesSection

                    Divider().padding(.vertical, TokensCoreLight.Spacing2)

                    // Tab Styles
                    tabStylesSection

                    Divider().padding(.vertical, TokensCoreLight.Spacing2)

                    // Tab Icons
                    tabIconsSection

                    Divider().padding(.vertical, TokensCoreLight.Spacing2)

                    // Scrollable Tabs
                    scrollableTabsSection

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

    // MARK: - Tab Sizes Section

    private var tabSizesSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader(
                "Tab Sizes",
                description: "Small (22pt), Medium (36pt), and Large (44pt)"
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                TabSizeExample(size: .small, sizeLabel: "22pt height")
                TabSizeExample(size: .medium, sizeLabel: "36pt height")
                TabSizeExample(size: .large, sizeLabel: "44pt height")
            }
        }
    }

    // MARK: - Tab Styles Section

    private var tabStylesSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader(
                "Tab Styles",
                description: "Ghost and Black 5% background styles"
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                TabStyleExample(
                    title: "Ghost",
                    description: "Transparent background",
                    style: .ghost
                )

                TabStyleExample(
                    title: "Black 5%",
                    description: "Subtle background tint",
                    style: .black5
                )
            }
        }
    }

    // MARK: - Tab Icons Section

    private var tabIconsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader(
                "Tab Icons",
                description: "Tabs with optional icons"
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                TabIconExample(
                    title: "Text Only",
                    description: "Standard tabs without icons",
                    showIcons: false
                )

                TabIconExample(
                    title: "With Icons",
                    description: "Tabs with leading icons",
                    showIcons: true
                )
            }
        }
    }

    // MARK: - Scrollable Tabs Section

    private var scrollableTabsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader(
                "Scrollable Tabs",
                description: "Horizontal scroll for many tabs"
            )

            ScrollableTabsExample()
        }
    }

    // MARK: - Interactive Section

    private var interactiveSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader("Interactive Examples", description: "Try selecting tabs")

            VStack(spacing: TokensCoreLight.Spacing4) {
                InteractiveTabExample()

                InteractiveTabWithContent()
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

            Text("Product Details Tabs")
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)

            ProductDetailsTabs()

            Text("Account Settings")
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
                .padding(.top, TokensCoreLight.Spacing2)

            AccountSettingsTabs()
        }
    }

    // MARK: - Specifications Section

    private var specificationsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader("Specifications", description: "Component details and dimensions")

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                specRow("Component", value: "DSTabs, DSTab, DSTabGroup")
                specRow("Sizes", value: "3 (small, medium, large)")
                specRow("Styles", value: "2 (ghost, black5)")
                specRow("Small Height", value: "22pt")
                specRow("Medium Height", value: "36pt")
                specRow("Large Height", value: "44pt")
                specRow("Indicator Height", value: "2pt (sm/md), 3pt (lg)")
                specRow("Press Opacity", value: "0.7")
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
// Define tabs
let tabs = [
    DSTabItem(label: "Products"),
    DSTabItem(label: "Reviews"),
    DSTabItem(label: "Details")
]

// Tab group with selection binding
DSTabGroup(
    tabs: tabs,
    selectedTabId: $selectedTabId,
    size: .medium,
    style: .ghost
)

// With icons
let iconTabs = [
    DSTabItem(label: "Home", icon: Image(systemName: "house")),
    DSTabItem(label: "Search", icon: Image(systemName: "magnifyingglass"))
]

// Scrollable tabs
DSTabGroup(
    tabs: manyTabs,
    selectedTabId: $selectedId,
    isScrollable: true
)
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

/// Tab size example
private struct TabSizeExample: View {
    @Environment(\.colorScheme) var colorScheme

    let size: DSTabSize
    let sizeLabel: String

    @State private var selectedId = "tab1"

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    private var tabs: [DSTabItem] {
        [
            DSTabItem(id: "tab1", label: "Products"),
            DSTabItem(id: "tab2", label: "Reviews"),
            DSTabItem(id: "tab3", label: "Details")
        ]
    }

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            HStack {
                Text(size.displayName)
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorPrimary)

                Spacer()

                Text(sizeLabel)
                    .thdFont(.caption)
                    .foregroundStyle(tokens.TextOnContainerColorTertiary)
            }

            DSTabGroup(tabs: tabs, selectedTabId: $selectedId, size: size)
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: tokens.BorderRadiusLg)
                .fill(tokens.BackgroundContainerColorGreige)
        )
    }
}

/// Tab style example
private struct TabStyleExample: View {
    @Environment(\.colorScheme) var colorScheme

    let title: String
    let description: String
    let style: DSTabStyle

    @State private var selectedId = "tab1"

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    private var tabs: [DSTabItem] {
        [
            DSTabItem(id: "tab1", label: "Products"),
            DSTabItem(id: "tab2", label: "Reviews"),
            DSTabItem(id: "tab3", label: "Details")
        ]
    }

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                Text(title)
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorPrimary)

                Text(description)
                    .thdFont(.caption)
                    .foregroundStyle(tokens.TextOnContainerColorTertiary)
            }

            DSTabGroup(tabs: tabs, selectedTabId: $selectedId, size: .medium, style: style)
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: tokens.BorderRadiusLg)
                .fill(tokens.BackgroundContainerColorGreige)
        )
    }
}

/// Tab icon example
private struct TabIconExample: View {
    @Environment(\.colorScheme) var colorScheme

    let title: String
    let description: String
    let showIcons: Bool

    @State private var selectedId = "tab1"

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    private var tabs: [DSTabItem] {
        if showIcons {
            return [
                DSTabItem(id: "tab1", label: "Home", icon: Image(systemName: "house")),
                DSTabItem(id: "tab2", label: "Search", icon: Image(systemName: "magnifyingglass")),
                DSTabItem(id: "tab3", label: "Cart", icon: Image(systemName: "cart"))
            ]
        } else {
            return [
                DSTabItem(id: "tab1", label: "Home"),
                DSTabItem(id: "tab2", label: "Search"),
                DSTabItem(id: "tab3", label: "Cart")
            ]
        }
    }

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                Text(title)
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorPrimary)

                Text(description)
                    .thdFont(.caption)
                    .foregroundStyle(tokens.TextOnContainerColorTertiary)
            }

            DSTabGroup(tabs: tabs, selectedTabId: $selectedId, size: .medium)
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: tokens.BorderRadiusLg)
                .fill(tokens.BackgroundContainerColorGreige)
        )
    }
}

/// Scrollable tabs example
private struct ScrollableTabsExample: View {
    @Environment(\.colorScheme) var colorScheme

    @State private var selectedId = "cat1"

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    private var tabs: [DSTabItem] {
        [
            DSTabItem(id: "cat1", label: "All Products"),
            DSTabItem(id: "cat2", label: "Power Tools"),
            DSTabItem(id: "cat3", label: "Hand Tools"),
            DSTabItem(id: "cat4", label: "Outdoor"),
            DSTabItem(id: "cat5", label: "Paint"),
            DSTabItem(id: "cat6", label: "Plumbing"),
            DSTabItem(id: "cat7", label: "Electrical"),
            DSTabItem(id: "cat8", label: "Hardware")
        ]
    }

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            Text("Scroll horizontally to see more tabs")
                .thdFont(.caption)
                .foregroundStyle(tokens.TextOnContainerColorTertiary)

            DSTabGroup(tabs: tabs, selectedTabId: $selectedId, size: .medium, isScrollable: true)
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: tokens.BorderRadiusLg)
                .fill(tokens.BackgroundContainerColorGreige)
        )
    }
}

/// Interactive tab example
private struct InteractiveTabExample: View {
    @Environment(\.colorScheme) var colorScheme

    @State private var selectedId = "tab1"

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    private var tabs: [DSTabItem] {
        [
            DSTabItem(id: "tab1", label: "First"),
            DSTabItem(id: "tab2", label: "Second"),
            DSTabItem(id: "tab3", label: "Third")
        ]
    }

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            HStack {
                Text("Tab Selection")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorSecondary)

                Spacer()

                Text("Selected: \(selectedId)")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorPrimary)
            }

            DSTabGroup(tabs: tabs, selectedTabId: $selectedId, size: .medium)
        }
        .padding(TokensCoreLight.Spacing2)
        .background(
            RoundedRectangle(cornerRadius: tokens.BorderRadiusSm)
                .fill(tokens.BackgroundContainerColorWhite)
        )
    }
}

/// Interactive tab with content example
private struct InteractiveTabWithContent: View {
    @Environment(\.colorScheme) var colorScheme

    @State private var selectedId = "overview"

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    private var tabs: [DSTabItem] {
        [
            DSTabItem(id: "overview", label: "Overview"),
            DSTabItem(id: "specs", label: "Specs"),
            DSTabItem(id: "reviews", label: "Reviews")
        ]
    }

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            Text("Tabs with Content")
                .thdFont(.bodySm)
                .foregroundStyle(tokens.TextOnContainerColorSecondary)

            DSTabGroup(tabs: tabs, selectedTabId: $selectedId, size: .medium)

            // Content based on selection
            Group {
                switch selectedId {
                case "overview":
                    Text("Product overview content goes here. This section provides a general description.")
                case "specs":
                    Text("Technical specifications: Weight, Dimensions, Power, etc.")
                case "reviews":
                    Text("Customer reviews and ratings are displayed in this section.")
                default:
                    Text("Select a tab")
                }
            }
            .thdFont(.bodySm)
            .foregroundStyle(tokens.TextOnContainerColorSecondary)
            .padding(TokensCoreLight.Spacing2)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: tokens.BorderRadiusSm)
                    .fill(tokens.BackgroundContainerColorGreige)
            )
        }
        .padding(TokensCoreLight.Spacing2)
        .background(
            RoundedRectangle(cornerRadius: tokens.BorderRadiusSm)
                .fill(tokens.BackgroundContainerColorWhite)
        )
    }
}

/// Product details tabs example
private struct ProductDetailsTabs: View {
    @Environment(\.colorScheme) var colorScheme

    @State private var selectedId = "description"

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    private var tabs: [DSTabItem] {
        [
            DSTabItem(id: "description", label: "Description"),
            DSTabItem(id: "specifications", label: "Specifications"),
            DSTabItem(id: "reviews", label: "Reviews (42)")
        ]
    }

    var body: some View {
        DSTabGroup(tabs: tabs, selectedTabId: $selectedId, size: .large)
            .padding(TokensCoreLight.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: tokens.BorderRadiusLg)
                    .fill(tokens.BackgroundContainerColorWhite)
            )
    }
}

/// Account settings tabs example
private struct AccountSettingsTabs: View {
    @Environment(\.colorScheme) var colorScheme

    @State private var selectedId = "profile"

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    private var tabs: [DSTabItem] {
        [
            DSTabItem(id: "profile", label: "Profile", icon: Image(systemName: "person")),
            DSTabItem(id: "orders", label: "Orders", icon: Image(systemName: "bag")),
            DSTabItem(id: "settings", label: "Settings", icon: Image(systemName: "gear"))
        ]
    }

    var body: some View {
        DSTabGroup(tabs: tabs, selectedTabId: $selectedId, size: .medium)
            .padding(TokensCoreLight.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: tokens.BorderRadiusLg)
                    .fill(tokens.BackgroundContainerColorWhite)
            )
    }
}

// MARK: - Display Name Extension
extension DSTabSize {
    var displayName: String {
        switch self {
        case .small: "Small"
        case .medium: "Medium"
        case .large: "Large"
        }
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
    DSTabsView()
}
