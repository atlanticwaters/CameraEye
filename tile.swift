import SwiftUI

// MARK: - Tile Component System
// THD App Design System - Tile Components

// MARK: - Design Tokens (Extended from Badge/Pill/Button/Quantity)

/// Typography tokens from Figma design system
struct TypographyTokens {
    static let bodySmRegularTight = Font.system(size: 14, weight: .regular).leading(.tight) // Body Sm/Regular/Tight
    static let bodySmSemiboldTight = Font.system(size: 14, weight: .semibold).leading(.tight) // Body Sm/SemiBold/Tight
    static let bodyMdRegularTight = Font.system(size: 16, weight: .regular).leading(.tight) // Body Md/Regular/Tight
    static let bodyMdSemiboldTight = Font.system(size: 16, weight: .semibold).leading(.tight) // Body Md/SemiBold/Tight
}

/// Spacing tokens from Figma
struct SpacingTokens {
    static let spacing0: CGFloat = 0
    static let spacing2: CGFloat = 8
    static let spacing2px: CGFloat = 2
    static let tilePaddingLR: CGFloat = 8
    static let tilePaddingTB: CGFloat = 8
    static let tileContentGap: CGFloat = 8
}

/// Border tokens from Figma
struct BorderTokens {
    static let borderWidthXs: CGFloat = 1
    static let borderWidthSm: CGFloat = 2
    static let radiusSm: CGFloat = 2
    static let radius2xl: CGFloat = 12
    static let radiusFull: CGFloat = 9999
    static let tileBorderRadius: CGFloat = 8
    static let tileMediaBorderRadius: CGFloat = 4
}

/// Tile color tokens from Figma
struct TileColorTokens {
    // Outlined variant
    static let backgroundSelectorOutlineDefault = Color(hex: "#ffffff")
    static let borderSelectorOutlineDefault = Color(hex: "#979492")
    static let borderSelectorOutlineSelected = Color(hex: "#252524")
    static let borderSelectorOutlineInactive = Color(hex: "#bab7b4")
    static let borderSelectorOutlinePressed = Color(hex: "#585756")
    static let backgroundSelectorOutlinePressed = Color(hex: "#e5e1de")
    
    // Filled variant
    static let backgroundSelectorFilledDefault = Color(hex: "#0000000d")
    static let backgroundSelectorFilledSelected = Color(hex: "#252524")
    static let backgroundSelectorFilledPressed = Color(hex: "#0000001a")
    static let backgroundSelectorFilledInactive = Color(hex: "#e5e1de")
    
    // Text colors
    static let textSelectorDefault = Color(hex: "#474545")
    static let textSelectorSelected = Color(hex: "#fbfaf9")
    static let textSelectorActive = Color(hex: "#252524")
    static let textSelectorInactive = Color(hex: "#979492")
    static let tileLabelColor = Color(hex: "#202020")
    
    // Utility
    static let greige500 = Color(hex: "#787675")
    static let greige100 = Color(hex: "#e5e1de")
    static let greige900 = Color(hex: "#252524")
    static let borderPrimary = Color(hex: "#bfbfbf")
    static let iconOnContainerTertiary = Color(hex: "#6a6867")
    
    // Transparent
    static let transparentBlack100 = Color(hex: "#0000001a")
    static let transparentBlack300 = Color(hex: "#00000033")
    static let transparent = Color(hex: "#00000000")
}

/// Tile variant styles
enum TileVariant {
    case outlined
    case filled
    case ghost
}

/// Tile interaction states
enum TileInteraction {
    case `default`
    case pressed
    case inactive
    case loading
}

/// Tile layout variants
enum TileLayout {
    case horizontal  // Image on left, text on right, optional dot
    case vertical    // Image on top, text below
    case composed    // Custom content slot with optional dot
}

/// Tile size variants
enum TileSize {
    case regular  // 14pt font
    case small    // 14pt font (same as regular in design)
    
    var fontSize: Font {
        TypographyTokens.bodyMdRegularTight
    }
    
    var fontSizeSelected: Font {
        TypographyTokens.bodyMdSemiboldTight
    }
}

/// Tile Component
struct Tile: View {
    let text: String
    let imageName: String?
    let variant: TileVariant
    let layout: TileLayout
    let size: TileSize
    let isSelected: Bool
    let isAvailable: Bool
    let interaction: TileInteraction
    let showDot: Bool
    let customContent: (() -> AnyView)?
    let action: () -> Void
    
