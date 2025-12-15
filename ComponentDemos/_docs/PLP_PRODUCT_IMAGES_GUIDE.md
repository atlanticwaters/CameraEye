# Product Images in Style Pills - Implementation Guide

## Overview

The PLP filter panel now supports **real product images from pip-datasets.json** in the style pills! This feature dynamically loads actual product images instead of relying solely on placeholder SF Symbols or asset catalog images.

## What Changed

### 1. Enhanced DSStylePillItem

Added `imageURL` property to support remote image loading:

```swift
public struct DSStylePillItem: Identifiable {
    public let id: String
    public let text: String
    public let image: Image?           // Local image or SF Symbol
    public let imageURL: String?       // NEW: Remote image URL from dataset
}
```

### 2. AsyncImage Support in DSPlpFilterPanel

Updated the style pill view to handle both local and remote images:

```swift
private func stylePillView(_ item: DSStylePillItem) -> some View {
    // Checks imageURL first, falls back to local image
    if let imageURL = item.imageURL, let url = URL(string: imageURL) {
        AsyncImage(url: url) { phase in
            switch phase {
            case .success(let image):
                image.resizable().scaledToFill()...
            case .failure:
                Image(systemName: "photo")  // Fallback
            }
        }
    } else if let image = item.image {
        image.resizable().scaledToFill()...
    }
}
```

### 3. PLPCategory.withProductImages() Factory Method

New static method that automatically populates style pills with real product images:

```swift
static func withProductImages(
    title: String,
    breadcrumbFilter: String,
    stylePillConfigs: [(text: String, breadcrumbMatch: String, fallbackIcon: String)],
    filterPills: [DSFilterPillItem],
    subFilterPills: [DSFilterPillItem]
) -> PLPCategory
```

## How It Works

### Data Flow

```
1. withProductImages() loads pip-datasets.json
                ↓
2. For each style pill config, searches for matching product
   by breadcrumb (e.g., "French Door", "Side by Side")
                ↓
3. Extracts product.media.primaryImage URL
                ↓
4. Creates DSStylePillItem with imageURL
                ↓
5. DSPlpFilterPanel renders with AsyncImage
                ↓
6. Product image displays in style pill!
```

### Example: Refrigerators with Real Images

```swift
static let refrigeratorsWithImages: PLPCategory = {
    PLPCategory.withProductImages(
        title: "REFRIGERATORS",
        breadcrumbFilter: "Refrigerator",
        stylePillConfigs: [
            ("French Door\nRefrigerators", "French Door", "refrigerator.fill"),
            ("Side by Side\nRefrigerators", "Side by Side", "refrigerator.fill"),
            // ... more configs
        ],
        filterPills: [...],
        subFilterPills: [...]
    )
}()
```

Each tuple in `stylePillConfigs` contains:
- **text**: Display text for the pill
- **breadcrumbMatch**: String to match in product breadcrumbs
- **fallbackIcon**: SF Symbol to use if no product found or image fails to load

## Usage

### Option 1: Static Configuration (SF Symbols)
```swift
PLPView(category: .refrigerators)
```
Uses SF Symbols defined in the category configuration.

### Option 2: Dynamic Product Images
```swift
PLPView(category: .refrigeratorsWithImages)
```
Automatically loads real product images from pip-datasets.json!

## Benefits

### ✅ Real Product Imagery
Style pills show actual product photos instead of generic icons.

### ✅ Automatic Discovery
No need to manually specify image URLs - they're extracted from the dataset based on product breadcrumbs.

### ✅ Graceful Fallback
If a product isn't found or image fails to load:
1. Falls back to SF Symbol
2. Shows loading indicator during fetch
3. Shows error icon if load fails

### ✅ Performance
- Images load asynchronously (non-blocking)
- Automatic caching by AsyncImage
- Only loads images for visible pills

## Image Matching Logic

The system finds products by matching breadcrumbs:

```swift
let matchingProduct = datasets.first { dataset in
    dataset.breadcrumbs.contains { breadcrumb in
        breadcrumb.label.lowercased().contains(config.breadcrumbMatch.lowercased())
    }
}
```

### Example Breadcrumb Matching

For "French Door Refrigerators":
```json
{
  "breadcrumbs": [
    { "label": "Appliances" },
    { "label": "Refrigerators" },
    { "label": "French Door Refrigerators" }  ← MATCH!
  ]
}
```

If `breadcrumbMatch = "French Door"`, this product will be found!

## Creating New Categories with Product Images

### Template

```swift
static let myCategory: PLPCategory = {
    PLPCategory.withProductImages(
        title: "CATEGORY NAME",
        breadcrumbFilter: "Category",
        stylePillConfigs: [
            ("Style Name", "Breadcrumb Match", "fallback.icon"),
            // Add more styles...
        ],
        filterPills: [
            DSFilterPillItem(text: "All Filters", icon: ...),
            // Add more filters...
        ],
        subFilterPills: [
            DSFilterPillItem(text: "In Stock At Store Today"),
            // Add more sub-filters...
        ]
    )
}()
```

