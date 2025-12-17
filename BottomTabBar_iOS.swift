import SwiftUI

// MARK: - Design System Type Alias
private typealias DS = DesignSystemGlobal

// MARK: - Bottom Tab Bar View (iOS Native)
/// Native iOS bottom navigation using TabView with custom styling
struct BottomTabBar_iOS<TabType: TabBarItem, Content: View>: View {
    @Binding var selectedTab: TabType
    let content: (TabType) -> Content

    // MARK: - Design System Values
    private let activeColor = DS.Brand300 // Orange for active state
    private let inactiveColor = DS.IconOnContainerColorInactive // Gray for inactive state
    private let iconSize: CGFloat = DS.Spacing6 // 24pt - icon size
    private let labelSize: CGFloat = DS.FontSizeCaption // 11pt - label text size

    init(
        selectedTab: Binding<TabType>,
        @ViewBuilder content: @escaping (TabType) -> Content
    ) {
        self._selectedTab = selectedTab
        self.content = content

        // Configure tab bar appearance
        let appearance = UITabBarAppearance()
        appearance.configureWithDefaultBackground()

        // Set the active (selected) color
        appearance.stackedLayoutAppearance.selected.iconColor = UIColor(DS.Brand300)
        appearance.stackedLayoutAppearance.selected.titleTextAttributes = [
            .foregroundColor: UIColor(DS.Brand300),
            .font: UIFont.systemFont(ofSize: DS.FontSizeCaption, weight: .medium)
        ]

        // Set the inactive (normal) color
        appearance.stackedLayoutAppearance.normal.iconColor = UIColor(DS.IconOnContainerColorInactive)
        appearance.stackedLayoutAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor(DS.IconOnContainerColorInactive),
            .font: UIFont.systemFont(ofSize: DS.FontSizeCaption, weight: .medium)
        ]

        UITabBar.appearance().standardAppearance = appearance
        if #available(iOS 15.0, *) {
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }

    var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(Array(TabType.allCases), id: \.id) { tab in
                content(tab)
                    .tabItem {
                        Image(tab.iconName)
                            .renderingMode(.template)
                        Text(tab.title)
                    }
                    .tag(tab)
            }
        }
    }
}

// MARK: - App Tab Enum with Shop Integration
/// Main app tabs with shop morphing menu support
enum AppTab: Int, TabBarItem, CaseIterable {
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

// MARK: - Main App Navigation View
/// Root navigation view with morphing shop menu integration
/// NOTE: Requires ShopNavigation.swift to be added to the Xcode project for ShopView
struct MainAppNavigationView: View {
    @State private var selectedTab: AppTab = .home

    var body: some View {
        BottomTabBar_iOS(selectedTab: $selectedTab) { tab in
            tabContent(for: tab)
        }
    }

    @ViewBuilder
    private func tabContent(for tab: AppTab) -> some View {
        switch tab {
        case .home:
            homeTabContent
        case .shop:
            ShopView()
            shopTabPlaceholder
        case .profile:
            profileTabContent
        case .cart:
            cartTabContent
        }
    }

    private var homeTabContent: some View {
        ZStack {
            DS.BackgroundSurfaceColorGreige
                .ignoresSafeArea()
            VStack {
                Image(systemName: "house.fill")
                    .font(.system(size: 60))
                    .foregroundStyle(DS.Brand300)
                Text("Home Screen")
                    .font(.title)
                    .foregroundStyle(DS.Brand300)
            }
        }
    }

    private var shopTabPlaceholder: some View {
        ZStack {
            DS.BackgroundSurfaceColorGreige
                .ignoresSafeArea()
            VStack(spacing: DS.Spacing4) {
                Image(systemName: "square.grid.2x2")
                    .font(.system(size: 60))
                    .foregroundStyle(DS.Brand300)
                Text("Shop")
                    .font(.title)
                    .foregroundStyle(DS.Brand300)
                Text("Add ShopNavigation.swift to project")
                    .font(.caption)
                    .foregroundStyle(DS.TextOnSurfaceColorSecondary)
            }
        }
    }

    private var profileTabContent: some View {
        ZStack {
            DS.BackgroundSurfaceColorGreige
                .ignoresSafeArea()
            VStack {
                Image(systemName: "person.fill")
                    .font(.system(size: 60))
                    .foregroundStyle(DS.Brand300)
                Text("Profile Screen")
                    .font(.title)
                    .foregroundStyle(DS.Brand300)
            }
        }
    }

    private var cartTabContent: some View {
        ZStack {
            DS.BackgroundSurfaceColorGreige
                .ignoresSafeArea()
            VStack {
                Image(systemName: "bag.fill")
                    .font(.system(size: 60))
                    .foregroundStyle(DS.Brand300)
                Text("Cart Screen")
                    .font(.title)
                    .foregroundStyle(DS.Brand300)
            }
        }
    }
}

// MARK: - Tab Bar Item Protocol
/// Protocol that tab enums must conform to for use with BottomTabBar_iOS
protocol TabBarItem: CaseIterable, Identifiable, Hashable {
    var title: String { get }
    var iconName: String { get }
}

// MARK: - Preview

#Preview("Main App Navigation") {
    MainAppNavigationView()
}

