# Multi-Level Navigation Flow Diagram

```
┌─────────────────────────────────────────────────────────────────┐
│                     USER TAPS "SHOP" TAB                        │
└───────────────────────────────┬─────────────────────────────────┘
                                │
                                ▼
┌─────────────────────────────────────────────────────────────────┐
│               📱 LEVEL 1: DEPARTMENTS LIST                       │
│─────────────────────────────────────────────────────────────────│
│  Shop All Departments                               [X] Close   │
│                                                                  │
│  🏠 Appliances                                  [8] →           │
│  ─────────────────────────────────────────────────────          │
│  🔧 Tools                                       [8] →           │
│  ─────────────────────────────────────────────────────          │
│  🎨 Paint                                       [5] →           │
│  ─────────────────────────────────────────────────────          │
│  🪛 Hardware                                    [6] →           │
│                                                                  │
│  Data Source: ShopDepartment enum (hardcoded)                   │
│  Navigation: NavigationStack.append(department)                 │
└───────────────────────────────┬─────────────────────────────────┘
                                │
                    User taps "Tools" [8] →
                                │
                                ▼
┌─────────────────────────────────────────────────────────────────┐
│            📱 LEVEL 2: SUBCATEGORIES GRID                        │
│─────────────────────────────────────────────────────────────────│
│  ← Back    🔧 Tools                              [X] Close       │
│            8 Categories                                          │
│                                                                  │
│  ╔════════════════════════════════════════════════════════╗     │
│  ║  🔧 Shop All Tools                              →     ║     │
│  ╚════════════════════════════════════════════════════════╝     │
│                                                                  │
│  Grid Layout (2 columns):                                       │
│  ┌──────────────┐  ┌──────────────┐                            │
│  │     🪛       │  │     ⚡       │                            │
│  │  Power Drills│  │  Power Saws  │                            │
│  │  • Available │  │  • Available │                            │
│  └──────────────┘  └──────────────┘                            │
│  ┌──────────────┐  ┌──────────────┐                            │
│  │     ⚙️       │  │     🔨       │                            │
│  │   Sanders    │  │  Hand Tools  │                            │
│  │  • Available │  │              │                            │
│  └──────────────┘  └──────────────┘                            │
│                                                                  │
│  Data Source: department.subcategories                          │
│  Badge Logic: subcategory.plpCategory != nil                    │
│  Navigation: NavigationStack.append(subcategory)                │
└───────────────────────────────┬─────────────────────────────────┘
                                │
                User taps "Power Drills" card
                                │
                                ▼
┌─────────────────────────────────────────────────────────────────┐
│            📱 LEVEL 3: PRODUCT LISTING PAGE (PLP)                │
│─────────────────────────────────────────────────────────────────│
│  ← Power Drills                                  [X] Close       │
│                                                                  │
│  Breadcrumbs:                                                    │
│  Home > Tools > Power Drills                                     │
│                                                                  │
│  ┌────────────────────────────────────────────────────────┐     │
│  │  💰 Save up to 40% on select drills!                  │     │
│  └────────────────────────────────────────────────────────┘     │
│                                                                  │
│  Featured Brands:                                                │
│  [DEWALT] [Milwaukee] [Makita] [Ryobi] →                       │
│                                                                  │
│  POWER DRILLS                                                    │
│  ┌─────────┐ ┌─────────┐ ┌─────────┐                          │
│  │Cordless │ │ Corded  │ │ Hammer  │  ← Style Pills            │
│  │ Drills  │ │ Drills  │ │ Drills  │  (from JSON)              │
│  └─────────┘ └─────────┘ └─────────┘                          │
│                                                                  │
│  156 Results                                                     │
│                                                                  │
│  🔍 All Filters   Brand   Price   Features  ← Filter Pills      │
│                                               (from JSON)        │
│  ─────────────────────────────────────────────────────          │
│                                                                  │
│  Product Grid:                                                   │
│  ┌──────────────────────────────────────────────┐               │
│  │ [Image]  DEWALT 20V MAX Cordless Drill       │               │
│  │          ⭐⭐⭐⭐⭐ 4.7 (1,234)               │               │
│  │          $99.00  Was: $129.00                │               │
│  │          💚 Pick up Today                     │               │
│  │          [Add to Cart]                       │               │
│  └──────────────────────────────────────────────┘               │
│  ┌──────────────────────────────────────────────┐               │
│  │ [Image]  Milwaukee M18 Drill/Driver          │               │
│  │          ⭐⭐⭐⭐⭐ 4.8 (956)                 │               │
│  │          $149.00                             │               │
│  │          🚚 Free Delivery                     │               │
│  │          [Add to Cart]                       │               │
│  └──────────────────────────────────────────────┘               │
│                                                                  │
│  Data Source Priority:                                           │
│  1️⃣ power-drills.json (if exists)                              │
│     ├─ Breadcrumbs from pageInfo.breadcrumbs                   │
│     ├─ Hero from pageInfo.heroImage                            │
│     ├─ Brands from featuredBrands                              │
│     ├─ Style pills from categoryStyles                         │
│     ├─ Filters from filters array                              │
│     └─ Products from products array                            │
│  2️⃣ pip-datasets.json (fallback)                               │
│     ├─ Filter by breadcrumb "Drill"                            │
│     ├─ No hero banner                                          │
│     ├─ No featured brands                                      │
│     ├─ Style pills use SF Symbols                              │
│     └─ Products from filtered results                          │
│                                                                  │
│  Navigation: Ready for product detail (future)                  │
└───────────────────────────────┬─────────────────────────────────┘
                                │
                        (Future: Tap product)
                                │
                                ▼
┌─────────────────────────────────────────────────────────────────┐
│               📱 LEVEL 4: PRODUCT DETAIL (FUTURE)                │
│─────────────────────────────────────────────────────────────────│
│  ← Back to Power Drills                         [X] Close       │
│                                                                  │
│  [Product Image Gallery]                                         │
│  DEWALT 20V MAX Cordless Drill                                  │
│  Model: DCD771C2                                                │
│  ⭐⭐⭐⭐⭐ 4.7 (1,234 reviews)                                 │
│                                                                  │
│  $99.00  Was: $129.00 (Save $30)                                │
│                                                                  │
│  [Add to Cart]  [Add to List]                                   │
│                                                                  │
│  Key Features:                                                   │
│  • 20V MAX Lithium-Ion battery                                  │
│  • High-speed transmission                                      │
│  • Compact, lightweight design                                  │
│                                                                  │
│  Navigation: Back to PLP or close shop navigation               │
└─────────────────────────────────────────────────────────────────┘
```

