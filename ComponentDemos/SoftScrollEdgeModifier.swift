import SwiftUI

// MARK: - Soft Scroll Edge Modifier
/// A reusable modifier that applies soft scroll edge effects to content views.
/// This ensures consistent edge treatment across all app content that appears
/// between the top and bottom navigation elements.
struct SoftScrollEdgeModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scrollEdgeEffectStyle(.automatic, for: .vertical)
    }
}

// MARK: - Enhanced Soft Scroll Edge Modifier
/// Enhanced modifier that creates a taller, more prominent scroll edge fade effect
/// by adding gradient overlays at the top and bottom edges.
struct EnhancedSoftScrollEdgeModifier: ViewModifier {
    let topFadeHeight: CGFloat
    let bottomFadeHeight: CGFloat
    
    init(topFadeHeight: CGFloat = 50, bottomFadeHeight: CGFloat = 150) {
        self.topFadeHeight = topFadeHeight
        self.bottomFadeHeight = bottomFadeHeight
    }
    
    func body(content: Content) -> some View {
        content
            .scrollEdgeEffectStyle(.automatic, for: .vertical)
            .overlay(alignment: .top) {
                // Top gradient fade
                LinearGradient(
                    colors: [
                        DesignSystemGlobal.BackgroundSurfaceColorGreige,
                        DesignSystemGlobal.BackgroundSurfaceColorGreige.opacity(0.8),
                        .clear
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .frame(height: topFadeHeight)
                .ignoresSafeArea()
                .allowsHitTesting(false)
            }
            .overlay(alignment: .bottom) {
                // Bottom gradient fade
                LinearGradient(
                    colors: [
                        .clear,
                        DesignSystemGlobal.BackgroundSurfaceColorGreige.opacity(0.8),
                        DesignSystemGlobal.BackgroundSurfaceColorGreige
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .frame(height: bottomFadeHeight)
                .ignoresSafeArea()
                .allowsHitTesting(false)
            }
    }
}

// MARK: - View Extensions
extension View {
    /// Applies standard soft scroll edge effects to the view.
    /// Use this on any ScrollView or content that should have smooth edge transitions.
    ///
    /// Example:
    /// ```swift
    /// ScrollView {
    ///     // Your content
    /// }
    /// .applySoftScrollEdges()
    /// ```
    func applySoftScrollEdges() -> some View {
        modifier(SoftScrollEdgeModifier())
    }
    
    /// Applies enhanced soft scroll edge effects with taller gradient fades.
    /// This creates a more prominent fade effect that extends further behind navigation bars.
    ///
    /// - Parameters:
    ///   - topFadeHeight: Height of the top fade gradient (default: 120pt)
    ///   - bottomFadeHeight: Height of the bottom fade gradient (default: 150pt)
    ///
    /// Example:
    /// ```swift
    /// ScrollView {
    ///     // Your content
    /// }
    /// .applyEnhancedScrollEdges()
    /// ```
    func applyEnhancedScrollEdges(topFadeHeight: CGFloat = 120, bottomFadeHeight: CGFloat = 150) -> some View {
        modifier(EnhancedSoftScrollEdgeModifier(topFadeHeight: topFadeHeight, bottomFadeHeight: bottomFadeHeight))
    }
}