    @State private var isPressed: Bool = false
    
    init(
        text: String,
        imageName: String? = nil,
        variant: TileVariant = .outlined,
        layout: TileLayout = .horizontal,
        size: TileSize = .regular,
        isSelected: Bool = false,
        isAvailable: Bool = true,
        interaction: TileInteraction = .default,
        showDot: Bool = false,
        customContent: (() -> AnyView)? = nil,
        action: @escaping () -> Void = {}
    ) {
        self.text = text
        self.imageName = imageName
        self.variant = variant
        self.layout = layout
        self.size = size
        self.isSelected = isSelected
        self.isAvailable = isAvailable
        self.interaction = interaction
        self.showDot = showDot
        self.customContent = customContent
        self.action = action
    }
    
    var body: some View {
        Button(action: {
            if interaction != .inactive && interaction != .loading {
                action()
            }
        }) {
            ZStack {
                contentView
                    .padding(.horizontal, SpacingTokens.tilePaddingLR)
                    .padding(.vertical, SpacingTokens.tilePaddingTB)
                    .frame(minHeight: 44)
                    .background(backgroundColor)
                    .overlay(
                        RoundedRectangle(cornerRadius: BorderTokens.radius2xl)
                            .stroke(borderColor, lineWidth: borderWidth)
                    )
                    .cornerRadius(BorderTokens.radius2xl)
                    .opacity(opacityValue)
            }
        }
        .disabled(interaction == .inactive || interaction == .loading)
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in
                    if interaction == .default {
                        isPressed = true
                    }
                }
                .onEnded { _ in
                    isPressed = false
                }
        )
    }
    
    // MARK: - Content Views
    
    @ViewBuilder
    private var contentView: some View {
        switch layout {
        case .horizontal:
            horizontalLayout
        case .vertical:
            verticalLayout
        case .composed:
            composedLayout
        }
    }
    
    private var horizontalLayout: some View {
        HStack(spacing: SpacingTokens.tileContentGap) {
            if let imageName = imageName {
                tileMedia(width: 28)
            }
            
            if interaction == .loading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: textColor))
            } else {
                Text(text)
                    .font(textFont)
                    .foregroundColor(textColor)
                    .lineLimit(1)
            }
            
            if showDot {
                Spacer()
                tileDot
            }
        }
    }
    
    private var verticalLayout: some View {
        VStack(alignment: .leading, spacing: SpacingTokens.tileContentGap) {
            if let imageName = imageName {
                tileMedia(width: nil, minWidth: 112)
            }
            
            HStack {
                if interaction == .loading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: textColor))
                } else {
                    Text(text)
                        .font(textFont)
                        .foregroundColor(textColor)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                if showDot {
                    tileDot
                }
            }
        }
    }
    
    private var composedLayout: some View {
        HStack(spacing: SpacingTokens.tileContentGap) {
            if let customContent = customContent {
                customContent()
            } else {
                // Default placeholder
                ZStack {
                    RoundedRectangle(cornerRadius: 2)
                        .stroke(TileColorTokens.borderPrimary, style: StrokeStyle(lineWidth: 1, dash: [2]))
                        .frame(width: 40, height: 40)
                    
                    Image(systemName: "slider.horizontal.3")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .foregroundColor(TileColorTokens.iconOnContainerTertiary)
                }
            }
            
            Spacer()
            
            if showDot {
                tileDot
            }
        }
    }
    
    @ViewBuilder
    private func tileMedia(width: CGFloat?, minWidth: CGFloat? = nil) -> some View {
        Group {
            if let imageName = imageName {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: width, height: width)
                    .frame(minWidth: minWidth)
                    .clipped()
                    .cornerRadius(BorderTokens.radiusSm)
            } else {
                // Placeholder
                Rectangle()
                    .fill(TileColorTokens.greige100)
                    .frame(width: width ?? 112, height: width ?? 112)
                    .cornerRadius(BorderTokens.radiusSm)
            }
        }
    }
    
    private var tileDot: some View {
        Circle()
            .strokeBorder(TileColorTokens.greige500, lineWidth: 2)
            .frame(width: 16, height: 16)
    }
    
    // MARK: - Color & Style Logic
    
    private var textFont: Font {
        if isSelected {
            return size.fontSizeSelected
        }
        return size.fontSize
    }
    
    private var textColor: Color {
        if !isAvailable {
            return TileColorTokens.textSelectorInactive
        }
        
        if isSelected {
            switch variant {
            case .outlined:
                return TileColorTokens.textSelectorDefault
            case .filled, .ghost:
                return TileColorTokens.textSelectorSelected
            }
        }
        
        return TileColorTokens.textSelectorDefault
    }
    
    private var backgroundColor: Color {
        if interaction == .loading {
            // Loading state keeps the selected/unselected background
            return isSelected ? selectedBackgroundColor : unselectedBackgroundColor
        }
        
        if interaction == .pressed || isPressed {
            switch variant {
            case .outlined:
                return TileColorTokens.backgroundSelectorOutlinePressed
            case .filled, .ghost:
                return TileColorTokens.backgroundSelectorFilledPressed
            }
        }
        
        if interaction == .inactive {
            return TileColorTokens.backgroundSelectorFilledInactive
        }
        
        return isSelected ? selectedBackgroundColor : unselectedBackgroundColor
    }
    
    private var selectedBackgroundColor: Color {
        switch variant {
        case .outlined:
            return TileColorTokens.backgroundSelectorOutlineDefault
        case .filled, .ghost:
            return TileColorTokens.backgroundSelectorFilledSelected
        }
    }
    
    private var unselectedBackgroundColor: Color {
        switch variant {
        case .outlined:
            return TileColorTokens.backgroundSelectorOutlineDefault
        case .filled:
            return TileColorTokens.backgroundSelectorFilledDefault
        case .ghost:
            return TileColorTokens.transparent
        }
    }
    
    private var borderColor: Color {
        guard variant == .outlined else {
            return .clear
        }
        
        if !isAvailable {
            return TileColorTokens.borderSelectorOutlineInactive
        }
        
        if interaction == .pressed || isPressed {
            return TileColorTokens.borderSelectorOutlinePressed
        }
        
        if isSelected {
            return TileColorTokens.borderSelectorOutlineSelected
        }
        
        return TileColorTokens.borderSelectorOutlineDefault
    }
    
    private var borderWidth: CGFloat {
        if variant == .outlined {
            if isSelected {
                return BorderTokens.borderWidthSm
            }
            return BorderTokens.borderWidthXs
        }
        return 0
    }
    
    private var opacityValue: Double {
        if interaction == .inactive && !isAvailable {
            return 0.25 // Style/opacity-disabled from Figma
        }
        return 1.0
    }
}

