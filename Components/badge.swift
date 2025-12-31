import SwiftUI

// MARK: - Badge Component System
// THD App Design System - Badge Components
//
// This file contains Badge, BadgeAlt (Rating Badge), and BadgeIndicator components
// that use DesignSystemGlobal tokens for consistent styling.
//
// Components:
// - Badge: Standard badge with text and variant styling
// - BadgeAlt: Rating badge with label, rating value, and star icon
// - BadgeIndicator: Small circular indicator dot
//
// Design System Integration:
// - Colors: Uses semantic color tokens from DesignSystemGlobal
// - Spacing: Uses Spacing* tokens
// - Border: Uses BorderRadius*, BorderWidth* tokens
// - Typography: Uses FontFontSize* tokens

// MARK: - Badge Variant Styles
/// Badge variant styles matching the design system specifications.
///
/// Each variant affects the badge's background and text color treatment.
enum THDBadgeVariant {
    /// Outline style - transparent background with colored border and text
    case outline

    /// Filled subtle - light background with dark text
    case filledSubtle

    /// Filled strong - dark/vibrant background with inverse text
    case filledStrong
}

// MARK: - Badge Color Options
/// Badge color options mapped to design system color palettes.
///
/// Each color option provides colors for outline text, subtle background/text,
/// strong background, and indicator colors.
enum THDBadgeColor {
    /// Moonlight (Teal/Blue) - Informational context
    case info

    /// Bottle Green - Success context
    case success

    /// Lemon (Yellow) - Warning context
    case warning

    /// Cinnabar (Red) - Danger/Error context
    case danger

    /// Greige (Gray) - Neutral/Medium emphasis
    case medium

    /// Greige 900 (Black) - Primary/High emphasis
    case primary

    /// Brand (Orange) - Brand accent
    case brand

    // MARK: - Color Token Accessors

    /// Text color for outline variant
    /// Uses DesignSystemGlobal Moonlight/BottleGreen/Lemon/Cinnabar/Greige/Brand tokens
    func outlineTextColor() -> Color {
        switch self {
        case .info: return DesignSystemGlobal.MoonlightMoonlight500
        case .success: return DesignSystemGlobal.BottleGreenBottleGreen700
        case .warning: return DesignSystemGlobal.LemonLemon200
        case .danger: return DesignSystemGlobal.CinnabarCinnabar600
        case .medium: return DesignSystemGlobal.GreigeGreige600
        case .primary: return DesignSystemGlobal.GreigeGreige900
        case .brand: return DesignSystemGlobal.BrandBrand300
        }
    }

    /// Background color for filledSubtle variant
    func subtleBackgroundColor() -> Color {
        switch self {
        case .info: return DesignSystemGlobal.MoonlightMoonlight100
        case .success: return DesignSystemGlobal.BottleGreenBottleGreen100
        case .warning: return DesignSystemGlobal.BackgroundFeedbackColorWarningAccent1
        case .danger: return DesignSystemGlobal.CinnabarCinnabar100
        case .medium: return DesignSystemGlobal.GreigeGreige100
        case .primary: return DesignSystemGlobal.GreigeGreige100
        case .brand: return DesignSystemGlobal.BrandBrand100
        }
    }

    /// Text color for filledSubtle variant
    func subtleTextColor() -> Color {
        switch self {
        case .info: return DesignSystemGlobal.MoonlightMoonlight800
        case .success: return DesignSystemGlobal.BottleGreenBottleGreen700
        case .warning: return DesignSystemGlobal.LemonLemon900
        case .danger: return DesignSystemGlobal.CinnabarCinnabar700
        case .medium: return DesignSystemGlobal.GreigeGreige900
        case .primary: return DesignSystemGlobal.GreigeGreige900
        case .brand: return DesignSystemGlobal.BrandBrand800
        }
    }

    /// Background color for filledStrong variant
    func strongBackgroundColor() -> Color {
        switch self {
        case .info: return DesignSystemGlobal.MoonlightMoonlight500
        case .success: return DesignSystemGlobal.BottleGreenBottleGreen600
        case .warning: return DesignSystemGlobal.LemonLemon500
        case .danger: return DesignSystemGlobal.CinnabarCinnabar600
        case .medium: return DesignSystemGlobal.GreigeGreige600
        case .primary: return DesignSystemGlobal.GreigeGreige900
        case .brand: return DesignSystemGlobal.BrandBrand300
        }
    }

