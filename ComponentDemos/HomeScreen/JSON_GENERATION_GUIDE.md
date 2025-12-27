# JSON Files Generation Guide

## 🎯 Purpose

This guide shows you exactly how to create category-specific JSON files from your existing `pip-datasets.json` data.

## 📊 Current Data Structure

Your `pip-datasets.json` contains products with breadcrumb navigation:

```json
{
  "pipDatasets": [
    {
      "productId": "123",
      "brand": {"name": "DEWALT"},
      "title": "20V MAX Cordless Drill",
      "breadcrumbs": [
        {"label": "Home", "url": "/"},
        {"label": "Tools", "url": "/tools"},
        {"label": "Power Tools", "url": "/tools/power-tools"},
        {"label": "Drills", "url": "/tools/power-tools/drills"}
      ],
      "pricing": {...},
      "media": {...}
    }
  ]
}
```

## 🔨 Step-by-Step: Create Category JSON Files

### Example: Power Drills

#### Step 1: Filter Products by Breadcrumb

From `pip-datasets.json`, find all products where breadcrumbs contain "Drill":

```javascript
// Pseudo-code for filtering
const powerDrillProducts = pipDatasets.pipDatasets.filter(product => 
  product.breadcrumbs.some(breadcrumb => 
    breadcrumb.label.toLowerCase().includes('drill')
  )
);
```

#### Step 2: Create Category JSON Structure

Create `power-drills.json`:

```json
{
  "pageInfo": {
    "categoryId": "power-drills",
    "categoryName": "Power Drills",
    "categorySlug": "power-drills",
    "breadcrumbs": [
      {"label": "Home", "url": "/"},
      {"label": "Tools", "url": "/tools"},
      {"label": "Power Drills", "url": "/tools/power-drills"}
    ],
    "totalResults": 24,
    "heroImage": {
      "url": "hero-drills.jpg",
      "alt": "Power Drills",
      "promoText": "Save up to 40% on select drills"
    },
    "seoDescription": "Shop our selection of power drills from top brands like DEWALT, Milwaukee, and Makita."
  },
  
  "featuredBrands": [
    {
      "brandId": "dewalt",
      "brandName": "DEWALT",
      "logoUrl": "dewalt-logo.png",
      "filterUrl": "/power-drills?brand=dewalt"
    },
    {
      "brandId": "milwaukee",
      "brandName": "Milwaukee",
      "logoUrl": "milwaukee-logo.png",
      "filterUrl": "/power-drills?brand=milwaukee"
    }
  ],
  
  "quickFilters": [
    {
      "filterId": "cordless",
      "label": "Cordless",
      "imageUrl": "cordless-icon.png",
      "filterUrl": "/power-drills?type=cordless"
    },
    {
      "filterId": "corded",
      "label": "Corded",
      "imageUrl": "corded-icon.png",
      "filterUrl": "/power-drills?type=corded"
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
          "count": 18,
          "filterUrl": "/power-drills?power=cordless"
        },
        {
          "optionId": "corded",
          "label": "Corded",
          "value": "corded",
          "count": 6,
          "filterUrl": "/power-drills?power=corded"
        }
      ]
    },
    {
      "filterGroupId": "brand",
      "filterGroupName": "Brand",
      "filterType": "checkbox",
      "options": [
        {
          "optionId": "dewalt",
          "label": "DEWALT",
          "value": "dewalt",
          "count": 12,
          "filterUrl": "/power-drills?brand=dewalt"
        }
      ]
    },
    {
      "filterGroupId": "price",
      "filterGroupName": "Price",
      "filterType": "range",
      "options": [
        {
          "optionId": "under-100",
          "label": "Under $100",
          "value": "0-100",
          "count": 8
        },
        {
          "optionId": "100-200",
          "label": "$100 - $200",
          "value": "100-200",
          "count": 10
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
    },
    {
      "sortId": "price-high-low",
      "label": "Price: High to Low",
      "isDefault": false
    }
  ],
  
  "categoryStyles": [
    {
      "styleId": "cordless",
      "styleName": "Cordless\nDrills",
      "description": "Battery-powered drills for maximum portability",
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
  
  "products": [
    // Copy filtered products from pip-datasets.json
    // Transform from PIPDataset format to simplified format:
    {
      "productId": "drill-001",
      "modelNumber": "DCD771C2",
      "storeSkuNumber": "1234567",
      "brand": "DEWALT",
      "title": "20V MAX Cordless Drill/Driver Kit",
      "shortDescription": "Compact, lightweight design fits into tight areas",
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
        "High-speed transmission delivers 2 speeds",
        "Compact, lightweight design"
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
    "totalPages": 1,
    "itemsPerPage": 24,
    "startIndex": 0,
    "endIndex": 23
  },
  
  "parentCategory": {
    "categoryId": "tools",
    "categoryName": "Tools",
    "url": "/tools",
    "department": "Tools & Hardware"
  }
}
```

