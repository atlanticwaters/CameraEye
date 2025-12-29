import SwiftUI

#Preview("Sizes - Outlined") {
    VStack(spacing: 20) {
        DSPill(
            "Cumberland",
            style: .outlined,
            size: .extraLarge,
            leadingIcon: Image(systemName: "mappin.circle.fill"),
            trailingIcon: Image(systemName: "chevron.down")
        )

        DSPill(
            "Cumberland",
            style: .outlined,
            size: .large,
            leadingIcon: Image(systemName: "mappin.circle.fill"),
            trailingIcon: Image(systemName: "chevron.down")
        )

        DSPill(
            "Cumberland",
            style: .outlined,
            size: .medium,
            leadingIcon: Image(systemName: "mappin.circle.fill"),
            trailingIcon: Image(systemName: "chevron.down")
        )

        DSPill(
            "Cumberland",
            style: .outlined,
            size: .small,
            leadingIcon: Image(systemName: "mappin.circle.fill"),
            trailingIcon: Image(systemName: "chevron.down")
        )
    }
    .padding()
}

#Preview("Sizes - Filled") {
    VStack(spacing: 20) {
        DSPill(
            "Cumberland",
            style: .filled,
            size: .extraLarge,
            leadingIcon: Image(systemName: "mappin.circle.fill"),
            trailingIcon: Image(systemName: "chevron.down")
        )

        DSPill(
            "Cumberland",
            style: .filled,
            size: .large,
            leadingIcon: Image(systemName: "mappin.circle.fill"),
            trailingIcon: Image(systemName: "chevron.down")
        )

        DSPill(
            "Cumberland",
            style: .filled,
            size: .medium,
            leadingIcon: Image(systemName: "mappin.circle.fill"),
            trailingIcon: Image(systemName: "chevron.down")
        )

        DSPill(
            "Cumberland",
            style: .filled,
            size: .small,
            leadingIcon: Image(systemName: "mappin.circle.fill"),
            trailingIcon: Image(systemName: "chevron.down")
        )
    }
    .padding()
}

#Preview("States - Outlined") {
    VStack(spacing: 20) {
        DSPill(
            "Default",
            style: .outlined,
            size: .medium,
            state: .default,
            trailingIcon: Image(systemName: "chevron.down")
        )

        DSPill(
            "Pressed",
            style: .outlined,
            size: .medium,
            state: .pressed,
            trailingIcon: Image(systemName: "chevron.down")
        )

        DSPill(
            "Selected",
            style: .outlined,
            size: .medium,
            state: .selected,
            trailingIcon: Image(systemName: "chevron.down")
        )

        DSPill(
            "Disabled",
            style: .outlined,
            size: .medium,
            state: .disabled,
            trailingIcon: Image(systemName: "chevron.down")
        )
    }
    .padding()
}

#Preview("States - Filled") {
    VStack(spacing: 20) {
        DSPill(
            "Default",
            style: .filled,
            size: .medium,
            state: .default,
            trailingIcon: Image(systemName: "chevron.down")
        )

        DSPill(
            "Pressed",
            style: .filled,
            size: .medium,
            state: .pressed,
            trailingIcon: Image(systemName: "chevron.down")
        )

        DSPill(
            "Selected",
            style: .filled,
            size: .medium,
            state: .selected,
            trailingIcon: Image(systemName: "chevron.down")
        )

        DSPill(
            "Disabled",
            style: .filled,
            size: .medium,
            state: .disabled,
            trailingIcon: Image(systemName: "chevron.down")
        )
    }
    .padding()
}

#Preview("Icon Variants - Outlined") {
    VStack(spacing: 20) {
        DSPill(
            "Leading Only",
            style: .outlined,
            size: .medium,
            leadingIcon: Image(systemName: "mappin.circle.fill")
        )

        DSPill(
            "Trailing Only",
            style: .outlined,
            size: .medium,
            trailingIcon: Image(systemName: "chevron.down")
        )

        DSPill(
            "Both Icons",
            style: .outlined,
            size: .medium,
            leadingIcon: Image(systemName: "mappin.circle.fill"),
            trailingIcon: Image(systemName: "chevron.down")
        )

        DSPill(
            "No Icons",
            style: .outlined,
            size: .medium
        )
    }
    .padding()
}

#Preview("Icon Variants - Filled") {
    VStack(spacing: 20) {
        DSPill(
            "Leading Only",
            style: .filled,
            size: .medium,
            leadingIcon: Image(systemName: "mappin.circle.fill")
        )

        DSPill(
            "Trailing Only",
            style: .filled,
            size: .medium,
            trailingIcon: Image(systemName: "chevron.down")
        )

        DSPill(
            "Both Icons",
            style: .filled,
            size: .medium,
            leadingIcon: Image(systemName: "mappin.circle.fill"),
            trailingIcon: Image(systemName: "chevron.down")
        )

        DSPill(
            "No Icons",
            style: .filled,
            size: .medium
        )
    }
    .padding()
}

