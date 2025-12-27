# Enhanced Shop Navigation with Multi-Level Hierarchy

## 🎯 Overview

This enhancement adds comprehensive multi-level navigation to the shop experience with proper back navigation, JSON data integration, and improved UX patterns.

## ✨ What's New

### 1. **NavigationStack Integration**
- Uses iOS 16+ NavigationStack for proper navigation hierarchy
- Full back button support at every level
- Automatic navigation bar management
- Path-based navigation for deep linking support

### 2. **Three-Level Navigation Hierarchy**
```
Departments (Level 1)
    ↓
Subcategories (Level 2)
    ↓
Product Listing (Level 3)
    ↓
Product Detail (Level 4 - Ready for expansion)
```

### 3. **Enhanced Visual Design**
- **Department List**: Large icons, category counts, hover states
- **Subcategory Grid**: Card-based layout with availability badges
- **Shop All Button**: Prominent call-to-action for department-level browsing
- **Breadcrumb Navigation**: Shows navigation path in PLP view

### 4. **JSON Data Integration**
The enhanced PLP view now fully integrates category JSON data:
- ✅ Breadcrumbs from `pageInfo.breadcrumbs`
- ✅ Hero banners from `pageInfo.heroImage`
- ✅ Featured brands from `featuredBrands`
- ✅ Quick filters from `quickFilters`
- ✅ Products from `products` array
- ✅ Style pills from `categoryStyles`
- ✅ Filter groups from `filters`

### 5. **Smart Data Loading**
```swift
// Priority 1: Load from category-specific JSON
if let categoryData = loadCategoryData(filename: "french-door-refrigerators") {
    // Use curated data with real images
    products = categoryData.products
}

// Priority 2: Fallback to pip-datasets.json
else {
    // Filter by breadcrumb
    products = pipDatasets.filter { /* breadcrumb match */ }
}
```

## 📁 File Structure

### New Files
- **EnhancedShopNavigation.swift** - Main navigation implementation
  - `EnhancedShopNavigationView` - Root navigation container
  - `EnhancedPLPView` - Enhanced product listing with JSON integration
  - `ShopNavigationDestination` - Navigation path enum

### Existing Files Enhanced
- **ShopNavigation.swift** - Already has ShopDepartment and ShopSubcategory
- **PLPView.swift** - Original PLP view (kept for backward compatibility)
- **HomeScreenView.swift** - Can now use enhanced navigation

## 🎨 Design Features

### Department View
```
┌─────────────────────────────────┐
│  Shop All Departments           │  ← H2 Bold
├─────────────────────────────────┤
│  🔧 Tools              [8] →    │  ← H3 Semibold + Badge
│  🪛 Hardware           [6] →    │
│  🎨 Paint              [5] →    │
│  🚿 Plumbing          [4] →    │
└─────────────────────────────────┘
```

### Subcategory View
```
┌─────────────────────────────────┐
│  ← 🔧 Tools                     │  ← H2 Bold
│     8 Categories                │  ← Body Md
├─────────────────────────────────┤
│  Shop All Tools →               │  ← Prominent CTA
├─────────────────────────────────┤
│  ┌────────┐  ┌────────┐        │
│  │  🪛    │  │  ⚡    │        │
│  │ Drills │  │  Saws  │        │  ← Grid layout
│  │ •Available│ •Available│      │  ← Status badge
│  └────────┘  └────────┘        │
└─────────────────────────────────┘
```

### PLP View with JSON Data
```
┌─────────────────────────────────┐
│  Home > Tools > Power Drills    │  ← Breadcrumbs
├─────────────────────────────────┤
│  Save 40% on Select Drills!     │  ← Hero Banner
├─────────────────────────────────┤
│  Featured Brands                │
│  [DEWALT] [Milwaukee] [Makita]  │  ← Brand chips
├─────────────────────────────────┤
│  POWER DRILLS                   │  ← Category title
│  [Cordless] [Corded] [Hammer]   │  ← Style pills (from JSON)
│  156 Results                     │
├─────────────────────────────────┤
│  🔍 All Filters   Brand   Price  │  ← Filter pills (from JSON)
├─────────────────────────────────┤
│  Product Grid...                │
└─────────────────────────────────┘
```

## 🔄 Navigation Flow

### User Journey Example

1. **Start**: User taps "Shop" in bottom tab bar
2. **Level 1**: Sees all departments with category counts
3. **Select**: Taps "Tools" (shows 8 categories badge)
4. **Level 2**: Sees Tools subcategories in grid layout
   - Can tap "Shop All Tools" for department-level view
   - Can tap specific subcategory like "Power Drills"
5. **Level 3**: Sees Power Drills PLP with:
   - Breadcrumb: Home > Tools > Power Drills
   - Hero banner from JSON
   - Featured brands from JSON
   - Style pills with real product images
   - Filtered product grid
6. **Navigation**: Back button at each level returns to previous screen

### Back Navigation Options

```swift
// Option 1: Native back button (automatic)
NavigationStack handles this

// Option 2: Custom close button (top-right)
Dismisses entire shop navigation

// Option 3: Breadcrumb navigation (future)
Tap any breadcrumb to jump to that level
```

## 📊 JSON Data Mapping

### Category JSON Structure
```json
{
  "pageInfo": {
    "categoryName": "Power Drills",
    "breadcrumbs": [
      {"label": "Home", "url": "/"},
      {"label": "Tools", "url": "/tools"},
      {"label": "Power Drills", "url": "/tools/power-drills"}
    ],
    "totalResults": 156,
    "heroImage": {
      "promoText": "Save up to 40% on select drills"
    }
  },
  "featuredBrands": [
    {"brandId": "dewalt", "brandName": "DEWALT"}
  ],
  "categoryStyles": [
    {
      "styleId": "cordless",
      "styleName": "Cordless\nDrills",
      "image": "images/drill-cordless.jpg"
    }
  ],
  "filters": [
    {
      "filterGroupName": "Power Source",
      "options": [...]
    }
  ],
  "products": [...]
}
```

