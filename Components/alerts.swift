import SwiftUI

// MARK: - Callout & Alert Component System
// THD App Design System - Callout and Alert Components

// MARK: - Design Tokens (Extended from Badge/Pill/Button/Quantity/Tile)

/// Typography tokens from Figma design system
struct TypographyTokens {
    static let headingH5ExtraBoldTight = Font.system(size: 18, weight: .heavy).leading(.tight) // Heading h5/ExtraBold/Tight (800 weight)
    static let headingH6SemiboldNone = Font.system(size: 16, weight: .medium) // Heading h6/Semibold/None (500 weight)
    static let bodyMdRegularTight = Font.system(size: 16, weight: .regular).leading(.tight) // Body Md/Regular/Tight
    static let bodySmRegularTight = Font.system(size: 14, weight: .regular).leading(.tight) // Body Sm/Regular/Tight
    static let bodySmBoldNone = Font.system(size: 14, weight: .bold) // Body Sm/Bold/None
}

/// Spacing tokens from Figma
struct SpacingTokens {
    static let spacing0: CGFloat = 0
    static let spacing1: CGFloat = 4
    static let spacing2: CGFloat = 8
    static let spacing3: CGFloat = 12
    static let spacing4: CGFloat = 16
}

/// Border tokens from Figma
struct BorderTokens {
    static let borderWidthXs: CGFloat = 1
    static let radius5: CGFloat = 6
    static let radius999: CGFloat = 9999
    static let radius2xl: CGFloat = 12
}

/// Callout & Alert color tokens from Figma
struct CalloutColorTokens {
    // Callout variants
    static let backgroundContainerTransparent05 = Color(hex: "#0000000d")
    static let backgroundSurfaceInverse = Color(hex: "#0d0d0d")
    static let backgroundContainerBrandAccent = Color(hex: "#fef2e9")
    
    // Alert variants
    static let backgroundFeedbackInformationalAccent1 = Color(hex: "#f3f4f8")
    static let backgroundFeedbackSuccessAccent1 = Color(hex: "#f0f5f3")
    static let backgroundFeedbackWarningAccent1 = Color(hex: "#fdf6d2")
    static let backgroundFeedbackErrorAccent1 = Color(hex: "#fdf1f0")
    
    // Text colors
    static let textOnContainerPrimary = Color(hex: "#252524")
    static let textOnContainerSecondary = Color(hex: "#474545")
    static let textOnContainerInverse = Color(hex: "#fbfaf9")
    static let textOnSurfacePrimary = Color(hex: "#252524")
    
    // Icon colors
    static let iconOnSurfacePrimary = Color(hex: "#252524")
    static let moonlight500 = Color(hex: "#6974a5")
    static let lemon200 = Color(hex: "#cfb73a")
    static let cinnabar500 = Color(hex: "#df3427")
    
    // Button
    static let backgroundActionPrimary = Color(hex: "#f96302")
    static let textButtonOrangeFilledDefault = Color(hex: "#ffffff")
    
    // Border
    static let borderOnContainerDefault = Color(hex: "#bab7b4")
    
    // Shadow
    static let shadow200 = Color(hex: "#0000001f")
}

/// Callout variant styles
enum CalloutVariant {
    case neutral
    case inverse
    case brand
}

/// Alert variant styles
enum AlertVariant {
    case informational
    case success
    case warning
    case error
}

/// Callout Component
struct Callout: View {
    let title: String?
    let subtitle: String?
    let description: String
    let variant: CalloutVariant
    let leadingIcon: String?
    let buttonText: String?
    let isFloating: Bool
    let onButtonTap: (() -> Void)?
    
