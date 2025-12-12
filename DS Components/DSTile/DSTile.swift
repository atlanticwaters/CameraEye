import SwiftUI

// MARK: - DSTile

/// A tile selector component with multiple styles, sizes, and interaction states.
///
/// DSTile supports 3 variants (outlined, filled, ghost), 2 sizes (regular, small),
/// and various interaction states (default, pressed, loading, inactive). Tiles can display
/// an image with optional swatch, text label, and support selected/available states.
///
/// Example usage:
/// ```swift
/// DSTile(
///     "Wacky",
///     variant: .outlined,
///     size: .regular,
///     image: Image("product"),
///     swatch: Color.orange
/// ) {
///     // Action
/// }
/// ```
public struct DSTile: View {
    // MARK: Lifecycle

    /// Creates a DSTile with the specified configuration.
    public init(
        _ label: String,
        variant: Variant = .outlined,
        size: Size = .regular,
        interaction: Interaction = .default,
        isSelected: Bool = false,
        isAvailable: Bool = true,
        image: Image? = nil,
        swatch: Color? = nil,
        showFocus: Bool = false,
        action: (() -> Void)? = nil
    ) {
        self.label = label
        self.variant = variant
        self.size = size
        self.interaction = interaction
        self.isSelected = isSelected
        self.isAvailable = isAvailable
        self.image = image
        self.swatch = swatch
        self.showFocus = showFocus
        self.action = action
    }

    // MARK: Public

    /// Tile variant styles
    public enum Variant: CaseIterable {
        case outlined
        case filled
        case ghost
    }

    /// Tile size variants
    public enum Size: CaseIterable {
        case regular
        case small

        // MARK: Internal

        /// Tile height from Figma
        var height: CGFloat {
            switch self {
            case .regular: 44
            case .small: 28
            }
        }

        /// Image size from Figma
        var imageSize: CGFloat {
            switch self {
            case .regular: 28
            case .small: 28
            }
        }

        /// Swatch size from Figma
        var swatchSize: CGFloat {
            switch self {
            case .regular: 28
            case .small: 28
            }
        }

        /// Font size
        var fontSize: CGFloat {
            TokensCoreLight.FontSizeBodySm
        }

        /// Content spacing (between image and text)
        var contentSpacing: CGFloat {
            8 // spacing-2
        }
    }

    /// Tile interaction state
    public enum Interaction: CaseIterable {
        case `default`
        case pressed
        case loading
        case inactive
    }

    public var body: some View {
        if let action {
            Button(action: action) {
                tileContent
            }
            .buttonStyle(TileButtonStyle(variant: variant, interaction: interaction))
            .disabled(interaction == .inactive || !isAvailable)
        } else {
            tileContent
        }
    }

    // MARK: Private

    private let label: String
    private let variant: Variant
    private let size: Size
    private let interaction: Interaction
    private let isSelected: Bool
    private let isAvailable: Bool
    private let image: Image?
    private let swatch: Color?
    private let showFocus: Bool
    private let action: (() -> Void)?

    @Environment(\.colorScheme) private var colorScheme

