import SwiftUI

// MARK: - Design Materials
// This file defines material and glass effect tokens for the THD Design System.
// These provide consistent visual treatments for overlays, cards, and navigation.

// MARK: - Material Definitions
/// Standard material definitions for glass morphism effects.
/// These wrap SwiftUI's native Material types with semantic naming.
public struct DesignMaterials {

    // MARK: - Glass Materials (Background)
    /// Ultra thin glass - maximum transparency, minimal blur
    /// Use for: Subtle overlays, hints at depth
    public static let glassUltraThin: Material = .ultraThinMaterial

    /// Thin glass - balanced transparency and blur
    /// Use for: Navigation bars, floating cards, tooltips
    public static let glassThin: Material = .thinMaterial

    /// Regular glass - moderate opacity and blur
    /// Use for: Modal backgrounds, sheets, sidebars
    public static let glassRegular: Material = .regularMaterial

    /// Thick glass - more opaque, strong blur
    /// Use for: Prominent overlays, alert backgrounds
    public static let glassThick: Material = .thickMaterial

    /// Ultra thick glass - maximum opacity
    /// Use for: Full-screen overlays, loading states
    public static let glassUltraThick: Material = .ultraThickMaterial

    // MARK: - Bar Materials
    /// System bar material - adapts to navigation/tab bars
    public static let systemBar: Material = .bar
}

// MARK: - Glass Style Definitions
/// Pre-configured glass styles combining materials with other visual properties.
public struct GlassStyle {
    public let material: Material
    public let cornerRadius: CGFloat
    public let shadowColor: Color
    public let shadowRadius: CGFloat
    public let shadowY: CGFloat

    // MARK: - Predefined Styles

    /// Navigation style - thin glass for navigation elements
    public static let navigation = GlassStyle(
        material: .thinMaterial,
        cornerRadius: DesignSystemGlobal.BorderRadius2xl,
        shadowColor: DesignSystemGlobal.ElevationLow,
        shadowRadius: DesignSystemGlobal.ElevationBlurRadiusBlur2,
        shadowY: DesignSystemGlobal.ElevationPositionY2
    )

    /// Card style - regular glass for floating cards
    public static let card = GlassStyle(
        material: .regularMaterial,
        cornerRadius: DesignSystemGlobal.BorderRadiusXl,
        shadowColor: DesignSystemGlobal.ElevationMed,
        shadowRadius: DesignSystemGlobal.ElevationBlurRadiusBlur3,
        shadowY: DesignSystemGlobal.ElevationPositionY3
    )

    /// Sheet style - thick glass for modal sheets
    public static let sheet = GlassStyle(
        material: .thickMaterial,
        cornerRadius: DesignSystemGlobal.BorderRadius3xl,
        shadowColor: DesignSystemGlobal.ElevationHigh,
        shadowRadius: DesignSystemGlobal.ElevationBlurRadiusBlur4,
        shadowY: DesignSystemGlobal.ElevationPositionY4
    )

    /// Overlay style - ultra thin for subtle overlays
    public static let overlay = GlassStyle(
        material: .ultraThinMaterial,
        cornerRadius: DesignSystemGlobal.BorderRadiusLg,
        shadowColor: DesignSystemGlobal.ElevationLowest,
        shadowRadius: DesignSystemGlobal.ElevationBlurRadiusBlur1,
        shadowY: DesignSystemGlobal.ElevationPositionY1
    )

    /// Pill style - thin glass with full corner radius
    public static let pill = GlassStyle(
        material: .thinMaterial,
        cornerRadius: DesignSystemGlobal.BorderRadiusFull,
        shadowColor: DesignSystemGlobal.ElevationLow,
        shadowRadius: DesignSystemGlobal.ElevationBlurRadiusBlur2,
        shadowY: DesignSystemGlobal.ElevationPositionY1
    )

    /// Tab bar style - bar material for bottom navigation
    public static let tabBar = GlassStyle(
        material: .bar,
        cornerRadius: 0,
        shadowColor: DesignSystemGlobal.ElevationMed,
        shadowRadius: DesignSystemGlobal.ElevationBlurRadiusBlur3,
        shadowY: -DesignSystemGlobal.ElevationPositionY2
    )
}

