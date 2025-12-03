import SwiftUI

// MARK: - Tile Component System
// THD App Design System - Tile Components
//
// This file contains Tile and convenience tile variant components that use
// DesignSystemGlobal tokens for consistent styling.
//
// Components:
// - Tile: Main selectable tile component with multiple layout options
// - OutlinedTile: Convenience wrapper for outlined variant
// - FilledTile: Convenience wrapper for filled variant
// - GhostTile: Convenience wrapper for ghost variant
//
// Design System Integration:
// - Colors: Uses BackgroundSelectorColor*, TextSelectorColor*, BorderSelectorColor*, IconOnContainerColor* tokens
// - Spacing: Uses Spacing* tokens
// - Border: Uses BorderRadius*, BorderWidth* tokens
// - Typography: Uses FontFontSize* tokens

// MARK: - Tile Variant Styles
/// Tile variant styles affecting border and background treatment.
enum THDTileVariant {
    /// Outlined style - visible border, white background
    /// Border: BorderSelectorColorOutline*
    case outlined

    /// Filled style - no border, subtle background changes
    /// Background: BackgroundSelectorColorFilled*
    case filled

    /// Ghost style - transparent background when unselected, filled when selected
    case ghost
}

// MARK: - Tile Interaction States
/// Tile interaction states affecting appearance and behavior.
enum THDTileInteraction {
    /// Default interactive state
    case `default`

    /// Pressed/active state (visual feedback)
    case pressed

    /// Inactive/disabled state
    case inactive

    /// Loading state - shows spinner
    case loading
}

// MARK: - Tile Layout Options
/// Layout variants for tile content arrangement.
enum THDTileLayout {
    /// Horizontal layout - image on left, text on right, optional dot indicator
    case horizontal

    /// Vertical layout - image on top, text below
    case vertical

    /// Composed layout - custom content slot with optional dot indicator
    case composed
}

// MARK: - Tile Size Options
/// Size variants affecting typography.
enum THDTileSize {
    /// Regular size - 16pt font
    case regular

    /// Small size - same as regular in current design
    case small

    /// Font for tile text
    var fontSize: Font {
        .system(size: DesignSystemGlobal.FontFontSizeBodyMd, weight: .regular)
            .leading(.tight)
    }

    /// Font for selected tile text
    var fontSizeSelected: Font {
        .system(size: DesignSystemGlobal.FontFontSizeBodyMd, weight: .semibold)
            .leading(.tight)
    }
}

// MARK: - Tile Component
/// Selectable tile component using DesignSystemGlobal tokens.
///
/// A versatile selection component with multiple layout options (horizontal, vertical, composed),
/// variant styles (outlined, filled, ghost), and states (default, pressed, inactive, loading).
///
/// ## Usage Example:
/// ```swift
/// Tile(
///     text: "Option A",
///     imageName: "photo",
///     variant: .outlined,
///     layout: .horizontal,
///     isSelected: true
/// ) {
///     // Handle selection
/// }
/// ```
///
/// ## Design System Tokens Used:
/// - Background: BackgroundSelectorColorOutlineDefault, BackgroundSelectorColorFilledDefault, etc.
/// - Text: TextSelectorColorDefault, TextSelectorColorFilledSelected, TextSelectorColorInactive
/// - Border: BorderSelectorColorOutline*, BorderRadius2xl, BorderWidthXs, BorderWidthSm
/// - Icons: IconOnContainerColorTertiary
struct Tile: View {
    let text: String
    let imageName: String?
    let variant: THDTileVariant
    let layout: THDTileLayout
    let size: THDTileSize
    let isSelected: Bool
    let isAvailable: Bool
    let interaction: THDTileInteraction
    let showDot: Bool
    let customContent: (() -> AnyView)?
    let action: () -> Void

    @State private var isPressed: Bool = false

    init(
        text: String,
        imageName: String? = nil,
        variant: THDTileVariant = .outlined,
        layout: THDTileLayout = .horizontal,
        size: THDTileSize = .regular,
        isSelected: Bool = false,
        isAvailable: Bool = true,
        interaction: THDTileInteraction = .default,
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
                    .padding(.horizontal, DesignSystemGlobal.Spacing2)
                    .padding(.vertical, DesignSystemGlobal.Spacing2)
                    .frame(minHeight: DesignSystemGlobal.Spacing11)
                    .background(backgroundColor)
                    .overlay(
                        RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadius2xl)
                            .stroke(borderColor, lineWidth: borderWidth)
                    )
                    .cornerRadius(DesignSystemGlobal.BorderRadius2xl)
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

