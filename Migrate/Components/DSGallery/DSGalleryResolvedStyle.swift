import SwiftUI

// MARK: - DSGalleryResolvedStyle

/// Resolved style information for DSGallery testing.
///
/// This struct captures computed styles as concrete values using token names,
/// enabling unit tests without view rendering or environment dependencies.
public struct DSGalleryResolvedStyle: Equatable, Sendable {
    /// The background color token name
    public let backgroundColorTokenName: String

    /// The text color token name
    public let textColorTokenName: String

    /// The secondary text color token name
    public let secondaryTextColorTokenName: String

    /// The icon color token name
    public let iconColorTokenName: String

    /// The selected tab color token name
    public let selectedTabColorTokenName: String

    /// The unselected tab color token name
    public let unselectedTabColorTokenName: String

    /// The tab bar background token name
    public let tabBarBackgroundTokenName: String

    /// The selected tab
    public let selectedTab: DSGalleryTab

    /// Creates a resolved style for the given configuration.
    public init(selectedTab: DSGalleryTab) {
        self.backgroundColorTokenName = DSGalleryColorHelper.backgroundColorTokenName()
        self.textColorTokenName = DSGalleryColorHelper.textColorTokenName()
        self.secondaryTextColorTokenName = DSGalleryColorHelper.secondaryTextColorTokenName()
        self.iconColorTokenName = DSGalleryColorHelper.iconColorTokenName()
        self.selectedTabColorTokenName = DSGalleryColorHelper.selectedTabColorTokenName()
        self.unselectedTabColorTokenName = DSGalleryColorHelper.unselectedTabColorTokenName()
        self.tabBarBackgroundTokenName = DSGalleryColorHelper.tabBarBackgroundTokenName()
        self.selectedTab = selectedTab
    }
}
