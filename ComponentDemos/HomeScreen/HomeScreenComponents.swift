import SwiftUI

// MARK: - Color Extensions
extension Color {
    static var brandPrimary: Color {
        DesignSystemGlobal.Brand500
    }

    static var textPrimary: Color {
        DesignSystemGlobal.TextOnSurfaceColorPrimary
    }

    static var textSecondary: Color {
        DesignSystemGlobal.TextOnSurfaceColorSecondary
    }

    static var textTertiary: Color {
        DesignSystemGlobal.TextOnSurfaceColorTertiary
    }

    static var containerBackground: Color {
        DesignSystemGlobal.BackgroundContainerColorWhite
    }

    static var borderDefault: Color {
        DesignSystemGlobal.Greige200
    }

    static var surfaceBackground: Color {
        DesignSystemGlobal.BackgroundSurfaceColorGreige
    }
}

// MARK: - App Theme
struct AppTheme {
    static let cornerRadiusSmall: CGFloat = DesignSystemGlobal.BorderRadiusSm
    static let cornerRadiusMedium: CGFloat = DesignSystemGlobal.BorderRadiusMd
    static let cornerRadiusLarge: CGFloat = DesignSystemGlobal.BorderRadiusLg
    static let cornerRadiusFull: CGFloat = DesignSystemGlobal.BorderRadiusFull
}

// MARK: - =============================================
// MARK: - HOME SCREEN COMPONENTS
// MARK: - =============================================

// MARK: - Search Bar Component
struct HomeSearchBar: View {
    @Binding var searchText: String
    var storeNumber: String = "#1835"
    var storeName: String = "Sunnyvale"

    var body: some View {
        HStack(spacing: 12) {
            // Search Field
            HStack(spacing: 8) {
                Text("Search")
                    .font(.system(size: 16))
                    .foregroundStyle(Color.textTertiary)

                Spacer()
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            .background(Color.containerBackground)
            .cornerRadius(AppTheme.cornerRadiusMedium)
            .overlay(
                RoundedRectangle(cornerRadius: AppTheme.cornerRadiusMedium)
                    .stroke(Color.borderDefault, lineWidth: 1)
            )

            // Store selector
            Button(action: {}) {
                HStack(spacing: 4) {
                    Image(systemName: "mappin.circle.fill")
                        .font(.system(size: 16))
                    Text("\(storeName) \(storeNumber)")
                        .font(.system(size: 12, weight: .medium))
                        .lineLimit(1)
                }
                .foregroundStyle(Color.textPrimary)
            }

            // Cart icon
            Button(action: {}) {
                Image(systemName: "cart")
                    .font(.system(size: 20))
                    .foregroundStyle(Color.textPrimary)
            }
        }
        .padding(.horizontal, 16)
    }
}

// MARK: - Hero Banner Component (Orange banner with text)
struct HeroBannerView: View {
    let banner: HeroBanner
    var fullWidth: Bool = false

    var body: some View {
        ZStack {
            if let imageName = banner.imageName {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: fullWidth ? .fit : .fill)
                    .frame(maxWidth: .infinity)
            } else if let bgColor = banner.backgroundColor {
                bgColor
            }

            // Content overlay
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    if let title = banner.title {
                        Text(title)
                            .font(.system(size: 20, weight: .bold))
                            .foregroundStyle(.white)
                    }

                    if let ctaText = banner.ctaText {
                        Text(ctaText)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundStyle(.white)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(Color.black.opacity(0.3))
                            .cornerRadius(AppTheme.cornerRadiusFull)
                    }
                }
                .padding(20)

                Spacer()
            }
        }
        .if(!fullWidth) { view in
            view.frame(height: 120)
        }
        .clipped()
        .if(!fullWidth) { view in
            view.cornerRadius(AppTheme.cornerRadiusMedium)
        }
        .if(!fullWidth) { view in
            view.padding(.horizontal, 16)
        }
    }
}

// MARK: - Recently Viewed Section
struct HomeRecentlyViewedSection: View {
    let products: [RecentlyViewedProduct]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Recently Viewed")
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(Color.textPrimary)
                .padding(.horizontal, 16)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(products) { product in
                        HomeRecentlyViewedCard(product: product)
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }
}