## 🔄 Back Navigation Flow

```
LEVEL 4: Product Detail
    ↓ Tap back button
LEVEL 3: PLP (Power Drills)
    ↓ Tap back button
LEVEL 2: Subcategories (Tools)
    ↓ Tap back button
LEVEL 1: Departments
    ↓ Tap close button [X]
HOME SCREEN (Shop navigation dismissed)
```

## 💾 Data Flow Diagram

```
┌─────────────────────────────────────────────────────────────────┐
│                        DATA SOURCES                              │
└─────────────────────────────────────────────────────────────────┘

HARDCODED DATA (Swift enums):
    ShopDepartment enum (20 departments)
        ↓
    department.subcategories
        ↓
    ShopSubcategory.plpCategory

JSON DATA (Category-specific):
    power-drills.json
    ├─ pageInfo
    │   ├─ breadcrumbs → Breadcrumb view
    │   ├─ heroImage → Hero banner
    │   └─ totalResults → Results count
    ├─ featuredBrands → Brand chips
    ├─ categoryStyles → Style pills (with images!)
    ├─ filters → Filter pills
    └─ products → Product grid

FALLBACK DATA (Generic):
    pip-datasets.json
    ├─ Filter by breadcrumb
    ├─ Convert PIPDataset → Product
    └─ Use SF Symbols for style pills

LOADING STRATEGY:
    1. Try load category JSON (e.g., power-drills.json)
    2. If found: Use rich data with images
    3. If not found: Fall back to pip-datasets.json
    4. Filter by breadcrumb and display basic data
```

