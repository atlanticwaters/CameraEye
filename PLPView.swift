import SwiftUI

// MARK: - =============================================
// MARK: - PRODUCT LISTING PAGE (PLP) VIEW
// MARK: - =============================================
//
// This is a comprehensive Product Listing Page that combines:
// - DSPlpFilterPanel: Title, style pills, results count, and filters
// - ProductCard: Individual product display cards
// - Product data models from ProductSystem.swift
//
// The PLP structure follows The Home Depot design system with:
// 1. Filter Panel at top (category, style navigation, filters)
// 2. Product inventory grid/list below
// 3. Sort and view mode controls

// MARK: - Main PLP View

struct PLPView: View {
    // MARK: - State
    @State private var products: [Product] = []
    @State private var selectedStylePill: String? = nil
    @State private var selectedFilterPills: Set<String> = []
    @State private var selectedSubFilters: Set<String> = []
    @State private var sortOption: SortOption = .topRated
    @State private var viewMode: PLPViewMode = .list
    
    // MARK: - Configuration
    let categoryTitle: String
    let stylePills: [DSStylePillItem]
    let filterPills: [DSFilterPillItem]
    let subFilterPills: [DSFilterPillItem]
    
    // MARK: - Body
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
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
                .padding(.horizontal, DesignSystemGlobal.Spacing4)
                
                // Sort and View Mode Bar
                sortViewBar
                    .padding(.horizontal, DesignSystemGlobal.Spacing4)
                    .padding(.vertical, DesignSystemGlobal.Spacing3)
                
