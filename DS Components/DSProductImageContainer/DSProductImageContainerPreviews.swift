import SwiftUI

#if DEBUG
// MARK: - Preview Helpers

private func previewContainer(
    showExclusiveBadge: Bool = true,
    showDeliveryBadge: Bool = true,
    showSponsoredTag: Bool = true,
    swatchCount: Int = 3,
    additionalCount: Int? = 99
) -> DSProductImageContainer {
    DSProductImageContainer(
        imageURL: nil,
        placeholderImage: Image("Fridge"),
        showExclusiveBadge: showExclusiveBadge,
        showDeliveryBadge: showDeliveryBadge,
        showSponsoredTag: showSponsoredTag,
        swatches: previewSwatches(count: swatchCount),
        selectedSwatchIndex: 0,
        additionalSwatchCount: additionalCount
    )
}

private func previewSwatches(count: Int) -> [Color] {
    guard count > 0 else { return [] }
    let palette: [Color] = [.black, .gray, .brown]
    return Array(palette.prefix(count))
}

// MARK: - DSProductImageContainer Previews

// Individual Variant Previews - Light Mode
#Preview("All Badges & Swatches") {
    previewContainer(
        showExclusiveBadge: true,
        showDeliveryBadge: true,
        showSponsoredTag: true,
        swatchCount: 3,
        additionalCount: 99
    )
    .padding()
}

#Preview("No Badges") {
    previewContainer(
        showExclusiveBadge: false,
        showDeliveryBadge: false,
        showSponsoredTag: true,
        swatchCount: 3,
        additionalCount: 99
    )
    .padding()
}

#Preview("Exclusive Badge Only") {
    previewContainer(
        showExclusiveBadge: true,
        showDeliveryBadge: false,
        showSponsoredTag: true,
        swatchCount: 3,
        additionalCount: nil
    )
    .padding()
}

#Preview("Delivery Badge Only") {
    previewContainer(
        showExclusiveBadge: false,
        showDeliveryBadge: true,
        showSponsoredTag: true,
        swatchCount: 3,
        additionalCount: nil
    )
    .padding()
}

#Preview("No Sponsored Tag") {
    previewContainer(
        showExclusiveBadge: true,
        showDeliveryBadge: true,
        showSponsoredTag: false,
        swatchCount: 3,
        additionalCount: 99
    )
    .padding()
}

#Preview("Few Swatches") {
    previewContainer(
        showExclusiveBadge: true,
        showDeliveryBadge: true,
        showSponsoredTag: true,
        swatchCount: 2,
        additionalCount: nil
    )
    .padding()
}

#Preview("No Swatches") {
    previewContainer(
        showExclusiveBadge: true,
        showDeliveryBadge: true,
        showSponsoredTag: true,
        swatchCount: 0,
        additionalCount: nil
    )
    .padding()
}

#Preview("Minimal") {
    previewContainer(
        showExclusiveBadge: false,
        showDeliveryBadge: false,
        showSponsoredTag: false,
        swatchCount: 0,
        additionalCount: nil
    )
    .padding()
}

// Dark Mode Previews
#Preview("All Badges & Swatches - Dark") {
    previewContainer(
        showExclusiveBadge: true,
        showDeliveryBadge: true,
        showSponsoredTag: true,
        swatchCount: 3,
        additionalCount: 99
    )
    .padding()
    .preferredColorScheme(.dark)
}

#Preview("Minimal - Dark") {
    previewContainer(
        showExclusiveBadge: false,
        showDeliveryBadge: false,
        showSponsoredTag: false,
        swatchCount: 0,
        additionalCount: nil
    )
    .padding()
    .preferredColorScheme(.dark)
}

// Comparison Preview
#Preview("Light vs Dark") {
    HStack(spacing: 20) {
        VStack {
            Text("Light").font(.caption)
            previewContainer()
                .environment(\.colorScheme, .light)
        }
        VStack {
            Text("Dark").font(.caption)
            previewContainer()
                .environment(\.colorScheme, .dark)
                .background(Color.black)
        }
    }
    .padding()
}
#endif
