import SwiftUI

// MARK: - DSRatingMeterSize

/// Size variants for DSRatingMeter star icons.
public enum DSRatingMeterSize: CaseIterable, Sendable {
    /// Small size (16pt stars)
    case small
    /// Medium size (24pt stars)
    case medium
    /// Large size (32pt stars)
    case large

    var starSize: CGFloat {
        switch self {
        case .small: 16
        case .medium: 24
        case .large: 32
        }
    }

    var spacing: CGFloat {
        switch self {
        case .small: 2
        case .medium: 4
        case .large: 4
        }
    }

    var fontSize: CGFloat {
        switch self {
        case .small: 12
        case .medium: 14
        case .large: 16
        }
    }
}

// MARK: - DSRatingMeter

/// A rating meter component that displays star ratings.
///
/// DSRatingMeter displays a star-based rating with support for half-star increments.
/// It optionally shows a label with the rating count.
///
/// Example usage:
/// ```swift
/// // Simple rating display
/// DSRatingMeter(rating: 4.5)
///
/// // With review count label
/// DSRatingMeter(rating: 4.5, reviewCount: 1234)
///
/// // Different sizes
/// DSRatingMeter(rating: 3.5, size: .large)
/// ```
public struct DSRatingMeter: View {
    // MARK: - Properties

    private let rating: Double
    private let maxRating: Int
    private let reviewCount: Int?
    private let size: DSRatingMeterSize
    private let showLabel: Bool
    private let isFocused: Bool

    // MARK: - Styling

    private var filledColor: Color {
        DSRatingMeterColorHelper.filledColor()
    }

    private var emptyColor: Color {
        DSRatingMeterColorHelper.emptyColor()
    }

    private var labelColor: Color {
        DSRatingMeterColorHelper.labelColor()
    }

    private var focusBorderColor: Color {
        DSRatingMeterColorHelper.focusBorderColor()
    }

    // MARK: - Initializers

    /// Creates a rating meter.
    /// - Parameters:
    ///   - rating: The rating value (0.0 to 5.0, supports half increments).
    ///   - maxRating: The maximum rating value. Defaults to 5.
    ///   - reviewCount: Optional review count to display as a label.
    ///   - size: The size of the stars.
    ///   - showLabel: Whether to show the review count label.
    ///   - isFocused: Whether the component has focus (shows focus border).
    public init(
        rating: Double,
        maxRating: Int = 5,
        reviewCount: Int? = nil,
        size: DSRatingMeterSize = .medium,
        showLabel: Bool = true,
        isFocused: Bool = false
    ) {
        self.rating = min(max(rating, 0), Double(maxRating))
        self.maxRating = maxRating
        self.reviewCount = reviewCount
        self.size = size
        self.showLabel = showLabel && reviewCount != nil
        self.isFocused = isFocused
    }

    // MARK: - Body

    public var body: some View {
        HStack(spacing: size.spacing) {
            // Stars
            starsView

            // Label
            if showLabel, let count = reviewCount {
                labelView(count: count)
            }
        }
        .padding(isFocused ? 2 : 0)
        .overlay(focusBorder)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(accessibilityLabel)
    }

    // MARK: - Stars View

    @ViewBuilder
    private var starsView: some View {
        HStack(spacing: size.spacing) {
            ForEach(1...maxRating, id: \.self) { index in
                starView(for: index)
            }
        }
    }

    @ViewBuilder
    private func starView(for index: Int) -> some View {
        let fillAmount = starFillAmount(for: index)

        ZStack {
            // Empty star (background)
            Image(systemName: "star.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: size.starSize, height: size.starSize)
                .foregroundColor(emptyColor)

            // Filled star (masked based on fill amount)
            if fillAmount > 0 {
                Image(systemName: "star.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: size.starSize, height: size.starSize)
                    .foregroundColor(filledColor)
                    .mask(
                        Rectangle()
                            .frame(width: size.starSize * fillAmount)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    )
            }
        }
    }

    private func starFillAmount(for index: Int) -> CGFloat {
        let starValue = Double(index)
        if rating >= starValue {
            return 1.0
        } else if rating >= starValue - 0.5 {
            return 0.5
        } else {
            return 0.0
        }
    }

    // MARK: - Label View

    @ViewBuilder
    private func labelView(count: Int) -> some View {
        Text("(\(formattedCount(count)))")
            .font(.system(size: size.fontSize, weight: .regular))
            .foregroundColor(labelColor)
    }

    private func formattedCount(_ count: Int) -> String {
        if count >= 1000 {
            let thousands = Double(count) / 1000.0
            return String(format: "%.1fK", thousands)
        }
        return "\(count)"
    }

    // MARK: - Focus Border

    @ViewBuilder
    private var focusBorder: some View {
        if isFocused {
            RoundedRectangle(cornerRadius: 4)
                .stroke(focusBorderColor, lineWidth: 2)
        }
    }

    // MARK: - Accessibility

    private var accessibilityLabel: Text {
        if let count = reviewCount, showLabel {
            Text("\(String(format: "%.1f", rating)) out of \(maxRating) stars, \(count) reviews")
        } else {
            Text("\(String(format: "%.1f", rating)) out of \(maxRating) stars")
        }
    }
}

// MARK: - Convenience Factory Methods

extension DSRatingMeter {
    /// Creates a compact rating meter without label.
    public static func compact(rating: Double, size: DSRatingMeterSize = .small) -> DSRatingMeter {
        DSRatingMeter(rating: rating, size: size, showLabel: false)
    }

    /// Creates a rating meter with review count.
    public static func withReviews(
        rating: Double,
        reviewCount: Int,
        size: DSRatingMeterSize = .medium
    ) -> DSRatingMeter {
        DSRatingMeter(rating: rating, reviewCount: reviewCount, size: size)
    }
}
