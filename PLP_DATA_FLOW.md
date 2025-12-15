# PLP Filter Panel Data Flow

## Architecture Diagram

```
┌─────────────────────────────────────────────────────────────────┐
│                          PLPView                                 │
│  (category: PLPCategory)                                         │
└────────────────────────┬────────────────────────────────────────┘
                         │
                         │ Displays
                         ▼
┌─────────────────────────────────────────────────────────────────┐
│                    DSPlpFilterPanel                              │
│  ┌──────────────────────────────────────────────────────────┐  │
│  │  Category Title: "REFRIGERATORS"                          │  │
│  └──────────────────────────────────────────────────────────┘  │
│  ┌──────────────────────────────────────────────────────────┐  │
│  │  Style Pills: [French Door, Side by Side, Top Freezer...]│  │
│  └──────────────────────────────────────────────────────────┘  │
│  ┌──────────────────────────────────────────────────────────┐  │
│  │  Results Count: "5,007 RESULTS"                          │  │
│  └──────────────────────────────────────────────────────────┘  │
│  ┌──────────────────────────────────────────────────────────┐  │
│  │  Filter Pills: [All Filters, Brand, Width, Capacity...]  │  │
│  └──────────────────────────────────────────────────────────┘  │
│  ┌──────────────────────────────────────────────────────────┐  │
│  │  Sub-Filter Pills: [In Stock, Free Delivery, Special...] │  │
│  └──────────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────┘
                         │
                         │ Data from
                         ▼
┌─────────────────────────────────────────────────────────────────┐
│                      PLPCategory                                 │
│  ┌──────────────────────────────────────────────────────────┐  │
│  │  title: "REFRIGERATORS"                                   │  │
│  │  breadcrumbFilter: "Refrigerator"                         │  │
│  │  stylePills: [DSStylePillItem]                            │  │
│  │  filterPills: [DSFilterPillItem]                          │  │
│  │  subFilterPills: [DSFilterPillItem]                       │  │
│  └──────────────────────────────────────────────────────────┘  │
│                                                                  │
│  Static Configurations Available:                               │
│  • .refrigerators     • .washingMachines                        │
│  • .dishwashers       • .dryers                                 │
│  • .ranges            • (more can be added)                     │
└─────────────────────────────────────────────────────────────────┘
                         │
                         │ Products loaded from
                         ▼
┌─────────────────────────────────────────────────────────────────┐
│                    PLPDataLoader.shared                          │
│  ┌──────────────────────────────────────────────────────────┐  │
│  │  loadPIPDatasets() → [PIPDataset]                        │  │
│  │  ├─ Loads from pip-datasets.json                         │  │
│  │  ├─ Decodes JSON to PIPDataset objects                   │  │
│  │  └─ Returns 19,347 lines of real product data            │  │
│  └──────────────────────────────────────────────────────────┘  │
└────────────────────────┬────────────────────────────────────────┘
                         │
                         │ Filters by
                         ▼
┌─────────────────────────────────────────────────────────────────┐
│                    Breadcrumb Filtering                          │
│  ┌──────────────────────────────────────────────────────────┐  │
│  │  pipDatasets.filter { dataset in                         │  │
│  │      dataset.breadcrumbs.contains { breadcrumb in        │  │
│  │          breadcrumb.label                                │  │
│  │              .lowercased()                               │  │
│  │              .contains(category.breadcrumbFilter)        │  │
│  │      }                                                    │  │
│  │  }                                                        │  │
│  └──────────────────────────────────────────────────────────┘  │
└────────────────────────┬────────────────────────────────────────┘
                         │
                         │ Converts to
                         ▼
┌─────────────────────────────────────────────────────────────────┐
│                    Product Models                                │
│  ┌──────────────────────────────────────────────────────────┐  │
│  │  PIPDataset.toProduct() → Product                        │  │
│  │  ├─ Maps pricing, ratings, availability                  │  │
│  │  ├─ Extracts images and variants                         │  │
│  │  ├─ Creates FulfillmentInfo                              │  │
│  │  └─ Returns Product for ProductCard display              │  │
│  └──────────────────────────────────────────────────────────┘  │
└────────────────────────┬────────────────────────────────────────┘
                         │
                         │ Displayed in
                         ▼
┌─────────────────────────────────────────────────────────────────┐
│                  Product Inventory Display                       │
│  ┌──────────────────────────────────────────────────────────┐  │
│  │  List View: ProductCard (full detail)                    │  │
│  │  ├─ Brand, name, model number                            │  │
│  │  ├─ Hero image with badges                               │  │
│  │  ├─ Pricing with savings                                 │  │
│  │  ├─ Rating and reviews                                   │  │
│  │  ├─ Pickup and delivery info                             │  │
│  │  └─ Add to cart / Add to list actions                    │  │
│  └──────────────────────────────────────────────────────────┘  │
│  ┌──────────────────────────────────────────────────────────┐  │
│  │  Grid View: CompactProductCard (2-column)                │  │
│  │  ├─ Smaller, compact layout                              │  │
│  │  ├─ Essential info only                                  │  │
│  │  └─ Quick add to cart                                    │  │
│  └──────────────────────────────────────────────────────────┘  │
└─────────────────────────────────────────────────────────────────┘
```

