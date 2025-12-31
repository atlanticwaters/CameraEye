import SwiftUI

// MARK: - DSPLPFilterCategory

/// A filter category with expandable options.
public struct DSPLPFilterCategory: Identifiable, Equatable, Sendable {
    public let id: String
    public let title: String
    public let options: [DSPLPFilterOption]
    public let selectedCount: Int
    public let isExpanded: Bool

    public init(
        id: String = UUID().uuidString,
        title: String,
        options: [DSPLPFilterOption] = [],
        selectedCount: Int = 0,
        isExpanded: Bool = false
    ) {
        self.id = id
        self.title = title
        self.options = options
        self.selectedCount = selectedCount
        self.isExpanded = isExpanded
    }
}

// MARK: - DSPLPFilterOption

/// A selectable filter option within a category.
public struct DSPLPFilterOption: Identifiable, Equatable, Sendable {
    public let id: String
    public let label: String
    public let count: Int?
    public let isSelected: Bool
    public let swatchColor: Color?
    public let image: Image?

    public init(
        id: String = UUID().uuidString,
        label: String,
        count: Int? = nil,
        isSelected: Bool = false,
        swatchColor: Color? = nil,
        image: Image? = nil
    ) {
        self.id = id
        self.label = label
        self.count = count
        self.isSelected = isSelected
        self.swatchColor = swatchColor
        self.image = image
    }
}

// MARK: - DSPLPFilterSheetData

/// Data model for the PLP Filter Sheet.
public struct DSPLPFilterSheetData: Equatable, Sendable {
    public let title: String
    public let categories: [DSPLPFilterCategory]
    public let resultsCount: Int
    public let hasActiveFilters: Bool

    public init(
        title: String = "Sort & Filter",
        categories: [DSPLPFilterCategory] = [],
        resultsCount: Int = 0,
        hasActiveFilters: Bool = false
    ) {
        self.title = title
        self.categories = categories
        self.resultsCount = resultsCount
        self.hasActiveFilters = hasActiveFilters
    }
}

// MARK: - DSPLPFilterSheet

/// A full-screen filter sheet for the PLP (Product Listing Page) experience.
///
/// DSPLPFilterSheet displays filter categories as expandable tiles, allowing users
/// to select filter options. It includes a header with title and close button,
/// scrollable filter categories, and a results button at the bottom.
///
/// Example usage:
/// ```swift
/// DSPLPFilterSheet(
///     data: DSPLPFilterSheetData(
///         title: "Sort & Filter",
///         categories: [
///             DSPLPFilterCategory(
///                 title: "Get it Fast",
///                 options: [
///                     DSPLPFilterOption(label: "In Stock Today", count: 45),
///                     DSPLPFilterOption(label: "Free Delivery", count: 38)
///                 ]
///             ),
///             DSPLPFilterCategory(title: "Brand", selectedCount: 2),
///             DSPLPFilterCategory(title: "Price")
///         ],
///         resultsCount: 102
///     ),
///     onClose: { print("Close") },
///     onCategoryTap: { category in print("Category: \(category.title)") },
///     onOptionTap: { option in print("Option: \(option.label)") },
///     onViewResults: { print("View Results") },
///     onClearAll: { print("Clear All") }
/// )
/// ```
public struct DSPLPFilterSheet: View {
    // MARK: - Properties

    private let data: DSPLPFilterSheetData
    private let onClose: (() -> Void)?
    private let onCategoryTap: ((DSPLPFilterCategory) -> Void)?
    private let onOptionTap: ((DSPLPFilterOption) -> Void)?
    private let onViewResults: (() -> Void)?
    private let onClearAll: (() -> Void)?

    // MARK: - Layout Constants

    private enum Layout {
        static let headerHeight: CGFloat = 56
        static let headerPadding: CGFloat = 16
        static let contentPadding: CGFloat = 16
        static let categorySpacing: CGFloat = 8
        static let optionSpacing: CGFloat = 4
        static let bottomPadding: CGFloat = 32
    }

    // MARK: - Initializer

    public init(
        data: DSPLPFilterSheetData,
        onClose: (() -> Void)? = nil,
        onCategoryTap: ((DSPLPFilterCategory) -> Void)? = nil,
        onOptionTap: ((DSPLPFilterOption) -> Void)? = nil,
        onViewResults: (() -> Void)? = nil,
        onClearAll: (() -> Void)? = nil
    ) {
        self.data = data
        self.onClose = onClose
        self.onCategoryTap = onCategoryTap
        self.onOptionTap = onOptionTap
        self.onViewResults = onViewResults
        self.onClearAll = onClearAll
    }

    // MARK: - Body

