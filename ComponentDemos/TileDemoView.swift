import SwiftUI

// MARK: - Tile Demo View
/// Comprehensive demo view showcasing all Tile component variants, layouts, and states.
///
/// This view provides a complete inventory of tile components for design review
/// and development reference.
struct TileDemoView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing4) {
                // Header Card
                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                    Text("Tile")
                        .thdFont(.hero5)
                        .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)

                    Text("Selectable tiles for options, attributes, and selections.")
                        .thdFont(.bodyMd)
                        .foregroundStyle(DesignSystemGlobal.TextOnContainerColorSecondary)
                }
                .padding(DesignSystemGlobal.Spacing4)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusXl)
                        .fill(DesignSystemGlobal.BackgroundContainerColorWhite)
                )

                // Content Card
                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing6) {

                // MARK: - Outlined Variant
                sectionHeader("Outlined", description: "Tiles with visible border")

                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                    Text("Selection States")
                        .thdFont(.bodySm)
                        .foregroundStyle(DesignSystemGlobal.TextOnContainerColorSecondary)

                    VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                        OutlinedTile(text: "Selected", imageName: "photo", isSelected: true)
                        OutlinedTile(text: "Unselected", imageName: "photo", isSelected: false)
                    }

                    Text("Availability States")
                        .thdFont(.bodySm)
                        .foregroundStyle(DesignSystemGlobal.TextOnContainerColorSecondary)

                    VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                        OutlinedTile(text: "Available - Selected", imageName: "photo", isSelected: true, isAvailable: true)
                        OutlinedTile(text: "Available - Unselected", imageName: "photo", isSelected: false, isAvailable: true)
                        OutlinedTile(text: "Unavailable - Selected", imageName: "photo", isSelected: true, isAvailable: false)
                        OutlinedTile(text: "Unavailable - Unselected", imageName: "photo", isSelected: false, isAvailable: false)
                    }

                    Text("With Dot Indicator")
                        .thdFont(.bodySm)
                        .foregroundStyle(DesignSystemGlobal.TextOnContainerColorSecondary)

                    VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                        OutlinedTile(text: "Option with dot", imageName: "photo", isSelected: false, showDot: true)
                        OutlinedTile(text: "Selected with dot", imageName: "photo", isSelected: true, showDot: true)
                    }
                }

                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)

                // MARK: - Filled Variant
                sectionHeader("Filled", description: "Tiles without visible border")

                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                    Text("Selection States")
                        .thdFont(.bodySm)
                        .foregroundStyle(DesignSystemGlobal.TextOnContainerColorSecondary)

                    VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                        FilledTile(text: "Selected", imageName: "photo", isSelected: true)
                        FilledTile(text: "Unselected", imageName: "photo", isSelected: false)
                    }

                    Text("Availability States")
                        .thdFont(.bodySm)
                        .foregroundStyle(DesignSystemGlobal.TextOnContainerColorSecondary)

                    VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                        FilledTile(text: "Unavailable - Selected", imageName: "photo", isSelected: true, isAvailable: false)
                        FilledTile(text: "Unavailable - Unselected", imageName: "photo", isSelected: false, isAvailable: false)
                    }
                }

                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)

                // MARK: - Ghost Variant
                sectionHeader("Ghost", description: "Transparent when unselected, filled when selected")

                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                    Text("Selection States")
                        .thdFont(.bodySm)
                        .foregroundStyle(DesignSystemGlobal.TextOnContainerColorSecondary)

                    VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                        GhostTile(text: "Selected", imageName: "photo", isSelected: true)
                        GhostTile(text: "Unselected", imageName: "photo", isSelected: false)
                    }

                    Text("Availability States")
                        .thdFont(.bodySm)
                        .foregroundStyle(DesignSystemGlobal.TextOnContainerColorSecondary)

                    VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                        GhostTile(text: "Unavailable - Selected", imageName: "photo", isSelected: true, isAvailable: false)
                        GhostTile(text: "Unavailable - Unselected", imageName: "photo", isSelected: false, isAvailable: false)
                    }
                }

                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)

                // MARK: - Layout Options
                sectionHeader("Layout Options", description: "Different content arrangements")

                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                    Text("Horizontal Layout")
                        .thdFont(.bodySm)
                        .foregroundStyle(DesignSystemGlobal.TextOnContainerColorSecondary)

                    Text("Image on left, text on right")
                        .thdFont(.caption)
                        .foregroundStyle(DesignSystemGlobal.TextOnContainerColorTertiary)

                    Tile(text: "Horizontal", imageName: "photo", variant: .outlined, layout: .horizontal)
                    Tile(text: "With dot", imageName: "photo", variant: .outlined, layout: .horizontal, showDot: true)

                    Text("Vertical Layout")
                        .thdFont(.bodySm)
                        .foregroundStyle(DesignSystemGlobal.TextOnContainerColorSecondary)

                    Text("Image on top, text below")
                        .thdFont(.caption)
                        .foregroundStyle(DesignSystemGlobal.TextOnContainerColorTertiary)

                    HStack(spacing: DesignSystemGlobal.Spacing3) {
                        Tile(text: "Vertical", imageName: "photo", variant: .outlined, layout: .vertical)
                            .frame(width: 140)

                        Tile(text: "With dot", imageName: "photo", variant: .outlined, layout: .vertical, showDot: true)
                            .frame(width: 140)
                    }

                    Text("Composed Layout")
                        .thdFont(.bodySm)
                        .foregroundStyle(DesignSystemGlobal.TextOnContainerColorSecondary)

                    Text("Custom content slot")
                        .thdFont(.caption)
                        .foregroundStyle(DesignSystemGlobal.TextOnContainerColorTertiary)

                    Tile(text: "", variant: .outlined, layout: .composed, showDot: true)
                }

                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)

                // MARK: - Interaction States
                sectionHeader("Interaction States", description: "Visual feedback states")

                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                    Tile(text: "Default", imageName: "photo", variant: .outlined, interaction: .default)
                    Tile(text: "Pressed", imageName: "photo", variant: .outlined, interaction: .pressed)
                    Tile(text: "Loading", imageName: "photo", variant: .outlined, interaction: .loading)
                    Tile(text: "Inactive", imageName: "photo", variant: .outlined, interaction: .inactive)
                }

                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)

                // MARK: - All Variants Comparison
                sectionHeader("All Variants", description: "Side-by-side comparison")

                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                    Text("Unselected")
                        .thdFont(.bodySm)
                        .foregroundStyle(DesignSystemGlobal.TextOnContainerColorSecondary)

                    HStack(spacing: DesignSystemGlobal.Spacing2) {
                        Tile(text: "Outlined", variant: .outlined, isSelected: false)
                        Tile(text: "Filled", variant: .filled, isSelected: false)
                        Tile(text: "Ghost", variant: .ghost, isSelected: false)
                    }

                    Text("Selected")
                        .thdFont(.bodySm)
                        .foregroundStyle(DesignSystemGlobal.TextOnContainerColorSecondary)

                    HStack(spacing: DesignSystemGlobal.Spacing2) {
                        Tile(text: "Outlined", variant: .outlined, isSelected: true)
                        Tile(text: "Filled", variant: .filled, isSelected: true)
                        Tile(text: "Ghost", variant: .ghost, isSelected: true)
                    }
                }

                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)

                // MARK: - Use Cases
                sectionHeader("Common Use Cases", description: "Real-world tile applications")

                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                    Text("Size Selection")
                        .thdFont(.bodySm)
                        .foregroundStyle(DesignSystemGlobal.TextOnContainerColorSecondary)

                    HStack(spacing: DesignSystemGlobal.Spacing2) {
                        Tile(text: "S", variant: .outlined, isSelected: false)
                            .frame(width: 60)
                        Tile(text: "M", variant: .outlined, isSelected: true)
                            .frame(width: 60)
                        Tile(text: "L", variant: .outlined, isSelected: false)
                            .frame(width: 60)
                        Tile(text: "XL", variant: .outlined, isSelected: false)
                            .frame(width: 60)
                    }

                    Text("Color Selection")
                        .thdFont(.bodySm)
                        .foregroundStyle(DesignSystemGlobal.TextOnContainerColorSecondary)

                    HStack(spacing: DesignSystemGlobal.Spacing2) {
                        Tile(text: "Red", imageName: "photo", variant: .outlined, isSelected: false, showDot: true)
                            .frame(width: 100)
                        Tile(text: "Blue", imageName: "photo", variant: .outlined, isSelected: true, showDot: true)
                            .frame(width: 100)
                        Tile(text: "Green", imageName: "photo", variant: .outlined, isSelected: false, showDot: true)
                            .frame(width: 100)
                    }

                    Text("Store Selection")
                        .thdFont(.bodySm)
                        .foregroundStyle(DesignSystemGlobal.TextOnContainerColorSecondary)

                    VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                        Tile(text: "Cumberland Store", variant: .outlined, layout: .horizontal, isSelected: true, showDot: true)
                        Tile(text: "Alpharetta Store", variant: .outlined, layout: .horizontal, isSelected: false, showDot: true)
                        Tile(text: "Roswell Store", variant: .outlined, layout: .horizontal, isSelected: false, showDot: true)
                    }

                    Text("Delivery Options")
                        .thdFont(.bodySm)
                        .foregroundStyle(DesignSystemGlobal.TextOnContainerColorSecondary)

                    VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                        Tile(text: "Ship to Home", variant: .filled, isSelected: true)
                        Tile(text: "Store Pickup", variant: .filled, isSelected: false)
                        Tile(text: "Same Day Delivery", variant: .filled, isSelected: false, isAvailable: false)
                    }

                    Text("Product Variants (Vertical)")
                        .thdFont(.bodySm)
                        .foregroundStyle(DesignSystemGlobal.TextOnContainerColorSecondary)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: DesignSystemGlobal.Spacing3) {
                            Tile(text: "18V", imageName: "photo", variant: .outlined, layout: .vertical, isSelected: true)
                                .frame(width: 120)
                            Tile(text: "20V", imageName: "photo", variant: .outlined, layout: .vertical, isSelected: false)
                                .frame(width: 120)
                            Tile(text: "60V", imageName: "photo", variant: .outlined, layout: .vertical, isSelected: false)
                                .frame(width: 120)
                        }
                    }
                }
                }
                .padding(DesignSystemGlobal.Spacing4)
                .background(
                    RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusXl)
                        .fill(DesignSystemGlobal.BackgroundContainerColorWhite)
                )
            }
            .padding(DesignSystemGlobal.Spacing4)
        }
        .background(DesignSystemGlobal.BackgroundSurfaceColorGreige)
    }

    // MARK: - Helper Views

    private func sectionHeader(_ title: String, description: String) -> some View {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing1) {
            Text(title)
                .thdFont(.h6)
                .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)

            Text(description)
                .thdFont(.caption)
                .foregroundStyle(DesignSystemGlobal.TextOnContainerColorTertiary)
        }
    }
}

#Preview("Tile Demo") {
    TileDemoView()
}
