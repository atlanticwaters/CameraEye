import SwiftUI

// MARK: - Rating Values

#Preview("Rating 0") {
    DSRatingMeter(rating: 0)
        .padding()
}

#Preview("Rating 0.5") {
    DSRatingMeter(rating: 0.5)
        .padding()
}

#Preview("Rating 1") {
    DSRatingMeter(rating: 1)
        .padding()
}

#Preview("Rating 2.5") {
    DSRatingMeter(rating: 2.5)
        .padding()
}

#Preview("Rating 3.5") {
    DSRatingMeter(rating: 3.5)
        .padding()
}

#Preview("Rating 4") {
    DSRatingMeter(rating: 4)
        .padding()
}

#Preview("Rating 4.5") {
    DSRatingMeter(rating: 4.5)
        .padding()
}

#Preview("Rating 5") {
    DSRatingMeter(rating: 5)
        .padding()
}

// MARK: - With Review Count

#Preview("With Review Count") {
    VStack(spacing: 16) {
        DSRatingMeter(rating: 4.5, reviewCount: 42)
        DSRatingMeter(rating: 4.0, reviewCount: 1234)
        DSRatingMeter(rating: 3.5, reviewCount: 9999)
    }
    .padding()
}

// MARK: - Sizes

#Preview("Small Size") {
    DSRatingMeter(rating: 4.5, reviewCount: 123, size: .small)
        .padding()
}

#Preview("Medium Size") {
    DSRatingMeter(rating: 4.5, reviewCount: 123, size: .medium)
        .padding()
}

#Preview("Large Size") {
    DSRatingMeter(rating: 4.5, reviewCount: 123, size: .large)
        .padding()
}

#Preview("All Sizes") {
    VStack(spacing: 24) {
        ForEach(DSRatingMeterSize.allCases, id: \.self) { size in
            VStack(alignment: .leading, spacing: 8) {
                Text(sizeName(size))
                    .font(.caption)
                    .foregroundStyle(.secondary)

                DSRatingMeter(rating: 4.5, reviewCount: 1234, size: size)
            }
        }
    }
    .padding()
}

// MARK: - Without Label

#Preview("Without Label") {
    DSRatingMeter(rating: 4.5, showLabel: false)
        .padding()
}

// MARK: - Focused State

#Preview("Focused") {
    DSRatingMeter(rating: 4.5, reviewCount: 123, isFocused: true)
        .padding()
}

// MARK: - All Ratings

#Preview("All Ratings") {
    ScrollView {
        VStack(alignment: .leading, spacing: 12) {
            ForEach([0.0, 0.5, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0], id: \.self) { rating in
                HStack {
                    Text(String(format: "%.1f", rating))
                        .font(.caption)
                        .frame(width: 30, alignment: .trailing)

                    DSRatingMeter(rating: rating)
                }
            }
        }
        .padding()
    }
}

// MARK: - Dark Mode

#Preview("Dark Mode") {
    VStack(spacing: 16) {
        DSRatingMeter(rating: 4.5, reviewCount: 1234)
        DSRatingMeter(rating: 3.0, reviewCount: 567)
        DSRatingMeter(rating: 2.5)
    }
    .padding()
    .preferredColorScheme(.dark)
}

// MARK: - Factory Methods

#Preview("Factory Methods") {
    VStack(spacing: 16) {
        DSRatingMeter.compact(rating: 4.5)
        DSRatingMeter.withReviews(rating: 4.0, reviewCount: 1234)
    }
    .padding()
}

// MARK: - Helpers

private func sizeName(_ size: DSRatingMeterSize) -> String {
    switch size {
    case .small: "Small (16pt)"
    case .medium: "Medium (24pt)"
    case .large: "Large (32pt)"
    }
}
