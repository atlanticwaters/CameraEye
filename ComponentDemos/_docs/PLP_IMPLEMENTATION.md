# Product Listing Page (PLP) Implementation

## Overview
This document describes the complete Product Listing Page (PLP) implementation that uses real data from `pip-datasets.json` and follows The Home Depot design system schema.

## File Structure

### 1. **PLPDataModels.swift** (NEW)
Complete data models matching the `pip-datasets.json` schema:

- `PIPDatasetsContainer` - Root JSON container
- `PIPDataset` - Complete product information with nested structures:
  - Identifiers (model number, SKU, UPC, etc.)
  - Brand information
  - Pricing (including sales, savings, financing)
  - Rating and reviews with distribution
  - Media (images, videos, 360° views, AR support)
  - Variants (color/finish options with swatches)
  - Specifications and dimensions
  - Badges and certifications
  - Warranty and protection plans
  - Availability (pickup, delivery, ship-to-home)
  - Services (installation, haul away)
  - Related products and accessories

**Key Features:**
- Full Codable conformance for JSON decoding
- `toProduct()` conversion method to map PIPDataset → Product model
- `PLPDataLoader` singleton for loading data from JSON

### 2. **PLPView.swift** (UPDATED)
Main PLP view implementation using the real data:

**Structure:**
```
ScrollView
├── DSPlpFilterPanel
│   ├── Category Title ("REFRIGERATORS")
│   ├── Style Pills (French Door, Side-by-Side, etc.)
│   ├── Results Count ("1,234 RESULTS")
│   ├── Filter Pills (All Filters, Brand, Width, etc.)
│   └── Sub-Filter Pills (In Stock, Free Delivery, etc.)
│
├── Sort & View Mode Bar
│   ├── Sort Menu (Top Rated, Price, etc.)
│   └── View Toggle (List/Grid)
│
└── Product Inventory
    ├── List Mode (uses ProductCard)
    └── Grid Mode (uses CompactProductCard)
```

**Data Flow:**
1. `onAppear` → calls `loadProducts()`
2. `PLPDataLoader.shared.loadProducts()` loads from `pip-datasets.json`
3. Converts `PIPDataset` objects to `Product` models
4. Displays products using existing `ProductCard` component

### 3. **ProductCard.swift** (EXISTING)
Used for list view display - already implemented with full B2B features.

### 4. **DSPlpFilterPanel.swift** (EXISTING)
The filter panel component at the top of the PLP.

### 5. **pip-datasets.json** (DATA SOURCE)
Contains 19,347 lines of real product data with complete information.

## Data Mapping

### From PIPDataset to Product:

| PIPDataset Field | Product Field | Notes |
|-----------------|---------------|-------|
| `productId` | `id` | Direct mapping |
| `brand.name` | `brand` | Extract brand name |
| `title` | `name` | Product title |
| `identifiers.modelNumber` | `modelNumber` | Model number |
| `media.primaryImage` | `heroImage` | Main product image |
| `media.images[]` | `thumbnailImages` | Additional images |
| `pricing.currentPrice` | `currentPrice` | Current price |
| `pricing.originalPrice` | `originalPrice` | Original price if on sale |
| `pricing.savingsPercent` | `savingsPercentage` | Savings percentage |
| `rating.average` | `rating` | Average rating |
| `rating.count` | `reviewCount` | Number of reviews |
| `badges[]` | `isExclusive`, `promotionalBadge` | Extract badge info |
| `availability.inStorePickup` | `pickupInfo` | Pickup availability |
| `availability.delivery` | `deliveryInfo` | Delivery options |
| `variants[]` | `availableColors` | Color/finish variants |
| `identifiers.internetNumber` | `internetNumber` | Internet number |
| `identifiers.storeSkuNumber` | `storeSKU` | Store SKU |

## Features Implemented

