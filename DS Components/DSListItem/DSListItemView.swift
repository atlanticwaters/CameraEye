import SwiftUI

// MARK: - DSListItem Showcase View

/// Comprehensive showcase of the DSListItem and DSMenuItem components.
///
/// Demonstrates:
/// - DSListItem types (search, trending, recentlyPurchased, seeAll)
/// - DSMenuItem styles (outline, ghost)
/// - DSMenuItem use cases (basic, composed)
/// - Selection states
/// - Factory methods
/// - Usage examples

struct DSListItemView: View {
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
            Text("DSListItem")
                .thdFont(.h3)
                .foregroundStyle(textPrimary)

            Text("List item components for displaying items in lists with icons and text. Includes DSListItem for search/suggestions and DSMenuItem for settings/navigation menus.")
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
            // List Item Types Section
            listItemTypesSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Factory Methods Section
            factoryMethodsSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Menu Item Styles Section
            menuItemStylesSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Menu Item Use Cases Section
            menuItemUseCasesSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Selection States Section
            selectionStatesSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Usage Examples Section
            usageExamplesSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Specifications Section
            specificationsSection
        }
        .background(surfaceWhite)
        .clipShape(.rect(cornerRadius: TokensCoreLight.Spacing3))
    }

    // MARK: - List Item Types Section

    private var listItemTypesSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "DSListItem Types",
                description: "Different list item types for various contexts."
            )

            VStack(alignment: .leading, spacing: 0) {
                VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                    Text(".search")
                        .thdFont(.caption)
                        .foregroundStyle(textSecondary)
                        .padding(.horizontal, TokensCoreLight.Spacing4)

                    DSListItem(type: .search, text: "dewalt drill")
                }

                VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                    Text(".trending")
                        .thdFont(.caption)
                        .foregroundStyle(textSecondary)
                        .padding(.horizontal, TokensCoreLight.Spacing4)

                    DSListItem(type: .trending, text: "christmas lights")
                }

                VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                    Text(".recentlyPurchased")
                        .thdFont(.caption)
                        .foregroundStyle(textSecondary)
                        .padding(.horizontal, TokensCoreLight.Spacing4)

                    DSListItem(type: .recentlyPurchased, text: "Milwaukee M18 Impact Driver")
                }

                VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                    Text(".seeAll")
                        .thdFont(.caption)
                        .foregroundStyle(textSecondary)
                        .padding(.horizontal, TokensCoreLight.Spacing4)

                    DSListItem(type: .seeAll, text: "See all results for \"dewalt\"")
                }
            }
        }
        .padding(.vertical, TokensCoreLight.Spacing4)
    }

    // MARK: - Factory Methods Section

    private var factoryMethodsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Factory Methods",
                description: "Convenience factory methods for creating list items."
            )

            VStack(alignment: .leading, spacing: 0) {
                VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                    Text(".search()")
                        .thdFont(.caption)
                        .foregroundStyle(textSecondary)
                        .padding(.horizontal, TokensCoreLight.Spacing4)

                    DSListItem.search("power tools")
                }

                VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                    Text(".trending()")
                        .thdFont(.caption)
                        .foregroundStyle(textSecondary)
                        .padding(.horizontal, TokensCoreLight.Spacing4)

                    DSListItem.trending("outdoor furniture")
                }

                VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                    Text(".recentlyPurchased()")
                        .thdFont(.caption)
                        .foregroundStyle(textSecondary)
                        .padding(.horizontal, TokensCoreLight.Spacing4)

                    DSListItem.recentlyPurchased("Paint Brushes Set")
                }

                VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                    Text(".seeAll()")
                        .thdFont(.caption)
                        .foregroundStyle(textSecondary)
                        .padding(.horizontal, TokensCoreLight.Spacing4)

                    DSListItem.seeAll()
                }
            }
        }
        .padding(.vertical, TokensCoreLight.Spacing4)
    }

    // MARK: - Menu Item Styles Section

    private var menuItemStylesSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "DSMenuItem Styles",
                description: "Visual style variants for menu items."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                Text(".outline")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSMenuItem(
                    title: "Account Settings",
                    leadingIcon: Image(systemName: "gearshape"),
                    style: .outline
                )

                Text(".ghost")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSMenuItem(
                    title: "Account Settings",
                    leadingIcon: Image(systemName: "gearshape"),
                    style: .ghost
                )
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - Menu Item Use Cases Section

    private var menuItemUseCasesSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "DSMenuItem Use Cases",
                description: "Basic and composed menu item configurations."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                Text("Basic (icon + title)")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSMenuItem(
                    title: "My Profile",
                    leadingIcon: Image(systemName: "person"),
                    style: .outline
                )

                Text("Composed (icon + title + subtitle)")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSMenuItem(
                    title: "Notifications",
                    subtitle: "Manage your notification preferences",
                    leadingIcon: Image(systemName: "bell"),
                    style: .outline
                )

                Text("With trailing icon")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSMenuItem(
                    title: "Payment Methods",
                    subtitle: "Add or edit payment options",
                    leadingIcon: Image(systemName: "creditcard"),
                    trailingIcon: Image(systemName: "chevron.right"),
                    style: .outline
                )

                Text("Without media")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSMenuItem(
                    title: "Help & Support",
                    subtitle: "Get help with your orders",
                    trailingIcon: Image(systemName: "chevron.right"),
                    style: .outline,
                    showMedia: false
                )
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - Selection States Section

    private var selectionStatesSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Selection States",
                description: "Menu items with selection indicator."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                Text("Not Selected")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSMenuItem(
                    title: "English (US)",
                    leadingIcon: Image(systemName: "globe"),
                    style: .outline,
                    isSelected: false
                )

                Text("Selected")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSMenuItem(
                    title: "English (US)",
                    leadingIcon: Image(systemName: "globe"),
                    trailingIcon: Image(systemName: "checkmark"),
                    style: .outline,
                    isSelected: true
                )
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - Usage Examples Section

    private var usageExamplesSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Usage Examples",
                description: "Real-world list item implementations."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                Text("Search Suggestions")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                VStack(spacing: 0) {
                    DSListItem.search("dewalt drill 20v")
                    DSListItem.search("dewalt battery charger")
                    DSListItem.trending("dewalt combo kit")
                    DSListItem.recentlyPurchased("DEWALT 20V MAX Drill")
                    DSListItem.seeAll("See all results for \"dewalt\"")
                }
                .background(surfaceGreige)
                .clipShape(.rect(cornerRadius: 8))

                Text("Settings Menu")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                VStack(spacing: 8) {
                    DSMenuItem(
                        title: "Account",
                        subtitle: "Personal information & security",
                        leadingIcon: Image(systemName: "person.circle"),
                        trailingIcon: Image(systemName: "chevron.right"),
                        style: .outline
                    )

                    DSMenuItem(
                        title: "Orders",
                        subtitle: "Track and manage your orders",
                        leadingIcon: Image(systemName: "shippingbox"),
                        trailingIcon: Image(systemName: "chevron.right"),
                        style: .outline
                    )

                    DSMenuItem(
                        title: "Lists",
                        subtitle: "View and edit your lists",
                        leadingIcon: Image(systemName: "list.bullet"),
                        trailingIcon: Image(systemName: "chevron.right"),
                        style: .outline
                    )

                    DSMenuItem(
                        title: "Store Finder",
                        subtitle: "Find stores near you",
                        leadingIcon: Image(systemName: "mappin.and.ellipse"),
                        trailingIcon: Image(systemName: "chevron.right"),
                        style: .outline
                    )
                }

                Text("Action Menu (Ghost Style)")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                VStack(spacing: 0) {
                    DSMenuItem(
                        title: "Share",
                        leadingIcon: Image(systemName: "square.and.arrow.up"),
                        style: .ghost
                    )

                    Divider().padding(.leading, 52)

                    DSMenuItem(
                        title: "Add to List",
                        leadingIcon: Image(systemName: "heart"),
                        style: .ghost
                    )

                    Divider().padding(.leading, 52)

                    DSMenuItem(
                        title: "Compare",
                        leadingIcon: Image(systemName: "arrow.left.arrow.right"),
                        style: .ghost
                    )
                }
                .background(surfaceGreige)
                .clipShape(.rect(cornerRadius: 8))
            }
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
                Text("DSListItem Layout")
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)

                specRow(label: "Horizontal Padding", value: "20pt")
                specRow(label: "Vertical Padding", value: "12pt")
                specRow(label: "Icon Size", value: "24pt")
                specRow(label: "Font Size", value: "16pt")

                Text("DSMenuItem Layout")
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)
                    .padding(.top, TokensCoreLight.Spacing2)

                specRow(label: "Horizontal Padding", value: "12pt")
                specRow(label: "Vertical Padding", value: "10pt")
                specRow(label: "Icon Container", value: "40pt × 40pt")
                specRow(label: "Icon Size", value: "24pt")
                specRow(label: "Corner Radius", value: "8pt")

                Text("DSListItem Types")
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)
                    .padding(.top, TokensCoreLight.Spacing2)

                VStack(alignment: .leading, spacing: 4) {
                    Text("• .search - Magnifying glass icon")
                    Text("• .trending - Upward arrow icon")
                    Text("• .recentlyPurchased - Clockwise arrow icon")
                    Text("• .seeAll - Underlined text, no icon")
                }
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)

                Text("Code Example")
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)
                    .padding(.top, TokensCoreLight.Spacing2)

                Text("""
                // DSListItem
                DSListItem(
                    type: .search,
                    text: "search query",
                    onTap: { print("Tapped") }
                )

                // Factory methods
                DSListItem.search("query")
                DSListItem.trending("trending item")
                DSListItem.recentlyPurchased("product")
                DSListItem.seeAll()

                // DSMenuItem
                DSMenuItem(
                    title: "Settings",
                    subtitle: "App preferences",
                    leadingIcon: Image(systemName: "gear"),
                    trailingIcon: Image(systemName: "chevron.right"),
                    style: .outline,
                    isSelected: false,
                    onTap: { print("Tapped") }
                )
                """)
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
                .padding(TokensCoreLight.Spacing3)
                .background(surfaceGreige)
                .clipShape(.rect(cornerRadius: 8))
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
}

// MARK: - Token Protocol Helper

private protocol TokenSemanticProtocol {
    static var TextOnContainerColorPrimary: Color { get }
    static var TextOnContainerColorSecondary: Color { get }
    static var BackgroundContainerColorWhite: Color { get }
    static var BackgroundSurfaceColorGreige: Color { get }
}

extension TokensSemanticLight: TokenSemanticProtocol {}
extension TokensSemanticDark: TokenSemanticProtocol {}

// MARK: - Preview

#Preview {
    DSListItemView()
}
