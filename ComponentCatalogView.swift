import SwiftUI

// MARK: - Component Catalog View
/// Master catalog view providing navigation to all component demo views.
///
/// This view serves as the main entry point for browsing the complete inventory
/// of THD App Design System components.
struct ComponentCatalogView: View {
    @Binding var showBackButton: Bool
    @State private var navigationPath = NavigationPath()

    var body: some View {
        ZStack {
            NavigationStack(path: $navigationPath) {
                ComponentCatalogScrollableContent(
                    showBackButton: $showBackButton,
                    navigationPath: $navigationPath
                )
                .navigationDestination(for: String.self) { destination in
                    componentDetailView(for: destination)
                }
                .navigationBarHidden(true)
            }
            .onAppear {
                // Only reset if we're at the root (empty path)
                if navigationPath.isEmpty {
                    showBackButton = false
                }
            }
            .onChange(of: navigationPath.count) { oldValue, newValue in
                // Update back button state based on navigation depth
                withAnimation {
                    showBackButton = newValue > 0
                }
            }
        }
        .safeAreaBar(edge: .top) {
            MorphingNavHeader(
                showBackButton: showBackButton,
                onBackTapped: {
                    // Custom back action that pops the navigation
                    if !navigationPath.isEmpty {
                        navigationPath.removeLast()
                    }
                }
            )
        }
    }

    // MARK: - Component Detail View Router
    @ViewBuilder
    private func componentDetailView(for destination: String) -> some View {
        switch destination {
        case "Button":
            DSButtonView()
                .catalogDetailStyle()
        case "Card":
            DSCardView()
                .catalogDetailStyle()
        case "ProductCard":
            DSProductCardView()
                .catalogDetailStyle()
        case "Badge":
            DSBadgeView()
                .catalogDetailStyle()
        case "Alert":
            DSAlertView()
                .catalogDetailStyle()
        case "Callout":
            DSCalloutView()
                .catalogDetailStyle()
        case "Pill":
            DSPillView()
                .catalogDetailStyle()
        case "Tile":
            DSTileView()
                .catalogDetailStyle()
        case "QuantityPicker":
            DSQuantityPickerView()
                .catalogDetailStyle()
        case "Typography":
            TypographyDemoView()
                .catalogDetailStyle()
        case "DesignTokens":
            DesignSystemDemoView()
                .catalogDetailStyle()
        default:
            Text("Unknown component")
                .catalogDetailStyle()
        }
    }
}

