import SwiftUI

// MARK: - Component Catalog View
/// Master catalog view providing navigation to all component demo views.
///
/// This view serves as the main entry point for browsing the complete inventory
/// of THD App Design System components.
struct ComponentCatalogView: View {
    @Binding var showBackButton: Bool
    
    var body: some View {
        NavigationStack {
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
                            Badge("8 Components", variant: .filledSubtle, color: .brand, size: .small)
                            Badge("SwiftUI", variant: .outline, color: .info, size: .small)
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
                        NavigationLink(destination: 
                            DemoViewWrapper(showBackButton: $showBackButton) {
                                ButtonDemoView()
                            }
                        ) {
                            ComponentRow(
                                icon: "hand.tap",
                                iconColor: DesignSystemGlobal.BrandBrand300,
                                title: "Button",
                                description: "Primary and secondary action buttons",
                                variants: ["Orange Filled", "Outlined", "Ghost", "Icon Buttons"]
                            )
                        }
                        .buttonStyle(.plain)
                    }

                    // MARK: - Display Components
                    ComponentSection(title: "Display", description: "Components for presenting information and feedback") {
                        NavigationLink(destination: 
                            DemoViewWrapper(showBackButton: $showBackButton) {
                                BadgeDemoView()
                            }
                        ) {
                            ComponentRow(
                                icon: "tag",
                                iconColor: DesignSystemGlobal.MoonlightMoonlight500,
                                title: "Badge",
                                description: "Labels for categorization and status",
                                variants: ["Outline", "Filled Subtle", "Filled Strong", "Indicator"]
                            )
                        }
                        .buttonStyle(.plain)

                        NavigationLink(destination: 
                            DemoViewWrapper(showBackButton: $showBackButton) {
                                AlertDemoView()
                            }
                        ) {
                            ComponentRow(
                                icon: "exclamationmark.triangle",
                                iconColor: DesignSystemGlobal.LemonLemon500,
                                title: "Alert",
                                description: "Feedback messages for various states",
                                variants: ["Informational", "Success", "Warning", "Error"]
                            )
                        }
                        .buttonStyle(.plain)

                        NavigationLink(destination: 
                            DemoViewWrapper(showBackButton: $showBackButton) {
                                CalloutDemoView()
                            }
                        ) {
                            ComponentRow(
                                icon: "megaphone",
                                iconColor: DesignSystemGlobal.BottleGreenBottleGreen500,
                                title: "Callout",
                                description: "Promotional and informational callouts",
                                variants: ["Neutral", "Inverse", "Brand"]
                            )
                        }
                        .buttonStyle(.plain)
                    }

                    // MARK: - Selection Components
                    ComponentSection(title: "Selection", description: "Components for user choices and options") {
                        NavigationLink(destination: 
                            DemoViewWrapper(showBackButton: $showBackButton) {
                                PillDemoView()
                            }
                        ) {
                            ComponentRow(
                                icon: "capsule",
                                iconColor: DesignSystemGlobal.CinnabarCinnabar500,
                                title: "Pill",
                                description: "Selectable chips for filters and tags",
                                variants: ["Outlined", "Filled", "With Icons"]
                            )
                        }
                        .buttonStyle(.plain)

                        NavigationLink(destination: 
                            DemoViewWrapper(showBackButton: $showBackButton) {
                                TileDemoView()
                            }
                        ) {
                            ComponentRow(
                                icon: "square.grid.2x2",
                                iconColor: DesignSystemGlobal.MoonlightMoonlight600,
                                title: "Tile",
                                description: "Selectable tiles for options and attributes",
                                variants: ["Outlined", "Filled", "Ghost", "Layouts"]
                            )
                        }
                        .buttonStyle(.plain)
                    }

                    // MARK: - Input Components
                    ComponentSection(title: "Input", description: "Components for user data entry") {
                        NavigationLink(destination: 
                            DemoViewWrapper(showBackButton: $showBackButton) {
                                QuantityDemoView()
                            }
                        ) {
                            ComponentRow(
                                icon: "plusminus",
                                iconColor: DesignSystemGlobal.BrandBrand400,
                                title: "Quantity Picker",
                                description: "Expandable quantity selectors",
                                variants: ["Orange", "Grey", "Standalone Buttons"]
                            )
                        }
                        .buttonStyle(.plain)
                    }

                    // MARK: - Design System
                    ComponentSection(title: "Design System", description: "Foundation tokens and typography system") {
                        NavigationLink(destination: 
                            DemoViewWrapper(showBackButton: $showBackButton) {
                                TypographyDemoView()
                            }
                        ) {
                            ComponentRow(
                                icon: "textformat",
                                iconColor: DesignSystemGlobal.MoonlightMoonlight500,
                                title: "Typography",
                                description: "Custom font families and type scale",
                                variants: ["Display Font", "Informational Font", "Heroes", "Body Text"]
                            )
                        }
                        .buttonStyle(.plain)
                        
                        NavigationLink(destination: 
                            DemoViewWrapper(showBackButton: $showBackButton) {
                                DesignSystemDemoView()
                            }
                        ) {
                            ComponentRow(
                                icon: "paintpalette",
                                iconColor: DesignSystemGlobal.BrandBrand300,
                                title: "Design Tokens",
                                description: "Complete design system token reference",
                                variants: ["Colors", "Typography", "Spacing", "Borders", "Elevation"]
                            )
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(DesignSystemGlobal.Spacing4)
                .padding(.top, 60) // Extra padding for top navigation
                .padding(.bottom, 80) // Extra padding for bottom navigation
            }
            .applyEnhancedScrollEdges() // Apply scroll edges to catalog ScrollView
            .background(DesignSystemGlobal.BackgroundSurfaceColorGreige)
            .navigationBarHidden(true) // Hide the NavigationStack's built-in bar
            .onAppear {
                // Hide back button when on catalog view
                showBackButton = false
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity) // Ensure NavigationStack fills viewport
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
                    .thdFont(.h5)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

                Text(description)
                    .thdFont(.caption)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorTertiary)
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
                                .background(DesignSystemGlobal.GreigeGreige050)
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

// MARK: - Demo View Wrapper
/// Wrapper that handles showing/hiding back button and navigation bar for demo views
struct DemoViewWrapper<Content: View>: View {
    @Binding var showBackButton: Bool
    @Environment(\.dismiss) private var dismiss
    @State private var isAppearing = false
    @ViewBuilder let content: () -> Content
    
    var body: some View {
        content()
            .frame(maxWidth: .infinity, maxHeight: .infinity) // Ensure full viewport size
            .background(DesignSystemGlobal.BackgroundSurfaceColorGreige) // Add background
            .applyEnhancedScrollEdges() // Apply scroll edges to each demo view
            .navigationBarHidden(true)
            .opacity(isAppearing ? 1.0 : 0.0)
            .onAppear {
                showBackButton = true
                withAnimation(.easeOut(duration: 0.3)) {
                    isAppearing = true
                }
            }
            .onChange(of: showBackButton) { oldValue, newValue in
                // Fade out and dismiss when back button is tapped (showBackButton goes from true to false)
                if oldValue && !newValue {
                    withAnimation(.easeIn(duration: 0.25)) {
                        isAppearing = false
                    }
                    // Delay dismiss to allow fade out animation to complete
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                        dismiss()
                    }
                }
            }
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
