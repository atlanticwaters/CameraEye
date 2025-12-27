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

        return DSPLPPodResolvedStyle(
            backgroundColorTokenName: DSPLPPodColorHelper.backgroundColorTokenName(),
            borderColorTokenName: DSPLPPodColorHelper.borderColorTokenName(),
            shadowColorTokenName: DSPLPPodColorHelper.shadowColorTokenName(),
            imageContainerStyle: DSPLPPodImageContainerResolvedStyle.create(
                badges: data.badges,
                isSponsored: data.isSponsored,
                swatchDisplay: data.swatchDisplay
            ),
            detailsStyle: DSPLPPodDetailsResolvedStyle.create(
                pricingType: data.pricingType,
                showSpecialBuy: data.showSpecialBuy,
                hasRating: data.ratingInfo != nil,
                hasFulfillment: data.fulfillmentInfo != nil
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
