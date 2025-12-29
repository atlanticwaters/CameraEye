import SwiftUI

/// A flexible card container component for displaying content and product information
public struct DSCard: View {
    // MARK: - Types
    
    /// Visual variant of the card
    public enum Variant {
        case content
        case miniProduct
    }
    
    // MARK: - Properties
    
    private let variant: Variant
    private let content: AnyView
    
    @Environment(\.colorScheme) private var colorScheme
    
    private var isDark: Bool {
        colorScheme == .dark
    }
    
    // MARK: - Initialization
    
    /// Creates a card with custom content
    /// - Parameters:
    ///   - variant: Card variant (default: .content)
    ///   - content: Content view builder
    public init(
        variant: Variant = .content,
        @ViewBuilder content: () -> some View
    ) {
        self.variant = variant
        self.content = AnyView(content())
    }
    
    // MARK: - Body
    
    public var body: some View {
        content
            .background(backgroundColor)
            .cornerRadius(cornerRadius)
    }
    
    // MARK: - Styling
    
    private var backgroundColor: Color {
        isDark ? TokensSemanticDark.BackgroundContainerColorWhite : TokensSemanticLight.BackgroundContainerColorWhite
    }
    
    private var cornerRadius: CGFloat {
        TokensSemanticLight.BorderRadius3xl // 16px per Figma
    }
}

// MARK: - DSContentCard

/// A content card with optional title, subtitle, body, and action button
public struct DSContentCard: View {
    // MARK: - Types
    
    /// Body placement options
    public enum BodyPlacement {
        case firstWithPadding
        case firstFullBleed
        case secondWithPadding
        case secondFullBleed
    }
    
    // MARK: - Properties
    
    private let title: String?
    private let subtitle: String?
    private let bodyContent: AnyView?
    private let bodyPlacement: BodyPlacement
    private let buttonText: String?
    private let onTitleAction: (() -> Void)?
    private let onButtonTap: (() -> Void)?
    
    @Environment(\.colorScheme) private var colorScheme
    
    private var isDark: Bool {
        colorScheme == .dark
    }
    
    // MARK: - Initialization
    
    /// Creates a content card
    /// - Parameters:
    ///   - title: Optional title text
    ///   - subtitle: Optional subtitle text
    ///   - bodyPlacement: Body content placement (default: .secondWithPadding)
    ///   - buttonText: Optional button text (if nil, button is hidden)
    ///   - onTitleAction: Optional action for the title icon button
    ///   - onButtonTap: Optional button tap action
    ///   - bodyContent: Optional body content view
    public init(
        title: String? = nil,
        subtitle: String? = nil,
        bodyPlacement: BodyPlacement = .secondWithPadding,
        buttonText: String? = nil,
        onTitleAction: (() -> Void)? = nil,
        onButtonTap: (() -> Void)? = nil,
        bodyContent: (() -> AnyView)? = nil
    ) {
        self.title = title
        self.subtitle = subtitle
        self.bodyPlacement = bodyPlacement
        self.buttonText = buttonText
        self.onTitleAction = onTitleAction
        self.onButtonTap = onButtonTap
        self.bodyContent = bodyContent.map { $0() }
    }
    
    // MARK: - Body
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Title section
            if title != nil || subtitle != nil {
                titleSection
                    .padding(.horizontal, 20)
                    .padding(.top, shouldShowBodyFirst ? 20 : 0)
            }
            
            // Body placement logic
            if shouldShowBodyFirst {
                bodySection
            }
            
            // Bottom button
            if let buttonText = buttonText {
                DSButton(
                    buttonText,
                    style: .orangeFilled,
                    size: .large,
                    action: onButtonTap ?? {}
                )
                .padding(.horizontal, 20)
            }
            