// MARK: - Component Catalog Scrollable Content
/// Scrollable content for the component catalog
struct ComponentCatalogScrollableContent: View {
    @Binding var showBackButton: Bool
    @Binding var navigationPath: NavigationPath

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing6) {
                // MARK: - Header Card
                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                    Text("Component Catalog")
                        .thdFont(.hero5)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

                    Text("A comprehensive component library using DesignSystemGlobal tokens for consistent styling.")
                        .thdFont(.bodyMd)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    HStack(spacing: DesignSystemGlobal.Spacing2) {
                        DSBadge(label: "9 Components", size: .small, variant: .filledSubtle, color: .brand)
                        DSBadge(label: "SwiftUI", size: .small, variant: .outline, color: .info)
                    }
                    .padding(.top, DesignSystemGlobal.Spacing1)
                }
                .padding(DesignSystemGlobal.Spacing4)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusXl)
                        .fill(DesignSystemGlobal.BackgroundContainerColorWhite)
                )
                .scrollTransition(.interactive) { content, phase in
                    content
                        .scaleEffect(phase.isIdentity ? 1.0 : 0.95)
                        .opacity(phase.isIdentity ? 1.0 : 0.5)
                }

                // MARK: - Action Components
                ComponentSection(title: "Actions", description: "Interactive components for user actions") {
                    NavigationLink(value: "Button") {
                        ComponentRow(
                            icon: "hand.tap",
                            iconColor: DesignSystemGlobal.Brand300,
                            title: "Button",
                            description: "Primary and secondary action buttons",
                            variants: ["Orange Filled", "Outlined", "Ghost", "Icon Buttons"]
                        )
                    }
                    .buttonStyle(.plain)
                }

                // MARK: - Display Components
                ComponentSection(title: "Display", description: "Components for presenting information and feedback") {
                    NavigationLink(value: "Card") {
                        ComponentRow(
                            icon: "rectangle",
                            iconColor: DesignSystemGlobal.Moonlight400,
                            title: "Card",
                            description: "Flexible card containers for content and products",
                            variants: ["Content Card", "Mini Product Card", "Horizontal", "Vertical"]
                        )
                    }
                    .buttonStyle(.plain)

                    NavigationLink(value: "ProductCard") {
                        ComponentRow(
                            icon: "square.grid.2x2",
                            iconColor: DesignSystemGlobal.Brand400,
                            title: "Product Card",
                            description: "Complete product listings with image, details, and actions",
                            variants: ["B2C", "B2B", "Badges", "Swatches", "Ratings"]
                        )
                    }
                    .buttonStyle(.plain)

                    NavigationLink(value: "Badge") {
                        ComponentRow(
                            icon: "tag",
                            iconColor: TokensSemanticLight.Moonlight500,
                            title: "Badge",
                            description: "Labels for categorization and status",
                            variants: ["Outline", "Filled Subtle", "Filled Strong", "Indicator"]
                        )
                    }
                    .buttonStyle(.plain)

                    NavigationLink(value: "Alert") {
                        ComponentRow(
                            icon: "exclamationmark.triangle",
                            iconColor: DesignSystemGlobal.Lemon500,
                            title: "Alert",
                            description: "Feedback messages for various states",
                            variants: ["Informational", "Success", "Warning", "Error"]
                        )
                    }
                    .buttonStyle(.plain)

                    NavigationLink(value: "Callout") {
                        ComponentRow(
                            icon: "megaphone",
                            iconColor: DesignSystemGlobal.BottleGreen500,
                            title: "Callout",
                            description: "Promotional and informational callouts",
                            variants: ["Neutral", "Inverse", "Brand"]
                        )
                    }
                    .buttonStyle(.plain)
                }

                // MARK: - Selection Components
                ComponentSection(title: "Selection", description: "Components for user choices and options") {
                    NavigationLink(value: "Pill") {
                        ComponentRow(
                            icon: "capsule",
                            iconColor: DesignSystemGlobal.Cinnabar500,
                            title: "Pill",
                            description: "Selectable chips for filters and tags",
                            variants: ["Outlined", "Filled", "With Icons"]
                        )
                    }
                    .buttonStyle(.plain)

                    NavigationLink(value: "Tile") {
                        ComponentRow(
                            icon: "square.grid.2x2",
                            iconColor: DesignSystemGlobal.Moonlight600,
                            title: "Tile",
                            description: "Selectable tiles for options and attributes",
                            variants: ["Outlined", "Filled", "Ghost", "Layouts"]
                        )
                    }
                    .buttonStyle(.plain)
                }

                // MARK: - Input Components
                ComponentSection(title: "Input", description: "Components for user data entry") {
                    NavigationLink(value: "QuantityPicker") {
                        ComponentRow(
                            icon: "plusminus",
                            iconColor: DesignSystemGlobal.Brand400,
                            title: "Quantity Picker",
                            description: "Expandable quantity selectors",
                            variants: ["Orange", "Grey", "Standalone Buttons"]
                        )
                    }
                    .buttonStyle(.plain)
                }

                // MARK: - Design System
                ComponentSection(title: "Design System", description: "Foundation tokens and typography system") {
                    NavigationLink(value: "Typography") {
                        ComponentRow(
                            icon: "textformat",
                            iconColor: DesignSystemGlobal.Moonlight500,
                            title: "Typography",
                            description: "Custom font families and type scale",
                            variants: ["Display Font", "Informational Font", "Heroes", "Body Text"]
                        )
                    }
                    .buttonStyle(.plain)

                    NavigationLink(value: "DesignTokens") {
                        ComponentRow(
                            icon: "paintpalette",
                            iconColor: DesignSystemGlobal.Brand300,
                            title: "Design Tokens",
                            description: "Complete design system token reference",
                            variants: ["Colors", "Typography", "Spacing", "Borders", "Elevation"]
                        )
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(DesignSystemGlobal.Spacing4)
            .padding(.top, 96) // Top padding to clear menu icons
            .padding(.bottom, 80) // Extra padding for bottom tab bar
        }
        .scrollEdgeEffectStyle(.soft, for: .top)
        .scrollEdgeEffectStyle(.soft, for: .bottom)
        .background(DesignSystemGlobal.BackgroundSurfaceColorGreige)
        .navigationBarHidden(true)
    }
}

// MARK: - Component Section
/// Section view for grouping components by category
struct ComponentSection<Content: View>: View {
    let title: String
    let description: String
    @ViewBuilder let content: () -> Content
    
