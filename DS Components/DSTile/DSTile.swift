import SwiftUI

// MARK: - DSTileVariant

/// Visual style variants for DSTile matching Figma specs.
public enum DSTileVariant: CaseIterable, Sendable {
    /// Outlined tile with border
    case outlined
    /// Filled tile with solid background
    case filled
    /// Ghost tile with no background
    case ghost
}

// MARK: - DSTile

/// A selectable tile component for displaying options with optional media and text.
///
/// DSTile is used for selection interfaces like color swatches, size selectors,
/// or option pickers. It supports media (images/colors), text labels, and various
/// states including selected, disabled, and loading.
///
/// Example usage:
/// ```swift
/// // Simple text tile
/// DSTile("Small", isSelected: true) {
///     print("Selected Small")
/// }
///
/// // Color swatch tile
/// DSTile(
///     color: .red,
///     label: "Red",
///     isSelected: false
/// ) {
///     print("Selected Red")
/// }
///
/// // Image tile
/// DSTile(
///     image: Image("product"),
///     label: "Product",
///     variant: .outlined,
///     isSelected: true
/// ) {
///     print("Selected Product")
/// }
/// ```
public struct DSTile: View {
    // MARK: - Properties

    private let label: String?
    private let image: Image?
    private let color: Color?
    private let variant: DSTileVariant
    private let isSelected: Bool
    private let isDisabled: Bool
    private let isLoading: Bool
    private let action: () -> Void

    // MARK: - Computed Styling

    private var backgroundColor: Color {
        DSTileColorHelper.backgroundColor(variant: variant, isSelected: isSelected, isDisabled: isDisabled)
    }

    private var borderColor: Color {
        DSTileColorHelper.borderColor(variant: variant, isSelected: isSelected, isDisabled: isDisabled)
    }

    private var textColor: Color {
        DSTileColorHelper.textColor(isSelected: isSelected, isDisabled: isDisabled)
    }

    private var borderWidth: CGFloat {
        isSelected ? 2 : 1
    }

    private var cornerRadius: CGFloat {
        CGFloat(TokensSemanticLight.BorderRadiusXl)
    }

    private var mediaCornerRadius: CGFloat {
        4
    }

    // MARK: - Sizing

    private let minHeight: CGFloat = 44
    private let horizontalPadding: CGFloat = 12
    private let verticalPadding: CGFloat = 8
    private let mediaSize: CGFloat = 28
    private let spacing: CGFloat = 8

    // MARK: - Initializers

    /// Creates a tile with a text label.
    /// - Parameters:
    ///   - label: The text to display.
    ///   - variant: The visual style (outlined, filled, ghost).
    ///   - isSelected: Whether the tile is selected.
    ///   - isDisabled: Whether the tile is disabled.
    ///   - isLoading: Whether the tile is in a loading state.
    ///   - action: Action to perform when tapped.
    public init(
        _ label: String,
        variant: DSTileVariant = .outlined,
        isSelected: Bool = false,
        isDisabled: Bool = false,
        isLoading: Bool = false,
        action: @escaping () -> Void
    ) {
        self.label = label
        self.image = nil
        self.color = nil
        self.variant = variant
        self.isSelected = isSelected
        self.isDisabled = isDisabled
        self.isLoading = isLoading
        self.action = action
    }

    /// Creates a tile with a color swatch.
    /// - Parameters:
    ///   - color: The color to display as a swatch.
    ///   - label: Optional text label.
    ///   - variant: The visual style (outlined, filled, ghost).
    ///   - isSelected: Whether the tile is selected.
    ///   - isDisabled: Whether the tile is disabled.
    ///   - isLoading: Whether the tile is in a loading state.
    ///   - action: Action to perform when tapped.
    public init(
        color: Color,
        label: String? = nil,
        variant: DSTileVariant = .outlined,
        isSelected: Bool = false,
        isDisabled: Bool = false,
        isLoading: Bool = false,
        action: @escaping () -> Void
    ) {
        self.label = label
        self.image = nil
        self.color = color
        self.variant = variant
        self.isSelected = isSelected
        self.isDisabled = isDisabled
        self.isLoading = isLoading
        self.action = action
    }