    /// Horizontal layout - image left, text right, optional dot
    private var horizontalLayout: some View {
        HStack(spacing: DesignSystemGlobal.Spacing2) {
            if imageName != nil {
                tileMedia(width: DesignSystemGlobal.Spacing7)
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

    /// Vertical layout - image top, text bottom
    private var verticalLayout: some View {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
            if imageName != nil {
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

    /// Composed layout - custom content with optional dot
    private var composedLayout: some View {
        HStack(spacing: DesignSystemGlobal.Spacing2) {
            if let customContent = customContent {
                customContent()
            } else {
                // Default placeholder
                ZStack {
                    RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusSm)
                        .stroke(DesignSystemGlobal.BorderOnContainerDefault, style: StrokeStyle(lineWidth: 1, dash: [2]))
                        .frame(width: 40, height: 40)

                    Image(systemName: "slider.horizontal.3")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .foregroundColor(DesignSystemGlobal.IconOnContainerColorTertiary)
                }
            }

            Spacer()

            if showDot {
                tileDot
            }
        }
    }

    /// Media/image view helper
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
                    .cornerRadius(DesignSystemGlobal.BorderRadiusSm)
            } else {
                // Placeholder
                Rectangle()
                    .fill(DesignSystemGlobal.GreigeGreige100)
                    .frame(width: width ?? 112, height: width ?? 112)
                    .cornerRadius(DesignSystemGlobal.BorderRadiusSm)
            }
        }
    }

    /// Dot indicator for selection
    private var tileDot: some View {
        Circle()
            .strokeBorder(DesignSystemGlobal.GreigeGreige500, lineWidth: 2)
            .frame(width: 16, height: 16)
    }

    // MARK: - Color & Style Logic

    /// Font based on selection state
    private var textFont: Font {
        if isSelected {
            return size.fontSizeSelected
        }
        return size.fontSize
    }

    /// Text color based on availability, selection, and variant
    private var textColor: Color {
        if !isAvailable {
            return DesignSystemGlobal.TextSelectorColorInactive
        }

        if isSelected {
            switch variant {
            case .outlined:
                return DesignSystemGlobal.TextSelectorColorDefault
            case .filled, .ghost:
                return DesignSystemGlobal.TextSelectorColorFilledSelected
            }
        }

        return DesignSystemGlobal.TextSelectorColorDefault
    }

    /// Background color based on variant, selection, and interaction state
    private var backgroundColor: Color {
        if interaction == .loading {
            return isSelected ? selectedBackgroundColor : unselectedBackgroundColor
        }

        if interaction == .pressed || isPressed {
            switch variant {
            case .outlined:
                return DesignSystemGlobal.BackgroundSelectorColorOutlinePressed
            case .filled, .ghost:
                return DesignSystemGlobal.BackgroundSelectorColorFilledPressed
            }
        }

        if interaction == .inactive {
            return DesignSystemGlobal.BackgroundSelectorColorFilledInactive
        }

        return isSelected ? selectedBackgroundColor : unselectedBackgroundColor
    }

    /// Selected background color for variant
    private var selectedBackgroundColor: Color {
        switch variant {
        case .outlined:
            return DesignSystemGlobal.BackgroundSelectorColorOutlineDefault
        case .filled, .ghost:
            return DesignSystemGlobal.BackgroundSelectorColorFilledSelected
        }
    }

    /// Unselected background color for variant
    private var unselectedBackgroundColor: Color {
        switch variant {
        case .outlined:
            return DesignSystemGlobal.BackgroundSelectorColorOutlineDefault
        case .filled:
            return DesignSystemGlobal.BackgroundSelectorColorFilledTransparent
        case .ghost:
            return .clear
        }
    }

    /// Border color for outlined variant
    private var borderColor: Color {
        guard variant == .outlined else {
            return .clear
        }

        if !isAvailable {
            return DesignSystemGlobal.BorderSelectorColorOutlineInactive
        }

        if interaction == .pressed || isPressed {
            return DesignSystemGlobal.BorderSelectorColorOutlinePressed
        }

        if isSelected {
            return DesignSystemGlobal.BorderSelectorColorOutlineSelected
        }

        return DesignSystemGlobal.BorderSelectorColorOutlineDefault
    }

    /// Border width - thicker when selected
    private var borderWidth: CGFloat {
        if variant == .outlined {
            if isSelected {
                return DesignSystemGlobal.BorderWidthSm
            }
            return DesignSystemGlobal.BorderWidthXs
        }
        return 0
    }

    /// Opacity for inactive unavailable state
    private var opacityValue: Double {
        if interaction == .inactive && !isAvailable {
            return 0.25
        }
        return 1.0
    }
}

// MARK: - Convenience Tile Variants

/// Outlined Tile - convenience wrapper
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

/// Filled Tile - convenience wrapper
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

/// Ghost Tile - convenience wrapper (transparent when unselected, filled when selected)
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

// MARK: - Previews
#Preview("Tile Variants") {
    ScrollView {
        VStack(alignment: .leading, spacing: 24) {
            // Title
            Text("Tile")
                .font(.system(size: 48, weight: .medium))
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)
                .padding(.bottom, 20)

            // Outlined Tiles
            VStack(alignment: .leading, spacing: 12) {
                Text("Outlined")
                    .font(.headline)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

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
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

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
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

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
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Horizontal")
                        .font(.subheadline)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)
                    Tile(text: "Wacky", imageName: "photo", variant: .outlined, layout: .horizontal, showDot: true)

                    Text("Vertical")
                        .font(.subheadline)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)
                    Tile(text: "Wacky", imageName: "photo", variant: .outlined, layout: .vertical, showDot: true)
                        .frame(width: 150)

                    Text("Composed")
                        .font(.subheadline)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)
                    Tile(text: "", variant: .outlined, layout: .composed, showDot: true)
                }
            }

            Divider().padding(.vertical)

            // Interaction States
            VStack(alignment: .leading, spacing: 12) {
                Text("Interaction States")
                    .font(.headline)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

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
    .background(DesignSystemGlobal.BackgroundContainerColorWhite)
}