    init(
        title: String? = nil,
        subtitle: String? = nil,
        description: String,
        variant: CalloutVariant = .neutral,
        leadingIcon: String? = "tag",
        buttonText: String? = nil,
        isFloating: Bool = false,
        onButtonTap: (() -> Void)? = nil
    ) {
        self.title = title
        self.subtitle = subtitle
        self.description = description
        self.variant = variant
        self.leadingIcon = leadingIcon
        self.buttonText = buttonText
        self.isFloating = isFloating
        self.onButtonTap = onButtonTap
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: SpacingTokens.spacing2) {
            // Leading icon
            if let iconName = leadingIcon {
                Image(systemName: iconName)
                    .resizable()
                    .frame(width: 16, height: 16)
                    .foregroundStyle(iconColor)
                    .padding(.top, SpacingTokens.spacing4)
            }
            
            // Content
            VStack(alignment: .leading, spacing: SpacingTokens.spacing4) {
                if title != nil || subtitle != nil {
                    VStack(alignment: .leading, spacing: SpacingTokens.spacing2) {
                        if let title = title {
                            Text(title)
                                .font(TypographyTokens.headingH5ExtraBoldTight)
                                .foregroundStyle(primaryTextColor)
                        }
                        
                        if let subtitle = subtitle {
                            Text(subtitle)
                                .font(TypographyTokens.bodyMdRegularTight)
                                .foregroundStyle(secondaryTextColor)
                        }
                    }
                }
                
                Text(description)
                    .font(TypographyTokens.bodySmRegularTight)
                    .foregroundStyle(primaryTextColor)
            }
            .padding(.top, SpacingTokens.spacing4)
            .padding(.bottom, 6)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            // Button
            if let buttonText = buttonText {
                Button(action: {
                    onButtonTap?()
                }) {
                    Text(buttonText)
                        .font(TypographyTokens.bodySmBoldNone)
                        .foregroundStyle(CalloutColorTokens.textButtonOrangeFilledDefault)
                        .padding(.horizontal, SpacingTokens.spacing4)
                        .padding(.vertical, SpacingTokens.spacing2)
                        .frame(height: 28)
                        .background(CalloutColorTokens.backgroundActionPrimary)
                        .cornerRadius(BorderTokens.radius999)
                }
                .frame(maxHeight: 44)
                .padding(.vertical, SpacingTokens.spacing2)
            }
        }
        .padding(.leading, SpacingTokens.spacing4)
        .padding(.trailing, buttonText != nil ? SpacingTokens.spacing4 : SpacingTokens.spacing4)
        .padding(.top, SpacingTokens.spacing0)
        .padding(.bottom, SpacingTokens.spacing3)
        .background(backgroundColor)
        .cornerRadius(BorderTokens.radius2xl)
        .shadow(
            color: isFloating ? CalloutColorTokens.shadow200 : .clear,
            radius: isFloating ? 12 : 0,
            x: 0,
            y: isFloating ? 4 : 0
        )
    }
    
    // MARK: - Color Logic
    
    private var backgroundColor: Color {
        switch variant {
        case .neutral:
            return CalloutColorTokens.backgroundContainerTransparent05
        case .inverse:
            return CalloutColorTokens.backgroundSurfaceInverse
        case .brand:
            return CalloutColorTokens.backgroundContainerBrandAccent
        }
    }
    
    private var primaryTextColor: Color {
        switch variant {
        case .neutral, .brand:
            return CalloutColorTokens.textOnContainerPrimary
        case .inverse:
            return CalloutColorTokens.textOnContainerInverse
        }
    }
    
    private var secondaryTextColor: Color {
        switch variant {
        case .neutral:
            return CalloutColorTokens.textOnContainerSecondary
        case .inverse:
            return CalloutColorTokens.textOnContainerInverse
        case .brand:
            return CalloutColorTokens.textOnSurfacePrimary
        }
    }
    
    private var iconColor: Color {
        switch variant {
        case .neutral, .brand:
            return CalloutColorTokens.iconOnSurfacePrimary
        case .inverse:
            return CalloutColorTokens.textOnContainerInverse
        }
    }
}

/// Alert Component
struct Alert: View {
    let title: String?
    let message: String
    let variant: AlertVariant
    let isFloating: Bool
    let onDismiss: (() -> Void)?
    
