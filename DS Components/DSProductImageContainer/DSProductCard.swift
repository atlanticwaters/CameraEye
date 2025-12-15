import SwiftUI

// MARK: - DSProductCard

/// A comprehensive product card component combining image, details, and actions.
///
/// DSProductCard is a reusable component that displays a complete product listing
/// with image container, product details, and action buttons. It combines:
/// - DSProductImageContainer (badges, image, swatches)
/// - DSPlpPodDetails (title, pricing, ratings, fulfillment)
/// - DSPodButtonSet (B2C or B2B action buttons)
///
/// Example usage:
/// ```swift
/// // B2C variant
/// DSProductCard(
///     imageURL: URL(string: "https://..."),
///     brand: "Home Decorators Collection",
///     title: "35.4 in. W x 10.2 in. D x 2 in. H Driftwood",
///     priceText: "$29.00",
///     rating: 4.5,
///     ratingCount: 281,
///     buttonVariant: .b2c,
///     onAddToCart: { print("Added to cart") }
/// )
///
/// // B2B variant with quantity picker
/// DSProductCard(
///     brand: "Home Decorators Collection",
///     title: "Product Title",
///     priceText: "$29.00",
///     buttonVariant: .b2b,
///     quantity: $quantity,
///     onAddToCart: { print("Added to cart") },
///     onAddToList: { print("Added to list") }
/// )
/// ```
public struct DSProductCard: View {
    // MARK: Lifecycle

    /// Creates a product card with B2C button configuration
    public init(
        imageURL: URL? = nil,
        placeholderImage: Image? = nil,
        showExclusiveBadge: Bool = false,
        showDeliveryBadge: Bool = false,
        showSponsoredTag: Bool = false,
        swatches: [Color] = [],
        selectedSwatchIndex: Int = 0,
        additionalSwatchCount: Int? = nil,
        brand: String,
        title: String,
        modelNumber: String? = nil,
        priceLabel: String? = nil,
        priceText: String,
        rating: Double? = nil,
        ratingCount: Int? = nil,
        pickupInfo: String? = nil,
        deliveryInfo: String? = nil,
        fasterDeliveryInfo: String? = nil,
        showAtYourStore: Bool = false,
        storeStock: String? = nil,
        buttonVariant: DSPodButtonSet.Variant = .b2c,
        onAddToCart: @escaping () -> Void,
        onAddToList: (() -> Void)? = nil
    ) {
        self.imageURL = imageURL
        self.placeholderImage = placeholderImage
        self.showExclusiveBadge = showExclusiveBadge
        self.showDeliveryBadge = showDeliveryBadge
        self.showSponsoredTag = showSponsoredTag
        self.swatches = swatches
        self.selectedSwatchIndex = selectedSwatchIndex
        self.additionalSwatchCount = additionalSwatchCount
        self.brand = brand
        self.title = title
        self.modelNumber = modelNumber
        self.priceLabel = priceLabel
        self.priceText = priceText
        self.rating = rating
        self.ratingCount = ratingCount
        self.pickupInfo = pickupInfo
        self.deliveryInfo = deliveryInfo
        self.fasterDeliveryInfo = fasterDeliveryInfo
        self.showAtYourStore = showAtYourStore
        self.storeStock = storeStock
        self.buttonVariant = buttonVariant
        self._quantity = .constant(1)
        self.onAddToCart = onAddToCart
        self.onAddToList = onAddToList
    }
    
