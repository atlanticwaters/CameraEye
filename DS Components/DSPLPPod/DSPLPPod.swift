import SwiftUI

// MARK: - DSPLPPodVariant

/// The variant of the PLP Pod display.
public enum DSPLPPodVariant: Equatable, Sendable {
    /// B2C variant with image, details, and Add to Cart button
    case b2c

    /// B2B variant with image, details, quantity picker, Add to Cart, and Add to List buttons
    case b2b
}

// MARK: - DSPLPPodData

/// Data model containing all information needed to display a PLP Pod.
public struct DSPLPPodData: Equatable, Sendable {
    // MARK: - Image Container Properties

    public let productImage: Image?
    public let badges: [DSPLPPodBadge]
    public let isSponsored: Bool
    public let swatchDisplay: DSPLPPodSwatchDisplay

    // MARK: - Details Properties

    public let productName: String
    public let modelNumber: String?
    public let pricingType: DSPLPPodPricingType
    public let showSpecialBuy: Bool
    public let perItemPriceDetail: String?
    public let ratingInfo: DSPLPPodRatingInfo?
    public let fulfillmentInfo: DSPLPPodFulfillmentInfo?

    // MARK: - Button Set Properties

    public let quantity: Int
    public let minQuantity: Int
    public let maxQuantity: Int
    public let addToCartText: String
    public let addToListText: String
    public let isAddToCartEnabled: Bool
    public let isAddToListEnabled: Bool

    // MARK: - Initializer

    public init(
        productImage: Image? = nil,
        badges: [DSPLPPodBadge] = [],
        isSponsored: Bool = false,
        swatchDisplay: DSPLPPodSwatchDisplay = .none,
        productName: String,
        modelNumber: String? = nil,
        pricingType: DSPLPPodPricingType,
        showSpecialBuy: Bool = false,
        perItemPriceDetail: String? = nil,
        ratingInfo: DSPLPPodRatingInfo? = nil,
        fulfillmentInfo: DSPLPPodFulfillmentInfo? = nil,
        quantity: Int = 1,
        minQuantity: Int = 1,
        maxQuantity: Int = 99,
        addToCartText: String = "Add to Cart",
        addToListText: String = "Add to List",
        isAddToCartEnabled: Bool = true,
        isAddToListEnabled: Bool = true
    ) {
        self.productImage = productImage
        self.badges = badges
        self.isSponsored = isSponsored
        self.swatchDisplay = swatchDisplay
        self.productName = productName
        self.modelNumber = modelNumber
        self.pricingType = pricingType
        self.showSpecialBuy = showSpecialBuy
        self.perItemPriceDetail = perItemPriceDetail
        self.ratingInfo = ratingInfo
        self.fulfillmentInfo = fulfillmentInfo
        self.quantity = quantity
        self.minQuantity = minQuantity
        self.maxQuantity = maxQuantity
        self.addToCartText = addToCartText
        self.addToListText = addToListText
        self.isAddToCartEnabled = isAddToCartEnabled
        self.isAddToListEnabled = isAddToListEnabled
    }
}

// MARK: - DSPLPPod

/// A composite component for displaying a complete PLP (Product Listing Page) pod.
///
/// DSPLPPod combines DSPLPPodImageContainer, DSPLPPodDetails, and DSPLPPodButtonSet
/// into a single cohesive component. It supports both B2C and B2B variants.
///
/// Example usage:
/// ```swift
/// DSPLPPod(
///     variant: .b2c,
///     data: DSPLPPodData(
///         productImage: productImage,
///         badges: [.exclusive()],
///         productName: "DEWALT 20V MAX Cordless Drill",
///         modelNumber: "DCD791D2",
///         pricingType: .standard(dollars: 149, cents: 99, perUnit: "/each"),
///         ratingInfo: DSPLPPodRatingInfo(rating: 4.5, reviewCount: 1234)
///     ),
///     onImageTap: { print("Image tapped") },
///     onAddToCart: { print("Add to cart") }
/// )
/// ```
public struct DSPLPPod: View {
    // MARK: - Properties

