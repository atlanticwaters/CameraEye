import SwiftUI

// MARK: - DSMiniProductCardBadge

/// Badge configuration for mini product cards.
public struct DSMiniProductCardBadge: Equatable, Sendable {
    public let text: String
    public let color: DSBadgeColor
    public let variant: DSBadgeVariant

    public init(
        text: String,
        color: DSBadgeColor = .brand,
        variant: DSBadgeVariant = .filledStrong
    ) {
        self.text = text
        self.color = color
        self.variant = variant
    }

    // MARK: - Factory Methods

    /// Creates a "Sale" badge.
    public static func sale() -> DSMiniProductCardBadge {
        DSMiniProductCardBadge(text: "Sale", color: .danger, variant: .filledStrong)
    }

    /// Creates a "New" badge.
    public static func new() -> DSMiniProductCardBadge {
        DSMiniProductCardBadge(text: "New", color: .success, variant: .filledStrong)
    }

    /// Creates an "Exclusive" badge.
    public static func exclusive() -> DSMiniProductCardBadge {
        DSMiniProductCardBadge(text: "Exclusive", color: .brand, variant: .filledStrong)
    }

    /// Creates a "Limited" badge.
    public static func limited() -> DSMiniProductCardBadge {
        DSMiniProductCardBadge(text: "Limited", color: .warning, variant: .filledStrong)
    }
}

// MARK: - DSMiniProductCardRating

/// Rating information for mini product cards.
public struct DSMiniProductCardRating: Equatable, Sendable {
    public let rating: Double
    public let reviewCount: Int?

    public init(rating: Double, reviewCount: Int? = nil) {
        self.rating = min(max(rating, 0), 5)
        self.reviewCount = reviewCount
    }
}

// MARK: - DSMiniProductCardPrice

/// Price information for mini product cards.
public enum DSMiniProductCardPrice: Equatable, Sendable {
    /// Standard price display
    case standard(dollars: Int, cents: Int)
    /// Price with original price for comparison (sale)
    case sale(dollars: Int, cents: Int, originalDollars: Int, originalCents: Int)
    /// Price range
    case range(minDollars: Int, minCents: Int, maxDollars: Int, maxCents: Int)
    /// Starting from price
    case startingAt(dollars: Int, cents: Int)

    var formattedPrice: String {
        switch self {
        case let .standard(dollars, cents):
            return "$\(dollars)\(cents > 0 ? String(format: ".%02d", cents) : "")"
        case let .sale(dollars, cents, _, _):
            return "$\(dollars)\(cents > 0 ? String(format: ".%02d", cents) : "")"
        case let .range(minDollars, minCents, maxDollars, maxCents):
            let min = "$\(minDollars)\(minCents > 0 ? String(format: ".%02d", minCents) : "")"
            let max = "$\(maxDollars)\(maxCents > 0 ? String(format: ".%02d", maxCents) : "")"
            return "\(min) - \(max)"
        case let .startingAt(dollars, cents):
            return "$\(dollars)\(cents > 0 ? String(format: ".%02d", cents) : "")"
        }
    }

    var originalPrice: String? {
        switch self {
        case let .sale(_, _, originalDollars, originalCents):
            return "$\(originalDollars)\(originalCents > 0 ? String(format: ".%02d", originalCents) : "")"
        default:
            return nil
        }
    }

    var prefix: String? {
        switch self {
        case .startingAt:
            return "From"
        default:
            return nil
        }
    }
}

// MARK: - DSMiniProductCardData

/// Data model for the mini product card.
public struct DSMiniProductCardData: Equatable, Sendable {
    public let productImage: Image?
    public let productName: String
    public let price: DSMiniProductCardPrice
    public let badge: DSMiniProductCardBadge?
    public let rating: DSMiniProductCardRating?
    public let isSponsored: Bool

    public init(
        productImage: Image? = nil,
        productName: String,
        price: DSMiniProductCardPrice,
        badge: DSMiniProductCardBadge? = nil,
        rating: DSMiniProductCardRating? = nil,
        isSponsored: Bool = false
    ) {
        self.productImage = productImage
        self.productName = productName
        self.price = price
        self.badge = badge
        self.rating = rating
        self.isSponsored = isSponsored
    }
}

// MARK: - DSMiniProductCard