## 🎨 Visual Hierarchy

```
Typography Sizes:
    H2 Bold      → Department titles, main headers
    H3 Semibold  → Department names in list
    H4 Regular   → Subcategory names, section titles
    Body Md      → Descriptive text, counts
    Body Sm      → Filters, badges

Icon Sizes:
    28-32pt → Department icons (large)
    24-28pt → Subcategory card icons (medium)
    20pt    → Filter icons, action icons (small)

Spacing:
    Level 1: Generous padding, clear sections
    Level 2: Grid with cards, visual separation
    Level 3: Dense product grid, efficient use of space

Colors:
    Primary   → Headings, main text
    Secondary → Supporting text, counts
    Accent    → Selected items, CTAs (Brand300 orange)
    Success   → Available badges (green)
```

## 🔢 Component Count Summary

```
DEPARTMENTS: 20 total
├─ Appliances (8 subcategories)
│   ├─ Refrigerators ✅ PLP + JSON
│   ├─ Dishwashers ⏳ PLP ready
│   ├─ Washers ⏳ PLP ready
│   ├─ Dryers ⏳ PLP ready
│   ├─ Ranges ⏳ PLP ready
│   └─ ... (3 more)
│
├─ Tools (8 subcategories)
│   ├─ Power Drills ⏳ PLP ready
│   ├─ Power Saws ⏳ PLP ready
│   ├─ Sanders ⏳ PLP ready
│   └─ ... (5 more)
│
└─ ... (18 more departments)

TOTAL STRUCTURE:
    20 departments
    ~120 subcategories
    8 PLPs ready (needs JSON files)
    1 PLP complete (french-door-refrigerators)
```

## ⚙️ Technical Implementation

```swift
// NavigationStack path structure
NavigationPath {
    [ShopDepartment.tools]                    ← Level 1 → 2
        ↓
    [ShopDepartment.tools, powerDrillsSubcat] ← Level 2 → 3
        ↓
    [ShopDepartment.tools, powerDrillsSubcat, 
     Product("drill-123")]                    ← Level 3 → 4 (future)
}

// Navigation destinations
.navigationDestination(for: ShopDepartment.self) { dept in
    SubcategoriesView(department: dept)
}
.navigationDestination(for: ShopSubcategory.self) { subcat in
    EnhancedPLPView(category: subcat.plpCategory)
}

// Data loading priority
func loadProducts() {
    if let categoryData = load("power-drills.json") {
        // Use rich JSON data
        self.products = categoryData.products
        self.hero = categoryData.heroImage
        self.brands = categoryData.featuredBrands
    } else {
        // Fallback to pip-datasets
        self.products = filter(pipDatasets, by: breadcrumb)
    }
}
```

## 📊 State Management

```
EnhancedShopNavigationView State:
    @State navigationPath: NavigationPath
    @Binding isPresented: Bool

EnhancedPLPView State:
    @State products: [Product]
    @State categoryData: CategoryData?
    @State selectedStylePill: String?
    @State selectedFilterPills: Set<String>
    @State viewMode: PLPViewMode

Data Flow:
    User tap → Update navigationPath
             → SwiftUI pushes new view
             → New view loads data onAppear
             → UI updates automatically
```

## 🚀 Performance Optimization

```
LazyVStack/LazyVGrid:
    ✅ Only renders visible products
    ✅ Recycles views efficiently
    ✅ Handles large product lists

NavigationStack:
    ✅ Manages view hierarchy automatically
    ✅ Handles back button state
    ✅ Memory-efficient view loading

JSON Loading:
    ✅ Small category files (~50-200KB)
    ✅ Cached after first load
    ✅ Fallback ensures always works
```

---

This diagram shows the complete navigation flow from departments to products, with all data sources, back navigation, and future expansion points clearly mapped out! 🎉
