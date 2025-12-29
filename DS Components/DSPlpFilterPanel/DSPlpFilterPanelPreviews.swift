import SwiftUI

// MARK: - Previews

#Preview("Full Filter Panel") {
    DSPLPFilterPanel(
        data: DSPLPFilterPanelData(
            categoryTitle: "REFRIGERATOR",
            categoryPills: [
                DSPLPCategoryPill(label: "French Door Refrigerators"),
                DSPLPCategoryPill(label: "Side by Side Refrigerators"),
                DSPLPCategoryPill(label: "Top Freezer Refrigerators"),
                DSPLPCategoryPill(label: "Bottom Freezer Refrigerators"),
                DSPLPCategoryPill(label: "Freezerless Refrigerators"),
                DSPLPCategoryPill(label: "Mini Fridges")
            ],
            resultsCount: 102,
            primaryFilters: [
                DSPLPFilterPill(label: "Brand", hasDropdown: true),
                DSPLPFilterPill(label: "Price", hasDropdown: true),
                DSPLPFilterPill(label: "Size", hasDropdown: true),
                DSPLPFilterPill(label: "Color", hasDropdown: true),
                DSPLPFilterPill(label: "Features", hasDropdown: true),
                DSPLPFilterPill(label: "Rating", hasDropdown: true),
                DSPLPFilterPill(label: "Availability", hasDropdown: true)
            ],
            secondaryFilters: [
                DSPLPFilterPill(label: "In Stock", isSelected: true),
                DSPLPFilterPill(label: "Free Delivery"),
                DSPLPFilterPill(label: "On Sale"),
                DSPLPFilterPill(label: "Top Rated"),
                DSPLPFilterPill(label: "Energy Star"),
                DSPLPFilterPill(label: "Smart Home")
            ]
        ),
        selectedCategoryId: nil,
        onCategoryPillTap: { pill in print("Category: \(pill.label)") },
        onPrimaryFilterTap: { filter in print("Primary: \(filter.label)") },
        onSecondaryFilterTap: { filter in print("Secondary: \(filter.label)") }
    )
    .padding()
}

#Preview("Power Tools") {
    DSPLPFilterPanel(
        data: DSPLPFilterPanelData(
            categoryTitle: "POWER TOOLS",
            categoryPills: [
                DSPLPCategoryPill(label: "Drills"),
                DSPLPCategoryPill(label: "Saws"),
                DSPLPCategoryPill(label: "Sanders"),
                DSPLPCategoryPill(label: "Grinders"),
                DSPLPCategoryPill(label: "Routers")
            ],
            resultsCount: 458,
            primaryFilters: [
                DSPLPFilterPill(label: "Brand", hasDropdown: true),
                DSPLPFilterPill(label: "Voltage", hasDropdown: true),
                DSPLPFilterPill(label: "Price", hasDropdown: true),
                DSPLPFilterPill(label: "Type", hasDropdown: true)
            ],
            secondaryFilters: [
                DSPLPFilterPill(label: "Cordless"),
                DSPLPFilterPill(label: "DEWALT", isSelected: true),
                DSPLPFilterPill(label: "Milwaukee"),
                DSPLPFilterPill(label: "Ryobi")
            ]
        ),
        onCategoryPillTap: { _ in },
        onPrimaryFilterTap: { _ in },
        onSecondaryFilterTap: { _ in }
    )
    .padding()
}

#Preview("Minimal - No Categories") {
    DSPLPFilterPanel(
        data: DSPLPFilterPanelData(
            categoryTitle: "PAINT",
            categoryPills: [],
            resultsCount: 234,
            primaryFilters: [
                DSPLPFilterPill(label: "Color Family", hasDropdown: true),
                DSPLPFilterPill(label: "Brand", hasDropdown: true),
                DSPLPFilterPill(label: "Finish", hasDropdown: true)
            ],
            secondaryFilters: []
        ),
        onPrimaryFilterTap: { _ in }
    )
    .padding()
}

#Preview("Selected Category") {
    let firstCategoryId = "category-1"

    return DSPLPFilterPanel(
        data: DSPLPFilterPanelData(
            categoryTitle: "FLOORING",
            categoryPills: [
                DSPLPCategoryPill(id: firstCategoryId, label: "Hardwood"),
                DSPLPCategoryPill(label: "Laminate"),
                DSPLPCategoryPill(label: "Vinyl"),
                DSPLPCategoryPill(label: "Tile"),
                DSPLPCategoryPill(label: "Carpet")
            ],
            resultsCount: 567,
            primaryFilters: [
                DSPLPFilterPill(label: "Species", hasDropdown: true),
                DSPLPFilterPill(label: "Width", hasDropdown: true),
                DSPLPFilterPill(label: "Color", hasDropdown: true)
            ],
            secondaryFilters: [
                DSPLPFilterPill(label: "Water Resistant", isSelected: true),
                DSPLPFilterPill(label: "Scratch Resistant")
            ]
        ),
        selectedCategoryId: firstCategoryId,
        onCategoryPillTap: { _ in },
        onPrimaryFilterTap: { _ in },
        onSecondaryFilterTap: { _ in }
    )
    .padding()
}

#Preview("Filters Only") {
    DSPLPFilterPanel(
        data: DSPLPFilterPanelData(
            categoryTitle: "SEARCH RESULTS",
            categoryPills: [],
            resultsCount: 1234,
            primaryFilters: [
                DSPLPFilterPill(label: "Department", hasDropdown: true),
                DSPLPFilterPill(label: "Brand", hasDropdown: true),
                DSPLPFilterPill(label: "Price", hasDropdown: true),
                DSPLPFilterPill(label: "Rating", hasDropdown: true)
            ],
            secondaryFilters: [
                DSPLPFilterPill(label: "In Stock"),
                DSPLPFilterPill(label: "Free Shipping"),
                DSPLPFilterPill(label: "On Sale"),
                DSPLPFilterPill(label: "New Arrivals")
            ]
        ),
        onPrimaryFilterTap: { _ in },
        onSecondaryFilterTap: { _ in }
    )
    .padding()
}

#Preview("With Active Filters") {
    DSPLPFilterPanel(
        data: DSPLPFilterPanelData(
            categoryTitle: "APPLIANCES",
            categoryPills: [
                DSPLPCategoryPill(label: "Refrigerators"),
                DSPLPCategoryPill(label: "Ranges"),
                DSPLPCategoryPill(label: "Dishwashers"),
                DSPLPCategoryPill(label: "Washers & Dryers")
            ],
            resultsCount: 45,
            primaryFilters: [
                DSPLPFilterPill(label: "LG", isSelected: true),
                DSPLPFilterPill(label: "$1000-$2000", isSelected: true),
                DSPLPFilterPill(label: "Brand", hasDropdown: true),
                DSPLPFilterPill(label: "Price", hasDropdown: true)
            ],
            secondaryFilters: [
                DSPLPFilterPill(label: "Energy Star", isSelected: true),
                DSPLPFilterPill(label: "In Stock", isSelected: true),
                DSPLPFilterPill(label: "Smart Home"),
                DSPLPFilterPill(label: "Counter Depth")
            ]
        ),
        onCategoryPillTap: { _ in },
        onPrimaryFilterTap: { _ in },
        onSecondaryFilterTap: { _ in }
    )
    .padding()
}
