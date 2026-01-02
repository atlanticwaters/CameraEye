import SwiftUI

// MARK: - =============================================
// MARK: - ORANGE CATALOG PRODUCT CONVERSION
// MARK: - =============================================

extension OrangeCatalogProduct {
    /// Converts an OrangeCatalogProduct to the local Product model for display in PLPView.
    func toProduct() -> Product {
        let priceDecimal = Decimal(currentPrice ?? 0)
        let originalDecimal = originalPrice.map { Decimal($0) }

        // Calculate savings percentage
        var savings: Int?
        if let original = originalPrice, let current = currentPrice, original > current {
            savings = Int(((original - current) / original) * 100)
        }

        // Build fulfillment info based on availability
        let pickup: FulfillmentInfo?
        let delivery: FulfillmentInfo?

        if inStock {
            pickup = FulfillmentInfo(
                primaryValue: "Free",
                secondaryValue: "Pickup Today"
            )
            delivery = FulfillmentInfo(
                primaryValue: "Delivery",
                secondaryValue: "Available"
            )
        } else {
            pickup = nil
            delivery = FulfillmentInfo(
                primaryValue: "Out of Stock",
                secondaryValue: nil
            )
        }

        // Check for exclusive badge
        let isExclusive = badges?.contains { $0.lowercased() == "exclusive" } ?? false

        // Get promotional badge (first non-exclusive badge)
        let promoBadge = badges?.first { $0.lowercased() != "exclusive" }

        return Product(
            id: productId,
            brand: brand ?? "Unknown Brand",
            name: title,
            modelNumber: modelNumber ?? "",
            heroImage: imageUrl ?? "",
            thumbnailImages: [],
            additionalImageCount: 0,
            currentPrice: priceDecimal,
            originalPrice: originalDecimal,
            savingsPercentage: savings,
            rating: ratingAverage ?? 0,
            reviewCount: reviewCount,
            isExclusive: isExclusive,
            promotionalBadge: promoBadge,
            pickupInfo: pickup,
            deliveryInfo: delivery,
            fasterDeliveryInfo: nil,
            internetNumber: nil,
            storeSKU: nil,
            isSponsored: false,
            availableColors: nil,
            additionalColorCount: 0
        )
    }
}

// MARK: - =============================================
// MARK: - PRODUCT TO DSPLPPOD CONVERSION
// MARK: - =============================================

extension Product {
    /// Converts a Product to DSPLPPodData for display in DSPLPPod.
    func toPLPPodData() -> DSPLPPodData {
        // Map badges
        var badges: [DSPLPPodBadge] = []
        if isExclusive {
            badges.append(.exclusive())
        }
        if let promo = promotionalBadge {
            badges.append(DSPLPPodBadge(text: promo, color: .info))
        }

        // Map pricing
        let dollars = Int(truncating: currentPrice as NSDecimalNumber)
        let cents = Int(truncating: ((currentPrice - Decimal(dollars)) * 100) as NSDecimalNumber)

        let pricingType: DSPLPPodPricingType
        if let original = originalPrice, let savings = savingsPercentage {
            pricingType = .withSavings(
                dollars: dollars,
                cents: cents,
                originalPrice: Double(truncating: original as NSDecimalNumber),
                savings: "Save \(savings)%",
                perUnit: "/each"
            )
        } else {
            pricingType = .standard(dollars: dollars, cents: cents, perUnit: "/each")
        }

        // Map fulfillment info
        let fulfillment = DSPLPPodFulfillmentInfo(
            pickup: pickupInfo.map {
                DSPLPPodFulfillmentInfo.PickupInfo(
                    primaryText: $0.primaryValue,
                    locationText: $0.secondaryValue
                )
            },
            delivery: deliveryInfo.map {
                DSPLPPodFulfillmentInfo.DeliveryInfo(
                    primaryText: $0.primaryValue,
                    dateText: $0.secondaryValue,
                    isUnavailable: $0.primaryValue.lowercased().contains("out of stock")
                )
            },
            fasterDelivery: nil
        )

        // Map swatches
        let swatchDisplay: DSPLPPodSwatchDisplay
        if let colors = availableColors, !colors.isEmpty {
            let swatches = colors.map { colorInfo in
                DSPLPPodSwatch(color: colorInfo.color)
            }
            if additionalColorCount > 0 {
                swatchDisplay = .swatchesWithQuantity(swatches: swatches, additionalCount: additionalColorCount)
            } else {
                swatchDisplay = .swatchesOnly(swatches: swatches)
            }
        } else {
            swatchDisplay = .none
        }

        return DSPLPPodData(
            productImage: nil, // Will use AsyncImage wrapper
            badges: badges,
            isSponsored: isSponsored,
            swatchDisplay: swatchDisplay,
            productName: name,
            modelNumber: modelNumber,
            pricingType: pricingType,
            showSpecialBuy: false,
            perItemPriceDetail: nil,
            ratingInfo: DSPLPPodRatingInfo(rating: rating, reviewCount: reviewCount),
            fulfillmentInfo: fulfillment
        )
    }
}

// MARK: - =============================================
// MARK: - PLP PRODUCT POD (ASYNC IMAGE WRAPPER)
// MARK: - =============================================

/// Wrapper view that combines AsyncImage loading with DSPLPPod display.
/// Since DSPLPPod accepts Image? directly, this wrapper handles URL-based image loading.
struct PLPProductPod: View {
    let product: Product
    let onTap: () -> Void
    let onAddToCart: () -> Void
    let onAddToList: () -> Void

    private typealias DS = DesignSystemGlobal

    var body: some View {
        Button(action: onTap) {
            HStack(alignment: .center, spacing: 0) {
                // Image container with AsyncImage - vertically centered
                imageContainer

                // Product details section
                VStack(alignment: .leading, spacing: 12) {
                    DSPLPPodDetails(
                        productName: product.name,
                        modelNumber: product.modelNumber,
                        pricingType: product.toPLPPodData().pricingType,
                        showSpecialBuy: false,
                        perItemPriceDetail: nil,
                        ratingInfo: DSPLPPodRatingInfo(rating: product.rating, reviewCount: product.reviewCount),
                        fulfillmentInfo: product.toPLPPodData().fulfillmentInfo,
                        onRatingsTap: nil,
                        onProductTap: nil
                    )

                    // Button set
                    DSPLPPodButtonSet(
                        variant: .b2c,
                        onAddToCart: onAddToCart,
                        onAddToList: onAddToList
                    )
                }
                .padding(8)
                .frame(width: 205, alignment: .leading)
            }
            .background(DS.BackgroundContainerColorWhite)
            .clipShape(.rect(cornerRadius: 8))
        }
        .buttonStyle(.plain)
    }

    /// Converts a THD image URL to use higher resolution (300px instead of 100px)
    private var highResImageURL: URL? {
        // THD images use suffixes like _100.jpg, _300.jpg, _400.jpg, _600.jpg
        // Replace _100 with _300 for better quality at 145x145 display size
        let urlString = product.heroImage
            .replacing("_100.jpg", with: "_300.jpg")
            .replacing("_100.png", with: "_300.png")
        return URL(string: urlString)
    }

