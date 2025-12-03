import SwiftUI

// MARK: - Button Component System
// THD App Design System - Button Components
//
// This file contains the THDButton and THDIconButton components that use
// DesignSystemGlobal tokens for consistent styling across the application.
//
// Components:
// - THDButton: Primary button with text and optional icons
// - THDIconButton: Icon-only button variant
//
// Design System Integration:
// - Colors: Uses BackgroundButtonColor*, TextButtonColor*, BorderButtonColor*, IconAction* tokens
// - Spacing: Uses Spacing* tokens for padding and gaps
// - Border: Uses BorderRadius*, BorderWidth* tokens
// - Typography: Uses Font* tokens via system fonts matching design specs

// MARK: - Button Style Variants
/// Button style variants matching the design system specifications.
///
/// Each variant has specific color tokens for background, text, border, and icons
/// defined in DesignSystemGlobal.
enum THDButtonStyle {
    /// Orange filled button - primary brand action
    /// Background: BackgroundButtonColorBrandFilledDefault
    /// Text: TextButtonColorOrangeFilledDefault
    case orangeFilled

    /// Gradient filled button - enhanced brand action
    /// Uses brand gradient overlay
    case gradientFilled

    /// Orange outlined button - secondary brand action
    /// Border: BorderButtonColorOrangeOutlineDefault
    /// Text: TextButtonColorOrangeOutlineDefault
    case outlined

    /// White filled button - for use on dark backgrounds
    /// Background: BackgroundButtonColorWhiteFilledDefault
    /// Text: TextButtonColorWhiteFilledDefault
    case whiteFilled

    /// Transparent 5% black background button
    /// Background: BackgroundButtonColorTransparent05Default
    case black5

    /// Transparent 10% black background button
    /// Background: BackgroundButtonColorTransparent10Default
    case black10

    /// Ghost button - no visible background until pressed
    /// Background: BackgroundButtonColorGhostFilledDefault (transparent)
    case ghost
}

// MARK: - Button States
/// Button interaction states affecting appearance and behavior.
enum THDButtonState {
    /// Default interactive state
    case `default`

    /// Pressed/active state (visual feedback)
    case pressed

    /// Loading state - shows spinner, disables interaction
    case loading

    /// Success state - shows checkmark
    case success

    /// Inactive/disabled state - reduced opacity, no interaction
    case inactive
}

// MARK: - Button Size Options
/// Button size options with corresponding height, padding, and typography.
///
/// Sizes use DesignSystemGlobal spacing tokens:
/// - Small: 32pt height (Spacing8)
/// - Medium: 40pt height (Spacing10)
/// - Large: 48pt height (Spacing12)
enum THDButtonSize {
    case small   // 32pt height
    case medium  // 40pt height
    case large   // 48pt height

    /// Button height using DesignSystemGlobal spacing tokens
    var height: CGFloat {
        switch self {
        case .small: return DesignSystemGlobal.Spacing8
        case .medium: return DesignSystemGlobal.Spacing10
        case .large: return DesignSystemGlobal.Spacing12
        }
    }

    /// Icon size for this button size
    var iconSize: CGFloat {
        14 // Consistent icon size across button sizes
    }

    /// Font for button text using design system typography
    var font: Font {
        .system(size: DesignSystemGlobal.FontFontSizeBodySm, weight: .bold)
    }
}

// MARK: - THDButton Component
/// Primary button component using DesignSystemGlobal tokens.
///
/// Supports 7 style variants: orangeFilled, gradientFilled, outlined,
/// whiteFilled, black5, black10, ghost
///
/// ## Usage Example:
/// ```swift
/// THDButton("Add to Cart", style: .orangeFilled, size: .medium) {
///     // Handle tap
/// }
///
/// THDButton("Continue", style: .outlined, leadingIcon: "arrow.right") {
///     // Handle tap
/// }
/// ```
///
/// ## Design System Tokens Used:
/// - Background: BackgroundButtonColorBrandFilledDefault, BackgroundButtonColorWhiteFilledDefault, etc.
/// - Text: TextButtonColorOrangeFilledDefault, TextButtonColorGhostFilledDefault, etc.
/// - Border: BorderButtonColorOrangeOutlineDefault, BorderRadiusFull
/// - Icons: IconActionColorOrangeFilledDefault, IconActionColorGhostFilledDefault, etc.
struct THDButton: View {
    let title: String
    let style: THDButtonStyle
    let size: THDButtonSize
    let state: THDButtonState
    let leadingIcon: String?
    let trailingIcon: String?
    let action: () -> Void

