//
// DSPipZoneA.swift
//

import SwiftUI

/// Product Information Page (PIP) Zone A component
///
/// DSPipZoneA represents the primary product detail section at the top of a PIP.
/// It includes breadcrumb navigation, product badge, brand and title, rating with Q&A,
/// product image carousel, pricing, store information, pickup/delivery options,
/// delivery messaging, and primary action buttons.
///
/// ## Usage
/// ```swift
/// DSPipZoneA(
///     breadcrumbs: ["Home", "Tools", "Hand Tools", "Hammers"],
///     badge: DSBadge(label: "Top Rated", variant: .filledStrong, color: .brand),
///     brand: "Husky",
///     title: "16 oz. Fiberglass Claw Hammer",
///     rating: 4.5,
///     ratingCount: 394,
///     qaCount: 7,
///     productImages: [Image("hammer1"), Image("hammer2")],
///     currentImageIndex: 0,
///     price: "$14.97",
///     storeInfo: DSPipZoneA.StoreInfo(
///         stockCount: 36,
///         storeName: "Durham Store",
///         aisle: "10",
///         bay: "010"
///     ),
///     pickupOption: DSPipZoneA.FulfillmentOption(
///         eta: "Today",
///         stock: "36 in stock",
///         isFree: true,
///         isSelected: true
///     ),
///     deliveryOption: DSPipZoneA.FulfillmentOption(
///         eta: "Tomorrow",
///         stock: "5 available",
///         isFree: true,
///         isSelected: false
///     ),
///     deliveryMessages: [
///         DSPipZoneA.DeliveryMessage(type: .orderTiming, text: "Order within 6 hrs 49 mins"),
///         DSPipZoneA.DeliveryMessage(type: .warning, text: "This item may be on backorder"),
///         DSPipZoneA.DeliveryMessage(type: .scheduledDelivery, text: "Schedule your delivery in checkout")
///     ],
///     onAddToCart: { },
///     onAddToList: { },
///     onAddToQuote: { },
///     onAddToProject: { },
///     onStoreMapTap: { },
///     onImageChange: { index in }
/// )
/// ```
@available(iOS 15.0, *)
public struct DSPipZoneA: View {
    
    // MARK: - Types
    
    /// Store information for stock display
    public struct StoreInfo {
        public let stockCount: Int
        public let storeName: String
        public let aisle: String
        public let bay: String
        
        public init(stockCount: Int, storeName: String, aisle: String, bay: String) {
            self.stockCount = stockCount
            self.storeName = storeName
            self.aisle = aisle
            self.bay = bay
        }
    }
    
    /// Fulfillment option for pickup or delivery
    public struct FulfillmentOption {
        public let eta: String
        public let stock: String
        public let isFree: Bool
        public let isSelected: Bool
        
        public init(eta: String, stock: String, isFree: Bool, isSelected: Bool) {
            self.eta = eta
            self.stock = stock
            self.isFree = isFree
            self.isSelected = isSelected
        }
    }
    
    /// Delivery message types
    public enum DeliveryMessageType {
        case orderTiming
        case warning
        case scheduledDelivery
        
        var iconName: String {
            switch self {
            case .orderTiming: return "clock"
            case .warning: return "exclamationmark.triangle"
            case .scheduledDelivery: return "shippingbox"
            }
        }
    }
    
    /// Delivery message
    public struct DeliveryMessage {
        public let type: DeliveryMessageType
        public let text: String
        
        public init(type: DeliveryMessageType, text: String) {
            self.type = type
            self.text = text
        }
    }
    
    // MARK: - Properties
    
    private let breadcrumbs: [String]
    private let badge: DSBadge?
    private let brand: String
    private let title: String
    private let rating: Double?
    private let ratingCount: Int?
    private let qaCount: Int?
    private let productImages: [Image]
    private let currentImageIndex: Int
    private let price: String
    private let storeInfo: StoreInfo?
    private let pickupOption: FulfillmentOption?
    private let deliveryOption: FulfillmentOption?
    private let deliveryMessages: [DeliveryMessage]
    
    private let onAddToCart: () -> Void
    private let onAddToList: (() -> Void)?
    private let onAddToQuote: (() -> Void)?
    private let onAddToProject: (() -> Void)?
    private let onStoreMapTap: (() -> Void)?
    private let onImageChange: ((Int) -> Void)?
    
    @Environment(\.colorScheme) private var colorScheme
    
