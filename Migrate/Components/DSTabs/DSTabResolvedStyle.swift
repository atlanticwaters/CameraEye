import SwiftUI

// MARK: - DSTabResolvedStyle

/// Resolved style information for DSTab testing.
///
/// This struct captures computed styles as concrete values using token names,
/// enabling unit tests without view rendering or environment dependencies.
public struct DSTabResolvedStyle: Equatable, Sendable {
    /// The background color token name
    public let backgroundColorTokenName: String

    /// The text color token name
    public let textColorTokenName: String

    /// The indicator color token name
    public let indicatorColorTokenName: String

    /// The divider color token name
    public let dividerColorTokenName: String

    /// The tab size
    public let size: DSTabSize

    /// The tab style
    public let style: DSTabStyle

    /// Whether the tab is selected
    public let isSelected: Bool

    /// Whether the tab is disabled
    public let isDisabled: Bool

    /// Creates a resolved style for the given configuration.
    public init(
        size: DSTabSize,
        style: DSTabStyle,
        isSelected: Bool,
        isDisabled: Bool
    ) {
        self.backgroundColorTokenName = DSTabColorHelper.backgroundColorTokenName(
            style: style,
            isSelected: isSelected,
            isDisabled: isDisabled
        )
        self.textColorTokenName = DSTabColorHelper.textColorTokenName(
            isSelected: isSelected,
            isDisabled: isDisabled
        )
        self.indicatorColorTokenName = DSTabColorHelper.indicatorColorTokenName()
        self.dividerColorTokenName = DSTabColorHelper.dividerColorTokenName()
        self.size = size
        self.style = style
        self.isSelected = isSelected
        self.isDisabled = isDisabled
    }
}
