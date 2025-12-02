import SwiftUI

// MARK: - Quantity Picker Component System
// THD App Design System - Quantity Picker Components

// MARK: - Design Tokens (Extended from Badge/Pill/Button)

/// Typography tokens from Figma design system
struct TypographyTokens {
    static let bodySmBold = Font.system(size: 14, weight: .bold) // Body Sm/Bold/None
    static let bodySmRegular = Font.system(size: 14, weight: .regular) // Body Sm/Regular/None
}

/// Spacing tokens from Figma
struct SpacingTokens {
    static let spacing0: CGFloat = 0
    static let spacing1: CGFloat = 4
    static let spacing2: CGFloat = 8
    static let spacing2px: CGFloat = 2
    static let spacing3: CGFloat = 12
    static let spacing4: CGFloat = 16
    static let spacing6px: CGFloat = 6
    static let spacing7: CGFloat = 28
    static let spacing9: CGFloat = 36
    static let spacing11: CGFloat = 44
}

/// Border tokens from Figma
struct BorderTokens {
    static let border1: CGFloat = 1
    static let radius0: CGFloat = 0
    static let radius3: CGFloat = 3
    static let radius5: CGFloat = 6
    static let radius999: CGFloat = 9999
    static let radiusFull: CGFloat = 9999
}

/// Quantity Picker color tokens from Figma
struct QuantityPickerColorTokens {
    // Orange variant (brand filled)
    static let backgroundInputBrandFilledDefault = Color(hex: "#e95c02")
    static let textButtonOrangeFilledDefault = Color(hex: "#ffffff")
    
    // Grey variant (transparent 10)
    static let backgroundInputTransparent10Default = Color(hex: "#0000001a")
    static let textInputTransparent10Default = Color(hex: "#585756")
    
    // Gradient colors
    static let brand200 = Color(hex: "#fba268")
    static let brand400 = Color(hex: "#e95c02")
    
    // Icon colors
    static let iconInputDefault = Color(hex: "#585756")
    static let iconInputInactive = Color(hex: "#979492")
    static let iconOnContainerInverse = Color(hex: "#ffffff")
    
    // Button background
    static let backgroundButtonGhostFilledDefault = Color(hex: "#00000000")
    static let backgroundButtonGhostFilledPressed = Color(hex: "#0000001a")
    
    // Transparent overlays
    static let transparentBlack075 = Color(hex: "#00000012")
    
    // Neutrals
    static let neutralsWhite = Color(hex: "#ffffff")
    static let greige050 = Color(hex: "#f8f5f2")
    static let greige100 = Color(hex: "#e5e1de")
}

/// Quantity Picker color variants
enum QuantityPickerColor {
    case orange
    case grey
}

/// Quantity Picker size options
enum QuantityPickerSize {
    case small   // 28pt height
    case medium  // 36pt height - not visible in design but mentioned
    case large   // 44pt height
    
    var height: CGFloat {
        switch self {
        case .small: return SpacingTokens.spacing7
        case .medium: return SpacingTokens.spacing9
        case .large: return SpacingTokens.spacing11
        }
    }
    
    var iconSize: CGFloat {
        16 // Icon size is 16pt
    }
    
    var horizontalPadding: CGFloat {
        switch self {
        case .small: return SpacingTokens.spacing0
        case .medium: return SpacingTokens.spacing0
        case .large: return SpacingTokens.spacing4
        }
    }
    
    var verticalPadding: CGFloat {
        switch self {
        case .small: return SpacingTokens.spacing2px
        case .medium: return SpacingTokens.spacing2px
        case .large: return 7 // 7px from design
        }
    }
}

/// Expansion direction for the quantity picker
enum QuantityPickerExpansion {
    case left   // Buttons appear on left
    case right  // Buttons appear on right
}

/// Quantity Picker Button Use Cases
enum QuantityButtonUseCase {
    case add       // ➕
    case subtract  // ➖
    case delete    // 🗑️
}

/// Quantity Picker Component
struct QuantityPicker: View {
    @Binding var quantity: Int
    let color: QuantityPickerColor
    let size: QuantityPickerSize
    let expansion: QuantityPickerExpansion
    let minQuantity: Int
    let maxQuantity: Int
    let onDelete: (() -> Void)?
    
    @State private var isExpanded: Bool = false
    
