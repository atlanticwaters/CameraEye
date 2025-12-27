import SwiftUI

// MARK: - DSTileResolvedStyle

/// Resolved style information for DSTile testing.
///
/// This struct captures computed styles as concrete values using token names,
/// enabling unit tests without view rendering or environment dependencies.
public struct DSTileResolvedStyle: Equatable, Sendable {
    /// The background color token name
    public let backgroundColorTokenName: String

    /// The border color token name
    public let borderColorTokenName: String

    /// The text color token name
    public let textColorTokenName: String

    /// The variant type
    public let variant: DSTileVariant

    /// Whether the tile is selected
    public let isSelected: Bool

    /// Whether the tile is disabled
    public let isDisabled: Bool

    /// Creates a resolved style for the given configuration.
    public init(variant: DSTileVariant, isSelected: Bool, isDisabled: Bool) {
        self.backgroundColorTokenName = DSTileColorHelper.backgroundColorTokenName(
            variant: variant,
            isSelected: isSelected,
            isDisabled: isDisabled
        )
        self.borderColorTokenName = DSTileColorHelper.borderColorTokenName(
            variant: variant,
            isSelected: isSelected,
            isDisabled: isDisabled
        )
        self.textColorTokenName = DSTileColorHelper.textColorTokenName(
            isSelected: isSelected,
            isDisabled: isDisabled
        )
        self.variant = variant
        self.isSelected = isSelected
        self.isDisabled = isDisabled
    }
}
