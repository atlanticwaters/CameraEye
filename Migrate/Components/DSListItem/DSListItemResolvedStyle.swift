import SwiftUI

// MARK: - DSListItemResolvedStyle

/// Resolved style information for DSListItem testing.
///
/// This struct captures computed styles as concrete values using token names,
/// enabling unit tests without view rendering or environment dependencies.
public struct DSListItemResolvedStyle: Equatable, Sendable {
    // MARK: - Colors

    public let textColorTokenName: String
    public let iconColorTokenName: String

    // MARK: - Data

    public let type: DSListItemType
    public let text: String
    public let isUnderlined: Bool

    // MARK: - Initializer

    public init(
        textColorTokenName: String,
        iconColorTokenName: String,
        type: DSListItemType,
        text: String,
        isUnderlined: Bool
    ) {
        self.textColorTokenName = textColorTokenName
        self.iconColorTokenName = iconColorTokenName
        self.type = type
        self.text = text
        self.isUnderlined = isUnderlined
    }

    // MARK: - Factory

    /// Creates a resolved style for the given parameters.
    public static func create(type: DSListItemType, text: String) -> DSListItemResolvedStyle {
        DSListItemResolvedStyle(
            textColorTokenName: DSListItemColorHelper.textColorTokenName(),
            iconColorTokenName: DSListItemColorHelper.iconColorTokenName(),
            type: type,
            text: text,
            isUnderlined: type == .seeAll
        )
    }
}

// MARK: - DSMenuItemResolvedStyle

/// Resolved style information for DSMenuItem testing.
public struct DSMenuItemResolvedStyle: Equatable, Sendable {
    // MARK: - Colors

    public let titleColorTokenName: String
    public let subtitleColorTokenName: String
    public let iconColorTokenName: String
    public let backgroundColorTokenName: String
    public let borderColorTokenName: String
    public let mediaBackgroundColorTokenName: String

    // MARK: - Data

    public let title: String
    public let subtitle: String?
    public let style: DSListItemStyle
    public let showMedia: Bool
    public let isSelected: Bool

    // MARK: - Initializer

    public init(
        titleColorTokenName: String,
        subtitleColorTokenName: String,
        iconColorTokenName: String,
        backgroundColorTokenName: String,
        borderColorTokenName: String,
        mediaBackgroundColorTokenName: String,
        title: String,
        subtitle: String?,
        style: DSListItemStyle,
        showMedia: Bool,
        isSelected: Bool
    ) {
        self.titleColorTokenName = titleColorTokenName
        self.subtitleColorTokenName = subtitleColorTokenName
        self.iconColorTokenName = iconColorTokenName
        self.backgroundColorTokenName = backgroundColorTokenName
        self.borderColorTokenName = borderColorTokenName
        self.mediaBackgroundColorTokenName = mediaBackgroundColorTokenName
        self.title = title
        self.subtitle = subtitle
        self.style = style
        self.showMedia = showMedia
        self.isSelected = isSelected
    }

    // MARK: - Factory

    /// Creates a resolved style for the given parameters.
    public static func create(
        title: String,
        subtitle: String?,
        style: DSListItemStyle,
        showMedia: Bool,
        isSelected: Bool
    ) -> DSMenuItemResolvedStyle {
        DSMenuItemResolvedStyle(
            titleColorTokenName: DSListItemColorHelper.menuTitleColorTokenName(),
            subtitleColorTokenName: DSListItemColorHelper.menuSubtitleColorTokenName(),
            iconColorTokenName: DSListItemColorHelper.menuIconColorTokenName(),
            backgroundColorTokenName: DSListItemColorHelper.menuBackgroundColorTokenName(),
            borderColorTokenName: isSelected
                ? DSListItemColorHelper.menuSelectedBorderColorTokenName()
                : DSListItemColorHelper.menuBorderColorTokenName(),
            mediaBackgroundColorTokenName: DSListItemColorHelper.mediaBackgroundColorTokenName(),
            title: title,
            subtitle: subtitle,
            style: style,
            showMedia: showMedia,
            isSelected: isSelected
        )
    }
}
