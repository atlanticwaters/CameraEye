import SwiftUI

// MARK: - DSListItemType

/// The type/category of list item, determining icon and styling.
public enum DSListItemType: CaseIterable, Sendable {
    /// Search result item with search icon
    case search
    /// Trending item with trending arrow icon
    case trending
    /// Recently purchased item with buy again icon
    case recentlyPurchased
    /// See all results link with underlined text
    case seeAll
}

// MARK: - DSListItemStyle

/// Visual style variants for DSListItem.
public enum DSListItemStyle: CaseIterable, Sendable {
    /// Outlined style with border
    case outline
    /// Ghost style without border
    case ghost
}

// MARK: - DSMenuItemUseCase

/// Use case variants for menu items.
public enum DSMenuItemUseCase: CaseIterable, Sendable {
    /// Basic menu item with icon and title
    case basic
    /// Composed menu item with icon, title, and subtitle
    case composed
}

// MARK: - DSListItem

/// A list item component for displaying items in lists with icons and text.
///
/// DSListItem supports different types (search, trending, recentlyPurchased, seeAll)
/// and is commonly used in search results, suggestions, and navigation lists.
///
/// Example usage:
/// ```swift
/// // Search result item
/// DSListItem(
///     type: .search,
///     text: "What you searched for",
///     onTap: { print("Tapped") }
/// )
///
/// // Trending item
/// DSListItem(
///     type: .trending,
///     text: "Trending items",
///     onTap: { print("Tapped") }
/// )
///
/// // See all results
/// DSListItem(
///     type: .seeAll,
///     text: "See all results",
///     onTap: { print("Tapped") }
/// )
/// ```
public struct DSListItem: View {
    // MARK: - Properties

    private let type: DSListItemType
    private let text: String
    private let onTap: (() -> Void)?

    // MARK: - Constants

    private enum Layout {
        static let horizontalPadding: CGFloat = 20
        static let verticalPadding: CGFloat = 12
        static let iconSize: CGFloat = 24
        static let spacing: CGFloat = 6
        static let fontSize: CGFloat = 16
    }

    // MARK: - Initializers

    public init(
        type: DSListItemType,
        text: String,
        onTap: (() -> Void)? = nil
    ) {
        self.type = type
        self.text = text
        self.onTap = onTap
    }

    // MARK: - Body

    public var body: some View {
        Button {
            onTap?()
        } label: {
            HStack(spacing: Layout.spacing) {
                // Leading icon (except for seeAll type)
                if type != .seeAll {
                    iconView
                }

                // Text
                textView

                Spacer()
            }
            .padding(.horizontal, Layout.horizontalPadding)
            .padding(.vertical, Layout.verticalPadding)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }

    // MARK: - Icon View

    @ViewBuilder
    private var iconView: some View {
        iconImage
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: Layout.iconSize, height: Layout.iconSize)
            .foregroundColor(DSListItemColorHelper.iconColor())
    }

    private var iconImage: Image {
        switch type {
        case .search:
            return Image(systemName: "magnifyingglass")
        case .trending:
            return Image(systemName: "arrow.up.right")
        case .recentlyPurchased:
            return Image(systemName: "arrow.clockwise")
        case .seeAll:
            return Image(systemName: "chevron.right")
        }
    }

    // MARK: - Text View

    @ViewBuilder
    private var textView: some View {
        if type == .seeAll {
            Text(text)
                .font(.system(size: Layout.fontSize, weight: .regular))
                .foregroundColor(DSListItemColorHelper.textColor())
                .underline()
                .lineLimit(1)
        } else {
            Text(text)
                .font(.system(size: Layout.fontSize, weight: .regular))
                .foregroundColor(DSListItemColorHelper.textColor())
                .lineLimit(1)
        }
    }
}

// MARK: - DSMenuItem

/// A menu item component for displaying items with optional media and subtitle.
///
/// DSMenuItem supports different styles (outline/ghost), use cases (basic/composed),
/// and selection states. It's commonly used in settings, navigation, and action menus.
///
/// Example usage:
/// ```swift
/// // Basic menu item
/// DSMenuItem(
///     title: "Profile",
///     leadingIcon: Image(systemName: "person"),
///     onTap: { print("Tapped") }
/// )
///
/// // Composed menu item with subtitle
/// DSMenuItem(
///     title: "Account Settings",
///     subtitle: "Manage your account preferences",
///     leadingIcon: Image(systemName: "gearshape"),
///     style: .outline,
///     isSelected: false,
///     onTap: { print("Tapped") }
/// )
/// ```
public struct DSMenuItem: View {
    // MARK: - Properties

