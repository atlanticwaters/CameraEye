import SwiftUI

/// A promotional or informational banner with optional icon, title, subtitle, and action button
public struct DSCallout: View {
    // MARK: - Types
    
    /// Visual variant of the callout
    public enum Variant {
        case neutral
        case brand
        case inverse
    }
    
    // MARK: - Properties
    
    private let variant: Variant
    private let leadingIcon: AnyView?
    private let title: String?
    private let subtitle: String?
    private let message: String
    private let buttonText: String?
    private let isFloating: Bool
    private let onButtonTap: (() -> Void)?
    
    @Environment(\.colorScheme) private var colorScheme
    
    private var isDark: Bool {
        colorScheme == .dark
    }
    
    // MARK: - Initialization
    
    /// Creates a callout with a message and optional title, subtitle, and action
    /// - Parameters:
    ///   - variant: Visual style variant (default: .neutral)
    ///   - leadingIcon: Optional leading icon view
    ///   - title: Optional title text
    ///   - subtitle: Optional subtitle text
    ///   - message: Primary message text
    ///   - buttonText: Optional button text (if nil, button is hidden)
    ///   - isFloating: Whether to show with floating elevation (default: false)
    ///   - onButtonTap: Optional button tap action
    public init(
        variant: Variant = .neutral,
        leadingIcon: (any View)? = nil,
        title: String? = nil,
        subtitle: String? = nil,
        message: String,
        buttonText: String? = nil,
        isFloating: Bool = false,
        onButtonTap: (() -> Void)? = nil
    ) {
        self.variant = variant
        self.leadingIcon = leadingIcon.map { AnyView($0) }
        self.title = title
        self.subtitle = subtitle
        self.message = message
        self.buttonText = buttonText
        self.isFloating = isFloating
        self.onButtonTap = onButtonTap
    }
    
    // MARK: - Body
    
