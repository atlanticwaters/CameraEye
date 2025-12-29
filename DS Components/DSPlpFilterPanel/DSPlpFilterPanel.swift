import SwiftUI

// MARK: - DSPLPCategoryPill

/// Category pill data with image for style pill container.
public struct DSPLPCategoryPill: Identifiable, Equatable, Sendable {
    public let id: String
    public let label: String
    public let image: Image?

    public init(id: String = UUID().uuidString, label: String, image: Image? = nil) {
        self.id = id
        self.label = label
        self.image = image
    }
}

// MARK: - DSPLPFilterPill

/// Filter pill data for filter rows.
public struct DSPLPFilterPill: Identifiable, Equatable, Sendable {
    public let id: String
    public let label: String
    public let isSelected: Bool
    public let hasDropdown: Bool

    public init(
        id: String = UUID().uuidString,
        label: String,
        isSelected: Bool = false,
        hasDropdown: Bool = false
    ) {
        self.id = id
        self.label = label
        self.isSelected = isSelected
        self.hasDropdown = hasDropdown
    }
}

// MARK: - DSPLPFilterPanelData

/// Data model for the PLP Filter Panel.
public struct DSPLPFilterPanelData: Equatable, Sendable {
    public let categoryTitle: String
    public let categoryPills: [DSPLPCategoryPill]
    public let resultsCount: Int
    public let primaryFilters: [DSPLPFilterPill]
    public let secondaryFilters: [DSPLPFilterPill]

    public init(
        categoryTitle: String,
        categoryPills: [DSPLPCategoryPill] = [],
        resultsCount: Int = 0,
        primaryFilters: [DSPLPFilterPill] = [],
        secondaryFilters: [DSPLPFilterPill] = []
    ) {
        self.categoryTitle = categoryTitle
        self.categoryPills = categoryPills
        self.resultsCount = resultsCount
        self.primaryFilters = primaryFilters
        self.secondaryFilters = secondaryFilters
    }
}

// MARK: - DSPLPFilterPanel

/// A component for displaying PLP (Product Listing Page) filter panel.
///
/// DSPLPFilterPanel displays a category title, category style pills with images,
/// result count, and filter pill rows. This component is used at the top of
/// product listing pages to help users navigate and filter products.
///
/// Example usage:
/// ```swift
/// DSPLPFilterPanel(
///     data: DSPLPFilterPanelData(
///         categoryTitle: "REFRIGERATOR",
///         categoryPills: [
///             DSPLPCategoryPill(label: "French Door Refrigerators"),
///             DSPLPCategoryPill(label: "Side by Side Refrigerators")
///         ],
///         resultsCount: 102,
///         primaryFilters: [
///             DSPLPFilterPill(label: "Brand", hasDropdown: true),
///             DSPLPFilterPill(label: "Price", hasDropdown: true)
///         ],
///         secondaryFilters: [
///             DSPLPFilterPill(label: "In Stock", isSelected: true),
///             DSPLPFilterPill(label: "Free Delivery")
///         ]
///     ),
///     onCategoryPillTap: { pill in print("Category: \(pill.label)") },
///     onFilterPillTap: { pill in print("Filter: \(pill.label)") }
/// )
/// ```
public struct DSPLPFilterPanel: View {
    // MARK: - Properties

    private let data: DSPLPFilterPanelData
    private let selectedCategoryId: String?
    private let onCategoryPillTap: ((DSPLPCategoryPill) -> Void)?
    private let onPrimaryFilterTap: ((DSPLPFilterPill) -> Void)?
    private let onSecondaryFilterTap: ((DSPLPFilterPill) -> Void)?

    // MARK: - Layout Constants

    private enum Layout {
        static let sectionSpacing: CGFloat = 24
        static let categoryPillSpacing: CGFloat = 12
        static let filterTopSpacing: CGFloat = 8
        static let filterSubSpacing: CGFloat = 8
        static let filterRowSpacing: CGFloat = 4
    }

    // MARK: - Initializer