    var body: some View {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
            // Section Header
            VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing1) {
                Text(title)
                    .thdFont(.h2)
                    .textCase(.uppercase)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)
                    .padding(.leading, DesignSystemGlobal.Spacing3)

                Text(description)
                    .thdFont(.caption)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorTertiary)
                    .padding(.leading, DesignSystemGlobal.Spacing3)
            }
            
            // Section Content
            VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                content()
            }
            .padding(DesignSystemGlobal.Spacing3)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusXl)
                    .fill(DesignSystemGlobal.BackgroundContainerColorWhite)
            )
        }
    }
}

// MARK: - Component Row
/// Row view for displaying component information in the catalog list.
struct ComponentRow: View {
    let icon: String
    let iconColor: Color
    let title: String
    let description: String
    let variants: [String]

    var body: some View {
        HStack(alignment: .center, spacing: DesignSystemGlobal.Spacing3) {
            // Icon with glass background
            Image(systemName: icon)
                .font(.thdBodyLg)
                .foregroundColor(iconColor)
                .frame(width: 36, height: 36)
                .background(iconColor.opacity(0.15))
                .background(Material.ultraThinMaterial)
                .cornerRadius(DesignSystemGlobal.BorderRadiusXl)

            // Content
            VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing1) {
                Text(title)
                    .thdFont(.bodyMd)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

                Text(description)
                    .thdFont(.bodySm)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                // Variant tags
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: DesignSystemGlobal.Spacing1) {
                        ForEach(variants, id: \.self) { variant in
                            Text(variant)
                                .thdFont(.caption)
                                .foregroundColor(DesignSystemGlobal.TextOnContainerColorTertiary)
                                .padding(.horizontal, 6)
                                .padding(.vertical, 5)
                                .background(DesignSystemGlobal.Greige050)
                                .cornerRadius(DesignSystemGlobal.BorderRadiusSm)
                        }
                    }
                }
                .padding(.top, 2)
            }
            
            Spacer()
            
            // Chevron indicator
            Image(systemName: "chevron.right")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorTertiary)
        }
        .padding(DesignSystemGlobal.Spacing2)
        .background(DesignSystemGlobal.BackgroundContainerColorWhite)
        .cornerRadius(DesignSystemGlobal.BorderRadiusLg)
    }
}

// MARK: - Catalog Detail Style Modifier
/// View modifier that applies consistent styling for component detail views
struct CatalogDetailStyleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .scrollEdgeEffectStyle(.soft, for: .top)
            .scrollEdgeEffectStyle(.soft, for: .bottom)
            .background(DesignSystemGlobal.BackgroundSurfaceColorGreige)
            .navigationBarHidden(true)
    }
}

extension View {
    /// Applies consistent styling for component catalog detail views
    func catalogDetailStyle() -> some View {
        modifier(CatalogDetailStyleModifier())
    }
}

// MARK: - Previews
#Preview("Component Catalog") {
    @Previewable @State var showBackButton = false
    ComponentCatalogView(showBackButton: $showBackButton)
}

#Preview("Component Row") {
    List {
        ComponentRow(
            icon: "hand.tap",
            iconColor: .orange,
            title: "Button",
            description: "Primary and secondary action buttons",
            variants: ["Orange Filled", "Outlined", "Ghost"]
        )
    }
}

// MARK: - Safe Area Bar Extension
extension View {
    /// Adds a persistent overlay bar at the specified edge that respects safe area.
    /// This is used for navigation headers that should stay visible while content scrolls underneath.
    /// The bar has no solid background - it relies on the content's `.scrollEdgeEffectStyle(.soft)`
    /// to create the soft fade effect, consistent with the native iOS bottom tab bar behavior.
    ///
    /// - Parameters:
    ///   - edge: The edge where the bar should be placed (currently supports .top)
    ///   - content: The view builder for the bar content
    func safeAreaBar<Content: View>(edge: VerticalEdge, @ViewBuilder content: @escaping () -> Content) -> some View {
        self.overlay(alignment: edge == .top ? .top : .bottom) {
            content()
                .padding(.horizontal, DesignSystemGlobal.Spacing4)
                .padding(edge == .top ? .top : .bottom, DesignSystemGlobal.Spacing3)
                .padding(edge == .top ? .bottom : .top, DesignSystemGlobal.Spacing2)
                .frame(maxWidth: .infinity)
                .ignoresSafeArea(edges: edge == .top ? .top : .bottom)
        }
    }
}
