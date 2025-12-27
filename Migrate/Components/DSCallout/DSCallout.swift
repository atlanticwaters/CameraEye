import SwiftUI

// MARK: - DSCalloutVariant

/// Style variants for DSCallout matching Figma specs.
public enum DSCalloutVariant: CaseIterable, Sendable {
    /// Neutral callout with transparent background
    case neutral
    /// Brand callout with orange accent
    case brand
    /// Inverse callout for dark backgrounds
    case inverse
}

// MARK: - DSCallout

/// A callout component for displaying contextual information with optional action.
///
/// DSCallout displays a title, optional subtitle, body text, and an optional action button.
/// It supports three variants (neutral, brand, inverse) and can be displayed as floating
/// (with shadow) or inline. It automatically adapts to light/dark mode using design tokens.
///
/// Example usage:
/// ```swift
/// // Simple callout with title and body
/// DSCallout(
///     title: "Important Notice",
///     body: "This is supplementary information."
/// )
///
/// // Full-featured callout
/// DSCallout(
///     title: "Special Offer",
///     subtitle: "Limited time only",
///     body: "Get 20% off your next purchase.",
///     variant: .brand,
///     isFloating: true,
///     buttonTitle: "Shop Now"
/// ) {
///     print("Button tapped")
/// }
/// ```
public struct DSCallout: View {
    // MARK: - Properties

    private let title: String?
    private let subtitle: String?
    private let body: String
    private let leadingIcon: Image?
    private let variant: DSCalloutVariant
    private let isFloating: Bool
    private let buttonTitle: String?
    private let buttonAction: (() -> Void)?

    // MARK: - Token-based styling

    private var backgroundColor: Color {
        DSCalloutColorHelper.backgroundColor(variant: variant)
    }

    private var titleColor: Color {
        DSCalloutColorHelper.titleColor(variant: variant)
    }

    private var bodyColor: Color {
        DSCalloutColorHelper.bodyColor(variant: variant)
    }

    private var iconColor: Color {
        DSCalloutColorHelper.iconColor(variant: variant)
    }

    private var cornerRadius: CGFloat {
        CGFloat(TokensSemanticLight.BorderRadiusXl)
    }

    /// Shadow token from design system (only used for floating variant)
    private var shadowToken: DSShadow {
        TokensCoreLight.ElevationBelow3
    }

    // MARK: - Spacing per Figma spec

    private let horizontalPadding: CGFloat = 16
    private let topPadding: CGFloat = 6
    private let bottomPadding: CGFloat = 12
    private let contentTopPadding: CGFloat = 16
    private let contentSpacing: CGFloat = 16
    private let titleSubtitleSpacing: CGFloat = 8

    // MARK: - Initializers

    /// Creates a callout with the specified configuration.
    /// - Parameters:
    ///   - title: Optional headline text displayed at the top.
    ///   - subtitle: Optional subtitle text below the title.
    ///   - body: The main body text.
    ///   - leadingIcon: Optional icon displayed at the leading edge.
    ///   - variant: The visual style variant (neutral, brand, inverse).
    ///   - isFloating: Whether to display with shadow elevation.
    ///   - buttonTitle: Optional title for the action button.
    ///   - buttonAction: Action to perform when the button is tapped.
    public init(
        title: String? = nil,
        subtitle: String? = nil,
        body: String,
        leadingIcon: Image? = nil,
        variant: DSCalloutVariant = .neutral,
        isFloating: Bool = false,
        buttonTitle: String? = nil,
        buttonAction: (() -> Void)? = nil
    ) {
        self.title = title
        self.subtitle = subtitle
        self.body = body
        self.leadingIcon = leadingIcon
        self.variant = variant
        self.isFloating = isFloating
        self.buttonTitle = buttonTitle
        self.buttonAction = buttonAction
    }

    // MARK: - Body

    public var body: some View {
        HStack(alignment: .center, spacing: 0) {
            // Leading icon (optional)
            if let leadingIcon {
                leadingIcon
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 16, height: 16)
                    .foregroundColor(iconColor)
            }

            // Content column
            VStack(alignment: .leading, spacing: contentSpacing) {
                // Title section
                if title != nil || subtitle != nil {
                    titleSection
                }

                // Body text
                Text(body)
                    .font(DSTypography.bodyXs)
                    .foregroundColor(bodyColor)
            }
            .padding(.top, contentTopPadding)
            .padding(.leading, leadingIcon != nil ? 0 : 0)
            .frame(maxWidth: .infinity, alignment: .leading)

            // Button (optional)
            if let buttonTitle, let buttonAction {
                buttonSection(title: buttonTitle, action: buttonAction)
            }
        }
        .padding(.horizontal, horizontalPadding)
        .padding(.top, topPadding)
        .padding(.bottom, bottomPadding)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        .modifier(FloatingShadowModifier(isFloating: isFloating, shadow: shadowToken))
        .accessibilityElement(children: .combine)
        .accessibilityLabel(accessibilityLabelText)
    }

    // MARK: - Private Views

    @ViewBuilder
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: titleSubtitleSpacing) {
            if let title {
                Text(title)
                    .font(DSTypography.headlineSm)
                    .foregroundColor(titleColor)
            }
            if let subtitle {
                Text(subtitle)
                    .font(DSTypography.bodyMd)
                    .foregroundColor(bodyColor)
            }
        }
    }

    @ViewBuilder
    private func buttonSection(title: String, action: @escaping () -> Void) -> some View {
        DSButton(
            title,
            style: .orangeFilled,
            size: .small,
            action: action
        )
        .padding(.vertical, 8)
    }

    // MARK: - Accessibility

    private var accessibilityLabelText: Text {
        var components: [String] = []
        if let title {
            components.append(title)
        }
        if let subtitle {
            components.append(subtitle)
        }
        components.append(body)
        if let buttonTitle {
            components.append("Action: \(buttonTitle)")
        }
        return Text(components.joined(separator: ". "))
    }
}

// MARK: - FloatingShadowModifier

/// Modifier that conditionally applies shadow for floating callouts.
private struct FloatingShadowModifier: ViewModifier {
    let isFloating: Bool
    let shadow: DSShadow

    func body(content: Content) -> some View {
        if isFloating {
            content.shadow(shadow)
        } else {
            content
        }
    }
}
