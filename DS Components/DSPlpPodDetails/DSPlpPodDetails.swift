import SwiftUI

// MARK: - DSPLPPodPricingType

/// The type of pricing display for the PLP Pod.
public enum DSPLPPodPricingType: Equatable, Sendable {
    /// Standard price display with dollars and cents
    case standard(dollars: Int, cents: Int, perUnit: String?)

    /// Starting at price (e.g., "Starting at $99.99")
    case startingAt(dollars: Int, cents: Int)

    /// Price with original price and savings
    case withSavings(dollars: Int, cents: Int, originalPrice: Double, savings: String, perUnit: String?)

    /// Price with rebate information
    case withRebate(dollars: Int, cents: Int, rebateText: String)

    /// See lower price in cart
    case lowerPriceInCart

    /// Contact store for price (TREX pricing)
    case contactStore

    /// Special order with phone number
    case specialOrder(headerText: String, bodyText: String, phoneNumber: String)

    /// BRIO / consultation pricing
    case consultation(text: String, subtitle: String)

    /// MAP pricing with see lower price text
    case mapPricing(dollars: Int, cents: Int, seeLowerPriceText: String?, rebateText: String?)
}

// MARK: - DSPLPPodFulfillmentInfo

/// Fulfillment information for the PLP Pod.
public struct DSPLPPodFulfillmentInfo: Equatable, Sendable {
    public let pickup: PickupInfo?
    public let delivery: DeliveryInfo?
    public let fasterDelivery: FasterDeliveryInfo?

    public struct PickupInfo: Equatable, Sendable {
        public let primaryText: String
        public let locationText: String?

        public init(primaryText: String, locationText: String? = nil) {
            self.primaryText = primaryText
            self.locationText = locationText
        }
    }

    public struct DeliveryInfo: Equatable, Sendable {
        public let primaryText: String
        public let dateText: String?
        public let isUnavailable: Bool

        public init(primaryText: String, dateText: String? = nil, isUnavailable: Bool = false) {
            self.primaryText = primaryText
            self.dateText = dateText
            self.isUnavailable = isUnavailable
        }
    }

    public struct FasterDeliveryInfo: Equatable, Sendable {
        public let primaryText: String
        public let timeText: String

        public init(primaryText: String, timeText: String) {
            self.primaryText = primaryText
            self.timeText = timeText
        }
    }

    public init(
        pickup: PickupInfo? = nil,
        delivery: DeliveryInfo? = nil,
        fasterDelivery: FasterDeliveryInfo? = nil
    ) {
        self.pickup = pickup
        self.delivery = delivery
        self.fasterDelivery = fasterDelivery
    }
}

// MARK: - DSPLPPodRatingInfo

/// Rating information for the PLP Pod.
public struct DSPLPPodRatingInfo: Equatable, Sendable {
    public let rating: Double
    public let reviewCount: Int

    public init(rating: Double, reviewCount: Int) {
        self.rating = rating
        self.reviewCount = reviewCount
    }
}

// MARK: - DSPLPPodDetails

/// A component for displaying product details in a PLP (Product Listing Page) pod.
///
/// DSPLPPodDetails displays product name, model number, pricing information,
/// ratings, and fulfillment options. This component supports various pricing
/// types including standard, starting at, rebates, MAP pricing, and more.
///
/// Example usage:
/// ```swift
/// DSPLPPodDetails(
///     productName: "DEWALT 20V MAX Cordless Drill",
///     modelNumber: "DCD791D2",
///     pricingType: .withSavings(
///         dollars: 149,
///         cents: 99,
///         originalPrice: 199.99,
///         savings: "Save $50.00",
///         perUnit: "/each"
///     ),
///     showSpecialBuy: true,
///     ratingInfo: DSPLPPodRatingInfo(rating: 4.5, reviewCount: 1234),
///     fulfillmentInfo: DSPLPPodFulfillmentInfo(
///         pickup: .init(primaryText: "Free Pickup Today", locationText: "at Atlanta Midtown"),
///         delivery: .init(primaryText: "Delivery: Free", dateText: "Tomorrow")
///     )
/// )
/// ```
public struct DSPLPPodDetails: View {
    // MARK: - Properties