struct HomeRecentlyViewedCard: View {
    let product: RecentlyViewedProduct

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            // Product Image with badge
            ZStack(alignment: .topLeading) {
                Image(product.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 120)
                    .background(Color.containerBackground)
                    .cornerRadius(8)

                if let badge = product.badge {
                    DSBadge(
                        label: badge,
                        size: .small,
                        variant: .filledStrong,
                        color: badge.contains("$") ? .success : .brand
                    )
                    .padding(6)
                }
            }

            // Price
            HStack(spacing: 4) {
                Text(product.price)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(Color.textPrimary)

                if let original = product.originalPrice {
                    Text(original)
                        .font(.system(size: 12))
                        .foregroundStyle(Color.textTertiary)
                        .strikethrough()
                }
            }

            // Rating
            HStack(spacing: 2) {
                ForEach(0..<5) { index in
                    Image(systemName: index < Int(product.rating) ? "star.fill" : "star")
                        .font(.system(size: 10))
                        .foregroundStyle(.orange)
                }
                Text("(\(product.reviewCount))")
                    .font(.system(size: 10))
                    .foregroundStyle(Color.textSecondary)
            }
        }
        .frame(width: 120)
    }
}

// MARK: - Smart Home Promo Banner
struct SmartHomePromoBanner: View {
    var body: some View {
        ZStack {
            // Background gradient/image area
            LinearGradient(
                colors: [Color(red: 0.95, green: 0.92, blue: 0.88), Color(red: 0.98, green: 0.96, blue: 0.94)],
                startPoint: .leading,
                endPoint: .trailing
            )

            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Up to 45% off Select\nSmart Home &\nHome Security")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(Color.textPrimary)

                    HStack(spacing: 4) {
                        Image(systemName: "clock")
                            .font(.system(size: 12))
                        Text("Today Only! Free Delivery")
                            .font(.system(size: 12, weight: .medium))
                    }
                    .foregroundStyle(Color.brandPrimary)
                }
                .padding(16)

                Spacer()

                // Placeholder for product images
                HStack(spacing: -20) {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.containerBackground)
                        .frame(width: 60, height: 80)
                        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.containerBackground)
                        .frame(width: 60, height: 80)
                        .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                }
                .padding(.trailing, 16)
            }
        }
        .frame(height: 120)
        .cornerRadius(AppTheme.cornerRadiusMedium)
        .padding(.horizontal, 16)
    }
}

// MARK: - Order Status Row (using DSButton style)
struct OrderStatusRow: View {
    var body: some View {
        DSButton(
            "See order · 14 days ago",
            style: .outlined,
            size: .large,
            leadingIcon: Image(systemName: "shippingbox"),
            trailingIcon: Image(systemName: "chevron.right")
        ) {
            // Action
        }
        .padding(.horizontal, 16)
    }
}

// MARK: - Account Quick Actions Grid (2x3)
struct AccountQuickActionsGrid: View {
    let actions: [AccountQuickAction]
    let columns = Array(repeating: GridItem(.flexible(), spacing: 12), count: 3)

    var body: some View {
        LazyVGrid(columns: columns, spacing: 12) {
            ForEach(actions) { action in
                AccountQuickActionCell(action: action)
            }
        }
        .padding(.horizontal, 16)
    }
}

struct AccountQuickActionCell: View {
    let action: AccountQuickAction

    var body: some View {
        Button(action: {}) {
            VStack(spacing: 8) {
                Image(systemName: action.iconName)
                    .font(.system(size: 24))
                    .foregroundStyle(Color.textPrimary)

                Text(action.title)
                    .font(.system(size: 12, weight: .medium))
                    .foregroundStyle(Color.textPrimary)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .minimumScaleFactor(0.8)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background(Color.containerBackground)
            .cornerRadius(AppTheme.cornerRadiusMedium)
        }
    }
}

// MARK: - Shop Deals Button (Full-width orange using DSButton)
struct ShopDealsButton: View {
    var body: some View {
        DSButton(
            "Shop Deals",
            style: .orangeFilled,
            size: .large,
            leadingIcon: Image(systemName: "tag.fill")
        ) {
            // Action
        }
        .padding(.horizontal, 16)
    }
}

// MARK: - Top Savings Header with Filter
struct TopSavingsHeader: View {
    @Binding var selectedFilter: String
    let filters: [String]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Top Savings for You")
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(Color.textPrimary)
                .padding(.horizontal, 16)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(filters, id: \.self) { filter in
                        FilterPill(
                            title: filter,
                            isSelected: selectedFilter == filter
                        ) {
                            selectedFilter = filter
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }
}

struct FilterPill: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        DSPill(
            title,
            style: isSelected ? .filled : .outlined,
            size: .medium,
            state: isSelected ? .selected : .default,
            action: action
        )
    }
}