/// A compact product card for displaying products in carousels or grids.
///
/// DSMiniProductCard provides a condensed view of product information including
/// image, name, price, optional badge, and optional rating. It's designed for
/// horizontal scrolling carousels or grid layouts.
///
/// Example usage:
/// ```swift
/// DSMiniProductCard(
///     data: DSMiniProductCardData(
///         productImage: productImage,
///         productName: "DEWALT 20V MAX Drill",
///         price: .sale(dollars: 129, cents: 99, originalDollars: 179, originalCents: 99),
///         badge: .sale(),
///         rating: DSMiniProductCardRating(rating: 4.5, reviewCount: 1234)
///     ),
///     onTap: { print("Product tapped") }
/// )
/// ```
public struct DSMiniProductCard: View {
    // MARK: - Properties

    private let data: DSMiniProductCardData
    private let onTap: (() -> Void)?

    // MARK: - Constants

    private enum Layout {
        static let cardWidth: CGFloat = 140
        static let imageHeight: CGFloat = 140
        static let cornerRadius: CGFloat = 8
        static let contentPadding: CGFloat = 8
        static let spacing: CGFloat = 4
        static let badgeOffset: CGFloat = 8
    }

    // MARK: - Initializers

    public init(
        data: DSMiniProductCardData,
        onTap: (() -> Void)? = nil
    ) {
        self.data = data
        self.onTap = onTap
    }

    // MARK: - Body

    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Image Section
            imageSection

            // Content Section
            contentSection
        }
        .frame(width: Layout.cardWidth)
        .background(DSMiniProductCardColorHelper.backgroundColor())
        .cornerRadius(Layout.cornerRadius)
        .shadow(color: Color.black.opacity(0.08), radius: 4, x: 0, y: 2)
        .contentShape(Rectangle())
        .onTapGesture {
            onTap?()
        }
    }

    // MARK: - Image Section

    @ViewBuilder
    private var imageSection: some View {
        ZStack(alignment: .topLeading) {
            // Product Image
            if let image = data.productImage {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: Layout.cardWidth, height: Layout.imageHeight)
                    .clipped()
            } else {
                Rectangle()
                    .fill(DSMiniProductCardColorHelper.placeholderBackgroundColor())
                    .frame(width: Layout.cardWidth, height: Layout.imageHeight)
            }

            // Badge overlay
            if let badge = data.badge {
                DSBadge(
                    badge.text,
                    size: .small,
                    variant: badge.variant,
                    color: badge.color
                )
                .padding(Layout.badgeOffset)
            }

            // Sponsored indicator
            if data.isSponsored {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Text("Sponsored")
                            .font(.system(size: 10, weight: .regular))
                            .foregroundStyle(DSMiniProductCardColorHelper.sponsoredTextColor())
                            .padding(.horizontal, 4)
                            .padding(.vertical, 2)
                            .background(
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(DSMiniProductCardColorHelper.sponsoredBackgroundColor())
                            )
                            .padding(4)
                    }
                }
                .frame(width: Layout.cardWidth, height: Layout.imageHeight)
            }
        }
    }

    // MARK: - Content Section

    @ViewBuilder
    private var contentSection: some View {
        VStack(alignment: .leading, spacing: Layout.spacing) {
            // Product Name
            Text(data.productName)
                .font(.system(size: 12, weight: .regular))
                .foregroundStyle(DSMiniProductCardColorHelper.productNameColor())
                .lineLimit(2)
                .multilineTextAlignment(.leading)

            // Price Section
            priceSection

            // Rating Section
            if let rating = data.rating {
                ratingSection(rating: rating)
            }
        }
        .padding(Layout.contentPadding)
    }

    // MARK: - Price Section

    @ViewBuilder
    private var priceSection: some View {
        VStack(alignment: .leading, spacing: 2) {
            // Price prefix (e.g., "From")
            if let prefix = data.price.prefix {
                Text(prefix)
                    .font(.system(size: 10, weight: .regular))
                    .foregroundStyle(DSMiniProductCardColorHelper.priceSecondaryColor())
            }

            HStack(alignment: .firstTextBaseline, spacing: 4) {
                // Current price
                Text(data.price.formattedPrice)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(priceColor)

                // Original price (strikethrough for sale)
                if let originalPrice = data.price.originalPrice {
                    Text(originalPrice)
                        .font(.system(size: 11, weight: .regular))
                        .foregroundStyle(DSMiniProductCardColorHelper.priceSecondaryColor())
                        .strikethrough()
                }
            }
        }
    }

    private var priceColor: Color {
        switch data.price {
        case .sale:
            return DSMiniProductCardColorHelper.salePriceColor()
        default:
            return DSMiniProductCardColorHelper.priceColor()
        }
    }

    // MARK: - Rating Section

    @ViewBuilder
    private func ratingSection(rating: DSMiniProductCardRating) -> some View {
        DSRatingMeter(
            rating: rating.rating,
            reviewCount: rating.reviewCount,
            size: .small,
            showLabel: rating.reviewCount != nil
        )
    }
}
