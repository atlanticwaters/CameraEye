import SwiftUI

// MARK: - DSPLPPodBadge

/// Badge information for the PLP Pod Image Container.
public struct DSPLPPodBadge: Equatable, Sendable, Identifiable {
    public let id: String
    public let text: String
    public let color: BadgeColor

    public enum BadgeColor: Sendable {
        case info
        case success
        case warning
        case error
        case neutral
    }

    public init(id: String = UUID().uuidString, text: String, color: BadgeColor = .info) {
        self.id = id
        self.text = text
        self.color = color
    }

    public static func exclusive() -> DSPLPPodBadge {
        DSPLPPodBadge(text: "Exclusive", color: .info)
    }

    public static func christmasDelivery() -> DSPLPPodBadge {
        DSPLPPodBadge(text: "Get it by Christmas", color: .success)
    }

    public static func specialSavings() -> DSPLPPodBadge {
        DSPLPPodBadge(text: "Special Savings", color: .warning)
    }

    public static func newArrival() -> DSPLPPodBadge {
        DSPLPPodBadge(text: "New Arrival", color: .info)
    }

    public static func topRated() -> DSPLPPodBadge {
        DSPLPPodBadge(text: "Top Rated", color: .success)
    }
}

// MARK: - DSPLPPodSwatch

/// Swatch information for the PLP Pod Image Container.
public struct DSPLPPodSwatch: Equatable, Sendable, Identifiable {
    public let id: String
    public let image: Image?
    public let color: Color?

    public init(id: String = UUID().uuidString, image: Image? = nil, color: Color? = nil) {
        self.id = id
        self.image = image
        self.color = color
    }
}

// MARK: - DSPLPPodSwatchDisplay

/// How to display swatches in the PLP Pod Image Container.
public enum DSPLPPodSwatchDisplay: Equatable, Sendable {
    /// Show swatches with quantity count (e.g., "+5")
    case swatchesWithQuantity(swatches: [DSPLPPodSwatch], additionalCount: Int)
    /// Show swatches only without quantity
    case swatchesOnly(swatches: [DSPLPPodSwatch])
    /// Show "More Options Available" text
    case moreOptionsAvailable
    /// Show custom swatch options text (e.g., "3 Sizes, 5 Colors")
    case customOptions(text: String)
    /// Show swatch error state
    case swatchError(swatches: [DSPLPPodSwatch], errorMessage: String)
    /// No swatches
    case none
}

// MARK: - DSPLPPodImageContainer

/// A container component for displaying product images in a PLP (Product Listing Page) pod.
///
/// DSPLPPodImageContainer displays a product image with optional badges, sponsored tag,
/// and various swatch display options. This component is designed for use in product
/// listing grids.
///
/// Example usage:
/// ```swift
/// DSPLPPodImageContainer(
///     image: productImage,
///     badges: [.exclusive(), .christmasDelivery()],
///     isSponsored: true,
///     swatchDisplay: .swatchesWithQuantity(
///         swatches: productSwatches,
///         additionalCount: 5
///     )
/// )
/// ```
public struct DSPLPPodImageContainer: View {
    // MARK: - Properties

    private let image: Image?
    private let badges: [DSPLPPodBadge]
    private let isSponsored: Bool
    private let swatchDisplay: DSPLPPodSwatchDisplay
    private let onImageTap: (() -> Void)?
    private let onSwatchTap: ((DSPLPPodSwatch) -> Void)?

    // MARK: - Constants

    private enum Layout {
        static let containerWidth: CGFloat = 145
        static let heroImageSize: CGFloat = 144
        static let badgeSpacing: CGFloat = 4
        static let badgePadding: CGFloat = 4
        static let swatchSize: CGFloat = 26
        static let swatchInnerSize: CGFloat = 22
        static let swatchSpacing: CGFloat = 4
        static let cornerRadius: CGFloat = 8
    }

    // MARK: - Initializers

    public init(
        image: Image? = nil,
        badges: [DSPLPPodBadge] = [],
        isSponsored: Bool = false,
        swatchDisplay: DSPLPPodSwatchDisplay = .none,
        onImageTap: (() -> Void)? = nil,
        onSwatchTap: ((DSPLPPodSwatch) -> Void)? = nil
    ) {
        self.image = image
        self.badges = badges
        self.isSponsored = isSponsored
        self.swatchDisplay = swatchDisplay
        self.onImageTap = onImageTap
        self.onSwatchTap = onSwatchTap
    }

