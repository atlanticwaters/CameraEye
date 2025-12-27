import SwiftUI

// MARK: - Previews

#Preview("Full Filter Sheet") {
    DSPLPFilterSheet(
        data: DSPLPFilterSheetData(
            title: "Sort & Filter",
            categories: [
                DSPLPFilterCategory(
                    title: "Get it Fast",
                    options: [
                        DSPLPFilterOption(label: "In Stock Today", count: 45, isSelected: true),
                        DSPLPFilterOption(label: "Free Delivery", count: 38),
                        DSPLPFilterOption(label: "Same Day Delivery", count: 12)
                    ],
                    selectedCount: 1,
                    isExpanded: true
                ),
                DSPLPFilterCategory(title: "Brand", selectedCount: 2),
                DSPLPFilterCategory(title: "Price"),
                DSPLPFilterCategory(title: "Color"),
                DSPLPFilterCategory(title: "Size"),
                DSPLPFilterCategory(title: "Rating"),
                DSPLPFilterCategory(title: "Features")
            ],
            resultsCount: 102,
            hasActiveFilters: true
        ),
        onClose: { print("Close") },
        onCategoryTap: { print("Category: \($0.title)") },
        onOptionTap: { print("Option: \($0.label)") },
        onViewResults: { print("View Results") },
        onClearAll: { print("Clear All") }
    )
}

#Preview("Expanded Brand Filter") {
    DSPLPFilterSheet(
        data: DSPLPFilterSheetData(
            title: "Sort & Filter",
            categories: [
                DSPLPFilterCategory(title: "Get it Fast"),
                DSPLPFilterCategory(
                    title: "Brand",
                    options: [
                        DSPLPFilterOption(label: "DEWALT", count: 28, isSelected: true),
                        DSPLPFilterOption(label: "Milwaukee", count: 24, isSelected: true),
                        DSPLPFilterOption(label: "Ryobi", count: 22),
                        DSPLPFilterOption(label: "Makita", count: 18),
                        DSPLPFilterOption(label: "Bosch", count: 15),
                        DSPLPFilterOption(label: "Craftsman", count: 12)
                    ],
                    selectedCount: 2,
                    isExpanded: true
                ),
                DSPLPFilterCategory(title: "Price"),
                DSPLPFilterCategory(title: "Rating")
            ],
            resultsCount: 52,
            hasActiveFilters: true
        ),
        onClose: { },
        onCategoryTap: { _ in },
        onOptionTap: { _ in },
        onViewResults: { },
        onClearAll: { }
    )
}

#Preview("Color Filter with Swatches") {
    DSPLPFilterSheet(
        data: DSPLPFilterSheetData(
            title: "Sort & Filter",
            categories: [
                DSPLPFilterCategory(title: "Brand"),
                DSPLPFilterCategory(
                    title: "Color",
                    options: [
                        DSPLPFilterOption(label: "Black", count: 35, swatchColor: .black),
                        DSPLPFilterOption(label: "Red", count: 28, isSelected: true, swatchColor: .red),
                        DSPLPFilterOption(label: "Yellow", count: 22, swatchColor: .yellow),
                        DSPLPFilterOption(label: "Blue", count: 18, swatchColor: .blue),
                        DSPLPFilterOption(label: "Green", count: 12, swatchColor: .green)
                    ],
                    selectedCount: 1,
                    isExpanded: true
                ),
                DSPLPFilterCategory(title: "Size")
            ],
            resultsCount: 28,
            hasActiveFilters: true
        ),
        onClose: { },
        onCategoryTap: { _ in },
        onOptionTap: { _ in },
        onViewResults: { },
        onClearAll: { }
    )
}

#Preview("No Active Filters") {
    DSPLPFilterSheet(
        data: DSPLPFilterSheetData(
            title: "Filter",
            categories: [
                DSPLPFilterCategory(title: "Department"),
                DSPLPFilterCategory(title: "Brand"),
                DSPLPFilterCategory(title: "Price"),
                DSPLPFilterCategory(title: "Rating"),
                DSPLPFilterCategory(title: "Availability")
            ],
            resultsCount: 1234,
            hasActiveFilters: false
        ),
        onClose: { },
        onCategoryTap: { _ in },
        onOptionTap: { _ in },
        onViewResults: { }
    )
}

#Preview("Price Range Filter") {
    DSPLPFilterSheet(
        data: DSPLPFilterSheetData(
            title: "Sort & Filter",
            categories: [
                DSPLPFilterCategory(title: "Brand"),
                DSPLPFilterCategory(
                    title: "Price",
                    options: [
                        DSPLPFilterOption(label: "Under $25", count: 45),
                        DSPLPFilterOption(label: "$25 - $50", count: 62),
                        DSPLPFilterOption(label: "$50 - $100", count: 84, isSelected: true),
                        DSPLPFilterOption(label: "$100 - $200", count: 56),
                        DSPLPFilterOption(label: "$200 - $500", count: 38),
                        DSPLPFilterOption(label: "Over $500", count: 22)
                    ],
                    selectedCount: 1,
                    isExpanded: true
                ),
                DSPLPFilterCategory(title: "Rating")
            ],
            resultsCount: 84,
            hasActiveFilters: true
        ),
        onClose: { },
        onCategoryTap: { _ in },
        onOptionTap: { _ in },
        onViewResults: { },
        onClearAll: { }
    )
}

#Preview("Multiple Expanded Sections") {
    DSPLPFilterSheet(
        data: DSPLPFilterSheetData(
            title: "Sort & Filter",
            categories: [
                DSPLPFilterCategory(
                    title: "Get it Fast",
                    options: [
                        DSPLPFilterOption(label: "In Stock Today", count: 45, isSelected: true),
                        DSPLPFilterOption(label: "Free Delivery", count: 38)
                    ],
                    selectedCount: 1,
                    isExpanded: true
                ),
                DSPLPFilterCategory(
                    title: "Rating",
                    options: [
                        DSPLPFilterOption(label: "4 Stars & Up", count: 89, isSelected: true),
                        DSPLPFilterOption(label: "3 Stars & Up", count: 112),
                        DSPLPFilterOption(label: "2 Stars & Up", count: 125)
                    ],
                    selectedCount: 1,
                    isExpanded: true
                ),
                DSPLPFilterCategory(title: "Brand"),
                DSPLPFilterCategory(title: "Price")
            ],
            resultsCount: 89,
            hasActiveFilters: true
        ),
        onClose: { },
        onCategoryTap: { _ in },
        onOptionTap: { _ in },
        onViewResults: { },
        onClearAll: { }
    )
}
