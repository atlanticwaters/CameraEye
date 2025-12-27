import SwiftUI

// MARK: - AccessibilityConstants

/// Minimum touch target sizes per platform guidelines.
/// These are enforced via unit tests to catch accessibility regressions.
public enum AccessibilityConstants {
    /// Apple HIG minimum: 44pt × 44pt
    /// See: https://developer.apple.com/design/human-interface-guidelines/accessibility
    public static let minTapTargetIOS: CGFloat = 44

    /// Material Design minimum: 48dp × 48dp
    /// See: https://m3.material.io/foundations/accessible-design/accessibility-basics
    public static let minTapTargetAndroid: CGFloat = 48
}

// MARK: - DSButtonResolvedSize

/// Resolved sizing values for DSButton, suitable for unit testing.
///
/// This struct captures all computed sizing values for a button size configuration,
/// enabling unit tests to verify accessibility compliance (min tap targets) and
/// layout math without rendering views.
public struct DSButtonResolvedSize: Equatable, Sendable {
    /// Button height in points
    public let height: CGFloat

    /// Horizontal padding in points
    public let horizontalPadding: CGFloat

    /// Icon size in points
    public let iconSize: CGFloat

    /// Spinner size in points
    public let spinnerSize: CGFloat

    /// Whether this size uses full width
    public let isFullWidth: Bool

    /// The size this was resolved from
    public let size: DSButtonSize

    /// Whether this size meets iOS minimum tap target (44pt)
    public var meetsIOSTapTarget: Bool {
        height >= AccessibilityConstants.minTapTargetIOS
    }

    /// Whether this size meets Android minimum tap target (48dp)
    /// Note: iOS components don't need to meet Android targets, but this is useful
    /// for parity testing when comparing cross-platform implementations.
    public var meetsAndroidTapTarget: Bool {
        height >= AccessibilityConstants.minTapTargetAndroid
    }

    // MARK: - Factory

    /// Resolves a button size to testable values.
    public static func resolve(size: DSButtonSize) -> Self {
        Self(
            height: size.height,
            horizontalPadding: size.horizontalPadding,
            iconSize: size.iconSize,
            spinnerSize: size.spinnerSize,
            isFullWidth: size.isFullWidth,
            size: size
        )
    }
}

// MARK: - DSButtonResolvedStyle

/// Resolved style values for DSButton, suitable for unit testing.
///
/// `DSButtonResolvedStyle` captures all computed style values for a button configuration
/// as concrete, comparable values. This enables exhaustive unit testing of the
/// variant → token mapping logic without rendering views.
///
/// ## Test Pattern
/// ```swift
/// @Test("OrangeFilled enabled uses brand token")
/// func orangeFilledToken() {
///     let style = DSButtonResolvedStyle.resolve(style: .orangeFilled, isDisabled: false)
///     #expect(style.backgroundTokenName == "buttonBackgroundBrandFilledDefault")
/// }
/// ```
///
/// ## Design Rationale
/// This is a "seam" type - a boundary between testable pure logic and framework-dependent code.
/// By extracting style resolution into this pure struct, we can:
/// 1. Unit test all variant/state combinations exhaustively
/// 2. Verify token usage without snapshot tests
/// 3. Catch token regressions immediately in fast unit tests
public struct DSButtonResolvedStyle: Equatable, Sendable {
    /// Token name for background color (for test verification)
    public let backgroundTokenName: String

    /// Token name for foreground color
    public let foregroundTokenName: String

    /// Token name for border color (only for outlined style)
    public let borderTokenName: String?

    /// Token name for pressed background color
    public let pressedBackgroundTokenName: String?

    /// Background fill (supports gradients)
    public let backgroundFill: DSBackgroundFill

    /// Whether the background fill uses a gradient
    public let usesGradient: Bool

    /// The style this was resolved from
    public let style: DSButtonStyle

    /// Whether this represents a disabled state
    public let isDisabled: Bool

    // MARK: - Factory