    @ViewBuilder
    private var imageContainer: some View {
        ZStack {
            // Product image with AsyncImage - centered and using higher resolution
            AsyncImage(url: highResImageURL) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                case .failure:
                    Image(systemName: "photo")
                        .font(.system(size: 40))
                        .foregroundStyle(DS.IconOnContainerColorInactive)
                default:
                    ProgressView()
                }
            }
            .frame(width: 145, height: 145)

            // Badges overlay (top-left)
            if !product.toPLPPodData().badges.isEmpty {
                VStack(alignment: .leading, spacing: 4) {
                    ForEach(product.toPLPPodData().badges) { badge in
                        Text(badge.text)
                            .font(.caption2)
                            .bold()
                            .padding(.horizontal, 6)
                            .padding(.vertical, 2)
                            .background(badgeColor(for: badge.color))
                            .foregroundStyle(.white)
                            .clipShape(.rect(cornerRadius: 4))
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding(8)
            }

            // Sponsored tag (top-right)
            if product.isSponsored {
                VStack {
                    Text("Sponsored")
                        .font(.caption2)
                        .foregroundStyle(DS.TextOnContainerColorSecondary)
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                .padding(8)
            }
        }
        .frame(width: 145, height: 145)
        .background(DS.BackgroundContainerColorGreige)
    }

    private func badgeColor(for color: DSPLPPodBadge.BadgeColor) -> Color {
        switch color {
        case .info:
            return DS.Brand500
        case .success:
            return DS.IconOnContainerColorSuccess
        case .warning:
            return .orange
        case .error:
            return DS.IconOnContainerColorError
        case .neutral:
            return DS.TextOnContainerColorSecondary
        }
    }
}

// MARK: - =============================================
// MARK: - PRODUCT LISTING PAGE (PLP) VIEW
// MARK: - =============================================
//
// This is a comprehensive Product Listing Page that combines:
// - DSPlpFilterPanel: Title, style pills, results count, and filters
// - DSProductCard: Modern product display cards with modular components:
//   • DSProductImageContainer: Images with badges, swatches, sponsored tags
//   • DSPlpPodDetails: Product info (brand, title, pricing, ratings, fulfillment)
//   • DSPodButtonSet: Action buttons (B2C or B2B variants)
// - Product data models from ProductSystem.swift
// - Real data from category JSON files (e.g., french-door-refrigerators.json)
//
// The PLP structure follows The Home Depot design system with:
// 1. Filter Panel at top (category, style navigation, filters)
// 2. Product inventory grid/list below (uses DSProductCard)
// 3. Sort and view mode controls

// MARK: - Main PLP View

struct PLPView: View {
    // MARK: - State
    @State private var products: [Product] = []
    @State private var pipDatasets: [PIPDataset] = []
    @State private var orangeCatalogProducts: [OrangeCatalogProduct] = [] // Store raw OrangeCatalog products for dynamic pills
    @State private var subcategoryFilters: [OrangeCatalogCategory.SubcategoryFilter] = [] // Subcategory filters from filterOptions
    @State private var selectedStylePill: String? = nil
    @State private var selectedStylePillId: String? = nil // Tracks selected subcategory ID for filtering
    @State private var selectedFilterPills: Set<String> = []
    @State private var selectedSubFilters: Set<String> = []
    @State private var viewMode: PLPViewMode = .list
    @State private var selectedSortOption: PLPSortOption = .topRated // For sorting
    @State private var currentPage: Int = 1 // For pagination support
    @State private var isLoading: Bool = false  // Loading state for async loading
    @State private var errorMessage: String?    // Error message for failed loads
    @State private var navigationPath = NavigationPath() // Navigation state for PIP

    // MARK: - Configuration
    let category: PLPCategory
    
    // Computed properties based on category
    private var categoryTitle: String {
        category.title
    }
    
    /// Dynamically generates style pills from filterOptions.subcategories or product subcategories
    private var stylePills: [DSStylePillItem] {
        // Priority 1: Use subcategory filters from filterOptions (new _all.json format)
        // BUT only if we're at a leaf category (no subcategoryFilter means we're viewing all subcategories)
        // OR if the subcategory filters are relevant to this category (not parent-level categories)
        if !subcategoryFilters.isEmpty && category.subcategoryFilter == nil {
            // No subcategoryFilter means we're viewing a category with its own _all.json
            // (like appliances/refrigerators, tools/drills) - use the filterOptions
            print("🎯 Generating style pills from \(subcategoryFilters.count) subcategory filters (leaf category)")
            return subcategoryFilters.prefix(8).map { filter in
                // Find a product image for this subcategory
                let matchingProduct = orangeCatalogProducts.first { product in
                    product.subcategory?.localizedStandardContains(filter.name) ?? false
                }

                // Format text with line break and product count
                let formattedText = formatSubcategoryName(filter.name)

                print("   📍 Filter: \(filter.name) (\(filter.slug)) - Image: \(matchingProduct?.imageUrl ?? "none")")

                return DSStylePillItem(
                    id: filter.slug,
                    text: formattedText,
                    image: nil,
                    imageURL: matchingProduct?.imageUrl
                )
            }
        }

        // Priority 2: Generate from OrangeCatalog product subcategories (for filtered views)
        let productsForPills = filteredOrangeCatalogProducts
        guard !productsForPills.isEmpty else {
            print("🎯 Using static category.stylePills (subcategoryFilters: \(subcategoryFilters.count), products: \(productsForPills.count))")
            return category.stylePills // Fallback to static pills while loading
        }

        print("🎯 Generating style pills from \(productsForPills.count) products")

        // Group products by subcategory
        var subcategoryGroups: [String: [OrangeCatalogProduct]] = [:]
        for product in productsForPills {
            let subcategory = product.subcategory ?? "Other"
            subcategoryGroups[subcategory, default: []].append(product)
        }

        // Sort by product count (most popular first) and create style pills
        let sortedSubcategories = subcategoryGroups.sorted { $0.value.count > $1.value.count }

        return sortedSubcategories.prefix(8).map { subcategory, products in
            // Get thumbnail image from first product in subcategory
            let imageURL = products.first?.imageUrl

            // Format text with line break for display
            let formattedText = formatSubcategoryName(subcategory)

            return DSStylePillItem(
                id: subcategory,
                text: formattedText,
                image: nil, // No fallback SF Symbol - use imageURL
                imageURL: imageURL
            )
        }
    }

    /// Formats subcategory name for style pill display (adds line break)
    private func formatSubcategoryName(_ name: String) -> String {
        // Split long names into two lines for better display
        let words = name.split(separator: " ")
        if words.count >= 2 {
            let midpoint = words.count / 2
            let firstLine = words[0..<midpoint].joined(separator: " ")
            let secondLine = words[midpoint...].joined(separator: " ")
            return "\(firstLine)\n\(secondLine)"
        }
        return name
    }
    
    /// Returns the filtered products respecting subcategoryFilter for dynamic pill generation
    private var filteredOrangeCatalogProducts: [OrangeCatalogProduct] {
        guard !orangeCatalogProducts.isEmpty else { return [] }

        if let subcategoryFilter = category.subcategoryFilter {
            return orangeCatalogProducts.filter { product in
                product.subcategory?.localizedStandardContains(subcategoryFilter) ?? false
            }
        }
        return orangeCatalogProducts
    }