    @ViewBuilder
    private var tileContent: some View {
        ZStack {
            HStack(spacing: size.contentSpacing) {
                // Leading media (image + optional swatch)
                if let image {
                    imageView(image)
                }

                // Label
                Text(label)
                    .font(.custom(TokensCoreLight.FontFamilyInformational, size: size.fontSize))
                    .fontWeight(.semibold)
                    .foregroundColor(textColor)
                    .lineLimit(1)
            }
            .padding(.horizontal, 8) // spacing-2
            .frame(height: size.height)
            .background(backgroundColor)
            .overlay(
                RoundedRectangle(cornerRadius: borderRadius)
                    .stroke(borderColor, lineWidth: borderWidth)
            )
            .clipShape(RoundedRectangle(cornerRadius: borderRadius))

            // Focus outline
            if showFocus {
                RoundedRectangle(cornerRadius: borderRadius)
                    .stroke(focusColor, lineWidth: 1)
                    .padding(-2)
            }

            // Loading indicator
            if interaction == .loading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: textColor))
                    .frame(width: 16, height: 16)
            }
        }
    }

    @ViewBuilder
    private func imageView(_ img: Image) -> some View {
        ZStack(alignment: .bottomTrailing) {
            // Main image
            img
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: size.imageSize, height: size.imageSize)
                .clipShape(RoundedRectangle(cornerRadius: 4))

            // Diagonal strikethrough if not available
            if !isAvailable {
                diagonalStrikethrough
            }

            // Optional swatch
            if let swatch {
                Circle()
                    .fill(swatch)
                    .frame(width: size.swatchSize * 0.35, height: size.swatchSize * 0.35)
                    .overlay(
                        Circle()
                            .stroke(Color.white, lineWidth: 1)
                    )
                    .offset(x: 6, y: 6)
            }
        }
        .frame(width: size.imageSize, height: size.imageSize)
    }

    @ViewBuilder
    private var diagonalStrikethrough: some View {
        ZStack {
            // Dark diagonal
            Path { path in
                path.move(to: CGPoint(x: 0, y: size.imageSize))
                path.addLine(to: CGPoint(x: size.imageSize, y: 0))
            }
            .stroke(Color.gray, lineWidth: 2)

            // Light diagonal
            Path { path in
                path.move(to: CGPoint(x: 0, y: size.imageSize))
                path.addLine(to: CGPoint(x: size.imageSize, y: 0))
            }
            .stroke(Color.white.opacity(0.7), lineWidth: 1)
        }
    }

    // MARK: - Color Helpers

    private var backgroundColor: Color {
        let isDark = colorScheme == .dark

        switch (variant, isSelected, interaction) {
        case (.outlined, false, .default):
            return isDark ? TokensSemanticDark.BackgroundSelectorColorOutlineDefault : TokensSemanticLight.BackgroundSelectorColorOutlineDefault
        case (.outlined, false, .pressed):
            return isDark ? TokensSemanticDark.BackgroundSelectorColorOutlinePressed : TokensSemanticLight.BackgroundSelectorColorOutlinePressed
        case (.outlined, false, .inactive), (.outlined, false, .loading):
            return isDark ? TokensSemanticDark.BackgroundSelectorColorOutlineInactive : TokensSemanticLight.BackgroundSelectorColorOutlineInactive
        case (.outlined, true, .default):
            return isDark ? TokensSemanticDark.BackgroundSelectorColorOutlineSelected : TokensSemanticLight.BackgroundSelectorColorOutlineSelected
        case (.outlined, true, .pressed):
            return isDark ? TokensSemanticDark.BackgroundSelectorColorOutlinePressed : TokensSemanticLight.BackgroundSelectorColorOutlinePressed
        case (.outlined, true, .inactive), (.outlined, true, .loading):
            return isDark ? TokensSemanticDark.BackgroundSelectorColorOutlineInactive : TokensSemanticLight.BackgroundSelectorColorOutlineInactive

        case (.filled, false, .default):
            return isDark ? TokensSemanticDark.BackgroundSelectorColorFilledDefault : TokensSemanticLight.BackgroundSelectorColorFilledDefault
        case (.filled, false, .pressed):
            return isDark ? TokensSemanticDark.BackgroundSelectorColorFilledPressed : TokensSemanticLight.BackgroundSelectorColorFilledPressed
        case (.filled, false, .inactive), (.filled, false, .loading):
            return isDark ? TokensSemanticDark.BackgroundSelectorColorFilledInactive : TokensSemanticLight.BackgroundSelectorColorFilledInactive
        case (.filled, true, .default):
            return isDark ? TokensSemanticDark.BackgroundSelectorColorFilledSelected : TokensSemanticLight.BackgroundSelectorColorFilledSelected
        case (.filled, true, .pressed):
            return isDark ? TokensSemanticDark.BackgroundSelectorColorFilledPressed : TokensSemanticLight.BackgroundSelectorColorFilledPressed
        case (.filled, true, .inactive), (.filled, true, .loading):
            return isDark ? TokensSemanticDark.BackgroundSelectorColorFilledInactive : TokensSemanticLight.BackgroundSelectorColorFilledInactive

        case (.ghost, _, .default):
            return Color.clear
        case (.ghost, _, .pressed):
            return isDark ? TokensSemanticDark.BackgroundSelectorColorOutlinePressed : TokensSemanticLight.BackgroundSelectorColorOutlinePressed
        case (.ghost, _, .inactive), (.ghost, _, .loading):
            return isDark ? TokensSemanticDark.BackgroundSelectorColorOutlineInactive : TokensSemanticLight.BackgroundSelectorColorOutlineInactive
        }
    }

    private var textColor: Color {
        let isDark = colorScheme == .dark

        switch (variant, isSelected, interaction) {
        case (.outlined, false, .default), (.outlined, false, .pressed), (.outlined, false, .loading):
            return isDark ? TokensSemanticDark.TextSelectorColorOutlineDefault : TokensSemanticLight.TextSelectorColorOutlineDefault
        case (.outlined, false, .inactive):
            return isDark ? TokensSemanticDark.TextSelectorColorOutlineInactive : TokensSemanticLight.TextSelectorColorOutlineInactive
        case (.outlined, true, _):
            return isDark ? TokensSemanticDark.TextSelectorColorOutlineSelected : TokensSemanticLight.TextSelectorColorOutlineSelected

        case (.filled, false, .default), (.filled, false, .pressed), (.filled, false, .loading):
            return isDark ? TokensSemanticDark.TextSelectorColorFilledDefault : TokensSemanticLight.TextSelectorColorFilledDefault
        case (.filled, false, .inactive):
            return isDark ? TokensSemanticDark.TextSelectorColorFilledInactive : TokensSemanticLight.TextSelectorColorFilledInactive
        case (.filled, true, _):
            return isDark ? TokensSemanticDark.TextSelectorColorFilledSelected : TokensSemanticLight.TextSelectorColorFilledSelected

        case (.ghost, false, _):
            return isDark ? TokensSemanticDark.TextSelectorColorDefault : TokensSemanticLight.TextSelectorColorDefault
        case (.ghost, true, _):
            return isDark ? TokensSemanticDark.TextSelectorColorSelected : TokensSemanticLight.TextSelectorColorSelected
        }
    }

    private var borderColor: Color {
        let isDark = colorScheme == .dark

        switch (variant, isSelected, interaction) {
        case (.outlined, false, .default):
            return isDark ? TokensSemanticDark.BorderSelectorColorOutlineDefault : TokensSemanticLight.BorderSelectorColorOutlineDefault
        case (.outlined, false, .pressed):
            return isDark ? TokensSemanticDark.BorderSelectorColorOutlinePressed : TokensSemanticLight.BorderSelectorColorOutlinePressed
        case (.outlined, false, .inactive), (.outlined, false, .loading):
            return isDark ? TokensSemanticDark.BorderSelectorColorOutlineInactive : TokensSemanticLight.BorderSelectorColorOutlineInactive
        case (.outlined, true, _):
            return isDark ? TokensSemanticDark.BorderSelectorColorOutlineSelected : TokensSemanticLight.BorderSelectorColorOutlineSelected

        case (.filled, false, .default):
            return isDark ? TokensSemanticDark.BorderSelectorColorFilledDefault : TokensSemanticLight.BorderSelectorColorFilledDefault
        case (.filled, false, .pressed):
            return isDark ? TokensSemanticDark.BorderSelectorColorFilledPressed : TokensSemanticLight.BorderSelectorColorFilledPressed
        case (.filled, false, .inactive), (.filled, false, .loading):
            return isDark ? TokensSemanticDark.BorderSelectorColorFilledInactive : TokensSemanticLight.BorderSelectorColorFilledInactive
        case (.filled, true, _):
            return isDark ? TokensSemanticDark.BorderSelectorColorFilledSelected : TokensSemanticLight.BorderSelectorColorFilledSelected

        case (.ghost, _, _):
            return Color.clear
        }
    }

    private var borderWidth: CGFloat {
        switch variant {
        case .outlined, .filled:
            return TokensSemanticLight.BorderWidthXs
        case .ghost:
            return 0
        }
    }

    private var borderRadius: CGFloat {
        8 // From Figma: border-radius (8px)
    }

    private var focusColor: Color {
        Color.black
    }
}

