import SwiftUI

// MARK: - Design System Type Alias
private typealias DS = DesignSystemGlobal

// MARK: - =============================================
// MARK: - ENHANCED NAVIGATION PATH FOR SHOP
// MARK: - =============================================

/// Navigation path for shop browsing with multi-level hierarchy
enum ShopNavigationDestination: Hashable {
    case departments
    case subcategories(ShopDepartment)
    case categoryDetail(ShopSubcategory)
    case productDetail(String)  // Product ID
}

// MARK: - =============================================
// MARK: - ENHANCED SHOP NAVIGATION VIEW
// MARK: - =============================================

/// Enhanced shop navigation with NavigationStack for deep navigation
struct EnhancedShopNavigationView: View {
    @Binding var isPresented: Bool
    @State private var navigationPath = NavigationPath()

    // MARK: - Design System Values
    private let horizontalPadding = DS.Spacing4  // 16pt
    private let primaryColor = DS.TextOnSurfaceColorPrimary
    private let secondaryColor = DS.TextOnSurfaceColorSecondary
    private let accentColor = DS.Brand300
    private let dividerColor = DS.BorderOnContainerInactive

    var body: some View {
        NavigationStack(path: $navigationPath) {
            departmentsListView
                .navigationDestination(for: ShopDepartment.self) { department in
                    subcategoriesView(for: department)
                }
                .navigationDestination(for: ShopSubcategory.self) { subcategory in
                    categoryDetailView(for: subcategory)
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        closeButton
                    }
                }
        }
    }

    // MARK: - Close Button
    private var closeButton: some View {
        Button {
            withAnimation(.spring(response: 0.35, dampingFraction: 0.85)) {
                isPresented = false
            }
        } label: {
            Image(systemName: "xmark")
                .font(.system(size: DS.FontSizeBodyLg, weight: .medium))
                .foregroundStyle(secondaryColor)
                .frame(width: DS.Spacing11, height: DS.Spacing11)
                .contentShape(Circle())
        }
    }

    // MARK: - Departments List View
    private var departmentsListView: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 0) {
                // Header
                HStack {
                    Text("Shop All Departments")
                        .font(.thdH2)
                        .fontWeight(.bold)
                        .foregroundStyle(primaryColor)

                    Spacer()
                }
                .padding(.horizontal, horizontalPadding)
                .padding(.top, DS.Spacing6)
                .padding(.bottom, DS.Spacing4)

                // Department List
                ForEach(ShopDepartment.allCases) { department in
                    departmentRow(department)

                    if department != ShopDepartment.allCases.last {
                        Divider()
                            .background(dividerColor)
                            .padding(.leading, horizontalPadding + DS.Spacing10)
                    }
                }
            }
            .padding(.bottom, 100)
        }
        .scrollEdgeEffectStyle(.soft, for: .top)
        .scrollEdgeEffectStyle(.soft, for: .bottom)
        .background(DS.BackgroundSurfaceColorGreige)
    }

    // MARK: - Department Row
    private func departmentRow(_ department: ShopDepartment) -> some View {
        Button {
            navigationPath.append(department)
        } label: {
            HStack(spacing: DS.Spacing3) {
                // Icon
                Image(systemName: department.icon)
                    .font(.system(size: DS.FontSizeBodyXl, weight: .medium))
                    .foregroundStyle(accentColor)
                    .frame(width: DS.Spacing8, height: DS.Spacing8)

                // Title - H3 Semibold
                Text(department.rawValue)
                    .font(.thdH3)
                    .fontWeight(.semibold)
                    .foregroundStyle(primaryColor)

                Spacer()

                // Badge with count
                if !department.subcategories.isEmpty {
                    Text("\(department.subcategories.count)")
                        .font(.system(size: DS.FontSizeBodySm, weight: .medium))
                        .foregroundStyle(secondaryColor)
                        .padding(.horizontal, DS.Spacing2)
                        .padding(.vertical, 2)
                        .background(
                            Capsule()
                                .fill(DS.BackgroundContainerColorGreige)
                        )
                }

                // Chevron
                if !department.subcategories.isEmpty {
                    Image(systemName: "chevron.right")
                        .font(.system(size: DS.FontSizeBodyMd, weight: .medium))
                        .foregroundStyle(secondaryColor)
                }
            }
            .padding(.horizontal, horizontalPadding)
            .padding(.vertical, DS.Spacing4)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }

    // MARK: - Subcategories View
    private func subcategoriesView(for department: ShopDepartment) -> some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 0) {
                // Header with department info
                VStack(alignment: .leading, spacing: DS.Spacing3) {
                    HStack {
                        Image(systemName: department.icon)
                            .font(.system(size: 28, weight: .medium))
                            .foregroundStyle(accentColor)

                        VStack(alignment: .leading, spacing: 2) {
                            Text(department.rawValue)
                                .font(.thdH2)
                                .fontWeight(.bold)
                                .foregroundStyle(primaryColor)

                            Text("\(department.subcategories.count) Categories")
                                .font(.thdBodyMd)
                                .foregroundStyle(secondaryColor)
                        }

                        Spacer()
                    }
                    .padding(.horizontal, horizontalPadding)
                    .padding(.top, DS.Spacing6)
                    .padding(.bottom, DS.Spacing2)
                }

                // "Shop All" option
                shopAllButton(for: department)

                Divider()
                    .background(dividerColor)
                    .padding(.horizontal, horizontalPadding)
                    .padding(.vertical, DS.Spacing3)

                // Subcategories Grid
                LazyVGrid(
                    columns: [
                        GridItem(.flexible(), spacing: DS.Spacing3),
                        GridItem(.flexible(), spacing: DS.Spacing3),
                    ],
                    spacing: DS.Spacing3
                ) {
                    ForEach(department.subcategories) { subcategory in
                        subcategoryCard(subcategory)
                    }
                }
                .padding(.horizontal, horizontalPadding)
            }
            .padding(.bottom, 100)
        }
        .scrollEdgeEffectStyle(.soft, for: .top)
        .scrollEdgeEffectStyle(.soft, for: .bottom)
        .background(DS.BackgroundSurfaceColorGreige)
    }

    // MARK: - Shop All Button
    private func shopAllButton(for department: ShopDepartment) -> some View {
        Button {
            // Navigate to department-level view (all products)
            print("Shop all \(department.rawValue)")
        } label: {
            HStack(spacing: DS.Spacing3) {
                Image(systemName: department.icon)
                    .font(.system(size: DS.FontSizeBodyXl, weight: .medium))
                    .foregroundStyle(.white)
                    .frame(width: DS.Spacing8, height: DS.Spacing8)
                    .background(
                        Circle()
                            .fill(accentColor)
                    )

                Text("Shop All \(department.rawValue)")
                    .font(.thdH4)
                    .fontWeight(.semibold)
                    .foregroundStyle(primaryColor)

                Spacer()

                Image(systemName: "arrow.right")
                    .font(.system(size: DS.FontSizeBodyMd, weight: .semibold))
                    .foregroundStyle(accentColor)
            }
            .padding(.horizontal, horizontalPadding)
            .padding(.vertical, DS.Spacing4)
            .background(
                RoundedRectangle(cornerRadius: DS.Spacing3)
                    .fill(accentColor.opacity(0.1))
            )
            .padding(.horizontal, horizontalPadding)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }

    // MARK: - Subcategory Card
    private func subcategoryCard(_ subcategory: ShopSubcategory) -> some View {
        Button {
            navigationPath.append(subcategory)
        } label: {
            VStack(spacing: DS.Spacing2) {
                // Icon in circle
                ZStack {
                    Circle()
                        .fill(accentColor.opacity(0.1))
                        .frame(width: 60, height: 60)

                    Image(systemName: subcategory.icon)
                        .font(.system(size: 28, weight: .medium))
                        .foregroundStyle(accentColor)
                }
                .padding(.top, DS.Spacing4)

                // Title
                Text(subcategory.name)
                    .font(.thdBodySm)
                    .fontWeight(.medium)
                    .foregroundStyle(primaryColor)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.horizontal, DS.Spacing2)
                    .padding(.bottom, DS.Spacing3)

                // Badge if has PLP
                if subcategory.plpCategory != nil {
                    HStack(spacing: 4) {
                        Circle()
                            .fill(Color.green)
                            .frame(width: 6, height: 6)
                        Text("Available")
                            .font(.system(size: 10, weight: .medium))
                            .foregroundStyle(Color.green)
                    }
                    .padding(.horizontal, DS.Spacing2)
                    .padding(.vertical, 2)
                    .background(
                        Capsule()
                            .fill(Color.green.opacity(0.1))
                    )
                    .padding(.bottom, DS.Spacing2)
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 140)
            .background(
                RoundedRectangle(cornerRadius: DS.Spacing3)
                    .fill(Color.white)
                    .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
            )
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }

    // MARK: - Category Detail View (PLP)
    private func categoryDetailView(for subcategory: ShopSubcategory) -> some View {
        Group {
            if let plpCategory = subcategory.plpCategory {
                // Show PLP if available
                EnhancedPLPView(
                    category: plpCategory,
                    subcategoryName: subcategory.name
                )
            } else {
                // Placeholder for categories without PLP
                placeholderView(for: subcategory)
            }
        }
    }

    // MARK: - Placeholder View
    private func placeholderView(for subcategory: ShopSubcategory) -> some View {
        ScrollView {
            VStack(spacing: DS.Spacing6) {
                Image(systemName: subcategory.icon)
                    .font(.system(size: 80, weight: .light))
                    .foregroundStyle(accentColor.opacity(0.3))
                    .padding(.top, 60)

                VStack(spacing: DS.Spacing2) {
                    Text(subcategory.name)
                        .font(.thdH2)
                        .fontWeight(.bold)
                        .foregroundStyle(primaryColor)

                    Text("Coming Soon")
                        .font(.thdBodyLg)
                        .foregroundStyle(secondaryColor)
                }

                Text("This category is currently being populated with products. Check back soon!")
                    .font(.thdBodyMd)
                    .foregroundStyle(secondaryColor)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, DS.Spacing8)

                Spacer()
            }
        }
        .background(DS.BackgroundSurfaceColorGreige)
        .navigationTitle(subcategory.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - =============================================
// MARK: - ENHANCED PLP VIEW WITH NAVIGATION
// MARK: - =============================================

/// Enhanced PLP View that shows breadcrumb navigation and uses JSON data
struct EnhancedPLPView: View {
    // MARK: - State
    @State private var products: [Product] = []
    @State private var pipDatasets: [PIPDataset] = []
    @State private var selectedStylePill: String? = nil
    @State private var selectedFilterPills: Set<String> = []
    @State private var selectedSubFilters: Set<String> = []
    @State private var viewMode: PLPViewMode = .list
    @State private var categoryData: CategoryPageData?

    // MARK: - Configuration
    let category: PLPCategory
    let subcategoryName: String

    // Computed properties
    private var categoryTitle: String {
        categoryData?.pageInfo.categoryName.uppercased() ?? category.title
    }

    private var stylePills: [DSStylePillItem] {
        category.stylePills
    }

    private var filterPills: [DSFilterPillItem] {
        // Use JSON filters if available
        if let jsonFilters = categoryData?.filters {
            return jsonFilters.prefix(4).map { filter in
                DSFilterPillItem(text: filter.filterGroupName)
            }
        }
        return category.filterPills
    }

    private var subFilterPills: [DSFilterPillItem] {
        // Use JSON quick filters if available
        if let quickFilters = categoryData?.quickFilters {
            return quickFilters.map { filter in
                DSFilterPillItem(text: filter.label)
            }
        }
        return category.subFilterPills
    }

    private var resultsCountText: String {
        if let totalResults = categoryData?.pageInfo.totalResults {
            return "\(totalResults) Results"
        }
        return "\(products.count) Results"
    }

    private var breadcrumbs: [CategoryPageData.PageInfo.Breadcrumb] {
        categoryData?.pageInfo.breadcrumbs ?? []
    }

    // MARK: - Body
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                // Breadcrumb Navigation
                if !breadcrumbs.isEmpty {
                    breadcrumbView
                        .padding(.horizontal, DS.Spacing4)
                        .padding(.vertical, DS.Spacing3)
                }

                // Hero Banner (if available)
                if let heroImage = categoryData?.pageInfo.heroImage {
                    heroBanner(heroImage)
                        .padding(.horizontal, DS.Spacing4)
                        .padding(.bottom, DS.Spacing4)
                }

                // Featured Brands (if available)
                if let brands = categoryData?.featuredBrands, !brands.isEmpty {
                    featuredBrandsView(brands)
                        .padding(.bottom, DS.Spacing4)
                }

                // Filter Panel Section
                DSPlpFilterPanel(
                    title: categoryTitle,
                    stylePills: stylePills,
                    resultsCount: resultsCountText,
                    filterPills: filterPills,
                    subFilterPills: subFilterPills,
                    onStylePillTap: { item in
                        handleStylePillTap(item)
                    },
                    onFilterPillTap: { item in
                        handleFilterPillTap(item)
                    },
                    onSubFilterPillTap: { item in
                        handleSubFilterTap(item)
                    }
                )
                .padding(.horizontal, DS.Spacing4)

                // Product List/Grid
                productInventory
                    .padding(.horizontal, DS.Spacing4)
            }
            .padding(.bottom, 100)
        }
        .scrollEdgeEffectStyle(.soft, for: .top)
        .scrollEdgeEffectStyle(.soft, for: .bottom)
        .background(DS.BackgroundSurfaceColorGreige)
        .navigationTitle(subcategoryName)
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            loadCategoryData()
            loadProducts()
        }
    }

    // MARK: - Breadcrumb View
    private var breadcrumbView: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: DS.Spacing2) {
                ForEach(Array(breadcrumbs.enumerated()), id: \.offset) { index, breadcrumb in
                    HStack(spacing: DS.Spacing2) {
                        Button {
                            print("Navigate to: \(breadcrumb.url)")
                        } label: {
                            Text(breadcrumb.label)
                                .font(.system(size: DS.FontSizeBodySm))
                                .foregroundStyle(
                                    index == breadcrumbs.count - 1
                                        ? DS.TextOnSurfaceColorPrimary
                                        : DS.Brand300
                                )
                        }

                        if index < breadcrumbs.count - 1 {
                            Image(systemName: "chevron.right")
                                .font(.system(size: 10, weight: .medium))
                                .foregroundStyle(DS.TextOnSurfaceColorSecondary)
                        }
                    }
                }
            }
        }
    }

    // MARK: - Hero Banner
    private func heroBanner(_ heroImage: CategoryPageData.PageInfo.HeroImage) -> some View {
        VStack(alignment: .leading, spacing: DS.Spacing2) {
            if let promoText = heroImage.promoText {
                Text(promoText)
                    .font(.thdH3)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .padding(DS.Spacing4)
            }
        }
        .frame(maxWidth: .infinity, minHeight: 120)
        .background(
            RoundedRectangle(cornerRadius: DS.Spacing3)
                .fill(
                    LinearGradient(
                        colors: [DS.Brand300, DS.Brand300.opacity(0.7)],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
        )
    }

    // MARK: - Featured Brands View
    private func featuredBrandsView(_ brands: [CategoryPageData.FeaturedBrand]) -> some View {
        VStack(alignment: .leading, spacing: DS.Spacing3) {
            Text("Featured Brands")
                .font(.thdH4)
                .fontWeight(.semibold)
                .foregroundStyle(DS.TextOnSurfaceColorPrimary)
                .padding(.horizontal, DS.Spacing4)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: DS.Spacing3) {
                    ForEach(brands, id: \.brandId) { brand in
                        Button {
                            print("Filter by brand: \(brand.brandName)")
                        } label: {
                            VStack(spacing: DS.Spacing2) {
                                // Brand logo placeholder
                                RoundedRectangle(cornerRadius: DS.Spacing2)
                                    .fill(Color.white)
                                    .frame(width: 80, height: 80)
                                    .overlay(
                                        Text(brand.brandName)
                                            .font(.system(size: 12, weight: .bold))
                                            .foregroundStyle(DS.TextOnSurfaceColorPrimary)
                                            .multilineTextAlignment(.center)
                                            .padding(DS.Spacing2)
                                    )
                            }
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal, DS.Spacing4)
            }
        }
    }

    // MARK: - Product Inventory
    private var productInventory: some View {
        Group {
            if products.isEmpty {
                emptyStateView
            } else if viewMode == .list {
                productListView
            } else {
                productGridView
            }
        }
    }

    // MARK: - Empty State
    private var emptyStateView: some View {
        VStack(spacing: DS.Spacing4) {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 60, weight: .light))
                .foregroundStyle(DS.IconOnContainerColorInactive)
                .padding(.top, 60)

            Text("No Products Found")
                .font(.thdH3)
                .fontWeight(.semibold)
                .foregroundStyle(DS.TextOnSurfaceColorPrimary)

            Text("Try adjusting your filters")
                .font(.thdBodyMd)
                .foregroundStyle(DS.TextOnSurfaceColorSecondary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 60)
    }

    // MARK: - List View
    private var productListView: some View {
        LazyVStack(spacing: DS.Spacing4) {
            ForEach(filteredProducts) { product in
                productCard(for: product)
            }
        }
        .padding(.top, DS.Spacing4)
    }

    // MARK: - Grid View
    private var productGridView: some View {
        LazyVGrid(
            columns: [
                GridItem(.flexible(), spacing: DS.Spacing3),
                GridItem(.flexible(), spacing: DS.Spacing3),
            ],
            spacing: DS.Spacing3
        ) {
            ForEach(filteredProducts) { product in
                productCard(for: product)
            }
        }
        .padding(.top, DS.Spacing4)
    }

    // MARK: - Product Card Helper
    private func productCard(for product: Product) -> some View {
        PLPProductPod(
            product: product,
            onTap: {
                print("Product tapped: \(product.id)")
            },
            onAddToCart: {
                print("Add to cart: \(product.id)")
            },
            onAddToList: {
                print("Add to list: \(product.id)")
            }
        )
    }

    // MARK: - Price Formatting Helper
    private func formatPrice(_ currentPrice: Decimal, originalPrice: Decimal?) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "USD"

        if let originalPrice = originalPrice, originalPrice > currentPrice {
            let currentFormatted =
                formatter.string(from: currentPrice as NSDecimalNumber) ?? "$\(currentPrice)"
            let originalFormatted =
                formatter.string(from: originalPrice as NSDecimalNumber) ?? "$\(originalPrice)"
            return "\(currentFormatted) was \(originalFormatted)"
        } else {
            return formatter.string(from: currentPrice as NSDecimalNumber) ?? "$\(currentPrice)"
        }
    }

    // MARK: - Filtered Products
    private var filteredProducts: [Product] {
        var filtered = products

        // Filter by selected style pill
        if let selectedStyle = selectedStylePill {
            // Apply style filter logic
            // TODO: Implement style-based filtering when style data is available
            _ = selectedStyle  // Acknowledge the variable is used
        }

        // Apply other filters
        // TODO: Add filter logic based on selectedFilterPills and selectedSubFilters

        return filtered
    }

    // MARK: - Data Loading
    private func loadCategoryData() {
        // Load category-specific JSON if available
        if let filename = category.categoryJSONFilename {
            categoryData = CategoryDataLoader.shared.loadCategoryData(filename: filename)

            if let data = categoryData {
                print("✅ Loaded category data from \(filename).json")
                print("   📊 Total products: \(data.pageInfo.totalResults)")
                print("   🎨 Style pills: \(data.categoryStyles?.count ?? 0)")
                print("   🔍 Filters: \(data.filters.count)")
            }
        }
    }

    private func loadProducts() {
        // Load products from JSON if available
        if let data = categoryData {
            // Convert JSON products to Product model
            products = data.products.map { jsonProduct in
                Product(
                    id: jsonProduct.productId,
                    brand: jsonProduct.brand,
                    name: jsonProduct.title,
                    modelNumber: jsonProduct.modelNumber,
                    heroImage: jsonProduct.images.primary,
                    thumbnailImages: jsonProduct.images.alternate.map { [$0] } ?? [],
                    additionalImageCount: 0,
                    currentPrice: Decimal(jsonProduct.price.current),
                    originalPrice: jsonProduct.price.original.map { Decimal($0) },
                    savingsPercentage: jsonProduct.price.savingsPercent,
                    rating: jsonProduct.rating.average,
                    reviewCount: jsonProduct.rating.count,
                    isExclusive: jsonProduct.badges.contains(where: { $0.type == "exclusive" }),
                    promotionalBadge: jsonProduct.badges.first(where: { $0.type == "delivery" })?
                        .label,
                    pickupInfo: jsonProduct.availability.inStorePickup
                        ? FulfillmentInfo(primaryValue: "Available") : nil,
                    deliveryInfo: jsonProduct.availability.delivery
                        ? FulfillmentInfo(primaryValue: "Available") : nil,
                    fasterDeliveryInfo: nil,
                    internetNumber: nil,
                    storeSKU: jsonProduct.storeSkuNumber,
                    isSponsored: false,
                    availableColors: jsonProduct.images.colorSwatches?.map { swatch in
                        Product.ProductColor(colorHex: swatch.color, borderColorHex: nil)
                    },
                    additionalColorCount: max(0, (jsonProduct.images.colorSwatches?.count ?? 0) - 3)
                )
            }

            print(
                "📦 Loaded \(products.count) products from \(category.categoryJSONFilename ?? "unknown").json"
            )
        } else {
            // Fallback: Load from pip-datasets.json
            pipDatasets = PLPDataLoader.shared.loadPIPDatasets()

            // Filter by breadcrumb
            let filtered = pipDatasets.filter { dataset in
                dataset.breadcrumbs.contains { breadcrumb in
                    breadcrumb.label.localizedCaseInsensitiveContains(category.breadcrumbFilter)
                }
            }

            // Convert to Product model
            products = filtered.map { dataset in
                Product(
                    id: dataset.productId,
                    brand: dataset.brand.name,
                    name: dataset.title,
                    modelNumber: dataset.identifiers.modelNumber,
                    heroImage: dataset.media.primaryImage,
                    thumbnailImages: [],
                    additionalImageCount: 0,
                    currentPrice: Decimal(dataset.pricing.currentPrice),
                    originalPrice: dataset.pricing.originalPrice.map { Decimal($0) },
                    savingsPercentage: dataset.pricing.savingsPercent,
                    rating: dataset.rating.average,
                    reviewCount: dataset.rating.count,
                    isExclusive: dataset.badges.contains(where: { $0.type == "exclusive" }),
                    promotionalBadge: dataset.badges.first(where: { $0.type == "delivery" })?.label,
                    pickupInfo: dataset.availability.inStorePickup.available
                        ? FulfillmentInfo(primaryValue: "Available") : nil,
                    deliveryInfo: dataset.availability.delivery.available
                        ? FulfillmentInfo(primaryValue: "Available") : nil,
                    fasterDeliveryInfo: nil,
                    internetNumber: nil,
                    storeSKU: dataset.identifiers.storeSkuNumber,
                    isSponsored: false,
                    availableColors: dataset.variants.compactMap { variant in
                        guard let swatchUrl = variant.swatchUrl else { return nil }
                        return Product.ProductColor(
                            colorHex: variant.variantValue, borderColorHex: nil)
                    },
                    additionalColorCount: max(0, dataset.variants.count - 3)
                )
            }

            print("📦 Loaded \(products.count) products from pip-datasets.json")
        }
    }

    // MARK: - Filter Handlers
    private func handleStylePillTap(_ item: DSStylePillItem) {
        if selectedStylePill == item.text {
            selectedStylePill = nil
        } else {
            selectedStylePill = item.text
        }
    }

    private func handleFilterPillTap(_ item: DSFilterPillItem) {
        if selectedFilterPills.contains(item.text) {
            selectedFilterPills.remove(item.text)
        } else {
            selectedFilterPills.insert(item.text)
        }
    }

    private func handleSubFilterTap(_ item: DSFilterPillItem) {
        if selectedSubFilters.contains(item.text) {
            selectedSubFilters.remove(item.text)
        } else {
            selectedSubFilters.insert(item.text)
        }
    }
}

// MARK: - =============================================
// MARK: - SHOP SUBCATEGORY HASHABLE CONFORMANCE
// MARK: - =============================================

extension ShopSubcategory: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
    }

    static func == (lhs: ShopSubcategory, rhs: ShopSubcategory) -> Bool {
        lhs.id == rhs.id && lhs.name == rhs.name
    }
}

// MARK: - =============================================
// MARK: - PREVIEW
// MARK: - =============================================

#Preview("Enhanced Shop Navigation") {
    struct PreviewWrapper: View {
        @State private var isPresented = true

        var body: some View {
            EnhancedShopNavigationView(isPresented: $isPresented)
        }
    }

    return PreviewWrapper()
}

#Preview("Enhanced PLP View") {
    NavigationStack {
        EnhancedPLPView(
            category: .refrigerators,
            subcategoryName: "French Door Refrigerators"
        )
    }
}
