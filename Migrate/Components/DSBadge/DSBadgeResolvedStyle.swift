import SwiftUI

// MARK: - DSBadgeResolvedStyle

/// Resolved style information for DSBadge testing.
///
/// This struct captures computed styles as concrete values using token names,
/// enabling unit tests without view rendering or environment dependencies.
public struct DSBadgeResolvedStyle: Equatable, Sendable {
    /// The foreground color token name
    public let foregroundColorTokenName: String

    /// The background color token name
    public let backgroundColorTokenName: String

    /// The size configuration
    public let size: DSBadgeSize

    /// The variant type
    public let variant: DSBadgeVariant

    /// The color theme
    public let color: DSBadgeColor

    /// Creates a resolved style for the given configuration.
    public init(size: DSBadgeSize, variant: DSBadgeVariant, color: DSBadgeColor) {
        self.foregroundColorTokenName = DSBadgeColorHelper.foregroundColorTokenName(variant: variant, color: color)
        self.backgroundColorTokenName = DSBadgeColorHelper.backgroundColorTokenName(variant: variant, color: color)
        self.size = size
        self.variant = variant
        self.color = color
    }
}
