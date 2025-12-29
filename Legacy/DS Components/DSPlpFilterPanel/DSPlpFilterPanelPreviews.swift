import SwiftUI

struct DSPlpFilterPanel_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            // Basic example
            basicExample
                .previewDisplayName("Basic Example")
                .preferredColorScheme(.light)
            
            // Complete example with all sections
            completeExample
                .previewDisplayName("Complete Example")
                .preferredColorScheme(.light)
            
            // Dark mode
            completeExample
                .previewDisplayName("Dark Mode")
                .preferredColorScheme(.dark)
            
            // Minimal example
            minimalExample
                .previewDisplayName("Minimal")
                .preferredColorScheme(.light)
            
            // Style pills only
            stylePillsOnly
                .previewDisplayName("Style Pills Only")
                .preferredColorScheme(.light)
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
    
    // MARK: - Basic Example
    
    static var basicExample: some View {
        DSPlpFilterPanel(
            title: "REFRIGERATOR",
            stylePills: sampleStylePills.prefix(3).map { $0 },
            resultsCount: "5,007 RESULTS",
            filterPills: [
                DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle")),
                DSFilterPillItem(text: "Category"),
                DSFilterPillItem(text: "Width")
            ],
            subFilterPills: [
                DSFilterPillItem(text: "In Stock At Store Today"),
                DSFilterPillItem(text: "Free 1-2 Day Delivery")
            ],
            onStylePillTap: { item in
                print("Style pill tapped: \(item.text)")
            },
            onFilterPillTap: { item in
                print("Filter pill tapped: \(item.text)")
            },
            onSubFilterPillTap: { item in
                print("Sub-filter pill tapped: \(item.text)")
            }
        )
    }
    
    // MARK: - Complete Example
    
    static var completeExample: some View {
        ScrollView {
            DSPlpFilterPanel(
                title: "REFRIGERATOR",
                stylePills: sampleStylePills,
                resultsCount: "5,007 RESULTS",
                filterPills: sampleFilterPills,
                subFilterPills: sampleSubFilterPills,
                onStylePillTap: { item in
                    print("Style pill tapped: \(item.text)")
                },
                onFilterPillTap: { item in
                    print("Filter pill tapped: \(item.text)")
                },
                onSubFilterPillTap: { item in
                    print("Sub-filter pill tapped: \(item.text)")
                }
            )
        }
    }
    
    // MARK: - Minimal Example
    
    static var minimalExample: some View {
        DSPlpFilterPanel(
            title: "DISHWASHERS",
            resultsCount: "1,234 RESULTS"
        )
    }
    
    // MARK: - Style Pills Only
    
    static var stylePillsOnly: some View {
        DSPlpFilterPanel(
            title: "WASHING MACHINES",
            stylePills: [
                DSStylePillItem(
                    text: "Front Load\nWashers",
                    image: Image(systemName: "washer.fill")
                ),
                DSStylePillItem(
                    text: "Top Load\nWashers",
                    image: Image(systemName: "washer.fill")
                ),
                DSStylePillItem(
                    text: "Combo\nWasher-Dryers",
                    image: Image(systemName: "washer.fill")
                )
            ],
            resultsCount: "2,456 RESULTS"
        )
    }
    
    // MARK: - Sample Data
    
    static var sampleStylePills: [DSStylePillItem] {
        [
            DSStylePillItem(
                text: "French Door\nRefrigerators",
                image: Image(systemName: "refrigerator.fill")
            ),
            DSStylePillItem(
                text: "Side by Side\nRefrigerators",
                image: Image(systemName: "refrigerator.fill")
            ),
            DSStylePillItem(
                text: "Top Freezer\nRefrigerators",
                image: Image(systemName: "refrigerator.fill")
            ),
            DSStylePillItem(
                text: "Bottom Freezer\nRefrigerators",
                image: Image(systemName: "refrigerator.fill")
            ),
            DSStylePillItem(
                text: "Freezerless\nRefrigerators",
                image: Image(systemName: "refrigerator.fill")
            ),
            DSStylePillItem(
                text: "Mini Fridges",
                image: Image(systemName: "refrigerator.fill")
            )
        ]
    }
    
    static var sampleFilterPills: [DSFilterPillItem] {
        [
            DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle")),
            DSFilterPillItem(text: "Category"),
            DSFilterPillItem(text: "Refrigerator Width"),
            DSFilterPillItem(text: "Decorative Shelving Type"),
            DSFilterPillItem(text: "Filter Attribute 4"),
            DSFilterPillItem(text: "Filter Attribute 5"),
            DSFilterPillItem(text: "Filter Attribute 6")
        ]
    }
    
    static var sampleSubFilterPills: [DSFilterPillItem] {
        [
            DSFilterPillItem(text: "In Stock At Store Today"),
            DSFilterPillItem(text: "Free 1-2 Day Delivery"),
            DSFilterPillItem(text: "Same Day Delivery"),
            DSFilterPillItem(text: "Sub Filter Attribute 4"),
            DSFilterPillItem(text: "Sub Filter Attribute 5"),
            DSFilterPillItem(text: "Sub Filter Attribute 6")
        ]
    }
}