    /// Creates a product card with B2B button configuration and quantity binding
    public init(
        imageURL: URL? = nil,
        placeholderImage: Image? = nil,
        showExclusiveBadge: Bool = false,
        showDeliveryBadge: Bool = false,
        showSponsoredTag: Bool = false,
        swatches: [Color] = [],
        selectedSwatchIndex: Int = 0,
        additionalSwatchCount: Int? = nil,
        brand: String,
        title: String,
        modelNumber: String? = nil,
        priceLabel: String? = nil,
        priceText: String,
        rating: Double? = nil,
        ratingCount: Int? = nil,
        pickupInfo: String? = nil,
        deliveryInfo: String? = nil,
        fasterDeliveryInfo: String? = nil,
        showAtYourStore: Bool = false,
        storeStock: String? = nil,
        buttonVariant: DSPodButtonSet.Variant = .b2b,
        quantity: Binding<Int>,
        onAddToCart: @escaping () -> Void,
        onAddToList: (() -> Void)? = nil
    ) {
        self.imageURL = imageURL
        self.placeholderImage = placeholderImage
        self.showExclusiveBadge = showExclusiveBadge
        self.showDeliveryBadge = showDeliveryBadge
        self.showSponsoredTag = showSponsoredTag
        self.swatches = swatches
        self.selectedSwatchIndex = selectedSwatchIndex
        self.additionalSwatchCount = additionalSwatchCount
        self.brand = brand
        self.title = title
        self.modelNumber = modelNumber
        self.priceLabel = priceLabel
        self.priceText = priceText
        self.rating = rating
        self.ratingCount = ratingCount
        self.pickupInfo = pickupInfo
        self.deliveryInfo = deliveryInfo
        self.fasterDeliveryInfo = fasterDeliveryInfo
        self.showAtYourStore = showAtYourStore
        self.storeStock = storeStock
        self.buttonVariant = buttonVariant
        self._quantity = quantity
        self.onAddToCart = onAddToCart
        self.onAddToList = onAddToList
    }

    // MARK: Public

    public var body: some View {
        HStack(alignment: .top, spacing: 8) {
            // Left side: Product Image Container
            DSProductImageContainer(
                imageURL: imageURL,
                placeholderImage: placeholderImage,
                showExclusiveBadge: showExclusiveBadge,
                showDeliveryBadge: showDeliveryBadge,
                showSponsoredTag: showSponsoredTag,
                swatches: swatches,
                selectedSwatchIndex: selectedSwatchIndex,
                additionalSwatchCount: additionalSwatchCount
            )
            
            // Right side: Details and Actions
            VStack(alignment: .leading, spacing: 8) {
                // Product Details
                productDetailsSection
                
                // Action Buttons
                buttonsSection
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(8)
        .background(containerBackgroundColor)
        .cornerRadius(isDark ? TokensSemanticDark.BorderRadiusXl : TokensSemanticLight.BorderRadiusXl)
    }

    // MARK: Private

    // Image properties
    private let imageURL: URL?
    private let placeholderImage: Image?
    private let showExclusiveBadge: Bool
    private let showDeliveryBadge: Bool
    private let showSponsoredTag: Bool
    private let swatches: [Color]
    private let selectedSwatchIndex: Int
    private let additionalSwatchCount: Int?
    
    // Details properties
    private let brand: String
    private let title: String
    private let modelNumber: String?
    private let priceLabel: String?
    private let priceText: String
    private let rating: Double?
    private let ratingCount: Int?
    private let pickupInfo: String?
    private let deliveryInfo: String?
    private let fasterDeliveryInfo: String?
    private let showAtYourStore: Bool
    private let storeStock: String?
    
    // Button properties
    private let buttonVariant: DSPodButtonSet.Variant
    @Binding private var quantity: Int
    private let onAddToCart: () -> Void
    private let onAddToList: (() -> Void)?

    @Environment(\.colorScheme)
    private var colorScheme
    
    private var isDark: Bool { colorScheme == .dark }

    // MARK: - Product Details Section

    @ViewBuilder
    private var productDetailsSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Brand and Title
            Text(brandAndTitle)
                .font(.system(size: TokensCoreLight.FontSizeBodySm))
                .foregroundColor(isDark ? TokensSemanticDark.TextOnSurfaceColorPrimary : TokensSemanticLight.TextOnSurfaceColorPrimary)
                .lineLimit(3)
                .fixedSize(horizontal: false, vertical: true)
            
            // Model Number
            if let modelNumber = modelNumber {
                Text("Model: \(modelNumber)")
                    .font(.system(size: TokensCoreLight.FontSizeBodyXs))
                    .foregroundColor(isDark ? TokensSemanticDark.TextOnSurfaceColorTertiary : TokensSemanticLight.TextOnSurfaceColorTertiary)
            }
            
            // Pricing
            VStack(alignment: .leading, spacing: 4) {
                if let priceLabel = priceLabel {
                    Text(priceLabel)
                        .font(.system(size: TokensCoreLight.FontSizeBodyXs))
                        .foregroundColor(isDark ? TokensSemanticDark.TextOnSurfaceColorSecondary : TokensSemanticLight.TextOnSurfaceColorSecondary)
                }
                
                Text(priceText)
                    .font(.system(size: DesignSystemGlobal.FontSizeH3, weight: .bold))
                    .foregroundColor(isDark ? TokensSemanticDark.TextOnSurfaceColorPrimary : TokensSemanticLight.TextOnSurfaceColorPrimary)
            }
            
            // Rating
            if let rating = rating, let ratingCount = ratingCount {
                RatingView(rating: rating, count: ratingCount, isDark: isDark)
            }
            
            // Pickup Info
            if let pickupInfo = pickupInfo {
                pickupInfoView(pickupInfo)
            }
            
            // Delivery Info
            if let deliveryInfo = deliveryInfo {
                deliveryInfoView(deliveryInfo)
            }
            
            // Faster Delivery
            if let fasterDeliveryInfo = fasterDeliveryInfo {
                fasterDeliveryView(fasterDeliveryInfo)
            }
        }
    }
    
