# PLP Filter Panel - Quick Reference

## ⚡ Quick Start

### Display a PLP
```swift
PLPView(category: .refrigerators)
```

### Available Categories
```swift
PLPView(category: .refrigerators)       // Refrigerators
PLPView(category: .dishwashers)         // Dishwashers
PLPView(category: .washingMachines)     // Washing Machines
PLPView(category: .dryers)              // Dryers
PLPView(category: .ranges)              // Ranges
```

---

## 📋 Category Configurations

### .refrigerators
**Style Pills:** 6  
**Filters:** Brand, Refrigerator Width, Capacity, Color/Finish, Ice & Water Dispenser, Smart Enabled, Energy Star  
**Sub-Filters:** In Stock, Free Delivery, Get It Fast, Special Buy, Exclusive, Best Seller

### .dishwashers
**Style Pills:** 4  
**Filters:** Brand, Width, Color/Finish, Tub Material, Noise Level, Smart Enabled, Third Rack  
**Sub-Filters:** In Stock, Free Delivery, Get It Fast, Special Buy, Energy Star

### .washingMachines
**Style Pills:** 5  
**Filters:** Brand, Capacity, Color/Finish, Washer Type, Smart Enabled, Energy Star, Steam Cycle  
**Sub-Filters:** In Stock, Free Delivery, Get It Fast, Special Buy, Best Seller

### .dryers
**Style Pills:** 4  
**Filters:** Brand, Capacity, Color/Finish, Fuel Type, Smart Enabled, Energy Star, Steam Cycle  
**Sub-Filters:** In Stock, Free Delivery, Get It Fast, Special Buy

### .ranges
**Style Pills:** 5  
**Filters:** Brand, Width, Color/Finish, Fuel Type, Oven Type, Smart Enabled, Self-Cleaning  
**Sub-Filters:** In Stock, Free Delivery, Get It Fast, Special Buy, Best Seller

---

## 🎨 Image Assets Needed

### Format
- **Size:** 80-120pt × 80-120pt
- **Format:** PNG with transparency
- **Resolution:** @2x and @3x variants

### Asset Names

**Refrigerators:**
- `refrigerator_french_door`
- `refrigerator_side_by_side`
- `refrigerator_top_freezer`
- `refrigerator_bottom_freezer`
- `refrigerator_counter_depth`
- `refrigerator_mini`

**Dishwashers:**
- `dishwasher_built_in`
- `dishwasher_portable`
- `dishwasher_drawer`
- `dishwasher_panel_ready`

**Washing Machines:**
- `washer_front_load`
- `washer_top_load`
- `washer_high_efficiency`
- `washer_portable`
- `washer_combo`

**Dryers:**
- `dryer_electric`
- `dryer_gas`
- `dryer_ventless`
- `dryer_portable`

**Ranges:**
- `range_gas`
- `range_electric`
- `range_dual_fuel`
- `range_induction`
- `range_slide_in`

---

## 🔧 Adding a New Category

```swift
extension PLPCategory {
    static let newCategory = PLPCategory(
        title: "CATEGORY NAME",
        breadcrumbFilter: "Category",  // Must match breadcrumb in JSON
        stylePills: [
            DSStylePillItem(
                text: "Style Name\nSubtext",
                image: Image("asset_name")
            )
        ],
        filterPills: [
            DSFilterPillItem(
                text: "All Filters",
                icon: Image(systemName: "line.3.horizontal.decrease.circle")
            ),
            DSFilterPillItem(text: "Filter Name")
        ],
        subFilterPills: [
            DSFilterPillItem(text: "In Stock At Store Today")
        ]
    )
}
```

---

## 📊 Data Sources

### Products
- **File:** `pip-datasets.json`
- **Loader:** `PLPDataLoader.shared`
- **Method:** `loadPIPDatasets()`

### Filters
- **Source:** `PLPCategory` static configurations
- **Location:** `PLPView.swift` (bottom of file)

### Images
- **Source:** Xcode Asset Catalog
- **Location:** `Assets.xcassets`

---

## 🎯 Common Tasks

### Change Category Title
```swift
static let myCategory = PLPCategory(
    title: "NEW TITLE",  // ← Change this
    // ...
)
```

### Add Style Pill
```swift
stylePills: [
    // ... existing pills
    DSStylePillItem(
        text: "New Style\nSubtext",
        image: Image("new_asset")
    )
]
```

### Add Filter
```swift
filterPills: [
    // ... existing filters
    DSFilterPillItem(text: "New Filter")
]
```

### Add Sub-Filter
```swift
subFilterPills: [
    // ... existing sub-filters
    DSFilterPillItem(text: "New Quick Filter")
]
```

---

## 🐛 Troubleshooting

### Products not loading
- ✅ Check `pip-datasets.json` is in bundle
- ✅ Verify breadcrumbFilter matches JSON data
- ✅ Check console for error messages

### Images not showing
- ✅ Verify asset names match exactly
- ✅ Check Assets.xcassets contains the images
- ✅ Ensure @2x and @3x variants exist

### Filters not displaying
- ✅ Verify array is not empty
- ✅ Check for syntax errors in configuration
- ✅ Rebuild project

### Results count showing "0 RESULTS"
- ✅ Check breadcrumbFilter is correct
- ✅ Verify products exist in JSON for that category
- ✅ Check filtering logic in loadProducts()

---

## 📖 Documentation Files

- **PLP_IMPLEMENTATION_COMPLETE.md** - Full implementation summary
- **PLP_FILTER_PANEL_UPDATE.md** - Detailed change documentation
- **PLP_IMAGE_ASSETS_GUIDE.md** - Image specifications
- **PLP_DATA_FLOW.md** - Architecture and data flow
- **PLP_QUICK_REFERENCE.md** - This file

---

## 🎓 Key Concepts

### PLPCategory
Static configuration containing all data for a category (title, filters, style pills)

### DSPlpFilterPanel
SwiftUI component that displays the filter UI

### PIPDataset
Raw product data model from JSON

### Product
Display model used by ProductCard

### Breadcrumb Filtering
How products are filtered by category using breadcrumb hierarchy

---

## 💡 Pro Tips

1. **Use SF Symbols** as temporary placeholders until real images are ready
2. **Test in preview** before running on device
3. **Add filters incrementally** - start with basics, add more later
4. **Keep filter names short** for better mobile display
5. **Group related filters** in the array for better UX
6. **Use analytics** to see which filters users actually use

---

## 📱 Preview Commands

```swift
// In Xcode, click Resume on any preview:
#Preview("PLP - Refrigerators") { 
    PLPView(category: .refrigerators) 
}
```

**Keyboard Shortcuts:**
- `⌥ + ⌘ + P` - Resume preview
- `⌥ + ⌘ + Return` - Show/hide preview

---

## ✅ Status Checklist

- [x] PLPView refactored
- [x] PLPCategory created
- [x] 5 categories configured
- [x] Data loading implemented
- [x] Filter panel wired up
- [x] Previews updated
- [x] Documentation complete
- [ ] Image assets added
- [ ] Filter logic implemented
- [ ] Style pill filtering implemented
- [ ] Sub-filter logic implemented

---

## 🚀 Next Steps

1. Add image assets to Asset Catalog
2. Test each category preview
3. Implement filter logic
4. Add more categories
5. Wire up to app navigation

---

*Last Updated: December 14, 2024*