#Preview("Bottom Tab Bar iOS - Legacy") {
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
            BottomTabBar_iOS(selectedTab: $selectedTab) { tab in
                ZStack {
                    switch tab {
                    case .home:
                        DS.BackgroundSurfaceColorGreige
                            .ignoresSafeArea()
                        VStack {
                            Image(systemName: "house.fill")
                                .font(.system(size: 60))
                                .foregroundStyle(DS.Brand300)
                            Text("Home Screen")
                                .font(.title)
                                .foregroundStyle(DS.Brand300)
                        }
                    case .shop:
                        DS.BackgroundSurfaceColorGreige
                            .ignoresSafeArea()
                        VStack {
                            Image(systemName: "cart.fill")
                                .font(.system(size: 60))
                                .foregroundStyle(DS.Brand300)
                            Text("Shop Screen")
                                .font(.title)
                                .foregroundStyle(DS.Brand300)
                        }
                    case .profile:
                        DS.BackgroundSurfaceColorGreige
                            .ignoresSafeArea()
                        VStack {
                            Image(systemName: "person.fill")
                                .font(.system(size: 60))
                                .foregroundStyle(DS.Brand300)
                            Text("Profile Screen")
                                .font(.title)
                                .foregroundStyle(DS.Brand300)
                        }
                    case .cart:
                        DS.BackgroundSurfaceColorGreige
                            .ignoresSafeArea()
                        VStack {
                            Image(systemName: "bag.fill")
                                .font(.system(size: 60))
                                .foregroundStyle(DS.Brand300)
                            Text("Cart Screen")
                                .font(.title)
                                .foregroundStyle(DS.Brand300)
                        }
                    }
                }
            }
        }
    }

    return PreviewWrapper()
}

// MARK: - Design & Implementation Notes
/*
 NATIVE iOS BOTTOM TAB BAR WITH MORPHING SHOP MENU

 This tab bar implementation features:

 ✨ NATIVE iOS EXPERIENCE:
 - Uses standard TabView component
 - Native animations and transitions
 - Follows iOS design guidelines
 - Automatic safe area handling

 🎨 DESIGN SYSTEM INTEGRATION:
 - Active text/icons: Orange (Brand-300)
 - Inactive text/icons: Gray (IconOnContainerColorInactive)
 - All sizing uses DesignSystemGlobal tokens
 - Custom UITabBarAppearance configuration

 🔄 GENERIC IMPLEMENTATION:
 - Works with any enum conforming to TabBarItem protocol
 - Requires: CaseIterable, Identifiable, Equatable
 - Provides: title and iconName properties
 - Content is provided via ViewBuilder closure

 📱 RESPONSIVE LAYOUT:
 - Native iOS layout and spacing
 - Handles safe area insets automatically
 - Works with all device sizes

 🛍️ iOS 26 SHOP MENU INTEGRATION (NEW):
 - MainAppNavigationView provides ready-to-use app navigation
 - AppTab enum defines Home, Shop, Profile, Cart tabs
 - Shop tab integrates with MorphingShopMenu (see ShopNavigation.swift)
 - Toolbar morphing transitions inspired by iOS 26 patterns
 - State machine: collapsed -> departments -> subcategories -> PLP
 - Uses matchedGeometryEffect and glassEffect for smooth morphing
 - Linked to PLPCategory for navigation to product listings

 HOME DEPOT CATEGORIES:
 - 20 main departments (Appliances, Tools, Bath, etc.)
 - Subcategories linked to existing PLPCategory definitions
 - Smooth navigation drill-down with back navigation

 USAGE EXAMPLE:

 ```swift
 // Simple - Use MainAppNavigationView directly
 MainAppNavigationView()

 // Custom - Use BottomTabBar_iOS with your own tabs
 enum AppTab: Int, TabBarItem {
     case home = 0
     case shop = 1

     var id: Int { rawValue }
     var title: String { ... }
     var iconName: String { ... }
 }

 BottomTabBar_iOS(selectedTab: $selectedTab) { tab in
     switch tab {
     case .home:
         HomeView()
     case .shop:
         ShopView() // Uses morphing menu
     }
 }
 ```

 RELATED FILES:
 - ShopNavigation.swift: ShopDepartment, ShopSubcategory, MorphingShopMenu, ShopView
 - PLPView.swift: PLPCategory, PLPView for product listings
 - Morph_Menu.swift: MorphingNavHeader for additional morphing patterns

 DIFFERENCES FROM LIQUID GLASS VERSION:
 - No custom liquid glass effects on tab bar itself
 - Shop menu uses glassEffect for iOS 26 Liquid Glass aesthetic
 - matchedGeometryEffect for toolbar morphing transitions
 - Standard iOS tab bar appearance with morphing overlays
*/
