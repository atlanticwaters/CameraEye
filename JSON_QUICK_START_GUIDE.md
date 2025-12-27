# Quick Start: Creating Category JSON Files

## 📋 What You Need

To create a new category JSON file (like `dishwashers.json`, `dryers.json`, etc.), you need:

1. Category information (name, description, breadcrumbs)
2. Product data (can extract from pip-datasets.json)
3. Style categories (the different types within the category)
4. Filter options (brand, price, features, etc.)

---

## 🎯 Minimal JSON Template

Here's the absolute minimum structure that will work:

```json
{
  "pageInfo": {
    "categoryId": "category-id",
    "categoryName": "Category Name",
    "categorySlug": "category-name",
    "breadcrumbs": [
      {"label": "Home", "url": "/"},
      {"label": "Department", "url": "/department"},
      {"label": "Category Name", "url": "/department/category"}
    ],
    "totalResults": 0
  },
  
  "featuredBrands": [],
  
  "quickFilters": [],
  
  "filters": [
    {
      "filterGroupId": "brand",
      "filterGroupName": "Brand",
      "filterType": "checkbox",
      "options": []
    }
  ],
  
  "sortOptions": [
    {
      "sortId": "top-rated",
      "label": "Top Rated",
      "isDefault": true
    }
  ],
  
  "products": [],
  
  "pagination": {
    "currentPage": 1,
    "totalPages": 1,
    "itemsPerPage": 24,
    "startIndex": 0,
    "endIndex": 0
  },
  
  "categoryStyles": [],
  
  "parentCategory": {
    "categoryId": "parent-id",
    "categoryName": "Parent Name",
    "url": "/parent",
    "department": "Department Name"
  }
}
```

---

## 📦 Example: Dishwashers JSON

### Step-by-Step Creation

#### 1. Start with Page Info
```json
{
  "pageInfo": {
    "categoryId": "dishwashers",
    "categoryName": "Dishwashers",
    "categorySlug": "dishwashers",
    "breadcrumbs": [
      {"label": "Home", "url": "/"},
      {"label": "Appliances", "url": "/appliances"},
      {"label": "Dishwashers", "url": "/appliances/dishwashers"}
    ],
    "totalResults": 89,
    "heroImage": {
      "url": "hero-dishwashers.jpg",
      "alt": "Dishwashers",
      "promoText": "Save up to $200 on select dishwashers"
    },
    "seoDescription": "Shop our selection of dishwashers with third rack, quiet operation, and energy efficiency."
  }
}
```

#### 2. Add Featured Brands
```json
{
  "featuredBrands": [
    {
      "brandId": "bosch",
      "brandName": "Bosch",
      "logoUrl": "bosch-logo.png",
      "filterUrl": "/dishwashers?brand=bosch"
    },
    {
      "brandId": "ge",
      "brandName": "GE",
      "logoUrl": "ge-logo.png",
      "filterUrl": "/dishwashers?brand=ge"
    },
    {
      "brandId": "whirlpool",
      "brandName": "Whirlpool",
      "logoUrl": "whirlpool-logo.png",
      "filterUrl": "/dishwashers?brand=whirlpool"
    }
  ]
}
```

#### 3. Add Quick Filters
```json
{
  "quickFilters": [
    {
      "filterId": "in-stock",
      "label": "In Stock At Store Today",
      "imageUrl": "",
      "filterUrl": "/dishwashers?availability=in-stock"
    },
    {
      "filterId": "third-rack",
      "label": "Third Rack",
      "imageUrl": "",
      "filterUrl": "/dishwashers?feature=third-rack"
    },
    {
      "filterId": "energy-star",
      "label": "Energy Star",
      "imageUrl": "",
      "filterUrl": "/dishwashers?certification=energy-star"
    }
  ]
}
```

