import SwiftUI

// MARK: - DSPlpPodDetails

/// A product listing details component displaying title, model, pricing, ratings, and fulfillment information.
///
/// PlpPodDetails shows comprehensive product information including:
/// - Brand and product title
/// - Model number
/// - Pricing information (or contact message)
/// - Star ratings with count
/// - Pickup/delivery availability
///
/// Example usage:
/// ```swift
/// DSPlpPodDetails(
///     brand: "Home Decorators Collection",
///     title: "35.4 in. W x 10.2 in. D x 2 in. H Driftwood",
///     modelNumber: "A7A19A100WUL01",
///     priceText: "Contact your local store for price",
///     rating: 4.5,
///     ratingCount: 281,
///     pickupInfo: "15 in stock, not eligible for online order Pickup",
///     deliveryInfo: "Unavailable"
/// )
/// ```
public struct DSPlpPodDetails: View {
    // MARK: Lifecycle

    /// Creates a DSPlpPodDetails with the specified configuration.
    public init(
        brand: String,
        title: String,
        modelNumber: String? = nil,
        priceText: String,
        rating: Double? = nil,
        ratingCount: Int? = nil,
        pickupInfo: String? = nil,
        deliveryInfo: String? = nil,
        showAtYourStore: Bool = false,
        storeStock: String? = nil
    ) {
        self.brand = brand
        self.title = title
        self.modelNumber = modelNumber
        self.priceText = priceText
        self.rating = rating
        self.ratingCount = ratingCount
        self.pickupInfo = pickupInfo
        self.deliveryInfo = deliveryInfo
        self.showAtYourStore = showAtYourStore
        self.storeStock = storeStock
    }

    // MARK: Public

    public var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Details Container
            VStack(alignment: .leading, spacing: 4) {
                // Brand and Title
                Text(brandAndTitle)
                    .font(.system(size: TokensCoreLight.FontSizeBodySm))
                    .foregroundColor(isDark ? TokensSemanticDark.TextOnSurfaceColorPrimary : TokensSemanticLight.TextOnSurfaceColorPrimary)
                    .lineLimit(nil)
                
                // Model Number
                if let modelNumber = modelNumber {
                    Text("Model: \(modelNumber)")
                        .font(.system(size: TokensCoreLight.FontSizeBodyXs))
                        .foregroundColor(isDark ? TokensSemanticDark.TextOnSurfaceColorTertiary : TokensSemanticLight.TextOnSurfaceColorTertiary)
                }
            }
            
            // Pricing Container
            VStack(alignment: .leading, spacing: 8) {
                // Pricing
                Text(priceText)
                    .font(.system(size: TokensCoreLight.FontSizeBodyMd, weight: .bold))
                    .foregroundColor(isDark ? TokensSemanticDark.TextOnSurfaceColorPrimary : TokensSemanticLight.TextOnSurfaceColorPrimary)
                
                // Rating
                if let rating = rating, let ratingCount = ratingCount {
                    RatingView(rating: rating, count: ratingCount, isDark: isDark)
                }
                
                // At Your Store Info
                if showAtYourStore, let storeStock = storeStock {
                    AtYourStoreView(storeStock: storeStock, isDark: isDark)
                }
                
                // Pickup Info
                if let pickupInfo = pickupInfo {
                    Text(pickupInfo)
                        .font(.system(size: TokensCoreLight.FontSizeBodySm))
                        .foregroundColor(isDark ? TokensSemanticDark.TextOnSurfaceColorPrimary : TokensSemanticLight.TextOnSurfaceColorPrimary)
                }
                
                // Delivery Info
                if let deliveryInfo = deliveryInfo {
                    HStack(spacing: 4) {
                        // Close icon placeholder - would need icon token
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 14, height: 14)
                            .foregroundColor(isDark ? TokensSemanticDark.TextOnSurfaceColorTertiary : TokensSemanticLight.TextOnSurfaceColorTertiary)
                        
                        Text("Delivery: ")
                            .font(.system(size: TokensCoreLight.FontSizeBodySm, weight: .bold))
                            .foregroundColor(isDark ? TokensSemanticDark.TextOnSurfaceColorPrimary : TokensSemanticLight.TextOnSurfaceColorPrimary) +
                        Text(deliveryInfo)
                            .font(.system(size: TokensCoreLight.FontSizeBodySm))
                            .foregroundColor(isDark ? TokensSemanticDark.TextOnSurfaceColorTertiary : TokensSemanticLight.TextOnSurfaceColorTertiary)
                    }
                }
            }
        }
    }

    // MARK: Private

    @Environment(\.colorScheme)
    private var colorScheme

    private let brand: String
    private let title: String
    private let modelNumber: String?
    private let priceText: String
    private let rating: Double?
    private let ratingCount: Int?
    private let pickupInfo: String?
    private let deliveryInfo: String?
    private let showAtYourStore: Bool
    private let storeStock: String?

    private var isDark: Bool { colorScheme == .dark }
    
    private var brandAndTitle: AttributedString {
        var result = AttributedString(brand)
        result.font = .system(size: TokensCoreLight.FontSizeBodySm, weight: .bold)
        
        var titleText = AttributedString("\n\(title)")
        titleText.font = .system(size: TokensCoreLight.FontSizeBodySm)
        
        result.append(titleText)
        return result
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
            Text("(\(String(format: "%.1f", rating)) / \(count))")
                .font(.system(size: TokensCoreLight.FontSizeBodyXs))
                .foregroundColor(isDark ? TokensSemanticDark.TextOnSurfaceColorPrimary : TokensSemanticLight.TextOnSurfaceColorPrimary)
                .padding(.top, 4)
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

// MARK: - AtYourStoreView

private struct AtYourStoreView: View {
    let storeStock: String
    let isDark: Bool
    
    var body: some View {
        Text("At Your Store: ")
            .font(.system(size: TokensCoreLight.FontSizeBodySm, weight: .bold))
            .foregroundColor(isDark ? TokensSemanticDark.TextOnSurfaceColorPrimary : TokensSemanticLight.TextOnSurfaceColorPrimary) +
        Text(storeStock)
            .font(.system(size: TokensCoreLight.FontSizeBodySm))
            .foregroundColor(isDark ? TokensSemanticDark.TextOnContainerColorSuccess : TokensSemanticLight.TextOnContainerColorSuccess) +
        Text(" in stock,")
            .font(.system(size: TokensCoreLight.FontSizeBodySm))
            .foregroundColor(isDark ? TokensSemanticDark.TextOnSurfaceColorPrimary : TokensSemanticLight.TextOnSurfaceColorPrimary)
    }
}

// MARK: - Factory Methods

extension DSPlpPodDetails {
    /// Sample configuration for previews and testing
    public static func sample(
        brand: String = "Home Decorators Collection",
        title: String = "35.4 in. W x 10.2 in. D x 2 in. H Driftwood Gradieted with spotted",
        modelNumber: String? = "A7A19A100WUL01",
        priceText: String = "Contact your local store for price",
        rating: Double? = 4.5,
        ratingCount: Int? = 281,
        pickupInfo: String? = "15 in stock, not eligible for online order Pickup",
        deliveryInfo: String? = "Unavailable",
        showAtYourStore: Bool = true,
        storeStock: String? = "15"
    ) -> DSPlpPodDetails {
        DSPlpPodDetails(
            brand: brand,
            title: title,
            modelNumber: modelNumber,
            priceText: priceText,
            rating: rating,
            ratingCount: ratingCount,
            pickupInfo: pickupInfo,
            deliveryInfo: deliveryInfo,
            showAtYourStore: showAtYourStore,
            storeStock: storeStock
        )
    }
}
