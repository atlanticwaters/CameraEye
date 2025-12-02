import SwiftUI

// MARK: - Pill Component System
// THD App Design System - Pill Components

// MARK: - Design Tokens (Reusing from Badge + Pill-specific)

/// Typography tokens from Figma design system
struct TypographyTokens {
    static let bodyXsBold = Font.system(size: 12, weight: .bold) // Body Xs/Bold/None
    static let bodySmBold = Font.system(size: 14, weight: .bold) // Body Sm/Bold/None
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
    static let widthXS: CGFloat = 1
    static let radiusLG: CGFloat = 6
    static let radiusXL: CGFloat = 8
    static let radiusFull: CGFloat = 9999
}

/// Color tokens from Figma design system
struct ColorTokens {
    // Text colors
    static let textOnSurfacePrimary = Color(hex: "#252524")
    static let textOnSurfaceSecondary = Color(hex: "#474545")
    static let textOnSurfaceTertiary = Color(hex: "#6a6867")
    static let textOnSurfaceInverse = Color(hex: "#fbfaf9")
    static let textPrimary = Color(hex: "#202020")
    static let uiTextPrimary = Color(hex: "#202020")
    
    // Selector text colors
    static let textSelectorColorDefault = Color(hex: "#474545")
    static let textSelectorColorSelected = Color(hex: "#fbfaf9")
    static let textSelectorColorInactive = Color(hex: "#979492")
    
    // Icon selector colors
    static let iconSelectorColorOutlineDefault = Color(hex: "#474545")
    static let iconSelectorColorOutlineSelected = Color(hex: "#fbfaf9")
    static let iconSelectorColorOutlineInactive = Color(hex: "#979492")
    
    // Border selector colors
    static let borderSelectorColorOutlineDefault = Color(hex: "#979492")
    static let borderSelectorColorOutlinePressed = Color(hex: "#585756")
    static let borderSelectorColorOutlineInactive = Color(hex: "#bab7b4")
    
    // Background selector colors
    static let backgroundSelectorColorOutlineSelected = Color(hex: "#252524")
    static let backgroundSelectorColorFilledTransparent = Color(hex: "#00000000")
    static let backgroundSelectorColorFilledPressed = Color(hex: "#0000001a")
    static let backgroundSelectorColorFilledSelected = Color(hex: "#252524")
    static let backgroundSelectorColorFilledInactive = Color(hex: "#e5e1de")
    static let backgroundButtonColorTransparent05Default = Color(hex: "#0000000d")
    static let backgroundButtonColorTransparent05Pressed = Color(hex: "#0000001a")
    
    // Greige
    static let greige900 = Color(hex: "#252524")
    static let greige600 = Color(hex: "#6a6867")
    static let greige100 = Color(hex: "#e5e1de")
    
    // Brand
    static let brand300 = Color(hex: "#f96302")
    static let brand200 = Color(hex: "#fba268")
    
    // Neutrals
    static let neutralsTransparent = Color(hex: "#00000000")
}

/// Pill interaction states
enum PillInteraction {
    case `default`
    case pressed
    case selected
    case disabled
}

/// Pill style variants
enum PillStyle {
    case outlined
    case filled
}

/// Pill size options
enum PillSize {
    case small  // 28pt height
    case medium // 36pt height
    case large  // 44pt height
    
    var height: CGFloat {
        switch self {
        case .small: return SpacingTokens.spacing7
        case .medium: return SpacingTokens.spacing9
        case .large: return SpacingTokens.spacing11
        }
    }
    
    var iconSize: CGFloat {
        14 // Icon size is consistent across sizes
    }
    
    var chevronSize: CGFloat {
        10.5 // Chevron size is consistent
    }
}

/// Pill component with optional leading icon and trailing chevron
struct Pill: View {
    let text: String
    let style: PillStyle
    let size: PillSize
    let interaction: PillInteraction
    let hasBackground: Bool
    let leadingIcon: String?
    let hasChevron: Bool
    
    init(
        _ text: String,
        style: PillStyle = .outlined,
        size: PillSize = .small,
        interaction: PillInteraction = .default,
        hasBackground: Bool = true,
        leadingIcon: String? = nil,
        hasChevron: Bool = false
    ) {
        self.text = text
        self.style = style
        self.size = size
        self.interaction = interaction
        self.hasBackground = hasBackground
        self.leadingIcon = leadingIcon
        self.hasChevron = hasChevron
    }
    
