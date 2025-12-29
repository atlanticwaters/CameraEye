import SwiftUI

// MARK: - DSShadow

/// Custom shadow type for design token shadows.
///
/// This struct represents shadow tokens with all the properties needed for
/// consistent shadow rendering across the design system.
///
/// - Note: This is different from SwiftUI's built-in shadow modifier which only
///   supports radius and offset. This struct includes spread for compatibility
///   with CSS/Figma shadow specifications.
///
/// ## Usage
/// ```swift
/// Text("Hello")
///     .shadow(TokensCoreLight.ElevationBelow1)
/// ```
@frozen
public struct DSShadow: Equatable, Sendable {
    /// Horizontal offset of the shadow
    public let x: CGFloat

    /// Vertical offset of the shadow
    public let y: CGFloat

    /// Blur radius of the shadow
    public let blur: CGFloat

    /// Spread radius of the shadow (note: SwiftUI doesn't natively support spread)
    public let spread: CGFloat

    /// Color of the shadow
    public let color: Color

    /// Creates a new shadow with the specified parameters.
    /// - Parameters:
    ///   - x: Horizontal offset
    ///   - y: Vertical offset
    ///   - blur: Blur radius
    ///   - spread: Spread radius
    ///   - color: Shadow color
    public init(x: CGFloat, y: CGFloat, blur: CGFloat, spread: CGFloat, color: Color) {
        self.x = x
        self.y = y
        self.blur = blur
        self.spread = spread
        self.color = color
    }
}

// MARK: - View Extension

extension View {
    /// Applies a design system shadow to the view.
    ///
    /// - Parameter shadow: The DSShadow token to apply
    /// - Returns: A view with the shadow applied
    ///
    /// - Note: SwiftUI's native shadow doesn't support spread radius.
    ///   The spread value is available on the token for reference but
    ///   is not applied in this modifier.
    @ViewBuilder
    public func shadow(_ shadow: DSShadow) -> some View {
        self.shadow(
            color: shadow.color,
            radius: shadow.blur,
            x: shadow.x,
            y: shadow.y
        )
    }
}
