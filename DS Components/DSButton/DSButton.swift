import SwiftUI

// MARK: - DSButtonStyle

/// Button style variants for DSButton
public enum DSButtonStyle: CaseIterable, Sendable {
    case orangeFilled
    case gradientFilled
    case outlined
    case whiteFilled
    case black5
    case black10
    case ghost
}

// MARK: - DSButtonSize

/// Button size variants matching Figma specs
public enum DSButtonSize: CaseIterable, Sendable {
    case small
    case medium
    case large

    // MARK: Internal

    /// Button height from Figma: Sm=28, Md=36, Lg=44
    var height: CGFloat {
        switch self {
        case .small: 28
        case .medium: 36
        case .large: 44
        }
    }

    /// Horizontal padding from Figma: 16px (spacing-4) for all sizes
    var horizontalPadding: CGFloat { 16 }

    /// Icon size from Figma: 14px for Sm/Md, 15px for Lg
    var iconSize: CGFloat {
        switch self {
        case .small,
             .medium: 14
        case .large: 15
        }
    }

    /// Spinner size: 16px for all sizes
    var spinnerSize: CGFloat { 16 }

    /// Large buttons are full-width per Figma spec
    var isFullWidth: Bool { self == .large }
}

// MARK: - DSButton

/// A versatile button component with multiple styles and sizes.
///
/// DSButton supports 7 different styles (orangeFilled, gradientFilled, outlined,
/// whiteFilled, black5, black10, ghost), 3 sizes (small, medium, large), and
/// various states (default, pressed, loading, success, inactive).
///
/// Example usage:
/// ```swift
/// // Simple string label
/// DSButton("Add to Cart", style: .orangeFilled, size: .medium) {
///     // Action
/// }
///
/// // LocalizedStringKey for localization
/// DSButton("add_to_cart_key", style: .orangeFilled) {
///     // Action
/// }
///
/// // Custom label content
/// DSButton(style: .orangeFilled) {
///     // Action
/// } label: {
///     Label("Add to Cart", systemImage: "cart")
/// }
/// ```
public struct DSButton<Label: View>: View {
    // MARK: - Initializers

    /// Creates a DSButton with a custom label view.
    ///
    /// - Important: When using a custom label that doesn't contain text,
    ///   provide an explicit `accessibilityLabel` for VoiceOver users.
    public init(
        style: DSButtonStyle = .orangeFilled,
        size: DSButtonSize = .medium,
        role: ButtonRole? = nil,
        isDisabled: Bool = false,
        isLoading: Bool = false,
        accessibilityLabel: String? = nil,
        action: @escaping () -> Void,
        @ViewBuilder label: () -> Label
    ) {
        self.style = style
        self.size = size
        self.role = role
        self.isDisabled = isDisabled
        self.isLoading = isLoading
        self.action = action
        self.labelContent = label()
        self.accessibilityLabelOverride = accessibilityLabel
    }

    // MARK: Public

    // MARK: - Body

    public var body: some View {
        Button(role: role, action: action) {
            // Empty label - ButtonStyle renders everything
            Color.clear
                .frame(height: size.height)
                .frame(maxWidth: size.isFullWidth ? .infinity : nil)
        }
        .buttonStyle(
            DSButtonInternalStyle(
                style: style,
                size: size,
                isDisabled: effectivelyDisabled,
                isLoading: isLoading,
                foregroundColor: foregroundColor,
                labelContent: AnyView(labelContent)
            )
        )
        .disabled(effectivelyDisabled)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(accessibilityLabelOverride.map { Text($0) } ?? Text("Button"))
        .accessibilityAddTraits(.isButton)
        .accessibilityAddTraits(accessibilityTraits)
        .modifier(AccessibilityValueModifier(value: accessibilityValueText))
    }

    // MARK: - Accessibility

    private var accessibilityValueText: String? {
        isLoading ? "Loading" : nil
    }

    private var accessibilityTraits: AccessibilityTraits {
        isLoading ? .updatesFrequently : []
    }

    // MARK: Private

    private let style: DSButtonStyle
    private let size: DSButtonSize
    private let role: ButtonRole?
    private let isDisabled: Bool
    private let isLoading: Bool
    private let action: () -> Void
    private let labelContent: Label
    private let accessibilityLabelOverride: String?

    private var effectivelyDisabled: Bool { isDisabled || isLoading }

    private var foregroundColor: Color {
        DSButtonColorHelper.foregroundColor(style: style, isDisabled: effectivelyDisabled)
    }
}

// MARK: - String Label Convenience Initializers

extension DSButton where Label == DSButtonLabel {
    /// Creates a DSButton with a string label.
    public init(
        _ label: String,
        style: DSButtonStyle = .orangeFilled,
        size: DSButtonSize = .medium,
        leadingIcon: Image? = nil,
        trailingIcon: Image? = nil,
        role: ButtonRole? = nil,
        isDisabled: Bool = false,
        isLoading: Bool = false,
        action: @escaping () -> Void
    ) {
        self.style = style
        self.size = size
        self.role = role
        self.isDisabled = isDisabled
        self.isLoading = isLoading
        self.action = action
        self.accessibilityLabelOverride = label
        self.labelContent = DSButtonLabel(
            text: label,
            size: size,
            leadingIcon: leadingIcon,
            trailingIcon: trailingIcon,
            isLoading: isLoading,
            foregroundColor: DSButtonColorHelper.foregroundColor(style: style, isDisabled: isDisabled || isLoading)
        )
    }