#Preview("Dark Mode - Outlined") {
    VStack(spacing: 20) {
        DSPill(
            "Default",
            style: .outlined,
            size: .medium,
            state: .default,
            leadingIcon: Image(systemName: "mappin.circle.fill"),
            trailingIcon: Image(systemName: "chevron.down")
        )

        DSPill(
            "Pressed",
            style: .outlined,
            size: .medium,
            state: .pressed,
            leadingIcon: Image(systemName: "mappin.circle.fill"),
            trailingIcon: Image(systemName: "chevron.down")
        )

        DSPill(
            "Selected",
            style: .outlined,
            size: .medium,
            state: .selected,
            leadingIcon: Image(systemName: "mappin.circle.fill"),
            trailingIcon: Image(systemName: "chevron.down")
        )

        DSPill(
            "Disabled",
            style: .outlined,
            size: .medium,
            state: .disabled,
            leadingIcon: Image(systemName: "mappin.circle.fill"),
            trailingIcon: Image(systemName: "chevron.down")
        )
    }
    .padding()
    .preferredColorScheme(.dark)
}

#Preview("Dark Mode - Filled") {
    VStack(spacing: 20) {
        DSPill(
            "Default",
            style: .filled,
            size: .medium,
            state: .default,
            leadingIcon: Image(systemName: "mappin.circle.fill"),
            trailingIcon: Image(systemName: "chevron.down")
        )

        DSPill(
            "Pressed",
            style: .filled,
            size: .medium,
            state: .pressed,
            leadingIcon: Image(systemName: "mappin.circle.fill"),
            trailingIcon: Image(systemName: "chevron.down")
        )

        DSPill(
            "Selected",
            style: .filled,
            size: .medium,
            state: .selected,
            leadingIcon: Image(systemName: "mappin.circle.fill"),
            trailingIcon: Image(systemName: "chevron.down")
        )

        DSPill(
            "Disabled",
            style: .filled,
            size: .medium,
            state: .disabled,
            leadingIcon: Image(systemName: "mappin.circle.fill"),
            trailingIcon: Image(systemName: "chevron.down")
        )
    }
    .padding()
    .preferredColorScheme(.dark)
}

#Preview("Filled Without Background") {
    VStack(spacing: 20) {
        DSPill(
            "Transparent",
            style: .filled,
            size: .medium,
            state: .default,
            trailingIcon: Image(systemName: "chevron.down"),
            showBackground: false
        )

        DSPill(
            "With Background",
            style: .filled,
            size: .medium,
            state: .default,
            trailingIcon: Image(systemName: "chevron.down"),
            showBackground: true
        )
    }
    .padding()
}

#Preview("Interactive") {
    struct InteractiveDemo: View {
        @State private var selectedPill: String?

        var body: some View {
            VStack(spacing: 20) {
                ForEach(["Atlanta", "Cumberland", "Charlotte", "Nashville"], id: \.self) { location in
                    DSPill(
                        location,
                        style: .outlined,
                        size: .medium,
                        state: selectedPill == location ? .selected : .default,
                        leadingIcon: Image(systemName: "mappin.circle.fill"),
                        trailingIcon: Image(systemName: "chevron.down")
                    ) {
                        selectedPill = location
                    }
                }
            }
            .padding()
        }
    }

    return InteractiveDemo()
}

#Preview("All Variants") {
    ScrollView {
        VStack(spacing: 30) {
            VStack(alignment: .leading, spacing: 10) {
                Text("Outlined Pills")
                    .font(.headline)

                HStack(spacing: 10) {
                    DSPill("XL", style: .outlined, size: .extraLarge, trailingIcon: Image(systemName: "chevron.down"))
                    DSPill("Lg", style: .outlined, size: .large, trailingIcon: Image(systemName: "chevron.down"))
                    DSPill("Md", style: .outlined, size: .medium, trailingIcon: Image(systemName: "chevron.down"))
                    DSPill("Sm", style: .outlined, size: .small, trailingIcon: Image(systemName: "chevron.down"))
                }
            }

            VStack(alignment: .leading, spacing: 10) {
                Text("Filled Pills")
                    .font(.headline)

                HStack(spacing: 10) {
                    DSPill("XL", style: .filled, size: .extraLarge, trailingIcon: Image(systemName: "chevron.down"))
                    DSPill("Lg", style: .filled, size: .large, trailingIcon: Image(systemName: "chevron.down"))
                    DSPill("Md", style: .filled, size: .medium, trailingIcon: Image(systemName: "chevron.down"))
                    DSPill("Sm", style: .filled, size: .small, trailingIcon: Image(systemName: "chevron.down"))
                }
            }

            VStack(alignment: .leading, spacing: 10) {
                Text("States (Outlined)")
                    .font(.headline)

                HStack(spacing: 10) {
                    DSPill("Default", style: .outlined, size: .medium, state: .default)
                    DSPill("Pressed", style: .outlined, size: .medium, state: .pressed)
                    DSPill("Selected", style: .outlined, size: .medium, state: .selected)
                    DSPill("Disabled", style: .outlined, size: .medium, state: .disabled)
                }
            }

            VStack(alignment: .leading, spacing: 10) {
                Text("States (Filled)")
                    .font(.headline)

                HStack(spacing: 10) {
                    DSPill("Default", style: .filled, size: .medium, state: .default)
                    DSPill("Pressed", style: .filled, size: .medium, state: .pressed)
                    DSPill("Selected", style: .filled, size: .medium, state: .selected)
                    DSPill("Disabled", style: .filled, size: .medium, state: .disabled)
                }
            }
        }
        .padding()
    }
}

