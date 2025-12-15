# JSON Data Structure Guide for PLP Categories

## Overview
The PLP system now supports loading category data from JSON files for any product category, not just refrigerators!

## What Changed

### 1. Updated Data Model
- **`refrigeratorStyles`** → Now optional (only for refrigerator categories)
- **`categoryStyles`** → New generic field for any product category

### 2. Flexible Style Pills
The `CategoryDataLoader` now has two methods:
- `createStylePills(from: [RefrigeratorStyle])` - For refrigerators
- `createStylePills(from: [CategoryStyle], fallbackIcon:)` - For all other categories

### 3. Auto-Loading Categories
The following categories now automatically try to load from JSON:
- ✅ **Refrigerators** → `french-door-refrigerators.json`
- ✅ **Power Drills** → `power-drills.json`
- ✅ **Power Saws** → `power-saws.json`
- ✅ **Sanders** → `sanders.json`

## JSON File Structure

### For Tool Categories (power-drills.json, power-saws.json, sanders.json)

```json
{
  "pageInfo": {
    "categoryId": "power-drills",
    "categoryName": "Power Drills",
    "categorySlug": "power-drills",
    "breadcrumbs": [
      { "label": "Home", "url": "/" },
      { "label": "Tools", "url": "/tools" },
      { "label": "Power Drills", "url": "/tools/power-drills" }
    ],
    "totalResults": 24,
    "heroImage": {
      "url": "hero-image.jpg",
      "alt": "Power Drills",
      "promoText": "Save up to 40% on select drills"
    },
    "seoDescription": "Shop our selection of power drills..."
  },
  
  "featuredBrands": [
    {
      "brandId": "dewalt",
      "brandName": "DEWALT",
      "logoUrl": "dewalt-logo.png",
      "filterUrl": "/power-drills?brand=dewalt"
    }
  ],
  
  "quickFilters": [
    {
      "filterId": "cordless",
      "label": "Cordless Drills",
      "imageUrl": "cordless-drill-icon.png",
      "filterUrl": "/power-drills?type=cordless"
    }
  ],
  
  "filters": [
    {
      "filterGroupId": "power-source",
      "filterGroupName": "Power Source",
      "filterType": "checkbox",
      "options": [
        {
          "optionId": "cordless",
          "label": "Cordless",
          "value": "cordless",
          "count": 156,
          "filterUrl": "/power-drills?power=cordless"
        },
        {
          "optionId": "corded",
          "label": "Corded",
          "value": "corded",
          "count": 89,
          "filterUrl": "/power-drills?power=corded"
        }
      ]
    }
  ],
  
  "sortOptions": [
    {
      "sortId": "top-rated",
      "label": "Top Rated",
      "isDefault": true
    },
    {
      "sortId": "price-low-high",
      "label": "Price: Low to High",
      "isDefault": false
    }
  ],
  
  "products": [
    {
      "productId": "drill-001",
      "modelNumber": "DCD771C2",
      "storeSkuNumber": "1234567",
      "brand": "DEWALT",
      "title": "20V MAX Cordless Drill/Driver Kit",
      "shortDescription": "Compact, lightweight drill...",
      "price": {
        "current": 99.00,
        "original": 129.00,
        "savings": 30.00,
        "savingsPercent": 23,
        "isOnSale": true,
        "seeInCart": false
      },
      "rating": {
        "average": 4.7,
        "count": 1234
      },
      "images": {
        "primary": "drill-001-main.jpg",
        "alternate": "drill-001-alt.jpg",
        "colorSwatches": [
          {
            "color": "Yellow/Black",
            "swatchUrl": "swatch-yellow-black.jpg",
            "variantId": "drill-001-yellow"
          }
        ]
      },
      "badges": [
        {
          "type": "exclusive",
          "label": "Exclusive"
        },
        {
          "type": "bestSeller",
          "label": "Best Seller"
        }
      ],
      "keyFeatures": [
        "20V MAX Lithium-Ion battery",
        "High-speed transmission",
        "LED work light"
      ],
      "availability": {
        "inStorePickup": true,
        "delivery": true,
        "shipToHome": true
      },
      "limitPerOrder": 10
    }
  ],
  
  "pagination": {
    "currentPage": 1,
    "totalPages": 5,
    "itemsPerPage": 24,
    "startIndex": 0,
    "endIndex": 23
  },
  
  "categoryStyles": [
    {
      "styleId": "cordless",
      "styleName": "Cordless\nDrills",
      "description": "Battery-powered drills for portability",
      "productId": "drill-001",
      "image": "images/drill-cordless-style.jpg",
      "url": "/power-drills?type=cordless",
      "isCurrentCategory": true
    },
    {
      "styleId": "corded",
      "styleName": "Corded\nDrills",
      "description": "Plug-in drills for continuous power",
      "productId": "drill-002",
      "image": "images/drill-corded-style.jpg",
      "url": "/power-drills?type=corded",
      "isCurrentCategory": false
    },
    {
      "styleId": "hammer",
      "styleName": "Hammer\nDrills",
      "description": "For drilling into concrete and masonry",
      "productId": "drill-003",
      "image": "images/drill-hammer-style.jpg",
      "url": "/power-drills?type=hammer",
      "isCurrentCategory": false
    }
  ],
  
  "parentCategory": {
    "categoryId": "tools",
    "categoryName": "Tools",
    "url": "/tools",
    "department": "Tools & Hardware"
  }
}
```

## Key Differences from Refrigerator JSON

### Refrigerators Use:
```json
{
  "refrigeratorStyles": [ ... ]
}
```

