import SwiftUI

// MARK: - Badge Component System
// THD App Design System - Badge Components

// MARK: - Design Tokens

/// Typography tokens from Figma design system
struct TypographyTokens {
    static let bodyXsBold = Font.system(size: 12, weight: .bold) // Body Xs/Bold/None
    static let bodySmBold = Font.system(size: 14, weight: .bold) // Body Sm/Bold/None
    static let bodyXsBoldBase = Font.system(size: 18, weight: .heavy) // Body Xs/Bold/Base (800)
    static let bodyXsSemiboldBase = Font.system(size: 18, weight: .semibold) // Body Xs/Semibold/Base (600)
}

/// Spacing tokens from Figma
struct SpacingTokens {
    static let spacing0: CGFloat = 0
    static let spacing1: CGFloat = 4
    static let spacing30: CGFloat = 120
}

/// Badge-specific tokens from Figma
struct BadgeTokens {
    static let gap: CGFloat = 4
    static let heightSmall: CGFloat = 16
    static let heightBase: CGFloat = 20
    static let paddingYTop: CGFloat = 0
    static let paddingYBottom: CGFloat = 0
    static let labelAlignTop: CGFloat = 0
    static let labelAlignBottom: CGFloat = 1
}

/// Border tokens from Figma
struct BorderTokens {
    static let widthXS: CGFloat = 1
    static let radiusLG: CGFloat = 6
    static let radiusXL: CGFloat = 8
}

/// Indicator tokens from Figma
struct IndicatorTokens {
    static let padding: CGFloat = 0
    static let sizeSmall: CGFloat = 8
    static let sizeBase: CGFloat = 12
    static let borderRadius: CGFloat = 9999
}

/// Color tokens from Figma design system
struct ColorTokens {
    // Text colors
    static let textOnSurfacePrimary = Color(hex: "#252524")
    static let textOnSurfaceSecondary = Color(hex: "#474545")
    static let textOnSurfaceTertiary = Color(hex: "#6a6867")
    static let textOnSurfaceInverse = Color(hex: "#fbfaf9")
    
    // Moonlight (Info/Teal)
    static let moonlight500 = Color(hex: "#6974a5")
    static let moonlight800 = Color(hex: "#3a446d")
    static let moonlight100 = Color(hex: "#dfe1eb")
    
    // Bottle Green (Success)
    static let bottleGreen500 = Color(hex: "#4a8165")
    static let bottleGreen600 = Color(hex: "#397456")
    static let bottleGreen700 = Color(hex: "#226242")
    static let bottleGreen100 = Color(hex: "#d8e4de")
    
    // Lemon (Warning)
    static let lemon500 = Color(hex: "#817747")
    static let lemon200 = Color(hex: "#cfb73a")
    static let lemon900 = Color(hex: "#262521")
    static let lemon100 = Color(hex: "#f9e270")
    static let backgroundStatusWarningSubtle = Color(hex: "#fef3d2")
    
    // Cinnabar (Danger/Red)
    static let cinnabar500 = Color(hex: "#df3427")
    static let cinnabar600 = Color(hex: "#c62e23")
    static let cinnabar700 = Color(hex: "#a5271d")
    static let cinnabar100 = Color(hex: "#fbdad7")
    
    // Greige (Medium/Gray)
    static let greige900 = Color(hex: "#252524")
    static let greige600 = Color(hex: "#6a6867")
    static let greige100 = Color(hex: "#e5e1de")
    
    // Brand (Orange)
    static let brand300 = Color(hex: "#f96302")
    static let brand100 = Color(hex: "#fedac3")
    static let backgroundBrand = Color(hex: "#f96302")
    static let backgroundBrandSubtle = Color(hex: "#fdd0b2")
    static let badgeColorTextRegularAccentBrand = Color(hex: "#582301")
    
    // Background
    static let backgroundPrimary = Color(hex: "#ffffff")
    static let neutralsWhite = Color(hex: "#ffffff")
    
