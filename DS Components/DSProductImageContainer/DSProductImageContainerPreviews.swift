import SwiftUI

// MARK: - DSProductImageContainer Previews

// Individual Variant Previews - Light Mode
#Preview("All Badges & Swatches") {
    DSProductImageContainer.sample(
        showExclusiveBadge: true,
        showDeliveryBadge: true,
        showSponsoredTag: true,
        swatchCount: 3,
        additionalCount: 99
    )
    .padding()
}

#Preview("No Badges") {
    DSProductImageContainer.sample(
        showExclusiveBadge: false,
        showDeliveryBadge: false,
        showSponsoredTag: true,
        swatchCount: 3,
        additionalCount: 99
    )
    .padding()
}

#Preview("Exclusive Badge Only") {
    DSProductImageContainer.sample(
        showExclusiveBadge: true,
        showDeliveryBadge: false,
        showSponsoredTag: true,
        swatchCount: 3,
        additionalCount: nil
    )
    .padding()
}

#Preview("Delivery Badge Only") {
    DSProductImageContainer.sample(
        showExclusiveBadge: false,
        showDeliveryBadge: true,
        showSponsoredTag: true,
        swatchCount: 3,
        additionalCount: nil
    )
    .padding()
}

#Preview("No Sponsored Tag") {
    DSProductImageContainer.sample(
        showExclusiveBadge: true,
        showDeliveryBadge: true,
        showSponsoredTag: false,
        swatchCount: 3,
        additionalCount: 99
    )
    .padding()
}

#Preview("Few Swatches") {
    DSProductImageContainer.sample(
        showExclusiveBadge: true,
        showDeliveryBadge: true,
        showSponsoredTag: true,
        swatchCount: 2,
        additionalCount: nil
    )
    .padding()
}

#Preview("No Swatches") {
    DSProductImageContainer.sample(
        showExclusiveBadge: true,
        showDeliveryBadge: true,
        showSponsoredTag: true,
        swatchCount: 0,
        additionalCount: nil
    )
    .padding()
}

#Preview("Minimal") {
    DSProductImageContainer.sample(
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
    DSProductImageContainer.sample(
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
    DSProductImageContainer.sample(
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
            DSProductImageContainer.sample()
                .environment(\.colorScheme, .light)
        }
        VStack {
            Text("Dark").font(.caption)
            DSProductImageContainer.sample()
                .environment(\.colorScheme, .dark)
                .background(Color.black)
        }
    }
    .padding()
}