// MARK: - Product Carousel Section
struct ProductCarouselSection: View {
    let title: String
    let subtitle: String?
    let products: [ProductCardData]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundStyle(Color.textPrimary)

                if let subtitle = subtitle {
                    Text(subtitle)
                        .font(.system(size: 14))
                        .foregroundStyle(Color.textSecondary)
                }
            }
            .padding(.horizontal, 16)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(products) { product in
                        HomeProductCard(product: product)
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }
}

struct HomeProductCard: View {
    let product: ProductCardData

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Product Image
            ZStack(alignment: .topLeading) {
                Image(product.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 140, height: 140)
                    .background(Color.containerBackground)
                    .cornerRadius(8)

                if let badge = product.badge {
                    DSBadge(
                        label: badge,
                        size: .small,
                        variant: .filledStrong,
                        color: .brand
                    )
                    .padding(6)
                }
            }

            // Brand
            Text(product.brand)
                .font(.system(size: 11, weight: .medium))
                .foregroundStyle(Color.textSecondary)

            // Title
            Text(product.title)
                .font(.system(size: 12))
                .foregroundStyle(Color.textPrimary)
                .lineLimit(2)

            // Price
            HStack(spacing: 4) {
                Text(product.price)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(Color.textPrimary)

                if let original = product.originalPrice {
                    Text(original)
                        .font(.system(size: 12))
                        .foregroundStyle(Color.textTertiary)
                        .strikethrough()
                }
            }

            // Rating
            HStack(spacing: 2) {
                ForEach(0..<5) { index in
                    Image(systemName: index < Int(product.rating) ? "star.fill" : "star")
                        .font(.system(size: 10))
                        .foregroundStyle(.orange)
                }
                Text("(\(product.reviewCount))")
                    .font(.system(size: 10))
                    .foregroundStyle(Color.textSecondary)
            }

            // Free Delivery badge
            if product.isFreeDelivery {
                HStack(spacing: 4) {
                    Image(systemName: "truck.box")
                        .font(.system(size: 10))
                    Text("Free Delivery")
                        .font(.system(size: 10, weight: .medium))
                }
                .foregroundStyle(Color.green)
            }
        }
        .frame(width: 140)
        .padding(12)
        .background(Color.containerBackground)
        .cornerRadius(AppTheme.cornerRadiusMedium)
    }
}

// MARK: - Lifestyle Banner (Full-width image)
struct LifestyleBannerView: View {
    let banner: LifestyleBanner
    let height: CGFloat

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            RoundedRectangle(cornerRadius: AppTheme.cornerRadiusMedium)
                .fill(Color(red: 0.85, green: 0.88, blue: 0.82))
                .frame(height: height)
                .overlay(
                    Image(systemName: "photo")
                        .font(.system(size: 48))
                        .foregroundStyle(Color.textTertiary)
                )

            if let title = banner.title {
                Text(title)
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(.white)
                    .shadow(color: .black.opacity(0.3), radius: 2, x: 0, y: 1)
                    .padding(20)
            }
        }
        .padding(.horizontal, 16)
    }
}

// MARK: - Paired Promo Cards (Side by side)
struct PairedPromoCardsSection: View {
    let cards: [PromoCard]

    var body: some View {
        HStack(spacing: 12) {
            ForEach(cards.prefix(2)) { card in
                PairedPromoCard(card: card)
            }
        }
        .padding(.horizontal, 16)
    }
}