            if !shouldShowBodyFirst {
                bodySection
            }
        }
        .padding(.vertical, paddingVertical)
        .background(backgroundColor)
        .cornerRadius(TokensSemanticLight.BorderRadius3xl)
    }
    
    // MARK: - Subviews
    
    private var titleSection: some View {
        HStack(alignment: .top, spacing: 0) {
            VStack(alignment: .leading, spacing: 8) {
                if let title = title {
                    HStack(spacing: 6) {
                        Text(title)
                            .font(.thdBodyLg)
                            .fontWeight(.semibold)
                            .foregroundColor(textColor)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .lineLimit(nil)
                    }
                }
                
                if let subtitle = subtitle {
                    Text(subtitle)
                        .font(.thdBodySm)
                        .foregroundColor(textColor)
                        .lineLimit(nil)
                }
            }
            
            // Action button
            if onTitleAction != nil {
                actionButton
            }
        }
    }
    
    private var actionButton: some View {
        Button(action: {
            onTitleAction?()
        }) {
            Image(systemName: "ellipsis")
                .font(.system(size: 16))
                .foregroundColor(textColor)
                .frame(width: 28, height: 28)
                .background(Color.clear)
                .cornerRadius(TokensSemanticLight.BorderRadiusFull)
        }
        .frame(width: 44, height: 44)
    }
    
    @ViewBuilder
    private var bodySection: some View {
        if let bodyContent = bodyContent {
            if isFullBleed {
                bodyContent
                    .clipped()
            } else {
                bodyContent
                    .padding(.horizontal, 20)
            }
        }
    }
    
    // MARK: - Helpers
    
    private var shouldShowBodyFirst: Bool {
        bodyPlacement == .firstWithPadding || bodyPlacement == .firstFullBleed
    }
    
    private var isFullBleed: Bool {
        bodyPlacement == .firstFullBleed || bodyPlacement == .secondFullBleed
    }
    
    private var paddingVertical: CGFloat {
        switch bodyPlacement {
        case .firstWithPadding, .firstFullBleed:
            return 20  // Bottom padding when body is first
        case .secondWithPadding:
            return 20  // Top padding when body is second
        case .secondFullBleed:
            return 20  // Consistent padding for full bleed
        }
    }
    
    private var backgroundColor: Color {
        isDark ? TokensSemanticDark.BackgroundContainerColorWhite : TokensSemanticLight.BackgroundContainerColorWhite
    }
    
    private var textColor: Color {
        isDark ? TokensSemanticDark.TextOnSurfaceColorPrimary : TokensSemanticLight.TextOnSurfaceColorPrimary
    }
}

// MARK: - DSMiniProductCard

/// A compact product card with horizontal or vertical orientation
public struct DSMiniProductCard: View {
    // MARK: - Types
    
    /// Card orientation
    public enum Orientation {
        case horizontal
        case vertical
    }
    
    // MARK: - Properties
    
    private let orientation: Orientation
    private let productImage: Image?
    private let sku: String?
    private let brandName: String?
    private let productName: String
    private let showRating: Bool
    private let rating: Double?
    private let showFulfillment: Bool
    private let pickupInfo: String?
    private let deliveryInfo: String?
    private let price: String
    private let buttonText: String
    private let showBadge: Bool
    private let badgeText: String?
    private let onButtonTap: (() -> Void)?
    private let onMoreAction: (() -> Void)?
    
    @Environment(\.colorScheme) private var colorScheme
    
    private var isDark: Bool {
        colorScheme == .dark
    }
    
    // MARK: - Initialization
    
    /// Creates a mini product card
    /// - Parameters:
    ///   - orientation: Card orientation (default: .horizontal)
    ///   - productImage: Product image
    ///   - sku: Product SKU
    ///   - brandName: Brand name
    ///   - productName: Product name/description
    ///   - showRating: Whether to show rating stars (default: false)
    ///   - rating: Product rating (0-5)
    ///   - showFulfillment: Whether to show fulfillment info (default: false)
    ///   - pickupInfo: Pickup availability text
    ///   - deliveryInfo: Delivery information text
    ///   - price: Product price
    ///   - buttonText: Button text (default: "Add to Cart")
    ///   - showBadge: Whether to show badge (default: false)
    ///   - badgeText: Badge label text
    ///   - onButtonTap: Button tap action
    ///   - onMoreAction: More options action
    public init(
        orientation: Orientation = .horizontal,
        productImage: Image? = nil,
        sku: String? = nil,
        brandName: String? = nil,
        productName: String,
        showRating: Bool = false,
        rating: Double? = nil,
        showFulfillment: Bool = false,
        pickupInfo: String? = nil,
        deliveryInfo: String? = nil,
        price: String,
        buttonText: String = "Add to Cart",
        showBadge: Bool = false,
        badgeText: String? = nil,
        onButtonTap: (() -> Void)? = nil,
        onMoreAction: (() -> Void)? = nil
    ) {
        self.orientation = orientation
        self.productImage = productImage
        self.sku = sku
        self.brandName = brandName
        self.productName = productName
        self.showRating = showRating
        self.rating = rating
        self.showFulfillment = showFulfillment
        self.pickupInfo = pickupInfo
        self.deliveryInfo = deliveryInfo
        self.price = price
        self.buttonText = buttonText
        self.showBadge = showBadge
        self.badgeText = badgeText
        self.onButtonTap = onButtonTap
        self.onMoreAction = onMoreAction
    }
    
