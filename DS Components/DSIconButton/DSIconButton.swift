import SwiftUI

// MARK: - DSIconButtonStyle

/// Icon button style variants for DSIconButton
/// Matches the 6 styles from Figma spec (excludes gradientFilled which is not applicable for icon buttons)
public enum DSIconButtonStyle: CaseIterable, Sendable {
    case orangeFilled
    case outlined
    case whiteFilled
    case black5
    case black10
    case ghost
}

// MARK: - DSIconButtonSize

/// Icon button size variants matching Figma specs
public enum DSIconButtonSize: CaseIterable, Sendable {
    case small
    case medium
    case large

    // MARK: Internal

    /// Outer container size from Figma: All sizes have 44pt touch target
    var touchTargetSize: CGFloat { 44 }

    /// Inner button size from Figma: Sm=28, Md=36, Lg=44
    var buttonSize: CGFloat {
        switch self {
        case .small: 28
        case .medium: 36
        case .large: 44
        }
    }

    /// Icon size from Figma: 16px for all sizes
    var iconSize: CGFloat { 16 }

    /// Spinner size: 16px for all sizes
    var spinnerSize: CGFloat { 16 }
}

// MARK: - DSIconButton

/// An icon-only button component with multiple styles and sizes.
///
/// DSIconButton supports 6 different styles (orangeFilled, outlined,
/// whiteFilled, black5, black10, ghost), 3 sizes (small, medium, large), and
/// various states (default, pressed, loading, disabled).
///
/// Example usage:
/// ```swift
/// // System icon
/// DSIconButton(systemName: "heart") {
///     // Action
/// }
///
/// // Custom image
/// DSIconButton(icon: Image("custom-icon")) {
///     // Action
/// }
///
/// // With style and size
/// DSIconButton(systemName: "cart", style: .orangeFilled, size: .medium) {
///     // Action
/// }
/// ```
public struct DSIconButton: View {
    // MARK: - Properties

    private let icon: Image
    private let style: DSIconButtonStyle
    private let size: DSIconButtonSize
    private let accessibilityLabelText: String
    private let isDisabled: Bool
    private let isLoading: Bool
    private let action: () -> Void

    // MARK: - Initialization

    /// Creates a DSIconButton with a system image name.
    public init(
        systemName: String,
        style: DSIconButtonStyle = .orangeFilled,
        size: DSIconButtonSize = .medium,
        accessibilityLabel: String,
        isDisabled: Bool = false,
        isLoading: Bool = false,
        action: @escaping () -> Void
    ) {
        self.icon = Image(systemName: systemName)
        self.style = style
        self.size = size
        self.accessibilityLabelText = accessibilityLabel
        self.isDisabled = isDisabled
        self.isLoading = isLoading
        self.action = action
    }

    /// Creates a DSIconButton with a custom image.
    public init(
        icon: Image,
        style: DSIconButtonStyle = .orangeFilled,
        size: DSIconButtonSize = .medium,
        accessibilityLabel: String,
        isDisabled: Bool = false,
        isLoading: Bool = false,
        action: @escaping () -> Void
    ) {
        self.icon = icon
        self.style = style
        self.size = size
        self.accessibilityLabelText = accessibilityLabel
        self.isDisabled = isDisabled
        self.isLoading = isLoading
        self.action = action
    }

    /// Creates a DSIconButton with a DSIcon from the design system.
    public init(
        dsIcon: DSIcon,
        style: DSIconButtonStyle = .orangeFilled,
        size: DSIconButtonSize = .medium,
        accessibilityLabel: String? = nil,
        isDisabled: Bool = false,
        isLoading: Bool = false,
        action: @escaping () -> Void
    ) {
        self.icon = dsIcon.image
        self.style = style
        self.size = size
        self.accessibilityLabelText = accessibilityLabel ?? dsIcon.accessibilityLabel
        self.isDisabled = isDisabled
        self.isLoading = isLoading
        self.action = action
    }

