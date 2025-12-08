import SwiftUI

// MARK: - Callout & Alert Component System
// THD App Design System - Callout and Alert Components
//
// This file contains Callout and Alert components that use DesignSystemGlobal tokens
// for consistent styling across the application.
//
// Components:
// - Callout: Promotional/informational callout with optional button
// - Alert: Feedback alert with variant-based styling (informational, success, warning, error)
//
// Design System Integration:
// - Colors: Uses BackgroundContainerColor*, BackgroundFeedbackColor*, TextOnContainerColor*, IconOnSurfaceColor* tokens
// - Spacing: Uses Spacing* tokens
// - Border: Uses BorderRadius*, BorderWidthXs tokens
// - Typography: Uses FontFontSize* tokens
// - Shadow: Uses ElevationMed for floating variants

// MARK: - Callout Variant Styles
/// Callout variant styles affecting background and text treatment.
enum THDCalloutVariant {
    /// Neutral - transparent black 5% background
    /// Background: BackgroundContainerColorTransparent05
    case neutral

    /// Inverse - dark background with light text
    /// Background: BackgroundSurfaceColorInverse
    case inverse

    /// Brand - brand accent background (light orange)
    /// Background: BackgroundContainerColorBrandAccent
    case brand
}

// MARK: - Alert Variant Styles
/// Alert variant styles mapped to feedback contexts.
enum THDAlertVariant {
    /// Informational - blue/teal accent for neutral information
    /// Uses BackgroundFeedbackColorInformationalAccent1, MoonlightMoonlight500
    case informational

    /// Success - green accent for positive outcomes
    /// Uses BackgroundFeedbackColorSuccessAccent1, IconOnSurfaceColorPrimary
    case success

    /// Warning - yellow accent for cautionary messages
    /// Uses BackgroundFeedbackColorWarningAccent1, LemonLemon200
    case warning

    /// Error - red accent for error states
    /// Uses BackgroundFeedbackColorErrorAccent1, CinnabarCinnabar500
    case error
}

// MARK: - Callout Component
/// Promotional/informational callout component using DesignSystemGlobal tokens.
///
/// Displays contextual information with optional title, subtitle, description,
/// leading icon, and action button. Supports floating style with shadow.
///
/// ## Usage Example:
/// ```swift
/// THDCallout(
///     title: "Special Offer",
///     description: "Get 20% off your next purchase",
///     variant: .brand,
///     buttonText: "Shop Now"
/// ) {
///     // Handle button tap
/// }
/// ```
///
/// ## Design System Tokens Used:
/// - Background: BackgroundContainerColorTransparent05, BackgroundSurfaceColorInverse, BackgroundContainerColorBrandAccent
/// - Text: TextOnContainerColorPrimary, TextOnContainerColorInverse, TextOnContainerColorSecondary
/// - Icons: IconOnSurfaceColorPrimary
/// - Border: BorderRadius2xl
/// - Shadow: ElevationMed for floating style
struct THDCallout: View {
    let title: String?
    let subtitle: String?
    let description: String
    let variant: THDCalloutVariant
    let leadingIcon: String?
    let buttonText: String?
    let isFloating: Bool
    let onButtonTap: (() -> Void)?

    init(
        title: String? = nil,
        subtitle: String? = nil,
        description: String,
        variant: THDCalloutVariant = .neutral,
        leadingIcon: String? = "tag",
        buttonText: String? = nil,
        isFloating: Bool = false,
        onButtonTap: (() -> Void)? = nil
    ) {
        self.title = title
        self.subtitle = subtitle
        self.description = description
        self.variant = variant
        self.leadingIcon = leadingIcon
        self.buttonText = buttonText
        self.isFloating = isFloating
        self.onButtonTap = onButtonTap
    }

