import SwiftUI

// MARK: - DSAlertResolvedStyle

/// Resolved style information for DSAlert testing.
///
/// This struct captures computed styles as concrete values using token names,
/// enabling unit tests without view rendering or environment dependencies.
public struct DSAlertResolvedStyle: Equatable, Sendable {
    /// The background color token name
    public let backgroundTokenName: String

    /// The icon color token name
    public let iconColorTokenName: String

    /// The text color token name
    public let textColorTokenName: String

    /// Whether the alert is floating (has shadow)
    public let isFloating: Bool

    /// Corner radius value
    public let cornerRadius: CGFloat

    /// Creates a resolved style for the given configuration.
    public init(variant: DSAlertVariant, isFloating: Bool) {
        self.backgroundTokenName = DSAlertColorHelper.backgroundTokenName(variant: variant)
        self.iconColorTokenName = DSAlertColorHelper.iconColorTokenName(variant: variant)
        self.textColorTokenName = DSAlertColorHelper.textColorTokenName(variant: variant)
        self.isFloating = isFloating
        self.cornerRadius = CGFloat(TokensSemanticLight.BorderRadiusXl)
    }
}
