import SwiftUI

// MARK: - DSPlpPodDetails Previews

// Individual Variant Previews - Light Mode
#Preview("Full Details - All Fields") {
    DSPlpPodDetails.sample()
        .padding()
        .preferredColorScheme(.light)
}

#Preview("Without Rating") {
    DSPlpPodDetails.sample(
        rating: nil,
        ratingCount: nil
    )
    .padding()
    .preferredColorScheme(.light)
}

#Preview("Without Model Number") {
    DSPlpPodDetails.sample(
        modelNumber: nil
    )
    .padding()
    .preferredColorScheme(.light)
}

#Preview("Without At Your Store") {
    DSPlpPodDetails.sample(
        showAtYourStore: false
    )
    .padding()
    .preferredColorScheme(.light)
}

#Preview("Without Delivery Info") {
    DSPlpPodDetails.sample(
        deliveryInfo: nil
    )
    .padding()
    .preferredColorScheme(.light)
}

#Preview("Minimal - Price Only") {
    DSPlpPodDetails.sample(
        modelNumber: nil,
        rating: nil,
        ratingCount: nil,
        pickupInfo: nil,
        deliveryInfo: nil,
        showAtYourStore: false
    )
    .padding()
    .preferredColorScheme(.light)
}

// Dark Mode Previews
#Preview("Full Details - Dark") {
    DSPlpPodDetails.sample()
        .padding()
        .preferredColorScheme(.dark)
        .background(Color.black)
}

#Preview("Without Rating - Dark") {
    DSPlpPodDetails.sample(
        rating: nil,
        ratingCount: nil
    )
    .padding()
    .preferredColorScheme(.dark)
        .background(Color.black)
}

#Preview("Minimal - Dark") {
    DSPlpPodDetails.sample(
        modelNumber: nil,
        rating: nil,
        ratingCount: nil,
        pickupInfo: nil,
        deliveryInfo: nil,
        showAtYourStore: false
    )
    .padding()
    .preferredColorScheme(.dark)
    .background(Color.black)
}

// Comparison Preview
#Preview("Light vs Dark") {
    HStack(spacing: 20) {
        VStack {
            Text("Light")
                .font(.caption)
            DSPlpPodDetails.sample()
                .padding()
                .background(Color.white)
        }
        
        VStack {
            Text("Dark")
                .font(.caption)
            DSPlpPodDetails.sample()
                .padding()
                .background(Color.black)
                .preferredColorScheme(.dark)
        }
    }
    .padding()
}

// Different Price Text Variants
#Preview("Standard Price") {
    DSPlpPodDetails.sample(
        priceText: "$249.99",
        showAtYourStore: false
    )
    .padding()
}

#Preview("Sale Price") {
    DSPlpPodDetails.sample(
        priceText: "$199.99",
        showAtYourStore: false
    )
    .padding()
}

// Different Rating Scenarios
#Preview("Perfect Rating") {
    DSPlpPodDetails.sample(
        rating: 5.0,
        ratingCount: 150,
        showAtYourStore: false
    )
    .padding()
}

#Preview("Low Rating") {
    DSPlpPodDetails.sample(
        rating: 2.5,
        ratingCount: 42,
        showAtYourStore: false
    )
    .padding()
}

#Preview("Many Reviews") {
    DSPlpPodDetails.sample(
        rating: 4.8,
        ratingCount: 1523,
        showAtYourStore: false
    )
    .padding()
}

// Stock Scenarios
#Preview("High Stock") {
    DSPlpPodDetails.sample(
        pickupInfo: "In stock, ready for pickup today",
        deliveryInfo: "Free delivery tomorrow",
        storeStock: "150"
    )
    .padding()
}

#Preview("Low Stock") {
    DSPlpPodDetails.sample(
        pickupInfo: "Limited stock, reserve now",
        deliveryInfo: "Standard delivery 3-5 days",
        storeStock: "2"
    )
    .padding()
}

#Preview("Out of Stock") {
    DSPlpPodDetails.sample(
        pickupInfo: "Out of stock",
        deliveryInfo: "Unavailable",
        storeStock: "0"
    )
    .padding()
}
