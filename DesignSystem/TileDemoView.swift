import SwiftUI

struct TileDemoView: View {
    @State private var selectedTile: String? = nil
    
    var body: some View {
        ScrollView {
            VStack(spacing: DesignSystemGlobal.Spacing4) {
                Text("Tile Component")
                    .thdFont(.h3)
                    .padding()
                
                Text("Selectable tiles for options and attributes")
                    .thdFont(.bodyMd)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)
                    .padding(.horizontal)
                
                // Add your tile examples here
                VStack(spacing: DesignSystemGlobal.Spacing2) {
                    HStack(spacing: DesignSystemGlobal.Spacing2) {
                        TileView(title: "Option 1", isSelected: selectedTile == "1") {
                            selectedTile = "1"
                        }
                        TileView(title: "Option 2", isSelected: selectedTile == "2") {
                            selectedTile = "2"
                        }
                    }
                    
                    HStack(spacing: DesignSystemGlobal.Spacing2) {
                        TileView(title: "Option 3", isSelected: selectedTile == "3") {
                            selectedTile = "3"
                        }
                        TileView(title: "Option 4", isSelected: selectedTile == "4") {
                            selectedTile = "4"
                        }
                    }
                }
                .padding()
            }
        }
        .applySoftScrollEdges()
        .navigationTitle("Tiles")
    }
}

struct TileView: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .thdFont(.bodyMd)
                .foregroundColor(isSelected ? DesignSystemGlobal.TextSelectorColorFilledSelected : DesignSystemGlobal.TextSelectorColorFilledDefault)
                .frame(maxWidth: .infinity)
                .padding()
                .background(isSelected ? DesignSystemGlobal.BackgroundSelectorColorFilledSelected : DesignSystemGlobal.BackgroundSelectorColorFilledDefault)
                .cornerRadius(DesignSystemGlobal.BorderRadiusLg)
                .overlay(
                    RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusLg)
                        .stroke(isSelected ? DesignSystemGlobal.BorderSelectorColorFilledSelected : DesignSystemGlobal.BorderSelectorColorFilledDefault, lineWidth: 1)
                )
        }
    }
}

#Preview {
    NavigationStack {
        TileDemoView()
    }
}
