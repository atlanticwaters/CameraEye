import SwiftUI

// MARK: - DSShareSheetResolvedStyle

/// Resolved style information for DSShareSheet testing.
///
/// This struct captures computed styles as concrete values using token names,
/// enabling unit tests without view rendering or environment dependencies.
public struct DSShareSheetResolvedStyle: Equatable, Sendable {
    // MARK: - Colors

    public let backgroundColorTokenName: String
    public let handleColorTokenName: String
    public let titleColorTokenName: String
    public let subtitleColorTokenName: String
    public let shareActionBackgroundColorTokenName: String
    public let shareActionIconColorTokenName: String
    public let shareActionLabelColorTokenName: String
    public let actionRowIconColorTokenName: String
    public let actionRowLabelColorTokenName: String
    public let destructiveColorTokenName: String

    // MARK: - Data

    public let title: String?
    public let subtitle: String?
    public let shareActionCount: Int
    public let actionRowCount: Int
    public let hasDestructiveAction: Bool

    // MARK: - Initializer

    public init(
        backgroundColorTokenName: String,
        handleColorTokenName: String,
        titleColorTokenName: String,
        subtitleColorTokenName: String,
        shareActionBackgroundColorTokenName: String,
        shareActionIconColorTokenName: String,
        shareActionLabelColorTokenName: String,
        actionRowIconColorTokenName: String,
        actionRowLabelColorTokenName: String,
        destructiveColorTokenName: String,
        title: String?,
        subtitle: String?,
        shareActionCount: Int,
        actionRowCount: Int,
        hasDestructiveAction: Bool
    ) {
        self.backgroundColorTokenName = backgroundColorTokenName
        self.handleColorTokenName = handleColorTokenName
        self.titleColorTokenName = titleColorTokenName
        self.subtitleColorTokenName = subtitleColorTokenName
        self.shareActionBackgroundColorTokenName = shareActionBackgroundColorTokenName
        self.shareActionIconColorTokenName = shareActionIconColorTokenName
        self.shareActionLabelColorTokenName = shareActionLabelColorTokenName
        self.actionRowIconColorTokenName = actionRowIconColorTokenName
        self.actionRowLabelColorTokenName = actionRowLabelColorTokenName
        self.destructiveColorTokenName = destructiveColorTokenName
        self.title = title
        self.subtitle = subtitle
        self.shareActionCount = shareActionCount
        self.actionRowCount = actionRowCount
        self.hasDestructiveAction = hasDestructiveAction
    }

    // MARK: - Factory

    /// Creates a resolved style for the given data.
    public static func create(data: DSShareSheetData) -> DSShareSheetResolvedStyle {
        let hasDestructive = data.actionRows.contains { $0.isDestructive }

        return DSShareSheetResolvedStyle(
            backgroundColorTokenName: DSShareSheetColorHelper.backgroundColorTokenName(),
            handleColorTokenName: DSShareSheetColorHelper.handleColorTokenName(),
            titleColorTokenName: DSShareSheetColorHelper.titleColorTokenName(),
            subtitleColorTokenName: DSShareSheetColorHelper.subtitleColorTokenName(),
            shareActionBackgroundColorTokenName: DSShareSheetColorHelper.shareActionBackgroundColorTokenName(),
            shareActionIconColorTokenName: DSShareSheetColorHelper.shareActionIconColorTokenName(),
            shareActionLabelColorTokenName: DSShareSheetColorHelper.shareActionLabelColorTokenName(),
            actionRowIconColorTokenName: DSShareSheetColorHelper.actionRowIconColorTokenName(),
            actionRowLabelColorTokenName: DSShareSheetColorHelper.actionRowLabelColorTokenName(),
            destructiveColorTokenName: DSShareSheetColorHelper.destructiveColorTokenName(),
            title: data.title,
            subtitle: data.subtitle,
            shareActionCount: data.shareActions.count,
            actionRowCount: data.actionRows.count,
            hasDestructiveAction: hasDestructive
        )
    }
}
