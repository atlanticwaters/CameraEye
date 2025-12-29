import SwiftUI

// MARK: - DSIconButtonAccessibilityConstants

/// Minimum touch target sizes per platform guidelines.
/// Referenced by unit tests to ensure accessibility compliance.
public enum DSIconButtonAccessibilityConstants {
    /// Apple HIG minimum: 44pt × 44pt
    /// See: https://developer.apple.com/design/human-interface-guidelines/accessibility
    public static let minTapTargetIOS: CGFloat = 44

    /// Material Design minimum: 48dp × 48dp
    /// See: https://m3.material.io/foundations/accessible-design/accessibility-basics
    public static let minTapTargetAndroid: CGFloat = 48
}

// MARK: - DSIconButtonResolvedSize

/// Resolved sizing values for DSIconButton, suitable for unit testing.
///
/// This struct captures all computed sizing values for an icon button size configuration,
/// enabling unit tests to verify accessibility compliance (min tap targets) and
/// layout math without rendering views.
public struct DSIconButtonResolvedSize: Equatable, Sendable {
    /// The touch target size (outer container)
    public let touchTargetSize: CGFloat

    /// The visible button size (inner)
    public let buttonSize: CGFloat

    /// The icon size within the button
    public let iconSize: CGFloat

    /// The spinner size for loading state
    public let spinnerSize: CGFloat

    /// The original size enum value
    public let size: DSIconButtonSize

    /// Whether the touch target meets iOS minimum tap target (44pt)
    public var meetsIOSTapTarget: Bool {
        touchTargetSize >= DSIconButtonAccessibilityConstants.minTapTargetIOS
    }

    /// Whether the touch target meets Android minimum tap target (48dp)
    public var meetsAndroidTapTarget: Bool {
        touchTargetSize >= DSIconButtonAccessibilityConstants.minTapTargetAndroid
    }

    /// Resolves a DSIconButtonSize to testable values.
    public static func resolve(_ size: DSIconButtonSize) -> Self {
        Self(
            touchTargetSize: size.touchTargetSize,
            buttonSize: size.buttonSize,
            iconSize: size.iconSize,
            spinnerSize: size.spinnerSize,
            size: size
        )
    }
}

// MARK: - DSIconButtonResolvedStyle

/// A fully resolved icon button style with all visual properties extracted.
///
/// This type serves as a **seam** for testing: it extracts the pure style
/// resolution logic from DSIconButton, enabling fast unit tests that verify
/// token mappings without rendering views.
///
/// Uses **token names** instead of color values to ensure reliable testing
/// across all environments (Xcode, CI, headless CLI).
public struct DSIconButtonResolvedStyle: Equatable, Sendable {
    /// The token name for the background color
    public let backgroundTokenName: String

    /// The token name for the foreground/icon color
    public let foregroundTokenName: String

    /// The token name for the border color (only for Outlined style)
    public let borderTokenName: String?

    /// The token name for the pressed background (only for certain styles)
    public let pressedBackgroundTokenName: String?

    /// The original style enum value
    public let style: DSIconButtonStyle

    /// Whether the button is disabled
    public let isDisabled: Bool

    /// Resolves an icon button style to a fully-resolved style with token names.
    ///
    /// - Parameters:
    ///   - style: The icon button style variant
    ///   - isDisabled: Whether the button is in the disabled state
    /// - Returns: A fully resolved style with all token names populated
    public static func resolve(
        style: DSIconButtonStyle,
        isDisabled: Bool
    ) -> Self {
        Self(
            backgroundTokenName: backgroundToken(style: style, isDisabled: isDisabled),
            foregroundTokenName: foregroundToken(style: style, isDisabled: isDisabled),
            borderTokenName: style == .outlined ? borderToken(isDisabled: isDisabled) : nil,
            pressedBackgroundTokenName: pressedBackgroundToken(style: style),
            style: style,
            isDisabled: isDisabled
        )
    }

    // MARK: - Private Token Name Resolvers

    private static func backgroundToken(style: DSIconButtonStyle, isDisabled: Bool) -> String {
        switch style {
        case .orangeFilled:
            isDisabled ? "buttonBackgroundBrandFilledInactive" : "buttonBackgroundBrandFilledDefault"
        case .whiteFilled:
            isDisabled ? "buttonBackgroundWhiteFilledInactive" : "buttonBackgroundWhiteFilledDefault"
        case .black5:
            isDisabled ? "buttonBackgroundTransparent05Inactive" : "buttonBackgroundTransparent05Default"
        case .black10:
            isDisabled ? "buttonBackgroundTransparent10Inactive" : "buttonBackgroundTransparent10Default"
        case .ghost:
            isDisabled ? "buttonBackgroundGhostFilledInactive" : "buttonBackgroundGhostFilledDefault"
        case .outlined:
            "clear"
        }
    }

    private static func foregroundToken(style: DSIconButtonStyle, isDisabled: Bool) -> String {
        switch style {
        case .orangeFilled:
            isDisabled ? "buttonTextOrangeFilledInactive" : "buttonTextOrangeFilledDefault"
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

    private static func borderToken(isDisabled: Bool) -> String {
        isDisabled ? "buttonBorderOrangeOutlineInactive" : "buttonBorderOrangeOutlineDefault"
    }

    private static func pressedBackgroundToken(style: DSIconButtonStyle) -> String? {
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