// MARK: - Glass View Modifier
/// A view modifier that applies a complete glass style.
public struct GlassModifier: ViewModifier {
    let style: GlassStyle

    public func body(content: Content) -> some View {
        content
            .background(style.material)
            .cornerRadius(style.cornerRadius)
            .shadow(
                color: style.shadowColor,
                radius: style.shadowRadius,
                x: 0,
                y: style.shadowY
            )
    }
}

// MARK: - View Extension for Glass Styles
extension View {

    /// Applies a predefined glass style to the view.
    /// - Parameter style: The GlassStyle to apply
    /// - Returns: The view with the glass style applied
    public func glassStyle(_ style: GlassStyle) -> some View {
        modifier(GlassModifier(style: style))
    }

    /// Applies navigation glass styling.
    /// Use for floating navigation elements, toolbars, and action bars.
    public func navigationGlass() -> some View {
        glassStyle(.navigation)
    }

    /// Applies card glass styling.
    /// Use for floating cards and elevated content.
    public func cardGlass() -> some View {
        glassStyle(.card)
    }

    /// Applies sheet glass styling.
    /// Use for modal sheets and bottom sheets.
    public func sheetGlass() -> some View {
        glassStyle(.sheet)
    }

    /// Applies overlay glass styling.
    /// Use for subtle overlays and tooltips.
    public func overlayGlass() -> some View {
        glassStyle(.overlay)
    }

    /// Applies pill glass styling.
    /// Use for pill-shaped floating elements.
    public func pillGlass() -> some View {
        glassStyle(.pill)
    }

    /// Applies tab bar glass styling.
    /// Use for bottom navigation bars.
    public func tabBarGlass() -> some View {
        glassStyle(.tabBar)
    }
}

// MARK: - Glass Container View
/// A reusable container view with glass styling.
public struct GlassContainer<Content: View>: View {
    let style: GlassStyle
    let content: Content

    public init(
        style: GlassStyle = .card,
        @ViewBuilder content: () -> Content
    ) {
        self.style = style
        self.content = content()
    }

    public var body: some View {
        content
            .glassStyle(style)
    }
}

// MARK: - Gradient Over Glass View
/// A view that combines a gradient with glass material for menu items and selections.
public struct GradientGlassBackground: View {
    let gradient: LinearGradient
    let material: Material

    public init(
        gradient: LinearGradient = DesignGradients.menuSelection,
        material: Material = .ultraThinMaterial
    ) {
        self.gradient = gradient
        self.material = material
    }

    public var body: some View {
        ZStack {
            material
            gradient
        }
    }
}

// MARK: - Selected Menu Item Background
/// A pre-configured view for selected menu item backgrounds.
/// Combines brand gradient with glass material.
public struct SelectedMenuBackground: View {

    public init() {}

    public var body: some View {
        GradientGlassBackground(
            gradient: DesignGradients.menuSelection,
            material: .ultraThinMaterial
        )
    }
}

// MARK: - Preview
#Preview("Glass Styles") {
    ScrollView {
        VStack(spacing: 24) {
            Text("Glass Styles")
                .font(.largeTitle)
                .fontWeight(.bold)

            // Navigation Glass
            HStack {
                Image(systemName: "house.fill")
                Text("Navigation Glass")
                Spacer()
            }
            .padding()
            .navigationGlass()

            // Card Glass
            VStack(alignment: .leading, spacing: 8) {
                Text("Card Glass")
                    .font(.headline)
                Text("Use for floating cards and elevated content.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .cardGlass()

            // Sheet Glass
            VStack(alignment: .leading, spacing: 8) {
                Text("Sheet Glass")
                    .font(.headline)
                Text("Use for modal sheets and bottom sheets.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .sheetGlass()

            // Pill Glass
            Text("Pill Glass")
                .font(.subheadline)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .pillGlass()

            // Gradient Glass Background
            HStack {
                Image(systemName: "checkmark")
                Text("Selected Item")
            }
            .padding()
            .background(SelectedMenuBackground())
            .cornerRadius(12)
        }
        .padding()
    }
    .background(
        LinearGradient(
            colors: [.orange.opacity(0.3), .purple.opacity(0.3)],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    )
}
