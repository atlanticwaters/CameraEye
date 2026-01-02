import SwiftUI

// MARK: - DSPIPProductInfo

/// Product information for the PIP Zone A component.
public struct DSPIPProductInfo: Equatable, Sendable {
    public let brand: String
    public let productName: String
    public let modelNumber: String?
    public let skuNumber: String?
    public let badge: DSPIPBadge?

    public init(
        brand: String,
        productName: String,
        modelNumber: String? = nil,
        skuNumber: String? = nil,
        badge: DSPIPBadge? = nil
    ) {
        self.brand = brand
        self.productName = productName
        self.modelNumber = modelNumber
        self.skuNumber = skuNumber
        self.badge = badge
    }
}

// MARK: - DSPIPBadge

/// Badge types for product display.
public struct DSPIPBadge: Equatable, Sendable {
    public let text: String
    public let type: BadgeType

    public enum BadgeType: Sendable {
        case specialSavings
        case newArrival
        case bestSeller
        case topRated
        case custom
    }

    public init(text: String, type: BadgeType = .custom) {
        self.text = text
        self.type = type
    }

    public static func specialSavings() -> DSPIPBadge {
        DSPIPBadge(text: "Special Savings", type: .specialSavings)
    }

    public static func newArrival() -> DSPIPBadge {
        DSPIPBadge(text: "New Arrival", type: .newArrival)
    }

    public static func bestSeller() -> DSPIPBadge {
        DSPIPBadge(text: "Best Seller", type: .bestSeller)
    }

    public static func topRated() -> DSPIPBadge {
        DSPIPBadge(text: "Top Rated", type: .topRated)
    }
}

// MARK: - DSPIPRatingInfo

/// Rating information for the product.
public struct DSPIPRatingInfo: Equatable, Sendable {
    public let rating: Double
    public let reviewCount: Int
    public let questionCount: Int

    public init(rating: Double, reviewCount: Int, questionCount: Int = 0) {
        self.rating = rating
        self.reviewCount = reviewCount
        self.questionCount = questionCount
    }
}

// MARK: - DSPIPPricingInfo

/// Pricing information for the product.
public struct DSPIPPricingInfo: Equatable, Sendable {
    public let currentPrice: Double
    public let originalPrice: Double?
    public let unitPrice: String?
    public let savingsText: String?
    public let pricingBadge: String?
    public let isStartingAt: Bool
    public let perUnit: String?

    public init(
        currentPrice: Double,
        originalPrice: Double? = nil,
        unitPrice: String? = nil,
        savingsText: String? = nil,
        pricingBadge: String? = nil,
        isStartingAt: Bool = false,
        perUnit: String? = nil
    ) {
        self.currentPrice = currentPrice
        self.originalPrice = originalPrice
        self.unitPrice = unitPrice
        self.savingsText = savingsText
        self.pricingBadge = pricingBadge
        self.isStartingAt = isStartingAt
        self.perUnit = perUnit
    }
}

// MARK: - DSPIPStoreInfo

/// Store and stock information.
public struct DSPIPStoreInfo: Equatable, Sendable {
    public let stockStatus: StockStatus
    public let aisleLocation: String?
    public let storeName: String?

    public enum StockStatus: Equatable, Sendable {
        case inStock(quantity: Int?)
        case limitedStock
        case outOfStock
        case checkNearbyStores

        public var displayText: String {
            switch self {
            case .inStock(let quantity):
                if let qty = quantity {
                    return "\(qty) in stock"
                }
                return "In Stock"
            case .limitedStock:
                return "Limited Stock"
            case .outOfStock:
                return "Out of Stock"
            case .checkNearbyStores:
                return "Check Nearby Stores"
            }
        }

        public var color: Color {
            switch self {
            case .inStock:
                return DSPIPZoneAColorHelper.stockInStockColor()
            case .limitedStock:
                return DSPIPZoneAColorHelper.stockLimitedColor()
            case .outOfStock, .checkNearbyStores:
                return DSPIPZoneAColorHelper.stockOutOfStockColor()
            }
        }
    }

    public init(
        stockStatus: StockStatus,
        aisleLocation: String? = nil,
        storeName: String? = nil
    ) {
        self.stockStatus = stockStatus
        self.aisleLocation = aisleLocation
        self.storeName = storeName
    }
}

// MARK: - DSPIPFulfillmentInfo

/// Pickup and delivery fulfillment information.
public struct DSPIPFulfillmentInfo: Equatable, Sendable {
    public let pickupAvailable: Bool
    public let pickupDate: String?
    public let pickupLocation: String?
    public let deliveryAvailable: Bool
    public let deliveryDate: String?
    public let deliveryLocation: String?