struct PairedPromoCard: View {
    let card: PromoCard

    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: AppTheme.cornerRadiusMedium)
                .fill(card.backgroundColor ?? Color.surfaceBackground)
                .frame(height: 180)

            VStack(alignment: .leading, spacing: 8) {
                // Percentage badge
                if let percentOff = card.percentOff {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("UP TO")
                            .font(.system(size: 10, weight: .medium))
                        Text(percentOff.replacingOccurrences(of: "UP TO\n", with: ""))
                            .font(.system(size: 24, weight: .bold))
                    }
                    .foregroundStyle(card.backgroundColor == Color(red: 0.2, green: 0.35, blue: 0.3) ? .white : Color.textPrimary)
                }

                Spacer()

                // Title
                Text(card.title)
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundStyle(card.backgroundColor == Color(red: 0.2, green: 0.35, blue: 0.3) ? .white : Color.textPrimary)
                    .lineLimit(3)
            }
            .padding(12)
        }
        .frame(maxWidth: .infinity)
    }
}

// MARK: - Shop by Category List (Screen 4)
/// Always-expanded category list with native NavigationLinks
struct ShopByCategoryList: View {
    let categories: [ShopCategory]

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Header
            Text("Shop by Category")
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(Color.textPrimary)
                .padding(.horizontal, 16)
                .padding(.vertical, 12)

            // Always visible category list
            VStack(spacing: 0) {
                ForEach(categories) { category in
                    CategoryListRow(category: category)
                }
            }
        }
        .background(Color.containerBackground)
        .clipShape(RoundedRectangle(cornerRadius: AppTheme.cornerRadiusMedium))
    }
}

struct CategoryListRow: View {
    let category: ShopCategory

    var body: some View {
        NavigationLink(destination: CategoryDetailView(category: category)) {
            HStack(spacing: 12) {
                // Category Icon
                ZStack {
                    Circle()
                        .fill(DesignSystemGlobal.Brand050)
                        .frame(width: 40, height: 40)

                    Image(systemName: category.iconName)
                        .font(.system(size: 18))
                        .foregroundStyle(Color.brandPrimary)
                }

                Text(category.name)
                    .font(.system(size: 16))
                    .foregroundStyle(Color.textPrimary)

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundStyle(Color.textTertiary)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(Color.containerBackground)
        }
        .buttonStyle(.plain)

        Divider()
            .padding(.leading, 72)
    }
}

// MARK: - Category Detail View (Navigation Destination)
struct CategoryDetailView: View {
    let category: ShopCategory

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                // Category Header
                VStack(spacing: 16) {
                    ZStack {
                        Circle()
                            .fill(DesignSystemGlobal.Brand050)
                            .frame(width: 80, height: 80)

                        Image(systemName: category.iconName)
                            .font(.system(size: 36))
                            .foregroundStyle(Color.brandPrimary)
                    }

                    Text(category.name)
                        .font(.system(size: 24, weight: .bold))
                        .foregroundStyle(Color.textPrimary)
                }
                .padding(.vertical, 24)
                .frame(maxWidth: .infinity)
                .background(Color.containerBackground)

                SectionDivider()

                // Subcategories Section
                VStack(alignment: .leading, spacing: 0) {
                    Text("Shop \(category.name)")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundStyle(Color.textPrimary)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)

                    // Sample subcategories based on category
                    ForEach(getSubcategories(for: category), id: \.self) { subcategory in
                        NavigationLink(destination: SubcategoryView(categoryName: category.name, subcategoryName: subcategory)) {
                            HStack {
                                Text(subcategory)
                                    .font(.system(size: 16))
                                    .foregroundStyle(Color.textPrimary)

                                Spacer()

                                Image(systemName: "chevron.right")
                                    .font(.system(size: 12, weight: .semibold))
                                    .foregroundStyle(Color.textTertiary)
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 14)
                            .background(Color.containerBackground)
                        }
                        .buttonStyle(.plain)

                        Divider()
                            .padding(.leading, 16)
                    }
                }
                .background(Color.containerBackground)

                SectionDivider()

