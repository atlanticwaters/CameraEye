import SwiftUI

// MARK: - Quantity Picker Component System
// THD App Design System - Quantity Picker Components
//
// This file contains QuantityPicker, QuantityButton, and StandaloneQuantityButton components
// that use DesignSystemGlobal tokens for consistent styling.
//
// Components:
// - QuantityPicker: Expandable quantity selector with +/- controls
// - QuantityButton: Internal button used within QuantityPicker
// - StandaloneQuantityButton: Standalone +/-/delete button for use outside picker
//
// Design System Integration:
// - Colors: Uses BackgroundInputColor*, TextButtonColor*, IconInputColor*, IconOnContainerColor* tokens
// - Spacing: Uses Spacing* tokens
// - Border: Uses BorderRadius*, BorderWidthXs tokens
// - Typography: Uses FontFontSize* tokens

// MARK: - Quantity Picker Color Variants
/// Color variants for the quantity picker.
enum THDQuantityPickerColor {
    /// Orange/Brand filled - primary brand action
    /// Background: BackgroundInputColorBrandFilledDefault
    /// Text: TextButtonColorOrangeFilledDefault (white)
    case orange

    /// Grey/Transparent - neutral action
    /// Background: BackgroundInputColorTransparent10Default
    /// Text: TextInputColorTransparent10Default
    case grey

    /// Orange gradient - light to dark direction
    /// Background: LinearGradient from brand-200 to brand-400
    /// Text: TextButtonColorOrangeFilledDefault (white)
    case orangeGradientLightToDark

    /// Orange gradient - dark to light direction
    /// Background: LinearGradient from brand-400 to brand-200
    /// Text: TextButtonColorOrangeFilledDefault (white)
    case orangeGradientDarkToLight

    /// Grey gradient - light to dark direction
    /// Background: LinearGradient from greige-050 to greige-100
    /// Text: TextInputColorTransparent10Default
    case greyGradientLightToDark

    /// Grey gradient - dark to light direction
    /// Background: LinearGradient from greige-100 to greige-050
    /// Text: TextInputColorTransparent10Default
    case greyGradientDarkToLight
}

// MARK: - Quantity Picker Size Options
/// Size options for the quantity picker with corresponding dimensions.
///
/// Sizes use DesignSystemGlobal spacing tokens:
/// - Small: 28pt height (Spacing7)
/// - Medium: 36pt height (Spacing9)
/// - Large: 44pt height (Spacing11)
enum THDQuantityPickerSize {
    case small   // 28pt height
    case medium  // 36pt height
    case large   // 44pt height

    /// Picker height using DesignSystemGlobal spacing tokens
    var height: CGFloat {
        switch self {
        case .small: return DesignSystemGlobal.Spacing7
        case .medium: return DesignSystemGlobal.Spacing9
        case .large: return DesignSystemGlobal.Spacing11
        }
    }

    /// Icon size within buttons
    var iconSize: CGFloat {
        16 // Consistent 16pt icon size
    }

    /// Horizontal padding
    var horizontalPadding: CGFloat {
        switch self {
        case .small: return DesignSystemGlobal.Spacing0
        case .medium: return DesignSystemGlobal.Spacing0
        case .large: return DesignSystemGlobal.Spacing4
        }
    }

    /// Vertical padding
    var verticalPadding: CGFloat {
        switch self {
        case .small: return 2
        case .medium: return 2
        case .large: return 7
        }
    }
}

// MARK: - Expansion Direction
/// Direction the quantity picker expands to reveal controls.
enum THDQuantityPickerExpansion {
    /// Controls appear on the left side
    case left

    /// Controls appear on the right side
    case right

    /// Controls appear on both sides (expands from center)
    case center
}

// MARK: - Quantity Button Use Cases
/// Use cases for standalone quantity buttons.
enum THDQuantityButtonUseCase {
    /// Add/increment action (+)
    case add

    /// Subtract/decrement action (-)
    case subtract

