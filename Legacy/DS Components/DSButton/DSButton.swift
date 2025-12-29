import SwiftUI

// MARK: - DSButton

/// A versatile button component with multiple styles and sizes.
///
/// DSButton supports 7 different styles (orangeFilled, gradientFilled, outlined,
/// whiteFilled, black5, black10, ghost), 3 sizes (small, medium, large), and
/// various states (default, pressed, loading, success, inactive).
///
/// Example usage:
/// ```swift
/// DSButton("Add to Cart", style: .orangeFilled, size: .medium) {
///     // Action
/// }
/// ```
public struct DSButton: View {
    // MARK: Lifecycle

    // MARK: - Initializers

    /// Creates a DSButton with the specified configuration.
    public init(
        _ label: String,
        style: Style = .orangeFilled,
        size: Size = .medium,
        leadingIcon: Image? = nil,
        trailingIcon: Image? = nil,
        isDisabled: Bool = false,
        isLoading: Bool = false,
        action: @escaping () -> Void
    ) {
        self.label = label
        self.style = style
        self.size = size
        self.leadingIcon = leadingIcon
        self.trailingIcon = trailingIcon
        self.isDisabled = isDisabled
        self.isLoading = isLoading
        self.action = action
    }

    // MARK: Public

    // MARK: - Types

    /// Button style variants
    public enum Style: CaseIterable {
        case orangeFilled
        case gradientFilled
        case outlined
        case whiteFilled
        case black5
        case black10
        case ghost
    }

    /// Button size variants matching Figma specs
    public enum Size: CaseIterable {
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
        var horizontalPadding: CGFloat {
            16 // Figma: spacing-4
        }

        /// Font size from Figma: Body Sm (14px) for all sizes
        var fontSize: CGFloat { TokensCoreLight.FontSizeBodySm }

        /// Icon size from Figma: 14px for Sm/Md, 12px for Lg
        var iconSize: CGFloat {
            switch self {
            case .small: 14
            case .medium: 14
            case .large: 12
            }
        }

        /// Spinner size matches icon size
        var spinnerSize: CGFloat {
            switch self {
            case .small: 16
            case .medium: 16
            case .large: 16
            }
        }

        /// Large buttons are full-width per Figma spec
        var isFullWidth: Bool {
            self == .large
        }
    }

    // MARK: - Body

    public var body: some View {
        Button(action: action) {
            buttonContent
        }
        .buttonStyle(DSButtonPressStyle(style: style, isDisabled: effectivelyDisabled))
        .disabled(effectivelyDisabled)
    }

    // MARK: Private

    @Environment(\.colorScheme)
    private var colorScheme

    private let label: String
    private let style: Style
    private let size: Size
    private let leadingIcon: Image?
    private let trailingIcon: Image?
    private let isDisabled: Bool
    private let isLoading: Bool
    private let action: () -> Void

    private var effectivelyDisabled: Bool { isDisabled || isLoading }
    private var isDark: Bool { colorScheme == .dark }

    private var backgroundColor: Color {
        DSButtonColorHelper.backgroundColor(style: style, isDisabled: effectivelyDisabled, isDark: isDark)
    }

    private var foregroundColor: Color {
        DSButtonColorHelper.foregroundColor(style: style, isDisabled: effectivelyDisabled, isDark: isDark)
    }

    private var borderColor: Color {
        DSButtonColorHelper.borderColor(isDisabled: effectivelyDisabled, isDark: isDark)
    }

    @ViewBuilder
    private var buttonContent: some View {
        ZStack {
            buttonBackground
            contentStack
        }
        .frame(height: size.height)
        .frame(maxWidth: size.isFullWidth ? .infinity : nil)
    }

    /// Content gap from Figma: spacing-2 (8px)
    @ViewBuilder
    private var contentStack: some View {
        HStack(spacing: 8) { // Figma: spacing-2
            if isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: foregroundColor))
                    .frame(width: size.spinnerSize, height: size.spinnerSize)
            } else {
                iconView(leadingIcon)
                labelView
                iconView(trailingIcon)
            }
        }
        .padding(.horizontal, size.horizontalPadding)
    }

    @ViewBuilder
    private var labelView: some View {
        Text(label)
            .font(.custom(TokensCoreLight.FontFamilyInformational, size: size.fontSize).weight(.bold))
            .foregroundColor(foregroundColor)
    }

    @ViewBuilder
    private var buttonBackground: some View {
        let cornerRadius = TokensSemanticLight.BorderRadiusFull
        switch style {
        case .gradientFilled:
            gradientBackground(cornerRadius: cornerRadius)
        case .outlined:
            outlinedBackground(cornerRadius: cornerRadius)
        default:
            RoundedRectangle(cornerRadius: cornerRadius).fill(backgroundColor)
        }
    }

    @ViewBuilder
    private func iconView(_ icon: Image?) -> some View {
        if let icon {
            icon.resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: size.iconSize, height: size.iconSize)
                .foregroundColor(foregroundColor)
        }
    }

    @ViewBuilder
    private func gradientBackground(cornerRadius: CGFloat) -> some View {
        let gradient = LinearGradient(
            colors: DSButtonColorHelper.gradientColors(isDark: isDark),
            startPoint: .leading,
            endPoint: .trailing
        )
        RoundedRectangle(cornerRadius: cornerRadius)
            .fill(effectivelyDisabled ? AnyShapeStyle(backgroundColor) : AnyShapeStyle(gradient))
    }

    @ViewBuilder
    private func outlinedBackground(cornerRadius: CGFloat) -> some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .stroke(borderColor, lineWidth: TokensSemanticLight.BorderWidthXs)
            .background(RoundedRectangle(cornerRadius: cornerRadius).fill(Color.clear))
    }
}

// MARK: - Factory Methods

extension DSButton {
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
}

// MARK: - DSButtonPressStyle

/// A custom button style that handles press states for DSButton.
private struct DSButtonPressStyle: ButtonStyle {
    // MARK: Internal

    let style: DSButton.Style
    let isDisabled: Bool

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed && !isDisabled ? 0.97 : 1.0)
            .opacity(configuration.isPressed && !isDisabled ? pressedOpacity : 1.0)
            .background(pressedBackground(isPressed: configuration.isPressed))
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }

    // MARK: Private

    @Environment(\.colorScheme)
    private var colorScheme

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

    private var needsPressedBackground: Bool {
        style == .ghost || style == .black5 || style == .black10
    }

    @ViewBuilder
    private func pressedBackground(isPressed: Bool) -> some View {
        if isPressed && !isDisabled && needsPressedBackground {
            RoundedRectangle(cornerRadius: TokensSemanticLight.BorderRadiusFull)
                .fill(DSButtonColorHelper.pressedBackgroundColor(
                    style: style, isDark: colorScheme == .dark
                ))
        }
    }
}
