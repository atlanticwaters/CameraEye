import SwiftUI

// MARK: - Previews

#Preview("Full Filter Panel") {
    DSPlpFilterPanel(
        title: "REFRIGERATOR",
        stylePills: [
            DSStylePillItem(text: "French Door\nRefrigerators"),
            DSStylePillItem(text: "Side by Side\nRefrigerators"),
            DSStylePillItem(text: "Top Freezer\nRefrigerators"),
            DSStylePillItem(text: "Bottom Freezer\nRefrigerators"),
            DSStylePillItem(text: "Freezerless\nRefrigerators"),
            DSStylePillItem(text: "Mini Fridges")
        ],
        resultsCount: "102 RESULTS",
        filterPills: [
            DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle")),
            DSFilterPillItem(text: "Brand"),
            DSFilterPillItem(text: "Price"),
            DSFilterPillItem(text: "Size"),
            DSFilterPillItem(text: "Color"),
            DSFilterPillItem(text: "Features"),
            DSFilterPillItem(text: "Rating"),
            DSFilterPillItem(text: "Availability")
        ],
        subFilterPills: [
            DSFilterPillItem(text: "In Stock"),
            DSFilterPillItem(text: "Free Delivery"),
            DSFilterPillItem(text: "On Sale"),
            DSFilterPillItem(text: "Top Rated"),
            DSFilterPillItem(text: "Energy Star"),
            DSFilterPillItem(text: "Smart Home")
        ],
        onStylePillTap: { item in print("Style: \(item.text)") },
        onFilterPillTap: { item in print("Filter: \(item.text)") },
        onSubFilterPillTap: { item in print("Sub-filter: \(item.text)") }
    )
    .padding()
}

#Preview("Power Tools") {
    DSPlpFilterPanel(
        title: "POWER TOOLS",
        stylePills: [
            DSStylePillItem(text: "Drills"),
            DSStylePillItem(text: "Saws"),
            DSStylePillItem(text: "Sanders"),
            DSStylePillItem(text: "Grinders"),
            DSStylePillItem(text: "Routers")
        ],
        resultsCount: "458 RESULTS",
        filterPills: [
            DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle")),
            DSFilterPillItem(text: "Brand"),
            DSFilterPillItem(text: "Voltage"),
            DSFilterPillItem(text: "Price"),
            DSFilterPillItem(text: "Type")
        ],
        subFilterPills: [
            DSFilterPillItem(text: "Cordless"),
            DSFilterPillItem(text: "DEWALT"),
            DSFilterPillItem(text: "Milwaukee"),
            DSFilterPillItem(text: "Ryobi")
        ],
        onStylePillTap: { _ in },
        onFilterPillTap: { _ in },
        onSubFilterPillTap: { _ in }
    )
    .padding()
}

#Preview("Minimal - No Categories") {
    DSPlpFilterPanel(
        title: "PAINT",
        stylePills: [],
        resultsCount: "234 RESULTS",
        filterPills: [
            DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle")),
            DSFilterPillItem(text: "Color Family"),
            DSFilterPillItem(text: "Brand"),
            DSFilterPillItem(text: "Finish")
        ],
        subFilterPills: [],
        onFilterPillTap: { _ in }
    )
    .padding()
}

#Preview("Selected Category") {
    let firstCategoryId = "category-1"

    return DSPlpFilterPanel(
        title: "FLOORING",
        stylePills: [
            DSStylePillItem(id: firstCategoryId, text: "Hardwood"),
            DSStylePillItem(text: "Laminate"),
            DSStylePillItem(text: "Vinyl"),
            DSStylePillItem(text: "Tile"),
            DSStylePillItem(text: "Carpet")
        ],
        resultsCount: "567 RESULTS",
        filterPills: [
            DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle")),
            DSFilterPillItem(text: "Species"),
            DSFilterPillItem(text: "Width"),
            DSFilterPillItem(text: "Color")
        ],
        subFilterPills: [
            DSFilterPillItem(text: "Water Resistant"),
            DSFilterPillItem(text: "Scratch Resistant")
        ],
        onStylePillTap: { _ in },
        onFilterPillTap: { _ in },
        onSubFilterPillTap: { _ in }
    )
    .padding()
}

#Preview("Filters Only") {
    DSPlpFilterPanel(
        title: "SEARCH RESULTS",
        stylePills: [],
        resultsCount: "1,234 RESULTS",
        filterPills: [
            DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle")),
            DSFilterPillItem(text: "Department"),
            DSFilterPillItem(text: "Brand"),
            DSFilterPillItem(text: "Price"),
            DSFilterPillItem(text: "Rating")
        ],
        subFilterPills: [
            DSFilterPillItem(text: "In Stock"),
            DSFilterPillItem(text: "Free Shipping"),
            DSFilterPillItem(text: "On Sale"),
            DSFilterPillItem(text: "New Arrivals")
        ],
        onFilterPillTap: { _ in },
        onSubFilterPillTap: { _ in }
    )
    .padding()
}

#Preview("With Active Filters") {
    DSPlpFilterPanel(
        title: "APPLIANCES",
        stylePills: [
            DSStylePillItem(text: "Refrigerators"),
            DSStylePillItem(text: "Ranges"),
            DSStylePillItem(text: "Dishwashers"),
            DSStylePillItem(text: "Washers &\nDryers")
        ],
        resultsCount: "45 RESULTS",
        filterPills: [
            DSFilterPillItem(text: "LG"),
            DSFilterPillItem(text: "$1000-$2000"),
            DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle")),
            DSFilterPillItem(text: "Brand"),
            DSFilterPillItem(text: "Price")
        ],
        subFilterPills: [
            DSFilterPillItem(text: "Energy Star"),
            DSFilterPillItem(text: "In Stock"),
            DSFilterPillItem(text: "Smart Home"),
            DSFilterPillItem(text: "Counter Depth")
        ],
        onStylePillTap: { _ in },
        onFilterPillTap: { _ in },
        onSubFilterPillTap: { _ in }
    )
    .padding()
}