## 📋 Required JSON Files by Department

### Appliances Department

#### 1. `french-door-refrigerators.json`
✅ **Already exists!**

#### 2. `dishwashers.json`
- Filter: `breadcrumbs.label.includes("Dishwasher")`
- Style pills: Built-In, Portable, Drawer, Panel Ready
- Typical count: ~15-20 products

#### 3. `washing-machines.json`
- Filter: `breadcrumbs.label.includes("Washer") && !includes("Dishwasher")`
- Style pills: Front Load, Top Load, All-in-One
- Typical count: ~15-20 products

#### 4. `dryers.json`
- Filter: `breadcrumbs.label.includes("Dryer")`
- Style pills: Electric, Gas, Ventless
- Typical count: ~15-20 products

#### 5. `ranges.json`
- Filter: `breadcrumbs.label.includes("Range") || includes("Stove")`
- Style pills: Gas, Electric, Dual Fuel, Induction
- Typical count: ~15-20 products

### Tools Department

#### 6. `power-drills.json`
- Filter: `breadcrumbs.label.includes("Drill")`
- Style pills: Cordless, Corded, Hammer, Impact
- Typical count: ~20-30 products

#### 7. `power-saws.json`
- Filter: `breadcrumbs.label.includes("Saw")`
- Style pills: Circular, Miter, Table, Jig, Reciprocating
- Typical count: ~20-30 products

#### 8. `sanders.json`
- Filter: `breadcrumbs.label.includes("Sander")`
- Style pills: Orbital, Belt, Detail, Palm
- Typical count: ~10-15 products

## 🔄 Conversion Script Template

Here's a Node.js script to help automate the process:

```javascript
const fs = require('fs');

// Load pip-datasets.json
const pipData = JSON.parse(fs.readFileSync('pip-datasets.json', 'utf8'));

// Function to create category JSON
function createCategoryJSON(config) {
  const {
    categoryId,
    categoryName,
    breadcrumbFilter,
    styleConfigs,
    outputFilename
  } = config;
  
  // Filter products
  const products = pipData.pipDatasets.filter(product => 
    product.breadcrumbs.some(breadcrumb => 
      breadcrumb.label.toLowerCase().includes(breadcrumbFilter.toLowerCase())
    )
  );
  
  // Extract unique brands
  const brands = [...new Set(products.map(p => p.brand.name))].map(brandName => ({
    brandId: brandName.toLowerCase().replace(/\s+/g, '-'),
    brandName: brandName,
    logoUrl: `${brandName.toLowerCase()}-logo.png`,
    filterUrl: `/${categoryId}?brand=${brandName.toLowerCase()}`
  }));
  
  // Create category JSON structure
  const categoryJSON = {
    pageInfo: {
      categoryId,
      categoryName,
      categorySlug: categoryId,
      breadcrumbs: [
        { label: "Home", url: "/" },
        { label: categoryName, url: `/${categoryId}` }
      ],
      totalResults: products.length,
      heroImage: {
        url: `hero-${categoryId}.jpg`,
        alt: categoryName,
        promoText: `Shop our selection of ${categoryName.toLowerCase()}`
      },
      seoDescription: `Browse ${products.length} ${categoryName.toLowerCase()} from top brands.`
    },
    featuredBrands: brands.slice(0, 5),
    quickFilters: [],
    filters: [
      {
        filterGroupId: "brand",
        filterGroupName: "Brand",
        filterType: "checkbox",
        options: brands.map(brand => ({
          optionId: brand.brandId,
          label: brand.brandName,
          value: brand.brandId,
          count: products.filter(p => p.brand.name === brand.brandName).length,
          filterUrl: brand.filterUrl
        }))
      },
      {
        filterGroupId: "price",
        filterGroupName: "Price",
        filterType: "range",
        options: [
          { optionId: "under-100", label: "Under $100", value: "0-100", count: 0 },
          { optionId: "100-500", label: "$100 - $500", value: "100-500", count: 0 },
          { optionId: "500-1000", label: "$500 - $1,000", value: "500-1000", count: 0 },
          { optionId: "over-1000", label: "Over $1,000", value: "1000-999999", count: 0 }
        ]
      }
    ],
    sortOptions: [
      { sortId: "top-rated", label: "Top Rated", isDefault: true },
      { sortId: "price-low-high", label: "Price: Low to High", isDefault: false },
      { sortId: "price-high-low", label: "Price: High to Low", isDefault: false }
    ],
    categoryStyles: styleConfigs.map((style, index) => ({
      styleId: style.id,
      styleName: style.name,
      description: style.description,
      productId: products[index]?.productId || "",
      image: `images/${categoryId}-${style.id}.jpg`,
      url: `/${categoryId}?type=${style.id}`,
      isCurrentCategory: index === 0
    })),
    products: products.map(p => ({
      productId: p.productId,
      modelNumber: p.identifiers.modelNumber,
      storeSkuNumber: p.identifiers.storeSkuNumber,
      brand: p.brand.name,
      title: p.title,
      shortDescription: p.shortDescription || "",
      price: {
        current: p.pricing.currentPrice,
        original: p.pricing.originalPrice,
        savings: p.pricing.savings,
        savingsPercent: p.pricing.savingsPercent,
        isOnSale: p.pricing.isOnSale,
        seeInCart: p.pricing.seeInCart
      },
      rating: {
        average: p.rating.average,
        count: p.rating.count
      },
      images: {
        primary: p.media.primaryImage,
        alternate: p.media.images[1]?.url || null,
        colorSwatches: p.variants
          .filter(v => v.swatchUrl)
          .map(v => ({
            color: v.variantValue,
            swatchUrl: v.swatchUrl,
            variantId: v.variantId
          }))
      },
      badges: p.badges.map(b => ({
        type: b.badgeType,
        label: b.text
      })),
      keyFeatures: p.keyFeatures,
      availability: {
        inStorePickup: p.availability.inStorePickup.available,
        delivery: p.availability.delivery.available,
        shipToHome: p.availability.shipToHome.available
      },
      limitPerOrder: 10
    })),
    pagination: {
      currentPage: 1,
      totalPages: Math.ceil(products.length / 24),
      itemsPerPage: 24,
      startIndex: 0,
      endIndex: Math.min(23, products.length - 1)
    },
    parentCategory: null
  };
  
  // Write to file
  fs.writeFileSync(
    outputFilename,
    JSON.stringify(categoryJSON, null, 2),
    'utf8'
  );
  
  console.log(`✅ Created ${outputFilename} with ${products.length} products`);
}

// Generate all category files
const categories = [
  {
    categoryId: 'power-drills',
    categoryName: 'Power Drills',
    breadcrumbFilter: 'Drill',
    styleConfigs: [
      { id: 'cordless', name: 'Cordless\nDrills', description: 'Battery-powered' },
      { id: 'corded', name: 'Corded\nDrills', description: 'Plug-in power' },
      { id: 'hammer', name: 'Hammer\nDrills', description: 'For masonry' }
    ],
    outputFilename: 'power-drills.json'
  },
  {
    categoryId: 'power-saws',
    categoryName: 'Power Saws',
    breadcrumbFilter: 'Saw',
    styleConfigs: [
      { id: 'circular', name: 'Circular\nSaws', description: 'Versatile cutting' },
      { id: 'miter', name: 'Miter\nSaws', description: 'Precision angles' },
      { id: 'table', name: 'Table\nSaws', description: 'Professional work' }
    ],
    outputFilename: 'power-saws.json'
  }
  // Add more categories...
];

// Generate all files
categories.forEach(createCategoryJSON);

console.log('🎉 All category JSON files created!');
```

