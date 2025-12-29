import SwiftUI

// MARK: - DSPill Previews

#if DEBUG

#Preview("Outlined Style") {
    VStack(spacing: 16) {
        Text("Outlined Style").font(.headline)

        HStack(spacing: 8) {
            DSPill("Category") {}
            DSPill("Filter", isSelected: true) {}
            DSPill("Tag", isDisabled: true) {}
        }
    }
    .padding()
}

#Preview("Filled Style") {
    VStack(spacing: 16) {
        Text("Filled Style").font(.headline)

        HStack(spacing: 8) {
            DSPill("Category", style: .filled) {}
            DSPill("Filter", style: .filled, isSelected: true) {}
            DSPill("Tag", style: .filled, isDisabled: true) {}
        }
    }
    .padding()
}

#Preview("All Sizes") {
    VStack(spacing: 16) {
        Text("All Sizes").font(.headline)

        VStack(alignment: .leading, spacing: 12) {
            HStack(spacing: 8) {
                Text("Sm:").frame(width: 30, alignment: .leading)
                DSPill("Small", size: .sm) {}
                DSPill("Selected", size: .sm, isSelected: true) {}
            }

            HStack(spacing: 8) {
                Text("Md:").frame(width: 30, alignment: .leading)
                DSPill("Medium", size: .md) {}
                DSPill("Selected", size: .md, isSelected: true) {}
            }

            HStack(spacing: 8) {
                Text("Lg:").frame(width: 30, alignment: .leading)
                DSPill("Large", size: .lg) {}
                DSPill("Selected", size: .lg, isSelected: true) {}
            }

            HStack(spacing: 8) {
                Text("XL:").frame(width: 30, alignment: .leading)
                DSPill("Extra Large", size: .xl) {}
                DSPill("Selected", size: .xl, isSelected: true) {}
            }
        }
    }
    .padding()
}

#Preview("With Leading Icons") {
    VStack(spacing: 16) {
        Text("With Leading Icons").font(.headline)

        VStack(spacing: 8) {
            DSPill(
                "Store",
                leadingIcon: Image(systemName: "building.2")
            ) {}

            DSPill(
                "Location",
                leadingIcon: Image(systemName: "mappin"),
                isSelected: true
            ) {}

            DSPill(
                "Search",
                leadingIcon: Image(systemName: "magnifyingglass"),
                style: .filled
            ) {}
        }
    }
    .padding()
}

#Preview("With Trailing Icons") {
    VStack(spacing: 16) {
        Text("With Trailing Icons").font(.headline)

        VStack(spacing: 8) {
            DSPill(
                "Dropdown",
                trailingIcon: Image(systemName: "chevron.down")
            ) {}

            DSPill(
                "Remove",
                trailingIcon: Image(systemName: "xmark"),
                isSelected: true
            ) {}

            DSPill(
                "Select",
                leadingIcon: Image(systemName: "building.2"),
                trailingIcon: Image(systemName: "chevron.down")
            ) {}
        }
    }
    .padding()
}

#Preview("Color Swatches") {
    VStack(spacing: 16) {
        Text("Color Swatches").font(.headline)

        HStack(spacing: 8) {
            DSPill("Red", swatchColor: .red) {}
            DSPill("Blue", swatchColor: .blue, isSelected: true) {}
            DSPill("Green", swatchColor: .green) {}
        }

        HStack(spacing: 8) {
            DSPill(
                "Red",
                swatchColor: .red,
                trailingIcon: Image(systemName: "chevron.down")
            ) {}
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
                DSPill("Label") {}
            }

            HStack(spacing: 8) {
                Text("Selected:").frame(width: 80, alignment: .leading)
                DSPill("Label", isSelected: true) {}
            }

            HStack(spacing: 8) {
                Text("Disabled:").frame(width: 80, alignment: .leading)
                DSPill("Label", isDisabled: true) {}
            }

            HStack(spacing: 8) {
                Text("No BG:").frame(width: 80, alignment: .leading)
                DSPill("Label", hasBackground: false) {}
            }
        }
    }
    .padding()
}

#Preview("Filter Bar Example") {
    ScrollView(.horizontal, showsIndicators: false) {
        HStack(spacing: 8) {
            DSPill(
                "All",
                style: .filled,
                isSelected: true
            ) {}

            DSPill("In Stock") {}
            DSPill("On Sale") {}
            DSPill("Free Shipping") {}

            DSPill(
                "Price",
                trailingIcon: Image(systemName: "chevron.down")
            ) {}

            DSPill(
                "Brand",
                trailingIcon: Image(systemName: "chevron.down")
            ) {}
        }
        .padding(.horizontal)
    }
    .padding(.vertical)
}

#Preview("Store Selector Example") {
    VStack(alignment: .leading, spacing: 12) {
        Text("Select Store").font(.headline)

        VStack(spacing: 8) {
            DSPill(
                "Cumberland",
                leadingIcon: Image(systemName: "building.2"),
                trailingIcon: Image(systemName: "chevron.down"),
                size: .xl
            ) {}

            DSPill(
                "Nearby Stores",
                leadingIcon: Image(systemName: "mappin"),
                size: .xl
            ) {}
        }
    }
    .padding()
}

#Preview("All Combinations") {
    ScrollView {
        VStack(spacing: 24) {
            ForEach(DSPillStyle.allCases, id: \.self) { style in
                VStack(alignment: .leading, spacing: 12) {
                    Text("\(String(describing: style))")
                        .font(.headline)

                    VStack(spacing: 8) {
                        HStack(spacing: 8) {
                            DSPill("Default", style: style) {}
                            DSPill("Selected", style: style, isSelected: true) {}
                        }
                        HStack(spacing: 8) {
                            DSPill("Disabled", style: style, isDisabled: true) {}
                            DSPill(
                                "With Icon",
                                leadingIcon: Image(systemName: "star"),
                                style: style
                            ) {}
                        }
                    }
                }
            }
        }
        .padding()
    }
}

#endif
