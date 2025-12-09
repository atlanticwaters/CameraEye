import SwiftUI

// MARK: - Tab Item Enum
enum TabItem: Int, CaseIterable, Identifiable {
    case home
    case shop
    case name
    case storeMode
    case cart

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

// MARK: - Tab Bar Colors
struct TabBarColors {
    static let activeColor = Color(red: 233/255, green: 92/255, blue: 2/255) // #E95C02 - Orange
    static let inactiveColor = Color(red: 140/255, green: 140/255, blue: 140/255) // #8C8C8C - Gray
}

// MARK: - Tab Icon View
/// Displays the icon for a tab item with proper active/inactive coloring
struct TabIconView: View {
    let tab: TabItem
    let isActive: Bool

    var body: some View {
        Image(tab.iconName)
            .renderingMode(.template)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 24, height: 24)
            .foregroundColor(isActive ? TabBarColors.activeColor : TabBarColors.inactiveColor)
    }
}

// MARK: - Tab Item View
/// A single tab bar item with icon and label
struct TabItemView: View {
    let tab: TabItem
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                TabIconView(tab: tab, isActive: isSelected)

                Text(tab.title)
                    .font(.system(size: 10))
                    .foregroundColor(isSelected ? TabBarColors.activeColor : TabBarColors.inactiveColor)
            }
            .frame(maxWidth: .infinity)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

// MARK: - Bottom Tab Bar View
/// The main bottom navigation tab bar
struct BottomTabBar: View {
    @Binding var selectedTab: TabItem

    var body: some View {
        HStack(spacing: 0) {
            ForEach(TabItem.allCases) { tab in
                TabItemView(tab: tab, isSelected: selectedTab == tab) {
                    selectedTab = tab
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.top, 8)
        .padding(.bottom, 34) // Account for home indicator on iPhone
    }
}

// MARK: - Content Views for Each Tab

struct HomeView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground).ignoresSafeArea()
            VStack {
                Text("Home")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
        }
    }
}

struct ShopView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground).ignoresSafeArea()
            VStack {
                Text("Shop")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
        }
    }
}

struct NameView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground).ignoresSafeArea()
            VStack {
                Text("Profile")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
        }
    }
}

struct StoreModeView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground).ignoresSafeArea()
            VStack {
                Text("Store Mode")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
        }
    }
}

struct CartView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground).ignoresSafeArea()
            VStack {
                Text("Cart")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
        }
    }
}

// MARK: - Main Tab Container View
/// The main container that holds all tab content and the tab bar
struct MainTabView: View {
    @State private var selectedTab: TabItem = .shop // Shop is active by default per the design

    var body: some View {
        ZStack(alignment: .bottom) {
            // Content area based on selected tab
            Group {
                switch selectedTab {
                case .home:
                    HomeView()
                case .shop:
                    ShopView()
                case .name:
                    NameView()
                case .storeMode:
                    StoreModeView()
                case .cart:
                    CartView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            // Tab bar overlay at the bottom
            VStack(spacing: 0) {
                Divider()
                BottomTabBar(selectedTab: $selectedTab)
            }
            .background(Color(.systemBackground))
        }
        .ignoresSafeArea(.container, edges: .bottom)
    }
}

// MARK: - App Entry Point Example
/*
 To use this in your app, create an App file like this:

 import SwiftUI

 @main
 struct MyApp: App {
     var body: some Scene {
         WindowGroup {
             MainTabView()
         }
     }
 }
*/

// MARK: - Preview
#Preview {
    MainTabView()
}

// MARK: - Asset Catalog Instructions
/*
 SETUP INSTRUCTIONS:

 1. Add the SVG files to your Xcode Asset Catalog (Assets.xcassets):
    - logo.svg → Name it "logo"
    - Bucket.svg → Name it "Bucket"
    - Profile.svg → Name it "Profile"
    - Store.svg → Name it "Store"
    - Cart.svg → Name it "Cart"

 2. For each asset in the Asset Catalog:
    - Select the asset
    - In the Attributes Inspector, set "Render As" to "Template Image"
    - This allows the .foregroundColor modifier to work correctly

 3. The icons will automatically change color based on the active/inactive state:
    - Active: Orange (#E95C02)
    - Inactive: Gray (#8C8C8C)
*/