#### 4. Add Main Filters
```json
{
  "filters": [
    {
      "filterGroupId": "brand",
      "filterGroupName": "Brand",
      "filterType": "checkbox",
      "options": [
        {
          "optionId": "bosch",
          "label": "Bosch",
          "value": "bosch",
          "count": 23,
          "filterUrl": "/dishwashers?brand=bosch"
        },
        {
          "optionId": "ge",
          "label": "GE",
          "value": "ge",
          "count": 18,
          "filterUrl": "/dishwashers?brand=ge"
        },
        {
          "optionId": "whirlpool",
          "label": "Whirlpool",
          "value": "whirlpool",
          "count": 15,
          "filterUrl": "/dishwashers?brand=whirlpool"
        }
      ]
    },
    {
      "filterGroupId": "width",
      "filterGroupName": "Width",
      "filterType": "checkbox",
      "options": [
        {
          "optionId": "24-inch",
          "label": "24 Inches",
          "value": "24",
          "count": 67,
          "filterUrl": "/dishwashers?width=24"
        },
        {
          "optionId": "18-inch",
          "label": "18 Inches",
          "value": "18",
          "count": 22,
          "filterUrl": "/dishwashers?width=18"
        }
      ]
    },
    {
      "filterGroupId": "color",
      "filterGroupName": "Color/Finish",
      "filterType": "checkbox",
      "options": [
        {
          "optionId": "stainless",
          "label": "Stainless Steel",
          "value": "stainless",
          "count": 56,
          "filterUrl": "/dishwashers?color=stainless"
        },
        {
          "optionId": "black-stainless",
          "label": "Black Stainless",
          "value": "black-stainless",
          "count": 12,
          "filterUrl": "/dishwashers?color=black-stainless"
        },
        {
          "optionId": "white",
          "label": "White",
          "value": "white",
          "count": 21,
          "filterUrl": "/dishwashers?color=white"
        }
      ]
    }
  ]
}
```

#### 5. Add Category Styles
```json
{
  "categoryStyles": [
    {
      "styleId": "built-in",
      "styleName": "Built-In\nDishwashers",
      "description": "Standard under-counter installation",
      "productId": "dishwasher-001",
      "image": "images/dishwasher-built-in.jpg",
      "url": "/dishwashers?type=built-in",
      "isCurrentCategory": true
    },
    {
      "styleId": "portable",
      "styleName": "Portable\nDishwashers",
      "description": "Freestanding with casters",
      "productId": "dishwasher-002",
      "image": "images/dishwasher-portable.jpg",
      "url": "/dishwashers?type=portable",
      "isCurrentCategory": false
    },
    {
      "styleId": "drawer",
      "styleName": "Drawer\nDishwashers",
      "description": "Single or double drawer design",
      "productId": "dishwasher-003",
      "image": "images/dishwasher-drawer.jpg",
      "url": "/dishwashers?type=drawer",
      "isCurrentCategory": false
    },
    {
      "styleId": "panel-ready",
      "styleName": "Panel Ready\nDishwashers",
      "description": "Custom panel integration",
      "productId": "dishwasher-004",
      "image": "images/dishwasher-panel-ready.jpg",
      "url": "/dishwashers?type=panel-ready",
      "isCurrentCategory": false
    }
  ]
}
```

#### 6. Add Products (Extract from pip-datasets.json)

You can copy products from `pip-datasets.json` and adapt them:

```json
{
  "products": [
    {
      "productId": "dishwasher-001",
      "modelNumber": "SHPM88Z75N",
      "storeSkuNumber": "1234567",
      "brand": "Bosch",
      "title": "800 Series 24 in. Top Control Built-In Tall Tub Dishwasher",
      "shortDescription": "Crystal dry technology for brilliant shine and faster drying.",
      "price": {
        "current": 899.00,
        "original": 1099.00,
        "savings": 200.00,
        "savingsPercent": 18,
        "isOnSale": true,
        "seeInCart": false
      },
      "rating": {
        "average": 4.7,
        "count": 1543
      },
      "images": {
        "primary": "dishwasher-001-main.jpg",
        "alternate": "dishwasher-001-alt.jpg",
        "colorSwatches": [
          {
            "color": "Stainless Steel",
            "swatchUrl": "swatch-stainless.jpg",
            "variantId": "dishwasher-001-ss"
          }
        ]
      },
      "badges": [
        {
          "type": "exclusive",
          "label": "Exclusive"
        },
        {
          "type": "energyStar",
          "label": "ENERGY STAR"
        }
      ],
      "keyFeatures": [
        "CrystalDry technology",
        "Third rack for utensils",
        "44 dBA quiet operation",
        "Stainless steel tub"
      ],
      "availability": {
        "inStorePickup": true,
        "delivery": true,
        "shipToHome": true
      },
      "productUrl": "/product/dishwasher-001",
      "limitPerOrder": 5
    }
  ]
}
```

#### 7. Complete with Pagination and Parent
```json
{
  "pagination": {
    "currentPage": 1,
    "totalPages": 4,
    "itemsPerPage": 24,
    "startIndex": 0,
    "endIndex": 23
  },
  
  "parentCategory": {
    "categoryId": "appliances",
    "categoryName": "Appliances",
    "url": "/appliances",
    "department": "Appliances"
  }
}
```

---

