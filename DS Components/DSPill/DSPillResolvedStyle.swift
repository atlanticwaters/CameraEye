import SwiftUI

// MARK: - DSPillResolvedStyle

/// Resolved style information for DSPill testing.
///
/// This struct captures computed styles as concrete values using token names,
/// enabling unit tests without view rendering or environment dependencies.
public struct DSPillResolvedStyle: Equatable, Sendable {
    /// The background color token name
    public let backgroundColorTokenName: String

    /// The border color token name
    public let borderColorTokenName: String

    /// The foreground color token name
    public let foregroundColorTokenName: String

    /// The style type
    public let style: DSPillStyle

    /// The size
    public let size: DSPillSize

    /// Whether the pill is selected
    public let isSelected: Bool

    /// Whether the pill is disabled
    public let isDisabled: Bool

    /// Whether the pill has background
    public let hasBackground: Bool

    /// Creates a resolved style for the given configuration.
    public init(
        style: DSPillStyle,
        size: DSPillSize,
        isSelected: Bool,
        isDisabled: Bool,
        hasBackground: Bool = true
    ) {
        self.backgroundColorTokenName = DSPillColorHelper.backgroundColorTokenName(
            style: style,
            isSelected: isSelected,
            isDisabled: isDisabled,
            hasBackground: hasBackground
        )
        self.borderColorTokenName = DSPillColorHelper.borderColorTokenName(
            style: style,
            isSelected: isSelected,
            isDisabled: isDisabled
        )
        self.foregroundColorTokenName = DSPillColorHelper.foregroundColorTokenName(
            style: style,
            isSelected: isSelected,
            isDisabled: isDisabled
        )
        self.style = style
        self.size = size
        self.isSelected = isSelected
        self.isDisabled = isDisabled
        self.hasBackground = hasBackground
    }
}
