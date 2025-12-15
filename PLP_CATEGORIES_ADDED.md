# PLP Categories - Tools Added

## Summary
Added Power Tools categories to PLPView to complement the existing appliance categories.

## New Categories Added

### 1. Power Drills
- **Title**: POWER DRILLS
- **Breadcrumb Filter**: "Drill"
- **Style Pills**:
  - Cordless Drills
  - Corded Drills
  - Hammer Drills
  - Impact Drivers
  - Drill Combo Kits
- **Preview**: `#Preview("PLP - Power Drills")`

### 2. Power Saws
- **Title**: POWER SAWS
- **Breadcrumb Filter**: "Saw"
- **Style Pills**:
  - Circular Saws
  - Miter Saws
  - Table Saws
  - Jig Saws
  - Reciprocating Saws
- **Preview**: `#Preview("PLP - Power Saws")`

### 3. Sanders
- **Title**: SANDERS
- **Breadcrumb Filter**: "Sander"
- **Style Pills**:
  - Random Orbit Sanders
  - Belt Sanders
  - Detail Sanders
  - Sheet Sanders
- **Preview**: `#Preview("PLP - Sanders")`

## Complete Category List

### Appliances (5)
1. ✅ Refrigerators - Uses `french-door-refrigerators.json`
2. ✅ Dishwashers
3. ✅ Washing Machines
4. ✅ Dryers
5. ✅ Ranges

### Tools (3)
6. ✅ Power Drills
7. ✅ Power Saws
8. ✅ Sanders

## How It Works

All categories use the same data flow:

```swift
PLPView(category: .powerDrills)
     ↓
Filters products from pip-datasets.json by breadcrumb
     ↓
Shows products where breadcrumb.label contains "Drill"
```

### Breadcrumb Matching
The `breadcrumbFilter` property determines which products appear:

```swift
static let powerDrills = PLPCategory(
    title: "POWER DRILLS",
    breadcrumbFilter: "Drill",  // ← Matches breadcrumbs like "Tools > Drills > Cordless Drills"
    ...
)
```

## Data Sources

### Currently Using pip-datasets.json
- **Power Drills** → Filters by "Drill" breadcrumb
- **Power Saws** → Filters by "Saw" breadcrumb
- **Sanders** → Filters by "Sander" breadcrumb
- **Dishwashers** → Filters by "Dishwasher" breadcrumb
- **Washing Machines** → Filters by "Washing Machine" breadcrumb
- **Dryers** → Filters by "Dryer" breadcrumb
- **Ranges** → Filters by "Range" breadcrumb

### Using Category-Specific JSON
- **Refrigerators** → Uses `french-door-refrigerators.json`

## Next Steps

### Option 1: Use pip-datasets.json (Current)
The tool categories will automatically show any products in pip-datasets.json that have matching breadcrumbs.

**Pros:**
- ✅ Works immediately
- ✅ No additional JSON files needed
- ✅ Dynamic based on available data

**Cons:**
- ❌ Limited to products already in pip-datasets.json
- ❌ Can't customize product list per category
- ❌ Style pills use SF Symbols (no real images yet)

### Option 2: Create Category-Specific JSON Files (Recommended)
Create dedicated JSON files like you did for refrigerators:

```
power-drills.json
power-saws.json
sanders.json
```

Then update the categories:

```swift
static let powerDrills: PLPCategory = {
    guard let categoryData = CategoryDataLoader.shared.loadCategoryData(filename: "power-drills") else {
        return .powerDrills  // Fallback
    }
    
    let stylePills = CategoryDataLoader.shared.createStylePills(from: categoryData.toolStyles)
    
    return PLPCategory(
        title: categoryData.pageInfo.categoryName.uppercased(),
        breadcrumbFilter: "Drill",
        stylePills: stylePills,
        filterPills: [...],
        subFilterPills: [...],
        categoryJSONFilename: "power-drills"
    )
}()
```

**Pros:**
- ✅ Full control over products shown
- ✅ Real product images in style pills
- ✅ Curated product lists
- ✅ Better performance (smaller JSON files)

**Cons:**
- ❌ Requires creating JSON files
- ❌ More maintenance

## Testing

### View in Xcode Canvas
In Xcode, you can now select from 8 different preview variants:
1. PLP - Refrigerators
2. PLP - Dishwashers
3. PLP - Washing Machines
4. PLP - Dryers
5. PLP - Ranges
6. **PLP - Power Drills** ← New!
7. **PLP - Power Saws** ← New!
8. **PLP - Sanders** ← New!

### Check Console Output
When you view a tool category, check the console:

```
📦 Loaded 15 products for category: POWER DRILLS
```

If you see `0 products`, it means there are no products in pip-datasets.json with breadcrumbs containing "Drill".

## Adding More Categories

To add more categories (like nailers, routers, grinders, etc.):

```swift
// 1. Add the category definition
static let nailers = PLPCategory(
    title: "NAILERS",
    breadcrumbFilter: "Nailer",
    stylePills: [
        DSStylePillItem(text: "Framing\nNailers", image: Image(systemName: "hammer")),
        DSStylePillItem(text: "Finish\nNailers", image: Image(systemName: "hammer.circle")),
        // ...
    ],
    filterPills: [...],
    subFilterPills: [...]
)

// 2. Add a preview
#Preview("PLP - Nailers") {
    PLPView(category: .nailers)
}
```

## Icon Reference

### SF Symbols Used for Tools
- `bolt.batteryblock` - Cordless/Battery
- `powerplug` - Corded
- `hammer` - Hammer Drills
- `bolt.circle` - Impact/Power
- `cube.box` - Combo Kits
- `circle.grid.cross` - Circular
- `triangle` - Miter/Angle
- `rectangle.grid.1x2` - Table
- `waveform` - Jig/Reciprocating
- `scissors` - Cutting
- `circle.dotted` - Orbit/Rotation
- `arrow.forward` - Belt/Linear motion

## Files Modified
- ✅ `PLPView.swift` - Added 3 new tool categories and previews
