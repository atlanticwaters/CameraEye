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
                    .padding(.top, 8)
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
        .background(Color.surfaceBackground)
        .navigationBarHidden(true)
        }
        .ignoresSafeArea(edges: .bottom)
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
#Preview {
    HomeScreenView()
}

// MARK: - =============================================
// MARK: - STANDALONE PREVIEW WRAPPER
// MARK: - =============================================

// MARK: - Home Tab Enum for BottomTabBar_iOS
enum HomeTab: Int, TabBarItem {
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

/// Wrapper view for testing in ContentView or other entry points
/// Includes BottomTabBar_iOS and MorphingNavHeader with scroll hide behavior
struct HomeScreenDemoView: View {
    @State private var selectedTab: HomeTab = .home
    @State private var scrollOffset: CGFloat = 0
    @State private var previousScrollOffset: CGFloat = 0
    @State private var showNavBar: Bool = true

    var body: some View {
        BottomTabBar_iOS(selectedTab: $selectedTab) { tab in
            switch tab {
            case .home:
                homeScreenWithNav
            case .shop:
                placeholderView(title: "Shop", icon: "cart.fill")
            case .profile:
                placeholderView(title: "Profile", icon: "person.fill")
            case .cart:
                placeholderView(title: "Cart", icon: "bag.fill")
            }
        }
    }

    // MARK: - Home Screen with Morph Nav
    private var homeScreenWithNav: some View {
        ZStack(alignment: .top) {
            // Main content with scroll tracking
            HomeScreenScrollableContent(
                scrollOffset: $scrollOffset,
                onScrollChange: handleScrollChange
            )

            // Morph Nav Header that slides up/down
            VStack {
                MorphingNavHeader()
                    .offset(y: showNavBar ? 0 : -100)
                    .animation(.spring(response: 0.3, dampingFraction: 0.8), value: showNavBar)

                Spacer()
            }
        }
    }

    // MARK: - Scroll Handler
    private func handleScrollChange(newOffset: CGFloat) {
        // Always show nav bar when near the top
        if newOffset < 50 {
            if !showNavBar {
                showNavBar = true
            }
            previousScrollOffset = newOffset
            return
        }

        let delta = newOffset - previousScrollOffset

        // Scrolling down (content moving up, offset increasing) - hide nav
        if delta > 5 && showNavBar {
            showNavBar = false
            previousScrollOffset = newOffset
        }
        // Scrolling up (content moving down, offset decreasing) - show nav
        else if delta < -5 && !showNavBar {
            showNavBar = true
            previousScrollOffset = newOffset
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
/// HomeScreenView content wrapped with scroll offset tracking
struct HomeScreenScrollableContent: View {
    @Binding var scrollOffset: CGFloat
    var onScrollChange: (CGFloat) -> Void
    @State private var selectedSavingsFilter: String = "All"

    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                // Spacer for nav bar
                Color.clear.frame(height: 70)

                // ==========================================
                // MARK: - SCREEN 1 CONTENT (home_1.jpg)
                // ==========================================

                // MARK: - Hero Banner 1 (HomeImg16 - "40% OFF SELECT APPLIANCES")
                HeroBannerView(banner: HomeScreenData.heroBanners[0])
                    .padding(.top, 8)
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
            .background(
                GeometryReader { geo in
                    Color.clear
                        .preference(key: ScrollOffsetPreferenceKey.self, value: -geo.frame(in: .named("scroll")).origin.y)
                }
            )
        }
        .coordinateSpace(name: "scroll")
        .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
            scrollOffset = value
            onScrollChange(value)
        }
        .background(Color.surfaceBackground)
    }
}

// MARK: - Scroll Offset Preference Key
struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

#Preview("With Navigation") {
    HomeScreenDemoView()
}