    private var isDark: Bool {
        colorScheme == .dark
    }
    
    // MARK: - Initialization
    
    /// Creates a DSPipZoneA component
    /// - Parameters:
    ///   - breadcrumbs: Breadcrumb navigation items
    ///   - badge: Optional product badge (e.g., "Top Rated")
    ///   - brand: Product brand name
    ///   - title: Product title/description
    ///   - rating: Product rating (0-5)
    ///   - ratingCount: Number of ratings
    ///   - qaCount: Number of Q&A items
    ///   - productImages: Array of product images for carousel
    ///   - currentImageIndex: Currently displayed image index
    ///   - price: Product price string
    ///   - storeInfo: Store stock and location information
    ///   - pickupOption: Pickup fulfillment option
    ///   - deliveryOption: Delivery fulfillment option
    ///   - deliveryMessages: Array of delivery messages
    ///   - onAddToCart: Add to cart action
    ///   - onAddToList: Add to list action (optional)
    ///   - onAddToQuote: Add to quote action (optional)
    ///   - onAddToProject: Add to project action (optional)
    ///   - onStoreMapTap: Store map button action (optional)
    ///   - onImageChange: Image change callback (optional)
    public init(
        breadcrumbs: [String],
        badge: DSBadge? = nil,
        brand: String,
        title: String,
        rating: Double? = nil,
        ratingCount: Int? = nil,
        qaCount: Int? = nil,
        productImages: [Image],
        currentImageIndex: Int = 0,
        price: String,
        storeInfo: StoreInfo? = nil,
        pickupOption: FulfillmentOption? = nil,
        deliveryOption: FulfillmentOption? = nil,
        deliveryMessages: [DeliveryMessage] = [],
        onAddToCart: @escaping () -> Void,
        onAddToList: (() -> Void)? = nil,
        onAddToQuote: (() -> Void)? = nil,
        onAddToProject: (() -> Void)? = nil,
        onStoreMapTap: (() -> Void)? = nil,
        onImageChange: ((Int) -> Void)? = nil
    ) {
        self.breadcrumbs = breadcrumbs
        self.badge = badge
        self.brand = brand
        self.title = title
        self.rating = rating
        self.ratingCount = ratingCount
        self.qaCount = qaCount
        self.productImages = productImages
        self.currentImageIndex = currentImageIndex
        self.price = price
        self.storeInfo = storeInfo
        self.pickupOption = pickupOption
        self.deliveryOption = deliveryOption
        self.deliveryMessages = deliveryMessages
        self.onAddToCart = onAddToCart
        self.onAddToList = onAddToList
        self.onAddToQuote = onAddToQuote
        self.onAddToProject = onAddToProject
        self.onStoreMapTap = onStoreMapTap
        self.onImageChange = onImageChange
    }
    
    // MARK: - Body
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Breadcrumb navigation
            BreadcrumbView(breadcrumbs: breadcrumbs, isDark: isDark)
            
            VStack(alignment: .leading, spacing: 8) {
                // Badge
                if let badge = badge {
                    badge
                }
                
                // Brand
                Text(brand)
                    .font(.system(size: TokensCoreLight.FontSizeBodyXs))
                    .foregroundColor(isDark ? TokensSemanticDark.TextOnSurfaceColorPrimary : TokensSemanticLight.TextOnSurfaceColorPrimary)
                
                // Title
                Text(title)
                    .font(.system(size: TokensCoreLight.FontSizeBodyMd, weight: .bold))
                    .foregroundColor(isDark ? TokensSemanticDark.TextOnSurfaceColorPrimary : TokensSemanticLight.TextOnSurfaceColorPrimary)
                
                // Rating and Q&A
                HStack(spacing: 16) {
                    if let rating = rating, let ratingCount = ratingCount {
                        RatingView(rating: rating, count: ratingCount, isDark: isDark)
                    }
                    
                    if let qaCount = qaCount {
                        QAView(count: qaCount, isDark: isDark)
                    }
                }
            }
            
            // Product Image Carousel
            ProductImageCarousel(
                images: productImages,
                currentIndex: currentImageIndex,
                isDark: isDark
            )
            
            // Price
            Text(price)
                .font(.system(size: 24, weight: .bold))
                .foregroundColor(isDark ? TokensSemanticDark.TextOnSurfaceColorPrimary : TokensSemanticLight.TextOnSurfaceColorPrimary)
            
