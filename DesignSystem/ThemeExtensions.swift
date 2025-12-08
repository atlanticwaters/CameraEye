import SwiftUI

// MARK: - Theme Extensions
// This file bridges DesignSystemGlobal tokens with convenient modifiers and extensions
// for consistent theming throughout the app.

// MARK: - AppTheme Convenience Namespace
/// Provides convenient access to common design system values with semantic naming.
/// All values map directly to DesignSystemGlobal tokens.
public struct AppTheme {

    // MARK: - Spacing
    /// Compact spacing (12pt) - tight spacing for dense layouts
    public static let spacingCompact = DesignSystemGlobal.Spacing3

    /// Standard spacing (16pt) - default spacing for most layouts
    public static let spacingStandard = DesignSystemGlobal.Spacing4

    /// Loose spacing (24pt) - generous spacing for open layouts
    public static let spacingLoose = DesignSystemGlobal.Spacing6

    /// Extra loose spacing (32pt) - section separators
    public static let spacingExtraLoose = DesignSystemGlobal.Spacing8

    // MARK: - Corner Radii
    /// Small corner radius (6pt) - subtle rounding
    public static let cornerRadiusSmall = DesignSystemGlobal.BorderRadiusLg

    /// Medium corner radius (8pt) - buttons and cards
    public static let cornerRadiusMedium = DesignSystemGlobal.BorderRadiusXl

    /// Large corner radius (12pt) - containers and modals
    public static let cornerRadiusLarge = DesignSystemGlobal.BorderRadius2xl

    /// Extra large corner radius (16pt) - sheets and overlays
    public static let cornerRadiusExtraLarge = DesignSystemGlobal.BorderRadius3xl

    /// Full corner radius (9999pt) - pills and circular elements
    public static let cornerRadiusFull = DesignSystemGlobal.BorderRadiusFull
}

// MARK: - Color Extensions
/// Convenient color accessors that map to DesignSystemGlobal tokens.
extension Color {

    // MARK: - Text Colors
    /// Primary text color for headings and important content
    public static var textPrimary: Color {
        DesignSystemGlobal.TextOnContainerColorPrimary
    }

    /// Secondary text color for body text and descriptions
    public static var textSecondary: Color {
        DesignSystemGlobal.TextOnContainerColorSecondary
    }

    /// Tertiary text color for captions and metadata
    public static var textTertiary: Color {
        DesignSystemGlobal.TextOnContainerColorTertiary
    }

    /// Inactive text color for disabled states
    public static var textInactive: Color {
        DesignSystemGlobal.TextOnContainerColorInactive
    }

    /// Inverse text color for dark backgrounds
    public static var textInverse: Color {
        DesignSystemGlobal.TextOnContainerColorInverse
    }

    // MARK: - Brand Colors
    /// Primary brand color (orange)
    public static var brandPrimary: Color {
        DesignSystemGlobal.BrandBrand300
    }

    /// Dark brand color (darker orange)
    public static var brandDark: Color {
        DesignSystemGlobal.BrandBrand400
    }

    /// Light brand color (light orange)
    public static var brandLight: Color {
        DesignSystemGlobal.BrandBrand200
    }

    /// Brand accent (very light orange for backgrounds)
    public static var brandAccent: Color {
        DesignSystemGlobal.BrandBrand050
    }

    // MARK: - Background Colors
    /// Surface background (light greige)
    public static var surfaceBackground: Color {
        DesignSystemGlobal.BackgroundSurfaceColorGreige
    }

    /// Container background (white)
    public static var containerBackground: Color {
        DesignSystemGlobal.BackgroundContainerColorWhite
    }

    /// Card background (greige)
    public static var cardBackground: Color {
        DesignSystemGlobal.BackgroundContainerColorGreige
    }

    /// Inverse background (dark)
    public static var inverseBackground: Color {
        DesignSystemGlobal.BackgroundContainerColorInverse
    }
}

// MARK: - Theme Mode Support
/// Defines the available theme modes for the app.
public enum ThemeMode: String, CaseIterable {
    case light = "Light"
    case dark = "Dark"
    case auto = "Auto"

    var colorScheme: ColorScheme? {
        switch self {
        case .light: return .light
        case .dark: return .dark
        case .auto: return nil
        }
    }

    var icon: String {
        switch self {
        case .light: return "sun.max.fill"
        case .dark: return "moon.fill"
        case .auto: return "circle.lefthalf.filled"
        }
    }
}

// MARK: - Theme Manager
/// Observable class that manages the current theme mode.
@Observable
public class ThemeManager {
    public var currentMode: ThemeMode = .auto

    public var preferredColorScheme: ColorScheme? {
        currentMode.colorScheme
    }

    public init(mode: ThemeMode = .auto) {
        self.currentMode = mode
    }
}

// MARK: - Theme Mode Selector View
/// A menu button to switch between theme modes.
public struct ThemeModeSelector: View {
    @Bindable var themeManager: ThemeManager

    public init(themeManager: ThemeManager) {
        self.themeManager = themeManager
    }