    /// Delete/remove action (trash)
    case delete
}

// MARK: - QuantityPicker Component
/// Expandable quantity picker component using DesignSystemGlobal tokens.
///
/// An interactive picker that expands to reveal +/- controls when tapped.
/// Supports orange (brand) and grey (neutral) color variants.
///
/// ## Usage Example:
/// ```swift
/// @State private var quantity = 1
///
/// QuantityPicker(
///     quantity: $quantity,
///     color: .orange,
///     size: .medium,
///     expansion: .right
/// ) {
///     // Handle delete
/// }
/// ```
///
/// ## Design System Tokens Used:
/// - Background: BackgroundInputColorBrandFilledDefault, BackgroundInputColorTransparent10Default
/// - Text: TextButtonColorOrangeFilledDefault, TextInputColorTransparent10Default
/// - Icons: IconOnContainerColorInverse, IconInputColorDefault
/// - Border: BorderRadiusLg, BorderRadiusFull
struct QuantityPicker: View {
    @Binding var quantity: Int
    let color: THDQuantityPickerColor
    let size: THDQuantityPickerSize
    let expansion: THDQuantityPickerExpansion
    let minQuantity: Int
    let maxQuantity: Int
    let onDelete: (() -> Void)?

    @State private var isExpanded: Bool = false

    init(
        quantity: Binding<Int>,
        color: THDQuantityPickerColor = .orange,
        size: THDQuantityPickerSize = .small,
        expansion: THDQuantityPickerExpansion = .right,
        minQuantity: Int = 0,
        maxQuantity: Int = 99,
        onDelete: (() -> Void)? = nil
    ) {
        self._quantity = quantity
        self.color = color
        self.size = size
        self.expansion = expansion
        self.minQuantity = minQuantity
        self.maxQuantity = maxQuantity
        self.onDelete = onDelete
    }

