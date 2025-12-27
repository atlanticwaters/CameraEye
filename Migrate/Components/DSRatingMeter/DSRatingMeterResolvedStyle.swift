import SwiftUI

// MARK: - DSRatingMeterResolvedStyle

/// Resolved style information for DSRatingMeter testing.
///
/// This struct captures computed styles as concrete values using token names,
/// enabling unit tests without view rendering or environment dependencies.
public struct DSRatingMeterResolvedStyle: Equatable, Sendable {
    /// The filled star color token name
    public let filledColorTokenName: String

    /// The empty star color token name
    public let emptyColorTokenName: String

    /// The label color token name
    public let labelColorTokenName: String

    /// The focus border color token name
    public let focusBorderColorTokenName: String

    /// The size variant
    public let size: DSRatingMeterSize

    /// The rating value
    public let rating: Double

    /// Whether the label is shown
    public let showLabel: Bool

    /// Whether the component is focused
    public let isFocused: Bool

    /// Creates a resolved style for the given configuration.
    public init(
        size: DSRatingMeterSize,
        rating: Double,
        showLabel: Bool,
        isFocused: Bool
    ) {
        self.filledColorTokenName = DSRatingMeterColorHelper.filledColorTokenName()
        self.emptyColorTokenName = DSRatingMeterColorHelper.emptyColorTokenName()
        self.labelColorTokenName = DSRatingMeterColorHelper.labelColorTokenName()
        self.focusBorderColorTokenName = DSRatingMeterColorHelper.focusBorderColorTokenName()
        self.size = size
        self.rating = rating
        self.showLabel = showLabel
        self.isFocused = isFocused
    }
}
