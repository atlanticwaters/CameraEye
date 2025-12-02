import SwiftUI

// MARK: - Button Component System
// THD App Design System - Button Components

// MARK: - Design Tokens (Extended from Badge/Pill)

/// Typography tokens from Figma design system
struct TypographyTokens {
    static let bodyXsBold = Font.system(size: 12, weight: .bold) // Body Xs/Bold/None
    static let bodySmBold = Font.system(size: 14, weight: .bold) // Body Sm/Bold/None
    static let bodySmSemibold = Font.system(size: 14, weight: .semibold) // Body Sm/Semibold/None
    static let bodySmRegular = Font.system(size: 14, weight: .regular) // Body Sm/Regular/None
    static let bodyXsBoldBase = Font.system(size: 18, weight: .heavy) // Body Xs/Bold/Base (800)
    static let bodyXsSemiboldBase = Font.system(size: 18, weight: .semibold) // Body Xs/Semibold/Base (600)
}

/// Spacing tokens from Figma
struct SpacingTokens {
    static let spacing0: CGFloat = 0
    static let spacing1: CGFloat = 4
    static let spacing2: CGFloat = 8
    static let spacing3: CGFloat = 12
    static let spacing4: CGFloat = 16
    static let spacing6px: CGFloat = 6
    static let spacing7: CGFloat = 28
    static let spacing9: CGFloat = 36
    static let spacing11: CGFloat = 44
    static let spacing30: CGFloat = 120
}

/// Border tokens from Figma
struct BorderTokens {
    static let border1: CGFloat = 1
    static let border2: CGFloat = 2
    static let widthSm: CGFloat = 2
    static let radiusLG: CGFloat = 6
    static let radiusXL: CGFloat = 8
    static let radiusFull: CGFloat = 9999
    static let radius0: CGFloat = 0
    static let radius5: CGFloat = 6
    static let radius999: CGFloat = 9999
}

/// Button-specific color tokens from Figma
struct ButtonColorTokens {
    // Orange Filled
    static let textButtonOrangeFilledDefault = Color(hex: "#ffffff")
    static let textButtonOrangeFilledInactive = Color(hex: "#979492")
    static let iconActionOrangeFilledDefault = Color(hex: "#ffffff")
    static let backgroundButtonBrandFilledDefault = Color(hex: "#f96302")
    static let backgroundButtonBrandFilledInactive = Color(hex: "#e5e1de")
    static let backgroundActionPrimary = Color(hex: "#f96302")
    
    // Orange Outlined
    static let textButtonOrangeOutlineDefault = Color(hex: "#e95c02")
    static let textButtonOrangeOutlineInactive = Color(hex: "#979492")
    static let borderButtonOrangeOutlineDefault = Color(hex: "#f96302")
    static let borderButtonOrangeOutlineInactive = Color(hex: "#979492")
    static let iconActionOrangeOutlineDefault = Color(hex: "#f96302")
    static let iconActionOrangeOutlineInactive = Color(hex: "#979492")
    
    // Gradient Filled
    static let iconActionGradientFilledDefault = Color(hex: "#ffffff")
    
    // White Filled
    static let textButtonWhiteFilledDefault = Color(hex: "#252524")
    static let textButtonWhiteFilledInactive = Color(hex: "#979492")
    static let backgroundButtonWhiteFilledDefault = Color(hex: "#ffffff")
    static let backgroundButtonWhiteFilledInactive = Color(hex: "#e5e1de")
    static let iconActionWhiteFilledDefault = Color(hex: "#252524")
    
    // Transparent 5%
    static let textButtonTransparent05FilledDefault = Color(hex: "#252524")
    static let backgroundButtonTransparent05Default = Color(hex: "#0000000d")
    static let iconActionTransparent05FilledDefault = Color(hex: "#252524")
    static let iconActionTransparent05FilledInactive = Color(hex: "#979492")
    
    // Transparent 10%
    static let textButtonTransparent10FilledDefault = Color(hex: "#252524")
    static let textButtonTransparent10FilledInactive = Color(hex: "#979492")
    static let backgroundButtonTransparent10Default = Color(hex: "#0000001a")
    static let iconActionTransparent10FilledDefault = Color(hex: "#252524")
    static let iconActionTransparent10FilledInactive = Color(hex: "#979492")
    