## Data Sources

### 1. pip-datasets.json (Product Data)
```json
{
  "pipDatasets": [
    {
      "productId": "RF29BB8600QL",
      "brand": { "name": "Samsung" },
      "title": "29 cu. ft. Bespoke 4-Door Flex...",
      "breadcrumbs": [
        { "label": "Appliances" },
        { "label": "Refrigerators" },
        { "label": "French Door Refrigerators" }
      ],
      "pricing": { "currentPrice": 3499.00 },
      "rating": { "average": 4.7, "count": 892 },
      "specifications": { ... },
      "variants": [ ... ],
      "availability": { ... }
    }
  ]
}
```

### 2. PLPCategory (Filter Configuration)
```swift
static let refrigerators = PLPCategory(
    title: "REFRIGERATORS",
    breadcrumbFilter: "Refrigerator",
    stylePills: [
        DSStylePillItem(
            text: "French Door\nRefrigerators",
            image: Image("refrigerator_french_door")
        ),
        // ... more style pills
    ],
    filterPills: [
        DSFilterPillItem(text: "All Filters", icon: ...),
        DSFilterPillItem(text: "Brand"),
        DSFilterPillItem(text: "Refrigerator Width"),
        // ... more filters
    ],
    subFilterPills: [
        DSFilterPillItem(text: "In Stock At Store Today"),
        DSFilterPillItem(text: "Free 1-2 Day Delivery"),
        // ... more sub-filters
    ]
)
```

## Filter Attribute Mapping

### From PIPDataset Schema → Filter Pills

| Filter Pill               | PIPDataset Field                    | Data Type         |
|---------------------------|-------------------------------------|-------------------|
| Brand                     | `brand.name`                        | String            |
| Refrigerator Width        | `specifications.dimensions.width`   | String (e.g. "36 in.") |
| Capacity (cu. ft.)        | Derived from specifications         | String            |
| Color/Finish              | `variants[].variantValue`           | Array<String>     |
| Ice & Water Dispenser     | `keyFeatures[]`                     | Array<String>     |
| Smart Enabled             | `keyFeatures[]` contains "Smart"    | Boolean           |
| Energy Star               | `certifications[].name`             | Array<String>     |

### Sub-Filter Implementation

| Sub-Filter Pill           | Product Field                       | Logic             |
|---------------------------|-------------------------------------|-------------------|
| In Stock At Store Today   | `availability.inStorePickup.available` | Boolean        |
| Free 1-2 Day Delivery     | `availability.delivery.freeDelivery` | Boolean          |
| Get It Fast               | `deliveryInfo.estimatedDate`        | Date comparison   |
| Special Buy               | `badges[].type == "specialBuy"`     | Boolean           |
| Exclusive                 | `isExclusive` or `badges[]`         | Boolean           |
| Best Seller               | `badges[].type == "topSeller"`      | Boolean           |

## User Interaction Flow