    // MARK: - Body
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Badge and more button row
            if showBadge || onMoreAction != nil {
                badgeRow
                    .padding(.top, 16)
                    .padding(.bottom, 8)
            }
            
            if orientation == .horizontal {
                horizontalLayout
            } else {
                verticalLayout
            }
        }
        .background(backgroundColor)
        .cornerRadius(TokensSemanticLight.BorderRadius3xl)
    }
    
    // MARK: - Subviews
    
    private var badgeRow: some View {
        HStack {
            if showBadge, let badgeText = badgeText {
                Text(badgeText)
                    .font(.thdBodyXs)
                    .fontWeight(.bold)
                    .foregroundColor(badgeTextColor)
                    .padding(.horizontal, 4)
                    .padding(.vertical, 4)
                    .background(badgeBackgroundColor)
                    .cornerRadius(TokensSemanticLight.BorderRadiusLg)
            }
            
            Spacer()
            
            if let onMoreAction = onMoreAction {
                Button(action: onMoreAction) {
                    Image(systemName: "ellipsis")
                        .font(.system(size: 16))
                        .foregroundColor(textColor)
                        .frame(width: 28, height: 28)
                }
                .frame(width: 24, height: 24)
                .padding(8)
            }
        }
        .padding(.horizontal, 16)
    }
    
    private var horizontalLayout: some View {
        HStack(alignment: .center, spacing: 8) {
            productImageView
                .frame(width: 100, height: 100)
            
            productDetails
        }
        .padding(.horizontal, 16)
        .padding(.top, showBadge || onMoreAction != nil ? 0 : 16)
        .padding(.bottom, 16)
    }
    
    private var verticalLayout: some View {
        VStack(alignment: .leading, spacing: 16) {
            productDetails
                .padding(.horizontal, 16)
                .padding(.top, showBadge || onMoreAction != nil ? 0 : 16)
            
            productImageView
                .frame(height: 100)
                .padding(.horizontal, 16)
        }
        .padding(.bottom, 16)
    }
    
    private var productImageView: some View {
        Group {
            if let productImage = productImage {
                productImage
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                Rectangle()
                    .fill(isDark ? TokensSemanticDark.BackgroundContainerColorGreige : TokensSemanticLight.BackgroundContainerColorGreige)
            }
        }
        .cornerRadius(6)
    }
    
    private var productDetails: some View {
        VStack(alignment: .leading, spacing: 8) {
            // SKU
            if let sku = sku {
                Text(sku)
                    .font(.thdBodySm)
                    .foregroundColor(tertiaryTextColor)
                    .lineLimit(1)
            }
            
            // Product name
            productNameView
            
            // Rating
            if showRating {
                ratingStars
            }
            
            // Fulfillment
            if showFulfillment {
                fulfillmentInfo
            }
            
            // Price and button
            priceAndAction
        }
    }
    
    private var productNameView: some View {
        Text(buildProductNameAttributedString())
            .font(.thdBodySm)
            .foregroundColor(textColor)
            .lineLimit(2)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private func buildProductNameAttributedString() -> AttributedString {
        var attributedString = AttributedString()
        
        if let brandName = brandName {
            var brand = AttributedString(brandName)
            brand.font = .thdInformational(size: TokensCoreLight.FontSizeBodySm, weight: .bold)
            attributedString.append(brand)
            attributedString.append(AttributedString(" "))
        }
        
        var product = AttributedString(productName)
        product.font = .thdBodySm
        attributedString.append(product)
        
        return attributedString
    }
    
    private var ratingStars: some View {
        HStack(spacing: 2) {
            ForEach(0..<5) { index in
                Image(systemName: "star.fill")
                    .font(.system(size: 12))
                    .foregroundColor(index < Int(rating ?? 0) ? textColor : Color.gray.opacity(0.3))
            }
        }
        .padding(.bottom, 2)
    }
    
    @ViewBuilder
    private var fulfillmentInfo: some View {
        VStack(alignment: .leading, spacing: 2) {
            if let pickupInfo = pickupInfo {
                Text(pickupInfo)
                    .font(.thdBodySm)
                    .foregroundColor(successColor)
                    .lineLimit(1)
            }
            
            if let deliveryInfo = deliveryInfo {
                Text(deliveryInfo)
                    .font(.thdBodySm)
                    .foregroundColor(successColor)
                    .lineLimit(1)
            }
        }
    }
    
    private var priceAndAction: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(price)
                .font(.thdH4)
                .fontWeight(.heavy)
                .foregroundColor(textColor)
            
            DSButton(
                buttonText,
                style: .orangeFilled,
                size: .small,
                action: onButtonTap ?? {}
            )
            .frame(maxWidth: orientation == .vertical ? .infinity : nil)
        }
    }
    
    // MARK: - Colors
    
    private var backgroundColor: Color {
        isDark ? TokensSemanticDark.BackgroundContainerColorWhite : TokensSemanticLight.BackgroundContainerColorWhite
    }
    
    private var textColor: Color {
        isDark ? TokensSemanticDark.TextOnSurfaceColorPrimary : TokensSemanticLight.TextOnSurfaceColorPrimary
    }
    
    private var tertiaryTextColor: Color {
        isDark ? TokensSemanticDark.TextOnSurfaceColorTertiary : TokensSemanticLight.TextOnSurfaceColorTertiary
    }
    
    private var badgeBackgroundColor: Color {
        isDark ? TokensSemanticDark.Moonlight100 : TokensSemanticLight.Moonlight100
    }
    
    private var badgeTextColor: Color {
        isDark ? TokensSemanticDark.Moonlight800 : TokensSemanticLight.Moonlight800
    }
    
    private var successColor: Color {
        Color(red: 0.05, green: 0.53, blue: 0.30) // #0d864c
    }
}