    init(
        title: String? = nil,
        message: String,
        variant: AlertVariant = .informational,
        isFloating: Bool = false,
        onDismiss: (() -> Void)? = nil
    ) {
        self.title = title
        self.message = message
        self.variant = variant
        self.isFloating = isFloating
        self.onDismiss = onDismiss
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: SpacingTokens.spacing2) {
            // Leading icon
            Image(systemName: iconName)
                .resizable()
                .frame(width: 16, height: 16)
                .foregroundStyle(iconColor)
                .padding(.top, SpacingTokens.spacing4)
            
            // Content
            VStack(alignment: .leading, spacing: SpacingTokens.spacing2) {
                if let title = title {
                    Text(title)
                        .font(TypographyTokens.headingH6SemiboldNone)
                        .foregroundStyle(CalloutColorTokens.textOnContainerPrimary)
                }
                
                Text(message)
                    .font(TypographyTokens.bodySmRegularTight)
                    .foregroundStyle(CalloutColorTokens.textOnContainerPrimary)
            }
            .padding(.top, SpacingTokens.spacing4)
            .padding(.bottom, 6)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            // Close button
            if let onDismiss = onDismiss {
                Button(action: onDismiss) {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .foregroundStyle(CalloutColorTokens.iconOnSurfacePrimary)
                        .frame(width: 36, height: 36)
                        .background(Color.clear)
                        .cornerRadius(BorderTokens.radius999)
                }
                .padding(SpacingTokens.spacing1)
            }
        }
        .padding(.leading, SpacingTokens.spacing2)
        .padding(.trailing, SpacingTokens.spacing0)
        .padding(.top, SpacingTokens.spacing0)
        .padding(.bottom, SpacingTokens.spacing3)
        .background(backgroundColor)
        .overlay(
            RoundedRectangle(cornerRadius: BorderTokens.radius2xl)
                .stroke(CalloutColorTokens.borderOnContainerDefault, lineWidth: BorderTokens.borderWidthXs)
        )
        .cornerRadius(BorderTokens.radius2xl)
        .shadow(
            color: isFloating ? CalloutColorTokens.shadow200 : .clear,
            radius: isFloating ? 12 : 0,
            x: 0,
            y: isFloating ? 4 : 0
        )
    }
    
    // MARK: - Color & Icon Logic
    
    private var backgroundColor: Color {
        switch variant {
        case .informational:
            return CalloutColorTokens.backgroundFeedbackInformationalAccent1
        case .success:
            return CalloutColorTokens.backgroundFeedbackSuccessAccent1
        case .warning:
            return CalloutColorTokens.backgroundFeedbackWarningAccent1
        case .error:
            return CalloutColorTokens.backgroundFeedbackErrorAccent1
        }
    }
    
    private var iconColor: Color {
        switch variant {
        case .informational:
            return CalloutColorTokens.moonlight500
        case .success:
            return CalloutColorTokens.iconOnSurfacePrimary
        case .warning:
            return CalloutColorTokens.lemon200
        case .error:
            return CalloutColorTokens.cinnabar500
        }
    }
    
    private var iconName: String {
        switch variant {
        case .informational:
            return "info.circle"
        case .success:
            return "checkmark.circle"
        case .warning:
            return "exclamationmark.triangle"
        case .error:
            return "exclamationmark.circle"
        }
    }
}

// MARK: - Convenience Variants

/// Informational Alert
struct InformationalAlert: View {
    let title: String?
    let message: String
    let isFloating: Bool
    let onDismiss: (() -> Void)?
    
    init(
        title: String? = nil,
        message: String,
        isFloating: Bool = false,
        onDismiss: (() -> Void)? = nil
    ) {
        self.title = title
        self.message = message
        self.isFloating = isFloating
        self.onDismiss = onDismiss
    }
    
    var body: some View {
        Alert(
            title: title,
            message: message,
            variant: .informational,
            isFloating: isFloating,
            onDismiss: onDismiss
        )
    }
}

/// Success Alert
struct SuccessAlert: View {
    let title: String?
    let message: String
    let isFloating: Bool
    let onDismiss: (() -> Void)?
    
    init(
        title: String? = nil,
        message: String,
        isFloating: Bool = false,
        onDismiss: (() -> Void)? = nil
    ) {
        self.title = title
        self.message = message
        self.isFloating = isFloating
        self.onDismiss = onDismiss
    }
    
    var body: some View {
        Alert(
            title: title,
            message: message,
            variant: .success,
            isFloating: isFloating,
            onDismiss: onDismiss
        )
    }
}

/// Warning Alert
struct WarningAlert: View {
    let title: String?
    let message: String
    let isFloating: Bool
    let onDismiss: (() -> Void)?
    
    init(
        title: String? = nil,
        message: String,
        isFloating: Bool = false,
        onDismiss: (() -> Void)? = nil
    ) {
        self.title = title
        self.message = message
        self.isFloating = isFloating
        self.onDismiss = onDismiss
    }
    
    var body: some View {
        Alert(
            title: title,
            message: message,
            variant: .warning,
            isFloating: isFloating,
            onDismiss: onDismiss
        )
    }
}