    private let productName: String
    private let modelNumber: String?
    private let pricingType: DSPLPPodPricingType
    private let showSpecialBuy: Bool
    private let perItemPriceDetail: String?
    private let ratingInfo: DSPLPPodRatingInfo?
    private let fulfillmentInfo: DSPLPPodFulfillmentInfo?
    private let onRatingsTap: (() -> Void)?
    private let onProductTap: (() -> Void)?

    // MARK: - Initializers

    public init(
        productName: String,
        modelNumber: String? = nil,
        pricingType: DSPLPPodPricingType,
        showSpecialBuy: Bool = false,
        perItemPriceDetail: String? = nil,
        ratingInfo: DSPLPPodRatingInfo? = nil,
        fulfillmentInfo: DSPLPPodFulfillmentInfo? = nil,
        onRatingsTap: (() -> Void)? = nil,
        onProductTap: (() -> Void)? = nil
    ) {
        self.productName = productName
        self.modelNumber = modelNumber
        self.pricingType = pricingType
        self.showSpecialBuy = showSpecialBuy
        self.perItemPriceDetail = perItemPriceDetail
        self.ratingInfo = ratingInfo
        self.fulfillmentInfo = fulfillmentInfo
        self.onRatingsTap = onRatingsTap
        self.onProductTap = onProductTap
    }

    // MARK: - Body

    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Details Container
            detailsSection

            // Pricing Container
            pricingSection
                .padding(.top, 8)

            // Rating Section
            if let rating = ratingInfo {
                ratingSection(rating: rating)
                    .padding(.top, 8)
            }