    @ViewBuilder
    private func pickupInfoView(_ info: String) -> some View {
        Text(pickupText(for: info))
            .font(.system(size: TokensCoreLight.FontSizeBodySm))
    }
    
    @ViewBuilder
    private func deliveryInfoView(_ info: String) -> some View {
        Text(deliveryText(for: info))
            .font(.system(size: TokensCoreLight.FontSizeBodySm))
    }
    
    @ViewBuilder
    private func fasterDeliveryView(_ info: String) -> some View {
        Text(fasterDeliveryText(for: info))
            .font(.system(size: TokensCoreLight.FontSizeBodySm))
    }

    // MARK: - Buttons Section

    @ViewBuilder
    private var buttonsSection: some View {
        if buttonVariant == .b2c {
            VStack(alignment: .leading, spacing: 8) {
                DSButton("Add to Cart", style: .orangeFilled, size: .medium, action: onAddToCart)
                    .frame(maxWidth: .infinity)
                
                if let onAddToList = onAddToList {
                    DSButton("Add to ...", style: .outlined, size: .medium, action: onAddToList)
                        .frame(maxWidth: .infinity)
                }
            }
        } else {
            VStack(alignment: .leading, spacing: 8) {
                // Quantity Picker
                QuantityPickerView(quantity: $quantity, isDark: isDark)
                
                DSButton("Add to Cart", style: .orangeFilled, size: .medium, action: onAddToCart)
                    .frame(maxWidth: .infinity)
                
                if let onAddToList = onAddToList {
                    DSButton("Add to ...", style: .outlined, size: .medium, action: onAddToList)
                        .frame(maxWidth: .infinity)
                }
            }
        }
    }

    // MARK: - Helpers

    private var brandAndTitle: AttributedString {
        var result = AttributedString(brand)
        result.font = .system(size: TokensCoreLight.FontSizeBodySm, weight: .bold)
        
        var titleText = AttributedString("\n\(title)")
        titleText.font = .system(size: TokensCoreLight.FontSizeBodySm)
        
        result.append(titleText)
        return result
    }
    