```
User Opens PLPView(category: .refrigerators)
            ↓
┌───────────────────────────────────────┐
│  View Appears                          │
│  → loadProducts() called               │
│  → Loads pip-datasets.json             │
│  → Filters by "Refrigerator" breadcrumb│
│  → Converts to Product models          │
│  → Updates UI with results             │
└───────────────────────────────────────┘
            ↓
┌───────────────────────────────────────┐
│  User Sees:                            │
│  • Title: "REFRIGERATORS"              │
│  • 6 style pills with images           │
│  • "5,007 RESULTS"                     │
│  • 8 filter pills                      │
│  • 6 sub-filter pills                  │
│  • Product list/grid                   │
└───────────────────────────────────────┘
            ↓
┌───────────────────────────────────────┐
│  User Interactions:                    │
│  ├─ Tap Style Pill                     │
│  │  → handleStylePillTap()             │
│  │  → Filter by style (future)         │
│  ├─ Tap Filter Pill                    │
│  │  → handleFilterPillTap()            │
│  │  → Show filter sheet (future)       │
│  ├─ Tap Sub-Filter                     │
│  │  → handleSubFilterTap()             │
│  │  → Toggle filter (future)           │
│  ├─ Change Sort                        │
│  │  → sortOption updates               │
│  │  → Products re-sort                 │
│  └─ Toggle View Mode                   │
│     → viewMode updates                 │
│     → Switches list ↔ grid             │
└───────────────────────────────────────┘
```

## State Management

```swift
// PLPView State Variables
@State private var products: [Product] = []           // Displayed products
@State private var pipDatasets: [PIPDataset] = []     // Raw data from JSON
@State private var selectedStylePill: String? = nil   // Active style filter
@State private var selectedFilterPills: Set<String>   // Active filters
@State private var selectedSubFilters: Set<String>    // Active sub-filters
@State private var sortOption: SortOption             // Current sort
@State private var viewMode: PLPViewMode              // List or Grid

// Configuration (Immutable)
let category: PLPCategory                             // Category config
```

## Computed Properties

```swift
// Dynamic values based on state
private var categoryTitle: String                     // From category
private var stylePills: [DSStylePillItem]             // From category
private var filterPills: [DSFilterPillItem]           // From category
private var subFilterPills: [DSFilterPillItem]        // From category
private var resultsCountText: String                  // "X,XXX RESULTS"
private var sortedAndFilteredProducts: [Product]      // Final product list
```

## Performance Characteristics

### Data Loading
- **One-time load:** Products loaded once on view appear
- **In-memory filtering:** Fast, no additional I/O
- **Lazy rendering:** LazyVStack/LazyVGrid for efficient scrolling

### Memory Usage
- **Product count:** ~100-1000 products per category
- **Model size:** ~1-2KB per Product model
- **Total memory:** ~100KB - 2MB per category
- **Optimized:** Lazy loading prevents all products rendering at once

### Responsiveness
- **Initial load:** < 1 second (JSON decode + filter)
- **Sorting:** Instant (in-memory sort)
- **View switch:** Instant (SwiftUI state change)
- **Scroll:** Smooth (lazy loading)

## Extension Points

### Adding New Categories
```swift
extension PLPCategory {
    static let microwaves = PLPCategory(
        title: "MICROWAVES",
        breadcrumbFilter: "Microwave",
        stylePills: [...],
        filterPills: [...],
        subFilterPills: [...]
    )
}
```

### Adding New Filters
```swift
filterPills: [
    // ... existing filters
    DSFilterPillItem(text: "Decibel Level"),
    DSFilterPillItem(text: "Installation Type"),
]
```

### Customizing Filter Logic
```swift
private var sortedAndFilteredProducts: [Product] {
    var filtered = products
    
    // Add custom filter logic here
    if selectedFilters.contains("Smart Enabled") {
        filtered = filtered.filter { product in
            // Check if product has smart features
        }
    }
    
    return filtered
}
```

## Testing Strategy

### Unit Tests
- `testCategoryConfigurations()` - Verify all categories have required data
- `testBreadcrumbFiltering()` - Verify products filter correctly
- `testProductConversion()` - Verify PIPDataset → Product mapping
- `testSorting()` - Verify each sort option works correctly

### Integration Tests
- `testDataLoading()` - Verify JSON loads successfully
- `testCategoryFiltering()` - Verify each category returns products
- `testFilterCombinations()` - Verify multiple filters work together

### UI Tests
- `testFilterPanelDisplay()` - Verify all elements render
- `testStylePillTapping()` - Verify tap handlers fire
- `testViewModeSwitch()` - Verify list ↔ grid works
- `testSortMenu()` - Verify sort options update display

---

*This data flow documentation provides a complete picture of how the PLPView filter panel works from data source to display.*