            // Fulfillment Container
            if let fulfillment = fulfillmentInfo {
                fulfillmentSection(fulfillment: fulfillment)
                    .padding(.top, 12)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    // MARK: - Details Section

    @ViewBuilder
    private var detailsSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            // Product Name
            Button(action: { onProductTap?() }) {
                Text(productName)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(DSPLPPodDetailsColorHelper.productNameColor())
                    .lineLimit(3)
                    .multilineTextAlignment(.leading)
            }
            .buttonStyle(.plain)

            // Model Number
            if let model = modelNumber {
                Text("Model# \(model)")
                    .font(.system(size: 12))
                    .foregroundStyle(DSPLPPodDetailsColorHelper.modelNumberColor())
            }
        }
    }

    // MARK: - Pricing Section

    @ViewBuilder
    private var pricingSection: some View {
        switch pricingType {
        case .standard(let dollars, let cents, let perUnit):
            standardPriceView(dollars: dollars, cents: cents, perUnit: perUnit)

        case .startingAt(let dollars, let cents):
            startingAtPriceView(dollars: dollars, cents: cents)

        case .withSavings(let dollars, let cents, let originalPrice, let savings, let perUnit):
            savingsPriceView(dollars: dollars, cents: cents, originalPrice: originalPrice, savings: savings, perUnit: perUnit)

        case .withRebate(let dollars, let cents, let rebateText):
            rebatePriceView(dollars: dollars, cents: cents, rebateText: rebateText)

        case .lowerPriceInCart:
            lowerPriceInCartView

        case .contactStore:
            contactStoreView

        case .specialOrder(let headerText, let bodyText, let phoneNumber):
            specialOrderView(headerText: headerText, bodyText: bodyText, phoneNumber: phoneNumber)

        case .consultation(let text, let subtitle):
            consultationView(text: text, subtitle: subtitle)

        case .mapPricing(let dollars, let cents, let seeLowerPriceText, let rebateText):
            mapPricingView(dollars: dollars, cents: cents, seeLowerPriceText: seeLowerPriceText, rebateText: rebateText)
        }
    }

    @ViewBuilder
    private func standardPriceView(dollars: Int, cents: Int, perUnit: String?) -> some View {
        HStack(alignment: .top, spacing: 0) {
            if showSpecialBuy {
                specialBuyBadge
                    .padding(.trailing, 4)
            }

            priceDisplay(dollars: dollars, cents: cents)

            if let unit = perUnit {
                Text(unit)
                    .font(.system(size: 12))
                    .foregroundStyle(DSPLPPodDetailsColorHelper.perUnitColor())
                    .padding(.leading, 2)
            }
        }

        if let detail = perItemPriceDetail {
            Text(detail)
                .font(.system(size: 12))
                .foregroundStyle(DSPLPPodDetailsColorHelper.perItemDetailColor())
        }
    }

    @ViewBuilder
    private func startingAtPriceView(dollars: Int, cents: Int) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            Text("Starting at")
                .font(.system(size: 12))
                .foregroundStyle(DSPLPPodDetailsColorHelper.startingAtLabelColor())

            priceDisplay(dollars: dollars, cents: cents)
        }
    }

    @ViewBuilder
    private func savingsPriceView(dollars: Int, cents: Int, originalPrice: Double, savings: String, perUnit: String?) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(alignment: .top, spacing: 0) {
                if showSpecialBuy {
                    specialBuyBadge
                        .padding(.trailing, 4)
                }

                priceDisplay(dollars: dollars, cents: cents)

                if let unit = perUnit {
                    Text(unit)
                        .font(.system(size: 12))
                        .foregroundStyle(DSPLPPodDetailsColorHelper.perUnitColor())
                        .padding(.leading, 2)
                }
            }

            if let detail = perItemPriceDetail {
                Text(detail)
                    .font(.system(size: 12))
                    .foregroundStyle(DSPLPPodDetailsColorHelper.perItemDetailColor())
            }

            // Original price and savings
            HStack(spacing: 8) {
                Text("Was $\(String(format: "%.2f", originalPrice))")
                    .font(.system(size: 12))
                    .strikethrough()
                    .foregroundStyle(DSPLPPodDetailsColorHelper.originalPriceColor())

                Text(savings)
                    .font(.system(size: 12, weight: .semibold))
                    .foregroundStyle(DSPLPPodDetailsColorHelper.savingsColor())
            }
        }
    }

    @ViewBuilder
    private func rebatePriceView(dollars: Int, cents: Int, rebateText: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            priceDisplay(dollars: dollars, cents: cents)

            Text(rebateText)
                .font(.system(size: 12))
                .foregroundStyle(DSPLPPodDetailsColorHelper.rebateTextColor())
        }
    }

    @ViewBuilder
    private var lowerPriceInCartView: some View {
        Text("See Lower Price in Cart")
            .font(.system(size: 14, weight: .semibold))
            .foregroundStyle(DSPLPPodDetailsColorHelper.lowerPriceTextColor())
    }

    @ViewBuilder
    private var contactStoreView: some View {
        Text("Contact your local store for price")
            .font(.system(size: 14))
            .foregroundStyle(DSPLPPodDetailsColorHelper.contactStoreTextColor())
            .lineLimit(2)
    }

    @ViewBuilder
    private func specialOrderView(headerText: String, bodyText: String, phoneNumber: String) -> some View {
        HStack(alignment: .top, spacing: 8) {
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: 16))
                .foregroundStyle(DSPLPPodDetailsColorHelper.warningIconColor())

            VStack(alignment: .leading, spacing: 4) {
                Text(headerText)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(DSPLPPodDetailsColorHelper.specialOrderHeaderColor())

                Text(bodyText)
                    .font(.system(size: 12))
                    .foregroundStyle(DSPLPPodDetailsColorHelper.specialOrderBodyColor())
                    .lineLimit(3)

                Text(phoneNumber)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundStyle(DSPLPPodDetailsColorHelper.phoneNumberColor())
            }
        }
    }

    @ViewBuilder
    private func consultationView(text: String, subtitle: String) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(text)
                .font(.system(size: 14))
                .foregroundStyle(DSPLPPodDetailsColorHelper.consultationTextColor())
                .lineLimit(2)

            Text(subtitle)
                .font(.system(size: 12))
                .foregroundStyle(DSPLPPodDetailsColorHelper.consultationSubtitleColor())
        }
    }

    @ViewBuilder
    private func mapPricingView(dollars: Int, cents: Int, seeLowerPriceText: String?, rebateText: String?) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            priceDisplay(dollars: dollars, cents: cents)

            if let lowerPrice = seeLowerPriceText {
                Text(lowerPrice)
                    .font(.system(size: 11))
                    .foregroundStyle(DSPLPPodDetailsColorHelper.seeLowerPriceColor())
            }

            if let rebate = rebateText {
                Text(rebate)
                    .font(.system(size: 12))
                    .foregroundStyle(DSPLPPodDetailsColorHelper.rebateTextColor())
            }
        }
    }

    // MARK: - Price Display Helper

    @ViewBuilder
    private func priceDisplay(dollars: Int, cents: Int) -> some View {
        HStack(alignment: .top, spacing: 0) {
            Text("$")
                .font(.system(size: 12, weight: .bold))
                .foregroundStyle(DSPLPPodDetailsColorHelper.priceColor())

            Text("\(dollars)")
                .font(.system(size: 20, weight: .bold))
                .foregroundStyle(DSPLPPodDetailsColorHelper.priceColor())

            Text(String(format: "%02d", cents))
                .font(.system(size: 12, weight: .bold))
                .foregroundStyle(DSPLPPodDetailsColorHelper.priceColor())
        }
    }

    // MARK: - Special Buy Badge

    @ViewBuilder
    private var specialBuyBadge: some View {
        Image(systemName: "tag.fill")
            .font(.system(size: 20))
            .foregroundStyle(DSPLPPodDetailsColorHelper.specialBuyColor())
    }

    // MARK: - Rating Section

    @ViewBuilder
    private func ratingSection(rating: DSPLPPodRatingInfo) -> some View {
        Button(action: { onRatingsTap?() }) {
            DSRatingMeter(
                rating: rating.rating,
                reviewCount: rating.reviewCount,
                size: .small
            )
        }
        .buttonStyle(.plain)
    }

    // MARK: - Fulfillment Section

    @ViewBuilder
    private func fulfillmentSection(fulfillment: DSPLPPodFulfillmentInfo) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            // Pickup
            if let pickup = fulfillment.pickup {
                fulfillmentRow(
                    primaryText: pickup.primaryText,
                    secondaryText: pickup.locationText,
                    isUnavailable: false
                )
            }

            // Delivery
            if let delivery = fulfillment.delivery {
                fulfillmentRow(
                    primaryText: delivery.primaryText,
                    secondaryText: delivery.dateText,
                    isUnavailable: delivery.isUnavailable
                )
            }

            // Faster Delivery
            if let faster = fulfillment.fasterDelivery {
                fulfillmentRow(
                    primaryText: faster.primaryText,
                    secondaryText: faster.timeText,
                    isUnavailable: false
                )
            }
        }
    }

    @ViewBuilder
    private func fulfillmentRow(primaryText: String, secondaryText: String?, isUnavailable: Bool) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            HStack(spacing: 4) {
                if isUnavailable {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 14))
                        .foregroundStyle(DSPLPPodDetailsColorHelper.unavailableIconColor())
                }

                Text(primaryText)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(
                        isUnavailable
                            ? DSPLPPodDetailsColorHelper.unavailableTextColor()
                            : DSPLPPodDetailsColorHelper.fulfillmentPrimaryColor()
                    )
            }

            if let secondary = secondaryText {
                Text(secondary)
                    .font(.system(size: 11))
                    .foregroundStyle(DSPLPPodDetailsColorHelper.fulfillmentSecondaryColor())
            }
        }
    }
}
