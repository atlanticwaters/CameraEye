import SwiftUI

// MARK: - DSBadgeSize

/// Size variants for DSBadge matching Figma specs.
public enum DSBadgeSize: CaseIterable, Sendable {
    /// Small badge (16pt min height, 12pt font)
    case small
    /// Base badge (20pt min height, 14pt font)
    case base

    var minHeight: CGFloat {
        switch self {
        case .small: 16
        case .base: 20
        }
    }

    var fontSize: CGFloat {
        switch self {
        case .small: 12
        case .base: 14
        }
    }

    var iconSize: CGFloat {
        switch self {
        case .small: 12
        case .base: 14
        }
    }

    var cornerRadius: CGFloat {
        switch self {
        case .small: 6
        case .base: 8
        }
    }

    var padding: CGFloat { 4 }
}

// MARK: - DSBadgeVariant

/// Visual style variants for DSBadge.
public enum DSBadgeVariant: CaseIterable, Sendable {
    /// Outline style with border and no fill
    case outline
    /// Subtle filled background
    case filledSubtle
    /// Strong filled background
    case filledStrong
}

// MARK: - DSBadgeColor

/// Color variants for DSBadge matching Figma specs.
public enum DSBadgeColor: CaseIterable, Sendable {
    /// Info/Teal color
    case info
    /// Success/Green color
    case success
    /// Warning/Yellow color
    case warning
    /// Danger/Red color
    case danger
    /// Primary/Black color
    case primary
    /// Medium/Gray color
    case medium
    /// Brand/Orange color
    case brand
}

// MARK: - DSBadge

/// A badge component for displaying status labels and tags.
///
/// DSBadge displays a text label with an optional leading icon. It supports
/// multiple sizes (small, base), variants (outline, filledSubtle, filledStrong),
/// and colors. It automatically adapts to light/dark mode using design tokens.
///
/// Example usage:
/// ```swift
/// // Simple badge
/// DSBadge("New")
///
/// // Badge with all options
/// DSBadge(
///     "In Stock",
///     size: .base,
///     variant: .filledStrong,
///     color: .success,
///     leadingIcon: Image(systemName: "checkmark")
/// )
/// ```
public struct DSBadge: View {
    // MARK: - Properties

    private let label: String
    private let size: DSBadgeSize
    private let variant: DSBadgeVariant
    private let color: DSBadgeColor
    private let leadingIcon: Image?

    // MARK: - Computed Styling

    private var foregroundColor: Color {
        DSBadgeColorHelper.foregroundColor(variant: variant, color: color)
    }

    private var backgroundColor: Color {
        DSBadgeColorHelper.backgroundColor(variant: variant, color: color)
    }

    private var borderColor: Color {
        DSBadgeColorHelper.borderColor(variant: variant, color: color)
    }

    private var hasBorder: Bool {
        variant == .outline
    }

    // MARK: - Initializers

    /// Creates a badge with the specified configuration.
    /// - Parameters:
    ///   - label: The text to display in the badge.
    ///   - size: The size of the badge (small or base).
    ///   - variant: The visual style (outline, filledSubtle, filledStrong).
    ///   - color: The color theme of the badge.
    ///   - leadingIcon: Optional icon displayed before the label.
    public init(
        _ label: String,
        size: DSBadgeSize = .small,
        variant: DSBadgeVariant = .outline,
        color: DSBadgeColor = .info,
        leadingIcon: Image? = nil
    ) {
        self.label = label
        self.size = size
        self.variant = variant
        self.color = color
        self.leadingIcon = leadingIcon
    }

    // MARK: - Body

    public var body: some View {
        HStack(spacing: 4) {
            if let leadingIcon {
                leadingIcon
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: size.iconSize, height: size.iconSize)
                    .foregroundStyle(foregroundColor)
            }

            Text(label)
                .font(.system(size: size.fontSize, weight: .bold))
                .foregroundStyle(foregroundColor)
        }
        .padding(.horizontal, size.padding)
        .padding(.vertical, size.padding)
        .frame(minHeight: size.minHeight)
        .background(backgroundView)
        .accessibilityElement(children: .combine)
        .accessibilityLabel(Text(label))
    }

    @ViewBuilder
    private var backgroundView: some View {
        if hasBorder {
            RoundedRectangle(cornerRadius: size.cornerRadius)
                .stroke(borderColor, lineWidth: 1)
        } else {
            RoundedRectangle(cornerRadius: size.cornerRadius)
                .fill(backgroundColor)
        }
    }
}

// MARK: - Convenience Factory Methods

extension DSBadge {
    /// Creates an info badge.
    public static func info(_ label: String, size: DSBadgeSize = .small, variant: DSBadgeVariant = .outline) -> DSBadge {
        DSBadge(label, size: size, variant: variant, color: .info)
    }

    /// Creates a success badge.
    public static func success(_ label: String, size: DSBadgeSize = .small, variant: DSBadgeVariant = .outline) -> DSBadge {
        DSBadge(label, size: size, variant: variant, color: .success)
    }

    /// Creates a warning badge.
    public static func warning(_ label: String, size: DSBadgeSize = .small, variant: DSBadgeVariant = .outline) -> DSBadge {
        DSBadge(label, size: size, variant: variant, color: .warning)
    }

    /// Creates a danger badge.
    public static func danger(_ label: String, size: DSBadgeSize = .small, variant: DSBadgeVariant = .outline) -> DSBadge {
        DSBadge(label, size: size, variant: variant, color: .danger)
    }

    /// Creates a primary badge.
    public static func primary(_ label: String, size: DSBadgeSize = .small, variant: DSBadgeVariant = .outline) -> DSBadge {
        DSBadge(label, size: size, variant: variant, color: .primary)
    }

    /// Creates a brand badge.
    public static func brand(_ label: String, size: DSBadgeSize = .small, variant: DSBadgeVariant = .outline) -> DSBadge {
        DSBadge(label, size: size, variant: variant, color: .brand)
    }
}