// MARK: - TileButtonStyle

/// A custom button style that handles press states for DSTile.
private struct TileButtonStyle: ButtonStyle {
    let variant: DSTile.Variant
    let interaction: DSTile.Interaction

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.98 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}

// MARK: - Factory Methods

extension DSTile {
    /// Creates an outlined tile.
    public static func outlined(
        _ label: String,
        image: Image? = nil,
        swatch: Color? = nil,
        isSelected: Bool = false,
        isAvailable: Bool = true,
        action: (() -> Void)? = nil
    ) -> DSTile {
        DSTile(
            label,
            variant: .outlined,
            isSelected: isSelected,
            isAvailable: isAvailable,
            image: image,
            swatch: swatch,
            action: action
        )
    }

    /// Creates a filled tile.
    public static func filled(
        _ label: String,
        image: Image? = nil,
        swatch: Color? = nil,
        isSelected: Bool = false,
        isAvailable: Bool = true,
        action: (() -> Void)? = nil
    ) -> DSTile {
        DSTile(
            label,
            variant: .filled,
            isSelected: isSelected,
            isAvailable: isAvailable,
            image: image,
            swatch: swatch,
            action: action
        )
    }

    /// Creates a ghost tile.
    public static func ghost(
        _ label: String,
        image: Image? = nil,
        swatch: Color? = nil,
        isSelected: Bool = false,
        isAvailable: Bool = true,
        action: (() -> Void)? = nil
    ) -> DSTile {
        DSTile(
            label,
            variant: .ghost,
            isSelected: isSelected,
            isAvailable: isAvailable,
            image: image,
            swatch: swatch,
            action: action
        )
    }
}