            // Store Info
            if let storeInfo = storeInfo {
                StoreInfoView(
                    storeInfo: storeInfo,
                    isDark: isDark,
                    onStoreMapTap: onStoreMapTap
                )
            }
            
            // Pickup/Delivery Options
            if pickupOption != nil || deliveryOption != nil {
                HStack(spacing: 8) {
                    if let pickup = pickupOption {
                        FulfillmentTile(
                            title: "Pickup",
                            option: pickup,
                            isDark: isDark
                        )
                    }
                    
                    if let delivery = deliveryOption {
                        FulfillmentTile(
                            title: "Delivery",
                            option: delivery,
                            isDark: isDark
                        )
                    }
                }
            }
            
            // Delivery Messages
            if !deliveryMessages.isEmpty {
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(deliveryMessages.indices, id: \.self) { index in
                        DeliveryMessageView(
                            message: deliveryMessages[index],
                            isDark: isDark
                        )
                    }
                }
            }
            
            // Action Buttons
            VStack(spacing: 8) {
                DSButton(
                    "Add to Cart",
                    style: .orangeFilled,
                    size: .large,
                    action: onAddToCart
                )
                
                HStack(spacing: 8) {
                    if let onAddToList = onAddToList {
                        DSButton(
                            "Add to List",
                            style: .outlined,
                            size: .medium,
                            action: onAddToList
                        )
                    }
                    
                    if let onAddToQuote = onAddToQuote {
                        DSButton(
                            "Add to Quote",
                            style: .outlined,
                            size: .medium,
                            action: onAddToQuote
                        )
                    }
                    
                    if let onAddToProject = onAddToProject {
                        DSButton(
                            "Add to Project",
                            style: .outlined,
                            size: .medium,
                            action: onAddToProject
                        )
                    }
                }
            }
        }
        .padding(16)
    }
}

// MARK: - BreadcrumbView

private struct BreadcrumbView: View {
    let breadcrumbs: [String]
    let isDark: Bool
    
    var body: some View {
        HStack(spacing: 4) {
            ForEach(breadcrumbs.indices, id: \.self) { index in
                Text(breadcrumbs[index])
                    .font(.system(size: TokensCoreLight.FontSizeBodyXs))
                    .foregroundColor(isDark ? TokensSemanticDark.TextOnSurfaceColorPrimary : TokensSemanticLight.TextOnSurfaceColorPrimary)
                    .underline()
                
                if index < breadcrumbs.count - 1 {
                    Text(">")
                        .font(.system(size: TokensCoreLight.FontSizeBodyXs))
                        .foregroundColor(isDark ? TokensSemanticDark.TextOnSurfaceColorTertiary : TokensSemanticLight.TextOnSurfaceColorTertiary)
                }
            }
        }
    }
}

// MARK: - RatingView

private struct RatingView: View {
    let rating: Double
    let count: Int
    let isDark: Bool
    
    var body: some View {
        HStack(spacing: 4) {
            // Stars
            HStack(spacing: 1) {
                ForEach(0..<5) { index in
                    StarView(
                        filled: rating >= Double(index + 1),
                        half: rating > Double(index) && rating < Double(index + 1),
                        isDark: isDark
                    )
                }
            }
            
            // Rating count
            Text("(\(count))")
                .font(.system(size: TokensCoreLight.FontSizeBodyXs))
                .foregroundColor(isDark ? TokensSemanticDark.TextOnSurfaceColorPrimary : TokensSemanticLight.TextOnSurfaceColorPrimary)
        }
    }
}

// MARK: - StarView

private struct StarView: View {
    let filled: Bool
    let half: Bool
    let isDark: Bool
    
    // Note: Using orange color approximation - ideally would use IconOnSurfaceColorRating token
    private var fillColor: Color {
        Color(red: 0.976, green: 0.388, blue: 0.008) // Orange from Figma
    }
    
    private var emptyColor: Color {
        isDark ? TokensSemanticDark.TextOnSurfaceColorTertiary : TokensSemanticLight.TextOnSurfaceColorTertiary
    }
    