    public var body: some View {
        HStack(alignment: .top, spacing: TokensSpacing.Spacing2) {
            // Leading icon (only for neutral and brand variants)
            if (variant == .neutral || variant == .brand), let icon = leadingIcon {
                icon
                    .frame(width: 16, height: 16)
            }
            
            // Content
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing4) {
                // Title section
                if title != nil || subtitle != nil {
                    VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                        if let title = title {
                            Text(title)
                                .font(.custom("THD SmVar Beta", size: 18))
                                .fontWeight(.heavy)
                                .foregroundColor(titleTextColor)
                                .lineLimit(nil)
                        }
                        
                        if let subtitle = subtitle {
                            Text(subtitle)
                                .font(.custom("THD Sm Beta", size: 16))
                                .foregroundColor(subtitleTextColor)
                                .lineLimit(nil)
                        }
                    }
                }
                
                // Message
                Text(message)
                    .font(.custom("THD Sm Beta", size: 14))
                    .foregroundColor(messageTextColor)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            // Leading icon for inverse variant
            if variant == .inverse, let icon = leadingIcon {
                icon
                    .frame(width: 16, height: 16)
            }
            
            // Action button
            if let buttonText = buttonText {
                VStack {
                    Button(action: {
                        onButtonTap?()
                    }) {
                        Text(buttonText)
                            .font(.custom("THD SmVar Beta", size: 14))
                            .fontWeight(.bold)
                            .foregroundColor(buttonTextColor)
                            .lineLimit(1)
                            .padding(.horizontal, TokensSpacing.Spacing4)
                            .padding(.vertical, TokensSpacing.Spacing2)
                            .frame(height: 28)
                            .background(buttonBackgroundColor)
                            .cornerRadius(9999)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .frame(maxHeight: 44)
            }
        }
        .padding(TokensSpacing.Spacing4)
        .background(backgroundColor)
        .cornerRadius(TokensSemanticLight.BorderRadius2xl)
        .shadow(color: isFloating ? shadowColor : .clear, radius: isFloating ? 6 : 0, x: 0, y: isFloating ? 3 : 0)
    }
    
    // MARK: - Colors
    
    private var backgroundColor: Color {
        switch variant {
        case .neutral:
            return isDark ? TokensSemanticDark.BackgroundContainerColorWhite : TokensSemanticLight.BackgroundContainerColorWhite
        case .brand:
            return isDark ? TokensSemanticDark.BackgroundContainerColorBrand : TokensSemanticLight.BackgroundContainerColorBrand
        case .inverse:
            return isDark ? TokensSemanticDark.BackgroundContainerColorInverse : TokensSemanticLight.BackgroundContainerColorInverse
        }
    }
    
    private var titleTextColor: Color {
        switch variant {
        case .neutral:
            return isDark ? TokensSemanticDark.TextOnContainerColorPrimary : TokensSemanticLight.TextOnContainerColorPrimary
        case .brand:
            return isDark ? TokensSemanticDark.TextOnSurfaceColorPrimary : TokensSemanticLight.TextOnSurfaceColorPrimary
        case .inverse:
            return isDark ? TokensSemanticDark.TextOnContainerColorInverse : TokensSemanticLight.TextOnContainerColorInverse
        }
    }
    
    private var subtitleTextColor: Color {
        switch variant {
        case .neutral:
            return isDark ? TokensSemanticDark.TextOnContainerColorSecondary : TokensSemanticLight.TextOnContainerColorSecondary
        case .brand:
            return isDark ? TokensSemanticDark.TextOnSurfaceColorPrimary : TokensSemanticLight.TextOnSurfaceColorPrimary
        case .inverse:
            return isDark ? TokensSemanticDark.TextOnContainerColorInverse : TokensSemanticLight.TextOnContainerColorInverse
        }
    }
    
    private var messageTextColor: Color {
        switch variant {
        case .neutral:
            return isDark ? TokensSemanticDark.TextOnContainerColorPrimary : TokensSemanticLight.TextOnContainerColorPrimary
        case .brand:
            return isDark ? TokensSemanticDark.TextOnSurfaceColorPrimary : TokensSemanticLight.TextOnSurfaceColorPrimary
        case .inverse:
            return isDark ? TokensSemanticDark.TextOnContainerColorInverse : TokensSemanticLight.TextOnContainerColorInverse
        }
    }
    
    private var buttonBackgroundColor: Color {
        isDark ? TokensSemanticDark.BackgroundButtonColorBrandFilledDefault : TokensSemanticLight.BackgroundButtonColorBrandFilledDefault
    }
    
    private var buttonTextColor: Color {
        isDark ? TokensSemanticDark.TextButtonColorOrangeFilledDefault : TokensSemanticLight.TextButtonColorOrangeFilledDefault
    }
    
    private var shadowColor: Color {
        Color.black.opacity(0.1)
    }
}

// MARK: - Convenience Factory Methods

extension DSCallout {
    /// Creates a neutral callout
    public static func neutral(
        leadingIcon: (any View)? = nil,
        title: String? = nil,
        subtitle: String? = nil,
        message: String,
        buttonText: String? = nil,
        isFloating: Bool = false,
        onButtonTap: (() -> Void)? = nil
    ) -> DSCallout {
        DSCallout(
            variant: .neutral,
            leadingIcon: leadingIcon,
            title: title,
            subtitle: subtitle,
            message: message,
            buttonText: buttonText,
            isFloating: isFloating,
            onButtonTap: onButtonTap
        )
    }
    
    /// Creates a brand callout
    public static func brand(
        leadingIcon: (any View)? = nil,
        title: String? = nil,
        subtitle: String? = nil,
        message: String,
        buttonText: String? = nil,
        isFloating: Bool = false,
        onButtonTap: (() -> Void)? = nil
    ) -> DSCallout {
        DSCallout(
            variant: .brand,
            leadingIcon: leadingIcon,
            title: title,
            subtitle: subtitle,
            message: message,
            buttonText: buttonText,
            isFloating: isFloating,
            onButtonTap: onButtonTap
        )
    }
    
    /// Creates an inverse callout
    public static func inverse(
        leadingIcon: (any View)? = nil,
        title: String? = nil,
        subtitle: String? = nil,
        message: String,
        buttonText: String? = nil,
        isFloating: Bool = false,
        onButtonTap: (() -> Void)? = nil
    ) -> DSCallout {
        DSCallout(
            variant: .inverse,
            leadingIcon: leadingIcon,
            title: title,
            subtitle: subtitle,
            message: message,
            buttonText: buttonText,
            isFloating: isFloating,
            onButtonTap: onButtonTap
        )
    }
}