    /// Creates a DSButton with a localized string key.
    public init(
        _ titleKey: LocalizedStringKey,
        style: DSButtonStyle = .orangeFilled,
        size: DSButtonSize = .medium,
        leadingIcon: Image? = nil,
        trailingIcon: Image? = nil,
        role: ButtonRole? = nil,
        isDisabled: Bool = false,
        isLoading: Bool = false,
        action: @escaping () -> Void
    ) {
        // For now, convert to string - in production would use proper localization
        self.init(
            String(describing: titleKey),
            style: style,
            size: size,
            leadingIcon: leadingIcon,
            trailingIcon: trailingIcon,
            role: role,
            isDisabled: isDisabled,
            isLoading: isLoading,
            action: action
        )
    }
}

// MARK: - DSButtonLabel

/// The default label view for DSButton with text and optional icons.
public struct DSButtonLabel: View {
    let text: String
    let size: DSButtonSize
    let leadingIcon: Image?
    let trailingIcon: Image?
    let isLoading: Bool
    let foregroundColor: Color

    public var body: some View {
        HStack(spacing: 8) {
            if isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: foregroundColor))
                    .frame(width: size.spinnerSize, height: size.spinnerSize)
            } else {
                if let leadingIcon {
                    leadingIcon.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: size.iconSize, height: size.iconSize)
                }
                Text(text)
                    .font(DSTypography.buttonLabel)
                if let trailingIcon {
                    trailingIcon.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: size.iconSize, height: size.iconSize)
                }
            }
        }
        .foregroundStyle(foregroundColor)
    }
}

// MARK: - Factory Methods

extension DSButton where Label == DSButtonLabel {
    /// Creates a primary (orange filled) button.
    public static func primary(_ label: String, action: @escaping () -> Void) -> DSButton {
        DSButton(label, style: .orangeFilled, action: action)
    }

    /// Creates a secondary (outlined) button.
    public static func secondary(_ label: String, action: @escaping () -> Void) -> DSButton {
        DSButton(label, style: .outlined, action: action)
    }

    /// Creates a tertiary (ghost) button.
    public static func tertiary(_ label: String, action: @escaping () -> Void) -> DSButton {
        DSButton(label, style: .ghost, action: action)
    }

    /// Creates a destructive button with the appropriate role.
    public static func destructive(_ label: String, action: @escaping () -> Void) -> DSButton {
        DSButton(label, style: .orangeFilled, role: .destructive, action: action)
    }
}

// MARK: - DSButtonInternalStyle

/// Internal ButtonStyle that handles all visual rendering including backgrounds and pressed states.
/// This avoids the double-background issue by keeping all visuals in one place.
private struct DSButtonInternalStyle: ButtonStyle {
    let style: DSButtonStyle
    let size: DSButtonSize
    let isDisabled: Bool
    let isLoading: Bool
    let foregroundColor: Color
    let labelContent: AnyView

    func makeBody(configuration: Configuration) -> some View {
        let isPressed = configuration.isPressed && !isDisabled

        ZStack {
            // Background - all background rendering happens here, not in label
            buttonBackground(isPressed: isPressed)

            // Content
            labelContent
                .padding(.horizontal, size.horizontalPadding)
        }
        .frame(height: size.height)
        .frame(maxWidth: size.isFullWidth ? .infinity : nil)
        .scaleEffect(isPressed ? 0.97 : 1.0)
        .opacity(isPressed ? pressedOpacity : 1.0)
        .animation(DSAnimation.press, value: isPressed)
    }

    private var cornerRadius: CGFloat {
        TokensSemanticLight.BorderRadiusFull
    }

    private var pressedOpacity: Double {
        switch style {
        case .orangeFilled,
             .gradientFilled,
             .whiteFilled: 0.9
        case .outlined,
             .black5,
             .black10,
             .ghost: 1.0
        }
    }

    private var backgroundFill: DSBackgroundFill {
        DSButtonColorHelper.backgroundFill(style: style, isDisabled: isDisabled)
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
                    .dsBackgroundFill(backgroundFill)
                if isPressed {
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(DSButtonColorHelper.pressedBackgroundColor(style: style))
                }
            }
        default:
            // orangeFilled, gradientFilled, whiteFilled all use DSBackgroundFill
            Self.shape(cornerRadius: cornerRadius)
                .dsBackgroundFill(backgroundFill)
        }
    }

    // MARK: - Static (Performance)

    private static func shape(cornerRadius: CGFloat) -> RoundedRectangle {
        RoundedRectangle(cornerRadius: cornerRadius)
    }

    @ViewBuilder
    private func outlinedBackground() -> some View {
        // Just the stroke - no redundant clear background
        RoundedRectangle(cornerRadius: cornerRadius)
            .stroke(
                DSButtonColorHelper.borderColor(isDisabled: isDisabled),
                lineWidth: TokensSemanticLight.BorderWidthXs
            )
    }
}

// MARK: - AccessibilityValueModifier

/// A modifier that conditionally applies an accessibility value.
/// Only sets the value when it's non-nil, avoiding empty string announcements.
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