    var body: some View {
        ZStack {
            if half {
                HStack(spacing: 0) {
                    Image(systemName: "star.fill")
                        .resizable()
                        .frame(width: 8, height: 16)
                        .foregroundColor(fillColor)
                        .mask(
                            Rectangle()
                                .frame(width: 8, height: 16)
                        )
                    
                    Image(systemName: "star")
                        .resizable()
                        .frame(width: 8, height: 16)
                        .foregroundColor(emptyColor)
                        .mask(
                            Rectangle()
                                .frame(width: 8, height: 16)
                        )
                }
                .frame(width: 16, height: 16)
            } else {
                Image(systemName: filled ? "star.fill" : "star")
                    .resizable()
                    .frame(width: 16, height: 16)
                    .foregroundColor(filled ? fillColor : emptyColor)
            }
        }
    }
}

// MARK: - QAView

private struct QAView: View {
    let count: Int
    let isDark: Bool
    
    var body: some View {
        HStack(spacing: 4) {
            Text("Questions & Answers")
                .font(.system(size: TokensCoreLight.FontSizeBodyXs))
                .foregroundColor(isDark ? TokensSemanticDark.TextOnSurfaceColorPrimary : TokensSemanticLight.TextOnSurfaceColorPrimary)
                .underline()
            
            Text("(\(count))")
                .font(.system(size: TokensCoreLight.FontSizeBodyXs))
                .foregroundColor(isDark ? TokensSemanticDark.TextOnSurfaceColorPrimary : TokensSemanticLight.TextOnSurfaceColorPrimary)
        }
    }
}

// MARK: - ProductImageCarousel

private struct ProductImageCarousel: View {
    let images: [Image]
    let currentIndex: Int
    let isDark: Bool
    
    var body: some View {
        VStack(spacing: 8) {
            // Image
            if images.indices.contains(currentIndex) {
                images[currentIndex]
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 300)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(isDark ? TokensSemanticDark.BackgroundSurfaceColorGreige : TokensSemanticLight.BackgroundSurfaceColorGreige)
                    )
                    .cornerRadius(8)
            }
            
            // Page Control
            if images.count > 1 {
                PageControlView(
                    pageCount: images.count,
                    currentPage: currentIndex,
                    isDark: isDark
                )
            }
        }
    }
}

// MARK: - PageControlView

private struct PageControlView: View {
    let pageCount: Int
    let currentPage: Int
    let isDark: Bool
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<pageCount, id: \.self) { index in
                Circle()
                    .fill(
                        index == currentPage
                            ? (isDark ? TokensSemanticDark.TextOnSurfaceColorPrimary : TokensSemanticLight.TextOnSurfaceColorPrimary)
                            : (isDark ? TokensSemanticDark.TextOnSurfaceColorTertiary : TokensSemanticLight.TextOnSurfaceColorTertiary)
                    )
                    .frame(width: 8, height: 8)
            }
        }
    }
}

// MARK: - StoreInfoView

private struct StoreInfoView: View {
    let storeInfo: DSPipZoneA.StoreInfo
    let isDark: Bool
    let onStoreMapTap: (() -> Void)?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("\(storeInfo.stockCount) in stock at \(storeInfo.storeName), Aisle \(storeInfo.aisle), Bay \(storeInfo.bay)")
                .font(.system(size: TokensCoreLight.FontSizeBodySm))
                .foregroundColor(isDark ? TokensSemanticDark.TextOnSurfaceColorPrimary : TokensSemanticLight.TextOnSurfaceColorPrimary)
            
            if let onStoreMapTap = onStoreMapTap {
                Button(action: onStoreMapTap) {
                    HStack {
                        Image(systemName: "map")
                            .resizable()
                            .frame(width: 16, height: 16)
                        Text("Store Map")
                            .font(.system(size: TokensCoreLight.FontSizeBodySm, weight: .bold))
                    }
                    .foregroundColor(Color(red: 0.976, green: 0.388, blue: 0.008)) // Orange
                    .padding(.vertical, 8)
                    .padding(.horizontal, 12)
                    .background(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color(red: 0.976, green: 0.388, blue: 0.008), lineWidth: 1)
                    )
                }
            }
        }
    }
}

// MARK: - FulfillmentTile