                // Product List/Grid
                productInventory
                    .padding(.horizontal, DesignSystemGlobal.Spacing4)
            }
            .padding(.top, 60) // Space for top navigation
            .padding(.bottom, 80) // Space for bottom navigation
        }
        .background(DesignSystemGlobal.BackgroundSurfaceColorGreige)
        .onAppear {
            loadProducts()
        }
    }
    
    // MARK: - Sort and View Mode Bar
    private var sortViewBar: some View {
        HStack {
            // Sort Menu
            Menu {
                ForEach(SortOption.allCases, id: \.self) { option in
                    Button(action: { sortOption = option }) {
                        HStack {
                            Text(option.rawValue)
                            if sortOption == option {
                                Image(systemName: "checkmark")
                            }
                        }
                    }
                }
            } label: {
                HStack(spacing: DesignSystemGlobal.Spacing1) {
                    Text("Sort:")
                        .font(.system(size: DesignSystemGlobal.FontSizeBodySm, weight: .medium))
                        .foregroundColor(DesignSystemGlobal.TextOnSurfaceColorSecondary)
                    
                    Text(sortOption.rawValue)
                        .font(.system(size: DesignSystemGlobal.FontSizeBodySm, weight: .semibold))
                        .foregroundColor(DesignSystemGlobal.TextOnSurfaceColorPrimary)
                    
                    Image(systemName: "chevron.down")
                        .font(.system(size: 12))
                        .foregroundColor(DesignSystemGlobal.TextOnSurfaceColorPrimary)
                }
                .padding(.horizontal, DesignSystemGlobal.Spacing3)
                .padding(.vertical, DesignSystemGlobal.Spacing2)
                .background(DesignSystemGlobal.BackgroundContainerColorWhite)
                .cornerRadius(DesignSystemGlobal.BorderRadiusLg)
            }
            
            Spacer()
            
            // View Mode Toggle
            HStack(spacing: DesignSystemGlobal.Spacing2) {
                Button(action: { viewMode = .list }) {
                    Image(systemName: "list.bullet")
                        .font(.system(size: DesignSystemGlobal.FontSizeBodyLg))
                        .foregroundColor(viewMode == .list ? 
                            DesignSystemGlobal.TextOnSurfaceColorPrimary : 
                            DesignSystemGlobal.TextOnSurfaceColorTertiary)
                        .frame(width: 44, height: 44)
                        .background(viewMode == .list ? 
                            DesignSystemGlobal.BackgroundButtonColorTransparent05Default : 
                            Color.clear)
                        .cornerRadius(DesignSystemGlobal.BorderRadiusMd)
                }
                
                Button(action: { viewMode = .grid }) {
                    Image(systemName: "square.grid.2x2")
                        .font(.system(size: DesignSystemGlobal.FontSizeBodyLg))
                        .foregroundColor(viewMode == .grid ? 
                            DesignSystemGlobal.TextOnSurfaceColorPrimary : 
                            DesignSystemGlobal.TextOnSurfaceColorTertiary)
                        .frame(width: 44, height: 44)
                        .background(viewMode == .grid ? 
                            DesignSystemGlobal.BackgroundButtonColorTransparent05Default : 
                            Color.clear)
                        .cornerRadius(DesignSystemGlobal.BorderRadiusMd)
                }
            }
        }
    }
    
    // MARK: - Product Inventory
    private var productInventory: some View {
        Group {
            if viewMode == .list {
                productListView
            } else {
                productGridView
            }
        }
    }
    
    // MARK: - List View
    private var productListView: some View {
        LazyVStack(spacing: DesignSystemGlobal.Spacing4) {
            ForEach(sortedAndFilteredProducts) { product in
                ProductCard(
                    product: product,
                    onAddToCart: {
                        handleAddToCart(product)
                    },
                    onAddToList: {
                        handleAddToList(product)
                    }
                )
            }
        }
    }
    
    // MARK: - Grid View
    private var productGridView: some View {
        LazyVGrid(
            columns: [
                GridItem(.flexible(), spacing: DesignSystemGlobal.Spacing3),
                GridItem(.flexible(), spacing: DesignSystemGlobal.Spacing3)
            ],
            spacing: DesignSystemGlobal.Spacing4
        ) {
            ForEach(sortedAndFilteredProducts) { product in
                CompactProductCard(
                    product: product,
                    onAddToCart: {
                        handleAddToCart(product)
                    }
                )
            }
        }
    }
    
    // MARK: - Computed Properties
    
    private var resultsCountText: String {
        let count = sortedAndFilteredProducts.count
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let formattedCount = formatter.string(from: NSNumber(value: count)) ?? "\(count)"
        return "\(formattedCount) RESULTS"
    }
    
    private var sortedAndFilteredProducts: [Product] {
        var filtered = products
        
        // Apply filters here (simplified - in real app would be more complex)
        if !selectedSubFilters.isEmpty {
            // Filter logic would go here based on selected filters
        }
        
        // Apply sorting
        switch sortOption {
        case .topRated:
            filtered = filtered.sorted { $0.rating > $1.rating }
        case .priceLowToHigh:
            filtered = filtered.sorted { $0.currentPrice < $1.currentPrice }
        case .priceHighToLow:
            filtered = filtered.sorted { $0.currentPrice > $1.currentPrice }
        case .bestSelling:
            filtered = filtered.sorted { $0.reviewCount > $1.reviewCount }
        case .newest:
            // Assume original order is newest
            break
        }
        
        return filtered
    }
    
    // MARK: - Actions
    
    private func handleStylePillTap(_ item: DSStylePillItem) {
        selectedStylePill = item.text
        print("Selected style: \(item.text)")
        // In a real app, this would filter products by style
    }
    
    private func handleFilterPillTap(_ item: DSFilterPillItem) {
        print("Filter tapped: \(item.text)")
        // In a real app, this would open a filter sheet/modal
    }
    
    private func handleSubFilterTap(_ item: DSFilterPillItem) {
        if selectedSubFilters.contains(item.text) {
            selectedSubFilters.remove(item.text)
        } else {
            selectedSubFilters.insert(item.text)
        }
        print("Sub-filter toggled: \(item.text)")
    }
    
    private func handleAddToCart(_ product: Product) {
        print("Added to cart: \(product.name)")
        // Implement cart logic
    }
    
    private func handleAddToList(_ product: Product) {
        print("Add to list: \(product.name)")
        // Implement list logic
    }
    
    private func loadProducts() {
        // Load from sample data
        products = PLPSampleData.refrigerators
    }
}

// MARK: - =============================================
// MARK: - VIEW MODE ENUM
// MARK: - =============================================

enum PLPViewMode {
    case list
    case grid
}

// MARK: - =============================================
// MARK: - COMPACT PRODUCT CARD (for Grid View)
// MARK: - =============================================

struct CompactProductCard: View {
    let product: Product
    let onAddToCart: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
            // Product Image
            ZStack(alignment: .topLeading) {
                productImage
                
                // Badges
                if product.isExclusive || product.promotionalBadge != nil {
                    VStack(alignment: .leading, spacing: 2) {
                        if product.isExclusive {
                            badgeText("Exclusive")
                        }
                        if let badge = product.promotionalBadge {
                            badgeText(badge, color: DesignSystemGlobal.BackgroundFeedbackColorSuccessAccent2)
                        }
                    }
                    .padding(DesignSystemGlobal.Spacing2)
                }
            }
            .frame(height: 160)
            .background(DesignSystemGlobal.BackgroundContainerColorGreige)
            .cornerRadius(DesignSystemGlobal.BorderRadiusMd)
            
