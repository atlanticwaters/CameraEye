import SwiftUI

// MARK: - Design System Type Alias
private typealias DS = DesignSystemGlobal

// MARK: - Tab Selection Enum
/// Represents the available tabs in the bottom navigation
enum AppTab: Int, CaseIterable, Identifiable, TabBarItem {
    case home = 0
    case shop = 1
    case name = 2
    case storeMode = 3
    case cart = 4
    
    var id: Int { rawValue }
    
    var title: String {
        switch self {
        case .home: return "Home"
        case .shop: return "Shop"
        case .name: return "Name"
        case .storeMode: return "Store Mode"
        case .cart: return "Cart"
        }
    }
    
    /// The name of the icon in the asset catalog
    var iconName: String {
        switch self {
        case .home: return "logo"
        case .shop: return "Bucket"
        case .name: return "Profile"
        case .storeMode: return "Store"
        case .cart: return "Cart"
        }
    }
}

// MARK: - App Navigation View
/// Main navigation coordinator that manages app-wide navigation state
/// and connects the top nav, bottom nav, and content views.
struct AppNavigationView: View {
    // MARK: - State
    @State private var selectedTab: AppTab = .home
    @State private var showBackButton: Bool = false
    
    var body: some View {
        ZStack {
            // Content area - fills entire screen
            contentView
                .ignoresSafeArea() // Allow content to extend to all edges
            
            // Navigation overlays - transparent, floating on top of content
            VStack(spacing: 0) {
                // Top Navigation - transparent with glass effect buttons
                AppTopNavigation(
                    showBackButton: showBackButton,
                    onBackTapped: {
                        withAnimation {
                            showBackButton = false
                        }
                    }
                )
                
                Spacer()
                
                // Bottom Navigation - liquid glass tab bar
                BottomTabBar(selectedTab: $selectedTab)
            }
        }
        .onChange(of: selectedTab) { oldValue, newValue in
            // Reset back button when switching tabs
            withAnimation {
                showBackButton = false
            }
        }
    }
    
    // MARK: - Content View
    @ViewBuilder
    private var contentView: some View {
        ZStack {
            switch selectedTab {
            case .home:
                TypographyDemoView()
                    .id(AppTab.home)
                    .applyEnhancedScrollEdges()
                
            case .shop:
                ProductListingPage()
                    .id(AppTab.shop)
                    .applyEnhancedScrollEdges()
                
            case .name:
                ComponentCatalogView(showBackButton: $showBackButton)
                    .id(AppTab.name)
                    // ComponentCatalogView applies its own scroll edges to its NavigationStack
                
            case .storeMode:
                PlaceholderView(title: "Store Mode", icon: "storefront")
                    .id(AppTab.storeMode)
                    .applyEnhancedScrollEdges()
                
            case .cart:
                PlaceholderView(title: "Cart", icon: "cart")
                    .id(AppTab.cart)
                    .applyEnhancedScrollEdges()
            }
        }
    }
}

// MARK: - App Top Navigation
/// Custom top navigation component that integrates with the back button
struct AppTopNavigation: View {
    let showBackButton: Bool
    let onBackTapped: () -> Void
    
    @State private var isSearching = false
    @State private var searchText = ""
    
    // Namespace for matched geometry effect
    @Namespace private var morphNamespace
    
    // MARK: - Sizing from Design System
    private let buttonSize = DS.Spacing11
    private let iconSize = DS.FontFontSizeBodyXl
    private let searchIconSize = DS.Spacing4
    private let closeIconSize = DS.FontFontSizeBodyLg
    
    // MARK: - Spacing from Design System
    private let buttonSpacing = DS.Spacing2
    private let containerSpacing = DS.Spacing3
    private let horizontalPadding = DS.Spacing4
    private let verticalPadding = DS.Spacing3
    private let searchBarPadding = DS.Spacing4
    private let searchBarSpacing = DS.Spacing3
    
    // MARK: - Colors from Design System
    private let iconColor = DS.TextOnSurfaceColorPrimary
    private let iconColorSecondary = DS.TextOnSurfaceColorTertiary
    private let backgroundColor = DS.BackgroundContainerColorWhite
    
    // MARK: - Elevation from Design System
    private let shadowColor = DS.Shadow100
    private let shadowRadius = DS.ElevationBlurRadiusBlur2
    private let shadowY = DS.ElevationPositionY2
    
    var body: some View {
        HStack(spacing: containerSpacing) {
            // Back button - conditionally shown
            if showBackButton {
                backButton
                    .transition(.opacity.combined(with: .scale))
            }
            
            if isSearching {
                // Search bar state
                searchBar
                    .transition(.opacity.combined(with: .scale(scale: 0.95)))
            } else {
                Spacer()
                
                // Action buttons state
                actionButtons
                    .transition(.opacity.combined(with: .scale(scale: 0.95)))
            }
        }
        .padding(.horizontal, horizontalPadding)
        .padding(.vertical, verticalPadding)
        .animation(.spring(response: 0.4, dampingFraction: 0.8), value: isSearching)
        .animation(.spring(response: 0.3, dampingFraction: 0.8), value: showBackButton)
    }
    