    // MARK: - Body

    public var body: some View {
        Button(action: action) {
            // Empty label - ButtonStyle renders everything
            Color.clear
                .frame(width: size.buttonSize, height: size.buttonSize)
        }
        .buttonStyle(
            DSIconButtonInternalStyle(
                style: style,
                size: size,
                isDisabled: effectivelyDisabled,
                isLoading: isLoading,
                icon: icon
            )
        )
        .frame(width: size.touchTargetSize, height: size.touchTargetSize)
        .disabled(effectivelyDisabled)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(Text(accessibilityLabelText))
        .accessibilityAddTraits(.isButton)
        .accessibilityAddTraits(accessibilityTraits)
        .modifier(AccessibilityValueModifier(value: accessibilityValueText))
    }

    // MARK: - Private

    private var effectivelyDisabled: Bool { isDisabled || isLoading }

    // MARK: - Accessibility

    private var accessibilityTraits: AccessibilityTraits {
        isLoading ? .updatesFrequently : []
    }

    private var accessibilityValueText: String? {
        isLoading ? "Loading" : nil
    }
}

// MARK: - DSIconButtonInternalStyle

/// Internal ButtonStyle that handles all visual rendering for icon buttons.
private struct DSIconButtonInternalStyle: ButtonStyle {
    let style: DSIconButtonStyle
    let size: DSIconButtonSize
    let isDisabled: Bool
    let isLoading: Bool
    let icon: Image

    func makeBody(configuration: Configuration) -> some View {
        let isPressed = configuration.isPressed && !isDisabled

        ZStack {
            // Background
            buttonBackground(isPressed: isPressed)

            // Content: Icon or Spinner
            if isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: foregroundColor))
                    .frame(width: size.spinnerSize, height: size.spinnerSize)
            } else {
                icon
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: size.iconSize, height: size.iconSize)
                    .foregroundStyle(foregroundColor)
            }
        }
        .frame(width: size.buttonSize, height: size.buttonSize)
        .scaleEffect(isPressed ? 0.98 : 1.0)
        .animation(DSAnimation.press, value: isPressed)
    }

    private var cornerRadius: CGFloat {
        TokensSemanticLight.BorderRadiusFull
    }

    private var foregroundColor: Color {
        DSIconButtonColorHelper.foregroundColor(style: style, isDisabled: isDisabled)
    }

    @ViewBuilder
    private func buttonBackground(isPressed: Bool) -> some View {
        switch style {
        case .outlined:
            outlinedBackground()
        case .ghost,
             .black5,
             .black10:
            // These styles need pressed background overlay
            ZStack {
                Self.shape(cornerRadius: cornerRadius)
                    .dsBackgroundFill(DSIconButtonColorHelper.backgroundFill(style: style, isDisabled: isDisabled))
                if isPressed {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(DSIconButtonColorHelper.pressedBackgroundColor(style: style))
                }
            }
        default:
            // orangeFilled, whiteFilled use DSBackgroundFill for consistency
            Self.shape(cornerRadius: cornerRadius)
                .dsBackgroundFill(DSIconButtonColorHelper.backgroundFill(style: style, isDisabled: isDisabled))
        }
    }

    // MARK: - Static (Performance)

    private static func shape(cornerRadius: CGFloat) -> RoundedRectangle {
        RoundedRectangle(cornerRadius: cornerRadius)
    }

    @ViewBuilder
    private func outlinedBackground() -> some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .stroke(
                DSIconButtonColorHelper.borderColor(isDisabled: isDisabled),
                lineWidth: TokensSemanticLight.BorderWidthXs
            )
    }
}

// MARK: - DSIconButtonColorHelper

/// Helper for computing DSIconButton colors based on style and state.
/// Reuses existing button tokens from DSColor.
enum DSIconButtonColorHelper {
    // MARK: - Background Fill

