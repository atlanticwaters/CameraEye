import SwiftUI

// MARK: - PillMedia

/// Media content for pills - icons, images, or color swatches
public enum PillMedia {
    case icon(Image)
    case image(Image)
    case swatch(Color, Color)  // gradient colors: start, end
    
    // MARK: Internal
    
    /// Size of the media based on pill size
    func size(for pillSize: DSPill.Size) -> CGFloat {
        switch (self, pillSize) {
        case (.icon, .extraLarge), (.icon, .large):
            return 48  // Icon LG
        case (.icon, .medium), (.icon, .small):
            return 14  // Icon SM
        case (.image, .extraLarge), (.image, .large), (.swatch, .extraLarge), (.swatch, .large):
            return 48  // Image/Swatch LG
        case (.image, .medium), (.image, .small), (.swatch, .medium), (.swatch, .small):
            return 32  // Image/Swatch SM
        }
    }
}

// MARK: - DSPill

/// A pill-shaped selector component (also known as a chip or tag) with multiple styles and sizes.
///
/// DSPill supports 2 styles (outlined, filled), 4 sizes (xl, lg, md, sm), and
/// various interaction states (default, pressed, selected, disabled). Optional leading and
/// trailing media (icons, images, swatches) and icons can be displayed alongside the label text.
///
/// Example usage:
/// ```swift
/// DSPill(
///     "Cumberland",
///     style: .outlined,
///     size: .medium,
///     leadingMedia: .icon(Image(systemName: "mappin")),
///     trailingIcon: Image(systemName: "chevron.down")
/// ) {
///     // Action
/// }
/// ```
public struct DSPill: View {
    // MARK: Lifecycle

    /// Creates a DSPill with the specified configuration.
    public init(
        _ label: String,
        style: Style = .outlined,
        size: Size = .medium,
        state: State = .default,
        leadingMedia: PillMedia? = nil,
        leadingIcon: Image? = nil,
        trailingIcon: Image? = nil,
        showBackground: Bool = true,
        action: (() -> Void)? = nil
    ) {
        self.label = label
        self.style = style
        self.size = size
        self.state = state
        self.leadingMedia = leadingMedia
        self.leadingIcon = leadingIcon
        self.trailingIcon = trailingIcon
        self.showBackground = showBackground
        self.action = action
    }

    // MARK: Public

    /// Pill style variants
    public enum Style: CaseIterable {
        case outlined
        case filled
    }

    /// Pill size variants matching Figma specs
    public enum Size: CaseIterable {
        case extraLarge
        case large
        case medium
        case small

        // MARK: Internal

        /// Pill height from Figma: XL=68, Lg=44, Md=36, Sm=28
        var height: CGFloat {
            switch self {
            case .extraLarge: 68
            case .large: 44
            case .medium: 36
            case .small: 28
            }
        }

        /// Vertical padding from Figma
        var verticalPadding: CGFloat {
            switch self {
            case .extraLarge, .large: 8  // Figma: spacing-2
            case .medium, .small: 6      // Figma: spacing-6px
            }
        }

        /// Horizontal padding from Figma: 16px for all sizes
        var horizontalPadding: CGFloat {
            16 // Figma: spacing-4
        }

        /// Icon size
        var iconSize: CGFloat {
            switch self {
            case .extraLarge, .large: 14
            case .medium, .small: 14
            }
        }
    }

    /// Pill interaction state
    public enum State: CaseIterable {
        case `default`
        case pressed
        case selected
        case disabled
    }