    /// Creates a tile with an image.
    /// - Parameters:
    ///   - image: The image to display.
    ///   - label: Optional text label.
    ///   - variant: The visual style (outlined, filled, ghost).
    ///   - isSelected: Whether the tile is selected.
    ///   - isDisabled: Whether the tile is disabled.
    ///   - isLoading: Whether the tile is in a loading state.
    ///   - action: Action to perform when tapped.
    public init(
        image: Image,
        label: String? = nil,
        variant: DSTileVariant = .outlined,
        isSelected: Bool = false,
        isDisabled: Bool = false,
        isLoading: Bool = false,
        action: @escaping () -> Void
    ) {
        self.label = label
        self.image = image
        self.color = nil
        self.variant = variant
        self.isSelected = isSelected
        self.isDisabled = isDisabled
        self.isLoading = isLoading
        self.action = action
    }

    // MARK: - Body

    public var body: some View {
        Button(action: action) {
            contentView
        }
        .buttonStyle(TileButtonStyle(
            backgroundColor: backgroundColor,
            borderColor: borderColor,
            borderWidth: borderWidth,
            cornerRadius: cornerRadius,
            variant: variant,
            isDisabled: isDisabled
        ))
        .disabled(isDisabled || isLoading)
        .accessibilityElement(children: .combine)
        .accessibilityLabel(accessibilityLabelText)
        .accessibilityAddTraits(isSelected ? .isSelected : [])
        .accessibilityAddTraits(.isButton)
    }

    @ViewBuilder
    private var contentView: some View {
        HStack(spacing: spacing) {
            // Media (color swatch or image)
            if let color {
                colorSwatchView(color: color)
            } else if let image {
                imageView(image: image)
            }

            // Label
            if let label {
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .frame(width: 16, height: 16)
                } else {
                    Text(label)
                        .font(.system(size: 14, weight: isSelected ? .semibold : .regular))
                        .foregroundStyle(textColor)
                }
            }
        }
        .padding(.horizontal, horizontalPadding)
        .padding(.vertical, verticalPadding)
        .frame(minHeight: minHeight)
    }

    @ViewBuilder
    private func colorSwatchView(color: Color) -> some View {
        RoundedRectangle(cornerRadius: mediaCornerRadius)
            .fill(color)
            .frame(width: mediaSize, height: mediaSize)
            .overlay(
                RoundedRectangle(cornerRadius: mediaCornerRadius)
                    .stroke(Color.black.opacity(0.1), lineWidth: 1)
            )
    }

    @ViewBuilder
    private func imageView(image: Image) -> some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: mediaSize, height: mediaSize)
            .clipShape(RoundedRectangle(cornerRadius: mediaCornerRadius))
    }

    // MARK: - Accessibility

    private var accessibilityLabelText: Text {
        var components: [String] = []
        if let label {
            components.append(label)
        }
        if isSelected {
            components.append("Selected")
        }
        if isDisabled {
            components.append("Disabled")
        }
        if isLoading {
            components.append("Loading")
        }
        return Text(components.joined(separator: ", "))
    }
}

// MARK: - TileButtonStyle

/// Custom button style for tiles with press animation.
private struct TileButtonStyle: ButtonStyle {
    let backgroundColor: Color
    let borderColor: Color
    let borderWidth: CGFloat
    let cornerRadius: CGFloat
    let variant: DSTileVariant
    let isDisabled: Bool

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(backgroundView(isPressed: configuration.isPressed))
            .scaleEffect(configuration.isPressed ? 0.97 : 1.0)
            .animation(DSAnimation.press, value: configuration.isPressed)
    }

    @ViewBuilder
    private func backgroundView(isPressed: Bool) -> some View {
        let shape = RoundedRectangle(cornerRadius: cornerRadius)

        switch variant {
        case .outlined:
            shape
                .fill(isPressed ? backgroundColor.opacity(0.9) : backgroundColor)
                .overlay(
                    shape.stroke(borderColor, lineWidth: borderWidth)
                )
        case .filled:
            shape
                .fill(isPressed ? backgroundColor.opacity(0.9) : backgroundColor)
        case .ghost:
            if isPressed {
                shape.fill(Color.black.opacity(0.05))
            } else {
                Color.clear
            }
        }
    }
}