    // Status backgrounds
    static let backgroundStatusInfoStrong = Color(hex: "#61d0c8")
    static let backgroundStatusInfoDefault = Color(hex: "#9fe5df")
    static let backgroundStatusSuccessStrong = Color(hex: "#4cd693")
    static let backgroundStatusSuccessDefault = Color(hex: "#9ce8c4")
    static let backgroundStatusWarningStrong = Color(hex: "#ebb821")
    static let backgroundStatusWarningDefault = Color(hex: "#fcd561")
    static let backgroundStatusDangerStrongest = Color(hex: "#b72020")
    static let backgroundStatusDangerStrong = Color(hex: "#e6b2b2")
}

/// Badge variant styles
enum BadgeVariant {
    case outline
    case filledSubtle
    case filledStrong
}

/// Badge color options - mapped to Figma color tokens
enum BadgeColor {
    case info        // Moonlight (Teal)
    case success     // Bottle Green
    case warning     // Lemon (Yellow)
    case danger      // Cinnabar (Red)
    case medium      // Greige (Gray)
    case primary     // Greige 900 (Black)
    case brand       // Brand (Orange)
    
    func outlineTextColor() -> Color {
        switch self {
        case .info: return ColorTokens.moonlight500
        case .success: return ColorTokens.bottleGreen700
        case .warning: return ColorTokens.lemon200
        case .danger: return ColorTokens.cinnabar600
        case .medium: return ColorTokens.greige600
        case .primary: return ColorTokens.greige900
        case .brand: return ColorTokens.brand300
        }
    }
    
    func subtleBackgroundColor() -> Color {
        switch self {
        case .info: return ColorTokens.moonlight100
        case .success: return ColorTokens.bottleGreen100
        case .warning: return ColorTokens.backgroundStatusWarningSubtle
        case .danger: return ColorTokens.cinnabar100
        case .medium: return ColorTokens.greige100
        case .primary: return ColorTokens.greige100
        case .brand: return ColorTokens.backgroundBrandSubtle
        }
    }
    
    func subtleTextColor() -> Color {
        switch self {
        case .info: return ColorTokens.moonlight800
        case .success: return ColorTokens.bottleGreen700
        case .warning: return ColorTokens.lemon900
        case .danger: return ColorTokens.cinnabar700
        case .medium: return ColorTokens.greige900
        case .primary: return ColorTokens.greige900
        case .brand: return ColorTokens.badgeColorTextRegularAccentBrand
        }
    }
    
    func strongBackgroundColor() -> Color {
        switch self {
        case .info: return ColorTokens.moonlight500
        case .success: return ColorTokens.bottleGreen600
        case .warning: return ColorTokens.lemon500
        case .danger: return ColorTokens.cinnabar600
        case .medium: return ColorTokens.greige600
        case .primary: return ColorTokens.greige900
        case .brand: return ColorTokens.backgroundBrand
        }
    }
    
    func indicatorStrongColor() -> Color {
        switch self {
        case .info: return ColorTokens.backgroundStatusInfoStrong
        case .success: return ColorTokens.backgroundStatusSuccessStrong
        case .warning: return ColorTokens.backgroundStatusWarningStrong
        case .danger: return ColorTokens.backgroundStatusDangerStrongest
        case .medium: return ColorTokens.greige600
        case .primary: return ColorTokens.greige900
        case .brand: return ColorTokens.backgroundBrand
        }
    }
    
    func indicatorSubtleColor() -> Color {
        switch self {
        case .info: return ColorTokens.backgroundStatusInfoDefault
        case .success: return ColorTokens.backgroundStatusSuccessDefault
        case .warning: return ColorTokens.backgroundStatusWarningDefault
        case .danger: return ColorTokens.backgroundStatusDangerStrong
        case .medium: return ColorTokens.greige100
        case .primary: return ColorTokens.greige100
        case .brand: return ColorTokens.backgroundBrandSubtle
        }
    }
}