## 🔄 Adapting Products from pip-datasets.json

If you have products in `pip-datasets.json`, you can adapt them to the category JSON format:

### From pip-datasets.json:
```json
{
  "productId": "300512529",
  "identifiers": {
    "modelNumber": "SHPM88Z75N",
    "storeSkuNumber": "1234567"
  },
  "brand": {
    "name": "Bosch"
  },
  "title": "800 Series Dishwasher",
  "pricing": {
    "currentPrice": 899.00,
    "originalPrice": 1099.00
  },
  "rating": {
    "average": 4.7,
    "count": 1543
  },
  "media": {
    "primaryImage": "https://images.thdstatic.com/.../product.jpg"
  }
}
```

### To Category JSON:
```json
{
  "productId": "300512529",
  "modelNumber": "SHPM88Z75N",
  "storeSkuNumber": "1234567",
  "brand": "Bosch",
  "title": "800 Series Dishwasher",
  "shortDescription": "Add a description here",
  "price": {
    "current": 899.00,
    "original": 1099.00,
    "savings": 200.00,
    "savingsPercent": 18,
    "isOnSale": true,
    "seeInCart": false
  },
  "rating": {
    "average": 4.7,
    "count": 1543
  },
  "images": {
    "primary": "product-image.jpg",
    "alternate": "product-alt.jpg",
    "colorSwatches": []
  },
  "badges": [],
  "keyFeatures": [],
  "availability": {
    "inStorePickup": true,
    "delivery": true,
    "shipToHome": true
  },
  "productUrl": "/product/300512529",
  "limitPerOrder": 10
}
```

---

## ✅ Validation Checklist

Before adding your JSON file to the project, verify:

- [ ] All required fields are present
- [ ] `pageInfo.categoryName` matches your category
- [ ] `breadcrumbs` has correct path
- [ ] `totalResults` matches product count
- [ ] `categoryStyles` has at least 2-4 styles
- [ ] Each style has valid image path
- [ ] `products` array has at least 5-10 products
- [ ] All product images are available
- [ ] `categoryId` and filenames match
- [ ] JSON is valid (use JSONLint.com)

---

## 🎯 Category-Specific Tips

### Dishwashers
Focus on:
- Width (24", 18")
- Tub material (Stainless, Plastic)
- Noise level (dBA)
- Third rack feature
- Smart connectivity

### Washing Machines
Focus on:
- Type (Front load, Top load)
- Capacity (cu. ft.)
- Energy efficiency
- Steam cycle
- Smart features

### Dryers
Focus on:
- Fuel type (Electric, Gas)
- Capacity (cu. ft.)
- Ventless option
- Steam cycle
- Smart connectivity

### Ranges
Focus on:
- Fuel type (Gas, Electric, Dual fuel)
- Width (30", 36", 48")
- Oven type (Single, Double)
- Convection option
- Smart features

---

## 🚀 Quick Start Commands

### 1. Copy Template
```bash
cp json-template.json dishwashers.json
```

### 2. Edit File
```bash
# Use your favorite editor
nano dishwashers.json
# or
code dishwashers.json
```

### 3. Validate JSON
```bash
# Online: https://jsonlint.com
# Or use Python:
python -m json.tool dishwashers.json
```

### 4. Add to Xcode
- Drag file into project
- Check "Copy items if needed"
- Verify target membership

### 5. Test
- Run app
- Navigate to category
- Check console for success messages

---

## 📊 Field Reference Quick Guide

| Field | Required | Purpose | Example |
|-------|----------|---------|---------|
| `pageInfo.categoryId` | ✅ | Unique ID | `"dishwashers"` |
| `pageInfo.categoryName` | ✅ | Display name | `"Dishwashers"` |
| `pageInfo.totalResults` | ✅ | Product count | `89` |
| `pageInfo.breadcrumbs` | ✅ | Navigation | `[{...}]` |
| `pageInfo.heroImage` | ❌ | Banner | `{promoText: "..."}` |
| `featuredBrands` | ❌ | Brand section | `[{brandId: "..."}]` |
| `quickFilters` | ❌ | Quick chips | `[{label: "..."}]` |
| `filters` | ✅ | Main filters | `[{filterGroupName: "..."}]` |
| `categoryStyles` | ✅ | Style pills | `[{styleName: "..."}]` |
| `products` | ✅ | Product list | `[{productId: "..."}]` |

---

## 🎉 You're Ready!

With this guide, you can create JSON files for any category. Start with the minimal template, add data incrementally, and test frequently.

**Pro tip:** Start with just 2-3 products to test, then add more once everything works!
