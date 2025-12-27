# Shop Category List Unification

## Overview
The `ShopByCategoryList` component has been unified to serve both as an embedded section on the home screen and as the slide-in shop navigation triggered by the bottom tab bar.

## Changes Made

### 1. **ShopByCategoryList Component** (`HomeScreenComponents.swift`)
- **Dual-Mode Support**: Added `isSlideInMode` parameter to toggle between:
  - **Embedded mode** (home screen): Compact styling, rounded corners, white background
  - **Slide-in mode** (navigation): Larger text, close button, full-screen styling
  
- **SF Pro Typography**: Uses native system font (`.system(size:weight:)`) which defaults to SF Pro on iOS
  - Slide-in mode: 24pt semibold header, 17pt regular items
  - Embedded mode: 18pt bold header, 16pt regular items

- **PLP Navigation**: Categories with linked PLP views navigate directly using `NavigationLink`
  - Available categories: Appliances → Refrigerators, Tools → Power Drills
  - Categories without PLP show "Coming Soon" label with reduced opacity

### 2. **ShopCategory Model** (`HomeScreenModels.swift`)
```swift
struct ShopCategory: Identifiable {
    let id = UUID()
    let name: String
    let iconName: String
    let isSystemIcon: Bool
    let plpCategory: PLPCategory? // NEW: Optional link to PLP
}
```

Updated data with PLP links:
- **Appliances** → `.refrigerators` PLP
- **Tools** → `.powerDrills` PLP
- Other categories set to `nil` (show as "Coming Soon")

### 3. **HomeScreenDemoView** (`HomeScreenView.swift`)
- **Replaced** `ShopNavigationView` with `ShopByCategoryList` in slide-in mode
- **Navigation**: Wrapped in `NavigationStack` to support PLP navigation
- **Animation**: Spring animation (0.35s response, 0.85 damping) for smooth slide-in/out

### 4. **Styling Differences**

| Feature | Embedded Mode | Slide-In Mode |
|---------|--------------|---------------|
| Header | 18pt bold | 24pt semibold |
| Close button | ❌ No | ✅ Yes |
| Item text | 16pt regular | 17pt regular |
| Icon size | 40pt circle | 32pt circle |
| Background | White container | Clear (uses screen bg) |
| Corner radius | Medium | None |
| Padding | 10pt vertical | 14pt vertical |

## Usage

### In Home Screen (Embedded)
```swift
ShopByCategoryList(categories: HomeScreenData.categories)
```

### As Slide-In Navigation
```swift
ShopByCategoryList(
    categories: HomeScreenData.categories,
    isSlideInMode: true,
    onClose: {
        // Handle close action
    }
)
```

## Navigation Flow

```
Bottom Tab "Shop" → Slide-in ShopByCategoryList
                    ↓
                    Tap "Appliances"
                    ↓
                    PLPView(category: .refrigerators)
                    
                    Tap "Tools"
                    ↓
                    PLPView(category: .powerDrills)
```

## Future Enhancements

### Adding More PLP Categories
To link additional categories to PLPs:

1. Update `HomeScreenModels.swift`:
```swift
ShopCategory(
    name: "Bath & Faucets", 
    iconName: "shower", 
    isSystemIcon: true, 
    plpCategory: .bathFaucets  // Add when PLP is ready
)
```

2. Create the PLP category in `PLPView.swift`:
```swift
static let bathFaucets = PLPCategory(
    title: "BATH & FAUCETS",
    breadcrumbFilter: "Bath",
    stylePills: [...],
    filterPills: [...],
    subFilterPills: [...]
)
```

### Subcategory Navigation
For hierarchical navigation (Department → Subcategories → PLP):
- Consider using the existing `ShopNavigationView` which has full department/subcategory support
- Or extend `ShopByCategoryList` to show subcategories on tap before navigating to PLP

## Files Modified
- ✅ `HomeScreenComponents.swift` - Updated `ShopByCategoryList` and `CategoryListRow`
- ✅ `HomeScreenModels.swift` - Added `plpCategory` to `ShopCategory`
- ✅ `HomeScreenView.swift` - Updated `HomeScreenDemoView` shop navigation

## Testing
- Tap "Shop" tab → Slide-in appears with SF Pro typography
- Tap "Appliances" → Navigates to Refrigerators PLP
- Tap "Tools" → Navigates to Power Drills PLP  
- Tap other categories → Shows "Coming Soon" with no navigation
- Tap X button → Slide-in dismisses with animation