    // Ghost
    static let textButtonGhostFilledDefault = Color(hex: "#252524")
    static let textButtonGhostFilledInactive = Color(hex: "#979492")
    static let backgroundButtonGhostFilledDefault = Color(hex: "#00000000")
    static let backgroundButtonGhostFilledPressed = Color(hex: "#0000001a")
    static let iconActionGhostFilledDefault = Color(hex: "#252524")
    static let iconActionGhostFilledInactive = Color(hex: "#979492")
    
    // Common
    static let iconOnContainerInverse = Color(hex: "#ffffff")
    static let iconOnSurfacePrimary = Color(hex: "#252524")
    
    // Transparent blacks
    static let transparentBlack050 = Color(hex: "#0000000d")
    static let transparentBlack075 = Color(hex: "#00000012")
    static let transparentBlack100 = Color(hex: "#0000001a")
    static let transparentBlack200 = Color(hex: "#00000026")
    static let transparentBlack300 = Color(hex: "#00000033")
    static let transparentBlack600 = Color(hex: "#00000080")
    static let transparentBlack900 = Color(hex: "#000000e0")
    
    // Brand colors
    static let brand100 = Color(hex: "#fedac3")
    static let brand200 = Color(hex: "#fba268")
    static let brand400 = Color(hex: "#e95c02")
    
    // Greige colors
    static let greige050 = Color(hex: "#f8f5f2")
    static let greige100 = Color(hex: "#e5e1de")
    static let greige200 = Color(hex: "#bab7b4")
    static let greige300 = Color(hex: "#979492")
    static let greige900 = Color(hex: "#252524")
    
    // Neutrals
    static let neutralsWhite = Color(hex: "#ffffff")
    static let neutralsBlack = Color(hex: "#000000")
}

/// Button style variants
enum ButtonStyle {
    case orangeFilled
    case gradientFilled
    case outlined
    case whiteFilled
    case black5
    case black10
    case ghost
}

/// Button states
enum ButtonState {
    case `default`
    case pressed
    case loading
    case success
    case inactive
}

/// Button size options
enum ButtonSize {
    case small   // 28pt height
    case medium  // 36pt height
    case large   // 44pt height
    
    var height: CGFloat {
        switch self {
        case .small: return SpacingTokens.spacing7
        case .medium: return SpacingTokens.spacing9
        case .large: return SpacingTokens.spacing11
        }
    }
    
    var iconSize: CGFloat {
        14 // Icon size is 14pt for small
    }
    
    var font: Font {
        TypographyTokens.bodySmBold
    }
}

/// Primary Button component
struct THDButton: View {
    let title: String
    let style: ButtonStyle
    let size: ButtonSize
    let state: ButtonState
    let leadingIcon: String?
    let trailingIcon: String?
    let action: () -> Void
    