    /// Dynamically generates filter pills based on available data
    private var filterPills: [DSFilterPillItem] {
        // Generate dynamic filters from OrangeCatalog products
        let productsForFilters = filteredOrangeCatalogProducts
        if !productsForFilters.isEmpty {
            var pills: [DSFilterPillItem] = [
                DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle"))
            ]

            // Extract unique brands for Brand filter
            let uniqueBrands = Set(productsForFilters.compactMap { $0.brand })
            if !uniqueBrands.isEmpty {
                pills.append(DSFilterPillItem(text: "Brand"))
            }

            // Add price filter
            pills.append(DSFilterPillItem(text: "Price"))

            // Add rating filter if products have ratings
            let hasRatings = productsForFilters.contains { $0.ratingAverage != nil }
            if hasRatings {
                pills.append(DSFilterPillItem(text: "Rating"))
            }

            return pills
        }

        // Fallback to static category filter pills
        return category.filterPills
    }

    /// Dynamically generates sub-filter pills based on available data
    private var subFilterPills: [DSFilterPillItem] {
        // Generate dynamic quick filters from OrangeCatalog products
        let productsForFilters = filteredOrangeCatalogProducts
        if !productsForFilters.isEmpty {
            var pills: [DSFilterPillItem] = []

            // Check for in-stock products
            let inStockCount = productsForFilters.filter { $0.inStock }.count
            if inStockCount > 0 {
                pills.append(DSFilterPillItem(text: "In Stock (\(inStockCount))"))
            }

            // Check for products on sale
            let onSaleCount = productsForFilters.filter { $0.savingsPercentage != nil }.count
            if onSaleCount > 0 {
                pills.append(DSFilterPillItem(text: "On Sale (\(onSaleCount))"))
            }

            // Check for highly rated products
            let topRatedCount = productsForFilters.filter { ($0.ratingAverage ?? 0) >= 4.0 }.count
            if topRatedCount > 0 {
                pills.append(DSFilterPillItem(text: "Top Rated (\(topRatedCount))"))
            }

            return pills
        }

        // Fallback to static category sub-filter pills
        return category.subFilterPills
    }
    
    /// Returns the actual count of displayed products (respects style pill filter)
    private var totalResults: Int {
        // Use filtered count when a style pill is selected
        sortedAndFilteredProducts.count
    }

    /// Returns the total unfiltered count from OrangeCatalog or products
    private var totalUnfilteredResults: Int {
        orangeCatalogProducts.isEmpty ? products.count : orangeCatalogProducts.count
    }
    