    var body: some View {
        HStack(spacing: 0) {
            // Left side controls
            if isExpanded {
                switch expansion {
                case .left:
                    // Both buttons on left: subtract then add
                    subtractButton
                    addButton
                case .center:
                    // Only subtract on left
                    subtractButton
                case .right:
                    // Nothing on left for right expansion
                    EmptyView()
                }
            }

            // Quantity display (always in center)
            quantityDisplay

            // Right side controls
            if isExpanded {
                switch expansion {
                case .left:
                    // Nothing on right for left expansion
                    EmptyView()
                case .center:
                    // Only add on right
                    addButton
                case .right:
                    // Both buttons on right: subtract then add
                    subtractButton
                    addButton
                }
            }
        }
        .padding(.horizontal, size.horizontalPadding)
        .padding(.vertical, size.verticalPadding)
        .background(backgroundView)
        .cornerRadius(size == .large ? DesignSystemGlobal.BorderRadiusFull : DesignSystemGlobal.BorderRadiusLg)
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.2)) {
                isExpanded = true
            }
        }
    }

    // MARK: - Subviews

    /// Quantity number display
    private var quantityDisplay: some View {
        HStack(spacing: DesignSystemGlobal.Spacing2) {
            Text("\(quantity)")
                .font(textFont)
                .foregroundColor(textColor)
                .frame(minWidth: 14)
        }
        .padding(.horizontal, DesignSystemGlobal.Spacing3)
        .padding(.vertical, DesignSystemGlobal.Spacing1)
        .frame(height: size.height)
    }

    /// Subtract or Delete button
    private var subtractButton: some View {
        QuantityButton(
            icon: quantity <= minQuantity + 1 ? "trash" : "minus",
            size: size,
            isDisabled: quantity <= minQuantity,
            action: {
                if quantity <= minQuantity + 1 {
                    onDelete?()
                    withAnimation(.easeInOut(duration: 0.2)) {
                        isExpanded = false
                    }
                } else {
                    quantity -= 1
                }
            }
        )
    }

    /// Add button
    private var addButton: some View {
        QuantityButton(
            icon: "plus",
            size: size,
            isDisabled: quantity >= maxQuantity,
            action: {
                if quantity < maxQuantity {
                    quantity += 1
                }
            }
        )
    }

    /// +/- control buttons (legacy - kept for reference)
    @ViewBuilder
    private var buttonControls: some View {
        HStack(spacing: DesignSystemGlobal.Spacing0) {
            subtractButton
            addButton
        }
    }

    // MARK: - Color Logic

    /// Font based on color variant
    /// Orange variants use bold, grey variants use regular
    private var textFont: Font {
        switch color {
        case .orange, .orangeGradientLightToDark, .orangeGradientDarkToLight:
            return .system(size: DesignSystemGlobal.FontFontSizeBodySm, weight: .bold)
        case .grey, .greyGradientLightToDark, .greyGradientDarkToLight:
            return .system(size: DesignSystemGlobal.FontFontSizeBodySm, weight: .regular)
        }
    }

    /// Text color based on color variant
    private var textColor: Color {
        switch color {
        case .orange, .orangeGradientLightToDark, .orangeGradientDarkToLight:
            return DesignSystemGlobal.TextButtonColorOrangeFilledDefault
        case .grey, .greyGradientLightToDark, .greyGradientDarkToLight:
            return DesignSystemGlobal.TextInputColorTransparent10Default
        }
    }

    /// Whether the color variant uses a gradient background
    private var isGradient: Bool {
        switch color {
        case .orangeGradientLightToDark, .orangeGradientDarkToLight,
             .greyGradientLightToDark, .greyGradientDarkToLight:
            return true
        case .orange, .grey:
            return false
        }
    }

    /// Background view - solid color or gradient based on variant
    @ViewBuilder
    private var backgroundView: some View {
        switch color {
        case .orange:
            DesignSystemGlobal.BackgroundInputColorBrandFilledDefault
        case .grey:
            DesignSystemGlobal.BackgroundInputColorTransparent10Default
        case .orangeGradientLightToDark:
            LinearGradient(
                gradient: Gradient(colors: [
                    DesignSystemGlobal.BrandBrand200,
                    DesignSystemGlobal.BrandBrand400
                ]),
                startPoint: .leading,
                endPoint: .trailing
            )
        case .orangeGradientDarkToLight:
            LinearGradient(
                gradient: Gradient(colors: [
                    DesignSystemGlobal.BrandBrand400,
                    DesignSystemGlobal.BrandBrand200
                ]),
                startPoint: .leading,
                endPoint: .trailing
            )
        case .greyGradientLightToDark:
            LinearGradient(
                gradient: Gradient(colors: [
                    DesignSystemGlobal.GreigeGreige050,
                    DesignSystemGlobal.GreigeGreige100
                ]),
                startPoint: .leading,
                endPoint: .trailing
            )
        case .greyGradientDarkToLight:
            LinearGradient(
                gradient: Gradient(colors: [
                    DesignSystemGlobal.GreigeGreige100,
                    DesignSystemGlobal.GreigeGreige050
                ]),
                startPoint: .leading,
                endPoint: .trailing
            )
        }
    }
}

// MARK: - QuantityButton Component
/// Internal button component used within QuantityPicker.
///
/// Provides the +/-/trash controls with appropriate visual feedback.
struct QuantityButton: View {
    let icon: String
    let size: THDQuantityPickerSize
    let isDisabled: Bool
    let action: () -> Void

    @State private var isPressed: Bool = false

