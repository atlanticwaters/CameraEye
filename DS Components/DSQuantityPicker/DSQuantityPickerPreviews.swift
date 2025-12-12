import SwiftUI

// MARK: - Previews

#Preview("Sizes - Orange") {
    VStack(spacing: 16) {
        Text("Orange Variant").font(.headline)

        HStack(spacing: 16) {
            previewCard(title: "Small", size: .small, color: .orange)
            previewCard(title: "Medium", size: .medium, color: .orange)
            previewCard(title: "Large", size: .large, color: .orange)
        }
    }
    .padding()
}

#Preview("Sizes - Grey") {
    VStack(spacing: 16) {
        Text("Grey Variant").font(.headline)

        HStack(spacing: 16) {
            previewCard(title: "Small", size: .small, color: .grey)
            previewCard(title: "Medium", size: .medium, color: .grey)
            previewCard(title: "Large", size: .large, color: .grey)
        }
    }
    .padding()
}

#Preview("Quantities - Orange") {
    VStack(spacing: 16) {
        Text("Different Quantities (Orange)").font(.headline)

        previewCard(title: "Quantity: 1", size: .medium, color: .orange, initialQuantity: 1)
        previewCard(title: "Quantity: 5", size: .medium, color: .orange, initialQuantity: 5)
        previewCard(title: "Quantity: 99", size: .medium, color: .orange, initialQuantity: 99)
    }
    .padding()
}

#Preview("Quantities - Grey") {
    VStack(spacing: 16) {
        Text("Different Quantities (Grey)").font(.headline)

        previewCard(title: "Quantity: 1", size: .medium, color: .grey, initialQuantity: 1)
        previewCard(title: "Quantity: 5", size: .medium, color: .grey, initialQuantity: 5)
        previewCard(title: "Quantity: 99", size: .medium, color: .grey, initialQuantity: 99)
    }
    .padding()
}

#Preview("Dark Mode - Orange") {
    VStack(spacing: 16) {
        Text("Orange Variant (Dark Mode)").font(.headline)

        HStack(spacing: 16) {
            previewCard(title: "Small", size: .small, color: .orange)
            previewCard(title: "Medium", size: .medium, color: .orange)
            previewCard(title: "Large", size: .large, color: .orange)
        }
    }
    .padding()
    .preferredColorScheme(.dark)
}

#Preview("Dark Mode - Grey") {
    VStack(spacing: 16) {
        Text("Grey Variant (Dark Mode)").font(.headline)

        HStack(spacing: 16) {
            previewCard(title: "Small", size: .small, color: .grey)
            previewCard(title: "Medium", size: .medium, color: .grey)
            previewCard(title: "Large", size: .large, color: .grey)
        }
    }
    .padding()
    .preferredColorScheme(.dark)
}

#Preview("Interactive") {
    InteractivePreview()
        .padding()
}

#Preview("All Variants") {
    ScrollView {
        VStack(spacing: 24) {
            // Orange variants
            VStack(alignment: .leading, spacing: 12) {
                Text("Orange Variant").font(.headline)

                ForEach([DSQuantityPicker.Size.small, .medium, .large], id: \.self) { size in
                    previewCard(
                        title: "\(sizeLabel(size))",
                        size: size,
                        color: .orange
                    )
                }
            }

            Divider()

            // Grey variants
            VStack(alignment: .leading, spacing: 12) {
                Text("Grey Variant").font(.headline)

                ForEach([DSQuantityPicker.Size.small, .medium, .large], id: \.self) { size in
                    previewCard(
                        title: "\(sizeLabel(size))",
                        size: size,
                        color: .grey
                    )
                }
            }

            Divider()

            // Different quantities
            VStack(alignment: .leading, spacing: 12) {
                Text("Different Quantities").font(.headline)

                previewCard(title: "Quantity: 1", size: .medium, color: .orange, initialQuantity: 1)
                previewCard(title: "Quantity: 10", size: .medium, color: .orange, initialQuantity: 10)
                previewCard(title: "Quantity: 100", size: .medium, color: .orange, initialQuantity: 100)
            }
        }
        .padding()
    }
}

// MARK: - Helper Views

private struct InteractivePreview: View {
    @State private var orangeQuantity = 1
    @State private var greyQuantity = 5

    var body: some View {
        VStack(spacing: 24) {
            Text("Interactive Preview").font(.headline)

            VStack(spacing: 16) {
                Text("Orange: \(orangeQuantity)")
                DSQuantityPicker(
                    quantity: $orangeQuantity,
                    size: .medium,
                    color: .orange
                )

                Text("Grey: \(greyQuantity)")
                DSQuantityPicker(
                    quantity: $greyQuantity,
                    size: .medium,
                    color: .grey
                )
            }
        }
    }
}

@ViewBuilder
private func previewCard(
    title: String,
    size: DSQuantityPicker.Size,
    color: DSQuantityPicker.Color,
    initialQuantity: Int = 1
) -> some View {
    VStack(alignment: .leading, spacing: 8) {
        Text(title)
            .font(.caption)
            .foregroundColor(.secondary)

        PreviewWrapper(size: size, color: color, initialQuantity: initialQuantity)
    }
}

private struct PreviewWrapper: View {
    let size: DSQuantityPicker.Size
    let color: DSQuantityPicker.Color
    let initialQuantity: Int

    @State private var quantity: Int

    init(size: DSQuantityPicker.Size, color: DSQuantityPicker.Color, initialQuantity: Int) {
        self.size = size
        self.color = color
        self.initialQuantity = initialQuantity
        self._quantity = State(initialValue: initialQuantity)
    }

    var body: some View {
        DSQuantityPicker(
            quantity: $quantity,
            size: size,
            color: color
        )
    }
}

private func sizeLabel(_ size: DSQuantityPicker.Size) -> String {
    switch size {
    case .small: return "Small"
    case .medium: return "Medium"
    case .large: return "Large"
    }
}

// Make Size hashable for ForEach
extension DSQuantityPicker.Size: Hashable {}
