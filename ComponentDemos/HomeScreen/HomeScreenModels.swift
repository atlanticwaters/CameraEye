import SwiftUI

// MARK: - =============================================
// MARK: - HOME SCREEN DATA MODELS
// MARK: - =============================================

// MARK: - Hero Banner Model
struct HeroBanner: Identifiable {
    let id = UUID()
    let imageName: String?
    let backgroundColor: Color?
    let title: String?
    let subtitle: String?
    let ctaText: String?
    let isOverlay: Bool // true = text overlays image, false = solid color with text
}

// MARK: - Recently Viewed Product
struct RecentlyViewedProduct: Identifiable {
    let id = UUID()
    let imageName: String
    let price: String
    let originalPrice: String?
    let rating: Double
    let reviewCount: Int
    let title: String
    let badge: String?
}

// MARK: - Account Quick Action (2x3 grid icons)
struct AccountQuickAction: Identifiable {
    let id = UUID()
    let iconName: String
    let title: String
    let isSystemIcon: Bool
}

// MARK: - Category Model (for list view)
struct ShopCategory: Identifiable {
    let id = UUID()
    let name: String
    let iconName: String
    let isSystemIcon: Bool
    let plpCategory: PLPCategory? // Optional link to PLP view
}

// MARK: - Promo Card Model (paired cards with percentages)
struct PromoCard: Identifiable {
    let id = UUID()
    let imageName: String
    let percentOff: String?
    let title: String
    let subtitle: String?
    let badgeText: String?
    let badgeColor: Color?
    let backgroundColor: Color?
}

// MARK: - Lifestyle Banner (full-width promotional images)
struct LifestyleBanner: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String?
    let ctaText: String?
}

// MARK: - Top Savings Filter
struct SavingsFilter: Identifiable {
    let id = UUID()
    let title: String
    var isSelected: Bool = false
}

// MARK: - Product Card for carousels
struct ProductCardData: Identifiable {
    let id = UUID()
    let imageName: String
    let brand: String
    let title: String
    let price: String
    let originalPrice: String?
    let rating: Double
    let reviewCount: Int
    let badge: String?
    let isFreeDelivery: Bool
}

// MARK: - DIY Project
struct DIYProject: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let duration: String?
}

// MARK: - Popular Category Chip
struct PopularCategory: Identifiable {
    let id = UUID()
    let title: String
}

// MARK: - Full-Width Image Banner
struct ImageBanner: Identifiable {
    let id = UUID()
    let imageName: String
}

// MARK: - =============================================
// MARK: - SAMPLE DATA (mapped to actual images)
// MARK: - =============================================

struct HomeScreenData {

    // MARK: - Hero Banners (Screen 1 - top)
    // HomeImg16 = "40% OFF SELECT APPLIANCES" red banner
    // HomeImg17 = "LAST-MINUTE GIFT IDEAS" wide red banner
    static let heroBanners: [HeroBanner] = [
        HeroBanner(
            imageName: "HomeImg16",
            backgroundColor: nil,
            title: nil,
            subtitle: nil,
            ctaText: nil,
            isOverlay: false
        ),
        HeroBanner(
            imageName: "HomeImg17",
            backgroundColor: nil,
            title: nil,
            subtitle: nil,
            ctaText: nil,
            isOverlay: false
        )
    ]

    // MARK: - Secondary Banners
    // HomeImg18 = "20% OFF Select Garage & Tool Storage"
    static let secondaryBanner = ImageBanner(imageName: "HomeImg18")