private struct FulfillmentTile: View {
    let title: String
    let option: DSPipZoneA.FulfillmentOption
    let isDark: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.system(size: TokensCoreLight.FontSizeBodySm, weight: .bold))
                .foregroundColor(isDark ? TokensSemanticDark.TextOnSurfaceColorPrimary : TokensSemanticLight.TextOnSurfaceColorPrimary)
            
            Text(option.eta)
                .font(.system(size: TokensCoreLight.FontSizeBodySm))
                .foregroundColor(isDark ? TokensSemanticDark.TextOnSurfaceColorPrimary : TokensSemanticLight.TextOnSurfaceColorPrimary)
            
            Text(option.stock)
                .font(.system(size: TokensCoreLight.FontSizeBodyXs))
                .foregroundColor(isDark ? TokensSemanticDark.TextOnSurfaceColorTertiary : TokensSemanticLight.TextOnSurfaceColorTertiary)
            
            Text(option.isFree ? "FREE" : "")
                .font(.system(size: TokensCoreLight.FontSizeBodyXs, weight: .bold))
                .foregroundColor(Color(red: 0.0, green: 0.6, blue: 0.0)) // Success green
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .stroke(
                    option.isSelected
                        ? Color(red: 0.976, green: 0.388, blue: 0.008) // Orange border when selected
                        : (isDark ? TokensSemanticDark.Greige400 : TokensSemanticLight.Greige400),
                    lineWidth: option.isSelected ? 2 : 1
                )
        )
    }
}

// MARK: - DeliveryMessageView

private struct DeliveryMessageView: View {
    let message: DSPipZoneA.DeliveryMessage
    let isDark: Bool
    
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: message.type.iconName)
                .resizable()
                .frame(width: 14, height: 14)
                .foregroundColor(
                    message.type == .warning
                        ? Color(red: 0.9, green: 0.6, blue: 0.0) // Warning yellow
                        : (isDark ? TokensSemanticDark.TextOnSurfaceColorPrimary : TokensSemanticLight.TextOnSurfaceColorPrimary)
                )
            
            Text(message.text)
                .font(.system(size: TokensCoreLight.FontSizeBodyXs))
                .foregroundColor(isDark ? TokensSemanticDark.TextOnSurfaceColorPrimary : TokensSemanticLight.TextOnSurfaceColorPrimary)
        }
    }
}

// MARK: - Sample Extension

@available(iOS 15.0, *)
extension DSPipZoneA {
    /// Sample component for testing and previews
    public static func sample(
        breadcrumbs: [String] = ["Home", "Tools", "Hand Tools", "Hammers"],
        badge: DSBadge? = DSBadge(label: "Top Rated", size: .base, variant: .filledStrong, color: .brand),
        brand: String = "Husky",
        title: String = "16 oz. Fiberglass Claw Hammer",
        rating: Double? = 4.5,
        ratingCount: Int? = 394,
        qaCount: Int? = 7,
        productImages: [Image] = [Image(systemName: "hammer.fill")],
        currentImageIndex: Int = 0,
        price: String = "$14.97",
        storeInfo: StoreInfo? = StoreInfo(stockCount: 36, storeName: "Durham Store", aisle: "10", bay: "010"),
        pickupOption: FulfillmentOption? = FulfillmentOption(eta: "Today", stock: "36 in stock", isFree: true, isSelected: true),
        deliveryOption: FulfillmentOption? = FulfillmentOption(eta: "Tomorrow", stock: "5 available", isFree: true, isSelected: false),
        deliveryMessages: [DeliveryMessage] = [
            DeliveryMessage(type: .orderTiming, text: "Order within 6 hrs 49 mins"),
            DeliveryMessage(type: .warning, text: "This item may be on backorder"),
            DeliveryMessage(type: .scheduledDelivery, text: "Schedule your delivery in checkout")
        ],
        onAddToCart: @escaping () -> Void = {},
        onAddToList: (() -> Void)? = {},
        onAddToQuote: (() -> Void)? = {},
        onAddToProject: (() -> Void)? = {},
        onStoreMapTap: (() -> Void)? = {},
        onImageChange: ((Int) -> Void)? = nil
    ) -> DSPipZoneA {
        DSPipZoneA(
            breadcrumbs: breadcrumbs,
            badge: badge,
            brand: brand,
            title: title,
            rating: rating,
            ratingCount: ratingCount,
            qaCount: qaCount,
            productImages: productImages,
            currentImageIndex: currentImageIndex,
            price: price,
            storeInfo: storeInfo,
            pickupOption: pickupOption,
            deliveryOption: deliveryOption,
            deliveryMessages: deliveryMessages,
            onAddToCart: onAddToCart,
            onAddToList: onAddToList,
            onAddToQuote: onAddToQuote,
            onAddToProject: onAddToProject,
            onStoreMapTap: onStoreMapTap,
            onImageChange: onImageChange
        )
    }
}