    private let variant: DSPLPPodVariant
    private let data: DSPLPPodData
    private let onImageTap: (() -> Void)?
    private let onSwatchTap: ((DSPLPPodSwatch) -> Void)?
    private let onProductTap: (() -> Void)?
    private let onRatingsTap: (() -> Void)?
    private let onQuantityChanged: ((Int) -> Void)?
    private let onAddToCart: (() -> Void)?
    private let onAddToList: (() -> Void)?

    // MARK: - Constants

    private enum Layout {
        static let containerSpacing: CGFloat = 0
        static let imageContainerWidth: CGFloat = 145
        static let detailsWidth: CGFloat = 205
        static let cornerRadius: CGFloat = 8
        static let contentPadding: CGFloat = 8
    }

    // MARK: - Initializers

    public init(
        variant: DSPLPPodVariant = .b2c,
        data: DSPLPPodData,
        onImageTap: (() -> Void)? = nil,
        onSwatchTap: ((DSPLPPodSwatch) -> Void)? = nil,
        onProductTap: (() -> Void)? = nil,
        onRatingsTap: (() -> Void)? = nil,
        onQuantityChanged: ((Int) -> Void)? = nil,
        onAddToCart: (() -> Void)? = nil,
        onAddToList: (() -> Void)? = nil
    ) {
        self.variant = variant
        self.data = data
        self.onImageTap = onImageTap
        self.onSwatchTap = onSwatchTap
        self.onProductTap = onProductTap
        self.onRatingsTap = onRatingsTap
        self.onQuantityChanged = onQuantityChanged
        self.onAddToCart = onAddToCart
        self.onAddToList = onAddToList
    }

    // MARK: - Body

    public var body: some View {
        HStack(alignment: .top, spacing: Layout.containerSpacing) {
            // Image Section
            imageSection

            // Details Section (includes details and buttons)
            detailsSection
        }
        .background(DSPLPPodColorHelper.backgroundColor())
        .cornerRadius(Layout.cornerRadius)
    }

    // MARK: - Image Section

    @ViewBuilder
    private var imageSection: some View {
        DSPLPPodImageContainer(
            image: data.productImage,
            badges: data.badges,
            isSponsored: data.isSponsored,
            swatchDisplay: data.swatchDisplay,
            onImageTap: onImageTap,
            onSwatchTap: onSwatchTap
        )
    }

    // MARK: - Details Section

    @ViewBuilder
    private var detailsSection: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Product Details
            DSPLPPodDetails(
                productName: data.productName,
                modelNumber: data.modelNumber,
                pricingType: data.pricingType,
                showSpecialBuy: data.showSpecialBuy,
                perItemPriceDetail: data.perItemPriceDetail,
                ratingInfo: data.ratingInfo,
                fulfillmentInfo: data.fulfillmentInfo,
                onRatingsTap: onRatingsTap,
                onProductTap: onProductTap
            )

            // Button Set
            buttonSetSection
        }
        .padding(Layout.contentPadding)
        .frame(width: Layout.detailsWidth, alignment: .leading)
    }

    // MARK: - Button Set Section

    @ViewBuilder
    private var buttonSetSection: some View {
        DSPLPPodButtonSet(
            variant: buttonSetVariant,
            quantity: data.quantity,
            minQuantity: data.minQuantity,
            maxQuantity: data.maxQuantity,
            addToCartText: data.addToCartText,
            addToListText: data.addToListText,
            isAddToCartEnabled: data.isAddToCartEnabled,
            isAddToListEnabled: data.isAddToListEnabled,
            onQuantityChanged: onQuantityChanged,
            onAddToCart: onAddToCart,
            onAddToList: onAddToList
        )
    }

    // MARK: - Helpers

    private var buttonSetVariant: DSPLPPodButtonSetVariant {
        switch variant {
        case .b2c:
            return .b2c
        case .b2b:
            return .b2b
        }
    }
}