    init(
        _ title: String,
        style: THDButtonStyle = .orangeFilled,
        size: THDButtonSize = .small,
        state: THDButtonState = .default,
        leadingIcon: String? = nil,
        trailingIcon: String? = nil,
        action: @escaping () -> Void = {}
    ) {
        self.title = title
        self.style = style
        self.size = size
        self.state = state
        self.leadingIcon = leadingIcon
        self.trailingIcon = trailingIcon
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            HStack(spacing: DesignSystemGlobal.Spacing2) {
                // Leading icon - hidden during loading state
                if let iconName = leadingIcon, state != .loading {
                    Image(systemName: iconName)
                        .resizable()
                        .frame(width: size.iconSize, height: size.iconSize)
                        .foregroundColor(iconColor)
                }

                // Loading spinner or success checkmark
                if state == .loading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: iconColor))
                        .scaleEffect(0.8)
                } else if state == .success {
                    Image(systemName: "checkmark")
                        .resizable()
                        .frame(width: size.iconSize, height: size.iconSize)
                        .foregroundColor(iconColor)
                }

                // Button text - shown unless loading/success with no icons
                if !(state == .loading || state == .success) || leadingIcon != nil || trailingIcon != nil {
                    Text(title)
                        .font(textFont)
                        .foregroundColor(textColor)
                        .lineLimit(1)
                }

                // Trailing icon - hidden during loading state
                if let iconName = trailingIcon, state != .loading {
                    Image(systemName: iconName)
                        .resizable()
                        .frame(width: size.iconSize, height: size.iconSize)
                        .foregroundColor(iconColor)
                }
            }
            .padding(.horizontal, DesignSystemGlobal.Spacing4)
            .padding(.vertical, DesignSystemGlobal.Spacing2)
            .frame(height: size.height)
            .background(backgroundColor)
            .overlay(
                RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusFull)
                    .stroke(borderColor, lineWidth: borderWidth)
            )
            .cornerRadius(DesignSystemGlobal.BorderRadiusFull)
        }
        .disabled(state == .inactive || state == .loading)
    }

    // MARK: - Typography

    /// Returns the appropriate font based on button style
    /// Ghost buttons use semibold weight, others use bold
    private var textFont: Font {
        if style == .ghost {
            return .system(size: DesignSystemGlobal.FontFontSizeBodySm, weight: .semibold)
        }
        return size.font
    }

    // MARK: - Color Logic

    /// Text color based on style and state
    /// Uses DesignSystemGlobal TextButtonColor* tokens
    private var textColor: Color {
        switch style {
        case .orangeFilled:
            return state == .inactive
                ? DesignSystemGlobal.TextButtonColorOrangeFilledInactive
                : DesignSystemGlobal.TextButtonColorOrangeFilledDefault

        case .gradientFilled:
            return state == .inactive
                ? DesignSystemGlobal.TextButtonColorGradientFilledInactive
                : DesignSystemGlobal.TextButtonColorGradientFilledDefault

        case .outlined:
            return state == .inactive
                ? DesignSystemGlobal.TextButtonColorOrangeOutlineInactive
                : DesignSystemGlobal.TextButtonColorOrangeOutlineDefault

        case .whiteFilled:
            return state == .inactive
                ? DesignSystemGlobal.TextButtonColorWhiteFilledInactive
                : DesignSystemGlobal.TextButtonColorWhiteFilledDefault

        case .black5:
            return DesignSystemGlobal.TextButtonColorTransparent05FilledDefault

        case .black10:
            return state == .inactive
                ? DesignSystemGlobal.TextButtonColorTransparent10FilledInactive
                : DesignSystemGlobal.TextButtonColorTransparent10FilledDefault

        case .ghost:
            return state == .inactive
                ? DesignSystemGlobal.TextButtonColorGhostFilledInactive
                : DesignSystemGlobal.TextButtonColorGhostFilledDefault
        }
    }

    /// Icon color based on style and state
    /// Uses DesignSystemGlobal IconAction* tokens
    private var iconColor: Color {
        switch style {
        case .orangeFilled:
            return DesignSystemGlobal.IconActionColorOrangeFilledDefault

        case .gradientFilled:
            return DesignSystemGlobal.IconActionColorGradientFilledDefault

        case .outlined:
            return state == .inactive
                ? DesignSystemGlobal.IconActionColorOrangeOutlineInactive
                : DesignSystemGlobal.IconActionColorOrangeOutlineDefault

        case .whiteFilled:
            return DesignSystemGlobal.IconActionColorWhiteFilledDefault

        case .black5:
            return state == .inactive
                ? DesignSystemGlobal.IconActionColorTransparent05FilledInactive
                : DesignSystemGlobal.IconActionColorTransparent05FilledDefault

        case .black10:
            return state == .inactive
                ? DesignSystemGlobal.IconActionColorTransparent10FilledInactive
                : DesignSystemGlobal.IconActionColorTransparent10FilledDefault

        case .ghost:
            return state == .inactive
                ? DesignSystemGlobal.IconActionColorGhostFilledInactive
                : DesignSystemGlobal.IconActionColorGhostFilledDefault
        }
    }

    /// Background color based on style and state
    /// Uses DesignSystemGlobal BackgroundButtonColor* tokens
    private var backgroundColor: Color {
        switch style {
        case .orangeFilled:
            return state == .inactive
                ? DesignSystemGlobal.BackgroundButtonColorBrandFilledInactive
                : DesignSystemGlobal.BackgroundButtonColorBrandFilledDefault

        case .gradientFilled:
            // Gradient variant - using brand color as base
            return state == .inactive
                ? DesignSystemGlobal.BackgroundButtonColorBrandFilledInactive
                : DesignSystemGlobal.BackgroundButtonColorBrandFilledDefault

        case .outlined:
            return .clear

        case .whiteFilled:
            return state == .inactive
                ? DesignSystemGlobal.BackgroundButtonColorWhiteFilledInactive
                : DesignSystemGlobal.BackgroundButtonColorWhiteFilledDefault

        case .black5:
            return DesignSystemGlobal.BackgroundButtonColorTransparent05Default

        case .black10:
            return DesignSystemGlobal.BackgroundButtonColorTransparent10Default

        case .ghost:
            if state == .pressed {
                return DesignSystemGlobal.BackgroundButtonColorGhostFilledPressed
            }
            return DesignSystemGlobal.BackgroundButtonColorGhostFilledDefault
        }
    }

    /// Border color for outlined style
    /// Uses DesignSystemGlobal BorderButtonColor* tokens
    private var borderColor: Color {
        if style == .outlined {
            return state == .inactive
                ? DesignSystemGlobal.BorderButtonColorOrangeOutlineInactive
                : DesignSystemGlobal.BorderButtonColorOrangeOutlineDefault
        }
        return .clear
    }

    /// Border width - only outlined buttons have visible borders
    private var borderWidth: CGFloat {
        style == .outlined ? DesignSystemGlobal.BorderWidthSm : 0
    }
}