    var body: some View {
        HStack(spacing: SpacingTokens.spacing1) {
            // Leading icon (optional)
            if let iconName = leadingIcon {
                Image(systemName: iconName)
                    .resizable()
                    .frame(width: size.iconSize, height: size.iconSize)
                    .foregroundColor(iconColor)
            }
            
            // Text label
            Text(text)
                .font(TypographyTokens.bodySmRegular)
                .foregroundColor(textColor)
                .lineLimit(1)
            
            // Trailing chevron (optional)
            if hasChevron {
                Image(systemName: "chevron.down")
                    .resizable()
                    .frame(width: size.chevronSize, height: size.chevronSize)
                    .foregroundColor(iconColor)
            }
        }
        .padding(.horizontal, SpacingTokens.spacing4)
        .padding(.vertical, SpacingTokens.spacing6px)
        .frame(height: size.height)
        .background(backgroundColor)
        .overlay(
            RoundedRectangle(cornerRadius: BorderTokens.radiusFull)
                .stroke(borderColor, lineWidth: style == .outlined ? BorderTokens.border1 : 0)
        )
        .cornerRadius(BorderTokens.radiusFull)
        .disabled(interaction == .disabled)
    }
    
    // MARK: - Color Logic
    
    private var textColor: Color {
        switch interaction {
        case .default, .pressed:
            return ColorTokens.textSelectorColorDefault
        case .selected:
            return ColorTokens.textSelectorColorSelected
        case .disabled:
            return ColorTokens.textSelectorColorInactive
        }
    }
    
    private var iconColor: Color {
        switch interaction {
        case .default, .pressed:
            return ColorTokens.iconSelectorColorOutlineDefault
        case .selected:
            return ColorTokens.iconSelectorColorOutlineSelected
        case .disabled:
            return ColorTokens.iconSelectorColorOutlineInactive
        }
    }
    
    private var backgroundColor: Color {
        if style == .outlined {
            switch interaction {
            case .default:
                return hasBackground ? ColorTokens.backgroundButtonColorTransparent05Default : .clear
            case .pressed:
                return hasBackground ? ColorTokens.backgroundButtonColorTransparent05Pressed : ColorTokens.backgroundSelectorColorFilledPressed
            case .selected:
                return ColorTokens.backgroundSelectorColorOutlineSelected
            case .disabled:
                return hasBackground ? ColorTokens.backgroundSelectorColorFilledInactive : .clear
            }
        } else { // filled
            switch interaction {
            case .default:
                return ColorTokens.backgroundSelectorColorFilledTransparent
            case .pressed:
                return ColorTokens.backgroundSelectorColorFilledPressed
            case .selected:
                return ColorTokens.backgroundSelectorColorFilledSelected
            case .disabled:
                return ColorTokens.backgroundSelectorColorFilledInactive
            }
        }
    }
    