    // MARK: - Back Button
    private var backButton: some View {
        Button(action: onBackTapped) {
            Image(systemName: "chevron.left")
                .font(.system(size: iconSize, weight: .medium))
                .foregroundStyle(iconColor)
                .frame(width: buttonSize, height: buttonSize)
                .background(
                    Circle()
                        .fill(.clear)
                        .glassEffect(.regular, in: .circle)
                        .shadow(color: shadowColor, radius: shadowRadius, x: 0, y: shadowY)
                )
        }
    }
    
    // MARK: - Action Buttons (Default State)
    private var actionButtons: some View {
        HStack(spacing: buttonSpacing) {
            // Favorite button
            CircleButton(
                icon: "heart",
                iconColor: iconColor,
                backgroundColor: backgroundColor,
                buttonSize: buttonSize,
                iconSize: closeIconSize,
                shadowColor: shadowColor,
                shadowRadius: shadowRadius,
                shadowY: shadowY,
                namespace: morphNamespace,
                id: "favorite"
            ) {
                print("Favorite tapped")
            }
            
            // Share button
            CircleButton(
                icon: "square.and.arrow.up",
                iconColor: iconColor,
                backgroundColor: backgroundColor,
                buttonSize: buttonSize,
                iconSize: closeIconSize,
                shadowColor: shadowColor,
                shadowRadius: shadowRadius,
                shadowY: shadowY,
                namespace: morphNamespace,
                id: "share"
            ) {
                print("Share tapped")
            }
            
            // Search button
            CircleButton(
                icon: "magnifyingglass",
                iconColor: iconColor,
                backgroundColor: backgroundColor,
                buttonSize: buttonSize,
                iconSize: closeIconSize,
                shadowColor: shadowColor,
                shadowRadius: shadowRadius,
                shadowY: shadowY,
                namespace: morphNamespace,
                id: "searchContainer"
            ) {
                isSearching = true
            }
        }
    }
    
    // MARK: - Search Bar (Search State)
    private var searchBar: some View {
        HStack(spacing: searchBarSpacing) {
            // Search icon
            Image(systemName: "magnifyingglass")
                .font(.system(size: searchIconSize, weight: .medium))
                .foregroundStyle(iconColorSecondary)
            
            // Text field
            TextField("Search", text: $searchText)
                .textFieldStyle(.plain)
                .font(.body)
                .foregroundStyle(iconColor)
            
            // Close button
            Button(action: {
                searchText = ""
                isSearching = false
            }) {
                Image(systemName: "xmark.circle.fill")
                    .font(.system(size: closeIconSize))
                    .foregroundStyle(iconColorSecondary)
            }
        }
        .padding(.horizontal, searchBarPadding)
        .frame(height: buttonSize)
        .background(
            Capsule()
                .fill(.clear)
                .glassEffect(.regular, in: .capsule)
                .shadow(color: shadowColor, radius: shadowRadius, x: 0, y: shadowY)
        )
        .matchedGeometryEffect(id: "searchContainer", in: morphNamespace)
    }
}

// MARK: - App Bottom Navigation (Legacy - Kept for reference)
/// Custom bottom navigation that manages tab selection
struct AppBottomNavigation: View {
    @Binding var selectedTab: AppTab
    let onTabSelected: (AppTab) -> Void
    
    @Namespace private var tabNamespace
    
    // MARK: - Tab Data
    private let tabs: [(tab: AppTab, icon: String, label: String)] = [
        (.home, "house", "Home"),
        (.shop, "tag", "Shop"),
        (.name, "list.bullet", "Name"),
        (.storeMode, "storefront", "Store Mode")
    ]
    
    // MARK: - Colors from Design System
    private let activeColor = DS.BackgroundButtonColorBrandFilledDefault
    private let inactiveColor = DS.TextOnSurfaceColorTertiary
    private let backgroundColor = DS.TransparentBlackTransparentBlack050
    private let pillBackground = DS.GreigeGreige100
    
    // MARK: - Spacing from Design System
    private let tabHeight = DS.Spacing14
    private let profileButtonSize = DS.Spacing12
    private let iconSize = DS.FontFontSizeBodyXl
    private let labelSize = DS.FontFontSizeCaption
    private let indicatorPadding = DS.Spacing1
    private let tabWidth = DS.Spacing18
    private let horizontalPadding = DS.Spacing5
    private let verticalPadding = DS.Spacing3
    private let containerSpacing = DS.Spacing1
    private let labelSpacing = DS.Spacing2px
    