    private func pickupText(for info: String) -> AttributedString {
        // Parse info like "2,243 in stock at Washington Courthouse, OH"
        var result = AttributedString("Pickup: ")
        result.font = .system(size: TokensCoreLight.FontSizeBodySm, weight: .bold)
        result.foregroundColor = isDark ? TokensSemanticDark.TextOnSurfaceColorPrimary : TokensSemanticLight.TextOnSurfaceColorPrimary
        
        var infoText = AttributedString(info)
        infoText.font = .system(size: TokensCoreLight.FontSizeBodySm)
        infoText.foregroundColor = isDark ? TokensSemanticDark.TextOnSurfaceColorPrimary : TokensSemanticLight.TextOnSurfaceColorPrimary
        
        result.append(infoText)
        return result
    }
    
    private func deliveryText(for info: String) -> AttributedString {
        var result = AttributedString("Delivery: ")
        result.font = .system(size: TokensCoreLight.FontSizeBodySm, weight: .bold)
        result.foregroundColor = isDark ? TokensSemanticDark.TextOnSurfaceColorPrimary : TokensSemanticLight.TextOnSurfaceColorPrimary
        
        var infoText = AttributedString(info)
        infoText.font = .system(size: TokensCoreLight.FontSizeBodySm)
        infoText.foregroundColor = isDark ? TokensSemanticDark.TextOnSurfaceColorPrimary : TokensSemanticLight.TextOnSurfaceColorPrimary
        
        result.append(infoText)
        return result
    }
    
    private func fasterDeliveryText(for info: String) -> AttributedString {
        var result = AttributedString("Faster Delivery:\n")
        result.font = .system(size: TokensCoreLight.FontSizeBodySm, weight: .bold)
        result.foregroundColor = isDark ? TokensSemanticDark.TextOnSurfaceColorPrimary : TokensSemanticLight.TextOnSurfaceColorPrimary
        
        var infoText = AttributedString(info)
        infoText.font = .system(size: TokensCoreLight.FontSizeBodySm)
        infoText.foregroundColor = isDark ? TokensSemanticDark.TextOnSurfaceColorPrimary : TokensSemanticLight.TextOnSurfaceColorPrimary
        
        result.append(infoText)
        return result
    }
    
    private var containerBackgroundColor: Color {
        isDark ? TokensSemanticDark.BackgroundContainerColorWhite : TokensSemanticLight.BackgroundContainerColorWhite
    }
}

// MARK: - RatingView

private struct RatingView: View {
    let rating: Double
    let count: Int
    let isDark: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            // First row of stars
            HStack(spacing: 1) {
                ForEach(0..<5) { index in
                    StarView(
                        filled: rating >= Double(index + 1),
                        half: rating > Double(index) && rating < Double(index + 1),
                        isDark: isDark
                    )
                }
            }
            
            // Second row of stars (for double rating display like in image)
            HStack(spacing: 1) {
                ForEach(0..<5) { index in
                    StarView(
                        filled: rating >= Double(index + 1),
                        half: rating > Double(index) && rating < Double(index + 1),
                        isDark: isDark
                    )
                }
            }
            
            // Rating text
            Text("(\(String(format: "%.1f", rating)) / \(count))")
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
    
    private var fillColor: Color {
        Color(red: 0.976, green: 0.388, blue: 0.008) // Orange
    }
    
    private var emptyColor: Color {
        isDark ? TokensSemanticDark.TextOnSurfaceColorTertiary : TokensSemanticLight.TextOnSurfaceColorTertiary
    }
    
    var body: some View {
        Image(systemName: filled ? "star.fill" : "star")
            .resizable()
            .frame(width: 16, height: 16)
            .foregroundColor(filled ? fillColor : emptyColor)
    }
}

// MARK: - QuantityPickerView

private struct QuantityPickerView: View {
    @Binding var quantity: Int
    let isDark: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            // Decrement button
            Button {
                if quantity > 1 {
                    quantity -= 1
                }
            } label: {
                Image(systemName: "minus")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                    .frame(width: 28, height: 28)
            }
            .frame(width: 44, height: 44)
            .contentShape(Rectangle())
            
            Spacer()
            
            // Quantity display
            Text("\(quantity)")
                .font(.system(size: TokensCoreLight.FontSizeBodySm, weight: .bold))
                .foregroundColor(.white)
            
