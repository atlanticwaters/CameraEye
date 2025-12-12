import SwiftUI

// MARK: - DSQuantityPicker

/// A quantity picker component with increment/decrement buttons and a quantity display.
///
/// DSQuantityPicker supports 3 sizes (small, medium, large) and 2 color variants (orange, grey).
/// The component displays a quantity value with +/- buttons for adjusting the value.
///
/// Example usage:
/// ```swift
/// @State private var quantity = 1
///
/// DSQuantityPicker(
///     quantity: $quantity,
///     size: .medium,
///     color: .orange
/// )
/// ```
public struct DSQuantityPicker: View {
    // MARK: Lifecycle

    /// Creates a DSQuantityPicker with the specified configuration.
    public init(
        quantity: Binding<Int>,
        size: Size = .small,
        color: Color = .orange,
        onIncrement: (() -> Void)? = nil,
        onDecrement: (() -> Void)? = nil
    ) {
        self._quantity = quantity
        self.size = size
        self.color = color
        self.onIncrement = onIncrement
        self.onDecrement = onDecrement
    }

    // MARK: Public

    /// The size of the quantity picker
    public enum Size {
        case small
        case medium
        case large

        var containerHeight: CGFloat {
            switch self {
            case .small: return 28
            case .medium: return 36
            case .large: return 44
            }
        }

        var buttonSize: CGFloat {
            return 44
        }

        var innerButtonSize: CGFloat {
            return 28
        }

        var iconSize: CGFloat {
            return 16
        }
    }

    /// The color variant of the quantity picker
    public enum Color {
        case orange
        case grey
    }

    public var body: some View {
        HStack(spacing: 0) {
            // Decrement button
            quantityButton(isIncrement: false)

            // Quantity display
            quantityDisplay

            // Increment button
            quantityButton(isIncrement: true)
        }
        .frame(height: size.containerHeight)
        .background(containerBackground)
        .clipShape(RoundedRectangle(cornerRadius: TokensSemanticLight.BorderRadiusFull))
    }

    // MARK: Internal

    @Binding var quantity: Int
    let size: Size
    let color: Color
    let onIncrement: (() -> Void)?
    let onDecrement: (() -> Void)?

    // MARK: Private

    @Environment(\.colorScheme)
    private var colorScheme

    private var isDark: Bool {
        colorScheme == .dark
    }

    @ViewBuilder
    private var quantityDisplay: some View {
        Text("\(quantity)")
            .font(.custom(TokensCoreLight.FontFamilyInformational, size: TokensCoreLight.FontSizeBodySm).weight(.bold))
            .foregroundColor(textColor)
            .frame(minWidth: 40)
            .padding(.horizontal, 8)
    }

    @ViewBuilder
    private func quantityButton(isIncrement: Bool) -> some View {
        Button {
            if isIncrement {
                quantity += 1
                onIncrement?()
            } else {
                if quantity > 1 {
                    quantity -= 1
                    onDecrement?()
                }
            }
        } label: {
            ZStack {
                // Icon
                if isIncrement {
                    plusIcon
                } else {
                    minusIcon
                }
            }
            .frame(width: size.innerButtonSize, height: size.innerButtonSize)
            .contentShape(Rectangle())
        }
        .disabled(!isIncrement && quantity <= 1)
        .buttonStyle(QuantityButtonPressStyle())
        .padding(.horizontal, 8)
    }

    @ViewBuilder
    private var plusIcon: some View {
        Image(systemName: "plus")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: size.iconSize, height: size.iconSize)
            .foregroundColor(iconColor)
    }

    @ViewBuilder
    private var minusIcon: some View {
        Image(systemName: "minus")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: size.iconSize, height: size.iconSize)
            .foregroundColor(iconColor)
    }

    @ViewBuilder
    private var containerBackground: some View {
        RoundedRectangle(cornerRadius: TokensSemanticLight.BorderRadiusFull)
            .fill(containerGradient)
    }

    private var containerGradient: LinearGradient {
        switch color {
        case .orange:
            return LinearGradient(
                gradient: Gradient(colors: orangeGradientColors),
                startPoint: .leading,
                endPoint: .trailing
            )
        case .grey:
            return LinearGradient(
                gradient: Gradient(colors: greyGradientColors),
                startPoint: .leading,
                endPoint: .trailing
            )
        }
    }

    private var orangeGradientColors: [SwiftUI.Color] {
        if isDark {
            return [TokensSemanticDark.Brand400, TokensSemanticDark.Brand200]
        } else {
            return [TokensSemanticLight.Brand400, TokensSemanticLight.Brand200]
        }
    }

    private var greyGradientColors: [SwiftUI.Color] {
        if isDark {
            return [TokensSemanticDark.Greige100, TokensSemanticDark.Greige050]
        } else {
            return [TokensSemanticLight.Greige100, TokensSemanticLight.Greige050]
        }
    }

    private var textColor: SwiftUI.Color {
        switch color {
        case .orange:
            if isDark {
                return TokensSemanticDark.TextButtonColorOrangeFilledDefault
            } else {
                return TokensSemanticLight.TextButtonColorOrangeFilledDefault
            }
        case .grey:
            if isDark {
                return TokensSemanticDark.TextInputColorTransparent10Default
            } else {
                return TokensSemanticLight.TextInputColorTransparent10Default
            }
        }
    }

    private var iconColor: SwiftUI.Color {
        switch color {
        case .orange:
            if isDark {
                return TokensSemanticDark.TextButtonColorOrangeFilledDefault
            } else {
                return TokensSemanticLight.TextButtonColorOrangeFilledDefault
            }
        case .grey:
            if isDark {
                return TokensSemanticDark.Greige700
            } else {
                return TokensSemanticLight.Greige700
            }
        }
    }
}

// MARK: - DSQuantityPicker Factory Methods

public extension DSQuantityPicker {
    /// Creates an orange quantity picker
    static func orange(_ quantity: Binding<Int>, size: Size = .small) -> DSQuantityPicker {
        DSQuantityPicker(quantity: quantity, size: size, color: .orange)
    }

    /// Creates a grey quantity picker
    static func grey(_ quantity: Binding<Int>, size: Size = .small) -> DSQuantityPicker {
        DSQuantityPicker(quantity: quantity, size: size, color: .grey)
    }
}

// MARK: - QuantityButtonPressStyle

/// A custom button style that handles press states for quantity buttons.
private struct QuantityButtonPressStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}
