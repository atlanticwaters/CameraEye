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
            Button(action: decreaseQuantity) {
                ZStack {
                    Circle()
                        .fill(DSPLPPodButtonSetColorHelper.quantityButtonBackgroundColor())
                        .frame(width: 44, height: 44)

                    Image(systemName: "minus")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(
                            quantity > minQuantity
                                ? DSPLPPodButtonSetColorHelper.quantityButtonIconColor()
                                : DSPLPPodButtonSetColorHelper.quantityButtonDisabledColor()
                        )
                }
            }
            .buttonStyle(.plain)
            .disabled(quantity <= minQuantity)

            Spacer()

            // Quantity Display
            Text("\(quantity)")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(DSPLPPodButtonSetColorHelper.quantityTextColor())
                .frame(minWidth: 30)

            Spacer()

            // Increase Button
            Button(action: increaseQuantity) {
                ZStack {
                    Circle()
                        .fill(DSPLPPodButtonSetColorHelper.quantityButtonBackgroundColor())
                        .frame(width: 44, height: 44)

                    Image(systemName: "plus")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(
                            quantity < maxQuantity
                                ? DSPLPPodButtonSetColorHelper.quantityButtonIconColor()
                                : DSPLPPodButtonSetColorHelper.quantityButtonDisabledColor()
                        )
                }
            }
            .buttonStyle(.plain)
            .disabled(quantity >= maxQuantity)
        }
        .padding(.horizontal, 8)
        .frame(height: 44)
        .background(DSPLPPodButtonSetColorHelper.quantityPickerBackgroundColor())
        .cornerRadius(8)
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
        Button(action: { onAddToCart?() }) {
            HStack(spacing: 8) {
                Image(systemName: "cart.badge.plus")
                    .font(.system(size: 14, weight: .medium))

                Text(addToCartText)
                    .font(.system(size: 14, weight: .semibold))
            }
            .foregroundColor(
                isAddToCartEnabled
                    ? DSPLPPodButtonSetColorHelper.addToCartTextColor()
                    : DSPLPPodButtonSetColorHelper.buttonDisabledTextColor()
            )
            .frame(maxWidth: .infinity)
            .frame(height: 44)
            .background(
                isAddToCartEnabled
                    ? DSPLPPodButtonSetColorHelper.addToCartBackgroundColor()
                    : DSPLPPodButtonSetColorHelper.buttonDisabledBackgroundColor()
            )
            .cornerRadius(8)
        }
        .buttonStyle(.plain)
        .disabled(!isAddToCartEnabled)
    }

    // MARK: - Add to List Button

    @ViewBuilder
    private var addToListButton: some View {
        Button(action: { onAddToList?() }) {
            HStack(spacing: 8) {
                Image(systemName: "list.bullet")
                    .font(.system(size: 14, weight: .medium))

                Text(addToListText)
                    .font(.system(size: 14, weight: .semibold))
            }
            .foregroundColor(
                isAddToListEnabled
                    ? DSPLPPodButtonSetColorHelper.addToListTextColor()
                    : DSPLPPodButtonSetColorHelper.buttonDisabledTextColor()
            )
            .frame(maxWidth: .infinity)
            .frame(height: 44)
            .background(DSPLPPodButtonSetColorHelper.addToListBackgroundColor())
            .cornerRadius(8)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(
                        isAddToListEnabled
                            ? DSPLPPodButtonSetColorHelper.addToListBorderColor()
                            : DSPLPPodButtonSetColorHelper.buttonDisabledBorderColor(),
                        lineWidth: 1
                    )
            )
        }
        .buttonStyle(.plain)
        .disabled(!isAddToListEnabled)
    }
}