    // MARK: - Body

    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Content container
            VStack(alignment: .leading, spacing: 0) {
                // Badges section
                if !badges.isEmpty {
                    badgesSection
                        .padding(.bottom, Layout.badgeSpacing)
                }

                // Hero Image section
                heroImageSection

                // Swatches section
                swatchesSection
            }
            .padding(Layout.badgePadding)
            .background(DSPLPPodImageContainerColorHelper.contentBackgroundColor())
            .cornerRadius(Layout.cornerRadius)
        }
        .frame(width: Layout.containerWidth)
        .background(DSPLPPodImageContainerColorHelper.backgroundColor())
    }

    // MARK: - Badges Section

    @ViewBuilder
    private var badgesSection: some View {
        FlowLayout(spacing: Layout.badgeSpacing) {
            ForEach(badges) { badge in
                badgeView(badge)
            }
        }
    }

    @ViewBuilder
    private func badgeView(_ badge: DSPLPPodBadge) -> some View {
        Text(badge.text)
            .font(.system(size: 12, weight: .bold))
            .foregroundColor(badgeTextColor(for: badge.color))
            .padding(.horizontal, Layout.badgePadding)
            .padding(.vertical, 2)
            .background(badgeBackgroundColor(for: badge.color))
            .cornerRadius(6)
    }

    private func badgeTextColor(for color: DSPLPPodBadge.BadgeColor) -> Color {
        switch color {
        case .info:
            return DSPLPPodImageContainerColorHelper.badgeInfoTextColor()
        case .success:
            return DSPLPPodImageContainerColorHelper.badgeSuccessTextColor()
        case .warning:
            return DSPLPPodImageContainerColorHelper.badgeWarningTextColor()
        case .error:
            return DSPLPPodImageContainerColorHelper.badgeErrorTextColor()
        case .neutral:
            return DSPLPPodImageContainerColorHelper.badgeNeutralTextColor()
        }
    }

    private func badgeBackgroundColor(for color: DSPLPPodBadge.BadgeColor) -> Color {
        switch color {
        case .info:
            return DSPLPPodImageContainerColorHelper.badgeInfoBackgroundColor()
        case .success:
            return DSPLPPodImageContainerColorHelper.badgeSuccessBackgroundColor()
        case .warning:
            return DSPLPPodImageContainerColorHelper.badgeWarningBackgroundColor()
        case .error:
            return DSPLPPodImageContainerColorHelper.badgeErrorBackgroundColor()
        case .neutral:
            return DSPLPPodImageContainerColorHelper.badgeNeutralBackgroundColor()
        }
    }

    // MARK: - Hero Image Section

    @ViewBuilder
    private var heroImageSection: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Product image
            Button(action: { onImageTap?() }) {
                if let image = image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: Layout.heroImageSize, height: Layout.heroImageSize)
                } else {
                    DSImageContainer(size: .medium)
                        .frame(width: Layout.heroImageSize, height: Layout.heroImageSize)
                }
            }
            .buttonStyle(.plain)

            // Sponsored tag
            if isSponsored {
                Text("Sponsored")
                    .font(.system(size: 11))
                    .foregroundColor(DSPLPPodImageContainerColorHelper.sponsoredTextColor())
                    .padding(.top, 4)
            }
        }
    }

    // MARK: - Swatches Section

    @ViewBuilder
    private var swatchesSection: some View {
        switch swatchDisplay {
        case .swatchesWithQuantity(let swatches, let additionalCount):
            swatchesWithQuantityView(swatches: swatches, additionalCount: additionalCount)
                .padding(.top, 8)

        case .swatchesOnly(let swatches):
            swatchesOnlyView(swatches: swatches)
                .padding(.top, 8)

        case .moreOptionsAvailable:
            moreOptionsView
                .padding(.top, 8)

        case .customOptions(let text):
            customOptionsView(text: text)
                .padding(.top, 8)

        case .swatchError(let swatches, let errorMessage):
            swatchErrorView(swatches: swatches, errorMessage: errorMessage)
                .padding(.top, 8)

        case .none:
            EmptyView()
        }
    }

    @ViewBuilder
    private func swatchesWithQuantityView(swatches: [DSPLPPodSwatch], additionalCount: Int) -> some View {
        HStack(spacing: Layout.swatchSpacing) {
            swatchRowView(swatches: swatches)

            if additionalCount > 0 {
                Text("+\(additionalCount)")
                    .font(.system(size: 12))
                    .foregroundColor(DSPLPPodImageContainerColorHelper.swatchCountTextColor())
            }
        }
    }

    @ViewBuilder
    private func swatchesOnlyView(swatches: [DSPLPPodSwatch]) -> some View {
        swatchRowView(swatches: swatches)
    }

    @ViewBuilder
    private func swatchRowView(swatches: [DSPLPPodSwatch]) -> some View {
        HStack(spacing: Layout.swatchSpacing) {
            ForEach(Array(swatches.prefix(3).enumerated()), id: \.element.id) { index, swatch in
                swatchView(swatch: swatch, isSelected: index == 0)
            }
        }
    }

    @ViewBuilder
    private func swatchView(swatch: DSPLPPodSwatch, isSelected: Bool) -> some View {
        Button(action: { onSwatchTap?(swatch) }) {
            ZStack {
                // Outer container (selection indicator)
                RoundedRectangle(cornerRadius: 4)
                    .stroke(
                        isSelected
                            ? DSPLPPodImageContainerColorHelper.swatchSelectedBorderColor()
                            : DSPLPPodImageContainerColorHelper.swatchUnselectedBorderColor(),
                        lineWidth: isSelected ? 2 : 1
                    )
                    .frame(width: Layout.swatchSize, height: Layout.swatchSize)

                // Inner swatch content
                if let image = swatch.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: Layout.swatchInnerSize, height: Layout.swatchInnerSize)
                        .clipShape(RoundedRectangle(cornerRadius: 2))
                } else if let color = swatch.color {
                    RoundedRectangle(cornerRadius: 2)
                        .fill(color)
                        .frame(width: Layout.swatchInnerSize, height: Layout.swatchInnerSize)
                } else {
                    RoundedRectangle(cornerRadius: 2)
                        .fill(DSPLPPodImageContainerColorHelper.swatchPlaceholderColor())
                        .frame(width: Layout.swatchInnerSize, height: Layout.swatchInnerSize)
                }
            }
        }
        .buttonStyle(.plain)
    }

    @ViewBuilder
    private var moreOptionsView: some View {
        Text("More Options Available")
            .font(.system(size: 12))
            .foregroundColor(DSPLPPodImageContainerColorHelper.moreOptionsTextColor())
    }

    @ViewBuilder
    private func customOptionsView(text: String) -> some View {
        Text(text)
            .font(.system(size: 12))
            .foregroundColor(DSPLPPodImageContainerColorHelper.customOptionsTextColor())
            .lineLimit(2)
    }

    @ViewBuilder
    private func swatchErrorView(swatches: [DSPLPPodSwatch], errorMessage: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            swatchRowView(swatches: swatches)

            Text(errorMessage)
                .font(.system(size: 12))
                .foregroundColor(DSPLPPodImageContainerColorHelper.swatchErrorTextColor())
                .lineLimit(2)
        }
    }
}

