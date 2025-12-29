import SwiftUI

/// A list item component for displaying search results, trending items, and purchase history
public struct DSListItem: View {
    // MARK: - Types
    
    /// Visual variant of the list item
    public enum ItemType {
        case search
        case trending
        case recentlyPurchased
        case seeAll
    }
    
    // MARK: - Properties
    
    private let type: ItemType
    private let title: String
    private let onTap: (() -> Void)?
    
    @Environment(\.colorScheme) private var colorScheme
    
    private var isDark: Bool {
        colorScheme == .dark
    }
    
    // MARK: - Initialization
    
    /// Creates a list item
    /// - Parameters:
    ///   - type: Visual style variant
    ///   - title: Item text
    ///   - onTap: Optional tap action
    public init(
        type: ItemType,
        title: String,
        onTap: (() -> Void)? = nil
    ) {
        self.type = type
        self.title = title
        self.onTap = onTap
    }
    
    // MARK: - Body
    
    public var body: some View {
        Button(action: {
            onTap?()
        }) {
            HStack(spacing: 12) {
                // Leading icon
                iconView
                    .frame(width: 24, height: 24)
                
                // Title
                Text(title)
                    .font(.custom("THD SmVar Beta", size: 20))
                    .foregroundColor(textColor)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .contentShape(Rectangle())
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    // MARK: - Subviews
    
    @ViewBuilder
    private var iconView: some View {
        switch type {
        case .search:
            Image(systemName: "magnifyingglass")
                .foregroundColor(iconColor)
        case .trending:
            Image(systemName: "arrow.up.right")
                .foregroundColor(iconColor)
                .rotationEffect(.degrees(-45))
        case .recentlyPurchased:
            Image(systemName: "arrow.clockwise")
                .foregroundColor(iconColor)
        case .seeAll:
            EmptyView()
        }
    }
    
    // MARK: - Colors
    
    private var textColor: Color {
        if type == .seeAll {
            return isDark ? TokensSemanticDark.Greige900 : TokensSemanticLight.Greige900
        }
        return isDark ? TokensSemanticDark.Greige900 : TokensSemanticLight.Greige900
    }
    
    private var iconColor: Color {
        isDark ? TokensSemanticDark.Greige700 : TokensSemanticLight.Greige700
    }
}

// MARK: - Convenience Factory Methods

extension DSListItem {
    /// Creates a search list item
    public static func search(
        title: String,
        onTap: (() -> Void)? = nil
    ) -> DSListItem {
        DSListItem(type: .search, title: title, onTap: onTap)
    }
    
    /// Creates a trending list item
    public static func trending(
        title: String,
        onTap: (() -> Void)? = nil
    ) -> DSListItem {
        DSListItem(type: .trending, title: title, onTap: onTap)
    }
    
    /// Creates a recently purchased list item
    public static func recentlyPurchased(
        title: String,
        onTap: (() -> Void)? = nil
    ) -> DSListItem {
        DSListItem(type: .recentlyPurchased, title: title, onTap: onTap)
    }
    
    /// Creates a see all list item
    public static func seeAll(
        title: String,
        onTap: (() -> Void)? = nil
    ) -> DSListItem {
        DSListItem(type: .seeAll, title: title, onTap: onTap)
    }
}