    /// Returns the background fill for an icon button style and state.
    /// Uses DSBackgroundFill for unified color handling with automatic theme support.
    static func backgroundFill(style: DSIconButtonStyle, isDisabled: Bool) -> DSBackgroundFill {
        switch style {
        case .orangeFilled:
            let dsColor = isDisabled
                ? DSColor.buttonBackgroundBrandFilledInactive
                : DSColor.buttonBackgroundBrandFilledDefault
            return DSBackgroundFill(light: dsColor.lightColor, dark: dsColor.darkColor)
        case .whiteFilled:
            let dsColor = isDisabled
                ? DSColor.buttonBackgroundWhiteFilledInactive
                : DSColor.buttonBackgroundWhiteFilledDefault
            return DSBackgroundFill(light: dsColor.lightColor, dark: dsColor.darkColor)
        case .black5:
            let dsColor = isDisabled
                ? DSColor.buttonBackgroundTransparent05Inactive
                : DSColor.buttonBackgroundTransparent05Default
            return DSBackgroundFill(light: dsColor.lightColor, dark: dsColor.darkColor)
        case .black10:
            let dsColor = isDisabled
                ? DSColor.buttonBackgroundTransparent10Inactive
                : DSColor.buttonBackgroundTransparent10Default
            return DSBackgroundFill(light: dsColor.lightColor, dark: dsColor.darkColor)
        case .ghost:
            let dsColor = isDisabled
                ? DSColor.buttonBackgroundGhostFilledInactive
                : DSColor.buttonBackgroundGhostFilledDefault
            return DSBackgroundFill(light: dsColor.lightColor, dark: dsColor.darkColor)
        case .outlined:
            // Outlined uses transparent background
            return DSBackgroundFill(light: .clear, dark: .clear)
        }
    }

    // MARK: - Foreground Colors

    static func foregroundColor(style: DSIconButtonStyle, isDisabled: Bool) -> Color {
        switch style {
        case .orangeFilled:
            (isDisabled ? DSColor.buttonTextOrangeFilledInactive : DSColor.buttonTextOrangeFilledDefault).resolve
        case .outlined:
            (isDisabled ? DSColor.buttonTextOrangeOutlineInactive : DSColor.buttonTextOrangeOutlineDefault).resolve
        case .whiteFilled:
            (isDisabled ? DSColor.buttonTextWhiteFilledInactive : DSColor.buttonTextWhiteFilledDefault).resolve
        case .black5:
            (isDisabled ? DSColor.buttonTextTransparent05FilledInactive : DSColor.buttonTextTransparent05FilledDefault)
                .resolve
        case .black10:
            (isDisabled ? DSColor.buttonTextTransparent10FilledInactive : DSColor.buttonTextTransparent10FilledDefault)
                .resolve
        case .ghost:
            (isDisabled ? DSColor.buttonTextGhostFilledInactive : DSColor.buttonTextGhostFilledDefault).resolve
        }
    }

    // MARK: - Border Colors

    static func borderColor(isDisabled: Bool) -> Color {
        (isDisabled ? DSColor.buttonBorderOrangeOutlineInactive : DSColor.buttonBorderOrangeOutlineDefault).resolve
    }

    // MARK: - Pressed Background Colors

    static func pressedBackgroundColor(style: DSIconButtonStyle) -> Color {
        switch style {
        case .ghost:
            DSColor.buttonBackgroundGhostFilledPressed.resolve
        case .black5:
            DSColor.buttonBackgroundTransparent05Pressed.resolve
        case .black10:
            DSColor.buttonBackgroundTransparent10Pressed.resolve
        default:
            Color.clear
        }
    }
}

// MARK: - AccessibilityValueModifier

/// A modifier that conditionally applies an accessibility value.
private struct AccessibilityValueModifier: ViewModifier {
    let value: String?

    func body(content: Content) -> some View {
        if let value {
            content.accessibilityValue(Text(value))
        } else {
            content
        }
    }
}
