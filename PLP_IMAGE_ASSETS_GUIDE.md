# PLP Style Pill Image Assets Guide

## Overview
The PLPView now uses category-specific configurations with real filter data from the PLP schema. Each category has style pills that require image assets to be added to your Xcode project.

## Required Image Assets

### Refrigerators Category
Add these images to your Asset Catalog:
- `refrigerator_french_door` - French door style refrigerator icon/image
- `refrigerator_side_by_side` - Side by side style refrigerator icon/image  
- `refrigerator_top_freezer` - Top freezer style refrigerator icon/image
- `refrigerator_bottom_freezer` - Bottom freezer style refrigerator icon/image
- `refrigerator_counter_depth` - Counter depth style refrigerator icon/image
- `refrigerator_mini` - Mini fridge icon/image

### Dishwashers Category
- `dishwasher_built_in` - Built-in dishwasher icon/image
- `dishwasher_portable` - Portable dishwasher icon/image
- `dishwasher_drawer` - Drawer dishwasher icon/image
- `dishwasher_panel_ready` - Panel ready dishwasher icon/image

### Washing Machines Category
- `washer_front_load` - Front load washer icon/image
- `washer_top_load` - Top load washer icon/image
- `washer_high_efficiency` - High efficiency washer icon/image
- `washer_portable` - Portable washer icon/image
- `washer_combo` - Washer-dryer combo icon/image

### Dryers Category
- `dryer_electric` - Electric dryer icon/image
- `dryer_gas` - Gas dryer icon/image
- `dryer_ventless` - Ventless dryer icon/image
- `dryer_portable` - Portable dryer icon/image

### Ranges Category
- `range_gas` - Gas range icon/image
- `range_electric` - Electric range icon/image
- `range_dual_fuel` - Dual fuel range icon/image
- `range_induction` - Induction range icon/image
- `range_slide_in` - Slide-in range icon/image

## Image Specifications

### Recommended Dimensions
- **Width:** 80-120pt
- **Height:** 80-120pt
- **Format:** PNG with transparency
- **Resolution:** @2x and @3x variants

### Design Guidelines
1. **Simple Silhouettes:** Use clean, recognizable product silhouettes
2. **Consistent Style:** Maintain visual consistency across all categories
3. **Color:** Monochrome or subtle colors that work in light/dark mode
4. **Padding:** Include internal padding so images don't touch pill edges
5. **Detail Level:** Simplified designs that read well at small sizes

## Alternative: SF Symbols (Temporary)
Until custom images are available, you can use SF Symbols as temporary placeholders:

```swift
// Current temporary solution
Image(systemName: "refrigerator.fill")
Image(systemName: "dishwasher.fill") 
Image(systemName: "washer.fill")
Image(systemName: "dryer.fill")
```

## Adding Images to Xcode

1. **Open Assets.xcassets** in your Xcode project
2. **Create Image Set:** Click the + button and select "Image Set"
3. **Name the Image Set** using the exact names listed above (e.g., `refrigerator_french_door`)
4. **Drag and Drop Images:** Add @2x and @3x variants
5. **Configure Rendering:** Set to "Template" if you want to tint images dynamically

## Implementation in Code

Images are referenced in `PLPCategory` configurations:

```swift
DSStylePillItem(
    text: "French Door\nRefrigerators",
    image: Image("refrigerator_french_door")
)
```

If an image is missing, SwiftUI will show a placeholder or the SF Symbol fallback.

## Filter Data Structure

Each category now includes:
- **Category Title:** Display name (e.g., "REFRIGERATORS")
- **Breadcrumb Filter:** Used to filter products from pip-datasets.json
- **Style Pills:** Visual navigation for product subcategories
- **Filter Pills:** Attribute-based filters relevant to the category
- **Sub-Filter Pills:** Quick filters for common refinements

### Example: Refrigerators Filters
```swift
filterPills: [
    "All Filters" (with icon),
    "Brand",
    "Refrigerator Width",
    "Capacity (cu. ft.)",
    "Color/Finish",
    "Ice & Water Dispenser",
    "Smart Enabled",
    "Energy Star"
]
```

These filters match the actual specification attributes found in the PLP schema data.

## Data Loading

The PLPView now:
1. Loads all products from `pip-datasets.json`
2. Filters by category breadcrumb
3. Displays filtered products with category-specific filter options

```swift
// Example usage
PLPView(category: .refrigerators)
PLPView(category: .dishwashers)
PLPView(category: .washingMachines)
```

## Next Steps

1. **Add Image Assets:** Create and add the required images to your Asset Catalog
2. **Test Categories:** Preview each category to verify images display correctly
3. **Implement Filtering:** Wire up the filter pills to actually filter products
4. **Add More Categories:** Extend `PLPCategory` with additional appliance categories
5. **Connect Navigation:** Integrate with app navigation to route to specific categories