    // MARK: - Recently Viewed Products
    // HomeImg19 = DEWALT drill
    // HomeImg25 = Milwaukee multi-tool ($249 value)
    // HomeImg26 = RIDGID shop vac
    // HomeImg27 = Milwaukee tool kit ($199 value)
    static let recentlyViewed: [RecentlyViewedProduct] = [
        RecentlyViewedProduct(
            imageName: "HomeImg19",
            price: "$99",
            originalPrice: "$139",
            rating: 4.7,
            reviewCount: 2341,
            title: "DEWALT 20V MAX Drill Kit",
            badge: "Sale"
        ),
        RecentlyViewedProduct(
            imageName: "HomeImg25",
            price: "$159",
            originalPrice: "$249",
            rating: 4.6,
            reviewCount: 1823,
            title: "Milwaukee M18 Multi-Tool Kit",
            badge: "-$90"
        ),
        RecentlyViewedProduct(
            imageName: "HomeImg26",
            price: "$99",
            originalPrice: nil,
            rating: 4.5,
            reviewCount: 1247,
            title: "RIDGID 12 Gal. Shop Vacuum",
            badge: nil
        ),
        RecentlyViewedProduct(
            imageName: "HomeImg27",
            price: "$129",
            originalPrice: "$199",
            rating: 4.8,
            reviewCount: 3421,
            title: "Milwaukee M12 Combo Kit",
            badge: "Top Rated"
        )
    ]

    // MARK: - Account Quick Actions (2x3 grid)
    static let accountActions: [AccountQuickAction] = [
        AccountQuickAction(iconName: "list.bullet.clipboard", title: "Lists", isSystemIcon: true),
        AccountQuickAction(iconName: "doc.text", title: "Receipts", isSystemIcon: true),
        AccountQuickAction(iconName: "building.2", title: "Your Store", isSystemIcon: true),
        AccountQuickAction(iconName: "creditcard", title: "Credit Card", isSystemIcon: true),
        AccountQuickAction(iconName: "shield.checkered", title: "Security &\nProtection", isSystemIcon: true),
        AccountQuickAction(iconName: "wrench.and.screwdriver", title: "Get It\nInstalled", isSystemIcon: true)
    ]

    // MARK: - Shop Categories (List view - Screen 4)
    static let categories: [ShopCategory] = [
        ShopCategory(name: "Appliances", iconName: "refrigerator", isSystemIcon: true, plpCategory: .refrigerators),
        ShopCategory(name: "Bath & Faucets", iconName: "shower", isSystemIcon: true, plpCategory: nil),
        ShopCategory(name: "Blinds & Window Treatments", iconName: "blinds.horizontal.closed", isSystemIcon: true, plpCategory: nil),
        ShopCategory(name: "Building Materials", iconName: "cube.box", isSystemIcon: true, plpCategory: nil),
        ShopCategory(name: "Decor & Furniture", iconName: "lamp.table", isSystemIcon: true, plpCategory: nil),
        ShopCategory(name: "Doors & Windows", iconName: "door.left.hand.closed", isSystemIcon: true, plpCategory: nil),
        ShopCategory(name: "Electrical", iconName: "bolt", isSystemIcon: true, plpCategory: nil),
        ShopCategory(name: "Flooring", iconName: "square.grid.3x3.topleft.filled", isSystemIcon: true, plpCategory: nil),
        ShopCategory(name: "Hardware", iconName: "wrench.and.screwdriver", isSystemIcon: true, plpCategory: nil),
        ShopCategory(name: "Heating & Cooling", iconName: "thermometer.snowflake", isSystemIcon: true, plpCategory: nil),
        ShopCategory(name: "Kitchen", iconName: "sink", isSystemIcon: true, plpCategory: nil),
        ShopCategory(name: "Lawn & Garden", iconName: "leaf", isSystemIcon: true, plpCategory: nil),
        ShopCategory(name: "Lighting & Ceiling Fans", iconName: "lightbulb", isSystemIcon: true, plpCategory: nil),
        ShopCategory(name: "Outdoor Living", iconName: "sun.max", isSystemIcon: true, plpCategory: nil),
        ShopCategory(name: "Paint", iconName: "paintbrush", isSystemIcon: true, plpCategory: nil),
        ShopCategory(name: "Plumbing", iconName: "drop", isSystemIcon: true, plpCategory: nil),
        ShopCategory(name: "Storage & Organization", iconName: "shippingbox", isSystemIcon: true, plpCategory: nil),
        ShopCategory(name: "Tools", iconName: "hammer", isSystemIcon: true, plpCategory: .powerDrills)
    ]

    // MARK: - Free Tool/Battery Brand Grid
    // HomeImg40 = "Free Tool or Battery with Purchase" grid (Ryobi, Dewalt, Ridgid, Milwaukee)
    static let freeToolBanner = ImageBanner(imageName: "HomeImg40")

