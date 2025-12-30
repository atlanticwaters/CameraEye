import SwiftUI

// MARK: - DSPLPPodResolvedStyle

/// Resolved style information for DSPLPPod testing.
///
/// This struct captures computed styles as concrete values using token names,
/// enabling unit tests without view rendering or environment dependencies.
/// Since DSPLPPod is a composite component, it aggregates resolved styles
/// from its sub-components.
public struct DSPLPPodResolvedStyle: Equatable, Sendable {
    // MARK: - Container

    public let backgroundColorTokenName: String
    public let borderColorTokenName: String
    public let shadowColorTokenName: String

    // MARK: - Sub-component Styles

    public let imageContainerStyle: DSPLPPodImageContainerResolvedStyle
    public let detailsStyle: DSPLPPodDetailsResolvedStyle
    public let buttonSetStyle: DSPLPPodButtonSetResolvedStyle

    // MARK: - Data

    public let variant: DSPLPPodVariant

    // MARK: - Initializer

    public init(
        backgroundColorTokenName: String,
        borderColorTokenName: String,
        shadowColorTokenName: String,
        imageContainerStyle: DSPLPPodImageContainerResolvedStyle,
        detailsStyle: DSPLPPodDetailsResolvedStyle,
        buttonSetStyle: DSPLPPodButtonSetResolvedStyle,
        variant: DSPLPPodVariant
    ) {
        self.backgroundColorTokenName = backgroundColorTokenName
        self.borderColorTokenName = borderColorTokenName
        self.shadowColorTokenName = shadowColorTokenName
        self.imageContainerStyle = imageContainerStyle
        self.detailsStyle = detailsStyle
        self.buttonSetStyle = buttonSetStyle
        self.variant = variant
    }

    // MARK: - Factory

    /// Creates a resolved style for the given configuration.
    public static func create(
        variant: DSPLPPodVariant,
        data: DSPLPPodData
    ) -> DSPLPPodResolvedStyle {
        let buttonSetVariant: DSPLPPodButtonSetVariant = variant == .b2c ? .b2c : .b2b
        
        // Extract badge color from first badge, default to neutral if none
        let badgeColor: DSPLPPodBadge.BadgeColor = data.badges.first?.color ?? .neutral
        
        // Determine if swatches are present based on swatchDisplay
        let hasSwatches: Bool = {
            switch data.swatchDisplay {
            case .swatchesWithQuantity, .swatchesOnly, .swatchError:
                return true
            case .moreOptionsAvailable, .customOptions, .none:
                return false
            }
        }()

        return DSPLPPodResolvedStyle(
            backgroundColorTokenName: DSPLPPodColorHelper.backgroundColorTokenName(),
            borderColorTokenName: DSPLPPodColorHelper.borderColorTokenName(),
            shadowColorTokenName: DSPLPPodColorHelper.shadowColorTokenName(),
            imageContainerStyle: DSPLPPodImageContainerResolvedStyle.create(
                badgeColor: badgeColor,
                badgeCount: data.badges.count,
                isSponsored: data.isSponsored,
                hasSwatches: hasSwatches
            ),
            detailsStyle: DSPLPPodDetailsResolvedStyle.create(
                hasModelNumber: data.modelNumber != nil,
                hasRating: data.ratingInfo != nil,
                hasFulfillment: data.fulfillmentInfo != nil,
                showSpecialBuy: data.showSpecialBuy
            ),
            buttonSetStyle: DSPLPPodButtonSetResolvedStyle.create(
                variant: buttonSetVariant,
                quantity: data.quantity,
                isAddToCartEnabled: data.isAddToCartEnabled,
                isAddToListEnabled: data.isAddToListEnabled
            ),
            variant: variant
        )
    }
}
