import SwiftUI

// MARK: - DSTooltipPlacement

/// Tooltip placement relative to anchor content.
public enum DSTooltipPlacement: CaseIterable {
    case above
    case below
    case leading
    case trailing
}

// MARK: - DSTooltip

/// A tooltip component for displaying contextual information.
///
/// DSTooltip displays a text message with an optional close button,
/// positioned relative to anchor content using the `placement` parameter.
/// It automatically adapts to light/dark mode using design tokens.
///
/// Example usage:
/// ```swift
/// DSTooltip("Add items to your cart")
///
/// DSTooltip(
///     "Tap for more info",
///     placement: .above,
///     showsClose: true,
///     onClose: { print("dismissed") }
/// )
/// ```
public struct DSTooltip: View {
    // MARK: - Properties

    private let text: String
    private let placement: DSTooltipPlacement
    private let showsClose: Bool
    private let onClose: (() -> Void)?

    // MARK: - Token-based styling

    private var backgroundColor: Color {
        DSColor.containerBackgroundWhite.resolve
    }

    private var textColor: Color {
        DSColor.textOnSurfaceColorPrimary.resolve
    }

    private var cornerRadius: CGFloat {
        CGFloat(TokensSemanticLight.BorderRadiusXl)
    }

    /// Shadow token from design system
    private var shadowToken: DSShadow {
        TokensCoreLight.ElevationBelow3
    }

    // MARK: - Padding per Figma spec

    private var paddingInsets: EdgeInsets {
        let base: CGFloat = 12
        let trailingPadding = showsClose ? CGFloat(8) : base
        return EdgeInsets(top: base, leading: base, bottom: base, trailing: trailingPadding)
    }

    // MARK: - Initializers

    /// Creates a tooltip with the specified configuration.
    /// - Parameters:
    ///   - text: The message to display in the tooltip.
    ///   - placement: Where the tooltip appears relative to anchor content.
    ///   - showsClose: Whether to show a close button.
    ///   - onClose: Action to perform when the close button is tapped.
    public init(
        _ text: String,
        placement: DSTooltipPlacement = .below,
        showsClose: Bool = false,
        onClose: (() -> Void)? = nil
    ) {
        self.text = text
        self.placement = placement
        self.showsClose = showsClose
        self.onClose = onClose
    }

    /// Creates a tooltip with a trailing closure for the close action.
    /// - Parameters:
    ///   - text: The message to display in the tooltip.
    ///   - showsClose: Whether to show a close button.
    ///   - placement: Where the tooltip appears relative to anchor content.
    ///   - onClose: Action to perform when the close button is tapped.
    public init(
        _ text: String,
        showsClose: Bool,
        placement: DSTooltipPlacement = .below,
        onClose: @escaping () -> Void
    ) {
        self.text = text
        self.placement = placement
        self.showsClose = showsClose
        self.onClose = onClose
    }

    // MARK: - Body

    public var body: some View {
        tooltipContent
            .shadow(shadowToken)
            .accessibilityElement(children: .combine)
            .accessibilityLabel(Text(text))
    }

    // MARK: - Private Views

    @ViewBuilder
    private var tooltipContent: some View {
        switch placement {
        case .above:
            // Arrow on top, pointing up
            VStack(spacing: 0) {
                arrowView(rotation: .degrees(180))
                bodyContent
            }
        case .below:
            // Arrow on bottom, pointing down
            VStack(spacing: 0) {
                bodyContent
                arrowView(rotation: .zero)
            }
        case .leading:
            // Arrow on left, pointing left
            HStack(spacing: 0) {
                arrowView(rotation: .degrees(90))
                bodyContent
            }
        case .trailing:
            // Arrow on right, pointing right
            HStack(spacing: 0) {
                bodyContent
                arrowView(rotation: .degrees(270))
            }
        }
    }

    private var bodyContent: some View {
        HStack(spacing: 4) {
            Text(text)
                .font(DSTypography.bodyXs)
                .foregroundStyle(textColor)

            if showsClose {
                closeButton
            }
        }
        .padding(paddingInsets)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
    }

    private func arrowView(rotation: Angle) -> some View {
        let isHorizontal = rotation == .degrees(90) || rotation == .degrees(270)
        return TooltipArrow(direction: rotation)
            .fill(backgroundColor)
            .frame(
                width: isHorizontal ? 6 : 12,
                height: isHorizontal ? 12 : 6
            )
    }

    @ViewBuilder
    private var closeButton: some View {
        Button {
            onClose?()
        } label: {
            Image(systemName: "xmark")
                .resizable()
                .scaledToFit()
                .frame(width: 12, height: 12)
                .font(DSTypography.bodyXsBold)
                .foregroundStyle(textColor)
                .padding(8)
                .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .accessibilityLabel("Close tooltip")
    }
}

// MARK: - TooltipArrow

/// Arrow shape that draws directly in the correct orientation.
private struct TooltipArrow: Shape {
    let direction: Angle

    func path(in rect: CGRect) -> Path {
        var path = Path()
        switch direction {
        case .zero:
            // Arrow pointing down (base at top)
            path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        case .degrees(180):
            // Arrow pointing up (base at bottom)
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        case .degrees(90):
            // Arrow pointing left (base at right)
            path.move(to: CGPoint(x: rect.minX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        case .degrees(270):
            // Arrow pointing right (base at left)
            path.move(to: CGPoint(x: rect.maxX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        default:
            // Fallback: pointing down
            path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        }
        path.closeSubpath()
        return path
    }
}