    var body: some View {
        HStack(alignment: .top, spacing: DesignSystemGlobal.Spacing2) {
            // Leading icon
            if let iconName = leadingIcon {
                Image(systemName: iconName)
                    .resizable()
                    .frame(width: 16, height: 16)
                    .foregroundColor(iconColor)
                    .padding(.top, DesignSystemGlobal.Spacing4)
            }

            // Content
            VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing4) {
                if title != nil || subtitle != nil {
                    VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                        if let title = title {
                            // Heading h5 with custom font
                            Text(title)
                                .font(.thdH5)
                                .lineSpacing(DesignSystemGlobal.FontLineHeightTight)
                                .foregroundColor(primaryTextColor)
                        }

                        if let subtitle = subtitle {
                            // Body Md with custom font
                            Text(subtitle)
                                .font(.thdBodyMd)
                                .lineSpacing(DesignSystemGlobal.FontLineHeightTight)
                                .foregroundColor(secondaryTextColor)
                        }
                    }
                }

                // Body Sm with custom font
                Text(description)
                    .font(.thdBodySm)
                    .lineSpacing(DesignSystemGlobal.FontLineHeightTight)
                    .foregroundColor(primaryTextColor)
            }
            .padding(.top, DesignSystemGlobal.Spacing4)
            .padding(.bottom, 6)
            .frame(maxWidth: .infinity, alignment: .leading)

            // Button
            if let buttonText = buttonText {
                Button(action: {
                    onButtonTap?()
                }) {
                    Text(buttonText)
                        .font(.thdBodySm)
                        .foregroundColor(DesignSystemGlobal.TextButtonColorOrangeFilledDefault)
                        .padding(.horizontal, DesignSystemGlobal.Spacing4)
                        .padding(.vertical, DesignSystemGlobal.Spacing2)
                        .frame(height: DesignSystemGlobal.Spacing7)
                        .background(DesignSystemGlobal.BackgroundButtonColorBrandFilledDefault)
                        .cornerRadius(DesignSystemGlobal.BorderRadiusFull)
                }
                .frame(maxHeight: DesignSystemGlobal.Spacing11)
                .padding(.vertical, DesignSystemGlobal.Spacing2)
            }
        }
        .padding(.leading, DesignSystemGlobal.Spacing4)
        .padding(.trailing, DesignSystemGlobal.Spacing4)
        .padding(.top, DesignSystemGlobal.Spacing0)
        .padding(.bottom, DesignSystemGlobal.Spacing3)
        .background(backgroundColor)
        .cornerRadius(DesignSystemGlobal.BorderRadius2xl)
        .shadow(
            color: isFloating ? DesignSystemGlobal.ElevationMed : .clear,
            radius: isFloating ? 12 : 0,
            x: 0,
            y: isFloating ? 4 : 0
        )
    }

    // MARK: - Color Logic

    /// Background color based on variant
    /// Uses DesignSystemGlobal BackgroundContainerColor* tokens
    private var backgroundColor: Color {
        switch variant {
        case .neutral:
            return DesignSystemGlobal.BackgroundContainerColorTransparent05
        case .inverse:
            return DesignSystemGlobal.BackgroundSurfaceColorInverse
        case .brand:
            return DesignSystemGlobal.BackgroundContainerColorBrandAccent
        }
    }

    /// Primary text color based on variant
    private var primaryTextColor: Color {
        switch variant {
        case .neutral, .brand:
            return DesignSystemGlobal.TextOnContainerColorPrimary
        case .inverse:
            return DesignSystemGlobal.TextOnContainerColorInverse
        }
    }

    /// Secondary text color based on variant
    private var secondaryTextColor: Color {
        switch variant {
        case .neutral:
            return DesignSystemGlobal.TextOnContainerColorSecondary
        case .inverse:
            return DesignSystemGlobal.TextOnContainerColorInverse
        case .brand:
            return DesignSystemGlobal.TextOnSurfaceColorPrimary
        }
    }

    /// Icon color based on variant
    private var iconColor: Color {
        switch variant {
        case .neutral, .brand:
            return DesignSystemGlobal.IconOnSurfaceColorPrimary
        case .inverse:
            return DesignSystemGlobal.TextOnContainerColorInverse
        }
    }
}

