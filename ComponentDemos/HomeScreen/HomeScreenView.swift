import SwiftUI

// MARK: - =============================================
// MARK: - HOME SCREEN VIEW
// MARK: - =============================================

/// Main Home Screen View for the demo app
/// Replicates The Home Depot mobile home screen using native iOS components
/// Images are mapped to the actual mockup screenshots (home_1.jpg - home_4.jpg)
struct HomeScreenView: View {
    @State private var selectedSavingsFilter: String = "All"

    var body: some View {
        NavigationStack {
            ScrollView {
            LazyVStack(spacing: 0) {

                // ==========================================
                // MARK: - SCREEN 1 CONTENT (home_1.jpg)
                // ==========================================

                // MARK: - Hero Banner 1 (HomeImg16 - "40% OFF SELECT APPLIANCES")
                HeroBannerView(banner: HomeScreenData.heroBanners[0])
                    .padding(.top, 96) // Top padding to clear menu icons
                    .padding(.bottom, 12)

                // MARK: - Hero Banner 2 (HomeImg17 - "LAST-MINUTE GIFT IDEAS")
                if HomeScreenData.heroBanners.count > 1 {
                    HeroBannerView(banner: HomeScreenData.heroBanners[1], fullWidth: true)
                        .padding(.bottom, 16)
                }

                // MARK: - Order Status Row (moved higher)
                OrderStatusRow()
                    .padding(.bottom, 16)

                // MARK: - Recently Viewed (HomeImg19, 25, 26, 27 - product images)
                HomeRecentlyViewedSection(products: HomeScreenData.recentlyViewed)
                    .padding(.bottom, 16)

                // MARK: - Free Tool/Battery Banner (HomeImg40 - brand grid)
                ImageBannerView(banner: HomeScreenData.freeToolBanner)
                    .padding(.bottom, 16)

                // MARK: - Account Quick Actions (2x3 grid)
                AccountQuickActionsGrid(actions: HomeScreenData.accountActions)
                    .padding(.bottom, 16)

                // MARK: - Shop Deals Button
                ShopDealsButton()
                    .padding(.bottom, 24)

                SectionDivider()

                // ==========================================
                // MARK: - SCREEN 2 CONTENT (home_2.jpg)
                // ==========================================

                // MARK: - Top Savings Header with Filter
                TopSavingsHeader(
                    selectedFilter: $selectedSavingsFilter,
                    filters: HomeScreenData.savingsFilters.map { $0.title }
                )
                .padding(.vertical, 16)

                // MARK: - Put a Bow on Gifting Grid (HomeImg41)
                ImageBannerView(banner: HomeScreenData.giftingGridBanner)
                    .padding(.bottom, 16)

                // MARK: - Gift Cards Banner (HomeImg42)
                ImageBannerView(banner: HomeScreenData.giftCardsBanner)
                    .padding(.bottom, 16)

                // MARK: - Make Holiday Magic Grid (HomeImg43)
                ImageBannerView(banner: HomeScreenData.holidayMagicBanner)
                    .padding(.bottom, 24)

                SectionDivider()

                // ==========================================
                // MARK: - SCREEN 3 CONTENT (home_3.jpg)
                // ==========================================

                // MARK: - Free Kids Workshop (HomeImg55)
                ImageBannerView(banner: HomeScreenData.kidsWorkshopBanner)
                    .padding(.vertical, 16)

                // MARK: - Installation Services (HomeImg56)
                ImageBannerView(banner: HomeScreenData.installationBanner)
                    .padding(.bottom, 16)

                // MARK: - 12 Months Financing (HomeImg57)
                ImageBannerView(banner: HomeScreenData.financingBanner)
                    .padding(.bottom, 16)

                // MARK: - Pro Xtra Deals Section
                ProXtraDealsSection()
                    .padding(.bottom, 16)

                SectionDivider()

                // ==========================================
                // MARK: - SCREEN 4 CONTENT (home_4.jpg)
                // ==========================================

                // MARK: - Shop by Category (Expandable List)
                ShopByCategoryList(categories: HomeScreenData.categories)
                    .padding(.vertical, 8)

                // MARK: - Popular Categories Chips
                PopularCategoriesSection(categories: HomeScreenData.popularCategories)
                    .padding(.vertical, 16)

                // MARK: - 12 Days of Deals Banner
                TwelveDaysBanner()
                    .padding(.bottom, 24)

                // MARK: - Today's Hottest Products (HomeImg75, 100)
                ProductCarouselSection(
                    title: "Today's Hottest Products for You",
                    subtitle: nil,
                    products: HomeScreenData.hottestProducts
                )
                .padding(.bottom, 24)

                // MARK: - Footer Space
                Color.clear.frame(height: 100)
            }
        }
        .scrollEdgeEffectStyle(.soft, for: .top)
        .scrollEdgeEffectStyle(.soft, for: .bottom)
        .background(Color.surfaceBackground)
        .navigationBarHidden(true)
        }
        .ignoresSafeArea(edges: [.bottom, .top])
    }
}