### ✅ Filter Panel
- Category title display
- Horizontal scrolling style pills with images
- Results count with number formatting
- Filter pills (All Filters, Brand, Width, etc.)
- Sub-filter pills (In Stock, Free Delivery, etc.)
- Tap handlers for all interactive elements

### ✅ Sort & View Controls
- Sort dropdown menu with options:
  - Top Rated
  - Price: Low to High
  - Price: High to Low
  - Best Selling
  - Newest
- View mode toggle (List/Grid)
- Active state indicators

### ✅ Product Display
- **List Mode**: Full ProductCard with all details
- **Grid Mode**: CompactProductCard (2-column layout)
- Lazy loading for performance
- Real-time sorting and filtering

### ✅ Data Loading
- Loads from `pip-datasets.json` via Bundle
- Automatic conversion to Product models
- Error handling and logging
- Support for filtering by category (extensible)

## Usage

### Basic Usage:
```swift
PLPView(
    categoryTitle: "REFRIGERATORS",
    stylePills: PLPSampleData.refrigeratorStylePills,
    filterPills: PLPSampleData.filterPills,
    subFilterPills: PLPSampleData.subFilterPills
)
```

### Custom Category:
```swift
PLPView(
    categoryTitle: "WASHING MACHINES",
    stylePills: [
        DSStylePillItem(text: "Front Load\nWashers", image: Image(systemName: "washer.fill")),
        DSStylePillItem(text: "Top Load\nWashers", image: Image(systemName: "washer.fill"))
    ],
    filterPills: PLPSampleData.filterPills,
    subFilterPills: PLPSampleData.subFilterPills
)
```

## State Management

The PLPView manages several state variables:

```swift
@State private var products: [Product] = []
@State private var selectedStylePill: String? = nil
@State private var selectedFilterPills: Set<String> = []
@State private var selectedSubFilters: Set<String> = []
@State private var sortOption: SortOption = .topRated
@State private var viewMode: PLPViewMode = .list
```

## Integration Points

### 1. Navigation
- Ready for integration with top navigation bar (60pt spacing)
- Ready for bottom tab bar (80pt spacing)

### 2. Actions
- `onAddToCart` - Add product to cart
- `onAddToList` - Add product to list/favorites
- `onStylePillTap` - Filter by product style
- `onFilterPillTap` - Open filter sheet/modal
- `onSubFilterTap` - Toggle quick filters

### 3. Extensibility
- Easy to add more sort options
- Can filter products by category/breadcrumb
- Support for search integration
- Ready for pagination/infinite scroll

## Design System Compliance

All components use tokens from `DesignSystemGlobal`:
- ✅ Spacing tokens
- ✅ Typography tokens
- ✅ Color tokens
- ✅ Border radius tokens
- ✅ Elevation/shadow tokens

## Performance Considerations

- Uses `LazyVStack` and `LazyVGrid` for efficient scrolling
- Async image loading with placeholders
- Loads data once on appear
- In-memory filtering and sorting

## Future Enhancements

### Potential Additions:
1. **Pagination** - Load products in batches
2. **Search Integration** - Filter by search query
3. **Advanced Filters** - Multi-select filter sheet
4. **Breadcrumb Navigation** - Category hierarchy
5. **Save Filters** - Remember user preferences
6. **Compare Mode** - Select products to compare
7. **Recently Viewed** - Track viewed products
8. **Analytics** - Track user interactions

## Testing

Preview configurations included:
- `#Preview("PLP - Refrigerators")` - Full PLP view
- `#Preview("PLP - List View")` - List mode
- `#Preview("Compact Product Card")` - Grid card

## Summary

The PLP implementation is **production-ready** and uses:
- ✅ Real data from `pip-datasets.json`
- ✅ Complete PLP schema with all product information
- ✅ DSPlpFilterPanel for filters and navigation
- ✅ ProductCard for list view display
- ✅ CompactProductCard for grid view
- ✅ Full sort and filter capabilities
- ✅ The Home Depot design system compliance
- ✅ Performance optimizations

The architecture is modular, maintainable, and extensible for future enhancements.
