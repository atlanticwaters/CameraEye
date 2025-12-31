import SwiftUI

// MARK: - B2C Variant Preview

#Preview("B2C Variant") {
    VStack(spacing: 20) {
        DSPLPPodButtonSet(
            variant: .b2c,
            onAddToCart: { print("Add to cart tapped") }
        )
        .frame(width: 205)
    }
    .padding()
}

// MARK: - B2B Variant Preview

#Preview("B2B Variant") {
    StatefulB2BPreview()
        .padding()
}

private struct StatefulB2BPreview: View {
    @State private var quantity = 1

    var body: some View {
        DSPLPPodButtonSet(
            variant: .b2b,
            quantity: quantity,
            onQuantityChanged: { newQuantity in
                quantity = newQuantity
            },
            onAddToCart: { print("Add to cart: \(quantity)") },
            onAddToList: { print("Add to list") }
        )
        .frame(width: 205)
    }
}

// MARK: - B2C Disabled Preview

#Preview("B2C Disabled") {
    DSPLPPodButtonSet(
        variant: .b2c,
        isAddToCartEnabled: false
    )
    .frame(width: 205)
    .padding()
}

// MARK: - B2B with Higher Quantity Preview

#Preview("B2B Higher Quantity") {
    DSPLPPodButtonSet(
        variant: .b2b,
        quantity: 5,
        onQuantityChanged: { _ in },
        onAddToCart: { },
        onAddToList: { }
    )
    .frame(width: 205)
    .padding()
}

// MARK: - B2B Disabled Buttons Preview

#Preview("B2B Disabled Buttons") {
    DSPLPPodButtonSet(
        variant: .b2b,
        quantity: 1,
        isAddToCartEnabled: false,
        isAddToListEnabled: false,
        onQuantityChanged: { _ in }
    )
    .frame(width: 205)
    .padding()
}

// MARK: - B2B at Min Quantity Preview

#Preview("B2B Min Quantity") {
    DSPLPPodButtonSet(
        variant: .b2b,
        quantity: 1,
        minQuantity: 1,
        onQuantityChanged: { _ in },
        onAddToCart: { },
        onAddToList: { }
    )
    .frame(width: 205)
    .padding()
}

// MARK: - B2B at Max Quantity Preview

#Preview("B2B Max Quantity") {
    DSPLPPodButtonSet(
        variant: .b2b,
        quantity: 99,
        maxQuantity: 99,
        onQuantityChanged: { _ in },
        onAddToCart: { },
        onAddToList: { }
    )
    .frame(width: 205)
    .padding()
}

// MARK: - Custom Button Text Preview

#Preview("Custom Button Text") {
    VStack(spacing: 20) {
        DSPLPPodButtonSet(
            variant: .b2c,
            addToCartText: "Buy Now",
            onAddToCart: { }
        )
        .frame(width: 205)

        DSPLPPodButtonSet(
            variant: .b2b,
            quantity: 1,
            addToCartText: "Add to Quote",
            addToListText: "Save for Later",
            onQuantityChanged: { _ in },
            onAddToCart: { },
            onAddToList: { }
        )
        .frame(width: 205)
    }
    .padding()
}

// MARK: - Side by Side Comparison Preview

#Preview("Side by Side Comparison") {
    HStack(spacing: 20) {
        VStack {
            Text("B2C")
                .font(.caption)
                .foregroundStyle(.secondary)

            DSPLPPodButtonSet(
                variant: .b2c,
                onAddToCart: { }
            )
            .frame(width: 160)
        }

        VStack {
            Text("B2B")
                .font(.caption)
                .foregroundStyle(.secondary)

            DSPLPPodButtonSet(
                variant: .b2b,
                quantity: 1,
                onQuantityChanged: { _ in },
                onAddToCart: { },
                onAddToList: { }
            )
            .frame(width: 160)
        }
    }
    .padding()
}
