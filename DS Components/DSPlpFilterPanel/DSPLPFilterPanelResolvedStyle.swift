import SwiftUI

// MARK: - DSPLPFilterPanelResolvedStyle

/// Resolved style information for DSPLPFilterPanel testing.
///
/// This struct captures computed styles as concrete values using token names,
/// enabling unit tests without view rendering or environment dependencies.
public struct DSPLPFilterPanelResolvedStyle: Equatable, Sendable {
    // MARK: - Colors

    public let categoryTitleColorTokenName: String
    public let resultsTextColorTokenName: String
    public let backgroundColorTokenName: String

    // MARK: - Data

    public let categoryTitle: String
    public let categoryPillCount: Int
    public let resultsCount: Int
    public let primaryFilterCount: Int
    public let secondaryFilterCount: Int
    public let selectedCategoryId: String?

    // MARK: - Initializer

    public init(
        categoryTitleColorTokenName: String,
        resultsTextColorTokenName: String,
        backgroundColorTokenName: String,
        categoryTitle: String,
        categoryPillCount: Int,
        resultsCount: Int,
        primaryFilterCount: Int,
        secondaryFilterCount: Int,
        selectedCategoryId: String?
    ) {
        self.categoryTitleColorTokenName = categoryTitleColorTokenName
        self.resultsTextColorTokenName = resultsTextColorTokenName
        self.backgroundColorTokenName = backgroundColorTokenName
        self.categoryTitle = categoryTitle
        self.categoryPillCount = categoryPillCount
        self.resultsCount = resultsCount
        self.primaryFilterCount = primaryFilterCount
        self.secondaryFilterCount = secondaryFilterCount
        self.selectedCategoryId = selectedCategoryId
    }

    // MARK: - Factory

    /// Creates a resolved style for the given configuration.
    public static func create(
        data: DSPLPFilterPanelData,
        selectedCategoryId: String?
    ) -> DSPLPFilterPanelResolvedStyle {
        return DSPLPFilterPanelResolvedStyle(
            categoryTitleColorTokenName: DSPLPFilterPanelColorHelper.categoryTitleColorTokenName(),
            resultsTextColorTokenName: DSPLPFilterPanelColorHelper.resultsTextColorTokenName(),
            backgroundColorTokenName: DSPLPFilterPanelColorHelper.backgroundColorTokenName(),
            categoryTitle: data.categoryTitle,
            categoryPillCount: data.categoryPills.count,
            resultsCount: data.resultsCount,
            primaryFilterCount: data.primaryFilters.count,
            secondaryFilterCount: data.secondaryFilters.count,
            selectedCategoryId: selectedCategoryId
        )
    }
}
