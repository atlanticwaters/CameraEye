import SwiftUI

// MARK: - DSPillStyle

/// Visual style variants for DSPill matching Figma specs.
public enum DSPillStyle: CaseIterable, Sendable {
    /// Outlined pill with border
    case outlined
    /// Filled pill with solid background
    case filled
}

// MARK: - DSPillSize

/// Size variants for DSPill matching Figma specs.
public enum DSPillSize: CaseIterable, Sendable {
    /// Small size (24dp height)
    case sm
    /// Medium size (28dp height)
    case md
    /// Large size (32dp height)
    case lg
    /// Extra large size (40dp height)
    case xl

    var height: CGFloat {
        switch self {
        case .sm: return 24
        case .md: return 28
        case .lg: return 32
        case .xl: return 40
        }
    }

    var fontSize: CGFloat {
        switch self {
        case .sm: return 12
        case .md: return 12
        case .lg: return 14
        case .xl: return 16
        }
    }

    var iconSize: CGFloat {
        switch self {
        case .sm: return 12
        case .md: return 14
        case .lg: return 14
        case .xl: return 16
        }
    }

    var horizontalPadding: CGFloat {
        switch self {
        case .sm: return 8
        case .md: return 10
        case .lg: return 12
        case .xl: return 16
        }
    }

    var verticalPadding: CGFloat {
        switch self {
        case .sm: return 4
        case .md: return 6
        case .lg: return 8
        case .xl: return 10
        }
    }

    var spacing: CGFloat {
        switch self {
        case .sm: return 4
        case .md: return 4
        case .lg: return 6
        case .xl: return 8
        }
    }
}

// MARK: - DSPill

/// A pill component for displaying selectable tags, filters, and chips.
///
/// DSPill is used for filter interfaces, tag displays, and selection chips.
/// It supports leading/trailing icons, images, color swatches, and various
/// interaction states.
///
/// Example usage:
/// ```swift
/// // Simple pill
/// DSPill("Category") {
///     print("Tapped")
/// }
///
/// // Pill with icons
/// DSPill(
///     "Store",
///     leadingIcon: Image(systemName: "building.2"),
///     trailingIcon: Image(systemName: "chevron.down"),
///     style: .outlined,
///     size: .lg
/// ) {
///     print("Tapped")
/// }
///
/// // Selected pill
/// DSPill(
///     "Selected",
///     style: .filled,
///     isSelected: true
/// ) {
///     print("Tapped")
/// }
/// ```
public struct DSPill: View {
    // MARK: - Properties

    private let label: String?
    private let leadingIcon: Image?
    private let trailingIcon: Image?
    private let leadingColor: Color?
    private let leadingImage: Image?
    private let style: DSPillStyle
    private let size: DSPillSize
    private let isSelected: Bool
    private let isDisabled: Bool
    private let hasBackground: Bool
    private let action: () -> Void

    // MARK: - Computed Styling

    private var backgroundColor: Color {
        DSPillColorHelper.backgroundColor(style: style, isSelected: isSelected, isDisabled: isDisabled, hasBackground: hasBackground)
    }

    private var borderColor: Color {
        DSPillColorHelper.borderColor(style: style, isSelected: isSelected, isDisabled: isDisabled)
    }

    private var foregroundColor: Color {
        DSPillColorHelper.foregroundColor(style: style, isSelected: isSelected, isDisabled: isDisabled)
    }

    private var borderWidth: CGFloat {
        style == .outlined ? 1 : 0
    }

    private var cornerRadius: CGFloat {
        size.height / 2
    }

    // MARK: - Initializers

    /// Creates a pill with a text label.
    /// - Parameters:
    ///   - label: The text to display.
    ///   - leadingIcon: Optional icon displayed before the label.
    ///   - trailingIcon: Optional icon displayed after the label.
    ///   - style: The visual style (outlined, filled).
    ///   - size: The size of the pill.
    ///   - isSelected: Whether the pill is selected.
    ///   - isDisabled: Whether the pill is disabled.
    ///   - hasBackground: Whether to show background (for outlined style).
    ///   - action: Action to perform when tapped.
    public init(
        _ label: String,
        leadingIcon: Image? = nil,
        trailingIcon: Image? = nil,
        style: DSPillStyle = .outlined,
        size: DSPillSize = .lg,
        isSelected: Bool = false,
        isDisabled: Bool = false,
        hasBackground: Bool = true,
        action: @escaping () -> Void
    ) {
        self.label = label
        self.leadingIcon = leadingIcon
        self.trailingIcon = trailingIcon
        self.leadingColor = nil
        self.leadingImage = nil
        self.style = style
        self.size = size
        self.isSelected = isSelected
        self.isDisabled = isDisabled
        self.hasBackground = hasBackground
        self.action = action
    }