            Spacer()
            
            // Increment button
            Button {
                quantity += 1
            } label: {
                Image(systemName: "plus")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                    .frame(width: 28, height: 28)
            }
            .frame(width: 44, height: 44)
            .contentShape(Rectangle())
        }
        .frame(height: 36)
        .padding(.vertical, 2)
        .background(
            LinearGradient(
                colors: [
                    Color(red: 0.976, green: 0.388, blue: 0.008),
                    Color(red: 0.984, green: 0.635, blue: 0.408)
                ],
                startPoint: .leading,
                endPoint: .trailing
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 9999))
        .frame(height: 44)
    }
}

// MARK: - Factory Methods

extension DSProductCard {
    /// Sample B2C product card for previews and testing
    public static func sampleB2C(
        imageURL: URL? = nil,
        placeholderImage: Image? = Image("Fridge"),
        showExclusiveBadge: Bool = true,
        showDeliveryBadge: Bool = true,
        showSponsoredTag: Bool = true,
        swatches: [Color] = [.black, .gray, .brown],
        selectedSwatchIndex: Int = 0,
        additionalSwatchCount: Int? = nil,
        brand: String = "Home Decorators Collection",
        title: String = "35.4 in. W x 10.2 in. D x 2 in. H Driftwood Gradieted with spotted...",
        modelNumber: String? = "A7A19A100WUL01",
        priceLabel: String? = "Starting at",
        priceText: String = "$29.00",
        rating: Double? = 4.5,
        ratingCount: Int? = 281,
        pickupInfo: String? = "2,243 in stock at Washington Courthouse, OH",
        deliveryInfo: String? = "Free Tomorrow",
        fasterDeliveryInfo: String? = "Get it in 2 hours",
        onAddToCart: @escaping () -> Void = {},
        onAddToList: (() -> Void)? = {}
    ) -> DSProductCard {
        DSProductCard(
            imageURL: imageURL,
            placeholderImage: placeholderImage,
            showExclusiveBadge: showExclusiveBadge,
            showDeliveryBadge: showDeliveryBadge,
            showSponsoredTag: showSponsoredTag,
            swatches: swatches,
            selectedSwatchIndex: selectedSwatchIndex,
            additionalSwatchCount: additionalSwatchCount,
            brand: brand,
            title: title,
            modelNumber: modelNumber,
            priceLabel: priceLabel,
            priceText: priceText,
            rating: rating,
            ratingCount: ratingCount,
            pickupInfo: pickupInfo,
            deliveryInfo: deliveryInfo,
            fasterDeliveryInfo: fasterDeliveryInfo,
            buttonVariant: .b2c,
            onAddToCart: onAddToCart,
            onAddToList: onAddToList
        )
    }
    
    /// Sample B2B product card for previews and testing
    public static func sampleB2B(
        imageURL: URL? = nil,
        placeholderImage: Image? = Image("Fridge"),
        swatches: [Color] = [.black, .gray, .brown],
        brand: String = "Home Decorators Collection",
        title: String = "35.4 in. W x 10.2 in. D x 2 in. H Driftwood Gradieted with spotted...",
        modelNumber: String? = "A7A19A100WUL01",
        priceText: String = "$29.00",
        rating: Double? = 4.5,
        ratingCount: Int? = 281,
        quantity: Binding<Int> = .constant(1),
        onAddToCart: @escaping () -> Void = {},
        onAddToList: (() -> Void)? = {}
    ) -> DSProductCard {
        DSProductCard(
            imageURL: imageURL,
            placeholderImage: placeholderImage,
            swatches: swatches,
            brand: brand,
            title: title,
            modelNumber: modelNumber,
            priceText: priceText,
            rating: rating,
            ratingCount: ratingCount,
            buttonVariant: .b2b,
            quantity: quantity,
            onAddToCart: onAddToCart,
            onAddToList: onAddToList
        )
    }
}