    public var body: some View {
        Button(action: {
            action?()
        }) {
            HStack(spacing: 4) { // Figma: spacing-1
                // Leading media (icon, image, or swatch)
                if let media = leadingMedia {
                    mediaView(media)
                } else if let icon = leadingIcon {
                    // Fallback to legacy leadingIcon
                    icon
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: size.iconSize, height: size.iconSize)
                        .foregroundColor(iconColor)
                }

                Text(label)
                    .font(.custom(TokensCoreLight.FontFamilyInformational, size: TokensCoreLight.FontSizeBodySm))
                    .foregroundColor(textColor)
                    .lineLimit(1)

                if let trailingIcon {
                    trailingIcon
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: size.iconSize, height: size.iconSize)
                        .foregroundColor(iconColor)
                }
            }
            .padding(.horizontal, size.horizontalPadding)
            .padding(.vertical, size.verticalPadding)
            .frame(minHeight: size.height)
            .background(backgroundColor)
            .overlay(
                RoundedRectangle(cornerRadius: TokensSemanticLight.BorderRadiusFull)
                    .stroke(borderColor, lineWidth: borderWidth)
            )
            .clipShape(RoundedRectangle(cornerRadius: TokensSemanticLight.BorderRadiusFull))
        }
        .buttonStyle(PillButtonStyle())
        .disabled(state == .disabled)
    }

    // MARK: Private

    private let label: String
    private let style: Style
    private let size: Size
    private let state: State
    private let leadingMedia: PillMedia?
    private let leadingIcon: Image?
    private let trailingIcon: Image?
    private let showBackground: Bool
    private let action: (() -> Void)?

    @Environment(\.colorScheme) private var colorScheme
    
    // MARK: - Media View Helper
    
    @ViewBuilder
    private func mediaView(_ media: PillMedia) -> some View {
        let mediaSize = media.size(for: size)
        
        switch media {
        case .icon(let image):
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: mediaSize, height: mediaSize)
                .foregroundColor(iconColor)
            
        case .image(let image):
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: mediaSize, height: mediaSize)
                .clipShape(Circle())
            
        case .swatch(let startColor, let endColor):
            LinearGradient(
                gradient: Gradient(colors: [startColor, endColor]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .frame(width: mediaSize, height: mediaSize)
            .clipShape(Circle())
        }
    }

    // MARK: - Color Helpers

    private var backgroundColor: Color {
        let lightColor: Color
        let darkColor: Color

        switch (style, state, showBackground) {
        case (.outlined, .default, true):
            lightColor = TokensSemanticLight.BackgroundSelectorColorOutlineDefault
            darkColor = TokensSemanticDark.BackgroundSelectorColorOutlineDefault
        case (.outlined, .pressed, true):
            lightColor = TokensSemanticLight.BackgroundSelectorColorOutlinePressed
            darkColor = TokensSemanticDark.BackgroundSelectorColorOutlinePressed
        case (.outlined, .selected, true):
            lightColor = TokensSemanticLight.BackgroundSelectorColorOutlineSelected
            darkColor = TokensSemanticDark.BackgroundSelectorColorOutlineSelected
        case (.outlined, .disabled, true):
            lightColor = TokensSemanticLight.BackgroundSelectorColorOutlineInactive
            darkColor = TokensSemanticDark.BackgroundSelectorColorOutlineInactive

        case (.filled, .default, true):
            lightColor = TokensSemanticLight.BackgroundButtonColorTransparent05Default
            darkColor = TokensSemanticDark.BackgroundButtonColorTransparent05Default
        case (.filled, .default, false):
            lightColor = TokensSemanticLight.BackgroundSelectorColorFilledTransparent
            darkColor = TokensSemanticDark.BackgroundSelectorColorFilledTransparent
        case (.filled, .pressed, _):
            lightColor = TokensSemanticLight.BackgroundButtonColorTransparent05Pressed
            darkColor = TokensSemanticDark.BackgroundButtonColorTransparent05Pressed
        case (.filled, .selected, _):
            lightColor = TokensSemanticLight.BackgroundSelectorColorFilledSelected
            darkColor = TokensSemanticDark.BackgroundSelectorColorFilledSelected
        case (.filled, .disabled, _):
            lightColor = TokensSemanticLight.BackgroundSelectorColorFilledInactive
            darkColor = TokensSemanticDark.BackgroundSelectorColorFilledInactive

        default:
            lightColor = .clear
            darkColor = .clear
        }

        return colorScheme == .dark ? darkColor : lightColor
    }

    private var borderColor: Color {
        let lightColor: Color
        let darkColor: Color

        switch (style, state) {
        case (.outlined, .default):
            lightColor = TokensSemanticLight.BorderSelectorColorOutlineDefault
            darkColor = TokensSemanticDark.BorderSelectorColorOutlineDefault
        case (.outlined, .pressed):
            lightColor = TokensSemanticLight.BorderSelectorColorOutlinePressed
            darkColor = TokensSemanticDark.BorderSelectorColorOutlinePressed
        case (.outlined, .selected):
            lightColor = TokensSemanticLight.BorderSelectorColorOutlineSelected
            darkColor = TokensSemanticDark.BorderSelectorColorOutlineSelected
        case (.outlined, .disabled):
            lightColor = TokensSemanticLight.BorderSelectorColorOutlineInactive
            darkColor = TokensSemanticDark.BorderSelectorColorOutlineInactive

        case (.filled, _):
            lightColor = .clear
            darkColor = .clear
        }

        return colorScheme == .dark ? darkColor : lightColor
    }

    private var borderWidth: CGFloat {
        style == .outlined ? TokensSemanticLight.Border1 : 0
    }

    private var textColor: Color {
        let lightColor: Color
        let darkColor: Color

        switch state {
        case .default, .pressed:
            lightColor = TokensSemanticLight.TextSelectorColorDefault
            darkColor = TokensSemanticDark.TextSelectorColorDefault
        case .selected:
            lightColor = TokensSemanticLight.TextSelectorColorSelected
            darkColor = TokensSemanticDark.TextSelectorColorSelected
        case .disabled:
            lightColor = TokensSemanticLight.TextSelectorColorInactive
            darkColor = TokensSemanticDark.TextSelectorColorInactive
        }

        return colorScheme == .dark ? darkColor : lightColor
    }

    private var iconColor: Color {
        textColor
    }
}

// MARK: - Button Style

/// Custom button style for pills that prevents default highlighting
private struct PillButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}

// MARK: - Factory Methods

public extension DSPill {
    /// Creates an outlined pill with default settings
    static func outlined(
        _ label: String,
        size: Size = .medium,
        leadingMedia: PillMedia? = nil,
        leadingIcon: Image? = nil,
        trailingIcon: Image? = nil,
        action: (() -> Void)? = nil
    ) -> DSPill {
        DSPill(
            label,
            style: .outlined,
            size: size,
            leadingMedia: leadingMedia,
            leadingIcon: leadingIcon,
            trailingIcon: trailingIcon,
            action: action
        )
    }

    /// Creates a filled pill with default settings
    static func filled(
        _ label: String,
        size: Size = .medium,
        leadingMedia: PillMedia? = nil,
        leadingIcon: Image? = nil,
        trailingIcon: Image? = nil,
        showBackground: Bool = true,
        action: (() -> Void)? = nil
    ) -> DSPill {
        DSPill(
            label,
            style: .filled,
            size: size,
            leadingMedia: leadingMedia,
            leadingIcon: leadingIcon,
            trailingIcon: trailingIcon,
            showBackground: showBackground,
            action: action
        )
    }
}