    var body: some View {
        Button(action: {
            if !isDisabled {
                action()
            }
        }) {
            Image(systemName: icon)
                .resizable()
                .frame(width: size.iconSize, height: size.iconSize)
                .foregroundColor(iconColor)
                .frame(width: buttonSize, height: buttonSize)
                .background(buttonBackground)
                .cornerRadius(DesignSystemGlobal.BorderRadiusFull)
        }
        .disabled(isDisabled)
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in
                    isPressed = true
                }
                .onEnded { _ in
                    isPressed = false
                }
        )
    }

    /// Button size based on picker size
    private var buttonSize: CGFloat {
        switch size {
        case .small: return DesignSystemGlobal.Spacing7
        case .medium: return DesignSystemGlobal.Spacing7
        case .large: return DesignSystemGlobal.Spacing9
        }
    }

    /// Icon color with disabled state handling
    private var iconColor: Color {
        if isDisabled {
            return DesignSystemGlobal.IconInputColorInactive
        }
        return DesignSystemGlobal.IconOnContainerColorInverse
    }

    /// Background color with pressed state handling
    private var buttonBackground: Color {
        if isPressed && !isDisabled {
            return DesignSystemGlobal.TransparentBlackTransparentBlack075
        }
        return DesignSystemGlobal.BackgroundButtonColorGhostFilledDefault
    }
}

// MARK: - StandaloneQuantityButton Component
/// Standalone quantity button for use outside of QuantityPicker.
///
/// A circular button with +/-/trash icon that can be used independently.
///
/// ## Usage Example:
/// ```swift
/// StandaloneQuantityButton(useCase: .add, size: .medium) {
///     // Handle add action
/// }
/// ```
///
/// ## Design System Tokens Used:
/// - Icons: IconInputColorDefault, IconInputColorInactive
/// - Background: BackgroundButtonColorGhostFilledDefault, BackgroundButtonColorGhostFilledPressed
struct StandaloneQuantityButton: View {
    let useCase: THDQuantityButtonUseCase
    let size: THDQuantityPickerSize
    let isDisabled: Bool
    let action: () -> Void

    @State private var isPressed: Bool = false

    init(
        useCase: THDQuantityButtonUseCase,
        size: THDQuantityPickerSize = .small,
        isDisabled: Bool = false,
        action: @escaping () -> Void = {}
    ) {
        self.useCase = useCase
        self.size = size
        self.isDisabled = isDisabled
        self.action = action
    }

    var body: some View {
        Button(action: {
            if !isDisabled {
                action()
            }
        }) {
            Image(systemName: iconName)
                .resizable()
                .frame(width: 16, height: 16)
                .foregroundColor(iconColor)
                .frame(width: buttonSize, height: buttonSize)
                .background(buttonBackground)
                .cornerRadius(DesignSystemGlobal.BorderRadiusFull)
        }
        .disabled(isDisabled)
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in
                    isPressed = true
                }
                .onEnded { _ in
                    isPressed = false
                }
        )
        .padding(size == .small ? DesignSystemGlobal.Spacing1 : DesignSystemGlobal.Spacing0)
    }

    /// Icon name based on use case
    private var iconName: String {
        switch useCase {
        case .add: return "plus"
        case .subtract: return "minus"
        case .delete: return "trash"
        }
    }

    /// Button size based on picker size
    private var buttonSize: CGFloat {
        size == .small ? DesignSystemGlobal.Spacing7 : DesignSystemGlobal.Spacing9
    }

    /// Icon color with disabled state handling
    private var iconColor: Color {
        if isDisabled {
            return DesignSystemGlobal.IconInputColorInactive
        }
        return DesignSystemGlobal.IconInputColorDefault
    }

    /// Background color with pressed state handling
    private var buttonBackground: Color {
        if isPressed && !isDisabled {
            return DesignSystemGlobal.BackgroundButtonColorGhostFilledPressed
        }
        return DesignSystemGlobal.BackgroundButtonColorGhostFilledDefault
    }
}