// MARK: - Alert Component
/// Feedback alert component using DesignSystemGlobal tokens.
///
/// Displays contextual feedback messages with variant-based styling.
/// Supports optional title, dismiss button, and floating style.
///
/// ## Usage Example:
/// ```swift
/// THDAlert(
///     title: "Success",
///     message: "Your order has been placed",
///     variant: .success
/// ) {
///     // Handle dismiss
/// }
/// ```
///
/// ## Design System Tokens Used:
/// - Background: BackgroundFeedbackColorInformationalAccent1, BackgroundFeedbackColorSuccessAccent1, etc.
/// - Text: TextOnContainerColorPrimary
/// - Icons: MoonlightMoonlight500, IconOnSurfaceColorPrimary, LemonLemon200, CinnabarCinnabar500
/// - Border: BorderOnContainerColorDefault, BorderRadius2xl
struct THDAlert: View {
    let title: String?
    let message: String
    let variant: THDAlertVariant
    let isFloating: Bool
    let onDismiss: (() -> Void)?

    init(
        title: String? = nil,
        message: String,
        variant: THDAlertVariant = .informational,
        isFloating: Bool = false,
        onDismiss: (() -> Void)? = nil
    ) {
        self.title = title
        self.message = message
        self.variant = variant
        self.isFloating = isFloating
        self.onDismiss = onDismiss
    }

    var body: some View {
        HStack(alignment: .top, spacing: DesignSystemGlobal.Spacing2) {
            // Leading icon
            Image(systemName: iconName)
                .resizable()
                .frame(width: 16, height: 16)
                .foregroundColor(iconColor)
                .padding(.top, DesignSystemGlobal.Spacing4)

            // Content
            VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                if let title = title {
                    // Heading h6 with custom font
                    Text(title)
                        .font(.thdH6)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)
                }

                // Body Sm with custom font
                Text(message)
                    .font(.thdBodySm)
                    .lineSpacing(DesignSystemGlobal.FontLineHeightTight)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)
            }
            .padding(.top, DesignSystemGlobal.Spacing4)
            .padding(.bottom, 6)
            .frame(maxWidth: .infinity, alignment: .leading)

            // Close button
            if let onDismiss = onDismiss {
                Button(action: onDismiss) {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 16, height: 16)
                        .foregroundColor(DesignSystemGlobal.IconOnSurfaceColorPrimary)
                        .frame(width: DesignSystemGlobal.Spacing9, height: DesignSystemGlobal.Spacing9)
                        .background(Color.clear)
                        .cornerRadius(DesignSystemGlobal.BorderRadiusFull)
                }
                .padding(DesignSystemGlobal.Spacing1)
            }
        }
        .padding(.leading, DesignSystemGlobal.Spacing2)
        .padding(.trailing, DesignSystemGlobal.Spacing0)
        .padding(.top, DesignSystemGlobal.Spacing0)
        .padding(.bottom, DesignSystemGlobal.Spacing3)
        .background(backgroundColor)
        .overlay(
            RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadius2xl)
                .stroke(DesignSystemGlobal.BorderOnContainerDefault, lineWidth: DesignSystemGlobal.BorderWidthXs)
        )
        .cornerRadius(DesignSystemGlobal.BorderRadius2xl)
        .shadow(
            color: isFloating ? DesignSystemGlobal.ElevationMed : .clear,
            radius: isFloating ? 12 : 0,
            x: 0,
            y: isFloating ? 4 : 0
        )
    }

    // MARK: - Color & Icon Logic

    /// Background color based on variant
    /// Uses DesignSystemGlobal BackgroundFeedbackColor* tokens
    private var backgroundColor: Color {
        switch variant {
        case .informational:
            return DesignSystemGlobal.BackgroundFeedbackColorInformationalAccent1
        case .success:
            return DesignSystemGlobal.BackgroundFeedbackColorSuccessAccent1
        case .warning:
            return DesignSystemGlobal.BackgroundFeedbackColorWarningAccent1
        case .error:
            return DesignSystemGlobal.BackgroundFeedbackColorErrorAccent1
        }
    }

    /// Icon color based on variant
    private var iconColor: Color {
        switch variant {
        case .informational:
            return DesignSystemGlobal.MoonlightMoonlight500
        case .success:
            return DesignSystemGlobal.IconOnSurfaceColorPrimary
        case .warning:
            return DesignSystemGlobal.LemonLemon200
        case .error:
            return DesignSystemGlobal.CinnabarCinnabar500
        }
    }

    /// System icon name based on variant
    private var iconName: String {
        switch variant {
        case .informational:
            return "info.circle"
        case .success:
            return "checkmark.circle"
        case .warning:
            return "exclamationmark.triangle"
        case .error:
            return "exclamationmark.circle"
        }
    }
}