    public var body: some View {
        VStack(spacing: 0) {
            // Header
            headerSection

            // Scrollable Content
            ScrollView {
                VStack(spacing: Layout.categorySpacing) {
                    ForEach(data.categories) { category in
                        categorySection(category)
                    }
                }
                .padding(.horizontal, Layout.contentPadding)
                .padding(.top, Layout.contentPadding)
                .padding(.bottom, Layout.bottomPadding)
            }

            // Bottom Action Bar
            bottomActionBar
        }
        .background(DSPLPFilterSheetColorHelper.backgroundColor())
    }

    // MARK: - Header Section

    @ViewBuilder
    private var headerSection: some View {
        HStack {
            // Close button
            DSIconButton(
                systemName: "xmark",
                style: .ghost,
                size: .medium,
                accessibilityLabel: "Close filter sheet"
            ) {
                onClose?()
            }

            Spacer()

            // Title
            Text(data.title)
                .font(.system(size: 17, weight: .semibold))
                .foregroundStyle(DSPLPFilterSheetColorHelper.titleColor())

            Spacer()

            // Clear All button (if active filters)
            if data.hasActiveFilters {
                Button(action: { onClearAll?() }) {
                    Text("Clear All")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundStyle(DSPLPFilterSheetColorHelper.clearButtonColor())
                }
                .frame(width: 70, height: 44)
            } else {
                Spacer()
                    .frame(width: 44)
            }
        }
        .padding(.horizontal, Layout.headerPadding)
        .frame(height: Layout.headerHeight)
        .background(DSPLPFilterSheetColorHelper.headerBackgroundColor())
    }

    // MARK: - Category Section

    @ViewBuilder
    private func categorySection(_ category: DSPLPFilterCategory) -> some View {
        VStack(spacing: Layout.optionSpacing) {
            // Category Tile
            categoryTile(category)

            // Expanded Options
            if category.isExpanded && !category.options.isEmpty {
                VStack(spacing: Layout.optionSpacing) {
                    ForEach(category.options) { option in
                        optionTile(option)
                    }
                }
                .padding(.leading, 16)
            }
        }
    }

    @ViewBuilder
    private func categoryTile(_ category: DSPLPFilterCategory) -> some View {
        Button(action: { onCategoryTap?(category) }) {
            HStack {
                Text(category.title)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(DSPLPFilterSheetColorHelper.categoryTitleColor())

                if category.selectedCount > 0 {
                    Text("(\(category.selectedCount))")
                        .font(.system(size: 14))
                        .foregroundStyle(DSPLPFilterSheetColorHelper.selectedCountColor())
                }

                Spacer()

                Image(systemName: category.isExpanded ? "chevron.up" : "chevron.down")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(DSPLPFilterSheetColorHelper.chevronColor())
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 14)
            .background(DSPLPFilterSheetColorHelper.categoryBackgroundColor())
            .cornerRadius(8)
        }
        .buttonStyle(.plain)
    }

    @ViewBuilder
    private func optionTile(_ option: DSPLPFilterOption) -> some View {
        Button(action: { onOptionTap?(option) }) {
            HStack(spacing: 12) {
                // Checkbox
                ZStack {
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(
                            option.isSelected
                                ? DSPLPFilterSheetColorHelper.checkboxSelectedColor()
                                : DSPLPFilterSheetColorHelper.checkboxBorderColor(),
                            lineWidth: option.isSelected ? 0 : 1
                        )
                        .background(
                            RoundedRectangle(cornerRadius: 4)
                                .fill(option.isSelected
                                    ? DSPLPFilterSheetColorHelper.checkboxSelectedColor()
                                    : Color.clear)
                        )
                        .frame(width: 20, height: 20)

                    if option.isSelected {
                        Image(systemName: "checkmark")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundStyle(DSPLPFilterSheetColorHelper.checkmarkColor())
                    }
                }

                // Color swatch (if applicable)
                if let swatchColor = option.swatchColor {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(swatchColor)
                        .frame(width: 24, height: 24)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.black.opacity(0.1), lineWidth: 1)
                        )
                }

                // Image (if applicable)
                if let image = option.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 24, height: 24)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                }

                // Label
                Text(option.label)
                    .font(.system(size: 14))
                    .foregroundStyle(DSPLPFilterSheetColorHelper.optionLabelColor())

                Spacer()

                // Count
                if let count = option.count {
                    Text("(\(count))")
                        .font(.system(size: 14))
                        .foregroundStyle(DSPLPFilterSheetColorHelper.optionCountColor())
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            .background(DSPLPFilterSheetColorHelper.optionBackgroundColor())
            .cornerRadius(8)
        }
        .buttonStyle(.plain)
    }

    // MARK: - Bottom Action Bar

    @ViewBuilder
    private var bottomActionBar: some View {
        VStack(spacing: 0) {
            Divider()

            DSButton(
                "View \(data.resultsCount) Results",
                style: .orangeFilled,
                size: .large
            ) {
                onViewResults?()
            }
            .padding(.horizontal, Layout.contentPadding)
            .padding(.vertical, 12)
        }
        .background(DSPLPFilterSheetColorHelper.bottomBarBackgroundColor())
    }
}