            // Brand
            Text(product.brand)
                .font(.system(size: DesignSystemGlobal.FontSizeBodyXs, weight: .bold))
                .foregroundColor(DesignSystemGlobal.TextOnSurfaceColorPrimary)
                .lineLimit(1)
            
            // Product Name
            Text(product.name)
                .font(.system(size: DesignSystemGlobal.FontSizeBodyXs))
                .foregroundColor(DesignSystemGlobal.TextOnSurfaceColorPrimary)
                .lineLimit(2)
            
            // Price
            HStack(alignment: .firstTextBaseline, spacing: 2) {
                Text("$")
                    .font(.system(size: DesignSystemGlobal.FontSizeH3, weight: .bold))
                Text(formattedPrice(product.currentPrice))
                    .font(.system(size: DesignSystemGlobal.FontSizeH3, weight: .bold))
            }
            .foregroundColor(DesignSystemGlobal.TextOnSurfaceColorPrimary)
            
            // Rating
            HStack(spacing: DesignSystemGlobal.Spacing1) {
                RatingStars(rating: product.rating)
                    .font(.system(size: 10))
                Text("(\(product.reviewCount))")
                    .font(.system(size: DesignSystemGlobal.FontSizeBodyXs))
                    .foregroundColor(DesignSystemGlobal.TextOnSurfaceColorSecondary)
            }
            