/// Badge size options
enum BadgeSize {
    case small
    case base
    
    var fontSize: Font {
        switch self {
        case .small: return TypographyTokens.bodyXsBold
        case .base: return TypographyTokens.bodySmBold
        }
    }
    
    var height: CGFloat {
        switch self {
        case .small: return BadgeTokens.heightSmall
        case .base: return BadgeTokens.heightBase
        }
    }
    
    var horizontalPadding: CGFloat {
        SpacingTokens.spacing1
    }
}


/// Standard Badge component
struct Badge: View {
    let text: String
    let variant: BadgeVariant
    let color: BadgeColor
    let size: BadgeSize
    
    init(
        _ text: String,
        variant: BadgeVariant = .outline,
        color: BadgeColor = .primary,
        size: BadgeSize = .base
    ) {
        self.text = text
        self.variant = variant
        self.color = color
        self.size = size
    }
    
    var body: some View {
        Text(text)
            .font(size.fontSize)
            .foregroundColor(foregroundColor)
            .padding(.horizontal, size.horizontalPadding)
            .padding(.top, BadgeTokens.paddingYTop)
            .padding(.bottom, BadgeTokens.paddingYBottom)
            .frame(height: size.height)
            .background(backgroundColor)
            .cornerRadius(BorderTokens.radiusLG)
            .overlay(
                RoundedRectangle(cornerRadius: BorderTokens.radiusLG)
                    .stroke(borderColor, lineWidth: variant == .outline ? BorderTokens.widthXS : 0)
            )
    }
    
    private var foregroundColor: Color {
        switch variant {
        case .outline:
            return color.outlineTextColor()
        case .filledSubtle:
            return color.subtleTextColor()
        case .filledStrong:
            return ColorTokens.textOnSurfaceInverse
        }
    }
    
    private var backgroundColor: Color {
        switch variant {
        case .outline:
            return .clear
        case .filledSubtle:
            return color.subtleBackgroundColor()
        case .filledStrong:
            return color.strongBackgroundColor()
        }
    }
    
    private var borderColor: Color {
        variant == .outline ? color.outlineTextColor() : .clear
    }
}

/// Badge Alt - Rating badge with star
struct BadgeAlt: View {
    let label: String
    let rating: String
    
    init(label: String = "Top Rated", rating: String = "4.5") {
        self.label = label
        self.rating = rating
    }
    
    var body: some View {
        HStack(spacing: SpacingTokens.spacing1) {
            // Text Labels
            HStack(spacing: SpacingTokens.spacing1) {
                // Primary label - Body Xs/Bold/Base
                Text(label)
                    .font(TypographyTokens.bodyXsBoldBase)
                    .foregroundColor(ColorTokens.textOnSurfacePrimary)
                
                // Rating value - Body Xs/Semibold/Base
                Text(rating)
                    .font(TypographyTokens.bodyXsSemiboldBase)
                    .foregroundColor(ColorTokens.textOnSurfaceSecondary)
            }
            
            // Star Filled icon
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: 16, height: 16)
                .foregroundColor(ColorTokens.brand300)
        }
        .padding(.vertical, 6)
        .frame(height: 32)
        .background(ColorTokens.greige100.opacity(0.5))
    }
}

/// Indicator - Small circular badge indicator
struct BadgeIndicator: View {
    let color: BadgeColor
    let size: IndicatorSize
    let emphasis: BadgeEmphasis
    
    enum IndicatorSize {
        case base
        case regular
        
        var diameter: CGFloat {
            switch self {
            case .base: return IndicatorTokens.sizeSmall
            case .regular: return IndicatorTokens.sizeBase
            }
        }
    }
    
    enum BadgeEmphasis {
        case strong
        case subtle
    }
    
    init(
        color: BadgeColor = .brand,
        size: IndicatorSize = .base,
        emphasis: BadgeEmphasis = .strong
    ) {
        self.color = color
        self.size = size
        self.emphasis = emphasis
    }
    
