import SwiftUI

// MARK: - DSTile Previews

#if DEBUG

#Preview("Text Tiles - Outlined") {
    VStack(spacing: 16) {
        Text("Outlined Variant").font(.headline)

        HStack(spacing: 8) {
            DSTile("S", isSelected: false) {}
            DSTile("M", isSelected: true) {}
            DSTile("L", isSelected: false) {}
            DSTile("XL", isSelected: false) {}
        }

        HStack(spacing: 8) {
            DSTile("Small", isSelected: false) {}
            DSTile("Medium", isSelected: true) {}
            DSTile("Large", isSelected: false) {}
        }
    }
    .padding()
}

#Preview("Text Tiles - Filled") {
    VStack(spacing: 16) {
        Text("Filled Variant").font(.headline)

        HStack(spacing: 8) {
            DSTile("S", variant: .filled, isSelected: false) {}
            DSTile("M", variant: .filled, isSelected: true) {}
            DSTile("L", variant: .filled, isSelected: false) {}
            DSTile("XL", variant: .filled, isSelected: false) {}
        }
    }
    .padding()
}

#Preview("Text Tiles - Ghost") {
    VStack(spacing: 16) {
        Text("Ghost Variant").font(.headline)

        HStack(spacing: 8) {
            DSTile("Option A", variant: .ghost, isSelected: false) {}
            DSTile("Option B", variant: .ghost, isSelected: true) {}
            DSTile("Option C", variant: .ghost, isSelected: false) {}
        }
    }
    .padding()
}

#Preview("Color Swatches") {
    VStack(spacing: 16) {
        Text("Color Swatches").font(.headline)

        HStack(spacing: 8) {
            DSTile(color: .red, isSelected: false) {}
            DSTile(color: .blue, isSelected: true) {}
            DSTile(color: .green, isSelected: false) {}
            DSTile(color: .orange, isSelected: false) {}
        }

        Text("With Labels").font(.subheadline)

        HStack(spacing: 8) {
            DSTile(color: .red, label: "Red", isSelected: false) {}
            DSTile(color: .blue, label: "Blue", isSelected: true) {}
            DSTile(color: .green, label: "Green", isSelected: false) {}
        }
    }
    .padding()
}

#Preview("States") {
    VStack(spacing: 16) {
        Text("States").font(.headline)

        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 8) {
                Text("Default:").frame(width: 80, alignment: .leading)
                DSTile("Option", isSelected: false) {}
            }

            HStack(spacing: 8) {
                Text("Selected:").frame(width: 80, alignment: .leading)
                DSTile("Option", isSelected: true) {}
            }

            HStack(spacing: 8) {
                Text("Disabled:").frame(width: 80, alignment: .leading)
                DSTile("Option", isSelected: false, isDisabled: true) {}
            }

            HStack(spacing: 8) {
                Text("Loading:").frame(width: 80, alignment: .leading)
                DSTile("Option", isSelected: false, isLoading: true) {}
            }
        }
    }
    .padding()
}

#Preview("Size Selector Example") {
    VStack(alignment: .leading, spacing: 12) {
        Text("Select Size").font(.headline)

        HStack(spacing: 8) {
            ForEach(["XS", "S", "M", "L", "XL", "XXL"], id: \.self) { size in
                DSTile(size, isSelected: size == "M") {
                    print("Selected \(size)")
                }
            }
        }
    }
    .padding()
}

#Preview("Color Picker Example") {
    VStack(alignment: .leading, spacing: 12) {
        Text("Select Color").font(.headline)

        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 4), spacing: 8) {
            DSTile(color: .black, label: "Black", isSelected: true) {}
            DSTile(color: .white, label: "White", isSelected: false) {}
            DSTile(color: .gray, label: "Gray", isSelected: false) {}
            DSTile(color: .red, label: "Red", isSelected: false) {}
            DSTile(color: .blue, label: "Blue", isSelected: false) {}
            DSTile(color: .green, label: "Green", isSelected: false) {}
            DSTile(color: .orange, label: "Orange", isSelected: false) {}
            DSTile(color: .purple, label: "Purple", isSelected: false) {}
        }
    }
    .padding()
}

#Preview("All Variants & States") {
    ScrollView {
        VStack(spacing: 24) {
            ForEach(DSTileVariant.allCases, id: \.self) { variant in
                VStack(alignment: .leading, spacing: 12) {
                    Text("\(String(describing: variant))")
                        .font(.headline)

                    VStack(spacing: 8) {
                        HStack(spacing: 8) {
                            DSTile("Default", variant: variant, isSelected: false) {}
                            DSTile("Selected", variant: variant, isSelected: true) {}
                        }
                        HStack(spacing: 8) {
                            DSTile("Disabled", variant: variant, isSelected: false, isDisabled: true) {}
                            DSTile("Loading", variant: variant, isSelected: false, isLoading: true) {}
                        }
                    }
                }
            }
        }
        .padding()
    }
}

#endif
