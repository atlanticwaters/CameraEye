import SwiftUI

/// A menu item component with media, content, and interaction states
public struct DSMenuItem: View {
    // MARK: - Types
    
    /// Visual style of the menu item
    public enum Style {
        case outline
        case ghost
    }
    
    /// Media type for the leading element
    public enum MediaType {
        case icon(any View)
        case image(Image)
        case custom(any View)
        case payment
    }
    
    // MARK: - Properties
    
    private let style: Style
    private let media: MediaType?
    private let title: String
    private let subtitle: String?
    private let customContent: AnyView?
    private let isSelected: Bool
    private let showChevron: Bool
    private let onTap: (() -> Void)?
    
    @Environment(\.colorScheme) private var colorScheme
    
    private var isDark: Bool {
        colorScheme == .dark
    }
    
    // MARK: - Initialization
    
    /// Creates a menu item with basic content
    /// - Parameters:
    ///   - style: Visual style variant (default: .outline)
    ///   - media: Optional leading media element
    ///   - title: Primary title text
    ///   - subtitle: Optional subtitle text
    ///   - isSelected: Whether item is selected (default: false)
    ///   - showChevron: Whether to show trailing chevron (default: false)
    ///   - onTap: Optional tap action
    public init(
        style: Style = .outline,
        media: MediaType? = nil,
        title: String,
        subtitle: String? = nil,
        isSelected: Bool = false,
        showChevron: Bool = false,
        onTap: (() -> Void)? = nil
    ) {
        self.style = style
        self.media = media
        self.title = title
        self.subtitle = subtitle
        self.customContent = nil
        self.isSelected = isSelected
        self.showChevron = showChevron
        self.onTap = onTap
    }
    
    /// Creates a menu item with custom content
    /// - Parameters:
    ///   - style: Visual style variant (default: .outline)
    ///   - customContent: Custom content view
    ///   - isSelected: Whether item is selected (default: false)
    ///   - onTap: Optional tap action
    public init(
        style: Style = .outline,
        customContent: any View,
        isSelected: Bool = false,
        onTap: (() -> Void)? = nil
    ) {
        self.style = style
        self.media = nil
        self.title = ""
        self.subtitle = nil
        self.customContent = AnyView(customContent)
        self.isSelected = isSelected
        self.showChevron = false
        self.onTap = onTap
    }
    
    // MARK: - Body
    
    public var body: some View {
        Button(action: {
            onTap?()
        }) {
            HStack(spacing: 12) {
                // Media
                if let media = media {
                    mediaView(for: media)
                }
                
                // Content
                if let customContent = customContent {
                    customContent
                        .frame(maxWidth: .infinity, alignment: .leading)
                } else {
                    VStack(alignment: .leading, spacing: 6) {
                        if let subtitle = subtitle {
                            Text(subtitle)
                                .font(.thdBodySm)
                                .foregroundColor(subtitleColor)
                                .lineLimit(1)
                        }
                        
                        Text(title)
                            .font(.thdH4)
                            .fontWeight(.semibold)
                            .foregroundColor(titleColor)
                            .lineLimit(1)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                
                // Chevron
                if showChevron {
                    Image(systemName: "chevron.right")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(iconColor)
                }
            }
            .padding(.horizontal, style == .outline ? 16 : 0)
            .padding(.vertical, 12)
            .background(backgroundColor)
            .overlay(
                RoundedRectangle(cornerRadius: TokensSemanticLight.BorderRadiusLg)
                    .stroke(borderColor, lineWidth: style == .outline ? 1 : 0)
            )
            .cornerRadius(TokensSemanticLight.BorderRadiusLg)
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    // MARK: - Subviews
    
    @ViewBuilder
    private func mediaView(for mediaType: MediaType) -> some View {
        switch mediaType {
        case .icon(let icon):
            AnyView(icon)
                .frame(width: 24, height: 24)
        case .image(let image):
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40, height: 40)
                .background(isDark ? TokensSemanticDark.Greige100 : TokensSemanticLight.Greige100)
                .cornerRadius(TokensSemanticLight.BorderRadiusXs)
                .clipped()
        case .custom(let view):
            AnyView(view)
        case .payment:
            ZStack {
                RoundedRectangle(cornerRadius: TokensSemanticLight.BorderRadiusXs)
                    .fill(Color.black)
                    .frame(width: 40, height: 24)
                
                Image(systemName: "creditcard.fill")
                    .foregroundColor(.white)
                    .font(.system(size: 12))
            }
        }
    }
    
    // MARK: - Colors
    
    private var backgroundColor: Color {
        if style == .ghost {
            return isSelected 
                ? (isDark ? TokensSemanticDark.Greige050 : TokensSemanticLight.Greige050)
                : Color.clear
        } else {
            return isSelected 
                ? (isDark ? TokensSemanticDark.Greige050 : TokensSemanticLight.Greige050)
                : (isDark ? TokensSemanticDark.BackgroundContainerColorWhite : TokensSemanticLight.BackgroundContainerColorWhite)
        }
    }
    
    private var borderColor: Color {
        if style == .outline {
            return isSelected 
                ? (isDark ? TokensSemanticDark.BorderOnContainerActive : TokensSemanticLight.BorderOnContainerActive)
                : (isDark ? TokensSemanticDark.BorderOnContainerDefault : TokensSemanticLight.BorderOnContainerDefault)
        }
        return Color.clear
    }
    
    private var titleColor: Color {
        isDark ? TokensSemanticDark.TextOnContainerColorPrimary : TokensSemanticLight.TextOnContainerColorPrimary
    }
    
    private var subtitleColor: Color {
        isDark ? TokensSemanticDark.Greige600 : TokensSemanticLight.Greige600
    }
    
    private var iconColor: Color {
        isDark ? TokensSemanticDark.Greige700 : TokensSemanticLight.Greige700
    }
}

// MARK: - Convenience Factory Methods

extension DSMenuItem {
    /// Creates an outline menu item
    public static func outline(
        media: MediaType? = nil,
        title: String,
        subtitle: String? = nil,
        isSelected: Bool = false,
        showChevron: Bool = false,
        onTap: (() -> Void)? = nil
    ) -> DSMenuItem {
        DSMenuItem(
            style: .outline,
            media: media,
            title: title,
            subtitle: subtitle,
            isSelected: isSelected,
            showChevron: showChevron,
            onTap: onTap
        )
    }
    
    /// Creates a ghost menu item
    public static func ghost(
        media: MediaType? = nil,
        title: String,
        subtitle: String? = nil,
        isSelected: Bool = false,
        showChevron: Bool = false,
        onTap: (() -> Void)? = nil
    ) -> DSMenuItem {
        DSMenuItem(
            style: .ghost,
            media: media,
            title: title,
            subtitle: subtitle,
            isSelected: isSelected,
            showChevron: showChevron,
            onTap: onTap
        )
    }
}
