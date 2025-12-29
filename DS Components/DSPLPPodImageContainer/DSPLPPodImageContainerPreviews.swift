import SwiftUI

// MARK: - Default Preview

#Preview("Default with Badges") {
    DSPLPPodImageContainer(
        badges: [.exclusive(), .christmasDelivery()],
        isSponsored: true,
        swatchDisplay: .swatchesWithQuantity(
            swatches: sampleSwatches,
            additionalCount: 5
        )
    )
    .padding()
}

// MARK: - Swatches Only Preview

#Preview("Swatches Only") {
    DSPLPPodImageContainer(
        badges: [.topRated()],
        isSponsored: false,
        swatchDisplay: .swatchesOnly(swatches: sampleSwatches)
    )
    .padding()
}

// MARK: - More Options Preview

#Preview("More Options Available") {
    DSPLPPodImageContainer(
        badges: [.specialSavings()],
        isSponsored: true,
        swatchDisplay: .moreOptionsAvailable
    )
    .padding()
}

// MARK: - Custom Options Preview

#Preview("Custom Options") {
    DSPLPPodImageContainer(
        badges: [.newArrival()],
        isSponsored: false,
        swatchDisplay: .customOptions(text: "3 Sizes, 5 Colors")
    )
    .padding()
}

// MARK: - Swatch Error Preview

#Preview("Swatch Error") {
    DSPLPPodImageContainer(
        badges: [],
        isSponsored: false,
        swatchDisplay: .swatchError(
            swatches: sampleSwatches,
            errorMessage: "Select a color to see availability"
        )
    )
    .padding()
}

// MARK: - No Badges Preview

#Preview("No Badges") {
    DSPLPPodImageContainer(
        badges: [],
        isSponsored: true,
        swatchDisplay: .swatchesWithQuantity(
            swatches: sampleSwatches,
            additionalCount: 2
        )
    )
    .padding()
}

// MARK: - Minimal Preview

#Preview("Minimal (Image Only)") {
    DSPLPPodImageContainer(
        badges: [],
        isSponsored: false,
        swatchDisplay: .none
    )
    .padding()
}

// MARK: - Multiple Badges Preview

#Preview("Multiple Badges Wrapping") {
    DSPLPPodImageContainer(
        badges: [
            .exclusive(),
            .christmasDelivery(),
            .topRated(),
        ],
        isSponsored: false,
        swatchDisplay: .swatchesOnly(swatches: sampleSwatches)
    )
    .padding()
}

// MARK: - Grid Preview

#Preview("Product Grid") {
    ScrollView {
        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
            DSPLPPodImageContainer(
                badges: [.exclusive()],
                isSponsored: true,
                swatchDisplay: .swatchesWithQuantity(swatches: sampleSwatches, additionalCount: 3)
            )

            DSPLPPodImageContainer(
                badges: [.topRated()],
                isSponsored: false,
                swatchDisplay: .swatchesOnly(swatches: sampleSwatches)
            )

            DSPLPPodImageContainer(
                badges: [.specialSavings()],
                isSponsored: false,
                swatchDisplay: .moreOptionsAvailable
            )

            DSPLPPodImageContainer(
                badges: [],
                isSponsored: true,
                swatchDisplay: .customOptions(text: "4 Sizes Available")
            )
        }
        .padding()
    }
}

// MARK: - Sample Data

private let sampleSwatches: [DSPLPPodSwatch] = [
    DSPLPPodSwatch(id: "1", color: .brown),
    DSPLPPodSwatch(id: "2", color: .gray),
    DSPLPPodSwatch(id: "3", color: .black),
]
