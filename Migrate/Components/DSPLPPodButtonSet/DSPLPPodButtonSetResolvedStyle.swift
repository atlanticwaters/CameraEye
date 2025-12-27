import SwiftUI

// MARK: - DSPLPPodButtonSetResolvedStyle

/// Resolved style information for DSPLPPodButtonSet testing.
///
/// This struct captures computed styles as concrete values using token names,
/// enabling unit tests without view rendering or environment dependencies.
public struct DSPLPPodButtonSetResolvedStyle: Equatable, Sendable {
    // MARK: - Quantity Picker

    public let quantityPickerBackgroundColorTokenName: String
    public let quantityButtonBackgroundColorTokenName: String
    public let quantityButtonIconColorTokenName: String
    public let quantityTextColorTokenName: String

    // MARK: - Add to Cart

    public let addToCartBackgroundColorTokenName: String
    public let addToCartTextColorTokenName: String

    // MARK: - Add to List

    public let addToListBackgroundColorTokenName: String
    public let addToListTextColorTokenName: String
    public let addToListBorderColorTokenName: String

    // MARK: - Data

    public let variant: DSPLPPodButtonSetVariant
    public let quantity: Int
    public let isAddToCartEnabled: Bool
    public let isAddToListEnabled: Bool

    // MARK: - Initializer

    public init(
        quantityPickerBackgroundColorTokenName: String,
        quantityButtonBackgroundColorTokenName: String,
        quantityButtonIconColorTokenName: String,
        quantityTextColorTokenName: String,
        addToCartBackgroundColorTokenName: String,
        addToCartTextColorTokenName: String,
        addToListBackgroundColorTokenName: String,
        addToListTextColorTokenName: String,
        addToListBorderColorTokenName: String,
        variant: DSPLPPodButtonSetVariant,
        quantity: Int,
        isAddToCartEnabled: Bool,
        isAddToListEnabled: Bool
    ) {
        self.quantityPickerBackgroundColorTokenName = quantityPickerBackgroundColorTokenName
        self.quantityButtonBackgroundColorTokenName = quantityButtonBackgroundColorTokenName
        self.quantityButtonIconColorTokenName = quantityButtonIconColorTokenName
        self.quantityTextColorTokenName = quantityTextColorTokenName
        self.addToCartBackgroundColorTokenName = addToCartBackgroundColorTokenName
        self.addToCartTextColorTokenName = addToCartTextColorTokenName
        self.addToListBackgroundColorTokenName = addToListBackgroundColorTokenName
        self.addToListTextColorTokenName = addToListTextColorTokenName
        self.addToListBorderColorTokenName = addToListBorderColorTokenName
        self.variant = variant
        self.quantity = quantity
        self.isAddToCartEnabled = isAddToCartEnabled
        self.isAddToListEnabled = isAddToListEnabled
    }

    // MARK: - Factory

    /// Creates a resolved style for the given configuration.
    public static func create(
        variant: DSPLPPodButtonSetVariant,
        quantity: Int,
        isAddToCartEnabled: Bool,
        isAddToListEnabled: Bool
    ) -> DSPLPPodButtonSetResolvedStyle {
        return DSPLPPodButtonSetResolvedStyle(
            quantityPickerBackgroundColorTokenName: DSPLPPodButtonSetColorHelper.quantityPickerBackgroundColorTokenName(),
            quantityButtonBackgroundColorTokenName: DSPLPPodButtonSetColorHelper.quantityButtonBackgroundColorTokenName(),
            quantityButtonIconColorTokenName: DSPLPPodButtonSetColorHelper.quantityButtonIconColorTokenName(),
            quantityTextColorTokenName: DSPLPPodButtonSetColorHelper.quantityTextColorTokenName(),
            addToCartBackgroundColorTokenName: isAddToCartEnabled
                ? DSPLPPodButtonSetColorHelper.addToCartBackgroundColorTokenName()
                : DSPLPPodButtonSetColorHelper.buttonDisabledBackgroundColorTokenName(),
            addToCartTextColorTokenName: isAddToCartEnabled
                ? DSPLPPodButtonSetColorHelper.addToCartTextColorTokenName()
                : DSPLPPodButtonSetColorHelper.buttonDisabledTextColorTokenName(),
            addToListBackgroundColorTokenName: DSPLPPodButtonSetColorHelper.addToListBackgroundColorTokenName(),
            addToListTextColorTokenName: isAddToListEnabled
                ? DSPLPPodButtonSetColorHelper.addToListTextColorTokenName()
                : DSPLPPodButtonSetColorHelper.buttonDisabledTextColorTokenName(),
            addToListBorderColorTokenName: isAddToListEnabled
                ? DSPLPPodButtonSetColorHelper.addToListBorderColorTokenName()
                : DSPLPPodButtonSetColorHelper.buttonDisabledBorderColorTokenName(),
            variant: variant,
            quantity: quantity,
            isAddToCartEnabled: isAddToCartEnabled,
            isAddToListEnabled: isAddToListEnabled
        )
    }
}