    private let title: String
    private let subtitle: String?
    private let leadingIcon: Image?
    private let trailingIcon: Image?
    private let style: DSListItemStyle
    private let showMedia: Bool
    private let isSelected: Bool
    private let onTap: (() -> Void)?

    // MARK: - Constants

    private enum Layout {
        static let horizontalPadding: CGFloat = 12
        static let verticalPadding: CGFloat = 10
        static let iconContainerSize: CGFloat = 40
        static let iconSize: CGFloat = 24
        static let spacing: CGFloat = 6
        static let contentSpacing: CGFloat = 12
        static let cornerRadius: CGFloat = 8
        static let borderWidth: CGFloat = 1
    }

    // MARK: - Initializers

    public init(
        title: String,
        subtitle: String? = nil,
        leadingIcon: Image? = nil,
        trailingIcon: Image? = nil,
        style: DSListItemStyle = .outline,
        showMedia: Bool = true,
        isSelected: Bool = false,
        onTap: (() -> Void)? = nil
    ) {
        self.title = title
        self.subtitle = subtitle
        self.leadingIcon = leadingIcon
        self.trailingIcon = trailingIcon
        self.style = style
        self.showMedia = showMedia
        self.isSelected = isSelected
        self.onTap = onTap
    }

    // MARK: - Body

    public var body: some View {
        Button {
            onTap?()
        } label: {
            HStack(spacing: Layout.contentSpacing) {
                // Leading media
                if showMedia, let icon = leadingIcon {
                    mediaContainer(icon: icon)
                }

                // Content
                VStack(alignment: .leading, spacing: 2) {
                    Text(title)
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(DSListItemColorHelper.menuTitleColor())
                        .lineLimit(1)

                    if let subtitle {
                        Text(subtitle)
                            .font(.system(size: 14, weight: .regular))
                            .foregroundColor(DSListItemColorHelper.menuSubtitleColor())
                            .lineLimit(1)
                    }
                }

                Spacer()

                // Trailing icon
                if let trailingIcon {
                    trailingIcon
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: Layout.iconSize, height: Layout.iconSize)
                        .foregroundColor(DSListItemColorHelper.menuIconColor())
                }
            }
            .padding(.horizontal, Layout.horizontalPadding)
            .padding(.vertical, Layout.verticalPadding)
            .background(backgroundView)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }

    // MARK: - Media Container

    @ViewBuilder
    private func mediaContainer(icon: Image) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .fill(DSListItemColorHelper.mediaBackgroundColor())
                .frame(width: Layout.iconContainerSize, height: Layout.iconContainerSize)

            icon
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: Layout.iconSize, height: Layout.iconSize)
                .foregroundColor(DSListItemColorHelper.menuIconColor())
        }
    }

    // MARK: - Background

    @ViewBuilder
    private var backgroundView: some View {
        switch style {
        case .outline:
            RoundedRectangle(cornerRadius: Layout.cornerRadius)
                .fill(DSListItemColorHelper.menuBackgroundColor())
                .overlay(
                    RoundedRectangle(cornerRadius: Layout.cornerRadius)
                        .stroke(
                            isSelected
                                ? DSListItemColorHelper.menuSelectedBorderColor()
                                : DSListItemColorHelper.menuBorderColor(),
                            lineWidth: Layout.borderWidth
                        )
                )
        case .ghost:
            Color.clear
        }
    }
}

// MARK: - Factory Methods

extension DSListItem {
    /// Creates a search result list item.
    public static func search(_ text: String, onTap: (() -> Void)? = nil) -> DSListItem {
        DSListItem(type: .search, text: text, onTap: onTap)
    }

    /// Creates a trending list item.
    public static func trending(_ text: String, onTap: (() -> Void)? = nil) -> DSListItem {
        DSListItem(type: .trending, text: text, onTap: onTap)
    }

    /// Creates a recently purchased list item.
    public static func recentlyPurchased(_ text: String, onTap: (() -> Void)? = nil) -> DSListItem {
        DSListItem(type: .recentlyPurchased, text: text, onTap: onTap)
    }

    /// Creates a "see all results" list item.
    public static func seeAll(_ text: String = "See all results", onTap: (() -> Void)? = nil) -> DSListItem {
        DSListItem(type: .seeAll, text: text, onTap: onTap)
    }
}
