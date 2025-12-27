import SwiftUI

// MARK: - DSContentCardResolvedStyle

/// Resolved style information for DSContentCard testing.
///
/// This struct captures computed styles as concrete values using token names,
/// enabling unit tests without view rendering or environment dependencies.
public struct DSContentCardResolvedStyle: Equatable, Sendable {
    /// The background color token name
    public let backgroundColorTokenName: String

    /// The title color token name
    public let titleColorTokenName: String

    /// The subtitle color token name
    public let subtitleColorTokenName: String

    /// The icon color token name
    public let iconColorTokenName: String

    /// The body placement
    public let bodyPlacement: DSContentCardBodyPlacement

    /// Whether the title is shown
    public let showTitle: Bool

    /// Whether the body is shown
    public let showBody: Bool

    /// Whether the bottom action is shown
    public let showBottomAction: Bool

    /// Creates a resolved style for the given configuration.
    public init(
        bodyPlacement: DSContentCardBodyPlacement,
        showTitle: Bool = true,
        showBody: Bool = true,
        showBottomAction: Bool = false
    ) {
        self.backgroundColorTokenName = DSContentCardColorHelper.backgroundColorTokenName()
        self.titleColorTokenName = DSContentCardColorHelper.titleColorTokenName()
        self.subtitleColorTokenName = DSContentCardColorHelper.subtitleColorTokenName()
        self.iconColorTokenName = DSContentCardColorHelper.iconColorTokenName()
        self.bodyPlacement = bodyPlacement
        self.showTitle = showTitle
        self.showBody = showBody
        self.showBottomAction = showBottomAction
    }
}