    /// Indicator color for strong emphasis
    func indicatorStrongColor() -> Color {
        switch self {
        case .info: return DesignSystemGlobal.BackgroundFeedbackColorInformationalAccent2
        case .success: return DesignSystemGlobal.BackgroundFeedbackColorSuccessAccent2
        case .warning: return DesignSystemGlobal.BackgroundFeedbackColorWarningAccent2
        case .danger: return DesignSystemGlobal.BackgroundFeedbackColorErrorAccent2
        case .medium: return DesignSystemGlobal.GreigeGreige600
        case .primary: return DesignSystemGlobal.GreigeGreige900
        case .brand: return DesignSystemGlobal.BrandBrand300
        }
    }

    /// Indicator color for subtle emphasis
    func indicatorSubtleColor() -> Color {
        switch self {
        case .info: return DesignSystemGlobal.BackgroundFeedbackColorInformationalAccent1
        case .success: return DesignSystemGlobal.BackgroundFeedbackColorSuccessAccent1
        case .warning: return DesignSystemGlobal.BackgroundFeedbackColorWarningAccent1
        case .danger: return DesignSystemGlobal.BackgroundFeedbackColorErrorAccent1
        case .medium: return DesignSystemGlobal.GreigeGreige100
        case .primary: return DesignSystemGlobal.GreigeGreige100
        case .brand: return DesignSystemGlobal.BrandBrand100
        }
    }
}

// MARK: - Badge Size Options
/// Badge size options with corresponding height and typography.
enum THDBadgeSize {
    /// Small badge - 16pt height
    case small

    /// Base/Default badge - 20pt height
    case base

    /// Font for badge text using design system custom fonts
    var fontSize: Font {
        switch self {
        case .small:
            return .thdBodyXs
        case .base:
            return .thdBodySm
        }
    }

    /// Badge height
    var height: CGFloat {
        switch self {
        case .small: return 16
        case .base: return 20
        }
    }

    /// Horizontal padding
    var horizontalPadding: CGFloat {
        DesignSystemGlobal.Spacing1
    }
}

// MARK: - Badge Component
/// Standard badge component using DesignSystemGlobal tokens.
///
/// Displays a small label with various styling options for categorization,
/// status indication, or labeling content.
///
/// ## Usage Example:
/// ```swift
/// Badge("New", variant: .filledStrong, color: .brand)
/// Badge("Sale", variant: .outline, color: .danger)
/// ```
///
/// ## Design System Tokens Used:
/// - Colors: Moonlight*, BottleGreen*, Lemon*, Cinnabar*, Greige*, Brand* palettes
/// - Border: BorderRadiusLg, BorderWidthXs
/// - Spacing: Spacing1
struct Badge: View {
    let text: String
    let variant: THDBadgeVariant
    let color: THDBadgeColor
    let size: THDBadgeSize

    init(
        _ text: String,
        variant: THDBadgeVariant = .outline,
        color: THDBadgeColor = .primary,
        size: THDBadgeSize = .base
    ) {
        self.text = text
        self.variant = variant
        self.color = color
        self.size = size
    }

    var body: some View {
        Text(text)
            .font(size.fontSize)
            .foregroundStyle(foregroundColor)
            .padding(.horizontal, size.horizontalPadding)
            .padding(.vertical, 0)
            .frame(minWidth: size.height, minHeight: size.height, maxHeight: size.height)
            .background(backgroundColor)
            .cornerRadius(DesignSystemGlobal.BorderRadiusLg)
            .overlay(
                RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusLg)
                    .stroke(borderColor, lineWidth: variant == .outline ? DesignSystemGlobal.BorderWidthXs : 0)
            )
    }

    // MARK: - Color Logic

    /// Foreground/text color based on variant
    private var foregroundColor: Color {
        switch variant {
        case .outline:
            return color.outlineTextColor()
        case .filledSubtle:
            return color.subtleTextColor()
        case .filledStrong:
            return DesignSystemGlobal.TextOnContainerColorInverse
        }
    }

    /// Background color based on variant
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

    /// Border color - only visible for outline variant
    private var borderColor: Color {
        variant == .outline ? color.outlineTextColor() : .clear
    }
}