    init(
        _ title: String,
        style: ButtonStyle = .orangeFilled,
        size: ButtonSize = .small,
        state: ButtonState = .default,
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
            HStack(spacing: SpacingTokens.spacing2) {
                // Leading icon
                if let iconName = leadingIcon, state != .loading {
                    Image(systemName: iconName)
                        .resizable()
                        .frame(width: size.iconSize, height: size.iconSize)
                        .foregroundColor(iconColor)
                }
                
                // Loading or success state
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
                
                // Button text (hidden during loading/success for icon-only states)
                if !(state == .loading || state == .success) || leadingIcon != nil || trailingIcon != nil {
                    Text(title)
                        .font(textFont)
                        .foregroundColor(textColor)
                        .lineLimit(1)
                }
                
                // Trailing icon
                if let iconName = trailingIcon, state != .loading {
                    Image(systemName: iconName)
                        .resizable()
                        .frame(width: size.iconSize, height: size.iconSize)
                        .foregroundColor(iconColor)
                }
            }
            .padding(.horizontal, SpacingTokens.spacing4)
            .padding(.vertical, SpacingTokens.spacing2)
            .frame(height: size.height)
            .background(backgroundColor)
            .overlay(
                RoundedRectangle(cornerRadius: BorderTokens.radius999)
                    .stroke(borderColor, lineWidth: borderWidth)
            )
            .cornerRadius(BorderTokens.radius999)
        }
        .disabled(state == .inactive || state == .loading)
    }
    
    // MARK: - Color Logic
    
    private var textFont: Font {
        style == .ghost ? TypographyTokens.bodySmSemibold : size.font
    }
    
    private var textColor: Color {
        switch style {
        case .orangeFilled:
            return state == .inactive ? ButtonColorTokens.textButtonOrangeFilledInactive : ButtonColorTokens.textButtonOrangeFilledDefault
        case .gradientFilled:
            return state == .inactive ? ButtonColorTokens.textButtonOrangeFilledInactive : ButtonColorTokens.textButtonOrangeFilledDefault
        case .outlined:
            return state == .inactive ? ButtonColorTokens.textButtonOrangeOutlineInactive : ButtonColorTokens.textButtonOrangeOutlineDefault
        case .whiteFilled:
            return state == .inactive ? ButtonColorTokens.textButtonWhiteFilledInactive : ButtonColorTokens.textButtonWhiteFilledDefault
        case .black5:
            return ButtonColorTokens.textButtonTransparent05FilledDefault
        case .black10:
            return state == .inactive ? ButtonColorTokens.textButtonTransparent10FilledInactive : ButtonColorTokens.textButtonTransparent10FilledDefault
        case .ghost:
            return state == .inactive ? ButtonColorTokens.textButtonGhostFilledInactive : ButtonColorTokens.textButtonGhostFilledDefault
        }
    }
    
    private var iconColor: Color {
        switch style {
        case .orangeFilled:
            return ButtonColorTokens.iconActionOrangeFilledDefault
        case .gradientFilled:
            return ButtonColorTokens.iconActionGradientFilledDefault
        case .outlined:
            return state == .inactive ? ButtonColorTokens.iconActionOrangeOutlineInactive : ButtonColorTokens.iconActionOrangeOutlineDefault
        case .whiteFilled:
            return ButtonColorTokens.iconActionWhiteFilledDefault
        case .black5:
            return state == .inactive ? ButtonColorTokens.iconActionTransparent05FilledInactive : ButtonColorTokens.iconActionTransparent05FilledDefault
        case .black10:
            return state == .inactive ? ButtonColorTokens.iconActionTransparent10FilledInactive : ButtonColorTokens.iconActionTransparent10FilledDefault
        case .ghost:
            return state == .inactive ? ButtonColorTokens.iconActionGhostFilledInactive : ButtonColorTokens.iconActionGhostFilledDefault
        }
    }
    
    private var backgroundColor: Color {
        switch style {
        case .orangeFilled:
            if state == .inactive {
                return ButtonColorTokens.backgroundButtonBrandFilledInactive
            }
            return ButtonColorTokens.backgroundButtonBrandFilledDefault
        case .gradientFilled:
            if state == .inactive {
                return ButtonColorTokens.backgroundButtonBrandFilledInactive
            }
            // Gradient - using linear gradient approximation
            return ButtonColorTokens.backgroundActionPrimary
        case .outlined:
            return .clear
        case .whiteFilled:
            return state == .inactive ? ButtonColorTokens.backgroundButtonWhiteFilledInactive : ButtonColorTokens.backgroundButtonWhiteFilledDefault
        case .black5:
            return ButtonColorTokens.backgroundButtonTransparent05Default
        case .black10:
            return ButtonColorTokens.backgroundButtonTransparent10Default
        case .ghost:
            if state == .pressed {
                return ButtonColorTokens.backgroundButtonGhostFilledPressed
            }
            return ButtonColorTokens.backgroundButtonGhostFilledDefault
        }
    }
    
    private var borderColor: Color {
        if style == .outlined {
            return state == .inactive ? ButtonColorTokens.borderButtonOrangeOutlineInactive : ButtonColorTokens.borderButtonOrangeOutlineDefault
        }
        return .clear
    }
    
    private var borderWidth: CGFloat {
        style == .outlined ? BorderTokens.border2 : 0
    }
}

/// Icon-only Button component
struct THDIconButton: View {
    let icon: String
    let style: ButtonStyle
    let size: ButtonSize
    let state: ButtonState
    let action: () -> Void
    
