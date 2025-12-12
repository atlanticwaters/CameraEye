import SwiftUI

// MARK: - DSTile Previews

// Variant Previews
#Preview("Outlined") {
    VStack(spacing: 16) {
        DSTile("Raccoon", variant: .outlined, image: Image("Acorn"))
        DSTile("Raccoon", variant: .outlined, isSelected: true, image: Image("Acorn"))
        DSTile("Raccoon", variant: .outlined, isAvailable: false, image: Image("Acorn"))
    }
    .padding()
}

#Preview("Filled") {
    VStack(spacing: 16) {
        DSTile("Raccoon", variant: .filled, image: Image("Acorn"))
        DSTile("Raccoon", variant: .filled, isSelected: true, image: Image("Acorn"))
        DSTile("Raccoon", variant: .filled, isAvailable: false, image: Image("Acorn"))
    }
    .padding()
}

#Preview("Ghost") {
    VStack(spacing: 16) {
        DSTile("Raccoon", variant: .ghost, image: Image("Acorn"))
        DSTile("Raccoon", variant: .ghost, isSelected: true, image: Image("Acorn"))
        DSTile("Raccoon", variant: .ghost, isAvailable: false, image: Image("Acorn"))
    }
    .padding()
}

// Size Previews
#Preview("Sizes") {
    VStack(spacing: 16) {
        DSTile("Regular", variant: .outlined, size: .regular, image: Image("Acorn"))
        DSTile("Small", variant: .outlined, size: .small, image: Image("Acorn"))
    }
    .padding()
}

// State Previews
#Preview("States") {
    VStack(spacing: 16) {
        DSTile("Default", variant: .outlined, interaction: .default, image: Image("Acorn"))
        DSTile("Pressed", variant: .outlined, interaction: .pressed, image: Image("Acorn"))
        DSTile("Loading", variant: .outlined, interaction: .loading, image: Image("Acorn"))
        DSTile("Inactive", variant: .outlined, interaction: .inactive, image: Image("Acorn"))
    }
    .padding()
}

// With Swatch
#Preview("With Swatch") {
    VStack(spacing: 16) {
        DSTile(
            "Orange",
            variant: .outlined,
            image: Image("Acorn"),
            swatch: Color.orange
        )
        DSTile(
            "Blue",
            variant: .filled,
            isSelected: true,
            image: Image("Acorn"),
            swatch: Color.blue
        )
    }
    .padding()
}

// Interactive
#Preview("Interactive") {
    TileInteractivePreview()
        .padding()
}

// All Variants Comparison
#Preview("All Variants") {
    ScrollView {
        VStack(alignment: .leading, spacing: 24) {
            Text("Outlined").font(.headline)
            TileVariantGrid(variant: .outlined)

            Divider()

            Text("Filled").font(.headline)
            TileVariantGrid(variant: .filled)

            Divider()

            Text("Ghost").font(.headline)
            TileVariantGrid(variant: .ghost)
        }
        .padding()
    }
}

// MARK: - Helper Views

private struct TileVariantGrid: View {
    let variant: DSTile.Variant

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 12) {
                DSTile("Default", variant: variant, isSelected: false, image: Image("Acorn"))
                DSTile("Selected", variant: variant, isSelected: true, image: Image("Acorn"))
            }
            HStack(spacing: 12) {
                DSTile("Available", variant: variant, isAvailable: true, image: Image("Acorn"))
                DSTile("Unavailable", variant: variant, isAvailable: false, image: Image("Acorn"))
            }
        }
    }
}

private struct TileInteractivePreview: View {
    @State private var selectedTile: String?

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Select a tile:").font(.headline)

            HStack(spacing: 12) {
                ForEach(["Raccoon", "Wild", "Crazy"], id: \.self) { tile in
                    DSTile(
                        tile,
                        variant: .outlined,
                        isSelected: selectedTile == tile,
                        image: Image("Acorn"),
                        swatch: tile == "Raccoon" ? Color.orange : (tile == "Wild" ? Color.blue : Color.green)
                    ) {
                        selectedTile = tile
                    }
                }
            }

            if let selectedTile {
                Text("Selected: \(selectedTile)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
    }
}

// Dark Mode Previews
#Preview("Dark Mode - Outlined") {
    VStack(spacing: 16) {
        DSTile("Raccoon", variant: .outlined, image: Image("Acorn"))
        DSTile("Raccoon", variant: .outlined, isSelected: true, image: Image("Acorn"))
    }
    .padding()
    .preferredColorScheme(.dark)
}

#Preview("Dark Mode - Filled") {
    VStack(spacing: 16) {
        DSTile("Raccoon", variant: .filled, image: Image("Acorn"))
        DSTile("Raccoon", variant: .filled, isSelected: true, image: Image("Acorn"))
    }
    .padding()
    .preferredColorScheme(.dark)
}

#Preview("Dark Mode - Ghost") {
    VStack(spacing: 16) {
        DSTile("Raccoon", variant: .ghost, image: Image("Acorn"))
        DSTile("Raccoon", variant: .ghost, isSelected: true, image: Image("Acorn"))
    }
    .padding()
    .preferredColorScheme(.dark)
}

// Factory Methods
#Preview("Factory Methods") {
    VStack(spacing: 16) {
        DSTile.outlined("Outlined", image: Image("Acorn"))
        DSTile.filled("Filled", image: Image("Acorn"), isSelected: true)
        DSTile.ghost("Ghost", image: Image("Acorn"))
    }
    .padding()
}
