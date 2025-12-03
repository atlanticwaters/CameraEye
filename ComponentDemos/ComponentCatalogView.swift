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
                            .font(.system(size: DesignSystemGlobal.FontFontSizeH5, weight: .bold))
                            .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

                        Text("A comprehensive component library using DesignSystemGlobal tokens for consistent styling.")
                            .font(.system(size: DesignSystemGlobal.FontFontSizeBodySm, weight: .regular))
                            .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                        HStack(spacing: DesignSystemGlobal.Spacing2) {
                            Badge("7 Components", variant: .filledSubtle, color: .brand, size: .small)
                            Badge("SwiftUI", variant: .outline, color: .info, size: .small)
                        }
                        .padding(.top, DesignSystemGlobal.Spacing1)
                    }
                    .padding(.vertical, DesignSystemGlobal.Spacing2)
                }

                // MARK: - Action Components
                Section("Actions") {
                    NavigationLink(destination: ButtonDemoView()) {
                        ComponentRow(
                            icon: "hand.tap",
                            iconColor: DesignSystemGlobal.BrandBrand300,
                            title: "Button",
                            description: "Primary and secondary action buttons",
                            variants: ["Orange Filled", "Outlined", "Ghost", "Icon Buttons"]
                        )
                    }
                }

                // MARK: - Display Components
                Section("Display") {
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
                }

                // MARK: - Selection Components
                Section("Selection") {
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
                }

                // MARK: - Input Components
                Section("Input") {
                    NavigationLink(destination: QuantityDemoView()) {
                        ComponentRow(
                            icon: "plusminus",
                            iconColor: DesignSystemGlobal.BrandBrand400,
                            title: "Quantity Picker",
                            description: "Expandable quantity selectors",
                            variants: ["Orange", "Grey", "Standalone Buttons"]
                        )
                    }
                }

                // MARK: - Design Tokens
                Section("Design System") {
                    NavigationLink(destination: DesignSystemDemoView()) {
                        ComponentRow(
                            icon: "paintpalette",
                            iconColor: DesignSystemGlobal.BrandBrand300,
                            title: "Design Tokens",
                            description: "Complete design system token reference",
                            variants: ["Colors", "Typography", "Spacing", "Borders", "Elevation"]
                        )
                    }
                }
            }
            .navigationTitle("Component Catalog")
            .navigationBarTitleDisplayMode(.large)
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
        HStack(alignment: .top, spacing: DesignSystemGlobal.Spacing3) {
            // Icon
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundColor(iconColor)
                .frame(width: 32, height: 32)
                .background(iconColor.opacity(0.1))
                .cornerRadius(DesignSystemGlobal.BorderRadiusLg)

            // Content
            VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing1) {
                Text(title)
                    .font(.system(size: DesignSystemGlobal.FontFontSizeBodyMd, weight: .semibold))
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

                Text(description)
                    .font(.system(size: DesignSystemGlobal.FontFontSizeBodySm, weight: .regular))
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                // Variant tags
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: DesignSystemGlobal.Spacing1) {
                        ForEach(variants, id: \.self) { variant in
                            Text(variant)
                                .font(.system(size: 10, weight: .medium))
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
