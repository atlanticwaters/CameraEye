import SwiftUI

// MARK: - DSAccordionResolvedStyle

/// Resolved style information for DSAccordion testing.
///
/// This struct captures computed styles as concrete values using token names,
/// enabling unit tests without view rendering or environment dependencies.
public struct DSAccordionResolvedStyle: Equatable, Sendable {
    /// The background color token name
    public let backgroundColorTokenName: String

    /// The title color token name
    public let titleColorTokenName: String

    /// The subtitle color token name
    public let subtitleColorTokenName: String

    /// The icon color token name
    public let iconColorTokenName: String

    /// The divider color token name
    public let dividerColorTokenName: String

    /// The accordion type
    public let type: DSAccordionType

    /// Whether the accordion is borderless
    public let isBorderless: Bool

    /// Whether the divider is shown
    public let showDivider: Bool

    /// Whether the accordion is expanded
    public let isExpanded: Bool

    /// Creates a resolved style for the given configuration.
    public init(
        type: DSAccordionType,
        isBorderless: Bool,
        showDivider: Bool,
        isExpanded: Bool
    ) {
        self.backgroundColorTokenName = DSAccordionColorHelper.backgroundColorTokenName(isBorderless: isBorderless)
        self.titleColorTokenName = DSAccordionColorHelper.titleColorTokenName()
        self.subtitleColorTokenName = DSAccordionColorHelper.subtitleColorTokenName()
        self.iconColorTokenName = DSAccordionColorHelper.iconColorTokenName()
        self.dividerColorTokenName = DSAccordionColorHelper.dividerColorTokenName()
        self.type = type
        self.isBorderless = isBorderless
        self.showDivider = showDivider
        self.isExpanded = isExpanded
    }
}