    private var borderColor: Color {
        if style == .outlined {
            switch interaction {
            case .default:
                return ColorTokens.borderSelectorColorOutlineDefault
            case .pressed:
                return ColorTokens.borderSelectorColorOutlinePressed
            case .selected:
                return ColorTokens.backgroundSelectorColorOutlineSelected
            case .disabled:
                return ColorTokens.borderSelectorColorOutlineInactive
            }
        } else {
            return .clear
        }
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
#Preview("Pill Variants") {
    ScrollView {
        VStack(alignment: .leading, spacing: 24) {
            // Title
            Text("Pill")
                .font(.system(size: 48, weight: .medium))
                .padding(.bottom, 20)
            
            // Outlined Pills - Default
            VStack(alignment: .leading, spacing: 12) {
                Text("Outlined - Default")
                    .font(.headline)
                
                VStack(alignment: .leading, spacing: 8) {
                    Pill("Cumberland", style: .outlined, size: .small, hasBackground: true, leadingIcon: "storefront", hasChevron: true)
                    Pill("Cumberland", style: .outlined, size: .medium, hasBackground: true, leadingIcon: "storefront", hasChevron: true)
                    Pill("Cumberland", style: .outlined, size: .large, hasBackground: true, leadingIcon: "storefront", hasChevron: true)
                }
            }
            
            // Filled Pills - Default
            VStack(alignment: .leading, spacing: 12) {
                Text("Filled - Default")
                    .font(.headline)
                
                VStack(alignment: .leading, spacing: 8) {
                    Pill("Cumberland", style: .filled, size: .small, hasBackground: false, leadingIcon: "storefront", hasChevron: true)
                    Pill("Cumberland", style: .filled, size: .medium, hasBackground: false, leadingIcon: "storefront", hasChevron: true)
                    Pill("Cumberland", style: .filled, size: .large, hasBackground: false, leadingIcon: "storefront", hasChevron: true)
                }
            }
            
            // Filled Pills with Background - Default
            VStack(alignment: .leading, spacing: 12) {
                Text("Filled - Default (with Background)")
                    .font(.headline)
                
                VStack(alignment: .leading, spacing: 8) {
                    Pill("Cumberland", style: .filled, size: .small, hasBackground: true, leadingIcon: "storefront", hasChevron: true)
                    Pill("Cumberland", style: .filled, size: .medium, hasBackground: true, leadingIcon: "storefront", hasChevron: true)
                    Pill("Cumberland", style: .filled, size: .large, hasBackground: true, leadingIcon: "storefront", hasChevron: true)
                }
            }
            
            // Outlined Pills - Pressed
            VStack(alignment: .leading, spacing: 12) {
                Text("Outlined - Pressed")
                    .font(.headline)
                
                VStack(alignment: .leading, spacing: 8) {
                    Pill("Cumberland", style: .outlined, size: .small, interaction: .pressed, hasBackground: true, leadingIcon: "storefront", hasChevron: true)
                    Pill("Cumberland", style: .outlined, size: .medium, interaction: .pressed, hasBackground: true, leadingIcon: "storefront", hasChevron: true)
                    Pill("Cumberland", style: .outlined, size: .large, interaction: .pressed, hasBackground: true, leadingIcon: "storefront", hasChevron: true)
                }
            }
            
            // Filled Pills - Pressed
            VStack(alignment: .leading, spacing: 12) {
                Text("Filled - Pressed")
                    .font(.headline)
                
                VStack(alignment: .leading, spacing: 8) {
                    Pill("Cumberland", style: .filled, size: .small, interaction: .pressed, hasBackground: true, leadingIcon: "storefront", hasChevron: true)
                    Pill("Cumberland", style: .filled, size: .medium, interaction: .pressed, hasBackground: true, leadingIcon: "storefront", hasChevron: true)
                    Pill("Cumberland", style: .filled, size: .large, interaction: .pressed, hasBackground: true, leadingIcon: "storefront", hasChevron: true)
                }
            }
            
            // Outlined Pills - Selected
            VStack(alignment: .leading, spacing: 12) {
                Text("Outlined - Selected")
                    .font(.headline)
                
                VStack(alignment: .leading, spacing: 8) {
                    Pill("Cumberland", style: .outlined, size: .small, interaction: .selected, hasBackground: true, leadingIcon: "storefront", hasChevron: true)
                    Pill("Cumberland", style: .outlined, size: .medium, interaction: .selected, hasBackground: true, leadingIcon: "storefront", hasChevron: true)
                    Pill("Cumberland", style: .outlined, size: .large, interaction: .selected, hasBackground: true, leadingIcon: "storefront", hasChevron: true)
                }
            }
            
            // Filled Pills - Selected
            VStack(alignment: .leading, spacing: 12) {
                Text("Filled - Selected")
                    .font(.headline)
                
                VStack(alignment: .leading, spacing: 8) {
                    Pill("Cumberland", style: .filled, size: .small, interaction: .selected, hasBackground: true, leadingIcon: "storefront", hasChevron: true)
                    Pill("Cumberland", style: .filled, size: .medium, interaction: .selected, hasBackground: true, leadingIcon: "storefront", hasChevron: true)
                    Pill("Cumberland", style: .filled, size: .large, interaction: .selected, hasBackground: true, leadingIcon: "storefront", hasChevron: true)
                }
            }
            
            // Outlined Pills - Disabled
            VStack(alignment: .leading, spacing: 12) {
                Text("Outlined - Disabled")
                    .font(.headline)
                
                VStack(alignment: .leading, spacing: 8) {
                    Pill("Cumberland", style: .outlined, size: .small, interaction: .disabled, hasBackground: true, leadingIcon: "storefront", hasChevron: true)
                    Pill("Cumberland", style: .outlined, size: .medium, interaction: .disabled, hasBackground: true, leadingIcon: "storefront", hasChevron: true)
                    Pill("Cumberland", style: .outlined, size: .large, interaction: .disabled, hasBackground: true, leadingIcon: "storefront", hasChevron: true)
                }
            }
            
            // Filled Pills - Disabled
            VStack(alignment: .leading, spacing: 12) {
                Text("Filled - Disabled")
                    .font(.headline)
                
                VStack(alignment: .leading, spacing: 8) {
                    Pill("Cumberland", style: .filled, size: .small, interaction: .disabled, hasBackground: true, leadingIcon: "storefront", hasChevron: true)
                    Pill("Cumberland", style: .filled, size: .medium, interaction: .disabled, hasBackground: true, leadingIcon: "storefront", hasChevron: true)
                    Pill("Cumberland", style: .filled, size: .large, interaction: .disabled, hasBackground: true, leadingIcon: "storefront", hasChevron: true)
                }
            }
            
            // Pills without icons or chevrons
            VStack(alignment: .leading, spacing: 12) {
                Text("Simple Pills (no icons)")
                    .font(.headline)
                
                HStack(spacing: 8) {
                    Pill("Small", style: .outlined, size: .small)
                    Pill("Medium", style: .outlined, size: .medium)
                    Pill("Large", style: .outlined, size: .large)
                }
                
                HStack(spacing: 8) {
                    Pill("Selected", style: .outlined, size: .medium, interaction: .selected)
                    Pill("Disabled", style: .outlined, size: .medium, interaction: .disabled)
                }
            }
        }
        .padding()
    }
    .background(Color.white)
}
