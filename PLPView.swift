import SwiftUI

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
    @State private var categoryData: CategoryPageData? = nil // NEW: Store full category data
    @State private var selectedStylePill: String? = nil
    @State private var selectedFilterPills: Set<String> = []
    @State private var selectedSubFilters: Set<String> = []
    @State private var viewMode: PLPViewMode = .list
    @State private var selectedSortOption: PLPSortOption = .topRated // NEW: For sorting
    @State private var currentPage: Int = 1 // NEW: For pagination support
    
    // MARK: - Configuration
    let category: PLPCategory
    
    // Computed properties based on category or JSON data
    private var categoryTitle: String {
        // Use JSON data if available, otherwise use category title
        categoryData?.pageInfo.categoryName.uppercased() ?? category.title
    }
    
    private var stylePills: [DSStylePillItem] {
        category.stylePills
    }
    
    private var filterPills: [DSFilterPillItem] {
        // Use JSON filters if available, otherwise use category filter pills
        if let jsonFilters = categoryData?.filters {
            return jsonFilters.prefix(5).map { filter in
                DSFilterPillItem(text: filter.filterGroupName)
            }
        }
        return category.filterPills
    }
    
    private var subFilterPills: [DSFilterPillItem] {
        // Use JSON quick filters if available, otherwise use category sub-filter pills
        if let quickFilters = categoryData?.quickFilters {
            return quickFilters.map { filter in
                DSFilterPillItem(text: filter.label)
            }
        }
        return category.subFilterPills
    }
    
    private var totalResults: Int {
        categoryData?.pageInfo.totalResults ?? products.count
    }
    
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
                
                // Product List/Grid
                productInventory
                    .padding(.horizontal, DesignSystemGlobal.Spacing4)
            }
            .padding(.top, 16) // Space for top navigation
            .padding(.bottom, 16) // Space for bottom navigation
        }
        .background(DesignSystemGlobal.BackgroundSurfaceColorGreige)
        .onAppear {
            loadProducts()
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
                // Using modern DSProductCard component with modular sub-components:
                // - DSProductImageContainer: Image with badges, swatches, sponsored tag
                // - DSPlpPodDetails: Product details (brand, title, model, pricing, ratings)
                // - DSPodButtonSet: Action buttons (B2C variant)
                DSProductCard(
                    imageURL: URL(string: product.heroImage),
                    showExclusiveBadge: product.isExclusive,
                    showDeliveryBadge: product.deliveryInfo?.primaryValue == "Free",
                    showSponsoredTag: product.isSponsored,
                    swatches: product.availableColors?.compactMap { Color(hex: $0.colorHex) } ?? [],
                    additionalSwatchCount: product.additionalColorCount,
                    brand: product.brand,
                    title: product.name,
                    modelNumber: product.modelNumber,
                    priceText: formatPrice(product.currentPrice, originalPrice: product.originalPrice),
                    rating: product.rating,
                    ratingCount: product.reviewCount,
                    pickupInfo: product.pickupInfo.map { "\($0.primaryValue) \($0.secondaryValue ?? "")" },
                    deliveryInfo: product.deliveryInfo.map { "\($0.primaryValue) \($0.secondaryValue ?? "")" },
                    buttonVariant: .b2c,
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
                // Using modern DSProductCard component (same as list view)
                // Grid layout is handled by LazyVGrid, component stays the same
                DSProductCard(
                    imageURL: URL(string: product.heroImage),
                    showExclusiveBadge: product.isExclusive,
                    showDeliveryBadge: product.deliveryInfo?.primaryValue == "Free",
                    showSponsoredTag: product.isSponsored,
                    swatches: product.availableColors?.compactMap { Color(hex: $0.colorHex) } ?? [],
                    additionalSwatchCount: product.additionalColorCount,
                    brand: product.brand,
                    title: product.name,
                    modelNumber: product.modelNumber,
                    priceText: formatPrice(product.currentPrice, originalPrice: product.originalPrice),
                    rating: product.rating,
                    ratingCount: product.reviewCount,
                    pickupInfo: product.pickupInfo.map { "\($0.primaryValue) \($0.secondaryValue ?? "")" },
                    deliveryInfo: product.deliveryInfo.map { "\($0.primaryValue) \($0.secondaryValue ?? "")" },
                    buttonVariant: .b2c,
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
        let filtered = products
        
        // Apply filters here (simplified - in real app would be more complex)
        if !selectedSubFilters.isEmpty {
            // Filter logic would go here based on selected filters
        }
        
        return filtered
    }
    
    // MARK: - Actions
    
    private func formatPrice(_ currentPrice: Decimal, originalPrice: Decimal?) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "USD"
        
        if let originalPrice = originalPrice, originalPrice > currentPrice {
            // Has a sale price
            let currentFormatted = formatter.string(from: currentPrice as NSDecimalNumber) ?? "$\(currentPrice)"
            return currentFormatted
        } else {
            return formatter.string(from: currentPrice as NSDecimalNumber) ?? "$\(currentPrice)"
        }
    }
    
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
    
    private func loadProducts() {
        // 🔍 DIAGNOSTIC: List all images in the bundle
        debugListBundleImages()
        
        // Check if we have a category-specific JSON file
        if let jsonFilename = category.categoryJSONFilename,
           let loadedCategoryData = CategoryDataLoader.shared.loadCategoryData(filename: jsonFilename) {
            // Store the category data for use in views
            categoryData = loadedCategoryData
            
            // Load products from category JSON file
            products = loadedCategoryData.products.map { $0.toProduct() }
            print("📦 Loaded \(products.count) products from \(jsonFilename).json")
            print("   📊 Total results from JSON: \(loadedCategoryData.pageInfo.totalResults)")
            print("   🎨 Featured brands: \(loadedCategoryData.featuredBrands.count)")
            print("   🔍 Filters available: \(loadedCategoryData.filters.count)")
            print("   ⚡️ Quick filters: \(loadedCategoryData.quickFilters.count)")
            
            // Debug: Log sample product image URLs
            if let firstProduct = products.first {
                print("🖼️ Sample product hero image URL: \(firstProduct.heroImage)")
                print("   Brand: \(firstProduct.brand)")
                print("   Name: \(firstProduct.name)")
            }
            return
        }
        
        // Otherwise, load from pip-datasets.json
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
    let categoryJSONFilename: String?  // NEW: Optional category JSON file
    
    init(
        title: String,
        breadcrumbFilter: String,
        stylePills: [DSStylePillItem],
        filterPills: [DSFilterPillItem],
        subFilterPills: [DSFilterPillItem],
        categoryJSONFilename: String? = nil
    ) {
        self.title = title
        self.breadcrumbFilter = breadcrumbFilter
        self.stylePills = stylePills
        self.filterPills = filterPills
        self.subFilterPills = subFilterPills
        self.categoryJSONFilename = categoryJSONFilename
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
    /// Now uses french-door-refrigerators.json by default!
    static let refrigerators: PLPCategory = {
        guard let categoryData = CategoryDataLoader.shared.loadCategoryData(filename: "french-door-refrigerators") else {
            // Fallback to SF Symbols if JSON not found
            return PLPCategory(
                title: "REFRIGERATORS",
                breadcrumbFilter: "Refrigerator",
                stylePills: [
                    DSStylePillItem(text: "French Door\nRefrigerators", image: Image(systemName: "refrigerator.fill")),
                    DSStylePillItem(text: "Side by Side\nRefrigerators", image: Image(systemName: "refrigerator.fill")),
                    DSStylePillItem(text: "Top Freezer\nRefrigerators", image: Image(systemName: "refrigerator.fill")),
                    DSStylePillItem(text: "Bottom Freezer\nRefrigerators", image: Image(systemName: "refrigerator.fill")),
                    DSStylePillItem(text: "Counter Depth\nRefrigerators", image: Image(systemName: "refrigerator.fill")),
                    DSStylePillItem(text: "Mini Fridges", image: Image(systemName: "refrigerator.fill"))
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
                ]
            )
        }
        
        // Create style pills from refrigeratorStyles data with real product images!
        let stylePills: [DSStylePillItem]
        if let refrigeratorStyles = categoryData.refrigeratorStyles {
            stylePills = CategoryDataLoader.shared.createStylePills(from: refrigeratorStyles)
        } else {
            // Fallback with placeholder images
            stylePills = [
                DSStylePillItem(text: "French Door\nRefrigerators", image: Image(systemName: "refrigerator.fill")),
                DSStylePillItem(text: "Side by Side\nRefrigerators", image: Image(systemName: "refrigerator.fill")),
                DSStylePillItem(text: "Top Freezer\nRefrigerators", image: Image(systemName: "refrigerator.fill")),
                DSStylePillItem(text: "Bottom Freezer\nRefrigerators", image: Image(systemName: "refrigerator.fill")),
                DSStylePillItem(text: "Counter Depth\nRefrigerators", image: Image(systemName: "refrigerator.fill")),
                DSStylePillItem(text: "Mini Fridges", image: Image(systemName: "refrigerator.fill"))
            ]
        }
        
        print("🎨 Created \(stylePills.count) style pills from category data")
        stylePills.forEach { pill in
            if let imageURL = pill.imageURL {
                print("   ✅ \(pill.text): \(imageURL)")
            } else {
                print("   ⚠️ \(pill.text): No image URL (using fallback)")
            }
        }
        
        return PLPCategory(
            title: categoryData.pageInfo.categoryName.uppercased(),
            breadcrumbFilter: "French Door",
            stylePills: stylePills,
            filterPills: [
                DSFilterPillItem(
                    text: "All Filters",
                    icon: Image(systemName: "line.3.horizontal.decrease.circle")
                ),
                DSFilterPillItem(text: "Brand"),
                DSFilterPillItem(text: "Price"),
                DSFilterPillItem(text: "Capacity (cu. ft.)"),
                DSFilterPillItem(text: "Number of Doors"),
                DSFilterPillItem(text: "Features")
            ],
            subFilterPills: [
                DSFilterPillItem(text: "Counter Depth"),
                DSFilterPillItem(text: "30 Inch Wide"),
                DSFilterPillItem(text: "Smart Enabled"),
                DSFilterPillItem(text: "Top Seller"),
                DSFilterPillItem(text: "Special Buy"),
                DSFilterPillItem(text: "ENERGY STAR")
            ],
            categoryJSONFilename: "french-door-refrigerators"
        )
    }()
    
    // MARK: - Dishwashers Category
    static let dishwashers: PLPCategory = {
        // Try to load from dishwashers.json if it exists
        guard let categoryData = CategoryDataLoader.shared.loadCategoryData(filename: "dishwashers") else {
            // Fallback to SF Symbols if JSON not found
            return PLPCategory(
                title: "DISHWASHERS",
                breadcrumbFilter: "Dishwasher",
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
                ]
            )
        }
        
        // Load style pills from JSON
        let stylePills: [DSStylePillItem]
        if let categoryStyles = categoryData.categoryStyles {
            stylePills = CategoryDataLoader.shared.createStylePills(from: categoryStyles, fallbackIcon: "dishwasher.fill")
        } else {
            // Fallback with placeholder images
            stylePills = [
                DSStylePillItem(text: "Built-In\nDishwashers", image: Image(systemName: "dishwasher.fill")),
                DSStylePillItem(text: "Portable\nDishwashers", image: Image(systemName: "dishwasher.fill")),
                DSStylePillItem(text: "Drawer\nDishwashers", image: Image(systemName: "dishwasher.fill")),
                DSStylePillItem(text: "Panel Ready\nDishwashers", image: Image(systemName: "dishwasher.fill"))
            ]
        }
        
        print("🎨 Created \(stylePills.count) style pills from dishwashers.json")
        
        return PLPCategory(
            title: categoryData.pageInfo.categoryName.uppercased(),
            breadcrumbFilter: "Dishwasher",
            stylePills: stylePills,
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
            categoryJSONFilename: "dishwashers"
        )
    }()
    
    // MARK: - Washing Machines Category
    static let washingMachines: PLPCategory = {
        // Try to load from washing-machines.json if it exists
        guard let categoryData = CategoryDataLoader.shared.loadCategoryData(filename: "washing-machines") else {
            // Fallback to SF Symbols if JSON not found
            return PLPCategory(
                title: "WASHING MACHINES",
                breadcrumbFilter: "Washing Machine",
                stylePills: [
                    DSStylePillItem(text: "Front Load\nWashers", image: Image(systemName: "washer.fill")),
                    DSStylePillItem(text: "Top Load\nWashers", image: Image(systemName: "washer.fill")),
                    DSStylePillItem(text: "High Efficiency\nWashers", image: Image(systemName: "washer.fill")),
                    DSStylePillItem(text: "Portable\nWashers", image: Image(systemName: "washer.fill")),
                    DSStylePillItem(text: "Washer-Dryer\nCombos", image: Image(systemName: "washer.fill"))
                ],
                filterPills: [
                    DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle")),
                    DSFilterPillItem(text: "Brand"),
                    DSFilterPillItem(text: "Capacity (cu. ft.)"),
                    DSFilterPillItem(text: "Color/Finish"),
                    DSFilterPillItem(text: "Washer Type"),
                    DSFilterPillItem(text: "Smart Enabled"),
                    DSFilterPillItem(text: "Energy Star"),
                    DSFilterPillItem(text: "Steam Cycle")
                ],
                subFilterPills: [
                    DSFilterPillItem(text: "In Stock At Store Today"),
                    DSFilterPillItem(text: "Free 1-2 Day Delivery"),
                    DSFilterPillItem(text: "Get It Fast"),
                    DSFilterPillItem(text: "Special Buy"),
                    DSFilterPillItem(text: "Best Seller")
                ]
            )
        }
        
        // Load style pills from JSON
        let stylePills: [DSStylePillItem]
        if let categoryStyles = categoryData.categoryStyles {
            stylePills = CategoryDataLoader.shared.createStylePills(from: categoryStyles, fallbackIcon: "washer.fill")
        } else {
            // Fallback with placeholder images
            stylePills = [
                DSStylePillItem(text: "Front Load\nWashers", image: Image(systemName: "washer.fill")),
                DSStylePillItem(text: "Top Load\nWashers", image: Image(systemName: "washer.fill")),
                DSStylePillItem(text: "High Efficiency\nWashers", image: Image(systemName: "washer.fill")),
                DSStylePillItem(text: "Portable\nWashers", image: Image(systemName: "washer.fill")),
                DSStylePillItem(text: "Washer-Dryer\nCombos", image: Image(systemName: "washer.fill"))
            ]
        }
        
        print("🎨 Created \(stylePills.count) style pills from washing-machines.json")
        
        return PLPCategory(
            title: categoryData.pageInfo.categoryName.uppercased(),
            breadcrumbFilter: "Washing Machine",
            stylePills: stylePills,
            filterPills: [
                DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle")),
                DSFilterPillItem(text: "Brand"),
                DSFilterPillItem(text: "Capacity (cu. ft.)"),
                DSFilterPillItem(text: "Color/Finish"),
                DSFilterPillItem(text: "Washer Type"),
                DSFilterPillItem(text: "Smart Enabled"),
                DSFilterPillItem(text: "Energy Star"),
                DSFilterPillItem(text: "Steam Cycle")
            ],
            subFilterPills: [
                DSFilterPillItem(text: "In Stock At Store Today"),
                DSFilterPillItem(text: "Free 1-2 Day Delivery"),
                DSFilterPillItem(text: "Get It Fast"),
                DSFilterPillItem(text: "Special Buy"),
                DSFilterPillItem(text: "Best Seller")
            ],
            categoryJSONFilename: "washing-machines"
        )
    }()
    
    // MARK: - Dryers Category
    static let dryers: PLPCategory = {
        // Try to load from dryers.json if it exists
        guard let categoryData = CategoryDataLoader.shared.loadCategoryData(filename: "dryers") else {
            // Fallback to SF Symbols if JSON not found
            return PLPCategory(
                title: "DRYERS",
                breadcrumbFilter: "Dryer",
                stylePills: [
                    DSStylePillItem(text: "Electric\nDryers", image: Image(systemName: "dryer.fill")),
                    DSStylePillItem(text: "Gas\nDryers", image: Image(systemName: "dryer.fill")),
                    DSStylePillItem(text: "Ventless\nDryers", image: Image(systemName: "dryer.fill")),
                    DSStylePillItem(text: "Portable\nDryers", image: Image(systemName: "dryer.fill"))
                ],
                filterPills: [
                    DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle")),
                    DSFilterPillItem(text: "Brand"),
                    DSFilterPillItem(text: "Capacity (cu. ft.)"),
                    DSFilterPillItem(text: "Color/Finish"),
                    DSFilterPillItem(text: "Fuel Type"),
                    DSFilterPillItem(text: "Smart Enabled"),
                    DSFilterPillItem(text: "Energy Star"),
                    DSFilterPillItem(text: "Steam Cycle")
                ],
                subFilterPills: [
                    DSFilterPillItem(text: "In Stock At Store Today"),
                    DSFilterPillItem(text: "Free 1-2 Day Delivery"),
                    DSFilterPillItem(text: "Get It Fast"),
                    DSFilterPillItem(text: "Special Buy")
                ]
            )
        }
        
        // Load style pills from JSON
        let stylePills: [DSStylePillItem]
        if let categoryStyles = categoryData.categoryStyles {
            stylePills = CategoryDataLoader.shared.createStylePills(from: categoryStyles, fallbackIcon: "dryer.fill")
        } else {
            // Fallback with placeholder images
            stylePills = [
                DSStylePillItem(text: "Electric\nDryers", image: Image(systemName: "dryer.fill")),
                DSStylePillItem(text: "Gas\nDryers", image: Image(systemName: "dryer.fill")),
                DSStylePillItem(text: "Ventless\nDryers", image: Image(systemName: "dryer.fill")),
                DSStylePillItem(text: "Portable\nDryers", image: Image(systemName: "dryer.fill"))
            ]
        }
        
        print("🎨 Created \(stylePills.count) style pills from dryers.json")
        
        return PLPCategory(
            title: categoryData.pageInfo.categoryName.uppercased(),
            breadcrumbFilter: "Dryer",
            stylePills: stylePills,
            filterPills: [
                DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle")),
                DSFilterPillItem(text: "Brand"),
                DSFilterPillItem(text: "Capacity (cu. ft.)"),
                DSFilterPillItem(text: "Color/Finish"),
                DSFilterPillItem(text: "Fuel Type"),
                DSFilterPillItem(text: "Smart Enabled"),
                DSFilterPillItem(text: "Energy Star"),
                DSFilterPillItem(text: "Steam Cycle")
            ],
            subFilterPills: [
                DSFilterPillItem(text: "In Stock At Store Today"),
                DSFilterPillItem(text: "Free 1-2 Day Delivery"),
                DSFilterPillItem(text: "Get It Fast"),
                DSFilterPillItem(text: "Special Buy")
            ],
            categoryJSONFilename: "dryers"
        )
    }()
    
    // MARK: - Ranges Category
    static let ranges: PLPCategory = {
        // Try to load from ranges.json if it exists
        guard let categoryData = CategoryDataLoader.shared.loadCategoryData(filename: "ranges") else {
            // Fallback to SF Symbols if JSON not found
            return PLPCategory(
                title: "RANGES",
                breadcrumbFilter: "Range",
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
                ]
            )
        }
        
        // Load style pills from JSON
        let stylePills: [DSStylePillItem]
        if let categoryStyles = categoryData.categoryStyles {
            stylePills = CategoryDataLoader.shared.createStylePills(from: categoryStyles, fallbackIcon: "flame.fill")
        } else {
            // Fallback with placeholder images
            stylePills = [
                DSStylePillItem(text: "Gas\nRanges", image: Image(systemName: "flame.fill")),
                DSStylePillItem(text: "Electric\nRanges", image: Image(systemName: "bolt.fill")),
                DSStylePillItem(text: "Dual Fuel\nRanges", image: Image(systemName: "flame.fill")),
                DSStylePillItem(text: "Induction\nRanges", image: Image(systemName: "bolt.circle.fill")),
                DSStylePillItem(text: "Slide-In\nRanges", image: Image(systemName: "rectangle.inset.filled"))
            ]
        }
        
        print("🎨 Created \(stylePills.count) style pills from ranges.json")
        
        return PLPCategory(
            title: categoryData.pageInfo.categoryName.uppercased(),
            breadcrumbFilter: "Range",
            stylePills: stylePills,
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
            categoryJSONFilename: "ranges"
        )
    }()
    
    // MARK: - Power Drills Category
    static let powerDrills: PLPCategory = {
        // Try to load from power-drills.json if it exists
        guard let categoryData = CategoryDataLoader.shared.loadCategoryData(filename: "power-drills") else {
            // Fallback to SF Symbols if JSON not found
            return PLPCategory(
                title: "POWER DRILLS",
                breadcrumbFilter: "Drill",
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
                ]
            )
        }
        
        // Load style pills from JSON (use categoryStyles if available)
        let stylePills: [DSStylePillItem]
        if let categoryStyles = categoryData.categoryStyles {
            stylePills = CategoryDataLoader.shared.createStylePills(from: categoryStyles, fallbackIcon: "wrench.and.screwdriver")
        } else if let refrigeratorStyles = categoryData.refrigeratorStyles {
            // Fallback for backwards compatibility
            stylePills = CategoryDataLoader.shared.createStylePills(from: refrigeratorStyles)
        } else {
            // Fallback with placeholder images
            stylePills = [
                DSStylePillItem(text: "Cordless\nDrills", image: Image(systemName: "bolt.batteryblock")),
                DSStylePillItem(text: "Corded\nDrills", image: Image(systemName: "powerplug")),
                DSStylePillItem(text: "Hammer\nDrills", image: Image(systemName: "hammer")),
                DSStylePillItem(text: "Impact\nDrivers", image: Image(systemName: "bolt.circle")),
                DSStylePillItem(text: "Drill\nCombo Kits", image: Image(systemName: "cube.box"))
            ]
        }
        
        print("🎨 Created \(stylePills.count) style pills from power-drills.json")
        
        return PLPCategory(
            title: categoryData.pageInfo.categoryName.uppercased(),
            breadcrumbFilter: "Drill",
            stylePills: stylePills,
            filterPills: [
                DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle")),
                DSFilterPillItem(text: "Brand"),
                DSFilterPillItem(text: "Power Source"),
                DSFilterPillItem(text: "Voltage"),
                DSFilterPillItem(text: "Chuck Size"),
                DSFilterPillItem(text: "Speed Settings"),
                DSFilterPillItem(text: "Brushless Motor")
            ],
            subFilterPills: [
                DSFilterPillItem(text: "In Stock At Store Today"),
                DSFilterPillItem(text: "Free 1-2 Day Delivery"),
                DSFilterPillItem(text: "Get It Fast"),
                DSFilterPillItem(text: "Special Buy"),
                DSFilterPillItem(text: "Best Seller"),
                DSFilterPillItem(text: "Exclusive")
            ],
            categoryJSONFilename: "power-drills"
        )
    }()
    
    // MARK: - Power Saws Category
    static let powerSaws: PLPCategory = {
        guard let categoryData = CategoryDataLoader.shared.loadCategoryData(filename: "power-saws") else {
            // Fallback to SF Symbols
            return PLPCategory(
                title: "POWER SAWS",
                breadcrumbFilter: "Saw",
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
                ]
            )
        }
        
        let stylePills: [DSStylePillItem]
        if let categoryStyles = categoryData.categoryStyles {
            stylePills = CategoryDataLoader.shared.createStylePills(from: categoryStyles, fallbackIcon: "triangle")
        } else {
            // Fallback with placeholder images
            stylePills = [
                DSStylePillItem(text: "Circular\nSaws", image: Image(systemName: "circle.grid.cross")),
                DSStylePillItem(text: "Miter\nSaws", image: Image(systemName: "triangle")),
                DSStylePillItem(text: "Table\nSaws", image: Image(systemName: "rectangle.grid.1x2")),
                DSStylePillItem(text: "Jig\nSaws", image: Image(systemName: "waveform")),
                DSStylePillItem(text: "Reciprocating\nSaws", image: Image(systemName: "scissors"))
            ]
        }
        
        return PLPCategory(
            title: categoryData.pageInfo.categoryName.uppercased(),
            breadcrumbFilter: "Saw",
            stylePills: stylePills,
            filterPills: [
                DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle")),
                DSFilterPillItem(text: "Brand"),
                DSFilterPillItem(text: "Power Source"),
                DSFilterPillItem(text: "Blade Size"),
                DSFilterPillItem(text: "Voltage"),
                DSFilterPillItem(text: "Bevel Capacity")
            ],
            subFilterPills: [
                DSFilterPillItem(text: "In Stock At Store Today"),
                DSFilterPillItem(text: "Free 1-2 Day Delivery"),
                DSFilterPillItem(text: "Get It Fast"),
                DSFilterPillItem(text: "Best Seller")
            ],
            categoryJSONFilename: "power-saws"
        )
    }()
    
    // MARK: - Sanders Category
    static let sanders: PLPCategory = {
        guard let categoryData = CategoryDataLoader.shared.loadCategoryData(filename: "sanders") else {
            // Fallback to SF Symbols
            return PLPCategory(
                title: "SANDERS",
                breadcrumbFilter: "Sander",
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
                subFilterPills: []
            )
        }
        
        let stylePills: [DSStylePillItem]
        if let categoryStyles = categoryData.categoryStyles {
            stylePills = CategoryDataLoader.shared.createStylePills(from: categoryStyles, fallbackIcon: "circle.dotted")
        } else {
            // Fallback with placeholder images
            stylePills = [
                DSStylePillItem(text: "Random Orbit\nSanders", image: Image(systemName: "circle.dotted")),
                DSStylePillItem(text: "Belt\nSanders", image: Image(systemName: "arrow.forward")),
                DSStylePillItem(text: "Detail\nSanders", image: Image(systemName: "hand.point.up")),
                DSStylePillItem(text: "Sheet\nSanders", image: Image(systemName: "rectangle"))
            ]
        }
        
        return PLPCategory(
            title: categoryData.pageInfo.categoryName.uppercased(),
            breadcrumbFilter: "Sander",
            stylePills: stylePills,
            filterPills: [
                DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle")),
                DSFilterPillItem(text: "Brand"),
                DSFilterPillItem(text: "Power Source"),
                DSFilterPillItem(text: "Pad Size"),
                DSFilterPillItem(text: "Variable Speed"),
                DSFilterPillItem(text: "Dust Collection")
            ],
            subFilterPills: [
                DSFilterPillItem(text: "In Stock At Store Today"),
                DSFilterPillItem(text: "Free 1-2 Day Delivery"),
                DSFilterPillItem(text: "Best Seller")
            ],
            categoryJSONFilename: "sanders"
        )
    }()
    
    // MARK: - Refrigerators with Real Product Images
    /// Example using real product images from pip-datasets.json
    static let refrigeratorsWithImages: PLPCategory = {
        PLPCategory.withProductImages(
            title: "REFRIGERATORS",
            breadcrumbFilter: "Refrigerator",
            stylePillConfigs: [
                ("French Door\nRefrigerators", "French Door", "refrigerator.fill"),
                ("Side by Side\nRefrigerators", "Side by Side", "refrigerator.fill"),
                ("Top Freezer\nRefrigerators", "Top Freezer", "refrigerator.fill"),
                ("Bottom Freezer\nRefrigerators", "Bottom Freezer", "refrigerator.fill"),
                ("Counter Depth\nRefrigerators", "Counter Depth", "refrigerator.fill"),
                ("Mini Fridges", "Mini", "refrigerator.fill")
            ],
            filterPills: [
                DSFilterPillItem(
                    text: "All Filters",
                    icon: Image(systemName: "line.3.horizontal.decrease.circle")
                ),
                DSFilterPillItem(text: "Brand"),
                DSFilterPillItem(text: "Refrigerator Width"),
                DSFilterPillItem(text: "Capacity (cu. ft.)"),
                DSFilterPillItem(text: "Color/Finish"),
                DSFilterPillItem(text: "Ice & Water Dispenser"),
                DSFilterPillItem(text: "Smart Enabled"),
                DSFilterPillItem(text: "Energy Star")
            ],
            subFilterPills: [
                DSFilterPillItem(text: "In Stock At Store Today"),
                DSFilterPillItem(text: "Free 1-2 Day Delivery"),
                DSFilterPillItem(text: "Get It Fast"),
                DSFilterPillItem(text: "Special Buy"),
                DSFilterPillItem(text: "Exclusive"),
                DSFilterPillItem(text: "Best Seller")
            ]
        )
    }()
    
    // MARK: - Bathroom Vanities Category
    static let bathroomVanities: PLPCategory = {
        guard let categoryData = CategoryDataLoader.shared.loadCategoryData(filename: "bathroom-vanities") else {
            // Fallback to SF Symbols if JSON not found
            return PLPCategory(
                title: "BATHROOM VANITIES",
                breadcrumbFilter: "Bathroom Vanity",
                stylePills: [
                    DSStylePillItem(text: "Single Sink\nVanities", image: Image(systemName: "sink.fill")),
                    DSStylePillItem(text: "Double Sink\nVanities", image: Image(systemName: "sink.fill")),
                    DSStylePillItem(text: "Floating\nVanities", image: Image(systemName: "rectangle.fill")),
                    DSStylePillItem(text: "Vanities\nwith Top", image: Image(systemName: "square.stack.fill"))
                ],
                filterPills: [
                    DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle")),
                    DSFilterPillItem(text: "Brand"),
                    DSFilterPillItem(text: "Vanity Width"),
                    DSFilterPillItem(text: "Sink Type"),
                    DSFilterPillItem(text: "Color/Finish")
                ],
                subFilterPills: [
                    DSFilterPillItem(text: "In Stock At Store Today"),
                    DSFilterPillItem(text: "Free 1-2 Day Delivery")
                ]
            )
        }
        
        // Extract quick filters if available
        let subFilterPills: [DSFilterPillItem]
        if !categoryData.quickFilters.isEmpty {
            subFilterPills = categoryData.quickFilters.map { DSFilterPillItem(text: $0.label) }
        } else {
            subFilterPills = [
                DSFilterPillItem(text: "In Stock At Store Today"),
                DSFilterPillItem(text: "Free 1-2 Day Delivery")
            ]
        }
        
        // Extract main filters
        let filterPills: [DSFilterPillItem]
        if !categoryData.filters.isEmpty {
            var pills = [DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle"))]
            pills.append(contentsOf: categoryData.filters.prefix(6).map { DSFilterPillItem(text: $0.filterGroupName) })
            filterPills = pills
        } else {
            filterPills = [
                DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle")),
                DSFilterPillItem(text: "Brand"),
                DSFilterPillItem(text: "Vanity Width"),
                DSFilterPillItem(text: "Sink Type"),
                DSFilterPillItem(text: "Color/Finish")
            ]
        }
        
        print("🎨 Created Bathroom Vanities category from JSON")
        
        return PLPCategory(
            title: categoryData.pageInfo.categoryName.uppercased(),
            breadcrumbFilter: "Bathroom Vanity",
            stylePills: [
                DSStylePillItem(text: "Single Sink\nVanities", image: Image(systemName: "sink.fill")),
                DSStylePillItem(text: "Double Sink\nVanities", image: Image(systemName: "sink.fill")),
                DSStylePillItem(text: "Floating\nVanities", image: Image(systemName: "rectangle.fill")),
                DSStylePillItem(text: "Vanities\nwith Top", image: Image(systemName: "square.stack.fill"))
            ],
            filterPills: filterPills,
            subFilterPills: subFilterPills,
            categoryJSONFilename: "bathroom-vanities"
        )
    }()
    
    // MARK: - Ceiling Fans Category
    static let ceilingFans: PLPCategory = {
        guard let categoryData = CategoryDataLoader.shared.loadCategoryData(filename: "ceiling-fans") else {
            // Fallback to SF Symbols if JSON not found
            return PLPCategory(
                title: "CEILING FANS",
                breadcrumbFilter: "Ceiling Fan",
                stylePills: [
                    DSStylePillItem(text: "Indoor\nCeiling Fans", image: Image(systemName: "fan.fill")),
                    DSStylePillItem(text: "Outdoor\nCeiling Fans", image: Image(systemName: "fan.fill")),
                    DSStylePillItem(text: "Fans with\nLight", image: Image(systemName: "lightbulb.fill")),
                    DSStylePillItem(text: "Smart\nCeiling Fans", image: Image(systemName: "antenna.radiowaves.left.and.right"))
                ],
                filterPills: [
                    DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle")),
                    DSFilterPillItem(text: "Brand"),
                    DSFilterPillItem(text: "Blade Span"),
                    DSFilterPillItem(text: "Light Kit"),
                    DSFilterPillItem(text: "Style")
                ],
                subFilterPills: [
                    DSFilterPillItem(text: "In Stock At Store Today"),
                    DSFilterPillItem(text: "Free 1-2 Day Delivery")
                ]
            )
        }
        
        // Extract quick filters if available
        let subFilterPills: [DSFilterPillItem]
        if !categoryData.quickFilters.isEmpty {
            subFilterPills = categoryData.quickFilters.map { DSFilterPillItem(text: $0.label) }
        } else {
            subFilterPills = [
                DSFilterPillItem(text: "In Stock At Store Today"),
                DSFilterPillItem(text: "Free 1-2 Day Delivery")
            ]
        }
        
        // Extract main filters
        let filterPills: [DSFilterPillItem]
        if !categoryData.filters.isEmpty {
            var pills = [DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle"))]
            pills.append(contentsOf: categoryData.filters.prefix(6).map { DSFilterPillItem(text: $0.filterGroupName) })
            filterPills = pills
        } else {
            filterPills = [
                DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle")),
                DSFilterPillItem(text: "Brand"),
                DSFilterPillItem(text: "Blade Span"),
                DSFilterPillItem(text: "Light Kit"),
                DSFilterPillItem(text: "Style")
            ]
        }
        
        print("🎨 Created Ceiling Fans category from JSON")
        
        return PLPCategory(
            title: categoryData.pageInfo.categoryName.uppercased(),
            breadcrumbFilter: "Ceiling Fan",
            stylePills: [
                DSStylePillItem(text: "Indoor\nCeiling Fans", image: Image(systemName: "fan.fill")),
                DSStylePillItem(text: "Outdoor\nCeiling Fans", image: Image(systemName: "fan.fill")),
                DSStylePillItem(text: "Fans with\nLight", image: Image(systemName: "lightbulb.fill")),
                DSStylePillItem(text: "Smart\nCeiling Fans", image: Image(systemName: "antenna.radiowaves.left.and.right"))
            ],
            filterPills: filterPills,
            subFilterPills: subFilterPills,
            categoryJSONFilename: "ceiling-fans"
        )
    }()
    
    // MARK: - Lawn Mowers Category
    static let lawnMowers: PLPCategory = {
        guard let categoryData = CategoryDataLoader.shared.loadCategoryData(filename: "lawn-mowers") else {
            // Fallback to SF Symbols if JSON not found
            return PLPCategory(
                title: "LAWN MOWERS",
                breadcrumbFilter: "Lawn Mower",
                stylePills: [
                    DSStylePillItem(text: "Push\nMowers", image: Image(systemName: "figure.walk")),
                    DSStylePillItem(text: "Self-Propelled\nMowers", image: Image(systemName: "gear")),
                    DSStylePillItem(text: "Riding\nMowers", image: Image(systemName: "figure.seated.side")),
                    DSStylePillItem(text: "Robotic\nMowers", image: Image(systemName: "robot.fill"))
                ],
                filterPills: [
                    DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle")),
                    DSFilterPillItem(text: "Brand"),
                    DSFilterPillItem(text: "Power Type"),
                    DSFilterPillItem(text: "Cutting Width"),
                    DSFilterPillItem(text: "Drive Type")
                ],
                subFilterPills: [
                    DSFilterPillItem(text: "In Stock At Store Today"),
                    DSFilterPillItem(text: "Free 1-2 Day Delivery")
                ]
            )
        }
        
        // Extract quick filters if available
        let subFilterPills: [DSFilterPillItem]
        if !categoryData.quickFilters.isEmpty {
            subFilterPills = categoryData.quickFilters.map { DSFilterPillItem(text: $0.label) }
        } else {
            subFilterPills = [
                DSFilterPillItem(text: "In Stock At Store Today"),
                DSFilterPillItem(text: "Free 1-2 Day Delivery")
            ]
        }
        
        // Extract main filters
        let filterPills: [DSFilterPillItem]
        if !categoryData.filters.isEmpty {
            var pills = [DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle"))]
            pills.append(contentsOf: categoryData.filters.prefix(6).map { DSFilterPillItem(text: $0.filterGroupName) })
            filterPills = pills
        } else {
            filterPills = [
                DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle")),
                DSFilterPillItem(text: "Brand"),
                DSFilterPillItem(text: "Power Type"),
                DSFilterPillItem(text: "Cutting Width"),
                DSFilterPillItem(text: "Drive Type")
            ]
        }
        
        print("🎨 Created Lawn Mowers category from JSON")
        
        return PLPCategory(
            title: categoryData.pageInfo.categoryName.uppercased(),
            breadcrumbFilter: "Lawn Mower",
            stylePills: [
                DSStylePillItem(text: "Push\nMowers", image: Image(systemName: "figure.walk")),
                DSStylePillItem(text: "Self-Propelled\nMowers", image: Image(systemName: "gear")),
                DSStylePillItem(text: "Riding\nMowers", image: Image(systemName: "figure.seated.side")),
                DSStylePillItem(text: "Robotic\nMowers", image: Image(systemName: "robot.fill"))
            ],
            filterPills: filterPills,
            subFilterPills: subFilterPills,
            categoryJSONFilename: "lawn-mowers"
        )
    }()
    
    // MARK: - Smart Thermostats Category
    static let smartThermostats: PLPCategory = {
        guard let categoryData = CategoryDataLoader.shared.loadCategoryData(filename: "smart-thermostats") else {
            // Fallback to SF Symbols if JSON not found
            return PLPCategory(
                title: "SMART THERMOSTATS",
                breadcrumbFilter: "Smart Thermostat",
                stylePills: [
                    DSStylePillItem(text: "WiFi\nThermostats", image: Image(systemName: "wifi")),
                    DSStylePillItem(text: "Learning\nThermostats", image: Image(systemName: "brain.head.profile")),
                    DSStylePillItem(text: "Programmable\nThermostats", image: Image(systemName: "calendar")),
                    DSStylePillItem(text: "Voice Control\nThermostats", image: Image(systemName: "mic.fill"))
                ],
                filterPills: [
                    DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle")),
                    DSFilterPillItem(text: "Brand"),
                    DSFilterPillItem(text: "System Type"),
                    DSFilterPillItem(text: "Voice Assistant"),
                    DSFilterPillItem(text: "Display Type")
                ],
                subFilterPills: [
                    DSFilterPillItem(text: "In Stock At Store Today"),
                    DSFilterPillItem(text: "Free 1-2 Day Delivery")
                ]
            )
        }
        
        // Extract quick filters if available
        let subFilterPills: [DSFilterPillItem]
        if !categoryData.quickFilters.isEmpty {
            subFilterPills = categoryData.quickFilters.map { DSFilterPillItem(text: $0.label) }
        } else {
            subFilterPills = [
                DSFilterPillItem(text: "In Stock At Store Today"),
                DSFilterPillItem(text: "Free 1-2 Day Delivery")
            ]
        }
        
        // Extract main filters
        let filterPills: [DSFilterPillItem]
        if !categoryData.filters.isEmpty {
            var pills = [DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle"))]
            pills.append(contentsOf: categoryData.filters.prefix(6).map { DSFilterPillItem(text: $0.filterGroupName) })
            filterPills = pills
        } else {
            filterPills = [
                DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle")),
                DSFilterPillItem(text: "Brand"),
                DSFilterPillItem(text: "System Type"),
                DSFilterPillItem(text: "Voice Assistant"),
                DSFilterPillItem(text: "Display Type")
            ]
        }
        
        print("🎨 Created Smart Thermostats category from JSON")
        
        return PLPCategory(
            title: categoryData.pageInfo.categoryName.uppercased(),
            breadcrumbFilter: "Smart Thermostat",
            stylePills: [
                DSStylePillItem(text: "WiFi\nThermostats", image: Image(systemName: "wifi")),
                DSStylePillItem(text: "Learning\nThermostats", image: Image(systemName: "brain.head.profile")),
                DSStylePillItem(text: "Programmable\nThermostats", image: Image(systemName: "calendar")),
                DSStylePillItem(text: "Voice Control\nThermostats", image: Image(systemName: "mic.fill"))
            ],
            filterPills: filterPills,
            subFilterPills: subFilterPills,
            categoryJSONFilename: "smart-thermostats"
        )
    }()
    
    // MARK: - Tool Chests Category
    static let toolChests: PLPCategory = {
        guard let categoryData = CategoryDataLoader.shared.loadCategoryData(filename: "tool-chests") else {
            // Fallback to SF Symbols if JSON not found
            return PLPCategory(
                title: "TOOL CHESTS",
                breadcrumbFilter: "Tool Chest",
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
                ]
            )
        }
        
        // Extract quick filters if available
        let subFilterPills: [DSFilterPillItem]
        if !categoryData.quickFilters.isEmpty {
            subFilterPills = categoryData.quickFilters.map { DSFilterPillItem(text: $0.label) }
        } else {
            subFilterPills = [
                DSFilterPillItem(text: "In Stock At Store Today"),
                DSFilterPillItem(text: "Free 1-2 Day Delivery")
            ]
        }
        
        // Extract main filters
        let filterPills: [DSFilterPillItem]
        if !categoryData.filters.isEmpty {
            var pills = [DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle"))]
            pills.append(contentsOf: categoryData.filters.prefix(6).map { DSFilterPillItem(text: $0.filterGroupName) })
            filterPills = pills
        } else {
            filterPills = [
                DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle")),
                DSFilterPillItem(text: "Brand"),
                DSFilterPillItem(text: "Width"),
                DSFilterPillItem(text: "Number of Drawers"),
                DSFilterPillItem(text: "Material")
            ]
        }
        
        print("🎨 Created Tool Chests category from JSON")
        
        return PLPCategory(
            title: categoryData.pageInfo.categoryName.uppercased(),
            breadcrumbFilter: "Tool Chest",
            stylePills: [
                DSStylePillItem(text: "Rolling\nTool Cabinets", image: Image(systemName: "shippingbox.fill")),
                DSStylePillItem(text: "Top\nChests", image: Image(systemName: "square.stack.fill")),
                DSStylePillItem(text: "Combo\nSets", image: Image(systemName: "square.stack.3d.up.fill")),
                DSStylePillItem(text: "Mobile\nWorkbenches", image: Image(systemName: "wrench.and.screwdriver.fill"))
            ],
            filterPills: filterPills,
            subFilterPills: subFilterPills,
            categoryJSONFilename: "tool-chests"
        )
    }()
    
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

#Preview("PLP - Dishwashers") {
    PLPView(category: .dishwashers)
}

#Preview("PLP - Washing Machines") {
    PLPView(category: .washingMachines)
}

#Preview("PLP - Dryers") {
    PLPView(category: .dryers)
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

#Preview("PLP - Bathroom Vanities") {
    PLPView(category: .bathroomVanities)
}

#Preview("PLP - Ceiling Fans") {
    PLPView(category: .ceilingFans)
}