// MARK: - Previews
#Preview("Callouts & Alerts") {
    
    func sectionHeader(_ title: String, description: String) -> some View {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing1) {
            Text(title)
                .thdFont(.h5)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

            Text(description)
                .thdFont(.caption)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorTertiary)
        }
    }

    return ScrollView {
        VStack(alignment: .leading, spacing: 24) {
            // Alerts Section
            Text("Alert")
                .thdFont(.hero3)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)
                .padding(.bottom, 20)

            // MARK: - Informational Alerts
            sectionHeader("Informational", description: "Informational alerts for helpful information")

            InformationalAlert(
                title: "Alert title (optional)",
                message: "This is helpful information you should know.",
                onDismiss: {}
            )

            InformationalAlert(
                title: "Alert title (optional)",
                message: "This is helpful information you should know.",
                isFloating: true,
                onDismiss: {}
            )

            // MARK: - Success Alerts
            sectionHeader("Success", description: "Success alerts for completed actions")

            SuccessAlert(
                title: "Alert title (optional)",
                message: "Whatever you did worked.",
                onDismiss: {}
            )

            // MARK: - Warning Alerts
            sectionHeader("Warning", description: "Warning alerts for issues that need attention")

            WarningAlert(
                title: "Alert title (optional)",
                message: "There's an issue that you should know about.",
                onDismiss: {}
            )

            WarningAlert(
                title: "Alert title (optional)",
                message: "There's an issue that you should know about.",
                isFloating: true,
                onDismiss: {}
            )

            // MARK: - Error Alerts
            sectionHeader("Error", description: "Error alerts for critical issues")

            ErrorAlert(
                title: "Alert title (optional)",
                message: "You cannot proceed until you resolve this issue.",
                onDismiss: {}
            )

            Divider().padding(.vertical, 20)

            // Callouts Section
            Text("Callout")
                .thdFont(.hero3)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)
                .padding(.bottom, 20)

            // MARK: - Neutral Callouts
            sectionHeader("Neutral", description: "Neutral callouts with subtle background")

            THDCallout(
                title: "Callout Title (Optional)",
                subtitle: "Subtitle",
                description: "This is supplementary information.",
                variant: .neutral,
                buttonText: "Button Text",
                onButtonTap: {}
            )

            THDCallout(
                title: "Callout Title (Optional)",
                subtitle: "Subtitle",
                description: "This is supplementary information.",
                variant: .neutral,
                buttonText: "Button Text",
                isFloating: true,
                onButtonTap: {}
            )

            // MARK: - Inverse Callouts
            sectionHeader("Inverse", description: "Dark background callouts with light text")

            THDCallout(
                title: "Callout Title (Optional)",
                subtitle: "Subtitle",
                description: "This is supplementary information.",
                variant: .inverse,
                buttonText: "Button Text",
                onButtonTap: {}
            )

            THDCallout(
                title: "Callout Title (Optional)",
                subtitle: "Subtitle",
                description: "This is supplementary information.",
                variant: .inverse,
                buttonText: "Button Text",
                isFloating: true,
                onButtonTap: {}
            )

            // MARK: - Brand Callouts
            sectionHeader("Brand", description: "Orange accent callouts for promotions")

            THDCallout(
                title: "Callout Title (Optional)",
                subtitle: "Subtitle",
                description: "This is supplementary information.",
                variant: .brand,
                buttonText: "Button Text",
                onButtonTap: {}
            )

            THDCallout(
                title: "Callout Title (Optional)",
                subtitle: "Subtitle",
                description: "This is supplementary information.",
                variant: .brand,
                buttonText: "Button Text",
                isFloating: true,
                onButtonTap: {}
            )
        }
        .padding()
    }
    .background(DesignSystemGlobal.BackgroundContainerColorWhite)
}