// MARK: - Pro Xtra Deals Section
struct ProXtraDealsSection: View {
    var body: some View {
        VStack(spacing: 12) {
            // Red Pro Xtra Header using DSButton
            ProXtraDealsButton()
                .padding(.horizontal, 16)

            // Deal cards using gifting products with actual images
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(HomeScreenData.giftingProducts) { product in
                        HomeProductCard(product: product)
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }
}

// MARK: - Pro Xtra Deals Button (custom red style)
struct ProXtraDealsButton: View {
    var body: some View {
        Button(action: {}) {
            HStack {
                Image(systemName: "star.fill")
                    .font(.system(size: 14))
                    .foregroundStyle(.yellow)
                Text("Pro Xtra Deals")
                    .font(.custom(TokensCoreLight.FontFamilyInformational, size: TokensCoreLight.FontSizeBodySm).weight(.bold))
                    .foregroundStyle(.white)
                Spacer()
                Text("See All")
                    .font(.custom(TokensCoreLight.FontFamilyInformational, size: TokensCoreLight.FontSizeBodySm).weight(.semibold))
                    .foregroundStyle(.white)
                Image(systemName: "chevron.right")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundStyle(.white)
            }
            .padding(.horizontal, 16)
            .frame(height: 44) // DSButton large size height
            .background(
                RoundedRectangle(cornerRadius: TokensSemanticLight.BorderRadiusFull)
                    .fill(Color.red)
            )
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Preview
#Preview("Home Screen Only") {
    HomeScreenView()
}

#Preview("Home Screen with Menus") {
    HomeScreenDemoView()
}

// MARK: - =============================================
// MARK: - STANDALONE PREVIEW WRAPPER
// MARK: - =============================================

// MARK: - Home Tab Enum for BottomTabBar_iOS
enum HomeTab: Int, TabBarItem {
    case home = 0
    case shop = 1
    case catalog = 2
    case cart = 3

    var id: Int { rawValue }

    var title: String {
        switch self {
        case .home: return "Home"
        case .shop: return "Shop"
        case .catalog: return "Catalog"
        case .cart: return "Cart"
        }
    }

    var iconName: String {
        switch self {
        case .home: return "logo"
        case .shop: return "Bucket"
        case .catalog: return "square.grid.2x2"
        case .cart: return "Cart"
        }
    }
    
    var isSystemIcon: Bool {
        switch self {
        case .catalog: return true
        default: return false
        }
    }
}

/// Wrapper view for testing in ContentView or other entry points
/// Includes BottomTabBar_iOS and MorphingNavHeader with Shop Navigation
struct HomeScreenDemoView: View {
    @State private var selectedTab: HomeTab = .home
    @State private var isShopNavigationPresented: Bool = false
    @State private var previousTab: HomeTab = .home
    @State private var showBackButton: Bool = false

    var body: some View {
        ZStack {
            BottomTabBar_iOS(selectedTab: $selectedTab) { tab in
                tabContent(for: tab)
            }
            .onChange(of: selectedTab) { oldValue, newValue in
                if newValue == .shop {
                    // Store previous tab and show shop navigation
                    previousTab = oldValue
                    withAnimation(.spring(response: 0.35, dampingFraction: 0.85)) {
                        isShopNavigationPresented = true
                    }
                    // Reset to previous tab so Shop doesn't stay selected
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        selectedTab = previousTab
                    }
                }
            }

            // Shop Navigation - slides in from right
            if isShopNavigationPresented {
                ShopNavigationView(isPresented: $isShopNavigationPresented)
                    .transition(.move(edge: .trailing))
                    .zIndex(1)
            }
        }
        .animation(.spring(response: 0.35, dampingFraction: 0.85), value: isShopNavigationPresented)
    }

    @ViewBuilder
    private func tabContent(for tab: HomeTab) -> some View {
        switch tab {
        case .home:
            homeScreenWithNav
        case .shop:
            // Empty placeholder - Shop tab triggers slide-in navigation
            Color.clear
        case .catalog:
            ComponentCatalogView(showBackButton: $showBackButton)
        case .cart:
            placeholderView(title: "Cart", icon: "bag.fill")
        }
    }

    // MARK: - Home Screen with Morph Nav
    private var homeScreenWithNav: some View {
        HomeScreenScrollableContent()
            .safeAreaBar(edge: .top) {
                MorphingNavHeader(showBackButton: false)
            }
    }

    // MARK: - Placeholder View for other tabs
    private func placeholderView(title: String, icon: String) -> some View {
        ZStack {
            Color.surfaceBackground
                .ignoresSafeArea()
            VStack {
                Image(systemName: icon)
                    .font(.system(size: 60))
                    .foregroundStyle(Color.brandPrimary)
                Text("\(title) Screen")
                    .font(.title)
                    .foregroundStyle(Color.brandPrimary)
            }
        }
    }
}

// MARK: - Home Screen Scrollable Content
/// HomeScreenView content as a scrollable view
struct HomeScreenScrollableContent: View {
    @State private var selectedSavingsFilter: String = "All"

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                // ==========================================
                // MARK: - SCREEN 1 CONTENT (home_1.jpg)
                // ==========================================

                // MARK: - Hero Banner 1 (HomeImg16 - "40% OFF SELECT APPLIANCES")
                HeroBannerView(banner: HomeScreenData.heroBanners[0])
                    .padding(.top, 96) // Top padding to clear menu icons
                    .padding(.bottom, 12)

                // MARK: - Hero Banner 2 (HomeImg17 - "LAST-MINUTE GIFT IDEAS")
                if HomeScreenData.heroBanners.count > 1 {
                    HeroBannerView(banner: HomeScreenData.heroBanners[1], fullWidth: true)
                        .padding(.bottom, 16)
                }

                // MARK: - Order Status Row (moved higher)
                OrderStatusRow()
                    .padding(.bottom, 16)

                // MARK: - Recently Viewed (HomeImg19, 25, 26, 27 - product images)
                HomeRecentlyViewedSection(products: HomeScreenData.recentlyViewed)
                    .padding(.bottom, 16)

                // MARK: - Free Tool/Battery Banner (HomeImg40 - brand grid)
                ImageBannerView(banner: HomeScreenData.freeToolBanner)
                    .padding(.bottom, 16)

                // MARK: - Account Quick Actions (2x3 grid)
                AccountQuickActionsGrid(actions: HomeScreenData.accountActions)
                    .padding(.bottom, 16)

                // MARK: - Shop Deals Button
                ShopDealsButton()
                    .padding(.bottom, 24)

                SectionDivider()

                // ==========================================
                // MARK: - SCREEN 2 CONTENT (home_2.jpg)
                // ==========================================

                // MARK: - Top Savings Header with Filter
                TopSavingsHeader(
                    selectedFilter: $selectedSavingsFilter,
                    filters: HomeScreenData.savingsFilters.map { $0.title }
                )
                .padding(.vertical, 16)

                // MARK: - Put a Bow on Gifting Grid (HomeImg41)
                ImageBannerView(banner: HomeScreenData.giftingGridBanner)
                    .padding(.bottom, 16)

                // MARK: - Gift Cards Banner (HomeImg42)
                ImageBannerView(banner: HomeScreenData.giftCardsBanner)
                    .padding(.bottom, 16)

                // MARK: - Make Holiday Magic Grid (HomeImg43)
                ImageBannerView(banner: HomeScreenData.holidayMagicBanner)
                    .padding(.bottom, 24)

                SectionDivider()

                // ==========================================
                // MARK: - SCREEN 3 CONTENT (home_3.jpg)
                // ==========================================

                // MARK: - Free Kids Workshop (HomeImg55)
                ImageBannerView(banner: HomeScreenData.kidsWorkshopBanner)
                    .padding(.vertical, 16)

                // MARK: - Installation Services (HomeImg56)
                ImageBannerView(banner: HomeScreenData.installationBanner)
                    .padding(.bottom, 16)

                // MARK: - 12 Months Financing (HomeImg57)
                ImageBannerView(banner: HomeScreenData.financingBanner)
                    .padding(.bottom, 16)

                // MARK: - Pro Xtra Deals Section
                ProXtraDealsSection()
                    .padding(.bottom, 16)

                SectionDivider()

                // ==========================================
                // MARK: - SCREEN 4 CONTENT (home_4.jpg)
                // ==========================================

                // MARK: - Shop by Category (Expandable List)
                ShopByCategoryList(categories: HomeScreenData.categories)
                    .padding(.vertical, 8)

                // MARK: - Popular Categories Chips
                PopularCategoriesSection(categories: HomeScreenData.popularCategories)
                    .padding(.vertical, 16)

                // MARK: - 12 Days of Deals Banner
                TwelveDaysBanner()
                    .padding(.bottom, 24)

                // MARK: - Today's Hottest Products (HomeImg75, 100)
                ProductCarouselSection(
                    title: "Today's Hottest Products for You",
                    subtitle: nil,
                    products: HomeScreenData.hottestProducts
                )
                .padding(.bottom, 24)

                // MARK: - Footer Space
                Color.clear.frame(height: 100)
            }
        }
        .scrollEdgeEffectStyle(.soft, for: .top)
        .scrollEdgeEffectStyle(.soft, for: .bottom)
        .background(Color.surfaceBackground)
    }
}