// MARK: - Convenience Tile Variants

/// Outlined Tile
struct OutlinedTile: View {
    let text: String
    let imageName: String?
    let isSelected: Bool
    let isAvailable: Bool
    let showDot: Bool
    let action: () -> Void
    
    init(
        text: String,
        imageName: String? = nil,
        isSelected: Bool = false,
        isAvailable: Bool = true,
        showDot: Bool = false,
        action: @escaping () -> Void = {}
    ) {
        self.text = text
        self.imageName = imageName
        self.isSelected = isSelected
        self.isAvailable = isAvailable
        self.showDot = showDot
        self.action = action
    }
    
    var body: some View {
        Tile(
            text: text,
            imageName: imageName,
            variant: .outlined,
            layout: .horizontal,
            isSelected: isSelected,
            isAvailable: isAvailable,
            showDot: showDot,
            action: action
        )
    }
}

/// Filled Tile
struct FilledTile: View {
    let text: String
    let imageName: String?
    let isSelected: Bool
    let isAvailable: Bool
    let showDot: Bool
    let action: () -> Void
    
    init(
        text: String,
        imageName: String? = nil,
        isSelected: Bool = false,
        isAvailable: Bool = true,
        showDot: Bool = false,
        action: @escaping () -> Void = {}
    ) {
        self.text = text
        self.imageName = imageName
        self.isSelected = isSelected
        self.isAvailable = isAvailable
        self.showDot = showDot
        self.action = action
    }
    
    var body: some View {
        Tile(
            text: text,
            imageName: imageName,
            variant: .filled,
            layout: .horizontal,
            isSelected: isSelected,
            isAvailable: isAvailable,
            showDot: showDot,
            action: action
        )
    }
}