## 🎨 Style Pills Image Mapping

For each category, create style pill images:

### Power Drills
- `images/power-drills-cordless.jpg` - Photo of cordless drill
- `images/power-drills-corded.jpg` - Photo of corded drill
- `images/power-drills-hammer.jpg` - Photo of hammer drill

### Power Saws
- `images/power-saws-circular.jpg` - Photo of circular saw
- `images/power-saws-miter.jpg` - Photo of miter saw
- `images/power-saws-table.jpg` - Photo of table saw

**Pro Tip**: Use actual product images from your `media.primaryImage` URLs!

## ✅ Validation Checklist

For each JSON file created:

- [ ] `pageInfo.breadcrumbs` is correct
- [ ] `pageInfo.totalResults` matches products array length
- [ ] `featuredBrands` contains top 3-5 brands
- [ ] `categoryStyles` has 3-5 style options
- [ ] `categoryStyles[].image` paths are correct
- [ ] `filters` include Brand and Price at minimum
- [ ] `products` array is not empty
- [ ] All product `images.primary` paths are valid
- [ ] `pagination.totalPages` is calculated correctly

## 🚀 Quick Start

1. Copy the conversion script above
2. Update the `categories` array with your desired categories
3. Run: `node generate-category-json.js`
4. Add generated JSON files to Xcode project
5. Verify images are available at specified paths
6. Test in app!

## 📊 Expected Results

After generating all JSON files:

```
Data/
  ├── pip-datasets.json (original)
  ├── french-door-refrigerators.json ✅
  ├── dishwashers.json 🆕
  ├── washing-machines.json 🆕
  ├── dryers.json 🆕
  ├── ranges.json 🆕
  ├── power-drills.json 🆕
  ├── power-saws.json 🆕
  └── sanders.json 🆕
```

Each file will provide:
- Curated product list
- Real product images in style pills
- Category-specific filters
- Featured brands
- Hero banners
- Breadcrumb navigation

This enhances the user experience while maintaining backward compatibility with the pip-datasets.json fallback!