/// Error Alert
struct ErrorAlert: View {
    let title: String?
    let message: String
    let isFloating: Bool
    let onDismiss: (() -> Void)?
    
    init(
        title: String? = nil,
        message: String,
        isFloating: Bool = false,
        onDismiss: (() -> Void)? = nil
    ) {
        self.title = title
        self.message = message
        self.isFloating = isFloating
        self.onDismiss = onDismiss
    }
    
    var body: some View {
        Alert(
            title: title,
            message: message,
            variant: .error,
            isFloating: isFloating,
            onDismiss: onDismiss
        )
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
#Preview("Callouts & Alerts") {
    
    func sectionHeader(_ title: String, description: String) -> some View {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing1) {
            Text(title)
                .thdFont(.h5)
                .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)

            Text(description)
                .thdFont(.caption)
                .foregroundStyle(DesignSystemGlobal.TextOnContainerColorTertiary)
        }
    }

    return ScrollView {
        VStack(alignment: .leading, spacing: 24) {
            // Alerts Section
            Text("Alert")
                .thdFont(.hero3)
                .padding(.bottom, 20)
            
            // MARK: - Informational Alerts
            sectionHeader("Informational", description: "Informational alerts for helpful information")
                
            InformationalAlert(
                title: "Alert title (optional)",
                message: "This is helpful information you should know.",
                onDismiss: {}
            )
            
            InformationalAlert(
                title: "Alert title (optional)",
                message: "This is helpful information you should know.",
                isFloating: true,
                onDismiss: {}
            )

            // MARK: - Success Alerts
            sectionHeader("Success", description: "Success alerts for completed actions")
                
            SuccessAlert(
                title: "Alert title (optional)",
                message: "Whatever you did worked.",
                onDismiss: {}
            )

            // MARK: - Warning Alerts
            sectionHeader("Warning", description: "Warning alerts for issues that need attention")
                
            WarningAlert(
                title: "Alert title (optional)",
                message: "There's an issue that you should know about.",
                onDismiss: {}
            )
            
            WarningAlert(
                title: "Alert title (optional)",
                message: "There's an issue that you should know about.",
                isFloating: true,
                onDismiss: {}
            )

            // MARK: - Error Alerts
            sectionHeader("Error", description: "Error alerts for critical issues")
                
            ErrorAlert(
                title: "Alert title (optional)",
                message: "You cannot proceed until you resolve this issue.",
                onDismiss: {}
            )
            
            Divider().padding(.vertical, 20)
            
            // Callouts Section
            Text("Callout")
                .thdFont(.hero3)
                .padding(.bottom, 20)
            
            // MARK: - Neutral Callouts
            sectionHeader("Neutral", description: "Neutral callouts with subtle background")
                
            Callout(
                title: "Callout Title (Optional)",
                subtitle: "Subtitle",
                description: "This is supplementary information.",
                variant: .neutral,
                buttonText: "Button Text",
                onButtonTap: {}
            )
            
            Callout(
                title: "Callout Title (Optional)",
                subtitle: "Subtitle",
                description: "This is supplementary information.",
                variant: .neutral,
                buttonText: "Button Text",
                isFloating: true,
                onButtonTap: {}
            )

            // MARK: - Inverse Callouts
            sectionHeader("Inverse", description: "Dark background callouts with light text")
                
            Callout(
                title: "Callout Title (Optional)",
                subtitle: "Subtitle",
                description: "This is supplementary information.",
                variant: .inverse,
                buttonText: "Button Text",
                onButtonTap: {}
            )
            
            Callout(
                title: "Callout Title (Optional)",
                subtitle: "Subtitle",
                description: "This is supplementary information.",
                variant: .inverse,
                buttonText: "Button Text",
                isFloating: true,
                onButtonTap: {}
            )

            // MARK: - Brand Callouts
            sectionHeader("Brand", description: "Orange accent callouts for promotions")
            
            Callout(
                title: "Callout Title (Optional)",
                subtitle: "Subtitle",
                description: "This is supplementary information.",
                variant: .brand,
                buttonText: "Button Text",
                onButtonTap: {}
            )
            
            Callout(
                title: "Callout Title (Optional)",
                subtitle: "Subtitle",
                description: "This is supplementary information.",
                variant: .brand,
                buttonText: "Button Text",
                isFloating: true,
                onButtonTap: {}
            )
        }
        .padding()
    }
    .background(Color.white)
}