    public init(
        pickupAvailable: Bool = true,
        pickupDate: String? = nil,
        pickupLocation: String? = nil,
        deliveryAvailable: Bool = true,
        deliveryDate: String? = nil,
        deliveryLocation: String? = nil
    ) {
        self.pickupAvailable = pickupAvailable
        self.pickupDate = pickupDate
        self.pickupLocation = pickupLocation
        self.deliveryAvailable = deliveryAvailable
        self.deliveryDate = deliveryDate
        self.deliveryLocation = deliveryLocation
    }
}

// MARK: - DSPIPZoneA

/// The main product information page Zone A component.
///
/// DSPIPZoneA displays the primary product information including images, pricing,
/// ratings, stock status, and fulfillment options. It combines multiple design
/// system components into a cohesive product display.
///
/// Example usage:
/// ```swift
/// DSPIPZoneA(
///     breadcrumbs: ["Tools", "Power Tools", "Drills"],
///     productInfo: DSPIPProductInfo(
///         brand: "DEWALT",
///         productName: "20V MAX Cordless Drill/Driver Kit"
///     ),
///     images: productImages,
///     ratingInfo: DSPIPRatingInfo(rating: 4.5, reviewCount: 1234),
///     pricingInfo: DSPIPPricingInfo(currentPrice: 149.00),
///     storeInfo: DSPIPStoreInfo(stockStatus: .inStock(quantity: 12)),
///     fulfillmentInfo: DSPIPFulfillmentInfo()
/// )
/// ```
public struct DSPIPZoneA: View {
    // MARK: - Properties

    private let breadcrumbs: [String]
    private let productInfo: DSPIPProductInfo
    private let images: [DSGalleryImage]
    private let ratingInfo: DSPIPRatingInfo?
    private let pricingInfo: DSPIPPricingInfo
    private let storeInfo: DSPIPStoreInfo?
    private let fulfillmentInfo: DSPIPFulfillmentInfo?
    private let onAddToCart: (() -> Void)?
    private let onBuyNow: (() -> Void)?
    private let onFavorite: (() -> Void)?
    private let onShare: (() -> Void)?
    private let onRatingsTap: (() -> Void)?
    private let onQuestionsTap: (() -> Void)?
    private let onBreadcrumbTap: ((Int) -> Void)?
    private let onPickupTap: (() -> Void)?
    private let onDeliveryTap: (() -> Void)?
    private let onStoreMapTap: (() -> Void)?

    @State private var selectedImageIndex: Int = 0

    // MARK: - Initializers

    public init(
        breadcrumbs: [String] = [],
        productInfo: DSPIPProductInfo,
        images: [DSGalleryImage] = [],
        ratingInfo: DSPIPRatingInfo? = nil,
        pricingInfo: DSPIPPricingInfo,
        storeInfo: DSPIPStoreInfo? = nil,
        fulfillmentInfo: DSPIPFulfillmentInfo? = nil,
        onAddToCart: (() -> Void)? = nil,
        onBuyNow: (() -> Void)? = nil,
        onFavorite: (() -> Void)? = nil,
        onShare: (() -> Void)? = nil,
        onRatingsTap: (() -> Void)? = nil,
        onQuestionsTap: (() -> Void)? = nil,
        onBreadcrumbTap: ((Int) -> Void)? = nil,
        onPickupTap: (() -> Void)? = nil,
        onDeliveryTap: (() -> Void)? = nil,
        onStoreMapTap: (() -> Void)? = nil
    ) {
        self.breadcrumbs = breadcrumbs
        self.productInfo = productInfo
        self.images = images
        self.ratingInfo = ratingInfo
        self.pricingInfo = pricingInfo
        self.storeInfo = storeInfo
        self.fulfillmentInfo = fulfillmentInfo
        self.onAddToCart = onAddToCart
        self.onBuyNow = onBuyNow
        self.onFavorite = onFavorite
        self.onShare = onShare
        self.onRatingsTap = onRatingsTap
        self.onQuestionsTap = onQuestionsTap
        self.onBreadcrumbTap = onBreadcrumbTap
        self.onPickupTap = onPickupTap
        self.onDeliveryTap = onDeliveryTap
        self.onStoreMapTap = onStoreMapTap
    }

    // MARK: - Body

    public var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                // Breadcrumbs
                if !breadcrumbs.isEmpty {
                    breadcrumbsView
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                }

                // Product Images
                imageSection

                // Product Info Section
                productInfoSection
                    .padding(.horizontal, 16)
                    .padding(.top, 16)