#Preview("PLP - Lawn Mowers") {
    PLPView(category: .lawnMowers)
}

#Preview("PLP - Smart Thermostats") {
    PLPView(category: .smartThermostats)
}

#Preview("PLP - Tool Chests") {
    PLPView(category: .toolChests)
}

// MARK: - DSProductCard Stub (Temporary)

/// Temporary stub for DSProductCard until the full component is implemented
struct DSProductCard: View {
    let imageURL: URL?
    let showExclusiveBadge: Bool
    let showDeliveryBadge: Bool
    let showSponsoredTag: Bool
    let swatches: [Color]
    let additionalSwatchCount: Int?
    let brand: String?
    let title: String
    let modelNumber: String?
    let priceText: String
    let rating: Double?
    let ratingCount: Int?
    let pickupInfo: String?
    let deliveryInfo: String?
    let buttonVariant: DSPodButtonSetVariant
    let onAddToCart: () -> Void
    let onAddToList: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Image placeholder
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .aspectRatio(1, contentMode: .fit)
                .overlay(
                    Text("Product Image")
                        .foregroundStyle(.secondary)
                )
            
            // Product info
            VStack(alignment: .leading, spacing: 4) {
                if let brand = brand {
                    Text(brand)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                
                Text(title)
                    .font(.subheadline)
                    .lineLimit(2)
                
                Text(priceText)
                    .font(.headline)
                    .foregroundStyle(Color.brandPrimary)
            }
            
            // Buttons
            HStack {
                Button(action: onAddToCart) {
                    Text("Add to Cart")
                        .font(.caption)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.brandPrimary)
                        .foregroundStyle(.white)
                        .cornerRadius(4)
                }
                
                Button(action: onAddToList) {
                    Image(systemName: "heart")
                        .foregroundStyle(Color.brandPrimary)
                }
            }
        }
        .padding(8)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(radius: 2)
    }
}

enum DSPodButtonSetVariant {
    case b2c
    case b2b
}
