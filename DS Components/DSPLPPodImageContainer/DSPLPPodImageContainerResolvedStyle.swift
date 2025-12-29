import SwiftUI

// MARK: - DSPLPPodImageContainerResolvedStyle

/// Resolved style information for DSPLPPodImageContainer testing.
///
/// This struct captures computed styles as concrete values using token names,
/// enabling unit tests without view rendering or environment dependencies.
public struct DSPLPPodImageContainerResolvedStyle: Equatable, Sendable {
    // MARK: - Background

    public let backgroundColorTokenName: String
    public let contentBackgroundColorTokenName: String

    // MARK: - Badge

    public let badgeTextColorTokenName: String
    public let badgeBackgroundColorTokenName: String

    // MARK: - Swatches

    public let swatchSelectedBorderColorTokenName: String
    public let swatchUnselectedBorderColorTokenName: String
    public let swatchPlaceholderColorTokenName: String
    public let swatchCountTextColorTokenName: String

    // MARK: - Options

    public let moreOptionsTextColorTokenName: String
    public let customOptionsTextColorTokenName: String
    public let swatchErrorTextColorTokenName: String

    // MARK: - Sponsored

    public let sponsoredTextColorTokenName: String

    // MARK: - Data

    public let badgeCount: Int
    public let isSponsored: Bool
    public let hasSwatches: Bool

    // MARK: - Initializer

    public init(
        backgroundColorTokenName: String,
        contentBackgroundColorTokenName: String,
        badgeTextColorTokenName: String,
        badgeBackgroundColorTokenName: String,
        swatchSelectedBorderColorTokenName: String,
        swatchUnselectedBorderColorTokenName: String,
        swatchPlaceholderColorTokenName: String,
        swatchCountTextColorTokenName: String,
        moreOptionsTextColorTokenName: String,
        customOptionsTextColorTokenName: String,
        swatchErrorTextColorTokenName: String,
        sponsoredTextColorTokenName: String,
        badgeCount: Int,
        isSponsored: Bool,
        hasSwatches: Bool
    ) {
        self.backgroundColorTokenName = backgroundColorTokenName
        self.contentBackgroundColorTokenName = contentBackgroundColorTokenName
        self.badgeTextColorTokenName = badgeTextColorTokenName
        self.badgeBackgroundColorTokenName = badgeBackgroundColorTokenName
        self.swatchSelectedBorderColorTokenName = swatchSelectedBorderColorTokenName
        self.swatchUnselectedBorderColorTokenName = swatchUnselectedBorderColorTokenName
        self.swatchPlaceholderColorTokenName = swatchPlaceholderColorTokenName
        self.swatchCountTextColorTokenName = swatchCountTextColorTokenName
        self.moreOptionsTextColorTokenName = moreOptionsTextColorTokenName
        self.customOptionsTextColorTokenName = customOptionsTextColorTokenName
        self.swatchErrorTextColorTokenName = swatchErrorTextColorTokenName
        self.sponsoredTextColorTokenName = sponsoredTextColorTokenName
        self.badgeCount = badgeCount
        self.isSponsored = isSponsored
        self.hasSwatches = hasSwatches
    }

    // MARK: - Factory

    /// Creates a resolved style for the given configuration.
    public static func create(
        badgeColor: DSPLPPodBadge.BadgeColor,
        badgeCount: Int,
        isSponsored: Bool,
        hasSwatches: Bool
    ) -> DSPLPPodImageContainerResolvedStyle {
        let badgeTextTokenName: String
        let badgeBackgroundTokenName: String

        switch badgeColor {
        case .info:
            badgeTextTokenName = DSPLPPodImageContainerColorHelper.badgeInfoTextColorTokenName()
            badgeBackgroundTokenName = DSPLPPodImageContainerColorHelper.badgeInfoBackgroundColorTokenName()
        case .success:
            badgeTextTokenName = DSPLPPodImageContainerColorHelper.badgeSuccessTextColorTokenName()
            badgeBackgroundTokenName = DSPLPPodImageContainerColorHelper.badgeSuccessBackgroundColorTokenName()
        case .warning:
            badgeTextTokenName = DSPLPPodImageContainerColorHelper.badgeWarningTextColorTokenName()
            badgeBackgroundTokenName = DSPLPPodImageContainerColorHelper.badgeWarningBackgroundColorTokenName()
        case .error:
            badgeTextTokenName = DSPLPPodImageContainerColorHelper.badgeErrorTextColorTokenName()
            badgeBackgroundTokenName = DSPLPPodImageContainerColorHelper.badgeErrorBackgroundColorTokenName()
        case .neutral:
            badgeTextTokenName = DSPLPPodImageContainerColorHelper.badgeNeutralTextColorTokenName()
            badgeBackgroundTokenName = DSPLPPodImageContainerColorHelper.badgeNeutralBackgroundColorTokenName()
        }

        return DSPLPPodImageContainerResolvedStyle(
            backgroundColorTokenName: DSPLPPodImageContainerColorHelper.backgroundColorTokenName(),
            contentBackgroundColorTokenName: DSPLPPodImageContainerColorHelper.contentBackgroundColorTokenName(),
            badgeTextColorTokenName: badgeTextTokenName,
            badgeBackgroundColorTokenName: badgeBackgroundTokenName,
            swatchSelectedBorderColorTokenName: DSPLPPodImageContainerColorHelper.swatchSelectedBorderColorTokenName(),
            swatchUnselectedBorderColorTokenName: DSPLPPodImageContainerColorHelper.swatchUnselectedBorderColorTokenName(),
            swatchPlaceholderColorTokenName: DSPLPPodImageContainerColorHelper.swatchPlaceholderColorTokenName(),
            swatchCountTextColorTokenName: DSPLPPodImageContainerColorHelper.swatchCountTextColorTokenName(),
            moreOptionsTextColorTokenName: DSPLPPodImageContainerColorHelper.moreOptionsTextColorTokenName(),
            customOptionsTextColorTokenName: DSPLPPodImageContainerColorHelper.customOptionsTextColorTokenName(),
            swatchErrorTextColorTokenName: DSPLPPodImageContainerColorHelper.swatchErrorTextColorTokenName(),
            sponsoredTextColorTokenName: DSPLPPodImageContainerColorHelper.sponsoredTextColorTokenName(),
            badgeCount: badgeCount,
            isSponsored: isSponsored,
            hasSwatches: hasSwatches
        )
    }
}