            // Add to Cart Button
            Button(action: onAddToCart) {
                Text("Add to Cart")
                    .font(.system(size: DesignSystemGlobal.FontSizeBodyXs, weight: .semibold))
                    .foregroundColor(DesignSystemGlobal.NeutralsWhite)
                    .frame(maxWidth: .infinity)
                    .frame(height: 36)
                    .background(DesignSystemGlobal.BackgroundButtonColorBrandFilledDefault)
                    .cornerRadius(DesignSystemGlobal.BorderRadiusMd)
            }
        }
        .padding(DesignSystemGlobal.Spacing3)
        .background(DesignSystemGlobal.BackgroundContainerColorWhite)
        .cornerRadius(DesignSystemGlobal.BorderRadiusXl)
        .shadow(
            color: DesignSystemGlobal.ElevationLow,
            radius: DesignSystemGlobal.ElevationBlurRadiusBlur2,
            x: 0,
            y: DesignSystemGlobal.ElevationPositionY2
        )
    }
    
    private var productImage: some View {
        Group {
            if product.heroImage.hasPrefix("http") {
                AsyncImage(url: URL(string: product.heroImage)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
            } else {
                Image(product.heroImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
    
    private func badgeText(_ text: String, color: Color = Color.primary) -> some View {
        Text(text)
            .font(.system(size: 10, weight: .bold))
            .foregroundColor(color)
            .padding(.horizontal, 6)
            .padding(.vertical, 4)
            .background(DesignSystemGlobal.BackgroundContainerColorWhite.opacity(0.95))
            .cornerRadius(4)
    }
    
    private func formattedPrice(_ price: Decimal) -> String {
        let nsPrice = price as NSDecimalNumber
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter.string(from: nsPrice) ?? "\(nsPrice.doubleValue)"
    }
}

// MARK: - =============================================
// MARK: - SAMPLE DATA FOR PLP
// MARK: - =============================================

struct PLPSampleData {
    static let refrigerators: [Product] = [
        Product(
            id: "LHFS28XBS",
            brand: "LG",
            name: "28 cu. ft. 3-Door French Door Refrigerator with Ice and Water Dispenser and Craft Ice",
            modelNumber: "LHFS28XBS",
            heroImage: "refrigerator_lg_french",
            thumbnailImages: [],
            additionalImageCount: 12,
            currentPrice: 2699.00,
            originalPrice: 3499.00,
            savingsPercentage: 23,
            rating: 4.5,
            reviewCount: 1247,
            isExclusive: false,
            promotionalBadge: "Get it by Christmas",
            pickupInfo: FulfillmentInfo(
                primaryValue: "143 in stock",
                secondaryValue: "at Woodstock, GA"
            ),
            deliveryInfo: FulfillmentInfo(
                primaryValue: "Free",
                secondaryValue: "Tomorrow"
            ),
            fasterDeliveryInfo: FulfillmentInfo(
                primaryValue: "Get it in 4 hours"
            ),
            internetNumber: "312564123",
            storeSKU: "1002-123-456"
        ),
        Product(
            id: "RF29BB8600QL",
            brand: "Samsung",
            name: "29 cu. ft. Bespoke 4-Door Flex with AI Family Hub+ and AI Vision Inside",
            modelNumber: "RF29BB8600QL",
            heroImage: "refrigerator_samsung_bespoke",
            thumbnailImages: [],
            additionalImageCount: 8,
            currentPrice: 3499.00,
            rating: 4.7,
            reviewCount: 892,
            isExclusive: true,
            pickupInfo: FulfillmentInfo(
                primaryValue: "56 in stock",
                secondaryValue: "at Woodstock, GA"
            ),
            deliveryInfo: FulfillmentInfo(
                primaryValue: "Free",
                secondaryValue: "Dec 15"
            ),
            internetNumber: "318765432",
            storeSKU: "1002-234-567"
        ),
        Product(
            id: "LMXS28626S",
            brand: "LG",
            name: "28 cu. ft. 4-Door French Door Smart Refrigerator with Ice and Water Dispenser",
            modelNumber: "LMXS28626S",
            heroImage: "refrigerator_lg_smart",
            thumbnailImages: [],
            additionalImageCount: 15,
            currentPrice: 2199.00,
            originalPrice: 2799.00,
            savingsPercentage: 21,
            rating: 4.3,
            reviewCount: 3456,
            isExclusive: false,
            promotionalBadge: "Best Seller",
            pickupInfo: FulfillmentInfo(
                primaryValue: "289 in stock",
                secondaryValue: "at Woodstock, GA"
            ),
            deliveryInfo: FulfillmentInfo(
                primaryValue: "Free",
                secondaryValue: "Tomorrow"
            ),
            fasterDeliveryInfo: FulfillmentInfo(
                primaryValue: "Get it in 2 hours"
            ),
            internetNumber: "305123456",
            storeSKU: "1002-345-678"
        ),
        Product(
            id: "LF21G6200S",
            brand: "LG",
            name: "21 cu. ft. SMART Counter Depth MAX French Door Refrigerator",
            modelNumber: "LF21G6200S",
            heroImage: "refrigerator_lg_counter",
            thumbnailImages: [],
            additionalImageCount: 6,
            currentPrice: 1799.00,
            originalPrice: 2299.00,
            savingsPercentage: 22,
            rating: 4.4,
            reviewCount: 567,
            pickupInfo: FulfillmentInfo(
                primaryValue: "78 in stock",
                secondaryValue: "at Woodstock, GA"
            ),
            deliveryInfo: FulfillmentInfo(
                primaryValue: "Free",
                secondaryValue: "Dec 14"
            ),
            internetNumber: "309876543",
            storeSKU: "1002-456-789"
        ),
        Product(
            id: "RF30BB6600QL",
            brand: "Samsung",
            name: "30 cu. ft. Bespoke 3-Door French Door Refrigerator with Beverage Center",
            modelNumber: "RF30BB6600QL",
            heroImage: "refrigerator_samsung_beverage",
            thumbnailImages: [],
            additionalImageCount: 10,
            currentPrice: 2799.00,
            originalPrice: 3299.00,
            savingsPercentage: 15,
            rating: 4.6,
            reviewCount: 1123,
            isExclusive: true,
            promotionalBadge: "Get it by Christmas",
            pickupInfo: FulfillmentInfo(
                primaryValue: "34 in stock",
                secondaryValue: "at Woodstock, GA"
            ),
            deliveryInfo: FulfillmentInfo(
                primaryValue: "Free",
                secondaryValue: "Tomorrow"
            ),
            fasterDeliveryInfo: FulfillmentInfo(
                primaryValue: "Get it in 3 hours"
            ),
            internetNumber: "314567890",
            storeSKU: "1002-567-890"
        ),
        Product(
            id: "WRS321SDHZ",
            brand: "Whirlpool",
            name: "33 in. W 21.3 cu. ft. Side by Side Refrigerator in Fingerprint Resistant Stainless Steel",
            modelNumber: "WRS321SDHZ",
            heroImage: "refrigerator_whirlpool_sidebyside",
            thumbnailImages: [],
            additionalImageCount: 5,
            currentPrice: 1299.00,
            originalPrice: 1799.00,
            savingsPercentage: 28,
            rating: 4.2,
            reviewCount: 2341,
            promotionalBadge: "Special Buy",
            pickupInfo: FulfillmentInfo(
                primaryValue: "156 in stock",
                secondaryValue: "at Woodstock, GA"
            ),
            deliveryInfo: FulfillmentInfo(
                primaryValue: "Free",
                secondaryValue: "Dec 13"
            ),
            internetNumber: "302345678",
            storeSKU: "1002-678-901"
        ),
        Product(
            id: "FFHS2622MS",
            brand: "Frigidaire",
            name: "25.5 cu. ft. Side by Side Refrigerator in Stainless Steel",
            modelNumber: "FFHS2622MS",
            heroImage: "refrigerator_frigidaire",
            thumbnailImages: [],
            additionalImageCount: 7,
            currentPrice: 1599.00,
            rating: 4.1,
            reviewCount: 456,
            pickupInfo: FulfillmentInfo(
                primaryValue: "92 in stock",
                secondaryValue: "at Woodstock, GA"
            ),
            deliveryInfo: FulfillmentInfo(
                primaryValue: "Free",
                secondaryValue: "Dec 16"
            ),
            internetNumber: "306789012",
            storeSKU: "1002-789-012"
        ),
        Product(
            id: "GNE27JSMSS",
            brand: "GE",
            name: "27.0 cu. ft. French Door Refrigerator in Stainless Steel, ENERGY STAR",
            modelNumber: "GNE27JSMSS",
            heroImage: "refrigerator_ge_french",
            thumbnailImages: [],
            additionalImageCount: 9,
            currentPrice: 1999.00,
            originalPrice: 2499.00,
            savingsPercentage: 20,
            rating: 4.5,
            reviewCount: 789,
            isExclusive: false,
            pickupInfo: FulfillmentInfo(
                primaryValue: "67 in stock",
                secondaryValue: "at Woodstock, GA"
            ),
            deliveryInfo: FulfillmentInfo(
                primaryValue: "Free",
                secondaryValue: "Tomorrow"
            ),
            internetNumber: "310234567",
            storeSKU: "1002-890-123"
        )
    ]
    
    static let refrigeratorStylePills: [DSStylePillItem] = [
        DSStylePillItem(
            text: "French Door\nRefrigerators",
            image: Image(systemName: "refrigerator.fill")
        ),
        DSStylePillItem(
            text: "Side by Side\nRefrigerators",
            image: Image(systemName: "refrigerator.fill")
        ),
        DSStylePillItem(
            text: "Top Freezer\nRefrigerators",
            image: Image(systemName: "refrigerator.fill")
        ),
        DSStylePillItem(
            text: "Bottom Freezer\nRefrigerators",
            image: Image(systemName: "refrigerator.fill")
        ),
        DSStylePillItem(
            text: "Counter Depth\nRefrigerators",
            image: Image(systemName: "refrigerator.fill")
        ),
        DSStylePillItem(
            text: "Mini Fridges",
            image: Image(systemName: "refrigerator.fill")
        )
    ]
    
    static let filterPills: [DSFilterPillItem] = [
        DSFilterPillItem(
            text: "All Filters",
            icon: Image(systemName: "line.3.horizontal.decrease.circle")
        ),
        DSFilterPillItem(text: "Brand"),
        DSFilterPillItem(text: "Width"),
        DSFilterPillItem(text: "Capacity"),
        DSFilterPillItem(text: "Color/Finish"),
        DSFilterPillItem(text: "Features")
    ]
    
    static let subFilterPills: [DSFilterPillItem] = [
        DSFilterPillItem(text: "In Stock At Store Today"),
        DSFilterPillItem(text: "Free 1-2 Day Delivery"),
        DSFilterPillItem(text: "Get It Fast"),
        DSFilterPillItem(text: "Special Buy"),
        DSFilterPillItem(text: "Exclusive")
    ]
}

// MARK: - =============================================
// MARK: - PREVIEW
// MARK: - =============================================

#Preview("PLP - Refrigerators") {
    PLPView(
        categoryTitle: "REFRIGERATORS",
        stylePills: PLPSampleData.refrigeratorStylePills,
        filterPills: PLPSampleData.filterPills,
        subFilterPills: PLPSampleData.subFilterPills
    )
}

#Preview("PLP - List View") {
    PLPView(
        categoryTitle: "REFRIGERATORS",
        stylePills: PLPSampleData.refrigeratorStylePills,
        filterPills: PLPSampleData.filterPills,
        subFilterPills: PLPSampleData.subFilterPills
    )
}

#Preview("Compact Product Card") {
    CompactProductCard(
        product: PLPSampleData.refrigerators[0],
        onAddToCart: {}
    )
    .frame(width: 180)
    .padding()
}