    // MARK: - Body
    var body: some View {
        NavigationStack(path: $navigationPath) {
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

                    // Content based on loading state
                    if isLoading {
                        loadingView
                            .padding(.horizontal, DesignSystemGlobal.Spacing4)
                    } else if let error = errorMessage {
                        errorView(message: error)
                            .padding(.horizontal, DesignSystemGlobal.Spacing4)
                    } else {
                        // Product List/Grid
                        productInventory
                            .padding(.horizontal, DesignSystemGlobal.Spacing4)
                    }
                }
                .padding(.top, 16) // Space for top navigation
                .padding(.bottom, 16) // Space for bottom navigation
            }
            .background(DesignSystemGlobal.BackgroundSurfaceColorGreige)
            .task {
                await loadProducts()
            }
            .navigationDestination(for: Product.self) { product in
                ProductDetailView(product: product)
            }
        }
    }

    // MARK: - Loading View
    private var loadingView: some View {
        VStack(spacing: DesignSystemGlobal.Spacing4) {
            ProgressView()
                .scaleEffect(1.5)
            Text("Loading products...")
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, minHeight: 200)
    }

    // MARK: - Error View
    private func errorView(message: String) -> some View {
        VStack(spacing: DesignSystemGlobal.Spacing4) {
            Image(systemName: "exclamationmark.triangle")
                .font(.system(size: 48))
                .foregroundStyle(.orange)

            Text(message)
                .font(.subheadline)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)

            Button("Retry") {
                Task {
                    await loadProducts()
                }
            }
            .buttonStyle(.bordered)
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 200)
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
                // Using PLPProductPod with DSPLPPod components:
                // - AsyncImage for hero image loading
                // - DSPLPPodDetails for product info (brand, title, model, pricing, ratings)
                // - DSPLPPodButtonSet for action buttons
                PLPProductPod(
                    product: product,
                    onTap: {
                        navigationPath.append(product)
                    },
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
                // Using PLPProductPod (same as list view)
                // Grid layout is handled by LazyVGrid
                PLPProductPod(
                    product: product,
                    onTap: {
                        navigationPath.append(product)
                    },
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
    
    // MARK: - Computed Properties
    
    private var resultsCountText: String {
        let count = totalResults
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        let formattedCount = formatter.string(from: NSNumber(value: count)) ?? "\(count)"
        return "\(formattedCount) RESULTS"
    }
    
    private var sortedAndFilteredProducts: [Product] {
        // If we have OrangeCatalog data and a style pill is selected, filter by subcategory
        if !orangeCatalogProducts.isEmpty, let selectedId = selectedStylePillId {
            let filteredOrangeProducts: [OrangeCatalogProduct]

            // Determine filtering strategy based on category type:
            // - Leaf categories (subcategoryFilter == nil): Pills use slugs from filterOptions
            // - Filtered categories (subcategoryFilter != nil): Pills use subcategory names from products
            if category.subcategoryFilter == nil, !subcategoryFilters.isEmpty {
                // Slug-based filtering for leaf categories with filterOptions
                if let filter = subcategoryFilters.first(where: { $0.slug == selectedId }) {
                    filteredOrangeProducts = orangeCatalogProducts.filter { product in
                        product.subcategory?.localizedStandardContains(filter.name) ?? false
                    }
                    print("🔖 Slug filter '\(selectedId)' → '\(filter.name)' applied: \(orangeCatalogProducts.count) → \(filteredOrangeProducts.count) products")
                } else {
                    filteredOrangeProducts = orangeCatalogProducts
                    print("🔖 Unknown slug '\(selectedId)' - showing all products")
                }
            } else {
                // Name-based filtering for filtered categories or product-derived pills
                filteredOrangeProducts = orangeCatalogProducts.filter { product in
                    let subcategory = product.subcategory ?? "Other"
                    return subcategory == selectedId
                }
                print("🔖 Subcategory filter '\(selectedId)' applied: \(orangeCatalogProducts.count) → \(filteredOrangeProducts.count) products")
            }
            return filteredOrangeProducts.map { $0.toProduct() }
        }

        // Fallback to products array (for non-OrangeCatalog sources)
        var filtered = products

        // Apply style pill filter using keyword matching for legacy data
        if let stylePill = selectedStylePill {
            let styleFilter = stylePill.replacing("\n", with: " ").trimmingCharacters(in: .whitespaces)
            filtered = filtered.filter { product in
                let productText = "\(product.name) \(product.brand)".lowercased()
                let filterWords = styleFilter.lowercased().split(separator: " ")
                return filterWords.contains { word in
                    word.count > 3 && productText.contains(word)
                }
            }
            print("🔖 Style filter '\(styleFilter)' applied: \(products.count) → \(filtered.count) products")
        }

        // Apply sub-filter pills
        if !selectedSubFilters.isEmpty {
            // Filter logic for sub-filters (In Stock, Free Delivery, etc.)
            // These would typically filter by product availability properties
        }

        return filtered
    }

    // MARK: - Actions

    private func handleStylePillTap(_ item: DSStylePillItem) {
        // Toggle selection - tap again to deselect
        if selectedStylePillId == item.id {
            selectedStylePillId = nil
            selectedStylePill = nil
            print("🔖 Deselected style pill: \(item.text)")
        } else {
            selectedStylePillId = item.id
            selectedStylePill = item.text
            print("🔖 Selected style: \(item.text) (ID: \(item.id))")
        }
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
    
    // MARK: - Diagnostic Helpers
    
    /// Debug function to list all image files in the bundle
    private func debugListBundleImages() {
        print("\n🔍 === BUNDLE IMAGE DIAGNOSTIC ===")
        
        guard let resourcePath = Bundle.main.resourcePath else {
            print("❌ Could not get bundle resource path")
            return
        }
        
        print("📁 Bundle resource path: \(resourcePath)")
        
        let fileManager = FileManager.default
        
        // Check for "product-images" folder (updated from "french-door-images")
        let productImagesPath = "\(resourcePath)/product-images"
        if fileManager.fileExists(atPath: productImagesPath) {
            print("✅ Found 'product-images' folder!")
            if let contents = try? fileManager.contentsOfDirectory(atPath: productImagesPath) {
                let imageFiles = contents.filter { $0.hasSuffix(".jpg") || $0.hasSuffix(".png") || $0.hasSuffix(".jpeg") }
                print("   📸 Image files found: \(imageFiles.count)")
                print("   Sample files:")
                imageFiles.prefix(5).forEach { print("      - \($0)") }
                if imageFiles.count > 5 {
                    print("      ... and \(imageFiles.count - 5) more")
                }
            }
        } else {
            print("❌ 'product-images' folder NOT found at: \(productImagesPath)")
        }
        
        // Check for legacy "images" folder
        let imagesFolderPath = "\(resourcePath)/images"
        if fileManager.fileExists(atPath: imagesFolderPath) {
            print("✅ Found 'images' folder!")
            if let contents = try? fileManager.contentsOfDirectory(atPath: imagesFolderPath) {
                let imageFiles = contents.filter { $0.hasSuffix(".jpg") || $0.hasSuffix(".png") || $0.hasSuffix(".jpeg") }
                print("   📸 Image files found: \(imageFiles.count)")
                print("   Sample files:")
                imageFiles.prefix(5).forEach { print("      - \($0)") }
                if imageFiles.count > 5 {
                    print("      ... and \(imageFiles.count - 5) more")
                }
            }
        } else {
            print("⚠️ 'images' folder NOT found")
        }
        
        // List all directories in the bundle
        print("\n📂 All directories in bundle:")
        if let contents = try? fileManager.contentsOfDirectory(atPath: resourcePath) {
            let directories = contents.filter { path in
                var isDirectory: ObjCBool = false
                let fullPath = "\(resourcePath)/\(path)"
                fileManager.fileExists(atPath: fullPath, isDirectory: &isDirectory)
                return isDirectory.boolValue
            }
            directories.forEach { print("   - \($0)") }
        }
        
        // Check asset catalog availability
        print("\n🎨 Testing asset catalog access:")
        let testAssetNames = [
            "imgi_39_fingerprint-resistant-stainless-steel-ge-french-door-refrigerators-gfe26jymfs-64_600",
            "imgi_56_10Oct23_SidebySide_Refrigerator",
            "imgi_57_10Oct23_TopFreezer"
        ]
        
        for assetName in testAssetNames {
            #if canImport(UIKit)
            if UIImage(named: assetName) != nil {
                print("   ✅ Found in asset catalog: \(assetName)")
            } else {
                print("   ❌ NOT in asset catalog: \(assetName)")
            }
            #endif
        }
        
        print("=== END DIAGNOSTIC ===\n")
    }
    
    private func loadProducts() async {
        isLoading = true
        errorMessage = nil

        // Priority 1: Load from OrangeCatalog API if slug is provided
        if let slug = category.orangeCatalogSlug {
            await loadFromOrangeCatalog(slug: slug)
            isLoading = false
            return
        }

        // Fallback: Load from pip-datasets.json
        pipDatasets = PLPDataLoader.shared.loadPIPDatasets()

        // Filter by category breadcrumb
        let filteredDatasets = pipDatasets.filter { dataset in
            dataset.breadcrumbs.contains { breadcrumb in
                breadcrumb.label.lowercased().contains(category.breadcrumbFilter.lowercased())
            }
        }

        // Convert to Product models
        products = filteredDatasets.map { $0.toProduct() }
        print("📦 Loaded \(products.count) products for category: \(category.title)")
        print("   ⚠️ Using fallback pip-datasets.json (no category-specific JSON found)")

        // Debug: Log sample product images
        if let firstProduct = filteredDatasets.first {
            print("🖼️ Sample product image: \(firstProduct.media.primaryImage)")
            print("🖼️ Total images: \(firstProduct.media.images.count)")
        }

        // Debug: Log first converted product's hero image
        if let firstProduct = products.first {
            print("🖼️ Converted product hero image: \(firstProduct.heroImage)")
        }

        isLoading = false
    }

    /// Loads products from the OrangeCatalog remote API using new _all.json endpoint.
    private func loadFromOrangeCatalog(slug: String) async {
        let apiURL = "https://raw.githubusercontent.com/atlanticwaters/Orange-Catalog/main/production%20data/categories/\(slug)/_all.json"
        print("🍊 Loading products from OrangeCatalog API for slug: \(slug)")
        print("🌐 Fetching: \(apiURL)")

        do {
            // Use fetchCategoryFresh to bypass cache and get latest data from GitHub
            let orangeCategory = try await CatalogService.shared.fetchCategoryFresh(slug: slug)
            print("🍊 Category loaded: \(orangeCategory.name), hasProducts: \(orangeCategory.hasProductData)")

            // Store subcategory filters from filterOptions (new _all.json format)
            if let filters = orangeCategory.subcategories {
                subcategoryFilters = filters
                print("📋 Loaded \(filters.count) subcategory filters from filterOptions:")
                for filter in filters.prefix(5) {
                    print("   - \(filter.name) (\(filter.slug)): \(filter.productCount) products")
                }
                if filters.count > 5 {
                    print("   ... and \(filters.count - 5) more")
                }
            } else {
                subcategoryFilters = []
                print("📋 No subcategory filters in filterOptions")
            }

            if let allOrangeProducts = orangeCategory.products {
                print("🍊 Raw products from API: \(allOrangeProducts.count)")

                // Debug: Show first product's raw data
                if let first = allOrangeProducts.first {
                    print("📦 First product raw:")
                    print("   - ID: \(first.productId)")
                    print("   - Title: \(first.title)")
                    print("   - Subcategory: \(first.subcategory ?? "nil")")
                    print("   - Image URL: \(first.imageUrl ?? "nil")")
                }

                // Debug: Show unique subcategories from products
                let uniqueSubcats = Set(allOrangeProducts.compactMap { $0.subcategory })
                print("📂 Subcategories in products (\(uniqueSubcats.count)): \(uniqueSubcats.sorted().joined(separator: ", "))")

                // Store ALL products for dynamic style pill generation
                orangeCatalogProducts = allOrangeProducts
                print("🎨 Stored \(orangeCatalogProducts.count) products for dynamic style pills")

                // Apply subcategory filter for initial display if specified
                var displayProducts = allOrangeProducts
                if let subcategoryFilter = category.subcategoryFilter {
                    let originalCount = displayProducts.count
                    displayProducts = displayProducts.filter { product in
                        product.subcategory?.localizedStandardContains(subcategoryFilter) ?? false
                    }
                    print("🔍 Initial filter by '\(subcategoryFilter)': \(originalCount) → \(displayProducts.count) products")
                }

                // Convert OrangeCatalogProduct to Product for display
                products = displayProducts.map { $0.toProduct() }
                print("🍊 Loaded \(products.count) products for initial display")

                // Debug: Log first 3 product image URLs
                for product in products.prefix(3) {
                    print("🖼️ Product: \(product.name)")
                    print("   Image URL: '\(product.heroImage)'")
                }
            } else {
                print("🍊 No products found in OrangeCatalog category")
                orangeCatalogProducts = []
                products = []
            }
        } catch {
            print("❌ Failed to load from OrangeCatalog: \(error.localizedDescription)")
            errorMessage = "Failed to load products: \(error.localizedDescription)"
        }
    }
}

// MARK: - =============================================
// MARK: - PLP CATEGORY CONFIGURATION
// MARK: - =============================================

struct PLPCategory {
    let title: String
    let breadcrumbFilter: String
    let stylePills: [DSStylePillItem]
    let filterPills: [DSFilterPillItem]
    let subFilterPills: [DSFilterPillItem]
    let orangeCatalogSlug: String?     // Optional OrangeCatalog API slug (remote)
    let subcategoryFilter: String?     // Optional filter for OrangeCatalog subcategory field

    init(
        title: String,
        breadcrumbFilter: String,
        stylePills: [DSStylePillItem],
        filterPills: [DSFilterPillItem],
        subFilterPills: [DSFilterPillItem],
        orangeCatalogSlug: String? = nil,
        subcategoryFilter: String? = nil
    ) {
        self.title = title
        self.breadcrumbFilter = breadcrumbFilter
        self.stylePills = stylePills
        self.filterPills = filterPills
        self.subFilterPills = subFilterPills
        self.orangeCatalogSlug = orangeCatalogSlug
        self.subcategoryFilter = subcategoryFilter
    }

    /// Creates a PLPCategory from an OrangeCatalog category summary.
    /// This allows the PLPView to display products from the remote OrangeCatalog API.
    static func fromOrangeCatalog(_ summary: CategoriesIndexResponse.CategorySummary) -> PLPCategory {
        // Convert subcategories to style pills
        let stylePills: [DSStylePillItem] = summary.subcategories?.map { subcategory in
            DSStylePillItem(
                id: subcategory.id,
                text: subcategory.name,
                imageURL: subcategory.imageUrl
            )
        } ?? []

        // Standard filter pills
        let filterPills: [DSFilterPillItem] = [
            DSFilterPillItem(
                text: "All Filters",
                icon: Image(systemName: "line.3.horizontal.decrease.circle")
            ),
            DSFilterPillItem(text: "Brand"),
            DSFilterPillItem(text: "Price"),
            DSFilterPillItem(text: "Rating")
        ]

        return PLPCategory(
            title: summary.name.uppercased(),
            breadcrumbFilter: summary.name,
            stylePills: stylePills,
            filterPills: filterPills,
            subFilterPills: [],
            orangeCatalogSlug: summary.slug
        )
    }
    
    // MARK: - Helper Methods
    
    /// Creates a category with style pills populated from product images in the dataset
    static func withProductImages(
        title: String,
        breadcrumbFilter: String,
        stylePillConfigs: [(text: String, breadcrumbMatch: String, fallbackIcon: String)],
        filterPills: [DSFilterPillItem],
        subFilterPills: [DSFilterPillItem]
    ) -> PLPCategory {
        // Load datasets
        let datasets = PLPDataLoader.shared.loadPIPDatasets()
        
        print("🔍 Loading style pills with real images for: \(title)")
        print("📊 Total datasets loaded: \(datasets.count)")
        
        // Generate style pills with product images
        let stylePills = stylePillConfigs.map { config in
            // Find a product matching this style's breadcrumb
            let matchingProduct = datasets.first { dataset in
                dataset.breadcrumbs.contains { breadcrumb in
                    breadcrumb.label.lowercased().contains(config.breadcrumbMatch.lowercased())
                }
            }
            
            // Create style pill with product image URL if available
            if let product = matchingProduct {
                print("✅ Found product for '\(config.text)':")
                print("   📦 Product: \(product.title)")
                print("   🖼️ Image URL: \(product.media.primaryImage)")
                
                return DSStylePillItem(
                    text: config.text,
                    image: Image(systemName: config.fallbackIcon),  // Still provide fallback
                    imageURL: product.media.primaryImage            // Use real product image!
                )
            } else {
                print("❌ No product found for '\(config.text)' matching '\(config.breadcrumbMatch)'")
                
                return DSStylePillItem(
                    text: config.text,
                    image: Image(systemName: config.fallbackIcon)
                )
            }
        }
        
        return PLPCategory(
            title: title,
            breadcrumbFilter: breadcrumbFilter,
            stylePills: stylePills,
            filterPills: filterPills,
            subFilterPills: subFilterPills
        )
    }
    
    // MARK: - Refrigerators Category
    /// Uses OrangeCatalog API to load refrigerator products from nested path
    static let refrigerators = PLPCategory(
        title: "REFRIGERATORS",
        breadcrumbFilter: "Refrigerators",
        stylePills: [
            DSStylePillItem(text: "French Door\nRefrigerators", image: Image(systemName: "refrigerator.fill")),
            DSStylePillItem(text: "Side by Side\nRefrigerators", image: Image(systemName: "refrigerator.fill")),
            DSStylePillItem(text: "Top Freezer\nRefrigerators", image: Image(systemName: "refrigerator.fill")),
            DSStylePillItem(text: "Bottom Freezer\nRefrigerators", image: Image(systemName: "refrigerator.fill")),
            DSStylePillItem(text: "Freezers", image: Image(systemName: "snowflake"))
        ],
        filterPills: [
            DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle")),
            DSFilterPillItem(text: "Brand"),
            DSFilterPillItem(text: "Price"),
            DSFilterPillItem(text: "Capacity (cu. ft.)")
        ],
        subFilterPills: [
            DSFilterPillItem(text: "In Stock At Store Today"),
            DSFilterPillItem(text: "Free 1-2 Day Delivery")
        ],
        orangeCatalogSlug: "appliances/refrigerators",
        subcategoryFilter: nil  // Show all products (Refrigerators + Freezers)
    )

    // MARK: - Washers & Dryers Category
    /// Uses OrangeCatalog API to load washer and dryer products (combined category)
    static let washersAndDryers = PLPCategory(
        title: "WASHERS & DRYERS",
        breadcrumbFilter: "Washers Dryers",
        stylePills: [
            DSStylePillItem(text: "Front Load\nWashers", image: Image(systemName: "washer.fill")),
            DSStylePillItem(text: "Top Load\nWashers", image: Image(systemName: "washer.fill")),
            DSStylePillItem(text: "Electric\nDryers", image: Image(systemName: "dryer.fill")),
            DSStylePillItem(text: "Gas\nDryers", image: Image(systemName: "dryer.fill")),
            DSStylePillItem(text: "Washer-Dryer\nCombos", image: Image(systemName: "washer.fill"))
        ],
        filterPills: [
            DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle")),
            DSFilterPillItem(text: "Brand"),
            DSFilterPillItem(text: "Price"),
            DSFilterPillItem(text: "Capacity (cu. ft.)")
        ],
        subFilterPills: [
            DSFilterPillItem(text: "In Stock At Store Today"),
            DSFilterPillItem(text: "Free 1-2 Day Delivery")
        ],
        orangeCatalogSlug: "appliances",
        subcategoryFilter: "Washers Dryers"
    )

    // MARK: - Dishwashers Category
    static let dishwashers = PLPCategory(
        title: "DISHWASHERS",
        breadcrumbFilter: "Dishwashers",
        stylePills: [
            DSStylePillItem(text: "Built-In\nDishwashers", image: Image(systemName: "dishwasher.fill")),
            DSStylePillItem(text: "Portable\nDishwashers", image: Image(systemName: "dishwasher.fill")),
            DSStylePillItem(text: "Drawer\nDishwashers", image: Image(systemName: "dishwasher.fill")),
            DSStylePillItem(text: "Panel Ready\nDishwashers", image: Image(systemName: "dishwasher.fill"))
        ],
        filterPills: [
            DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle")),
            DSFilterPillItem(text: "Brand"),
            DSFilterPillItem(text: "Width"),
            DSFilterPillItem(text: "Color/Finish"),
            DSFilterPillItem(text: "Tub Material"),
            DSFilterPillItem(text: "Noise Level (dBA)"),
            DSFilterPillItem(text: "Smart Enabled"),
            DSFilterPillItem(text: "Third Rack")
        ],
        subFilterPills: [
            DSFilterPillItem(text: "In Stock At Store Today"),
            DSFilterPillItem(text: "Free 1-2 Day Delivery"),
            DSFilterPillItem(text: "Get It Fast"),
            DSFilterPillItem(text: "Special Buy"),
            DSFilterPillItem(text: "Energy Star")
        ],
        orangeCatalogSlug: "appliances",
        subcategoryFilter: "Dishwashers"
    )

    // NOTE: Washing Machines and Dryers are now combined in the "Washers Dryers" subcategory
    // Use .washersAndDryers category instead of separate washingMachines/dryers categories

    // MARK: - Ranges Category
    static let ranges = PLPCategory(
        title: "RANGES",
        breadcrumbFilter: "Ranges",
        stylePills: [
            DSStylePillItem(text: "Gas\nRanges", image: Image(systemName: "flame.fill")),
            DSStylePillItem(text: "Electric\nRanges", image: Image(systemName: "bolt.fill")),
            DSStylePillItem(text: "Dual Fuel\nRanges", image: Image(systemName: "flame.fill")),
            DSStylePillItem(text: "Induction\nRanges", image: Image(systemName: "bolt.circle.fill")),
            DSStylePillItem(text: "Slide-In\nRanges", image: Image(systemName: "rectangle.inset.filled"))
        ],
        filterPills: [
            DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle")),
            DSFilterPillItem(text: "Brand"),
            DSFilterPillItem(text: "Width"),
            DSFilterPillItem(text: "Color/Finish"),
            DSFilterPillItem(text: "Fuel Type"),
            DSFilterPillItem(text: "Oven Type"),
            DSFilterPillItem(text: "Smart Enabled"),
            DSFilterPillItem(text: "Self-Cleaning")
        ],
        subFilterPills: [
            DSFilterPillItem(text: "In Stock At Store Today"),
            DSFilterPillItem(text: "Free 1-2 Day Delivery"),
            DSFilterPillItem(text: "Get It Fast"),
            DSFilterPillItem(text: "Special Buy"),
            DSFilterPillItem(text: "Best Seller")
        ],
        orangeCatalogSlug: "appliances",
        subcategoryFilter: "Ranges"
    )

    // MARK: - Power Drills Category
    /// Uses OrangeCatalog API to load drill products from nested path tools/drills
    static let powerDrills = PLPCategory(
        title: "POWER DRILLS",
        breadcrumbFilter: "Drills",
        stylePills: [
            DSStylePillItem(text: "Cordless\nDrills", image: Image(systemName: "bolt.batteryblock")),
            DSStylePillItem(text: "Corded\nDrills", image: Image(systemName: "powerplug")),
            DSStylePillItem(text: "Hammer\nDrills", image: Image(systemName: "hammer")),
            DSStylePillItem(text: "Impact\nDrivers", image: Image(systemName: "bolt.circle")),
            DSStylePillItem(text: "Drill\nCombo Kits", image: Image(systemName: "cube.box"))
        ],
        filterPills: [
            DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle")),
            DSFilterPillItem(text: "Brand"),
            DSFilterPillItem(text: "Power Source"),
            DSFilterPillItem(text: "Voltage"),
            DSFilterPillItem(text: "Chuck Size")
        ],
        subFilterPills: [
            DSFilterPillItem(text: "In Stock At Store Today"),
            DSFilterPillItem(text: "Free 1-2 Day Delivery")
        ],
        orangeCatalogSlug: "tools/drills",
        subcategoryFilter: nil  // Show all drill types from nested _all.json
    )

    // MARK: - Power Saws Category
    /// Uses OrangeCatalog API to load saw products from nested path tools/saws
    static let powerSaws = PLPCategory(
        title: "POWER SAWS",
        breadcrumbFilter: "Saws",
        stylePills: [
            DSStylePillItem(text: "Circular\nSaws", image: Image(systemName: "circle.grid.cross")),
            DSStylePillItem(text: "Miter\nSaws", image: Image(systemName: "triangle")),
            DSStylePillItem(text: "Table\nSaws", image: Image(systemName: "rectangle.grid.1x2")),
            DSStylePillItem(text: "Jig\nSaws", image: Image(systemName: "waveform")),
            DSStylePillItem(text: "Reciprocating\nSaws", image: Image(systemName: "scissors"))
        ],
        filterPills: [
            DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle")),
            DSFilterPillItem(text: "Brand"),
            DSFilterPillItem(text: "Power Source")
        ],
        subFilterPills: [
            DSFilterPillItem(text: "In Stock At Store Today")
        ],
        orangeCatalogSlug: "tools/saws",
        subcategoryFilter: nil  // Show all saw types from nested _all.json
    )

    // MARK: - Sanders Category
    /// Uses OrangeCatalog API to load sander products from nested path tools/sanders
    static let sanders = PLPCategory(
        title: "SANDERS",
        breadcrumbFilter: "Sanders",
        stylePills: [
            DSStylePillItem(text: "Random Orbit\nSanders", image: Image(systemName: "circle.dotted")),
            DSStylePillItem(text: "Belt\nSanders", image: Image(systemName: "arrow.forward")),
            DSStylePillItem(text: "Detail\nSanders", image: Image(systemName: "hand.point.up")),
            DSStylePillItem(text: "Sheet\nSanders", image: Image(systemName: "rectangle"))
        ],
        filterPills: [
            DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle")),
            DSFilterPillItem(text: "Brand")
        ],
        subFilterPills: [],
        orangeCatalogSlug: "tools/sanders",
        subcategoryFilter: nil  // Show all sander types from nested _all.json
    )
    
    // MARK: - Bedroom Furniture Category
    static let bedroomFurniture = PLPCategory(
        title: "BEDROOM FURNITURE",
        breadcrumbFilter: "Bedroom",
        stylePills: [
            DSStylePillItem(text: "Beds &\nHeadboards", image: Image(systemName: "bed.double.fill")),
            DSStylePillItem(text: "Dressers &\nChests", image: Image(systemName: "cabinet.fill")),
            DSStylePillItem(text: "Nightstands", image: Image(systemName: "tablecells.fill")),
            DSStylePillItem(text: "Bedroom\nSets", image: Image(systemName: "square.stack.3d.up.fill"))
        ],
        filterPills: [
            DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle")),
            DSFilterPillItem(text: "Brand"),
            DSFilterPillItem(text: "Size"),
            DSFilterPillItem(text: "Material"),
            DSFilterPillItem(text: "Color/Finish")
        ],
        subFilterPills: [
            DSFilterPillItem(text: "In Stock At Store Today"),
            DSFilterPillItem(text: "Free 1-2 Day Delivery")
        ],
        orangeCatalogSlug: "furniture",
        subcategoryFilter: "Bedroom"
    )

    // MARK: - Lighting Category
    static let lighting = PLPCategory(
        title: "LIGHTING",
        breadcrumbFilter: "Lighting",
        stylePills: [
            DSStylePillItem(text: "Ceiling\nLights", image: Image(systemName: "lightbulb.fill")),
            DSStylePillItem(text: "Pendant\nLights", image: Image(systemName: "light.max")),
            DSStylePillItem(text: "Track\nLighting", image: Image(systemName: "light.panel")),
            DSStylePillItem(text: "Outdoor\nLighting", image: Image(systemName: "sun.max.fill"))
        ],
        filterPills: [
            DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle")),
            DSFilterPillItem(text: "Brand"),
            DSFilterPillItem(text: "Style"),
            DSFilterPillItem(text: "Finish"),
            DSFilterPillItem(text: "Bulb Type")
        ],
        subFilterPills: [
            DSFilterPillItem(text: "In Stock At Store Today"),
            DSFilterPillItem(text: "Free 1-2 Day Delivery")
        ],
        orangeCatalogSlug: "electrical",
        subcategoryFilter: "Lighting"
    )
    
    // MARK: - Grinders Category
    /// Uses OrangeCatalog API to load grinder products from nested path tools/grinders
    static let grinders = PLPCategory(
        title: "GRINDERS",
        breadcrumbFilter: "Grinders",
        stylePills: [
            DSStylePillItem(text: "Angle\nGrinders", image: Image(systemName: "circle.grid.cross")),
            DSStylePillItem(text: "Bench\nGrinders", image: Image(systemName: "rectangle.on.rectangle")),
            DSStylePillItem(text: "Die\nGrinders", image: Image(systemName: "cylinder")),
            DSStylePillItem(text: "Grinding\nWheels", image: Image(systemName: "circle.dotted"))
        ],
        filterPills: [
            DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle")),
            DSFilterPillItem(text: "Brand"),
            DSFilterPillItem(text: "Power Source"),
            DSFilterPillItem(text: "Disc Size"),
            DSFilterPillItem(text: "Amps")
        ],
        subFilterPills: [
            DSFilterPillItem(text: "In Stock At Store Today"),
            DSFilterPillItem(text: "Free 1-2 Day Delivery")
        ],
        orangeCatalogSlug: "tools/grinders",
        subcategoryFilter: nil  // Show all grinder types from nested _all.json
    )

    // MARK: - Smart Home Category
    static let smartHome = PLPCategory(
        title: "SMART HOME",
        breadcrumbFilter: "Smart Home",
        stylePills: [
            DSStylePillItem(text: "Smart\nThermostats", image: Image(systemName: "thermometer")),
            DSStylePillItem(text: "Smart\nSpeakers", image: Image(systemName: "homepod.fill")),
            DSStylePillItem(text: "Smart\nLocks", image: Image(systemName: "lock.fill")),
            DSStylePillItem(text: "Smart\nCameras", image: Image(systemName: "video.fill"))
        ],
        filterPills: [
            DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle")),
            DSFilterPillItem(text: "Brand"),
            DSFilterPillItem(text: "Voice Assistant"),
            DSFilterPillItem(text: "Connectivity"),
            DSFilterPillItem(text: "Power Source")
        ],
        subFilterPills: [
            DSFilterPillItem(text: "In Stock At Store Today"),
            DSFilterPillItem(text: "Free 1-2 Day Delivery")
        ],
        orangeCatalogSlug: "electrical",
        subcategoryFilter: "Smart Home"
    )

    // MARK: - Tool Storage Category
    /// Uses OrangeCatalog API to load tool storage products from nested path tools/tool-storage
    static let toolStorage = PLPCategory(
        title: "TOOL STORAGE",
        breadcrumbFilter: "Tool Storage",
        stylePills: [
            DSStylePillItem(text: "Rolling\nTool Cabinets", image: Image(systemName: "shippingbox.fill")),
            DSStylePillItem(text: "Top\nChests", image: Image(systemName: "square.stack.fill")),
            DSStylePillItem(text: "Combo\nSets", image: Image(systemName: "square.stack.3d.up.fill")),
            DSStylePillItem(text: "Mobile\nWorkbenches", image: Image(systemName: "wrench.and.screwdriver.fill"))
        ],
        filterPills: [
            DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle")),
            DSFilterPillItem(text: "Brand"),
            DSFilterPillItem(text: "Width"),
            DSFilterPillItem(text: "Number of Drawers"),
            DSFilterPillItem(text: "Material")
        ],
        subFilterPills: [
            DSFilterPillItem(text: "In Stock At Store Today"),
            DSFilterPillItem(text: "Free 1-2 Day Delivery")
        ],
        orangeCatalogSlug: "tools/tool-storage",
        subcategoryFilter: nil  // Show all tool storage types from nested _all.json
    )

    // MARK: - OrangeCatalog Categories (Remote API)

    /// Tools category loaded from OrangeCatalog remote API
    static let orangeCatalogTools = PLPCategory(
        title: "TOOLS",
        breadcrumbFilter: "Tools",
        stylePills: [
            DSStylePillItem(text: "Power\nDrills", image: Image(systemName: "screwdriver")),
            DSStylePillItem(text: "Power\nSaws", image: Image(systemName: "scissors")),
            DSStylePillItem(text: "Sanders", image: Image(systemName: "circle.dotted")),
            DSStylePillItem(text: "Wrenches", image: Image(systemName: "wrench"))
        ],
        filterPills: [
            DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle")),
            DSFilterPillItem(text: "Brand"),
            DSFilterPillItem(text: "Price"),
            DSFilterPillItem(text: "Rating")
        ],
        subFilterPills: [],
        orangeCatalogSlug: "tools"
    )

    /// Appliances category loaded from OrangeCatalog remote API
    static let orangeCatalogAppliances = PLPCategory(
        title: "APPLIANCES",
        breadcrumbFilter: "Appliances",
        stylePills: [
            DSStylePillItem(text: "Refrigerators", image: Image(systemName: "refrigerator.fill")),
            DSStylePillItem(text: "Dishwashers", image: Image(systemName: "dishwasher.fill")),
            DSStylePillItem(text: "Washers", image: Image(systemName: "washer.fill")),
            DSStylePillItem(text: "Dryers", image: Image(systemName: "dryer.fill"))
        ],
        filterPills: [
            DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle")),
            DSFilterPillItem(text: "Brand"),
            DSFilterPillItem(text: "Price"),
            DSFilterPillItem(text: "Rating")
        ],
        subFilterPills: [],
        orangeCatalogSlug: "appliances"
    )

    // MARK: - Automotive Category
    /// Automotive products from OrangeCatalog - 55 products
    static let automotive = PLPCategory(
        title: "AUTOMOTIVE",
        breadcrumbFilter: "Automotive",
        stylePills: [
            DSStylePillItem(text: "Car\nCleaning", image: Image(systemName: "car.wash.fill")),
            DSStylePillItem(text: "Motor\nFluids", image: Image(systemName: "drop.fill")),
            DSStylePillItem(text: "Jacks &\nLifts", image: Image(systemName: "arrow.up.square.fill")),
            DSStylePillItem(text: "Battery\nChargers", image: Image(systemName: "battery.100.bolt"))
        ],
        filterPills: [
            DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle")),
            DSFilterPillItem(text: "Brand"),
            DSFilterPillItem(text: "Price"),
            DSFilterPillItem(text: "Rating")
        ],
        subFilterPills: [
            DSFilterPillItem(text: "In Stock"),
            DSFilterPillItem(text: "Free Delivery")
        ],
        orangeCatalogSlug: "automotive"
    )

    // MARK: - Garage Category
    /// Garage products from OrangeCatalog - 167 products
    static let garage = PLPCategory(
        title: "GARAGE",
        breadcrumbFilter: "Garage",
        stylePills: [
            DSStylePillItem(text: "Garage\nFlooring", image: Image(systemName: "square.grid.3x3.fill")),
            DSStylePillItem(text: "Garage\nDoors", image: Image(systemName: "door.garage.closed")),
            DSStylePillItem(text: "Garage\nStorage", image: Image(systemName: "shippingbox.fill")),
            DSStylePillItem(text: "Work\nBenches", image: Image(systemName: "tablecells.fill"))
        ],
        filterPills: [
            DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle")),
            DSFilterPillItem(text: "Brand"),
            DSFilterPillItem(text: "Price"),
            DSFilterPillItem(text: "Type"),
            DSFilterPillItem(text: "Material")
        ],
        subFilterPills: [
            DSFilterPillItem(text: "In Stock"),
            DSFilterPillItem(text: "Free Delivery"),
            DSFilterPillItem(text: "Best Seller")
        ],
        orangeCatalogSlug: "garage"
    )

    // MARK: - Home Decor Category
    /// Home Decor products from OrangeCatalog - 321 products
    static let homeDecor = PLPCategory(
        title: "HOME DECOR",
        breadcrumbFilter: "Home Decor",
        stylePills: [
            DSStylePillItem(text: "Artificial\nPlants", image: Image(systemName: "leaf.fill")),
            DSStylePillItem(text: "Bedding", image: Image(systemName: "bed.double.fill")),
            DSStylePillItem(text: "Wall\nArt", image: Image(systemName: "photo.artframe")),
            DSStylePillItem(text: "Rugs", image: Image(systemName: "square.fill")),
            DSStylePillItem(text: "Mirrors", image: Image(systemName: "rectangle.portrait.fill"))
        ],
        filterPills: [
            DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle")),
            DSFilterPillItem(text: "Brand"),
            DSFilterPillItem(text: "Price"),
            DSFilterPillItem(text: "Style"),
            DSFilterPillItem(text: "Color")
        ],
        subFilterPills: [
            DSFilterPillItem(text: "In Stock"),
            DSFilterPillItem(text: "Free Delivery"),
            DSFilterPillItem(text: "New Arrivals")
        ],
        orangeCatalogSlug: "home-decor"
    )

    // MARK: - Other Category
    /// Miscellaneous products from OrangeCatalog - 619 products
    static let other = PLPCategory(
        title: "MORE PRODUCTS",
        breadcrumbFilter: "Other",
        stylePills: [
            DSStylePillItem(text: "All\nProducts", image: Image(systemName: "square.grid.2x2.fill")),
            DSStylePillItem(text: "Top\nRated", image: Image(systemName: "star.fill")),
            DSStylePillItem(text: "Best\nSellers", image: Image(systemName: "flame.fill")),
            DSStylePillItem(text: "On\nSale", image: Image(systemName: "tag.fill"))
        ],
        filterPills: [
            DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle")),
            DSFilterPillItem(text: "Brand"),
            DSFilterPillItem(text: "Price"),
            DSFilterPillItem(text: "Rating")
        ],
        subFilterPills: [
            DSFilterPillItem(text: "In Stock"),
            DSFilterPillItem(text: "Free Delivery"),
            DSFilterPillItem(text: "Special Buy")
        ],
        orangeCatalogSlug: "other"
    )
}

// MARK: - =============================================
// MARK: - SORT OPTION ENUM
// MARK: - =============================================

enum PLPSortOption: String, CaseIterable {
    case topRated = "Top Rated"
    case priceLowToHigh = "Price: Low to High"
    case priceHighToLow = "Price: High to Low"
    case bestSelling = "Best Selling"
    case newest = "Newest"
}

// MARK: - =============================================
// MARK: - VIEW MODE ENUM
// MARK: - =============================================

enum PLPViewMode {
    case list
    case grid
}

// MARK: - =============================================
// MARK: - PREVIEW
// MARK: - =============================================

#Preview("PLP - Refrigerators") {
    PLPView(category: .refrigerators)
}

#Preview("PLP - Washers & Dryers") {
    PLPView(category: .washersAndDryers)
}

#Preview("PLP - Dishwashers") {
    PLPView(category: .dishwashers)
}

#Preview("PLP - Ranges") {
    PLPView(category: .ranges)
}

#Preview("PLP - Power Drills") {
    PLPView(category: .powerDrills)
}

#Preview("PLP - Power Saws") {
    PLPView(category: .powerSaws)
}

#Preview("PLP - Sanders") {
    PLPView(category: .sanders)
}

#Preview("PLP - Grinders") {
    PLPView(category: .grinders)
}

#Preview("PLP - Tool Storage") {
    PLPView(category: .toolStorage)
}

#Preview("PLP - Bedroom Furniture") {
    PLPView(category: .bedroomFurniture)
}

#Preview("PLP - Lighting") {
    PLPView(category: .lighting)
}

#Preview("PLP - Smart Home") {
    PLPView(category: .smartHome)
}

// MARK: - OrangeCatalog Previews

#Preview("PLP - OrangeCatalog Tools") {
    PLPView(category: .orangeCatalogTools)
}

#Preview("PLP - OrangeCatalog Appliances") {
    PLPView(category: .orangeCatalogAppliances)
}