/// Ghost Tile (same as filled when selected, transparent when not)
struct GhostTile: View {
    let text: String
    let imageName: String?
    let isSelected: Bool
    let isAvailable: Bool
    let showDot: Bool
    let action: () -> Void
    
    init(
        text: String,
        imageName: String? = nil,
        isSelected: Bool = false,
        isAvailable: Bool = true,
        showDot: Bool = false,
        action: @escaping () -> Void = {}
    ) {
        self.text = text
        self.imageName = imageName
        self.isSelected = isSelected
        self.isAvailable = isAvailable
        self.showDot = showDot
        self.action = action
    }
    
    var body: some View {
        Tile(
            text: text,
            imageName: imageName,
            variant: .ghost,
            layout: .horizontal,
            isSelected: isSelected,
            isAvailable: isAvailable,
            showDot: showDot,
            action: action
        )
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
#Preview("Tile Variants") {
    ScrollView {
        VStack(alignment: .leading, spacing: 24) {
            // Title
            Text("Tile")
                .font(.system(size: 48, weight: .medium))
                .padding(.bottom, 20)
            
            // Outlined Tiles
            VStack(alignment: .leading, spacing: 12) {
                Text("Outlined")
                    .font(.headline)
                
                VStack(alignment: .leading, spacing: 8) {
                    OutlinedTile(text: "Wacky", imageName: "photo", isSelected: true)
                    OutlinedTile(text: "Wacky", imageName: "photo", isSelected: false)
                    OutlinedTile(text: "Wacky", imageName: "photo", isSelected: true, isAvailable: false)
                    OutlinedTile(text: "Wacky", imageName: "photo", isSelected: false, isAvailable: false)
                }
            }
            
            // Filled Tiles
            VStack(alignment: .leading, spacing: 12) {
                Text("Filled")
                    .font(.headline)
                
                VStack(alignment: .leading, spacing: 8) {
                    FilledTile(text: "Wacky", imageName: "photo", isSelected: true)
                    FilledTile(text: "Wacky", imageName: "photo", isSelected: false)
                    FilledTile(text: "Wacky", imageName: "photo", isSelected: true, isAvailable: false)
                    FilledTile(text: "Wacky", imageName: "photo", isSelected: false, isAvailable: false)
                }
            }
            
            // Ghost Tiles
            VStack(alignment: .leading, spacing: 12) {
                Text("Ghost")
                    .font(.headline)
                
                VStack(alignment: .leading, spacing: 8) {
                    GhostTile(text: "Wacky", imageName: "photo", isSelected: true)
                    GhostTile(text: "Wacky", imageName: "photo", isSelected: false)
                    GhostTile(text: "Wacky", imageName: "photo", isSelected: true, isAvailable: false)
                    GhostTile(text: "Wacky", imageName: "photo", isSelected: false, isAvailable: false)
                }
            }
            
            Divider().padding(.vertical)
            
            // Layout Variants
            VStack(alignment: .leading, spacing: 12) {
                Text("Layouts")
                    .font(.headline)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Horizontal")
                        .font(.subheadline)
                    Tile(text: "Wacky", imageName: "photo", variant: .outlined, layout: .horizontal, showDot: true)
                    
                    Text("Vertical")
                        .font(.subheadline)
                    Tile(text: "Wacky", imageName: "photo", variant: .outlined, layout: .vertical, showDot: true)
                        .frame(width: 150)
                    
                    Text("Composed")
                        .font(.subheadline)
                    Tile(text: "", variant: .outlined, layout: .composed, showDot: true)
                }
            }
            
            Divider().padding(.vertical)
            
            // Interaction States
            VStack(alignment: .leading, spacing: 12) {
                Text("Interaction States")
                    .font(.headline)
                
                VStack(alignment: .leading, spacing: 8) {
                    Tile(text: "Default", imageName: "photo", variant: .outlined, interaction: .default)
                    Tile(text: "Pressed", imageName: "photo", variant: .outlined, interaction: .pressed)
                    Tile(text: "Loading", imageName: "photo", variant: .outlined, interaction: .loading)
                    Tile(text: "Inactive", imageName: "photo", variant: .outlined, interaction: .inactive)
                }
            }
        }
        .padding()
    }
    .background(Color.white)
}
