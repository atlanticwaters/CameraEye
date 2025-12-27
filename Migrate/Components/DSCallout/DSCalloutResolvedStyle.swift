import SwiftUI

// MARK: - DSCalloutResolvedStyle

/// Resolved style information for DSCallout testing.
///
/// This struct captures computed styles as concrete values using token names,
/// enabling unit tests without view rendering or environment dependencies.
public struct DSCalloutResolvedStyle: Equatable, Sendable {
    /// The background color token name
    public let backgroundTokenName: String

    /// The title color token name
    public let titleColorTokenName: String

    /// The body color token name
    public let bodyColorTokenName: String

    /// The icon color token name
    public let iconColorTokenName: String

    /// Whether the callout is floating (has shadow)
    public let isFloating: Bool

    /// Corner radius value
    public let cornerRadius: CGFloat

    /// Creates a resolved style for the given configuration.
    public init(variant: DSCalloutVariant, isFloating: Bool) {
        self.backgroundTokenName = DSCalloutColorHelper.backgroundTokenName(variant: variant)
        self.titleColorTokenName = DSCalloutColorHelper.titleColorTokenName(variant: variant)
        self.bodyColorTokenName = DSCalloutColorHelper.bodyColorTokenName(variant: variant)
        self.iconColorTokenName = DSCalloutColorHelper.iconColorTokenName(variant: variant)
        self.isFloating = isFloating
        self.cornerRadius = CGFloat(TokensSemanticLight.BorderRadiusXl)
    }
}