    init(
        icon: String,
        style: ButtonStyle = .orangeFilled,
        size: ButtonSize = .small,
        state: ButtonState = .default,
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
                RoundedRectangle(cornerRadius: BorderTokens.radius999)
                    .stroke(borderColor, lineWidth: borderWidth)
            )
            .cornerRadius(BorderTokens.radius999)
        }
        .disabled(state == .inactive || state == .loading)
    }
    
    // MARK: - Color Logic (reused from THDButton)
    
    private var iconColor: Color {
        switch style {
        case .orangeFilled:
            return ButtonColorTokens.iconActionOrangeFilledDefault
        case .gradientFilled:
            return ButtonColorTokens.iconActionGradientFilledDefault
        case .outlined:
            return state == .inactive ? ButtonColorTokens.iconActionOrangeOutlineInactive : ButtonColorTokens.iconActionOrangeOutlineDefault
        case .whiteFilled:
            return ButtonColorTokens.iconActionWhiteFilledDefault
        case .black5:
            return state == .inactive ? ButtonColorTokens.iconActionTransparent05FilledInactive : ButtonColorTokens.iconActionTransparent05FilledDefault
        case .black10:
            return state == .inactive ? ButtonColorTokens.iconActionTransparent10FilledInactive : ButtonColorTokens.iconActionTransparent10FilledDefault
        case .ghost:
            return state == .inactive ? ButtonColorTokens.iconActionGhostFilledInactive : ButtonColorTokens.iconActionGhostFilledDefault
        }
    }
    
    private var backgroundColor: Color {
        switch style {
        case .orangeFilled:
            return state == .inactive ? ButtonColorTokens.backgroundButtonBrandFilledInactive : ButtonColorTokens.backgroundButtonBrandFilledDefault
        case .gradientFilled:
            return state == .inactive ? ButtonColorTokens.backgroundButtonBrandFilledInactive : ButtonColorTokens.backgroundActionPrimary
        case .outlined:
            return .clear
        case .whiteFilled:
            return state == .inactive ? ButtonColorTokens.backgroundButtonWhiteFilledInactive : ButtonColorTokens.backgroundButtonWhiteFilledDefault
        case .black5:
            return ButtonColorTokens.backgroundButtonTransparent05Default
        case .black10:
            return ButtonColorTokens.backgroundButtonTransparent10Default
        case .ghost:
            return state == .pressed ? ButtonColorTokens.backgroundButtonGhostFilledPressed : ButtonColorTokens.backgroundButtonGhostFilledDefault
        }
    }
    
    private var borderColor: Color {
        if style == .outlined {
            return state == .inactive ? ButtonColorTokens.borderButtonOrangeOutlineInactive : ButtonColorTokens.borderButtonOrangeOutlineDefault
        }
        return .clear
    }
    
    private var borderWidth: CGFloat {
        style == .outlined ? BorderTokens.border2 : 0
    }
}

// MARK: - Color Extension
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

// MARK: - Previews
#Preview("Button Variants") {
    ScrollView {
        VStack(alignment: .leading, spacing: 24) {
            // Title
            Text("Button")
                .font(.system(size: 48, weight: .medium))
                .padding(.bottom, 20)
            
            // Orange Filled Buttons
            VStack(alignment: .leading, spacing: 12) {
                Text("Orange Filled")
                    .font(.headline)
                
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
                
                HStack(spacing: 8) {
                    THDButton("Button Text", style: .black5, size: .small, leadingIcon: "plus", trailingIcon: "plus")
                    THDButton("Button Text", style: .black5, size: .medium, leadingIcon: "plus", trailingIcon: "plus")
                }
            }
            
            // Black 10% Buttons
            VStack(alignment: .leading, spacing: 12) {
                Text("Black 10%")
                    .font(.headline)
                
                HStack(spacing: 8) {
                    THDButton("Button Text", style: .black10, size: .small, leadingIcon: "plus", trailingIcon: "plus")
                    THDButton("Button Text", style: .black10, size: .medium, leadingIcon: "plus", trailingIcon: "plus")
                }
            }
            
            // Ghost Buttons
            VStack(alignment: .leading, spacing: 12) {
                Text("Ghost")
                    .font(.headline)
                
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
    .background(Color.white)
}
