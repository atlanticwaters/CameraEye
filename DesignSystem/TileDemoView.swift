import SwiftUI

// MARK: - Tile Demo View
/// Comprehensive demo view showcasing all Tile component variants, layouts, and states.
///
/// This view provides a complete inventory of the tile component for design review
/// and development reference.
struct TileDemoView: View {
    @State private var selectedOutlined: String? = "1"
    @State private var selectedFilled: String? = nil
    @State private var selectedGhost: String? = nil
    @State private var selectedHorizontal: String? = "h1"
    @State private var selectedVertical: String? = nil
    
    // MARK: - Helper Views
    
    private func sectionHeader(_ title: String, description: String) -> some View {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing1) {
            Text(title)
                .thdFont(.h6)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

            Text(description)
                .thdFont(.caption)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorTertiary)
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing4) {
                headerCard
                contentCard
            }
            .padding(DesignSystemGlobal.Spacing4)
        }
        .applySoftScrollEdges()
        .background(DesignSystemGlobal.BackgroundSurfaceColorGreige)
    }
    
    // MARK: - Body Components
    
    private var headerCard: some View {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
            Text("Tile")
                .thdFont(.hero5)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

            Text("Selectable tiles for options, attributes, and product variations.")
                .thdFont(.bodyMd)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)
        }
        .padding(DesignSystemGlobal.Spacing4)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusXl)
                .fill(DesignSystemGlobal.BackgroundContainerColorWhite)
        )
    }
    
    private var contentCard: some View {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing6) {
            outlinedStyleSection
            Divider().padding(.vertical, DesignSystemGlobal.Spacing2)
            
            filledStyleSection
            Divider().padding(.vertical, DesignSystemGlobal.Spacing2)
            
            ghostStyleSection
            Divider().padding(.vertical, DesignSystemGlobal.Spacing2)
            
            interactionStatesSection
            Divider().padding(.vertical, DesignSystemGlobal.Spacing2)
            
            layoutComparisonSection
            Divider().padding(.vertical, DesignSystemGlobal.Spacing2)
            
            useCasesSection
        }
        .padding(DesignSystemGlobal.Spacing4)
        .background(
            RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusXl)
                .fill(DesignSystemGlobal.BackgroundContainerColorWhite)
        )
    }
    
    // MARK: - Section Views
    
    private var outlinedStyleSection: some View {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
            sectionHeader("Outlined Style", description: "Visible border with white background")
            
            Text("Horizontal Layout")
                .thdFont(.bodySm)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

            HStack(spacing: DesignSystemGlobal.Spacing2) {
                Tile(
                    text: "Option 1",
                    imageName: "circle.fill",
                    variant: .outlined,
                    layout: .horizontal,
                    isSelected: selectedOutlined == "1",
                    action: {
                        selectedOutlined = "1"
                    }
                )
                
                Tile(
                    text: "Option 2",
                    imageName: "square.fill",
                    variant: .outlined,
                    layout: .horizontal,
                    isSelected: selectedOutlined == "2",
                    action: {
                        selectedOutlined = "2"
                    }
                )
            }

            Text("Vertical Layout")
                .thdFont(.bodySm)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

            HStack(spacing: DesignSystemGlobal.Spacing2) {
                Tile(
                    text: "Red",
                    imageName: "circle.fill",
                    variant: .outlined,
                    layout: .vertical,
                    isSelected: selectedOutlined == "red",
                    action: {
                        selectedOutlined = "red"
                    }
                )
                
                Tile(
                    text: "Blue",
                    imageName: "circle.fill",
                    variant: .outlined,
                    layout: .vertical,
                    isSelected: selectedOutlined == "blue",
                    action: {
                        selectedOutlined = "blue"
                    }
                )
                
                Tile(
                    text: "Green",
                    imageName: "circle.fill",
                    variant: .outlined,
                    layout: .vertical,
                    isSelected: selectedOutlined == "green",
                    action: {
                        selectedOutlined = "green"
                    }
                )
            }

            Text("Text Only")
                .thdFont(.bodySm)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

            HStack(spacing: DesignSystemGlobal.Spacing2) {
                Tile(
                    text: "Small",
                    variant: .outlined,
                    layout: .horizontal,
                    isSelected: selectedOutlined == "s",
                    action: {
                        selectedOutlined = "s"
                    }
                )
                
                Tile(
                    text: "Medium",
                    variant: .outlined,
                    layout: .horizontal,
                    isSelected: selectedOutlined == "m",
                    action: {
                        selectedOutlined = "m"
                    }
                )
                
                Tile(
                    text: "Large",
                    variant: .outlined,
                    layout: .horizontal,
                    isSelected: selectedOutlined == "l",
                    action: {
                        selectedOutlined = "l"
                    }
                )
                
                Tile(
                    text: "X-Large",
                    variant: .outlined,
                    layout: .horizontal,
                    isSelected: selectedOutlined == "xl",
                    action: {
                        selectedOutlined = "xl"
                    }
                )
            }
        }
    }
    
    private var filledStyleSection: some View {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
            sectionHeader("Filled Style", description: "No border with subtle background")
            
            Text("Horizontal Layout")
                .thdFont(.bodySm)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

            HStack(spacing: DesignSystemGlobal.Spacing2) {
                Tile(
                    text: "1/2\"",
                    imageName: "ruler",
                    variant: .filled,
                    layout: .horizontal,
                    isSelected: selectedFilled == "half",
                    action: {
                        selectedFilled = "half"
                    }
                )
                
                Tile(
                    text: "3/4\"",
                    imageName: "ruler",
                    variant: .filled,
                    layout: .horizontal,
                    isSelected: selectedFilled == "three",
                    action: {
                        selectedFilled = "three"
                    }
                )
                
                Tile(
                    text: "1\"",
                    imageName: "ruler",
                    variant: .filled,
                    layout: .horizontal,
                    isSelected: selectedFilled == "one",
                    action: {
                        selectedFilled = "one"
                    }
                )
            }

            Text("Vertical Layout")
                .thdFont(.bodySm)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

            HStack(spacing: DesignSystemGlobal.Spacing2) {
                Tile(
                    text: "Wood",
                    imageName: "tree",
                    variant: .filled,
                    layout: .vertical,
                    isSelected: selectedFilled == "wood",
                    action: {
                        selectedFilled = "wood"
                    }
                )
                
                Tile(
                    text: "Metal",
                    imageName: "bolt",
                    variant: .filled,
                    layout: .vertical,
                    isSelected: selectedFilled == "metal",
                    action: {
                        selectedFilled = "metal"
                    }
                )
                
                Tile(
                    text: "Plastic",
                    imageName: "drop",
                    variant: .filled,
                    layout: .vertical,
                    isSelected: selectedFilled == "plastic",
                    action: {
                        selectedFilled = "plastic"
                    }
                )
            }
        }
    }
    
    private var ghostStyleSection: some View {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
            sectionHeader("Ghost Style", description: "Transparent when unselected")
            
            Text("Horizontal Layout")
                .thdFont(.bodySm)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

            HStack(spacing: DesignSystemGlobal.Spacing2) {
                Tile(
                    text: "Delivery",
                    imageName: "shippingbox",
                    variant: .ghost,
                    layout: .horizontal,
                    isSelected: selectedGhost == "delivery",
                    action: {
                        selectedGhost = "delivery"
                    }
                )
                
                Tile(
                    text: "Pickup",
                    imageName: "bag",
                    variant: .ghost,
                    layout: .horizontal,
                    isSelected: selectedGhost == "pickup",
                    action: {
                        selectedGhost = "pickup"
                    }
                )
            }
        }
    }
    
    private var interactionStatesSection: some View {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
            sectionHeader("Interaction States", description: "Different tile states")
            
            Text("Outlined States")
                .thdFont(.bodySm)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

            HStack(spacing: DesignSystemGlobal.Spacing2) {
                Tile(
                    text: "Default",
                    variant: .outlined,
                    layout: .horizontal,
                    isSelected: false,
                    interaction: .default,
                    action: {}
                )
                
                Tile(
                    text: "Pressed",
                    variant: .outlined,
                    layout: .horizontal,
                    isSelected: false,
                    interaction: .pressed,
                    action: {}
                )
                
                Tile(
                    text: "Selected",
                    variant: .outlined,
                    layout: .horizontal,
                    isSelected: true,
                    action: {}
                )
                
                Tile(
                    text: "Inactive",
                    variant: .outlined,
                    layout: .horizontal,
                    isSelected: false,
                    interaction: .inactive,
                    action: {}
                )
            }

            Text("Filled States")
                .thdFont(.bodySm)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

            HStack(spacing: DesignSystemGlobal.Spacing2) {
                Tile(
                    text: "Default",
                    variant: .filled,
                    layout: .horizontal,
                    isSelected: false,
                    interaction: .default,
                    action: {}
                )
                
                Tile(
                    text: "Selected",
                    variant: .filled,
                    layout: .horizontal,
                    isSelected: true,
                    action: {}
                )
                
                Tile(
                    text: "Inactive",
                    variant: .filled,
                    layout: .horizontal,
                    isSelected: false,
                    interaction: .inactive,
                    action: {}
                )
            }
        }
    }
    
    private var layoutComparisonSection: some View {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
            sectionHeader("Layout Comparison", description: "All layouts side by side")
            
            Text("Horizontal")
                .thdFont(.bodySm)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

            HStack(spacing: DesignSystemGlobal.Spacing2) {
                Tile(
                    text: "Selected",
                    imageName: "checkmark.circle.fill",
                    variant: .outlined,
                    layout: .horizontal,
                    isSelected: selectedHorizontal == "h1",
                    action: {
                        selectedHorizontal = "h1"
                    }
                )
                
                Tile(
                    text: "Unselected",
                    imageName: "circle",
                    variant: .outlined,
                    layout: .horizontal,
                    isSelected: selectedHorizontal == "h2",
                    action: {
                        selectedHorizontal = "h2"
                    }
                )
            }

            Text("Vertical")
                .thdFont(.bodySm)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

            HStack(spacing: DesignSystemGlobal.Spacing2) {
                Tile(
                    text: "Selected",
                    imageName: "checkmark.circle.fill",
                    variant: .outlined,
                    layout: .vertical,
                    isSelected: selectedVertical == "v1",
                    action: {
                        selectedVertical = "v1"
                    }
                )
                
                Tile(
                    text: "Unselected",
                    imageName: "circle",
                    variant: .outlined,
                    layout: .vertical,
                    isSelected: selectedVertical == "v2",
                    action: {
                        selectedVertical = "v2"
                    }
                )
            }
        }
    }
    
    private var useCasesSection: some View {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
            sectionHeader("Common Use Cases", description: "Real-world tile applications")
            
            Text("Size Selection")
                .thdFont(.bodySm)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: DesignSystemGlobal.Spacing2) {
                    ForEach(["XS", "S", "M", "L", "XL", "XXL"], id: \.self) { size in
                        Tile(
                            text: size,
                            variant: .outlined,
                            layout: .horizontal,
                            isSelected: false,
                            action: {}
                        )
                    }
                }
            }

            Text("Color Selection")
                .thdFont(.bodySm)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

            HStack(spacing: DesignSystemGlobal.Spacing2) {
                Tile(
                    text: "White",
                    imageName: "circle.fill",
                    variant: .outlined,
                    layout: .vertical,
                    isSelected: true,
                    action: {}
                )
                
                Tile(
                    text: "Black",
                    imageName: "circle.fill",
                    variant: .outlined,
                    layout: .vertical,
                    isSelected: false,
                    action: {}
                )
                
                Tile(
                    text: "Gray",
                    imageName: "circle.fill",
                    variant: .outlined,
                    layout: .vertical,
                    isSelected: false,
                    action: {}
                )
            }

            Text("Fulfillment Options")
                .thdFont(.bodySm)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

            VStack(spacing: DesignSystemGlobal.Spacing2) {
                Tile(
                    text: "Ship to Home",
                    imageName: "shippingbox",
                    variant: .outlined,
                    layout: .horizontal,
                    isSelected: true,
                    action: {}
                )
                
                Tile(
                    text: "Store Pickup",
                    imageName: "bag",
                    variant: .outlined,
                    layout: .horizontal,
                    isSelected: false,
                    action: {}
                )
            }
        }
    }
}

#Preview("Tile Demo") {
    TileDemoView()
}