// MARK: - Convenience Factory Methods

extension DSContentCard {
    /// Creates a content card with padding
    public static func withPadding(
        title: String,
        subtitle: String? = nil,
        buttonText: String? = nil,
        onTitleAction: (() -> Void)? = nil,
        onButtonTap: (() -> Void)? = nil,
        @ViewBuilder bodyContent: @escaping () -> some View
    ) -> DSContentCard {
        DSContentCard(
            title: title,
            subtitle: subtitle,
            bodyPlacement: .secondWithPadding,
            buttonText: buttonText,
            onTitleAction: onTitleAction,
            onButtonTap: onButtonTap,
            bodyContent: { AnyView(bodyContent()) }
        )
    }
    
    /// Creates a content card with full bleed content
    public static func fullBleed(
        title: String,
        subtitle: String? = nil,
        buttonText: String? = nil,
        onTitleAction: (() -> Void)? = nil,
        onButtonTap: (() -> Void)? = nil,
        bodyContent: @escaping () -> AnyView
    ) -> DSContentCard {
        DSContentCard(
            title: title,
            subtitle: subtitle,
            bodyPlacement: .secondFullBleed,
            buttonText: buttonText,
            onTitleAction: onTitleAction,
            onButtonTap: onButtonTap,
            bodyContent: { AnyView(bodyContent()) }
        )
    }
}

extension DSMiniProductCard {
    /// Creates a horizontal mini product card
    public static func horizontal(
        productName: String,
        price: String,
        brandName: String? = nil,
        sku: String? = nil,
        productImage: Image? = nil,
        buttonText: String = "Add to Cart",
        onButtonTap: (() -> Void)? = nil
    ) -> DSMiniProductCard {
        DSMiniProductCard(
            orientation: .horizontal,
            productImage: productImage,
            sku: sku,
            brandName: brandName,
            productName: productName,
            price: price,
            buttonText: buttonText,
            onButtonTap: onButtonTap
        )
    }
    
    /// Creates a vertical mini product card
    public static func vertical(
        productName: String,
        price: String,
        brandName: String? = nil,
        sku: String? = nil,
        productImage: Image? = nil,
        buttonText: String = "Add to Cart",
        onButtonTap: (() -> Void)? = nil
    ) -> DSMiniProductCard {
        DSMiniProductCard(
            orientation: .vertical,
            productImage: productImage,
            sku: sku,
            brandName: brandName,
            productName: productName,
            price: price,
            buttonText: buttonText,
            onButtonTap: onButtonTap
        )
    }
}
