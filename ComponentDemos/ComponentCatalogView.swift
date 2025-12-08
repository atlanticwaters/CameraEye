import SwiftUI

// MARK: - Component Catalog View
/// Master catalog view providing navigation to all component demo views.
///
/// This view serves as the main entry point for browsing the complete inventory
/// of THD App Design System components.
struct ComponentCatalogView: View {
    var body: some View {
        NavigationStack {
            List {
                // MARK: - Overview Section
                Section {
                    VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                        Text("THD App Design System")
                            .thdFont(.h3).fontWeight(.bold)

                        Text("A comprehensive component library using DesignSystemGlobal tokens for consistent styling.")
                            .thdFont(.bodyMd)
                            .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                        HStack(spacing: DesignSystemGlobal.Spacing2) {
                            Badge("8 Components", variant: .filledSubtle, color: .brand, size: .small)
                            Badge("SwiftUI", variant: .outline, color: .info, size: .small)
                        }
                        .padding(.top, DesignSystemGlobal.Spacing1)
                    }
                    .padding(.vertical, DesignSystemGlobal.Spacing2)
                }

                // MARK: - Action Components
                Section {
                    NavigationLink(destination: ButtonDemoView()) {
                        ComponentRow(
                            icon: "hand.tap",
                            iconColor: DesignSystemGlobal.BrandBrand300,
                            title: "Button",
                            description: "Primary and secondary action buttons",
                            variants: ["Orange Filled", "Outlined", "Ghost", "Icon Buttons"]
                        )
                    }
                } header: {
                    sectionHeader("Actions", description: "Interactive components for user actions")
                }

                // MARK: - Display Components
                Section {
                    NavigationLink(destination: BadgeDemoView()) {
                        ComponentRow(
                            icon: "tag",
                            iconColor: DesignSystemGlobal.MoonlightMoonlight500,
                            title: "Badge",
                            description: "Labels for categorization and status",
                            variants: ["Outline", "Filled Subtle", "Filled Strong", "Indicator"]
                        )
                    }

                    NavigationLink(destination: AlertDemoView()) {
                        ComponentRow(
                            icon: "exclamationmark.triangle",
                            iconColor: DesignSystemGlobal.LemonLemon500,
                            title: "Alert",
                            description: "Feedback messages for various states",
                            variants: ["Informational", "Success", "Warning", "Error"]
                        )
                    }

                    NavigationLink(destination: CalloutDemoView()) {
                        ComponentRow(
                            icon: "megaphone",
                            iconColor: DesignSystemGlobal.BottleGreenBottleGreen500,
                            title: "Callout",
                            description: "Promotional and informational callouts",
                            variants: ["Neutral", "Inverse", "Brand"]
                        )
                    }
                } header: {
                    sectionHeader("Display", description: "Components for presenting information and feedback")
                }

                // MARK: - Selection Components
                Section {
                    NavigationLink(destination: PillDemoView()) {
                        ComponentRow(
                            icon: "capsule",
                            iconColor: DesignSystemGlobal.CinnabarCinnabar500,
                            title: "Pill",
                            description: "Selectable chips for filters and tags",
                            variants: ["Outlined", "Filled", "With Icons"]
                        )
                    }

                    NavigationLink(destination: TileDemoView()) {
                        ComponentRow(
                            icon: "square.grid.2x2",
                            iconColor: DesignSystemGlobal.MoonlightMoonlight600,
                            title: "Tile",
                            description: "Selectable tiles for options and attributes",
                            variants: ["Outlined", "Filled", "Ghost", "Layouts"]
                        )
                    }
                } header: {
                    sectionHeader("Selection", description: "Components for user choices and options")
                }

                // MARK: - Input Components
                Section {
                    NavigationLink(destination: QuantityDemoView()) {
                        ComponentRow(
                            icon: "plusminus",
                            iconColor: DesignSystemGlobal.BrandBrand400,
                            title: "Quantity Picker",
                            description: "Expandable quantity selectors",
                            variants: ["Orange", "Grey", "Standalone Buttons"]
                        )
                    }
                } header: {
                    sectionHeader("Input", description: "Components for user data entry")
                }

                // MARK: - Design System
                Section {
                    NavigationLink(destination: TypographyDemoView()) {
                        ComponentRow(
                            icon: "textformat",
                            iconColor: DesignSystemGlobal.MoonlightMoonlight500,
                            title: "Typography",
                            description: "Custom font families and type scale",
                            variants: ["Display Font", "Informational Font", "Heroes", "Body Text"]
                        )
                    }
                    
                    NavigationLink(destination: DesignSystemDemoView()) {
                        ComponentRow(
                            icon: "paintpalette",
                            iconColor: DesignSystemGlobal.BrandBrand300,
                            title: "Design Tokens",
                            description: "Complete design system token reference",
                            variants: ["Colors", "Typography", "Spacing", "Borders", "Elevation"]
                        )
                    }
                } header: {
                    sectionHeader("Design System", description: "Foundation tokens and typography system")
                }
            }
            .navigationTitle("Component Catalog")
            .navigationBarTitleDisplayMode(.inline)
            .padding(.top, 60) // Extra padding for top navigation
            .padding(.bottom, 80) // Extra padding for bottom navigation
        }
    }
    
    // MARK: - Section Header Helper
    
    /// Custom section header matching the pattern used across demo views
    @ViewBuilder
    private func sectionHeader(_ title: String, description: String) -> some View {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing1) {
            Text(title)
                .thdFont(.h5)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)
                .textCase(nil)

            Text(description)
                .thdFont(.caption)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorTertiary)
                .textCase(nil)
        }
        .padding(.top, DesignSystemGlobal.Spacing2)
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
        HStack(alignment: .top, spacing: DesignSystemGlobal.Spacing3) {
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
                                .padding(.vertical, 2)
                                .background(DesignSystemGlobal.GreigeGreige100)
                                .cornerRadius(DesignSystemGlobal.BorderRadiusSm)
                        }
                    }
                }
                .padding(.top, 2)
            }
        }
        .padding(.vertical, DesignSystemGlobal.Spacing2)
    }
}

// MARK: - Previews
#Preview("Component Catalog") {
    ComponentCatalogView()
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
