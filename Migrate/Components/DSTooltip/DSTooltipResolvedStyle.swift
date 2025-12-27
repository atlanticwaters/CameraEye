import SwiftUI

// MARK: - DSTooltipResolvedStyle

/// Resolved styling for DSTooltip component.
///
/// This seam enables deterministic unit tests by exposing the computed token
/// values as testable properties. Tests verify token *names* rather than colors.
///
/// ## Design Token Mapping
/// - Background: `containerBackgroundWhite`
/// - Text: `textOnSurfaceColorPrimary`
/// - Shadow: Uses elevation token `below3`
public struct DSTooltipResolvedStyle: Equatable {
    /// Token name for background color
    public let backgroundTokenName: String

    /// Token name for text color
    public let textTokenName: String

    /// Token name for corner radius (semantic)
    public let cornerRadiusTokenName: String

    /// Token name for shadow/elevation
    public let shadowTokenName: String

    /// Resolves the tooltip styling.
    /// DSTooltip has a single appearance (no variants).
    public static func resolve() -> Self {
        Self(
            backgroundTokenName: "containerBackgroundWhite",
            textTokenName: "textOnSurfaceColorPrimary",
            cornerRadiusTokenName: "borderRadiusXl",
            shadowTokenName: "elevationBelow3"
        )
    }
}

// MARK: - DSTooltipResolvedLayout

/// Resolved layout metrics for DSTooltip component.
///
/// Captures the sizing rules defined in Figma spec.
public struct DSTooltipResolvedLayout: Equatable {
    /// Whether the close button is shown
    public let showsClose: Bool

    /// Padding applied to content
    public let padding: EdgeInsets

    /// Arrow dimensions (varies by orientation)
    public let arrowSize: CGSize

    /// Close button tap target size
    public let closeButtonTapTarget: CGFloat

    /// Close icon size
    public let closeIconSize: CGFloat

    /// Spacing between text and close button
    public let contentSpacing: CGFloat

    /// Resolves layout for given configuration.
    /// - Parameter showsClose: Whether close button is displayed
    public static func resolve(showsClose: Bool) -> Self {
        // Per Figma: 12pt all sides, trailing 8pt when close button shown
        let trailingPadding: CGFloat = showsClose ? 8 : 12
        let padding = EdgeInsets(
            top: 12,
            leading: 12,
            bottom: 12,
            trailing: trailingPadding
        )

        return Self(
            showsClose: showsClose,
            padding: padding,
            arrowSize: CGSize(width: 12, height: 6), // Horizontal orientation default
            closeButtonTapTarget: 28, // 12 icon + 8*2 padding
            closeIconSize: 12,
            contentSpacing: 4
        )
    }
}

// MARK: - DSTooltipResolvedArrow

/// Resolved arrow dimensions for DSTooltip placement.
///
/// Arrow dimensions differ based on orientation (horizontal vs vertical placement).
public struct DSTooltipResolvedArrow: Equatable {
    /// Placement this arrow is resolved for
    public let placement: DSTooltipPlacement

    /// Width of the arrow
    public let width: CGFloat

    /// Height of the arrow
    public let height: CGFloat

    /// Whether this is a horizontal orientation (leading/trailing)
    public var isHorizontal: Bool {
        placement == .leading || placement == .trailing
    }

    /// Resolves arrow dimensions for given placement.
    /// - Parameter placement: Where the tooltip is positioned
    public static func resolve(for placement: DSTooltipPlacement) -> Self {
        let isHorizontal = placement == .leading || placement == .trailing
        return Self(
            placement: placement,
            width: isHorizontal ? 6 : 12,
            height: isHorizontal ? 12 : 6
        )
    }
}