    var body: some View {
        Circle()
            .fill(fillColor)
            .frame(width: size.diameter, height: size.diameter)
    }
    
    private var fillColor: Color {
        switch emphasis {
        case .strong:
            return color.indicatorStrongColor()
        case .subtle:
            return color.indicatorSubtleColor()
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
#Preview("Badge Variants") {
    ScrollView {
        VStack(alignment: .leading, spacing: 24) {
            // Title
            Text("Badge")
                .font(.system(size: 48, weight: .medium))
                .padding(.bottom, 20)
            
            // Indicators
            VStack(alignment: .leading, spacing: 12) {
                Text("Indicators")
                    .font(.headline)
                
                HStack(spacing: 16) {
                    BadgeIndicator(color: .info, size: .base, emphasis: .strong)
                    BadgeIndicator(color: .info, size: .regular, emphasis: .strong)
                    BadgeIndicator(color: .info, size: .base, emphasis: .subtle)
                    BadgeIndicator(color: .info, size: .regular, emphasis: .subtle)
                }
            }
            
            // Badge Alt
            VStack(alignment: .leading, spacing: 12) {
                Text("Rating Badge")
                    .font(.headline)
                
                BadgeAlt()
            }
            
            // Outline Badges
            VStack(alignment: .leading, spacing: 12) {
                Text("Outline Badges")
                    .font(.headline)
                
                HStack(spacing: 12) {
                    Badge("Badge", variant: .outline, color: .info, size: .small)
                    Badge("Badge", variant: .outline, color: .info, size: .base)
                }
                
                HStack(spacing: 12) {
                    Badge("Badge", variant: .outline, color: .success, size: .small)
                    Badge("Badge", variant: .outline, color: .success, size: .base)
                }
                
                HStack(spacing: 12) {
                    Badge("Badge", variant: .outline, color: .warning, size: .small)
                    Badge("Badge", variant: .outline, color: .warning, size: .base)
                }
                
                HStack(spacing: 12) {
                    Badge("Badge", variant: .outline, color: .danger, size: .small)
                    Badge("Badge", variant: .outline, color: .danger, size: .base)
                }
                
                HStack(spacing: 12) {
                    Badge("Badge", variant: .outline, color: .brand, size: .small)
                    Badge("Badge", variant: .outline, color: .brand, size: .base)
                }
            }
            
            // Filled Subtle Badges
            VStack(alignment: .leading, spacing: 12) {
                Text("Filled Subtle Badges")
                    .font(.headline)
                
                HStack(spacing: 12) {
                    Badge("Badge", variant: .filledSubtle, color: .info, size: .small)
                    Badge("Badge", variant: .filledSubtle, color: .info, size: .base)
                }
                
                HStack(spacing: 12) {
                    Badge("Badge", variant: .filledSubtle, color: .success, size: .small)
                    Badge("Badge", variant: .filledSubtle, color: .success, size: .base)
                }
                
                HStack(spacing: 12) {
                    Badge("Badge", variant: .filledSubtle, color: .brand, size: .small)
                    Badge("Badge", variant: .filledSubtle, color: .brand, size: .base)
                }
            }
            
            // Filled Strong Badges
            VStack(alignment: .leading, spacing: 12) {
                Text("Filled Strong Badges")
                    .font(.headline)
                
                HStack(spacing: 12) {
                    Badge("Badge", variant: .filledStrong, color: .info, size: .small)
                    Badge("Badge", variant: .filledStrong, color: .info, size: .base)
                }
                
                HStack(spacing: 12) {
                    Badge("Badge", variant: .filledStrong, color: .danger, size: .small)
                    Badge("Badge", variant: .filledStrong, color: .danger, size: .base)
                }
                
                HStack(spacing: 12) {
                    Badge("Badge", variant: .filledStrong, color: .brand, size: .small)
                    Badge("Badge", variant: .filledStrong, color: .brand, size: .base)
                }
            }
        }
        .padding()
    }
    .background(Color.white)
}