### How Data Flows

```
JSON File
    ↓
CategoryDataLoader.loadCategoryData()
    ↓
EnhancedPLPView.categoryData
    ↓
UI Components:
    • breadcrumbView (from pageInfo.breadcrumbs)
    • heroBanner (from pageInfo.heroImage)
    • featuredBrandsView (from featuredBrands)
    • stylePills (from categoryStyles)
    • filterPills (from filters)
    • products (from products array)
```

## 🛠️ Implementation Guide

### Step 1: Replace Shop Navigation

In your `MainAppNavigationView` or `HomeScreenDemoView`:

```swift
// OLD
if isShopNavigationPresented {
    ShopNavigationView(isPresented: $isShopNavigationPresented)
}

// NEW
if isShopNavigationPresented {
    EnhancedShopNavigationView(isPresented: $isShopNavigationPresented)
}
```

### Step 2: Add Category JSON Files

Create JSON files for each category you want enhanced data:

```
Project/
  ├── Data/
  │   ├── french-door-refrigerators.json  ✅ Exists
  │   ├── power-drills.json               🆕 Add this
  │   ├── power-saws.json                 🆕 Add this
  │   └── sanders.json                    🆕 Add this
```

### Step 3: Link Subcategories to PLP Categories

In `ShopNavigation.swift`, ensure subcategories reference PLPCategory:

```swift
case .tools:
    return [
        ShopSubcategory(
            name: "Power Drills",
            icon: "screwdriver",
            plpCategory: .powerDrills  // ✅ Linked to PLP
        ),
        ShopSubcategory(
            name: "Hand Tools",
            icon: "hammer",
            plpCategory: nil  // ❌ No PLP yet (shows placeholder)
        )
    ]
```

### Step 4: Update PLPCategory with JSON Filename

In `PLPView.swift`:

```swift
static let powerDrills: PLPCategory = {
    guard let categoryData = CategoryDataLoader.shared.loadCategoryData(
        filename: "power-drills"  // ← JSON filename
    ) else {
        // Fallback...
    }
    
    return PLPCategory(
        title: categoryData.pageInfo.categoryName.uppercased(),
        breadcrumbFilter: "Drill",
        stylePills: /* from JSON */,
        filterPills: /* from JSON */,
        subFilterPills: /* from JSON */,
        categoryJSONFilename: "power-drills"  // ← Store filename
    )
}()
```

## 🎯 Benefits

### For Users
✅ Clear navigation hierarchy with breadcrumbs
✅ Easy back navigation at every level
✅ Visual category counts and availability indicators
✅ Rich product data with hero banners and featured brands
✅ Faster load times with curated category JSON files

### For Developers
✅ Clean NavigationStack implementation
✅ JSON-first data approach with pip-datasets fallback
✅ Reusable components (EnhancedPLPView, breadcrumbs, etc.)
✅ Type-safe navigation with ShopNavigationDestination
✅ Easy to add new categories with JSON files

### For Content
✅ Curated product lists per category
✅ Custom hero banners and promotions
✅ Featured brand merchandising
✅ Quick filter recommendations
✅ SEO-friendly breadcrumbs

## 🚀 Future Enhancements

### Phase 2: Product Detail Navigation
```swift
enum ShopNavigationDestination: Hashable {
    case departments
    case subcategories(ShopDepartment)
    case categoryDetail(ShopSubcategory)
    case productDetail(String) // ← Add product navigation
}
```

### Phase 3: Deep Linking
```swift
// Handle URLs like: myapp://shop/tools/power-drills
func handleDeepLink(_ url: URL) {
    navigationPath.append(ShopDepartment.tools)
    navigationPath.append(toolsSubcategory)
}
```

### Phase 4: Search Integration
- Add search bar in department view
- Filter subcategories by search term
- Jump directly to PLP with search query

### Phase 5: Favorites & History
- Track viewed categories
- Show "Recently Viewed" section
- Add favorite departments

## 📝 Testing Checklist

- [ ] Navigate through all departments
- [ ] Test back button at each level
- [ ] Verify close button dismisses entire navigation
- [ ] Check breadcrumb display in PLP
- [ ] Confirm JSON data loads correctly
- [ ] Test fallback to pip-datasets.json
- [ ] Verify placeholder view for categories without PLP
- [ ] Test availability badges on subcategory cards
- [ ] Check hero banner display
- [ ] Verify featured brands section
- [ ] Test style pill selection
- [ ] Check filter pill functionality

## 🐛 Troubleshooting

### Issue: JSON data not loading
```
Solution: Check console logs for:
❌ Error: Could not find power-drills.json in bundle
→ Ensure JSON file is added to Xcode project
→ Verify "Target Membership" is checked
```

### Issue: Back button not working
```
Solution: Ensure using NavigationStack, not NavigationView
→ NavigationView is deprecated in iOS 16+
→ NavigationStack provides proper path-based navigation
```

### Issue: Products not displaying
```
Solution: Check product data mapping
→ Verify JSON structure matches CategoryData model
→ Check console for product count logs
→ Ensure fallback to pip-datasets is working
```

## 📚 Related Documentation

- See `JSON_STRUCTURE_GUIDE.md` for JSON file format
- See `PLP_IMPLEMENTATION.md` for PLP details
- See `SHOP_CATEGORY_UNIFICATION.md` for category structure

---

**Created**: December 2024
**Last Updated**: December 2024
**Version**: 1.0