    public init(
        data: DSPLPFilterPanelData,
        selectedCategoryId: String? = nil,
        onCategoryPillTap: ((DSPLPCategoryPill) -> Void)? = nil,
        onPrimaryFilterTap: ((DSPLPFilterPill) -> Void)? = nil,
        onSecondaryFilterTap: ((DSPLPFilterPill) -> Void)? = nil
    ) {
        self.data = data
        self.selectedCategoryId = selectedCategoryId
        self.onCategoryPillTap = onCategoryPillTap
        self.onPrimaryFilterTap = onPrimaryFilterTap
        self.onSecondaryFilterTap = onSecondaryFilterTap
    }

    // MARK: - Body

    public var body: some View {
        VStack(alignment: .leading, spacing: Layout.sectionSpacing) {
            // Category Title
            categoryTitleSection

            // Style Pill Container (Category Pills)
            if !data.categoryPills.isEmpty {
                categoryPillsSection
            }

            // Product Results
            resultsSection

            // Filter Items
            if !data.primaryFilters.isEmpty || !data.secondaryFilters.isEmpty {
                filterItemsSection
            }
        }
    }

    // MARK: - Category Title Section

    @ViewBuilder
    private var categoryTitleSection: some View {
        Text(data.categoryTitle.uppercased())
            .font(.system(size: 32, weight: .heavy))
            .foregroundColor(DSPLPFilterPanelColorHelper.categoryTitleColor())
            .tracking(0.32)
    }

    // MARK: - Category Pills Section

    @ViewBuilder
    private var categoryPillsSection: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: Layout.categoryPillSpacing) {
                ForEach(data.categoryPills) { pill in
                    categoryPillView(pill)
                }
            }
        }
    }

    @ViewBuilder
    private func categoryPillView(_ pill: DSPLPCategoryPill) -> some View {
        let isSelected = pill.id == selectedCategoryId

        if let image = pill.image {
            DSPill(
                pill.label,
                leadingImage: image,
                style: .filled,
                size: .xl,
                isSelected: isSelected
            ) {
                onCategoryPillTap?(pill)
            }
        } else {
            DSPill(
                pill.label,
                style: .filled,
                size: .xl,
                isSelected: isSelected
            ) {
                onCategoryPillTap?(pill)
            }
        }
    }

    // MARK: - Results Section

    @ViewBuilder
    private var resultsSection: some View {
        Text("\(data.resultsCount) Results")
            .font(.system(size: 14, weight: .medium))
            .foregroundColor(DSPLPFilterPanelColorHelper.resultsTextColor())
    }

    // MARK: - Filter Items Section

    @ViewBuilder
    private var filterItemsSection: some View {
        VStack(alignment: .leading, spacing: Layout.filterRowSpacing) {
            // Primary Filters (Lg size)
            if !data.primaryFilters.isEmpty {
                primaryFiltersRow
            }

            // Secondary Filters (Md size)
            if !data.secondaryFilters.isEmpty {
                secondaryFiltersRow
            }
        }
    }

    @ViewBuilder
    private var primaryFiltersRow: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: Layout.filterTopSpacing) {
                ForEach(data.primaryFilters) { filter in
                    filterPillView(filter, size: .lg) {
                        onPrimaryFilterTap?(filter)
                    }
                }
            }
        }
    }

    @ViewBuilder
    private var secondaryFiltersRow: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: Layout.filterSubSpacing) {
                ForEach(data.secondaryFilters) { filter in
                    filterPillView(filter, size: .md) {
                        onSecondaryFilterTap?(filter)
                    }
                }
            }
        }
    }

    @ViewBuilder
    private func filterPillView(
        _ filter: DSPLPFilterPill,
        size: DSPillSize,
        action: @escaping () -> Void
    ) -> some View {
        if filter.hasDropdown {
            DSPill(
                filter.label,
                trailingIcon: Image(systemName: "chevron.down"),
                style: .filled,
                size: size,
                isSelected: filter.isSelected,
                action: action
            )
        } else {
            DSPill(
                filter.label,
                style: .filled,
                size: size,
                isSelected: filter.isSelected,
                action: action
            )
        }
    }
}