// MARK: - THDIconButton Component
/// Icon-only button component using DesignSystemGlobal tokens.
///
/// A circular button containing only an icon, using the same styling
/// system as THDButton but optimized for icon-only use cases.
///
/// ## Usage Example:
/// ```swift
/// THDIconButton(icon: "plus", style: .orangeFilled, size: .medium) {
///     // Handle tap
/// }
/// ```
struct THDIconButton: View {
    let icon: String
    let style: THDButtonStyle
    let size: THDButtonSize
    let state: THDButtonState
    let action: () -> Void

    init(
        icon: String,
        style: THDButtonStyle = .orangeFilled,
        size: THDButtonSize = .small,
        state: THDButtonState = .default,
        action: @escaping () -> Void = {}
    ) {
        self.icon = icon
        self.style = style
        self.size = size
        self.state = state
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            Group {
                if state == .loading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: iconColor))
                        .scaleEffect(0.8)
                } else {
                    Image(systemName: icon)
                        .resizable()
                        .frame(width: size.iconSize, height: size.iconSize)
                        .foregroundColor(iconColor)
                }
            }
            .frame(width: size.height, height: size.height)
            .background(backgroundColor)
            .overlay(
                RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusFull)
                    .stroke(borderColor, lineWidth: borderWidth)
            )
            .cornerRadius(DesignSystemGlobal.BorderRadiusFull)
        }
        .disabled(state == .inactive || state == .loading)
    }

    // MARK: - Color Logic (mirrors THDButton)

    /// Icon color based on style and state
    private var iconColor: Color {
        switch style {
        case .orangeFilled:
            return DesignSystemGlobal.IconActionColorOrangeFilledDefault

        case .gradientFilled:
            return DesignSystemGlobal.IconActionColorGradientFilledDefault

        case .outlined:
            return state == .inactive
                ? DesignSystemGlobal.IconActionColorOrangeOutlineInactive
                : DesignSystemGlobal.IconActionColorOrangeOutlineDefault

        case .whiteFilled:
            return DesignSystemGlobal.IconActionColorWhiteFilledDefault

        case .black5:
            return state == .inactive
                ? DesignSystemGlobal.IconActionColorTransparent05FilledInactive
                : DesignSystemGlobal.IconActionColorTransparent05FilledDefault

        case .black10:
            return state == .inactive
                ? DesignSystemGlobal.IconActionColorTransparent10FilledInactive
                : DesignSystemGlobal.IconActionColorTransparent10FilledDefault

        case .ghost:
            return state == .inactive
                ? DesignSystemGlobal.IconActionColorGhostFilledInactive
                : DesignSystemGlobal.IconActionColorGhostFilledDefault
        }
    }

    /// Background color based on style and state
    private var backgroundColor: Color {
        switch style {
        case .orangeFilled:
            return state == .inactive
                ? DesignSystemGlobal.BackgroundButtonColorBrandFilledInactive
                : DesignSystemGlobal.BackgroundButtonColorBrandFilledDefault

        case .gradientFilled:
            return state == .inactive
                ? DesignSystemGlobal.BackgroundButtonColorBrandFilledInactive
                : DesignSystemGlobal.BackgroundButtonColorBrandFilledDefault

        case .outlined:
            return .clear

        case .whiteFilled:
            return state == .inactive
                ? DesignSystemGlobal.BackgroundButtonColorWhiteFilledInactive
                : DesignSystemGlobal.BackgroundButtonColorWhiteFilledDefault

        case .black5:
            return DesignSystemGlobal.BackgroundButtonColorTransparent05Default

        case .black10:
            return DesignSystemGlobal.BackgroundButtonColorTransparent10Default

        case .ghost:
            return state == .pressed
                ? DesignSystemGlobal.BackgroundButtonColorGhostFilledPressed
                : DesignSystemGlobal.BackgroundButtonColorGhostFilledDefault
        }
    }

    /// Border color for outlined style
    private var borderColor: Color {
        if style == .outlined {
            return state == .inactive
                ? DesignSystemGlobal.BorderButtonColorOrangeOutlineInactive
                : DesignSystemGlobal.BorderButtonColorOrangeOutlineDefault
        }
        return .clear
    }

    /// Border width - only outlined buttons have visible borders
    private var borderWidth: CGFloat {
        style == .outlined ? DesignSystemGlobal.BorderWidthSm : 0
    }
}

