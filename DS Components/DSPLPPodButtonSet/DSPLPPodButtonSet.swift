import SwiftUI

// MARK: - DSPLPPodButtonSetVariant

/// The variant of the button set display.
public enum DSPLPPodButtonSetVariant: Equatable, Sendable {
    /// B2C variant with just an Add to Cart button
    case b2c

    /// B2B variant with quantity picker, Add to Cart, and Add to List buttons
    case b2b
}

// MARK: - DSPLPPodButtonSet

/// A component for displaying action buttons in a PLP (Product Listing Page) pod.
///
/// DSPLPPodButtonSet displays either a simple B2C layout with just an Add to Cart button,
/// or a B2B layout with a quantity picker, Add to Cart button, and Add to List button.
///
/// Example usage:
/// ```swift
/// // B2C variant
/// DSPLPPodButtonSet(
///     variant: .b2c,
///     onAddToCart: { print("Add to cart") }
/// )
///
/// // B2B variant
/// DSPLPPodButtonSet(
///     variant: .b2b,
///     quantity: 1,
///     onQuantityChanged: { newQuantity in print("Quantity: \(newQuantity)") },
///     onAddToCart: { print("Add to cart") },
///     onAddToList: { print("Add to list") }
/// )
/// ```
public struct DSPLPPodButtonSet: View {
    // MARK: - Properties

    private let variant: DSPLPPodButtonSetVariant
    private let quantity: Int
    private let minQuantity: Int
    private let maxQuantity: Int
    private let addToCartText: String
    private let addToListText: String
    private let isAddToCartEnabled: Bool
    private let isAddToListEnabled: Bool
    private let onQuantityChanged: ((Int) -> Void)?
    private let onAddToCart: (() -> Void)?
    private let onAddToList: (() -> Void)?

    // MARK: - Initializers

    public init(
        variant: DSPLPPodButtonSetVariant = .b2c,
        quantity: Int = 1,
        minQuantity: Int = 1,
        maxQuantity: Int = 99,
        addToCartText: String = "Add to Cart",
        addToListText: String = "Add to List",
        isAddToCartEnabled: Bool = true,
        isAddToListEnabled: Bool = true,
        onQuantityChanged: ((Int) -> Void)? = nil,
        onAddToCart: (() -> Void)? = nil,
        onAddToList: (() -> Void)? = nil
    ) {
        self.variant = variant
        self.quantity = quantity
        self.minQuantity = minQuantity
        self.maxQuantity = maxQuantity
        self.addToCartText = addToCartText
        self.addToListText = addToListText
        self.isAddToCartEnabled = isAddToCartEnabled
        self.isAddToListEnabled = isAddToListEnabled
        self.onQuantityChanged = onQuantityChanged
        self.onAddToCart = onAddToCart
        self.onAddToList = onAddToList
    }

    // MARK: - Body

    public var body: some View {
        switch variant {
        case .b2c:
            b2cLayout
        case .b2b:
            b2bLayout
        }
    }

    // MARK: - B2C Layout

    @ViewBuilder
    private var b2cLayout: some View {
        addToCartButton
    }

    // MARK: - B2B Layout

    @ViewBuilder
    private var b2bLayout: some View {
        VStack(spacing: 8) {
            // Quantity Picker
            quantityPicker

            // Add to Cart Button
            addToCartButton

            // Add to List Button
            addToListButton
        }
    }

    // MARK: - Quantity Picker

    @ViewBuilder
    private var quantityPicker: some View {
        HStack(spacing: 0) {
            // Decrease Button
            DSIconButton(
                systemName: "minus",
                style: .black5,
                size: .medium,
                accessibilityLabel: "Decrease quantity",
                isDisabled: quantity <= minQuantity
            ) {
                decreaseQuantity()
            }

            Spacer()

            // Quantity Display
            Text("\(quantity)")
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(DSPLPPodButtonSetColorHelper.quantityTextColor())
                .frame(minWidth: 30)

            Spacer()

            // Increase Button
            DSIconButton(
                systemName: "plus",
                style: .black5,
                size: .medium,
                accessibilityLabel: "Increase quantity",
                isDisabled: quantity >= maxQuantity
            ) {
                increaseQuantity()
            }
        }
        .padding(.horizontal, 8)
        .frame(height: 56)
        .background(DSPLPPodButtonSetColorHelper.quantityPickerBackgroundColor())
        .clipShape(.rect(cornerRadius: 8))
    }

    private func decreaseQuantity() {
        if quantity > minQuantity {
            onQuantityChanged?(quantity - 1)
        }
    }

    private func increaseQuantity() {
        if quantity < maxQuantity {
            onQuantityChanged?(quantity + 1)
        }
    }

    // MARK: - Add to Cart Button

    @ViewBuilder
    private var addToCartButton: some View {
        DSButton(
            addToCartText,
            style: .orangeFilled,
            size: .large,
            leadingIcon: Image(systemName: "cart.badge.plus"),
            isDisabled: !isAddToCartEnabled
        ) {
            onAddToCart?()
        }
    }

    // MARK: - Add to List Button

    @ViewBuilder
    private var addToListButton: some View {
        DSButton(
            addToListText,
            style: .outlined,
            size: .large,
            leadingIcon: Image(systemName: "list.bullet"),
            isDisabled: !isAddToListEnabled
        ) {
            onAddToList?()
        }
    }
}
