import SwiftUI

// MARK: - DSPLPFilterSheetResolvedStyle

/// Resolved style information for DSPLPFilterSheet testing.
///
/// This struct captures computed styles as concrete values using token names,
/// enabling unit tests without view rendering or environment dependencies.
public struct DSPLPFilterSheetResolvedStyle: Equatable, Sendable {
    // MARK: - Colors

    public let backgroundColorTokenName: String
    public let headerBackgroundColorTokenName: String
    public let titleColorTokenName: String
    public let closeButtonColorTokenName: String
    public let clearButtonColorTokenName: String
    public let categoryBackgroundColorTokenName: String
    public let categoryTitleColorTokenName: String
    public let checkboxSelectedColorTokenName: String
    public let viewResultsBackgroundColorTokenName: String
    public let viewResultsTextColorTokenName: String

    // MARK: - Data

    public let title: String
    public let categoryCount: Int
    public let resultsCount: Int
    public let hasActiveFilters: Bool
    public let expandedCategoryCount: Int
    public let totalSelectedOptionsCount: Int

    // MARK: - Initializer

    public init(
        backgroundColorTokenName: String,
        headerBackgroundColorTokenName: String,
        titleColorTokenName: String,
        closeButtonColorTokenName: String,
        clearButtonColorTokenName: String,
        categoryBackgroundColorTokenName: String,
        categoryTitleColorTokenName: String,
        checkboxSelectedColorTokenName: String,
        viewResultsBackgroundColorTokenName: String,
        viewResultsTextColorTokenName: String,
        title: String,
        categoryCount: Int,
        resultsCount: Int,
        hasActiveFilters: Bool,
        expandedCategoryCount: Int,
        totalSelectedOptionsCount: Int
    ) {
        self.backgroundColorTokenName = backgroundColorTokenName
        self.headerBackgroundColorTokenName = headerBackgroundColorTokenName
        self.titleColorTokenName = titleColorTokenName
        self.closeButtonColorTokenName = closeButtonColorTokenName
        self.clearButtonColorTokenName = clearButtonColorTokenName
        self.categoryBackgroundColorTokenName = categoryBackgroundColorTokenName
        self.categoryTitleColorTokenName = categoryTitleColorTokenName
        self.checkboxSelectedColorTokenName = checkboxSelectedColorTokenName
        self.viewResultsBackgroundColorTokenName = viewResultsBackgroundColorTokenName
        self.viewResultsTextColorTokenName = viewResultsTextColorTokenName
        self.title = title
        self.categoryCount = categoryCount
        self.resultsCount = resultsCount
        self.hasActiveFilters = hasActiveFilters
        self.expandedCategoryCount = expandedCategoryCount
        self.totalSelectedOptionsCount = totalSelectedOptionsCount
    }

    // MARK: - Factory

    /// Creates a resolved style for the given configuration.
    public static func create(data: DSPLPFilterSheetData) -> DSPLPFilterSheetResolvedStyle {
        let expandedCount = data.categories.filter { $0.isExpanded }.count
        let selectedOptionsCount = data.categories.reduce(0) { total, category in
            total + category.options.filter { $0.isSelected }.count
        }

        return DSPLPFilterSheetResolvedStyle(
            backgroundColorTokenName: DSPLPFilterSheetColorHelper.backgroundColorTokenName(),
            headerBackgroundColorTokenName: DSPLPFilterSheetColorHelper.headerBackgroundColorTokenName(),
            titleColorTokenName: DSPLPFilterSheetColorHelper.titleColorTokenName(),
            closeButtonColorTokenName: DSPLPFilterSheetColorHelper.closeButtonColorTokenName(),
            clearButtonColorTokenName: DSPLPFilterSheetColorHelper.clearButtonColorTokenName(),
            categoryBackgroundColorTokenName: DSPLPFilterSheetColorHelper.categoryBackgroundColorTokenName(),
            categoryTitleColorTokenName: DSPLPFilterSheetColorHelper.categoryTitleColorTokenName(),
            checkboxSelectedColorTokenName: DSPLPFilterSheetColorHelper.checkboxSelectedColorTokenName(),
            viewResultsBackgroundColorTokenName: DSPLPFilterSheetColorHelper.viewResultsBackgroundColorTokenName(),
            viewResultsTextColorTokenName: DSPLPFilterSheetColorHelper.viewResultsTextColorTokenName(),
            title: data.title,
            categoryCount: data.categories.count,
            resultsCount: data.resultsCount,
            hasActiveFilters: data.hasActiveFilters,
            expandedCategoryCount: expandedCount,
            totalSelectedOptionsCount: selectedOptionsCount
        )
    }
}