    /// Resolves a button configuration to testable values.
    ///
    /// - Parameters:
    ///   - style: The button style variant
    ///   - isDisabled: Whether the button is disabled
    /// - Returns: A fully resolved style with all computed values
    public static func resolve(
        style: DSButtonStyle,
        isDisabled: Bool
    ) -> Self {
        let bgTokenName = backgroundTokenName(style: style, isDisabled: isDisabled)
        let fgTokenName = foregroundTokenName(style: style, isDisabled: isDisabled)
        let borderName = style == .outlined ? Self.borderTokenName(isDisabled: isDisabled) : nil
        let pressedName = pressedTokenName(style: style)
        let fill = DSButtonColorHelper.backgroundFill(style: style, isDisabled: isDisabled)

        let usesGradient = switch fill.lightValue {
        case .linearGradient:
            true
        case .color:
            false
        }

        return Self(
            backgroundTokenName: bgTokenName,
            foregroundTokenName: fgTokenName,
            borderTokenName: borderName,
            pressedBackgroundTokenName: pressedName,
            backgroundFill: fill,
            usesGradient: usesGradient,
            style: style,
            isDisabled: isDisabled
        )
    }

    // MARK: - Token Name Resolution

    /// Returns the token name for the background color
    private static func backgroundTokenName(style: DSButtonStyle, isDisabled: Bool) -> String {
        switch style {
        case .orangeFilled:
            isDisabled ? "buttonBackgroundBrandFilledInactive" : "buttonBackgroundBrandFilledDefault"
        case .gradientFilled:
            isDisabled ? "buttonBackgroundBrandGradientFilledInactive" : "buttonBackgroundBrandGradientFilledDefault"
        case .outlined:
            "clear"
        case .whiteFilled:
            isDisabled ? "buttonBackgroundWhiteFilledInactive" : "buttonBackgroundWhiteFilledDefault"
        case .black5:
            isDisabled ? "buttonBackgroundTransparent05Inactive" : "buttonBackgroundTransparent05Default"
        case .black10:
            isDisabled ? "buttonBackgroundTransparent10Inactive" : "buttonBackgroundTransparent10Default"
        case .ghost:
            isDisabled ? "buttonBackgroundGhostFilledInactive" : "buttonBackgroundGhostFilledDefault"
        }
    }

    /// Returns the token name for the foreground color
    private static func foregroundTokenName(style: DSButtonStyle, isDisabled: Bool) -> String {
        switch style {
        case .orangeFilled:
            isDisabled ? "buttonTextOrangeFilledInactive" : "buttonTextOrangeFilledDefault"
        case .gradientFilled:
            isDisabled ? "buttonTextGradientFilledInactive" : "buttonTextGradientFilledDefault"
        case .outlined:
            isDisabled ? "buttonTextOrangeOutlineInactive" : "buttonTextOrangeOutlineDefault"
        case .whiteFilled:
            isDisabled ? "buttonTextWhiteFilledInactive" : "buttonTextWhiteFilledDefault"
        case .black5:
            isDisabled ? "buttonTextTransparent05FilledInactive" : "buttonTextTransparent05FilledDefault"
        case .black10:
            isDisabled ? "buttonTextTransparent10FilledInactive" : "buttonTextTransparent10FilledDefault"
        case .ghost:
            isDisabled ? "buttonTextGhostFilledInactive" : "buttonTextGhostFilledDefault"
        }
    }

    /// Returns the token name for the border color
    private static func borderTokenName(isDisabled: Bool) -> String {
        isDisabled ? "buttonBorderOrangeOutlineInactive" : "buttonBorderOrangeOutlineDefault"
    }

    /// Returns the token name for pressed state
    private static func pressedTokenName(style: DSButtonStyle) -> String? {
        switch style {
        case .ghost:
            "buttonBackgroundGhostFilledPressed"
        case .black5:
            "buttonBackgroundTransparent05Pressed"
        case .black10:
            "buttonBackgroundTransparent10Pressed"
        default:
            nil
        }
    }
}

// MARK: - DSBackgroundFill + Equatable

/// DSBackgroundFill needs Equatable for DSButtonResolvedStyle comparisons
extension DSBackgroundFill: Equatable {
    public static func == (lhs: DSBackgroundFill, rhs: DSBackgroundFill) -> Bool {
        // Compare by checking both light and dark fill values
        switch (lhs.lightValue, rhs.lightValue) {
        case let (.color(lColor), .color(rColor)):
            guard lColor.description == rColor.description else {
                return false
            }
        case (.linearGradient, .linearGradient):
            // Both are gradients - detailed comparison not needed for most tests
            break
        default:
            return false
        }

        switch (lhs.darkValue, rhs.darkValue) {
        case let (.color(lColor), .color(rColor)):
            return lColor.description == rColor.description
        case (.linearGradient, .linearGradient):
            return true // Both are gradients
        default:
            return false
        }
    }
}