### Other Categories Use:
```json
{
  "categoryStyles": [ ... ]
}
```

Both have the same structure:
```json
{
  "styleId": "unique-id",
  "styleName": "Display\nName",
  "description": "Brief description",
  "productId": "product-ref",
  "image": "images/style-image.jpg",
  "url": "/category?filter=...",
  "isCurrentCategory": true/false
}
```

## How Categories Load Data

### 1. Refrigerators (Legacy)
```swift
static let refrigerators: PLPCategory = {
    guard let categoryData = CategoryDataLoader.shared.loadCategoryData(filename: "french-door-refrigerators") else {
        // Fallback to SF Symbols
    }
    
    let stylePills = CategoryDataLoader.shared.createStylePills(from: categoryData.refrigeratorStyles)
    
    return PLPCategory(
        ...
        categoryJSONFilename: "french-door-refrigerators"
    )
}()
```

### 2. Tools (New Generic Approach)
```swift
static let powerDrills: PLPCategory = {
    guard let categoryData = CategoryDataLoader.shared.loadCategoryData(filename: "power-drills") else {
        // Fallback to SF Symbols
    }
    
    let stylePills: [DSStylePillItem]
    if let categoryStyles = categoryData.categoryStyles {
        stylePills = CategoryDataLoader.shared.createStylePills(
            from: categoryStyles,
            fallbackIcon: "wrench.and.screwdriver"
        )
    } else {
        stylePills = []
    }
    
    return PLPCategory(
        ...
        categoryJSONFilename: "power-drills"
    )
}()
```

## What Happens at Runtime

### With JSON File Present:
```
1. Load power-drills.json
2. Parse categoryStyles array
3. Create style pills with real product images
4. Load products array
5. Display PLP with images
```

### Without JSON File:
```
1. JSON load fails
2. Fallback to hardcoded PLPCategory
3. Use SF Symbol icons for style pills
4. Load products from pip-datasets.json by filtering breadcrumbs
5. Display PLP with SF Symbols
```

## Adding a New Category

### Step 1: Create JSON File
Create `[category-name].json` in your data folder with the structure above.

### Step 2: Update PLPCategory
```swift
static let newCategory: PLPCategory = {
    guard let categoryData = CategoryDataLoader.shared.loadCategoryData(filename: "category-name") else {
        // Fallback
        return PLPCategory(
            title: "CATEGORY NAME",
            breadcrumbFilter: "CategoryKeyword",
            stylePills: [ /* SF Symbols fallback */ ],
            filterPills: [ /* ... */ ],
            subFilterPills: [ /* ... */ ]
        )
    }
    
    let stylePills: [DSStylePillItem]
    if let categoryStyles = categoryData.categoryStyles {
        stylePills = CategoryDataLoader.shared.createStylePills(
            from: categoryStyles,
            fallbackIcon: "cube.fill"
        )
    } else {
        stylePills = []
    }
    
    return PLPCategory(
        title: categoryData.pageInfo.categoryName.uppercased(),
        breadcrumbFilter: "CategoryKeyword",
        stylePills: stylePills,
        filterPills: [ /* ... */ ],
        subFilterPills: [ /* ... */ ],
        categoryJSONFilename: "category-name"
    )
}()
```

### Step 3: Add Preview
```swift
#Preview("PLP - New Category") {
    PLPView(category: .newCategory)
}
```

## Image Requirements

### Style Pill Images
- **Location**: `images/` folder in your project
- **Naming**: Match the `image` field in JSON
- **Example**: `"image": "images/drill-cordless-style.jpg"`
- **Size**: ~300-600px wide is ideal

### Product Images
- **Location**: Same `images/` folder
- **Naming**: Match the `primary` field in `images` object
- **Example**: `"primary": "drill-001-main.jpg"`
- **Size**: ~600px wide recommended

## Current JSON Files Expected

Based on your categories, you should have:

1. ✅ `french-door-refrigerators.json` - Already exists
2. 🆕 `power-drills.json` - New
3. 🆕 `power-saws.json` - New
4. 🆕 `sanders.json` - New

Optional (still use pip-datasets.json):
- `dishwashers.json`
- `washing-machines.json`
- `dryers.json`
- `ranges.json`

## Benefits of JSON Approach

### With Category JSON:
- ✅ Real product images in style pills
- ✅ Curated product list
- ✅ Custom filters and badges
- ✅ SEO-friendly metadata
- ✅ Fast loading (small files)

### Without (pip-datasets.json):
- ✅ Still works with breadcrumb filtering
- ❌ Uses SF Symbol icons
- ❌ Shows all matching products (not curated)
- ❌ Generic filters

## Testing

Run your app and check the console:

### Success:
```
✅ Successfully loaded category data from power-drills.json
   📊 Total products: 24
   🎨 Style pills: 5
🎨 Created 5 style pills from power-drills.json
📦 Loaded 24 products from power-drills.json
🖼️ Sample product hero image URL: drill-001-main
```

### Fallback:
```
❌ Error: Could not find power-drills.json in bundle
📦 Loaded 15 products for category: POWER DRILLS
(Using pip-datasets.json and SF Symbols)
```

## Summary

You can now add JSON files for any category! The system:
1. ✅ Tries to load category-specific JSON
2. ✅ Falls back to pip-datasets.json if not found
3. ✅ Supports both `refrigeratorStyles` and `categoryStyles`
4. ✅ Shows real product images when available
5. ✅ Works with just SF Symbols as fallback

Just add your JSON files to the bundle and the categories will automatically use them! 🎉