    /// Creates a pill with a color swatch.
    /// - Parameters:
    ///   - label: Optional text label.
    ///   - swatchColor: The color to display as a swatch.
    ///   - trailingIcon: Optional icon displayed after the label.
    ///   - style: The visual style (outlined, filled).
    ///   - size: The size of the pill.
    ///   - isSelected: Whether the pill is selected.
    ///   - isDisabled: Whether the pill is disabled.
    ///   - hasBackground: Whether to show background.
    ///   - action: Action to perform when tapped.
    public init(
        _ label: String? = nil,
        swatchColor: Color,
        trailingIcon: Image? = nil,
        style: DSPillStyle = .outlined,
        size: DSPillSize = .lg,
        isSelected: Bool = false,
        isDisabled: Bool = false,
        hasBackground: Bool = true,
        action: @escaping () -> Void
    ) {
        self.label = label
        self.leadingIcon = nil
        self.trailingIcon = trailingIcon
        self.leadingColor = swatchColor
        self.leadingImage = nil
        self.style = style
        self.size = size
        self.isSelected = isSelected
        self.isDisabled = isDisabled
        self.hasBackground = hasBackground
        self.action = action
    }

    /// Creates a pill with a leading image.
    /// - Parameters:
    ///   - label: Optional text label.
    ///   - leadingImage: The image to display.
    ///   - trailingIcon: Optional icon displayed after the label.
    ///   - style: The visual style (outlined, filled).
    ///   - size: The size of the pill.
    ///   - isSelected: Whether the pill is selected.
    ///   - isDisabled: Whether the pill is disabled.
    ///   - hasBackground: Whether to show background.
    ///   - action: Action to perform when tapped.
    public init(
        _ label: String? = nil,
        leadingImage: Image,
        trailingIcon: Image? = nil,
        style: DSPillStyle = .outlined,
        size: DSPillSize = .lg,
        isSelected: Bool = false,
        isDisabled: Bool = false,
        hasBackground: Bool = true,
        action: @escaping () -> Void
    ) {
        self.label = label
        self.leadingIcon = nil
        self.trailingIcon = trailingIcon
        self.leadingColor = nil
        self.leadingImage = leadingImage
        self.style = style
        self.size = size
        self.isSelected = isSelected
        self.isDisabled = isDisabled
        self.hasBackground = hasBackground
        self.action = action
    }

    // MARK: - Body

    public var body: some View {
        Button(action: action) {
            contentView
        }
        .buttonStyle(PillButtonStyle(
            backgroundColor: backgroundColor,
            borderColor: borderColor,
            borderWidth: borderWidth,
            cornerRadius: cornerRadius,
            style: style,
            isDisabled: isDisabled
        ))
        .disabled(isDisabled)
        .accessibilityElement(children: .combine)
        .accessibilityLabel(accessibilityLabelText)
        .accessibilityAddTraits(isSelected ? .isSelected : [])
        .accessibilityAddTraits(.isButton)
    }

    @ViewBuilder
    private var contentView: some View {
        HStack(spacing: size.spacing) {
            // Leading content (icon, swatch, or image)
            if let leadingIcon {
                leadingIcon
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: size.iconSize, height: size.iconSize)
                    .foregroundColor(foregroundColor)
            } else if let leadingColor {
                colorSwatchView(color: leadingColor)
            } else if let leadingImage {
                imageView(image: leadingImage)
            }

            // Label
            if let label {
                Text(label)
                    .font(.system(size: size.fontSize, weight: isSelected ? .semibold : .regular))
                    .foregroundColor(foregroundColor)
            }

            // Trailing icon
            if let trailingIcon {
                trailingIcon
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: size.iconSize * 0.75, height: size.iconSize * 0.75)
                    .foregroundColor(foregroundColor)
            }
        }
        .padding(.horizontal, size.horizontalPadding)
        .padding(.vertical, size.verticalPadding)
        .frame(minHeight: size.height)
    }

    @ViewBuilder
    private func colorSwatchView(color: Color) -> some View {
        Circle()
            .fill(color)
            .frame(width: size.iconSize, height: size.iconSize)
            .overlay(
                Circle()
                    .stroke(Color.black.opacity(0.1), lineWidth: 1)
            )
    }

    @ViewBuilder
    private func imageView(image: Image) -> some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: size.iconSize, height: size.iconSize)
            .clipShape(Circle())
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
        return Text(components.joined(separator: ", "))
    }
}

// MARK: - PillButtonStyle

/// Custom button style for pills with press animation.
private struct PillButtonStyle: ButtonStyle {
    let backgroundColor: Color
    let borderColor: Color
    let borderWidth: CGFloat
    let cornerRadius: CGFloat
    let style: DSPillStyle
    let isDisabled: Bool

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(backgroundView(isPressed: configuration.isPressed))
            .scaleEffect(configuration.isPressed ? 0.97 : 1.0)
            .animation(DSAnimation.press, value: configuration.isPressed)
    }

    @ViewBuilder
    private func backgroundView(isPressed: Bool) -> some View {
        let shape = Capsule()
        let pressedOpacity = isPressed ? 0.9 : 1.0

        switch style {
        case .outlined:
            shape
                .fill(backgroundColor.opacity(pressedOpacity))
                .overlay(
                    shape.stroke(borderColor, lineWidth: borderWidth)
                )
        case .filled:
            shape
                .fill(backgroundColor.opacity(pressedOpacity))
        }
    }
}