// MARK: - Previews
#Preview("Button Variants") {
    ScrollView {
        VStack(alignment: .leading, spacing: 24) {
            // Title
            Text("Button")
                .font(.system(size: 48, weight: .medium))
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)
                .padding(.bottom, 20)

            // Orange Filled Buttons
            VStack(alignment: .leading, spacing: 12) {
                Text("Orange Filled")
                    .font(.headline)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

                VStack(alignment: .leading, spacing: 8) {
                    THDButton("Button Text", style: .orangeFilled, size: .small, leadingIcon: "plus", trailingIcon: "plus")
                    THDButton("Button Text", style: .orangeFilled, size: .medium, leadingIcon: "plus", trailingIcon: "plus")
                    THDButton("Button Text", style: .orangeFilled, size: .large, leadingIcon: "plus", trailingIcon: "plus")
                }

                HStack(spacing: 8) {
                    THDButton("Default", style: .orangeFilled, size: .small)
                    THDButton("Pressed", style: .orangeFilled, size: .small, state: .pressed)
                    THDButton("Loading", style: .orangeFilled, size: .small, state: .loading)
                    THDButton("Success", style: .orangeFilled, size: .small, state: .success)
                    THDButton("Inactive", style: .orangeFilled, size: .small, state: .inactive)
                }
            }

            // Gradient Filled Buttons
            VStack(alignment: .leading, spacing: 12) {
                Text("Gradient Filled")
                    .font(.headline)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

                HStack(spacing: 8) {
                    THDButton("Button Text", style: .gradientFilled, size: .small, leadingIcon: "plus", trailingIcon: "plus")
                    THDButton("Button Text", style: .gradientFilled, size: .medium, leadingIcon: "plus", trailingIcon: "plus")
                    THDButton("Button Text", style: .gradientFilled, size: .large, leadingIcon: "plus", trailingIcon: "plus")
                }
            }

            // Outlined Buttons
            VStack(alignment: .leading, spacing: 12) {
                Text("Outlined")
                    .font(.headline)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

                HStack(spacing: 8) {
                    THDButton("Button Text", style: .outlined, size: .small, leadingIcon: "plus", trailingIcon: "plus")
                    THDButton("Button Text", style: .outlined, size: .medium, leadingIcon: "plus", trailingIcon: "plus")
                    THDButton("Button Text", style: .outlined, size: .large, leadingIcon: "plus", trailingIcon: "plus")
                }

                HStack(spacing: 8) {
                    THDButton("Default", style: .outlined, size: .small)
                    THDButton("Inactive", style: .outlined, size: .small, state: .inactive)
                }
            }

            // White Filled Buttons
            VStack(alignment: .leading, spacing: 12) {
                Text("White Filled")
                    .font(.headline)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

                HStack(spacing: 8) {
                    THDButton("Button Text", style: .whiteFilled, size: .small, leadingIcon: "plus", trailingIcon: "plus")
                    THDButton("Button Text", style: .whiteFilled, size: .medium, leadingIcon: "plus", trailingIcon: "plus")
                    THDButton("Button Text", style: .whiteFilled, size: .large, leadingIcon: "plus", trailingIcon: "plus")
                }
            }

            // Black 5% Buttons
            VStack(alignment: .leading, spacing: 12) {
                Text("Black 5%")
                    .font(.headline)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

                HStack(spacing: 8) {
                    THDButton("Button Text", style: .black5, size: .small, leadingIcon: "plus", trailingIcon: "plus")
                    THDButton("Button Text", style: .black5, size: .medium, leadingIcon: "plus", trailingIcon: "plus")
                }
            }

            // Black 10% Buttons
            VStack(alignment: .leading, spacing: 12) {
                Text("Black 10%")
                    .font(.headline)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

                HStack(spacing: 8) {
                    THDButton("Button Text", style: .black10, size: .small, leadingIcon: "plus", trailingIcon: "plus")
                    THDButton("Button Text", style: .black10, size: .medium, leadingIcon: "plus", trailingIcon: "plus")
                }
            }

            // Ghost Buttons
            VStack(alignment: .leading, spacing: 12) {
                Text("Ghost")
                    .font(.headline)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

                HStack(spacing: 8) {
                    THDButton("Button Text", style: .ghost, size: .small, leadingIcon: "plus", trailingIcon: "plus")
                    THDButton("Button Text", style: .ghost, size: .medium, leadingIcon: "plus", trailingIcon: "plus")
                    THDButton("Button Text", style: .ghost, size: .large, leadingIcon: "plus", trailingIcon: "plus")
                }
            }

            Divider().padding(.vertical)

            // Icon Buttons
            VStack(alignment: .leading, spacing: 12) {
                Text("Icon Buttons")
                    .font(.headline)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

                VStack(alignment: .leading, spacing: 8) {
                    HStack(spacing: 8) {
                        THDIconButton(icon: "plus", style: .orangeFilled, size: .small)
                        THDIconButton(icon: "plus", style: .orangeFilled, size: .medium)
                        THDIconButton(icon: "plus", style: .orangeFilled, size: .large)
                    }

                    HStack(spacing: 8) {
                        THDIconButton(icon: "plus", style: .outlined, size: .small)
                        THDIconButton(icon: "plus", style: .outlined, size: .medium)
                        THDIconButton(icon: "plus", style: .outlined, size: .large)
                    }

                    HStack(spacing: 8) {
                        THDIconButton(icon: "plus", style: .whiteFilled, size: .small)
                        THDIconButton(icon: "plus", style: .black5, size: .medium)
                        THDIconButton(icon: "plus", style: .ghost, size: .large)
                    }

                    HStack(spacing: 8) {
                        THDIconButton(icon: "plus", style: .orangeFilled, size: .small, state: .loading)
                        THDIconButton(icon: "plus", style: .outlined, size: .medium, state: .inactive)
                    }
                }
            }
        }
        .padding()
    }
    .background(DesignSystemGlobal.BackgroundContainerColorWhite)
}