### Example: Dishwashers

```swift
static let dishwashersWithImages: PLPCategory = {
    PLPCategory.withProductImages(
        title: "DISHWASHERS",
        breadcrumbFilter: "Dishwasher",
        stylePillConfigs: [
            ("Built-In\nDishwashers", "Built-In", "dishwasher.fill"),
            ("Portable\nDishwashers", "Portable", "dishwasher.fill"),
            ("Drawer\nDishwashers", "Drawer", "dishwasher.fill"),
            ("Panel Ready\nDishwashers", "Panel Ready", "dishwasher.fill")
        ],
        filterPills: [...],
        subFilterPills: [...]
    )
}()
```

## Performance Considerations

### Loading Time
- First load: ~0.5-1s per image (network dependent)
- Subsequent loads: Instant (cached)

### Memory Usage
- AsyncImage automatically manages memory
- Images released when not visible
- Minimal overhead

### Best Practices
1. **Use specific breadcrumb matches** to find the most representative products
2. **Always provide fallback icons** for offline scenarios
3. **Test with slow network** to ensure loading states look good
4. **Limit number of style pills** to 4-6 for best UX

## Troubleshooting

### Images Not Loading?

**Check 1: Verify breadcrumb matches**
```swift
// Log to see available breadcrumbs
print("🖼️ Sample product image: \(firstProduct.media.primaryImage)")
print("📋 Breadcrumbs: \(firstProduct.breadcrumbs.map { $0.label })")
```

**Check 2: Verify URL format**
```swift
// URLs should be valid HTTP/HTTPS
print("🔗 Image URL: \(product.media.primaryImage)")
// Example: "https://images.thdstatic.com/productImages/..."
```

**Check 3: Network connection**
- AsyncImage requires network access
- Check Info.plist for App Transport Security settings if needed

### Wrong Product Images?

**Solution: Refine breadcrumb matching**
```swift
// Too broad (might match wrong products)
("French Door\nRefrigerators", "Door", "refrigerator.fill")

// Better (more specific)
("French Door\nRefrigerators", "French Door", "refrigerator.fill")
```

### Fallback Icons Showing Instead?

This means no matching product was found. Check:
1. `breadcrumbFilter` matches products in dataset
2. `breadcrumbMatch` exists in product breadcrumbs
3. Dataset loaded successfully (`PLPDataLoader.shared.loadPIPDatasets()`)

## Example Output

When working correctly, you'll see console output like:

```
📦 Loaded 127 products for category: REFRIGERATORS
🖼️ Sample product image: https://images.thdstatic.com/productImages/abc123.jpg
🖼️ Total images: 8
```

And style pills will display actual refrigerator product photos!

## Future Enhancements

### Potential Improvements:
1. **Image Caching Strategy** - Custom cache management
2. **Multiple Image Support** - Show different angles or variants
3. **Smart Image Selection** - Choose highest-rated or best-selling product
4. **Placeholder Customization** - Brand-specific loading states
5. **Image Optimization** - Resize/compress for faster loading
6. **Offline Support** - Download and cache popular categories

## API Reference

### DSStylePillItem

```swift
public struct DSStylePillItem: Identifiable {
    public let id: String
    public let text: String
    public let image: Image?       // Local image or SF Symbol
    public let imageURL: String?   // Remote image URL
    
    public init(
        id: String = UUID().uuidString,
        text: String,
        image: Image? = nil,
        imageURL: String? = nil
    )
}
```

### PLPCategory.withProductImages()

```swift
static func withProductImages(
    title: String,
    breadcrumbFilter: String,
    stylePillConfigs: [(text: String, breadcrumbMatch: String, fallbackIcon: String)],
    filterPills: [DSFilterPillItem],
    subFilterPills: [DSFilterPillItem]
) -> PLPCategory
```

**Parameters:**
- `title`: Category display name
- `breadcrumbFilter`: String to filter products by category
- `stylePillConfigs`: Array of tuples defining each style pill
- `filterPills`: Array of filter pill items
- `subFilterPills`: Array of sub-filter pill items

**Returns:** Configured PLPCategory with product images

## Summary

The PLP filter panel now supports **real product images from the dataset** in style pills:

✅ **Automatic Image Loading** - Extracts images from pip-datasets.json  
✅ **Breadcrumb Matching** - Finds representative products automatically  
✅ **Graceful Fallbacks** - SF Symbols when images unavailable  
✅ **AsyncImage Support** - Non-blocking, cached image loading  
✅ **Easy Configuration** - Simple factory method API  

**Try it now:**
```swift
#Preview("With Real Images") {
    PLPView(category: .refrigeratorsWithImages)
}
```

---

*Last Updated: December 14, 2024*