                // Rating & Q&A
                if ratingInfo != nil {
                    ratingSection
                        .padding(.horizontal, 16)
                        .padding(.top, 12)
                }

                // Pricing Section
                pricingSection
                    .padding(.horizontal, 16)
                    .padding(.top, 16)

                // Store Info Section
                if storeInfo != nil {
                    storeInfoSection
                        .padding(.horizontal, 16)
                        .padding(.top, 16)
                }

                // Fulfillment Section
                if fulfillmentInfo != nil {
                    fulfillmentSection
                        .padding(.horizontal, 16)
                        .padding(.top, 16)
                }

                // Action Buttons
                actionButtonsSection
                    .padding(.horizontal, 16)
                    .padding(.top, 20)
                    .padding(.bottom, 24)
            }
        }
        .background(DSPIPZoneAColorHelper.backgroundColor())
    }

    // MARK: - Breadcrumbs

    @ViewBuilder
    private var breadcrumbsView: some View {
        HStack(spacing: 4) {
            ForEach(Array(breadcrumbs.enumerated()), id: \.offset) { index, crumb in
                if index > 0 {
                    Image(systemName: "chevron.right")
                        .font(.system(size: 10))
                        .foregroundStyle(DSPIPZoneAColorHelper.breadcrumbSeparatorColor())
                }

                Button(action: { onBreadcrumbTap?(index) }) {
                    Text(crumb)
                        .font(.system(size: 12))
                        .foregroundStyle(
                            index == breadcrumbs.count - 1
                                ? DSPIPZoneAColorHelper.breadcrumbActiveColor()
                                : DSPIPZoneAColorHelper.breadcrumbColor()
                        )
                }
                .buttonStyle(.plain)
            }
        }
    }

    // MARK: - Image Section

    @ViewBuilder
    private var imageSection: some View {
        if images.isEmpty {
            DSImageContainer(size: .xxLarge)
                .frame(maxWidth: .infinity)
                .frame(height: 300)
        } else {
            TabView(selection: $selectedImageIndex) {
                ForEach(0..<images.count, id: \.self) { index in
                    imageView(for: images[index])
                        .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .automatic))
            .frame(height: 300)
        }
    }

    @ViewBuilder
    private func imageView(for image: DSGalleryImage) -> some View {
        if let img = image.image {
            // Local SwiftUI Image
            img
                .resizable()
                .aspectRatio(contentMode: .fit)
        } else if let url = image.url {
            // URL-based image (from OrangeCatalog API)
            AsyncImage(url: url) { phase in
                switch phase {
                case .success(let loadedImage):
                    loadedImage
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                case .failure:
                    DSImageContainer(size: .xxLarge)
                        .frame(maxWidth: .infinity)
                        .overlay(
                            Image(systemName: "photo")
                                .font(.system(size: 40))
                                .foregroundStyle(.secondary)
                        )
                case .empty:
                    ProgressView()
                        .frame(maxWidth: .infinity)
                @unknown default:
                    DSImageContainer(size: .xxLarge)
                        .frame(maxWidth: .infinity)
                }
            }
        } else {
            // No image available
            DSImageContainer(size: .xxLarge)
                .frame(maxWidth: .infinity)
        }
    }

    // MARK: - Product Info Section

    @ViewBuilder
    private var productInfoSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Badge
            if let badge = productInfo.badge {
                badgeView(badge)
            }

            // Brand
            Text(productInfo.brand)
                .font(.system(size: 14, weight: .medium))
                .foregroundStyle(DSPIPZoneAColorHelper.brandColor())

            // Product Name
            Text(productInfo.productName)
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(DSPIPZoneAColorHelper.productNameColor())
                .lineLimit(3)

            // Model/SKU
            if let modelNumber = productInfo.modelNumber {
                Text("Model# \(modelNumber)")
                    .font(.system(size: 12))
                    .foregroundStyle(DSPIPZoneAColorHelper.modelNumberColor())
            }
        }
    }

    @ViewBuilder
    private func badgeView(_ badge: DSPIPBadge) -> some View {
        DSBadge(
            badge.text,
            size: .small,
            variant: .filledStrong,
            color: mapBadgeTypeToColor(badge.type),
            leadingIcon: Image(systemName: badgeIcon(for: badge.type))
        )
    }

    private func badgeIcon(for type: DSPIPBadge.BadgeType) -> String {
        switch type {
        case .specialSavings: "tag.fill"
        case .newArrival: "sparkles"
        case .bestSeller: "flame.fill"
        case .topRated: "star.fill"
        case .custom: "tag.fill"
        }
    }

    private func mapBadgeTypeToColor(_ type: DSPIPBadge.BadgeType) -> DSBadgeColor {
        switch type {
        case .specialSavings: .warning
        case .newArrival: .info
        case .bestSeller: .brand
        case .topRated: .success
        case .custom: .medium
        }
    }

    // MARK: - Rating Section

    @ViewBuilder
    private var ratingSection: some View {
        if let rating = ratingInfo {
            HStack(spacing: 16) {
                // Rating Meter
                Button(action: { onRatingsTap?() }) {
                    DSRatingMeter(
                        rating: rating.rating,
                        reviewCount: rating.reviewCount,
                        size: .medium
                    )
                }
                .buttonStyle(.plain)

                // Q&A Link
                if rating.questionCount > 0 {
                    Button(action: { onQuestionsTap?() }) {
                        Text("\(rating.questionCount) Questions")
                            .font(.system(size: 14))
                            .foregroundStyle(DSPIPZoneAColorHelper.linkColor())
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }

    // MARK: - Pricing Section

    @ViewBuilder
    private var pricingSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Starting at prefix
            if pricingInfo.isStartingAt {
                Text("Starting at")
                    .font(.system(size: 12))
                    .foregroundStyle(DSPIPZoneAColorHelper.pricingLabelColor())
            }

            // Main Price
            HStack(alignment: .firstTextBaseline, spacing: 2) {
                Text("$")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(DSPIPZoneAColorHelper.priceColor())

                Text(priceWholePart)
                    .font(.system(size: 32, weight: .bold))
                    .foregroundStyle(DSPIPZoneAColorHelper.priceColor())

                Text(priceDecimalPart)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundStyle(DSPIPZoneAColorHelper.priceColor())

                if let perUnit = pricingInfo.perUnit {
                    Text("/\(perUnit)")
                        .font(.system(size: 14))
                        .foregroundStyle(DSPIPZoneAColorHelper.pricingLabelColor())
                }
            }

            // Original Price (strikethrough)
            if let originalPrice = pricingInfo.originalPrice {
                HStack(spacing: 8) {
                    Text("Was $\(String(format: "%.2f", originalPrice))")
                        .font(.system(size: 14))
                        .strikethrough()
                        .foregroundStyle(DSPIPZoneAColorHelper.originalPriceColor())

                    if let savings = pricingInfo.savingsText {
                        Text(savings)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundStyle(DSPIPZoneAColorHelper.savingsColor())
                    }
                }
            }

            // Unit Price
            if let unitPrice = pricingInfo.unitPrice {
                Text(unitPrice)
                    .font(.system(size: 12))
                    .foregroundStyle(DSPIPZoneAColorHelper.unitPriceColor())
            }

            // Pricing Badge
            if let pricingBadge = pricingInfo.pricingBadge {
                HStack(spacing: 4) {
                    Image(systemName: "star.fill")
                        .font(.system(size: 12))

                    Text(pricingBadge)
                        .font(.system(size: 12, weight: .medium))
                }
                .foregroundStyle(DSPIPZoneAColorHelper.pricingBadgeColor())
            }
        }
    }

    private var priceWholePart: String {
        let whole = Int(pricingInfo.currentPrice)
        return "\(whole)"
    }

    private var priceDecimalPart: String {
        let decimal = Int((pricingInfo.currentPrice.truncatingRemainder(dividingBy: 1)) * 100)
        return String(format: "%02d", decimal)
    }

    // MARK: - Store Info Section

    @ViewBuilder
    private var storeInfoSection: some View {
        if let store = storeInfo {
            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    // Stock Status
                    HStack(spacing: 4) {
                        Circle()
                            .fill(store.stockStatus.color)
                            .frame(width: 8, height: 8)

                        Text(store.stockStatus.displayText)
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundStyle(store.stockStatus.color)
                    }

                    Spacer()

                    // Store Map Button
                    if store.aisleLocation != nil {
                        Button(action: { onStoreMapTap?() }) {
                            HStack(spacing: 4) {
                                Image(systemName: "map")
                                    .font(.system(size: 14))

                                Text("Store Map")
                                    .font(.system(size: 14))
                            }
                            .foregroundStyle(DSPIPZoneAColorHelper.linkColor())
                        }
                        .buttonStyle(.plain)
                    }
                }

                // Aisle Location
                if let aisle = store.aisleLocation {
                    Text(aisle)
                        .font(.system(size: 14))
                        .foregroundStyle(DSPIPZoneAColorHelper.aisleColor())
                }
            }
            .padding(12)
            .background(DSPIPZoneAColorHelper.storeInfoBackgroundColor())
            .cornerRadius(8)
        }
    }

    // MARK: - Fulfillment Section

    @ViewBuilder
    private var fulfillmentSection: some View {
        if let fulfillment = fulfillmentInfo {
            VStack(spacing: 12) {
                HStack(spacing: 12) {
                    // Pickup Tile
                    fulfillmentTile(
                        icon: "bag",
                        title: "Pickup",
                        subtitle: fulfillment.pickupDate ?? "Check availability",
                        location: fulfillment.pickupLocation,
                        isAvailable: fulfillment.pickupAvailable,
                        action: onPickupTap
                    )

                    // Delivery Tile
                    fulfillmentTile(
                        icon: "shippingbox",
                        title: "Delivery",
                        subtitle: fulfillment.deliveryDate ?? "Check availability",
                        location: fulfillment.deliveryLocation,
                        isAvailable: fulfillment.deliveryAvailable,
                        action: onDeliveryTap
                    )
                }
            }
        }
    }

    @ViewBuilder
    private func fulfillmentTile(
        icon: String,
        title: String,
        subtitle: String,
        location: String?,
        isAvailable: Bool,
        action: (() -> Void)?
    ) -> some View {
        Button(action: { action?() }) {
            VStack(alignment: .leading, spacing: 8) {
                HStack(spacing: 8) {
                    Image(systemName: icon)
                        .font(.system(size: 20))
                        .foregroundStyle(
                            isAvailable
                                ? DSPIPZoneAColorHelper.fulfillmentIconColor()
                                : DSPIPZoneAColorHelper.fulfillmentDisabledColor()
                        )

                    Text(title)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundStyle(DSPIPZoneAColorHelper.fulfillmentTitleColor())
                }

                Text(subtitle)
                    .font(.system(size: 12))
                    .foregroundStyle(
                        isAvailable
                            ? DSPIPZoneAColorHelper.fulfillmentSubtitleColor()
                            : DSPIPZoneAColorHelper.fulfillmentDisabledColor()
                    )

                if let loc = location {
                    Text(loc)
                        .font(.system(size: 11))
                        .foregroundStyle(DSPIPZoneAColorHelper.fulfillmentLocationColor())
                        .lineLimit(1)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(12)
            .background(DSPIPZoneAColorHelper.fulfillmentTileBackgroundColor())
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(DSPIPZoneAColorHelper.fulfillmentTileBorderColor(), lineWidth: 1)
            )
        }
        .buttonStyle(.plain)
    }

    // MARK: - Action Buttons Section

    @ViewBuilder
    private var actionButtonsSection: some View {
        VStack(spacing: 12) {
            // Primary Button - Add to Cart
            DSButton(
                "Add to Cart",
                style: .orangeFilled,
                size: .large,
                leadingIcon: Image(systemName: "cart.badge.plus")
            ) {
                onAddToCart?()
            }

            // Secondary Actions
            HStack(spacing: 12) {
                // Buy Now
                DSButton(
                    "Buy Now",
                    style: .outlined,
                    size: .medium
                ) {
                    onBuyNow?()
                }
                .frame(maxWidth: .infinity)

                // Favorite
                DSIconButton(
                    systemName: "heart",
                    style: .outlined,
                    size: .medium,
                    accessibilityLabel: "Add to favorites"
                ) {
                    onFavorite?()
                }

                // Share
                DSIconButton(
                    systemName: "square.and.arrow.up",
                    style: .outlined,
                    size: .medium,
                    accessibilityLabel: "Share product"
                ) {
                    onShare?()
                }
            }
        }
    }
}

// MARK: - Preview

#Preview {
    DSPIPZoneA(
        breadcrumbs: ["Tools", "Power Tools", "Drills"],
        productInfo: DSPIPProductInfo(
            brand: "DEWALT",
            productName: "20V MAX Cordless Drill/Driver Kit with Battery",
            modelNumber: "DCD771C2",
            badge: .bestSeller()
        ),
        ratingInfo: DSPIPRatingInfo(rating: 4.5, reviewCount: 1234, questionCount: 56),
        pricingInfo: DSPIPPricingInfo(
            currentPrice: 149.00,
            originalPrice: 179.00,
            savingsText: "Save $30",
            pricingBadge: "Pro Xtra Member Price"
        ),
        storeInfo: DSPIPStoreInfo(
            stockStatus: .inStock(quantity: 12),
            aisleLocation: "Aisle 10, Bay 003"
        ),
        fulfillmentInfo: DSPIPFulfillmentInfo(
            pickupDate: "Today",
            pickupLocation: "Midtown Atlanta",
            deliveryDate: "Tomorrow",
            deliveryLocation: "30308"
        )
    )
}
