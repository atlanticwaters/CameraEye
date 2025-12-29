import SwiftUI

/// A notification banner that provides contextual feedback messages with optional title and dismiss action
public struct DSAlert: View {
    // MARK: - Types
    
    /// Visual variant of the alert
    public enum Variant {
        case informational
        case success
        case warning
        case error
    }
    
    // MARK: - Properties
    
    private let variant: Variant
    private let title: String?
    private let message: String
    private let isFloating: Bool
    private let onDismiss: (() -> Void)?
    
    @Environment(\.colorScheme) private var colorScheme
    
    private var isDark: Bool {
        colorScheme == .dark
    }
    
    // MARK: - Initialization
    
    /// Creates an alert with a message and optional title
    /// - Parameters:
    ///   - variant: Visual style variant (default: .informational)
    ///   - title: Optional title text
    ///   - message: Primary message text
    ///   - isFloating: Whether to show with floating elevation (default: false)
    ///   - onDismiss: Optional dismiss action
    public init(
        variant: Variant = .informational,
        title: String? = nil,
        message: String,
        isFloating: Bool = false,
        onDismiss: (() -> Void)? = nil
    ) {
        self.variant = variant
        self.title = title
        self.message = message
        self.isFloating = isFloating
        self.onDismiss = onDismiss
    }
    
    // MARK: - Body
    
    public var body: some View {
        HStack(alignment: .top, spacing: TokensSpacing.Spacing2) {
            // Leading icon
            iconView
                .frame(width: 16, height: 16)
            
            // Content
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                if let title = title {
                    Text(title)
                        .thdFont(.bodyMd)
                        .foregroundColor(textColor)
                        .lineLimit(nil)
                }
                
                Text(message)
                    .thdFont(.bodySm)
                    .foregroundColor(textColor)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            // Dismiss button
            if onDismiss != nil {
                dismissButton
                    .frame(width: 44, height: 44)
            }
        }
        .padding(TokensSpacing.Spacing4)
        .background(backgroundColor)
        .cornerRadius(TokensSemanticLight.BorderRadius2xl)
        .shadow(color: isFloating ? shadowColor : .clear, radius: isFloating ? 6 : 0, x: 0, y: isFloating ? 3 : 0)
    }
    
    // MARK: - Subviews
    
    @ViewBuilder
    private var iconView: some View {
        switch variant {
        case .informational:
            Image(systemName: "info.circle.fill")
                .foregroundColor(isDark ? TokensComponentsDark.IconOnContainerColorInformational : TokensComponentsLight.IconOnContainerColorInformational)
        case .success:
            Image(systemName: "checkmark.circle.fill")
                .foregroundColor(isDark ? TokensComponentsDark.IconOnContainerColorSuccess : TokensComponentsLight.IconOnContainerColorSuccess)
        case .warning:
            Image(systemName: "exclamationmark.triangle.fill")
                .foregroundColor(isDark ? TokensComponentsDark.IconOnContainerColorWarning : TokensComponentsLight.IconOnContainerColorWarning)
        case .error:
            Image(systemName: "exclamationmark.circle.fill")
                .foregroundColor(isDark ? TokensComponentsDark.IconOnContainerColorError : TokensComponentsLight.IconOnContainerColorError)
        }
    }
    
    private var dismissButton: some View {
        Button(action: {
            onDismiss?()
        }) {
            ZStack {
                Circle()
                    .fill(Color.clear)
                    .frame(width: 36, height: 36)
                
                Image(systemName: "xmark")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(isDark ? TokensComponentsDark.IconOnContainerColorPrimary : TokensComponentsLight.IconOnContainerColorPrimary)
            }
        }
        .buttonStyle(PlainButtonStyle())
        .padding(4)
    }
    
    // MARK: - Colors
    
    private var backgroundColor: Color {
        switch variant {
        case .informational:
            return isDark ? TokensSemanticDark.BackgroundFeedbackColorInformationalAccent1 : TokensSemanticLight.BackgroundFeedbackColorInformationalAccent1
        case .success:
            return isDark ? TokensSemanticDark.BackgroundFeedbackColorSuccessAccent1 : TokensSemanticLight.BackgroundFeedbackColorSuccessAccent1
        case .warning:
            return isDark ? TokensSemanticDark.BackgroundFeedbackColorWarningAccent1 : TokensSemanticLight.BackgroundFeedbackColorWarningAccent1
        case .error:
            return isDark ? TokensSemanticDark.BackgroundFeedbackColorErrorAccent1 : TokensSemanticLight.BackgroundFeedbackColorErrorAccent1
        }
    }
    
    private var textColor: Color {
        isDark ? TokensSemanticDark.TextOnContainerColorPrimary : TokensSemanticLight.TextOnContainerColorPrimary
    }
    
    private var shadowColor: Color {
        Color.black.opacity(0.1)
    }
}

// MARK: - Convenience Factory Methods

extension DSAlert {
    /// Creates an informational alert
    public static func informational(
        title: String? = nil,
        message: String,
        isFloating: Bool = false,
        onDismiss: (() -> Void)? = nil
    ) -> DSAlert {
        DSAlert(variant: .informational, title: title, message: message, isFloating: isFloating, onDismiss: onDismiss)
    }
    
    /// Creates a success alert
    public static func success(
        title: String? = nil,
        message: String,
        isFloating: Bool = false,
        onDismiss: (() -> Void)? = nil
    ) -> DSAlert {
        DSAlert(variant: .success, title: title, message: message, isFloating: isFloating, onDismiss: onDismiss)
    }
    
    /// Creates a warning alert
    public static func warning(
        title: String? = nil,
        message: String,
        isFloating: Bool = false,
        onDismiss: (() -> Void)? = nil
    ) -> DSAlert {
        DSAlert(variant: .warning, title: title, message: message, isFloating: isFloating, onDismiss: onDismiss)
    }
    
    /// Creates an error alert
    public static func error(
        title: String? = nil,
        message: String,
        isFloating: Bool = false,
        onDismiss: (() -> Void)? = nil
    ) -> DSAlert {
        DSAlert(variant: .error, title: title, message: message, isFloating: isFloating, onDismiss: onDismiss)
    }
}