// MARK: - FlowLayout Helper

/// A simple flow layout for wrapping badges
private struct FlowLayout: Layout {
    var spacing: CGFloat

    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let result = arrangeSubviews(proposal: proposal, subviews: subviews)
        return result.size
    }

    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let result = arrangeSubviews(proposal: proposal, subviews: subviews)

        for (index, placement) in result.placements.enumerated() {
            subviews[index].place(
                at: CGPoint(x: bounds.minX + placement.x, y: bounds.minY + placement.y),
                proposal: ProposedViewSize(placement.size)
            )
        }
    }

    private func arrangeSubviews(proposal: ProposedViewSize, subviews: Subviews) -> (size: CGSize, placements: [(x: CGFloat, y: CGFloat, size: CGSize)]) {
        let maxWidth = proposal.width ?? .infinity

        var placements: [(x: CGFloat, y: CGFloat, size: CGSize)] = []
        var currentX: CGFloat = 0
        var currentY: CGFloat = 0
        var lineHeight: CGFloat = 0
        var totalHeight: CGFloat = 0

        for subview in subviews {
            let size = subview.sizeThatFits(.unspecified)

            if currentX + size.width > maxWidth && currentX > 0 {
                currentX = 0
                currentY += lineHeight + spacing
                lineHeight = 0
            }

            placements.append((x: currentX, y: currentY, size: size))
            currentX += size.width + spacing
            lineHeight = max(lineHeight, size.height)
            totalHeight = currentY + lineHeight
        }

        return (
            size: CGSize(width: maxWidth, height: totalHeight),
            placements: placements
        )
    }
}