                // Featured Products Placeholder
                VStack(alignment: .leading, spacing: 12) {
                    Text("Featured in \(category.name)")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundStyle(Color.textPrimary)
                        .padding(.horizontal, 16)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 12) {
                            ForEach(0..<4) { index in
                                CategoryProductPlaceholder(index: index)
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                }
                .padding(.vertical, 16)
            }
        }
        .background(Color.surfaceBackground)
        .navigationTitle(category.name)
        .navigationBarTitleDisplayMode(.inline)
    }

    // Helper to generate sample subcategories
    private func getSubcategories(for category: ShopCategory) -> [String] {
        switch category.name {
        case "Appliances":
            return ["Refrigerators", "Washers & Dryers", "Dishwashers", "Ranges", "Microwaves", "Freezers"]
        case "Tools":
            return ["Power Tools", "Hand Tools", "Tool Storage", "Air Tools", "Workbenches", "Tool Sets"]
        case "Bath & Faucets":
            return ["Vanities", "Toilets", "Showers", "Bathtubs", "Faucets", "Bathroom Accessories"]
        case "Flooring":
            return ["Vinyl Flooring", "Hardwood", "Laminate", "Tile", "Carpet", "Floor Installation"]
        case "Lawn & Garden":
            return ["Mowers", "Outdoor Power", "Plants", "Patio Furniture", "Grills", "Landscaping"]
        case "Lighting & Ceiling Fans":
            return ["Ceiling Fans", "Chandeliers", "Pendant Lights", "Outdoor Lighting", "LED Bulbs", "Lamps"]
        case "Paint":
            return ["Interior Paint", "Exterior Paint", "Paint Samples", "Stains", "Painting Supplies", "Primers"]
        case "Kitchen":
            return ["Cabinets", "Countertops", "Sinks", "Kitchen Faucets", "Garbage Disposals", "Range Hoods"]
        default:
            return ["Shop All \(category.name)", "Best Sellers", "New Arrivals", "On Sale", "Top Rated"]
        }
    }
}

// MARK: - Subcategory View (Second level navigation)
struct SubcategoryView: View {
    let categoryName: String
    let subcategoryName: String

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Breadcrumb
                HStack(spacing: 4) {
                    Text(categoryName)
                        .font(.system(size: 12))
                        .foregroundStyle(Color.textSecondary)
                    Image(systemName: "chevron.right")
                        .font(.system(size: 10))
                        .foregroundStyle(Color.textTertiary)
                    Text(subcategoryName)
                        .font(.system(size: 12))
                        .foregroundStyle(Color.textPrimary)
                }
                .padding(.horizontal, 16)
                .padding(.top, 8)

                // Filter Bar
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        FilterChip(title: "Sort", icon: "arrow.up.arrow.down")
                        FilterChip(title: "Brand", icon: nil)
                        FilterChip(title: "Price", icon: nil)
                        FilterChip(title: "Rating", icon: "star.fill")
                        FilterChip(title: "Availability", icon: nil)
                    }
                    .padding(.horizontal, 16)
                }

                // Results count
                Text("24 Results")
                    .font(.system(size: 14))
                    .foregroundStyle(Color.textSecondary)
                    .padding(.horizontal, 16)

                // Product Grid Placeholder
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                    ForEach(0..<6) { index in
                        SubcategoryProductCard(index: index)
                    }
                }
                .padding(.horizontal, 16)
            }
            .padding(.bottom, 24)
        }
        .background(Color.surfaceBackground)
        .navigationTitle(subcategoryName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Filter Chip
struct FilterChip: View {
    let title: String
    let icon: String?

    var body: some View {
        DSPill(
            title,
            style: .outlined,
            size: .medium,
            trailingIcon: Image(systemName: icon ?? "chevron.down")
        )
    }
}

// MARK: - Category Product Placeholder
struct CategoryProductPlaceholder: View {
    let index: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.surfaceBackground)
                .frame(width: 140, height: 140)
                .overlay(
                    Image(systemName: "photo")
                        .font(.system(size: 32))
                        .foregroundStyle(Color.textTertiary)
                )

            Text("$\(99 + index * 50)")
                .font(.system(size: 16, weight: .bold))
                .foregroundStyle(Color.textPrimary)

            Text("Sample Product \(index + 1)")
                .font(.system(size: 12))
                .foregroundStyle(Color.textSecondary)
                .lineLimit(2)
        }
        .frame(width: 140)
        .padding(12)
        .background(Color.containerBackground)
        .cornerRadius(AppTheme.cornerRadiusMedium)
    }
}

