import SwiftUI

// MARK: - Design System Type Alias
private typealias DS = DesignSystemGlobal

// MARK: - Bottom Tab Bar View (Liquid Glass)
/// Custom bottom navigation with liquid glass design and delayed color transitions
struct BottomTabBar<TabType: TabBarItem>: View {
    @Binding var selectedTab: TabType
    @State private var animatedTab: TabType?
    
    // Namespace for matched geometry effect - enables the liquid glass morph animation
    @Namespace private var tabNamespace
    
    // MARK: - Design System Values
    private let activeColor = DS.BrandBrand300 // Orange for active state
    private let inactiveColor = DS.IconOnContainerColorInactive // Gray for inactive state
    private let pillBackground = Color.white.opacity(0.5) // Translucent white for pill container
    private let glassBackground = DS.GreigeGreige200.opacity(0.5) // Darker greige for active indicator
    private let strokeColor = Color.white.opacity(0.6) // Reflective white stroke
    
    private let iconSize: CGFloat = DS.Spacing6 // 24pt - icon size
    private let labelSize: CGFloat = DS.FontFontSizeCaption // 11pt - label text size
    private let tabHeight: CGFloat = DS.Spacing18 // 72pt - tab container height
    private let indicatorPadding: CGFloat = DS.Spacing3 // 12pt - padding inside pill
    private let horizontalPadding: CGFloat = DS.Spacing4 // 16pt - outer horizontal padding
    private let verticalPadding: CGFloat = DS.Spacing6 // 24pt - outer vertical padding
    private let labelSpacing: CGFloat = DS.Spacing1 // 4pt - space between icon and label
    
    // Shadow for liquid glass effect
    private let shadowColor = Color.black.opacity(0.1)
    private let shadowRadius: CGFloat = 8
    private let shadowY: CGFloat = 3

    var body: some View {
        HStack(spacing: 0) {
            ForEach(Array(TabType.allCases), id: \.id) { tab in
                tabButton(for: tab)
            }
        }
        .padding(indicatorPadding)
        .background(
            Capsule()
                .fill(.clear)
                .glassEffect(.regular, in: .capsule)
                .shadow(color: shadowColor, radius: shadowRadius, x: 0, y: shadowY)
        )
        .padding(.horizontal, horizontalPadding)
        .padding(.top, verticalPadding)
        .padding(.bottom, 0) // Sits above safe area
        .onAppear {
            animatedTab = selectedTab
        }
    }
    
    // MARK: - Individual Tab Button
    /// A single tab with icon, label, and optional liquid glass background indicator
    private func tabButton(for tab: TabType) -> some View {
        let isSelected = selectedTab.id == tab.id
        let isAnimatedSelected = animatedTab?.id == tab.id
        
        return Button(action: {
            withAnimation(.spring(response: 0.35, dampingFraction: 0.75)) {
                selectedTab = tab
            }
            // Delay color change until after pill animation starts
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                withAnimation(.easeOut(duration: 0.2)) {
                    animatedTab = tab
                }
            }
        }) {
            VStack(spacing: labelSpacing) {
                Image(tab.iconName)
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: iconSize, height: iconSize)
                
                Text(tab.title)
                    .font(.system(size: labelSize, weight: .medium))
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
            }
            .foregroundStyle(isAnimatedSelected ? activeColor : inactiveColor)
            .frame(maxWidth: .infinity)
            .frame(height: tabHeight - (indicatorPadding * 2))
            .background {
                if isSelected {
                    // Liquid glass morphing background indicator
                    Capsule()
                        .fill(glassBackground)
                        .overlay(
                            Capsule()
                                .strokeBorder(Color.white.opacity(0.4), lineWidth: 1)
                        )
                        .glassEffect(.regular, in: .capsule)
                        .shadow(
                            color: isAnimatedSelected ? shadowColor : .clear,
                            radius: shadowRadius,
                            x: 0,
                            y: shadowY
                        )
                        .matchedGeometryEffect(id: "tabIndicator", in: tabNamespace)
                }
            }
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Tab Bar Item Protocol
/// Protocol that tab enums must conform to for use with BottomTabBar
protocol TabBarItem: CaseIterable, Identifiable, Equatable {
    var title: String { get }
    var iconName: String { get }
}

// MARK: - Preview
#Preview("Bottom Tab Bar") {
    // Example tab enum for preview
    enum PreviewTab: Int, TabBarItem {
        case home = 0
        case shop = 1
        case profile = 2
        case cart = 3
        
        var id: Int { rawValue }
        
        var title: String {
            switch self {
            case .home: return "Home"
            case .shop: return "Shop"
            case .profile: return "Profile"
            case .cart: return "Cart"
            }
        }
        
        var iconName: String {
            switch self {
            case .home: return "logo"
            case .shop: return "Bucket"
            case .profile: return "Profile"
            case .cart: return "Cart"
            }
        }
    }
    
    struct PreviewWrapper: View {
        @State private var selectedTab: PreviewTab = .home
        
        var body: some View {
            ZStack {
                DS.BackgroundSurfaceColorGreige
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    BottomTabBar(selectedTab: $selectedTab)
                }
            }
        }
    }
    
    return PreviewWrapper()
}

// MARK: - Design & Implementation Notes
/*
 LIQUID GLASS BOTTOM TAB BAR
 
 This tab bar implementation features:
 
 ✨ ENHANCED ANIMATIONS:
 - Pill background slides immediately to new position
 - Icon/label color changes after 0.15s delay (when pill is halfway)
 - Color transition completes in 0.2s with ease-out timing
 - Darker greige pill background (GreigeGreige200 vs GreigeGreige100)
 
 ✨ LIQUID GLASS EFFECTS:
 - Translucent pill container with glass effect
 - 1px reflective white stroke (40% opacity) around active pill
 - Darker greige active indicator (GreigeGreige200 at 70% opacity)
 - Smooth spring animations using matchedGeometryEffect
 - Subtle drop shadow for elevation
 
 🎨 DESIGN SYSTEM INTEGRATION:
 - Active indicator: GreigeGreige200 (70% opacity) - darker than before
 - Active text/icons: Orange (Brand-300)
 - Inactive text/icons: Gray (IconOnContainerColorInactive)
 - Stroke: Reflective white (40% opacity, 1px)
 - All spacing and sizing uses DesignSystemGlobal tokens
 
 🔄 GENERIC IMPLEMENTATION:
 - Works with any enum conforming to TabBarItem protocol
 - Requires: CaseIterable, Identifiable, Equatable
 - Provides: title and iconName properties
 
 📱 RESPONSIVE LAYOUT:
 - Tabs distribute evenly across the width
 - Icons and labels with proper spacing
 - Handles safe area insets automatically
 
 USAGE EXAMPLE:
 
 ```swift
 enum AppTab: Int, TabBarItem {
     case home = 0
     case shop = 1
     
     var id: Int { rawValue }
     var title: String { ... }
     var iconName: String { ... }
 }
 
 BottomTabBar<AppTab>(selectedTab: $selectedTab)
 ```
*/