    public var body: some View {
        Menu {
            ForEach(ThemeMode.allCases, id: \.self) { mode in
                Button {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        themeManager.currentMode = mode
                    }
                } label: {
                    Label(mode.rawValue, systemImage: mode.icon)
                }
            }
        } label: {
            Image(systemName: themeManager.currentMode.icon)
                .font(.system(size: 18, weight: .medium))
                .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)
                .frame(width: 36, height: 36)
                .background(.ultraThinMaterial)
                .clipShape(Circle())
        }
    }
}

// MARK: - Theme-Aware View Modifiers
extension View {

    /// Applies themed container styling with white background, padding, and corner radius.
    /// Use for cards and content containers.
    public func themedContainer() -> some View {
        self
            .padding(AppTheme.spacingStandard)
            .background(DesignSystemGlobal.BackgroundContainerColorWhite)
            .cornerRadius(AppTheme.cornerRadiusLarge)
    }

    /// Applies themed card styling with greige background and subtle shadow.
    /// Use for elevated cards.
    public func themedCard() -> some View {
        self
            .padding(AppTheme.spacingStandard)
            .background(DesignSystemGlobal.BackgroundContainerColorGreige)
            .cornerRadius(AppTheme.cornerRadiusLarge)
            .shadow(
                color: DesignSystemGlobal.ElevationLow,
                radius: DesignSystemGlobal.ElevationBlurRadiusBlur2,
                x: 0,
                y: DesignSystemGlobal.ElevationPositionY2
            )
    }

    /// Applies the standard app background color.
    /// Use on ScrollViews and main content areas.
    public func themedAppBackground() -> some View {
        self
            .background(DesignSystemGlobal.BackgroundSurfaceColorGreige)
            .ignoresSafeArea()
    }

    /// Applies a glass material background with optional tint.
    /// Use for overlays and floating elements.
    public func glassBackground(
        material: Material = .thinMaterial,
        cornerRadius: CGFloat = AppTheme.cornerRadiusLarge
    ) -> some View {
        self
            .background(material)
            .cornerRadius(cornerRadius)
    }

    /// Applies a branded gradient background.
    /// Use for primary action buttons and highlights.
    public func brandGradientBackground(
        direction: GradientDirection = .leadingToTrailing
    ) -> some View {
        self.background(
            LinearGradient(
                colors: [
                    DesignSystemGlobal.BrandBrand200,
                    DesignSystemGlobal.BrandBrand400
                ],
                startPoint: direction.startPoint,
                endPoint: direction.endPoint
            )
        )
    }
}

// MARK: - Gradient Direction
/// Defines gradient directions for the brandGradientBackground modifier.
public enum GradientDirection {
    case leadingToTrailing
    case trailingToLeading
    case topToBottom
    case bottomToTop

    var startPoint: UnitPoint {
        switch self {
        case .leadingToTrailing: return .leading
        case .trailingToLeading: return .trailing
        case .topToBottom: return .top
        case .bottomToTop: return .bottom
        }
    }

    var endPoint: UnitPoint {
        switch self {
        case .leadingToTrailing: return .trailing
        case .trailingToLeading: return .leading
        case .topToBottom: return .bottom
        case .bottomToTop: return .top
        }
    }
}

// MARK: - Standard Gradients
/// Pre-defined gradients using design system tokens.
public struct DesignGradients {

    /// Brand gradient (light to dark orange)
    public static let brandPrimary = LinearGradient(
        colors: [
            DesignSystemGlobal.BrandBrand200,
            DesignSystemGlobal.BrandBrand400
        ],
        startPoint: .leading,
        endPoint: .trailing
    )

    /// Inverse brand gradient (dark to light orange)
    public static let brandInverse = LinearGradient(
        colors: [
            DesignSystemGlobal.BrandBrand400,
            DesignSystemGlobal.BrandBrand200
        ],
        startPoint: .leading,
        endPoint: .trailing
    )

    /// Neutral gradient (light greige)
    public static let neutralLight = LinearGradient(
        colors: [
            DesignSystemGlobal.GreigeGreige050,
            DesignSystemGlobal.GreigeGreige100
        ],
        startPoint: .leading,
        endPoint: .trailing
    )

    /// Menu selection gradient (used for selected menu items)
    public static let menuSelection = LinearGradient(
        colors: [
            DesignSystemGlobal.BrandBrand200.opacity(0.3),
            DesignSystemGlobal.BrandBrand300.opacity(0.5)
        ],
        startPoint: .leading,
        endPoint: .trailing
    )

    /// Success gradient (green)
    public static let success = LinearGradient(
        colors: [
            DesignSystemGlobal.BottleGreenBottleGreen300,
            DesignSystemGlobal.BottleGreenBottleGreen500
        ],
        startPoint: .leading,
        endPoint: .trailing
    )

    /// Informational gradient (blue)
    public static let informational = LinearGradient(
        colors: [
            DesignSystemGlobal.MoonlightMoonlight300,
            DesignSystemGlobal.MoonlightMoonlight500
        ],
        startPoint: .leading,
        endPoint: .trailing
    )
}