// MARK: - BadgeAlt (Rating Badge) Component
/// Rating badge component with label, rating value, and star icon.
///
/// Displays a "Top Rated" style badge with a numeric rating and star icon.
/// Uses DesignSystemGlobal tokens for consistent styling.
///
/// ## Usage Example:
/// ```swift
/// BadgeAlt(label: "Top Rated", rating: "4.5")
/// ```
struct BadgeAlt: View {
    let label: String
    let rating: String

    init(label: String = "Top Rated", rating: String = "4.5") {
        self.label = label
        self.rating = rating
    }

    var body: some View {
        HStack(spacing: DesignSystemGlobal.Spacing1) {
            // Text Labels
            HStack(spacing: DesignSystemGlobal.Spacing1) {
                // Primary label - Body Lg with custom font
                Text(label)
                    .font(.thdBodyLg)
                    .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)

                // Rating value - Body Lg with custom font
                Text(rating)
                    .font(.thdBodyLg)
                    .foregroundStyle(DesignSystemGlobal.TextOnContainerColorSecondary)
            }

            // Star Filled icon
            Image(systemName: "star.fill")
                .resizable()
                .frame(width: 16, height: 16)
                .foregroundStyle(DesignSystemGlobal.BrandBrand300)
        }
        .padding(.horizontal, DesignSystemGlobal.Spacing1)
        .padding(.vertical, 6)
        .frame(minHeight: 32)
        .background(DesignSystemGlobal.GreigeGreige100.opacity(0.5))
        .cornerRadius(DesignSystemGlobal.BorderRadiusLg)
    }
}

// MARK: - BadgeIndicator Component
/// Small circular indicator dot component.
///
/// A simple dot indicator for showing status or notifications.
/// Uses DesignSystemGlobal color tokens.
///
/// ## Usage Example:
/// ```swift
/// BadgeIndicator(color: .brand, size: .base, emphasis: .strong)
/// BadgeIndicator(color: .success, size: .regular, emphasis: .subtle)
/// ```
struct BadgeIndicator: View {
    let color: THDBadgeColor
    let size: IndicatorSize
    let emphasis: BadgeEmphasis

    /// Indicator size options
    enum IndicatorSize {
        /// Small indicator - 8pt diameter
        case base

        /// Regular indicator - 12pt diameter
        case regular

        var diameter: CGFloat {
            switch self {
            case .base: return 8
            case .regular: return 12
            }
        }
    }

    /// Indicator emphasis level
    enum BadgeEmphasis {
        /// Strong/vibrant color
        case strong

        /// Subtle/muted color
        case subtle
    }

    init(
        color: THDBadgeColor = .brand,
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

    /// Fill color based on color option and emphasis
    private var fillColor: Color {
        switch emphasis {
        case .strong:
            return color.indicatorStrongColor()
        case .subtle:
            return color.indicatorSubtleColor()
        }
    }
}

// MARK: - Previews
#Preview("Badge Variants") {
    
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
            // Title
            Text("Badge")
                .thdFont(.hero3)
                .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)
                .padding(.bottom, 20)

            // MARK: - Badge Indicators
            sectionHeader("Indicators", description: "Small circular badge indicators")

            HStack(spacing: 16) {
                BadgeIndicator(color: .info, size: .base, emphasis: .strong)
                BadgeIndicator(color: .info, size: .regular, emphasis: .strong)
                BadgeIndicator(color: .info, size: .base, emphasis: .subtle)
                BadgeIndicator(color: .info, size: .regular, emphasis: .subtle)
            }

            // MARK: - Rating Badge
            sectionHeader("Rating Badge", description: "Badge for displaying ratings")

            BadgeAlt()

            // MARK: - Outline Badges
            sectionHeader("Outline Badges", description: "Badges with visible border")

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

            // MARK: - Filled Subtle Badges
            sectionHeader("Filled Subtle Badges", description: "Badges with subtle filled background")

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

            // MARK: - Filled Strong Badges
            sectionHeader("Filled Strong Badges", description: "Badges with strong filled background")

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
        .padding()
    }
    .background(DesignSystemGlobal.BackgroundContainerColorWhite)
}
