import SwiftUI

// MARK: - DSFeatureCardResolvedStyle

/// Resolved style information for DSFeatureCard testing.
///
/// This struct captures computed styles as concrete values using token names,
/// enabling unit tests without view rendering or environment dependencies.
public struct DSFeatureCardResolvedStyle: Equatable, Sendable {
    /// The background color token name
    public let backgroundColorTokenName: String

    /// The border color token name
    public let borderColorTokenName: String

    /// The title color token name
    public let titleColorTokenName: String

    /// The description color token name
    public let descriptionColorTokenName: String

    /// The icon color token name
    public let iconColorTokenName: String

    /// The card type
    public let type: DSFeatureCardType

    /// Creates a resolved style for the given configuration.
    public init(type: DSFeatureCardType) {
        self.backgroundColorTokenName = DSFeatureCardColorHelper.backgroundColorTokenName()
        self.borderColorTokenName = DSFeatureCardColorHelper.borderColorTokenName()
        self.titleColorTokenName = DSFeatureCardColorHelper.titleColorTokenName()
        self.descriptionColorTokenName = DSFeatureCardColorHelper.descriptionColorTokenName()
        self.iconColorTokenName = DSFeatureCardColorHelper.iconColorTokenName()
        self.type = type
    }
}
