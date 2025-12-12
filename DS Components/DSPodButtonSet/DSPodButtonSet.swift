import SwiftUI

// MARK: - DSPodButtonSet

/// A button set component for product listing pages with B2C and B2B variants.
///
/// PodButtonSet provides different button configurations for B2C and B2B users:
/// - **B2C**: Single "Add to Cart" outlined button
/// - **B2B**: Multiple buttons including quantity picker and list management
///
/// Example usage:
/// ```swift
/// // B2C variant
/// DSPodButtonSet(variant: .b2c) {
///     print("Add to cart tapped")
/// }
///
/// // B2B variant
/// DSPodButtonSet(
///     variant: .b2b,
///     quantity: $quantity,
///     onAddToCart: { print("Add to cart") },
///     onAddToList: { print("Add to list") }
/// )
/// ```
public struct DSPodButtonSet: View {
    // MARK: Lifecycle

    /// Creates a B2C button set with a single action
    public init(
        variant: Variant = .b2c,
        onAddToCart: @escaping () -> Void,
        onAddToList: (() -> Void)? = nil
    ) {
        self.variant = variant
        self._quantity = .constant(1)
        self.onAddToCart = onAddToCart
        self.onAddToList = onAddToList
    }
    
    /// Creates a B2B button set with quantity picker and multiple actions
    public init(
        variant: Variant = .b2b,
        quantity: Binding<Int>,
        onAddToCart: @escaping () -> Void,
        onAddToList: (() -> Void)? = nil
    ) {
        self.variant = variant
        self._quantity = quantity
        self.onAddToCart = onAddToCart
        self.onAddToList = onAddToList
    }

    // MARK: Public

    public enum Variant {
        case b2c
        case b2b
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            if variant == .b2c {
                b2cContent
            } else {
                b2bContent
            }
        }
        .frame(width: 205)
    }

    // MARK: Private

    @Environment(\.colorScheme)
    private var colorScheme

    let variant: Variant
    @Binding private var quantity: Int
    let onAddToCart: () -> Void
    let onAddToList: (() -> Void)?

    private var isDark: Bool { colorScheme == .dark }

    // MARK: - B2C Content

    @ViewBuilder
    private var b2cContent: some View {
        DSButton("Add to Cart", style: .outlined, size: .medium, action: onAddToCart)
    }

    // MARK: - B2B Content

    @ViewBuilder
    private var b2bContent: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Add to Cart (filled)
            DSButton("Add to Cart", style: .orangeFilled, size: .medium, action: onAddToCart)
            
            // Quantity Picker
            QuantityPickerView(quantity: $quantity, isDark: isDark)
            
            // Add to List (outlined)
            if let onAddToList = onAddToList {
                DSButton("Add to ...", style: .outlined, size: .medium, action: onAddToList)
            }
        }
    }
}

// MARK: - QuantityPickerView

private struct QuantityPickerView: View {
    @Binding var quantity: Int
    let isDark: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            // Decrement button
            Button {
                if quantity > 1 {
                    quantity -= 1
                }
            } label: {
                Image(systemName: "minus")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                    .frame(width: 28, height: 28)
            }
            .frame(width: 44, height: 44)
            .contentShape(Rectangle())
            
            Spacer()
            
            // Quantity display
            Text("\(quantity)")
                .font(.system(size: TokensCoreLight.FontSizeBodySm, weight: .bold))
                .foregroundColor(.white)
            
            Spacer()
            
            // Increment button
            Button {
                quantity += 1
            } label: {
                Image(systemName: "plus")
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.white)
                    .frame(width: 28, height: 28)
            }
            .frame(width: 44, height: 44)
            .contentShape(Rectangle())
        }
        .frame(height: 36)
        .padding(.vertical, 2)
        .background(
            LinearGradient(
                colors: [
                    Color(red: 0.976, green: 0.388, blue: 0.008), // Brand orange
                    Color(red: 0.984, green: 0.635, blue: 0.408)  // Lighter orange
                ],
                startPoint: .leading,
                endPoint: .trailing
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 9999))
        .frame(height: 44)
    }
}

// MARK: - Factory Methods

extension DSPodButtonSet {
    /// Sample B2C configuration for previews and testing
    public static func sampleB2C(
        onAddToCart: @escaping () -> Void = {}
    ) -> DSPodButtonSet {
        DSPodButtonSet(variant: .b2c, onAddToCart: onAddToCart)
    }
    
    /// Sample B2B configuration for previews and testing
    public static func sampleB2B(
        quantity: Binding<Int> = .constant(1),
        onAddToCart: @escaping () -> Void = {},
        onAddToList: (() -> Void)? = {}
    ) -> DSPodButtonSet {
        DSPodButtonSet(
            variant: .b2b,
            quantity: quantity,
            onAddToCart: onAddToCart,
            onAddToList: onAddToList
        )
    }
}