// MARK: - Subcategory Product Card
struct SubcategoryProductCard: View {
    let index: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Product Image
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.containerBackground)
                .aspectRatio(1, contentMode: .fit)
                .overlay(
                    Image(systemName: "photo")
                        .font(.system(size: 32))
                        .foregroundStyle(Color.textTertiary)
                )

            // Price
            Text("$\(149 + index * 75)")
                .font(.system(size: 16, weight: .bold))
                .foregroundStyle(Color.textPrimary)

            // Rating
            HStack(spacing: 2) {
                ForEach(0..<5) { star in
                    Image(systemName: star < 4 ? "star.fill" : "star")
                        .font(.system(size: 10))
                        .foregroundStyle(.orange)
                }
                Text("(\(120 + index * 30))")
                    .font(.system(size: 10))
                    .foregroundStyle(Color.textSecondary)
            }

            // Title
            Text("Product Name Here")
                .font(.system(size: 12))
                .foregroundStyle(Color.textSecondary)
                .lineLimit(2)

            // Free Delivery badge
            if index % 2 == 0 {
                HStack(spacing: 4) {
                    Image(systemName: "truck.box")
                        .font(.system(size: 10))
                    Text("Free Delivery")
                        .font(.system(size: 10, weight: .medium))
                }
                .foregroundStyle(.green)
            }
        }
        .padding(12)
        .background(Color.containerBackground)
        .cornerRadius(AppTheme.cornerRadiusMedium)
    }
}

// MARK: - Popular Categories Chips
struct PopularCategoriesSection: View {
    let categories: [PopularCategory]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Popular Categories")
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(Color.textPrimary)
                .padding(.horizontal, 16)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 8) {
                    ForEach(categories) { category in
                        Text(category.title)
                            .font(.system(size: 14, weight: .medium))
                            .foregroundStyle(Color.textPrimary)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(Color.containerBackground)
                            .cornerRadius(AppTheme.cornerRadiusFull)
                            .overlay(
                                RoundedRectangle(cornerRadius: AppTheme.cornerRadiusFull)
                                    .stroke(Color.borderDefault, lineWidth: 1)
                            )
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }
}

// MARK: - 12 Days of Deals Banner
struct TwelveDaysBanner: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: AppTheme.cornerRadiusMedium)
                .fill(Color.brandPrimary)
                .frame(height: 100)

            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 8) {
                        Text("12")
                            .font(.system(size: 48, weight: .bold))
                        VStack(alignment: .leading) {
                            Text("DAYS OF")
                                .font(.system(size: 14, weight: .bold))
                            Text("DEALS")
                                .font(.system(size: 20, weight: .bold))
                        }
                    }
                    .foregroundStyle(.white)
                }
                .padding(.leading, 20)

                Spacer()

                Image(systemName: "chevron.right")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(.white)
                    .padding(.trailing, 20)
            }
        }
        .padding(.horizontal, 16)
    }
}

// MARK: - Section Divider
struct SectionDivider: View {
    var body: some View {
        Rectangle()
            .fill(Color.surfaceBackground)
            .frame(height: 8)
    }
}

// MARK: - Section Header with See All
struct SectionHeader: View {
    let title: String
    let showSeeAll: Bool

    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(Color.textPrimary)

            Spacer()

            if showSeeAll {
                Button(action: {}) {
                    HStack(spacing: 4) {
                        Text("See All")
                            .font(.system(size: 14, weight: .semibold))
                        Image(systemName: "chevron.right")
                            .font(.system(size: 12, weight: .semibold))
                    }
                    .foregroundStyle(Color.brandPrimary)
                }
            }
        }
        .padding(.horizontal, 16)
    }
}

// MARK: - Full-Width Image Banner (for static images from mockups)
struct ImageBannerView: View {
    let banner: ImageBanner
    var height: CGFloat? = nil
    var cornerRadius: CGFloat = AppTheme.cornerRadiusMedium

    var body: some View {
        Image(banner.imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: .infinity)
            .if(height != nil) { view in
                view.frame(height: height)
            }
            .cornerRadius(cornerRadius)
            .padding(.horizontal, 16)
    }
}

// MARK: - View Extension for conditional modifiers
extension View {
    @ViewBuilder
    func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}