    init(
        quantity: Binding<Int>,
        color: QuantityPickerColor = .orange,
        size: QuantityPickerSize = .small,
        expansion: QuantityPickerExpansion = .right,
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
            if expansion == .left && isExpanded {
                buttonControls
            }
            
            quantityDisplay
            
            if expansion == .right && isExpanded {
                buttonControls
            }
        }
        .padding(.horizontal, size.horizontalPadding)
        .padding(.vertical, size.verticalPadding)
        .background(backgroundColor)
        .cornerRadius(size == .large ? BorderTokens.radius999 : BorderTokens.radius5)
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.2)) {
                isExpanded = true
            }
        }
    }
    
    // MARK: - Subviews
    
    private var quantityDisplay: some View {
        HStack(spacing: SpacingTokens.spacing2) {
            Text("\(quantity)")
                .font(textFont)
                .foregroundColor(textColor)
                .frame(minWidth: 14)
        }
        .padding(.horizontal, SpacingTokens.spacing3)
        .padding(.vertical, SpacingTokens.spacing1)
        .frame(height: size.height)
    }
    
    @ViewBuilder
    private var buttonControls: some View {
        HStack(spacing: SpacingTokens.spacing0) {
            // Subtract or Delete button
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
            
            // Add button
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
    }
    
    // MARK: - Color Logic
    
    private var textFont: Font {
        color == .orange ? TypographyTokens.bodySmBold : TypographyTokens.bodySmRegular
    }
    
    private var textColor: Color {
        switch color {
        case .orange:
            return QuantityPickerColorTokens.textButtonOrangeFilledDefault
        case .grey:
            return QuantityPickerColorTokens.textInputTransparent10Default
        }
    }
    
    private var backgroundColor: Color {
        if isExpanded {
            switch color {
            case .orange:
                // Gradient background for orange
                return QuantityPickerColorTokens.backgroundInputBrandFilledDefault
            case .grey:
                return QuantityPickerColorTokens.backgroundInputTransparent10Default
            }
        } else {
            switch color {
            case .orange:
                return QuantityPickerColorTokens.backgroundInputBrandFilledDefault
            case .grey:
                return QuantityPickerColorTokens.backgroundInputTransparent10Default
            }
        }
    }
}

/// Quantity Button Component (for +/-/trash icons)
struct QuantityButton: View {
    let icon: String
    let size: QuantityPickerSize
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
                .cornerRadius(BorderTokens.radius999)
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
    
    private var buttonSize: CGFloat {
        switch size {
        case .small: return 28
        case .medium: return 28
        case .large: return 36
        }
    }
    
    private var iconColor: Color {
        if isDisabled {
            return QuantityPickerColorTokens.iconInputInactive
        }
        return QuantityPickerColorTokens.iconOnContainerInverse
    }
    
    private var buttonBackground: Color {
        if isPressed && !isDisabled {
            return QuantityPickerColorTokens.transparentBlack075
        }
        return QuantityPickerColorTokens.backgroundButtonGhostFilledDefault
    }
}

/// Standalone Quantity Button (for use outside Quantity Picker)
struct StandaloneQuantityButton: View {
    let useCase: QuantityButtonUseCase
    let size: QuantityPickerSize
    let isDisabled: Bool
    let action: () -> Void
    
    @State private var isPressed: Bool = false
    
    init(
        useCase: QuantityButtonUseCase,
        size: QuantityPickerSize = .small,
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
                .cornerRadius(BorderTokens.radius999)
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
        .padding(size == .small ? SpacingTokens.spacing1 : SpacingTokens.spacing0)
    }
    
    private var iconName: String {
        switch useCase {
        case .add: return "plus"
        case .subtract: return "minus"
        case .delete: return "trash"
        }
    }
    
    private var buttonSize: CGFloat {
        size == .small ? 28 : 36
    }
    
    private var iconColor: Color {
        if isDisabled {
            return QuantityPickerColorTokens.iconInputInactive
        }
        return QuantityPickerColorTokens.iconInputDefault
    }
    
    private var buttonBackground: Color {
        if isPressed && !isDisabled {
            return QuantityPickerColorTokens.backgroundButtonGhostFilledPressed
        }
        return QuantityPickerColorTokens.backgroundButtonGhostFilledDefault
    }
}

// MARK: - Color Extension
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

// MARK: - Previews
#Preview("Quantity Picker Variants") {
    ScrollView {
        VStack(alignment: .leading, spacing: 24) {
            // Title
            Text("Quantity Picker")
                .font(.system(size: 48, weight: .medium))
                .padding(.bottom, 20)
            
            // Orange - Expands from Right
            VStack(alignment: .leading, spacing: 12) {
                Text("Orange - Expands from Right")
                    .font(.headline)
                
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
            
            // Standalone Quantity Buttons
            VStack(alignment: .leading, spacing: 12) {
                Text("Quantity Buttons")
                    .font(.headline)
                
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
    .background(Color.white)
}