// MARK: - Previews
#Preview("Quantity Picker Variants") {
    ScrollView {
        VStack(alignment: .leading, spacing: 24) {
            // Title
            Text("Quantity Picker")
                .font(.system(size: 48, weight: .medium))
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)
                .padding(.bottom, 20)

            // Orange - Expands from Right
            VStack(alignment: .leading, spacing: 12) {
                Text("Orange - Expands from Right")
                    .font(.headline)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

                VStack(alignment: .leading, spacing: 8) {
                    QuantityPicker(
                        quantity: .constant(1),
                        color: .orange,
                        size: .small,
                        expansion: .right
                    )

                    QuantityPicker(
                        quantity: .constant(3),
                        color: .orange,
                        size: .medium,
                        expansion: .right
                    )

                    QuantityPicker(
                        quantity: .constant(5),
                        color: .orange,
                        size: .large,
                        expansion: .right
                    )
                }
            }

            // Orange - Expands from Left
            VStack(alignment: .leading, spacing: 12) {
                Text("Orange - Expands from Left")
                    .font(.headline)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

                VStack(alignment: .leading, spacing: 8) {
                    QuantityPicker(
                        quantity: .constant(1),
                        color: .orange,
                        size: .small,
                        expansion: .left
                    )

                    QuantityPicker(
                        quantity: .constant(3),
                        color: .orange,
                        size: .medium,
                        expansion: .left
                    )

                    QuantityPicker(
                        quantity: .constant(5),
                        color: .orange,
                        size: .large,
                        expansion: .left
                    )
                }
            }

            // Grey - Expands from Left
            VStack(alignment: .leading, spacing: 12) {
                Text("Grey - Expands from Left")
                    .font(.headline)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

                VStack(alignment: .leading, spacing: 8) {
                    QuantityPicker(
                        quantity: .constant(1),
                        color: .grey,
                        size: .small,
                        expansion: .left
                    )

                    QuantityPicker(
                        quantity: .constant(3),
                        color: .grey,
                        size: .medium,
                        expansion: .left
                    )

                    QuantityPicker(
                        quantity: .constant(5),
                        color: .grey,
                        size: .large,
                        expansion: .left
                    )
                }
            }

            // Grey - Expands from Right
            VStack(alignment: .leading, spacing: 12) {
                Text("Grey - Expands from Right")
                    .font(.headline)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

                VStack(alignment: .leading, spacing: 8) {
                    QuantityPicker(
                        quantity: .constant(1),
                        color: .grey,
                        size: .small,
                        expansion: .right
                    )

                    QuantityPicker(
                        quantity: .constant(3),
                        color: .grey,
                        size: .medium,
                        expansion: .right
                    )

                    QuantityPicker(
                        quantity: .constant(5),
                        color: .grey,
                        size: .large,
                        expansion: .right
                    )
                }
            }

            Divider().padding(.vertical)

            // Orange - Expands from Center
            VStack(alignment: .leading, spacing: 12) {
                Text("Orange - Expands from Center")
                    .font(.headline)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

                VStack(alignment: .leading, spacing: 8) {
                    QuantityPicker(
                        quantity: .constant(1),
                        color: .orange,
                        size: .small,
                        expansion: .center
                    )

                    QuantityPicker(
                        quantity: .constant(3),
                        color: .orange,
                        size: .medium,
                        expansion: .center
                    )

                    QuantityPicker(
                        quantity: .constant(5),
                        color: .orange,
                        size: .large,
                        expansion: .center
                    )
                }
            }

            // Grey - Expands from Center
            VStack(alignment: .leading, spacing: 12) {
                Text("Grey - Expands from Center")
                    .font(.headline)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

                VStack(alignment: .leading, spacing: 8) {
                    QuantityPicker(
                        quantity: .constant(1),
                        color: .grey,
                        size: .small,
                        expansion: .center
                    )

                    QuantityPicker(
                        quantity: .constant(3),
                        color: .grey,
                        size: .medium,
                        expansion: .center
                    )

                    QuantityPicker(
                        quantity: .constant(5),
                        color: .grey,
                        size: .large,
                        expansion: .center
                    )
                }
            }

            Divider().padding(.vertical)

            // Orange Gradient - Light to Dark
            VStack(alignment: .leading, spacing: 12) {
                Text("Orange Gradient - Light to Dark")
                    .font(.headline)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

                VStack(alignment: .leading, spacing: 8) {
                    QuantityPicker(
                        quantity: .constant(1),
                        color: .orangeGradientLightToDark,
                        size: .small,
                        expansion: .right
                    )

                    QuantityPicker(
                        quantity: .constant(3),
                        color: .orangeGradientLightToDark,
                        size: .medium,
                        expansion: .right
                    )

                    QuantityPicker(
                        quantity: .constant(5),
                        color: .orangeGradientLightToDark,
                        size: .large,
                        expansion: .right
                    )
                }
            }

            // Orange Gradient - Dark to Light
            VStack(alignment: .leading, spacing: 12) {
                Text("Orange Gradient - Dark to Light")
                    .font(.headline)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

                VStack(alignment: .leading, spacing: 8) {
                    QuantityPicker(
                        quantity: .constant(1),
                        color: .orangeGradientDarkToLight,
                        size: .small,
                        expansion: .right
                    )

                    QuantityPicker(
                        quantity: .constant(3),
                        color: .orangeGradientDarkToLight,
                        size: .medium,
                        expansion: .right
                    )

                    QuantityPicker(
                        quantity: .constant(5),
                        color: .orangeGradientDarkToLight,
                        size: .large,
                        expansion: .right
                    )
                }
            }

            // Grey Gradient - Light to Dark
            VStack(alignment: .leading, spacing: 12) {
                Text("Grey Gradient - Light to Dark")
                    .font(.headline)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

                VStack(alignment: .leading, spacing: 8) {
                    QuantityPicker(
                        quantity: .constant(1),
                        color: .greyGradientLightToDark,
                        size: .small,
                        expansion: .right
                    )

                    QuantityPicker(
                        quantity: .constant(3),
                        color: .greyGradientLightToDark,
                        size: .medium,
                        expansion: .right
                    )

                    QuantityPicker(
                        quantity: .constant(5),
                        color: .greyGradientLightToDark,
                        size: .large,
                        expansion: .right
                    )
                }
            }

            // Grey Gradient - Dark to Light
            VStack(alignment: .leading, spacing: 12) {
                Text("Grey Gradient - Dark to Light")
                    .font(.headline)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

                VStack(alignment: .leading, spacing: 8) {
                    QuantityPicker(
                        quantity: .constant(1),
                        color: .greyGradientDarkToLight,
                        size: .small,
                        expansion: .right
                    )

                    QuantityPicker(
                        quantity: .constant(3),
                        color: .greyGradientDarkToLight,
                        size: .medium,
                        expansion: .right
                    )

                    QuantityPicker(
                        quantity: .constant(5),
                        color: .greyGradientDarkToLight,
                        size: .large,
                        expansion: .right
                    )
                }
            }

            Divider().padding(.vertical)

            // Standalone Quantity Buttons
            VStack(alignment: .leading, spacing: 12) {
                Text("Quantity Buttons")
                    .font(.headline)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

                VStack(alignment: .leading, spacing: 8) {
                    HStack(spacing: 8) {
                        StandaloneQuantityButton(useCase: .add, size: .small)
                        StandaloneQuantityButton(useCase: .subtract, size: .small)
                        StandaloneQuantityButton(useCase: .delete, size: .small)
                    }

                    HStack(spacing: 8) {
                        StandaloneQuantityButton(useCase: .add, size: .large)
                        StandaloneQuantityButton(useCase: .subtract, size: .large)
                        StandaloneQuantityButton(useCase: .delete, size: .large)
                    }

                    HStack(spacing: 8) {
                        StandaloneQuantityButton(useCase: .add, size: .small, isDisabled: true)
                        StandaloneQuantityButton(useCase: .subtract, size: .small, isDisabled: true)
                        StandaloneQuantityButton(useCase: .delete, size: .small, isDisabled: true)
                    }
                }
            }
        }
        .padding()
    }
    .background(DesignSystemGlobal.BackgroundContainerColorWhite)
}
