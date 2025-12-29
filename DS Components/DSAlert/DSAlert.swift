import SwiftUI

// MARK: - DSAlertVariant

/// Style variants for DSAlert matching Figma specs.
public enum DSAlertVariant: CaseIterable, Sendable {
    /// Informational alert (blue)
    case informational
    /// Success alert (green)
    case success
    /// Warning alert (yellow)
    case warning
    /// Error alert (red)
    case error
}

// MARK: - DSAlert

/// An alert component for displaying feedback messages to the user.
///
/// DSAlert displays a status icon, optional title, body text, and a dismiss button.
/// It supports four variants (informational, success, warning, error) and can be
/// displayed as floating (with shadow) or inline. It automatically adapts to
/// light/dark mode using design tokens.
///
/// Example usage:
/// ```swift
/// // Simple alert with body only
/// DSAlert(
///     body: "Your changes have been saved.",
///     variant: .success
/// )
///
/// // Full-featured alert
/// DSAlert(
///     title: "Connection Error",
///     body: "Unable to connect to the server. Please try again.",
///     variant: .error,
///     isFloating: true
/// ) {
///     print("Alert dismissed")
/// }
/// ```
public struct DSAlert: View {
    // MARK: - Properties

    private let title: String?
    private let body: String
    private let variant: DSAlertVariant
    private let isFloating: Bool
    private let onDismiss: (() -> Void)?

    // MARK: - Token-based styling

    private var backgroundColor: Color {
        DSAlertColorHelper.backgroundColor(variant: variant)
    }

    private var iconColor: Color {
        DSAlertColorHelper.iconColor(variant: variant)
    }

    private var textColor: Color {
        DSColor.textOnSurfaceColorPrimary.resolve
    }

    private var closeButtonColor: Color {
        DSColor.textOnSurfaceColorSecondary.resolve
    }

    private var cornerRadius: CGFloat {
        CGFloat(TokensSemanticLight.BorderRadiusXl)
    }

    /// Shadow token from design system (only used for floating variant)
    private var shadowToken: DSShadow {
        TokensCoreLight.ElevationBelow3
    }

    // MARK: - Spacing per Figma spec

    private let horizontalPadding: CGFloat = 8
    private let topPadding: CGFloat = 6
    private let bottomPadding: CGFloat = 12
    private let contentLeftPadding: CGFloat = 16
    private let contentTopPadding: CGFloat = 16
    private let contentSpacing: CGFloat = 8
    private let iconTextSpacing: CGFloat = 8

    // MARK: - Initializers

    /// Creates an alert with the specified configuration.
    /// - Parameters:
    ///   - title: Optional headline text displayed at the top.
    ///   - body: The main body text.
    ///   - variant: The alert type (informational, success, warning, error).
    ///   - isFloating: Whether to display with shadow elevation.
    ///   - onDismiss: Action to perform when the dismiss button is tapped.
    public init(
        title: String? = nil,
        body: String,
        variant: DSAlertVariant = .informational,
        isFloating: Bool = false,
        onDismiss: (() -> Void)? = nil
    ) {
        self.title = title
        self.body = body
        self.variant = variant
        self.isFloating = isFloating
        self.onDismiss = onDismiss
    }

    // MARK: - Body

    public var body: some View {
        HStack(alignment: .top, spacing: 0) {
            // Left column: Icon + Content
            HStack(alignment: .top, spacing: iconTextSpacing) {
                // Status icon
                statusIcon
                    .frame(width: 16, height: 16)
                    .foregroundColor(iconColor)
                    .padding(.top, contentTopPadding)

                // Content
                VStack(alignment: .leading, spacing: contentSpacing) {
                    if let title {
                        Text(title)
                            .font(DSTypography.bodyMdMedium)
                            .foregroundColor(textColor)
                    }

                    Text(body)
                        .font(DSTypography.bodyMdMedium)
                        .foregroundColor(textColor)
                }
                .padding(.top, contentTopPadding)
                .padding(.bottom, 6)
            }
            .padding(.leading, contentLeftPadding)

            Spacer(minLength: 0)

            // Close button
            if onDismiss != nil {
                closeButton
            }
        }
        .padding(.leading, horizontalPadding)
        .padding(.top, topPadding)
        .padding(.bottom, bottomPadding)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        .modifier(FloatingShadowModifier(isFloating: isFloating, shadow: shadowToken))
        .accessibilityElement(children: .combine)
        .accessibilityLabel(accessibilityLabelText)
        .accessibilityAddTraits(.isStaticText)
    }

    // MARK: - Private Views

    @ViewBuilder
    private var statusIcon: some View {
        switch variant {
        case .informational:
            Image(systemName: "info.circle.fill")
                .resizable()
        case .success:
            Image(systemName: "checkmark.circle.fill")
                .resizable()
        case .warning:
            Image(systemName: "exclamationmark.triangle.fill")
                .resizable()
        case .error:
            Image(systemName: "xmark.circle.fill")
                .resizable()
        }
    }

    @ViewBuilder
    private var closeButton: some View {
        Button {
            onDismiss?()
        } label: {
            Image(systemName: "xmark")
                .resizable()
                .scaledToFit()
                .frame(width: 12, height: 12)
                .foregroundColor(closeButtonColor)
                .padding(16)
                .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .accessibilityLabel("Dismiss alert")
    }

    // MARK: - Accessibility

    private var accessibilityLabelText: Text {
        let variantLabel: String
        switch variant {
        case .informational:
            variantLabel = "Information"
        case .success:
            variantLabel = "Success"
        case .warning:
            variantLabel = "Warning"
        case .error:
            variantLabel = "Error"
        }

        var components: [String] = [variantLabel]
        if let title {
            components.append(title)
        }
        components.append(body)
        return Text(components.joined(separator: ". "))
    }
}

// MARK: - FloatingShadowModifier

/// Modifier that conditionally applies shadow for floating alerts.
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