    // MARK: - Top Savings Filters
    static let savingsFilters: [SavingsFilter] = [
        SavingsFilter(title: "All", isSelected: true),
        SavingsFilter(title: "Appliances"),
        SavingsFilter(title: "Tools"),
        SavingsFilter(title: "Outdoor"),
        SavingsFilter(title: "Furniture"),
        SavingsFilter(title: "Decor"),
        SavingsFilter(title: "Storage")
    ]

    // MARK: - Put a Bow on Gifting Grid
    // HomeImg41 = "Put a Bow on Gifting" grid (Gifts for Everyone, Under $100, etc.)
    static let giftingGridBanner = ImageBanner(imageName: "HomeImg41")

    // MARK: - Gift Cards Banner
    // HomeImg42 = Gift Cards banner
    static let giftCardsBanner = ImageBanner(imageName: "HomeImg42")

    // MARK: - Make Holiday Magic Grid
    // HomeImg43 = "Make Holiday Magic" grid (Winter Wonderlands, Lights, Outdoor Decor, Trees)
    static let holidayMagicBanner = ImageBanner(imageName: "HomeImg43")

    // MARK: - Kids Workshop Banner
    // HomeImg55 = "FREE KIDS WORKSHOP"
    static let kidsWorkshopBanner = ImageBanner(imageName: "HomeImg55")

    // MARK: - Installation Services
    // HomeImg56 = Installation services image
    static let installationBanner = ImageBanner(imageName: "HomeImg56")

    // MARK: - 12 Months Financing
    // HomeImg57 = "12 MONTHS FINANCING" with HD card
    static let financingBanner = ImageBanner(imageName: "HomeImg57")

    // MARK: - Product Images for Carousels
    // HomeImg58 = RYOBI Miter Saw
    // HomeImg75 = Flooring/laundry room
    // HomeImg100 = Outdoor rug
    static let giftingProducts: [ProductCardData] = [
        ProductCardData(
            imageName: "HomeImg58",
            brand: "RYOBI",
            title: "ONE+ 18V 7-1/4 in. Sliding Miter Saw",
            price: "$199",
            originalPrice: "$249",
            rating: 4.5,
            reviewCount: 1823,
            badge: "Sale",
            isFreeDelivery: true
        ),
        ProductCardData(
            imageName: "HomeImg19",
            brand: "DEWALT",
            title: "20V MAX Cordless Drill/Driver Kit",
            price: "$99",
            originalPrice: "$139",
            rating: 4.7,
            reviewCount: 2341,
            badge: nil,
            isFreeDelivery: true
        ),
        ProductCardData(
            imageName: "HomeImg27",
            brand: "Milwaukee",
            title: "M12 12V Lithium-Ion Combo Kit",
            price: "$129",
            originalPrice: "$199",
            rating: 4.8,
            reviewCount: 3421,
            badge: "Top Rated",
            isFreeDelivery: true
        )
    ]

    // MARK: - Popular Categories (chips)
    static let popularCategories: [PopularCategory] = [
        PopularCategory(title: "Power Tools"),
        PopularCategory(title: "Refrigerators"),
        PopularCategory(title: "Christmas Trees"),
        PopularCategory(title: "Outdoor Decor"),
        PopularCategory(title: "Smart Home"),
        PopularCategory(title: "Storage")
    ]

    // MARK: - Today's Hottest Products
    static let hottestProducts: [ProductCardData] = [
        ProductCardData(
            imageName: "HomeImg75",
            brand: "LifeProof",
            title: "Sterling Oak Vinyl Plank Flooring",
            price: "$3.49/sq.ft",
            originalPrice: nil,
            rating: 4.4,
            reviewCount: 2156,
            badge: "Best Seller",
            isFreeDelivery: true
        ),
        ProductCardData(
            imageName: "HomeImg100",
            brand: "Home Decorators",
            title: "Border Outdoor Area Rug",
            price: "$89",
            originalPrice: "$129",
            rating: 4.3,
            reviewCount: 1892,
            badge: nil,
            isFreeDelivery: false
        )
    ]
}