    // MARK: - Elevation from Design System
    private let shadowColor = DS.Shadow100
    private let shadowRadius = DS.ElevationBlurRadiusBlur2
    private let shadowY = DS.ElevationPositionY2
    
    var body: some View {
        HStack(spacing: containerSpacing) {
            // Main tab pill container
            tabPillContainer
            
            Spacer()
            
            // Separate profile button
            profileButton
        }
        .padding(.horizontal, horizontalPadding)
        .padding(.top, verticalPadding)
        .padding(.bottom, DS.Spacing0)
    }
    
    // MARK: - Tab Pill Container
    private var tabPillContainer: some View {
        HStack(spacing: DS.Spacing0) {
            ForEach(tabs, id: \.tab) { item in
                tabButton(for: item)
            }
        }
        .padding(indicatorPadding)
        .background(
            Capsule()
                .fill(.white.opacity(0.15))
        )
    }
    
    // MARK: - Individual Tab Button
    private func tabButton(for item: (tab: AppTab, icon: String, label: String)) -> some View {
        let isSelected = selectedTab == item.tab
        
        return Button(action: {
            withAnimation(.spring(response: 0.35, dampingFraction: 0.75)) {
                onTabSelected(item.tab)
            }
        }) {
            VStack(spacing: labelSpacing) {
                Image(systemName: item.icon)
                    .font(.system(size: iconSize, weight: .medium))
                
                Text(item.label)
                    .font(.system(size: labelSize, weight: .medium))
            }
            .foregroundStyle(isSelected ? activeColor : inactiveColor)
            .frame(width: tabWidth, height: tabHeight - (indicatorPadding * 2))
            .background {
                if isSelected {
                    Capsule()
                        .fill(.white.opacity(0.5))
                        .shadow(color: shadowColor, radius: shadowRadius, x: 0, y: shadowY)
                        .matchedGeometryEffect(id: "tabIndicator", in: tabNamespace)
                }
            }
        }
        .buttonStyle(.plain)
    }
    
    // MARK: - Profile Button
    private var profileButton: some View {
        Button(action: {
            withAnimation(.spring(response: 0.35, dampingFraction: 0.75)) {
                onTabSelected(.cart)
            }
        }) {
            Image(systemName: "cart")
                .font(.system(size: iconSize, weight: .medium))
                .foregroundStyle(selectedTab == .cart ? activeColor : inactiveColor)
                .frame(width: profileButtonSize, height: profileButtonSize)
                .background(
                    Circle()
                        .fill(.white.opacity(0.15))
                )
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Placeholder View
/// Temporary view for tabs that don't have content yet
struct PlaceholderView: View {
    let title: String
    let icon: String
    
    var body: some View {
        ScrollView {
            VStack(spacing: DS.Spacing4) {
                Image(systemName: icon)
                    .font(.system(size: 64, weight: .light))
                    .foregroundStyle(DS.TextOnSurfaceColorTertiary)
                
                Text(title)
                    .font(.system(size: DS.FontFontSizeH2, weight: .bold))
                    .foregroundStyle(DS.TextOnSurfaceColorPrimary)
                
                Text("Content coming soon")
                    .font(.system(size: DS.FontFontSizeBodyMd))
                    .foregroundStyle(DS.TextOnSurfaceColorSecondary)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.top, 60) // Extra padding for top navigation
            .padding(.bottom, 80) // Extra padding for bottom navigation
        }
        .background(DS.BackgroundSurfaceColorGreige)
    }
}

// MARK: - Circle Button Component
/// A reusable circular button with glass effect background
struct CircleButton: View {
    let icon: String
    let iconColor: Color
    let backgroundColor: Color
    let buttonSize: CGFloat
    let iconSize: CGFloat
    let shadowColor: Color
    let shadowRadius: CGFloat
    let shadowY: CGFloat
    let namespace: Namespace.ID
    let id: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: icon)
                .font(.system(size: iconSize, weight: .medium))
                .foregroundStyle(iconColor)
                .frame(width: buttonSize, height: buttonSize)
                .background(
                    Circle()
                        .fill(.clear)
                        .glassEffect(.regular, in: .circle)
                        .shadow(color: shadowColor, radius: shadowRadius, x: 0, y: shadowY)
                )
        }
        .matchedGeometryEffect(id: id, in: namespace)
    }
}

// MARK: - Preview
#Preview("App Navigation") {
    AppNavigationView()
}

#Preview("Top Navigation - No Back") {
    VStack {
        AppTopNavigation(showBackButton: false, onBackTapped: {})
        Spacer()
    }
    .background(DS.BackgroundSurfaceColorGreige)
}

#Preview("Top Navigation - With Back") {
    VStack {
        AppTopNavigation(showBackButton: true, onBackTapped: {})
        Spacer()
    }
    .background(DS.BackgroundSurfaceColorGreige)
}