#Preview("Media - Icon") {
    VStack(spacing: 20) {
        DSPill(
            "Icon SM",
            style: .outlined,
            size: .small,
            leadingMedia: .icon(Image(systemName: "house.fill")),
            trailingIcon: Image(systemName: "chevron.down")
        )
        
        DSPill(
            "Icon SM",
            style: .outlined,
            size: .medium,
            leadingMedia: .icon(Image(systemName: "house.fill")),
            trailingIcon: Image(systemName: "chevron.down")
        )
        
        DSPill(
            "Icon LG",
            style: .outlined,
            size: .large,
            leadingMedia: .icon(Image(systemName: "house.fill")),
            trailingIcon: Image(systemName: "chevron.down")
        )
        
        DSPill(
            "Icon LG",
            style: .outlined,
            size: .extraLarge,
            leadingMedia: .icon(Image(systemName: "house.fill")),
            trailingIcon: Image(systemName: "chevron.down")
        )
    }
    .padding()
}

#Preview("Media - Image") {
    VStack(spacing: 20) {
        DSPill(
            "Image SM",
            style: .outlined,
            size: .small,
            leadingMedia: .image(Image(systemName: "photo.fill")),
            trailingIcon: Image(systemName: "chevron.down")
        )
        
        DSPill(
            "Image SM",
            style: .outlined,
            size: .medium,
            leadingMedia: .image(Image(systemName: "photo.fill")),
            trailingIcon: Image(systemName: "chevron.down")
        )
        
        DSPill(
            "Image LG",
            style: .outlined,
            size: .large,
            leadingMedia: .image(Image(systemName: "photo.fill")),
            trailingIcon: Image(systemName: "chevron.down")
        )
        
        DSPill(
            "Image LG",
            style: .outlined,
            size: .extraLarge,
            leadingMedia: .image(Image(systemName: "photo.fill")),
            trailingIcon: Image(systemName: "chevron.down")
        )
    }
    .padding()
}

#Preview("Media - Swatch") {
    let brandGradientStart = Color(red: 251/255, green: 162/255, blue: 104/255)
    let brandGradientEnd = Color(red: 249/255, green: 99/255, blue: 2/255)
    
    return VStack(spacing: 20) {
        DSPill(
            "Swatch SM",
            style: .outlined,
            size: .small,
            leadingMedia: .swatch(brandGradientStart, brandGradientEnd),
            trailingIcon: Image(systemName: "chevron.down")
        )
        
        DSPill(
            "Swatch SM",
            style: .outlined,
            size: .medium,
            leadingMedia: .swatch(brandGradientStart, brandGradientEnd),
            trailingIcon: Image(systemName: "chevron.down")
        )
        
        DSPill(
            "Swatch LG",
            style: .outlined,
            size: .large,
            leadingMedia: .swatch(brandGradientStart, brandGradientEnd),
            trailingIcon: Image(systemName: "chevron.down")
        )
        
        DSPill(
            "Swatch LG",
            style: .outlined,
            size: .extraLarge,
            leadingMedia: .swatch(brandGradientStart, brandGradientEnd),
            trailingIcon: Image(systemName: "chevron.down")
        )
    }
    .padding()
}

#Preview("Media - All Variants") {
    let brandGradientStart = Color(red: 251/255, green: 162/255, blue: 104/255)
    let brandGradientEnd = Color(red: 249/255, green: 99/255, blue: 2/255)
    
    return VStack(spacing: 20) {
        Text("Icon + Image + Swatch").font(.headline)
        
        HStack(spacing: 10) {
            DSPill(
                "Icon",
                style: .outlined,
                size: .medium,
                leadingMedia: .icon(Image(systemName: "house.fill"))
            )
            
            DSPill(
                "Image",
                style: .outlined,
                size: .medium,
                leadingMedia: .image(Image(systemName: "photo.fill"))
            )
            
            DSPill(
                "Swatch",
                style: .outlined,
                size: .medium,
                leadingMedia: .swatch(brandGradientStart, brandGradientEnd)
            )
        }
        
        Text("Filled Style").font(.headline)
        
        HStack(spacing: 10) {
            DSPill(
                "Icon",
                style: .filled,
                size: .medium,
                leadingMedia: .icon(Image(systemName: "house.fill")),
                trailingIcon: Image(systemName: "chevron.down")
            )
            
            DSPill(
                "Image",
                style: .filled,
                size: .medium,
                leadingMedia: .image(Image(systemName: "photo.fill")),
                trailingIcon: Image(systemName: "chevron.down")
            )
            
            DSPill(
                "Swatch",
                style: .filled,
                size: .medium,
                leadingMedia: .swatch(brandGradientStart, brandGradientEnd),
                trailingIcon: Image(systemName: "chevron.down")
            )
        }
    }
    .padding()
}
