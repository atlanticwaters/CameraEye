# THD Design System App - Feature Overview

## 📱 App Structure

### Main Navigation Tabs

The app features a native iOS bottom tab bar with four main sections:

#### 🏠 Home Tab
**Purpose:** Main landing page with hero sections and promotional content

**Key Components:**
- `HomeScreenScrollableContent` - Scrollable home page content
- `MorphingNavHeader` - Dynamic navigation header with morphing transitions
- Product carousels and featured categories
- Hero sections with promotional banners

**Features:**
- Morphing navigation header that transforms based on scroll position
- Smooth scroll transitions with soft edge effects
- Dynamic Island awareness for proper spacing

---

#### 🛍️ Shop Tab
**Purpose:** Dynamic department navigation with morphing menu

**Key Components:**
- `ShopNavigationView` - Main shop navigation container
- `MorphingShopMenu` - State-driven morphing menu system
- `ShopDepartment` - 20 main departments (Appliances, Tools, Bath, etc.)
- `ShopSubcategory` - Subcategories linked to product listings

**Features:**
- **Morphing Menu States:**
  - Collapsed: Shows department grid
  - Department Selected: Shows subcategories
  - Navigation to PLP: Transitions to product listings
- **iOS 26-inspired transitions** using `matchedGeometryEffect`
- **Glass material effects** for modern aesthetic
- **Back navigation** with smooth state reversals
- **Slides in from right** when Shop tab is tapped

**Departments Include:**
- Appliances, Bath, Building Materials, Cleaning
- Decor & Furniture, Doors & Windows, Electrical, Flooring
- Hardware, Heating & Cooling, Kitchen, Lawn & Garden
- Lighting, Outdoor Living, Paint, Plumbing
- Storage & Organization, Tools, and more

---

#### 📚 Catalog Tab
**Purpose:** Browse and explore all design system components

**Key Components:**
- `ComponentCatalogView` - Master catalog navigation
- `ComponentCatalogScrollableContent` - Scrollable component list
- `ComponentSection` - Grouped component categories
- `ComponentRow` - Individual component list items

**Features:**
- **9+ Interactive Component Demos:**
  1. **Button** - Orange filled, outlined, ghost, icon variants
  2. **Card** - Content cards, mini product cards, layouts
  3. **Product Card** - B2C/B2B variants, badges, swatches, ratings
  4. **Badge** - Outline, filled subtle/strong, indicator variants
  5. **Alert** - Informational, success, warning, error states
  6. **Callout** - Neutral, inverse, brand promotional callouts
  7. **Pill** - Outlined, filled, with icons for filters
  8. **Tile** - Outlined, filled, ghost selection tiles
  9. **Quantity Picker** - Orange/grey expandable quantity selectors

- **Design System Foundations:**
  - **Typography Demo** - Display font, informational font, heroes, body text
  - **Design Tokens** - Complete reference: colors, spacing, borders, elevation

- **Navigation:**
  - Deep linking to component detail views
  - Back navigation with morphing header
  - Smooth scroll transitions

---

#### 🛒 Cart Tab
**Purpose:** Shopping cart and app guide access

**Key Components:**
- Cart placeholder (coming soon)
- `AppFeatureInterstitialView` - Comprehensive app guide

**Features:**
- **"View App Guide" button** - Opens the feature interstitial
- Access to complete app documentation
- Coming soon: Shopping cart and checkout flow

---

## 🎨 Design System Components

### Action Components

#### DSButton
**File:** `DSButton.swift`

**Variants:**
- Primary (Orange Filled)
- Secondary (Outlined)
- Ghost (Transparent)
- Icon Button

**Features:**
- Multiple sizes (small, medium, large)
- Loading states
- Disabled states
- Custom icon support

---

### Display Components

#### DSCard
**File:** `DSCard.swift`

**Variants:**
- Content Card
- Mini Product Card
- Horizontal layout
- Vertical layout

**Features:**
- Flexible content containers
- Image support
- Badge overlays
- Action buttons

---

#### DSProductCard
**File:** `DSProductCard.swift`

**Variants:**
- B2C (Business to Consumer)
- B2B (Business to Business)
- With badges (New, Sale, Limited)
- With color swatches
- With ratings

**Features:**
- Product image display
- Brand and title
- Model numbers
- Pricing (standard, range, contact store)
- Star ratings with counts
- Stock availability
- Pickup and delivery info
- Swipe actions
- Add to cart button

---

#### DSPlpPodDetails
**File:** `DSPlpPodDetailsView.swift`

**Purpose:** Product information display for listing pages

**Features:**
- Brand and title display
- Model number
- Price variations (standard, range, "contact store")
- Star ratings (0.0 - 5.0)
- Review counts
- Stock availability indicators
- Pickup eligibility
- Delivery information
- "At Your Store" badge with stock count

**Text Styling:**
- Brand: Body Sm (14pt, Bold)
- Title: Body Sm (14pt, Regular)
- Model: Body XS (12pt)
- Price: Body Md (16pt, Bold)
- Rating: Body XS (12pt)
- Star size: 16pt × 16pt

---

#### DSBadge
**File:** `DSBadge.swift`

**Variants:**
- Outline
- Filled Subtle
- Filled Strong
- Indicator (dot only)

**Colors:**
- Brand (Orange)
- Success (Green)
- Warning (Yellow)
- Error (Red)
- Info (Blue)
- Neutral (Grey)

**Sizes:**
- Small
- Medium
- Large

---

#### DSAlert
**File:** `DSAlert.swift`

**States:**
- Informational (Blue)
- Success (Green)
- Warning (Yellow)
- Error (Red)

**Features:**
- Icon support
- Dismissible variants
- Custom actions
- Multi-line text support

---

#### DSCallout
**File:** Not yet viewed, but referenced in catalog

**Variants:**
- Neutral
- Inverse
- Brand

**Purpose:** Promotional and informational callouts

---

### Selection Components

#### DSPill
**File:** Not yet viewed, but referenced in catalog

**Variants:**
- Outlined
- Filled
- With icons

**Purpose:** Selectable chips for filters and tags

---

#### DSTile
**File:** Not yet viewed, but referenced in catalog

**Variants:**
- Outlined
- Filled
- Ghost

**Purpose:** Selectable tiles for options and attributes

---

### Input Components

#### DSQuantityPicker
**File:** Not yet viewed, but referenced in catalog

**Variants:**
- Orange theme
- Grey theme
- Standalone buttons

**Features:**
- Expandable/collapsible states
- Min/max value constraints
- Stepper controls

---

## 🎯 Product List Pages (PLP)

### PLPView
**File:** `PLPView.swift` (1523 lines)

**Purpose:** Complete product browsing experience

**Key Features:**

#### View Modes
- **Grid View** - 2-column product grid
- **List View** - Single-column detailed list

#### Filtering System
- Multi-select filter options
- Category filters
- Price range filters
- Brand filters
- Rating filters
- Apply/Clear all actions

#### Sorting Options
- Best Match
- Price: Low to High
- Price: High to Low
- Top Rated
- Most Reviewed
- Newest

#### Product Categories
Extensive category support including:
- Power Tools (Drills, Saws, Sanders, Grinders, Nailers)
- Hand Tools (Screwdrivers, Hammers, Wrenches, Pliers)
- Appliances (Refrigerators, Dishwashers, Washers, Dryers)
- Paint (Interior, Exterior, Primers, Stains)
- Lighting (Ceiling, Outdoor, LED Bulbs, Chandeliers)
- Plumbing (Faucets, Toilets, Showers, Pipes)
- And many more...

#### Components
- Product pods with images
- Star ratings
- Pricing display
- Stock indicators
- Quick view actions
- Pagination controls

---

## 🎨 Design System Foundations

### DesignSystemGlobal
**Purpose:** Central token system for consistent styling

**Token Categories:**

#### Colors

**Brand Colors:**
- `Brand050` - `Brand900` (Orange scale)
- Primary: `Brand300` (#F96302)

**Neutral Colors:**
- `Greige050` - `Greige900` (Neutral scale)
- `Moonlight050` - `Moonlight900` (Cool neutrals)

**Semantic Colors:**
- `BottleGreen` (Success states)
- `Lemon` (Warning states)
- `Cinnabar` (Error states)

**Contextual Colors:**
- `TextOnContainerColorPrimary`
- `TextOnContainerColorSecondary`
- `TextOnContainerColorTertiary`
- `BackgroundContainerColorWhite`
- `BackgroundContainerColorGreige`
- `BackgroundSurfaceColorGreige`
- `IconOnContainerColorInactive`

---

#### Typography

**Font Families:**
- Display Font (Headlines, Heroes)
- Informational Font (Body text, UI)

**Text Styles:**
- `hero1` - `hero5` (Display sizes)
- `h1` - `h6` (Heading sizes)
- `bodyXl`, `bodyLg`, `bodyMd`, `bodySm`, `bodyXs`
- `caption`

**Font Modifier:**
```swift
Text("Hello")
    .thdFont(.bodyMd)
```

---

#### Spacing

**Token Scale:**
- `Spacing0`: 0pt
- `Spacing1`: 4pt
- `Spacing2`: 8pt
- `Spacing3`: 12pt
- `Spacing4`: 16pt
- `Spacing5`: 24pt
- `Spacing6`: 32pt
- `Spacing7`: 40pt
- `Spacing8`: 48pt

---

#### Border Radius

**Token Scale:**
- `BorderRadiusSm`: 4pt
- `BorderRadiusMd`: 8pt
- `BorderRadiusLg`: 12pt
- `BorderRadiusXl`: 16pt
- `BorderRadius2Xl`: 20pt

---

#### Elevation (Shadows)

**Levels:**
- `ElevationLevel1`: Light shadow
- `ElevationLevel2`: Medium shadow
- `ElevationLevel3`: Heavy shadow

---

## 🎬 Advanced Features

### Morphing Navigation

**Implementation Files:**
- `MorphingNavHeader` - Header component
- `ShopNavigation.swift` - Shop menu states

**Key Techniques:**
- `matchedGeometryEffect` for smooth transitions
- State-driven animations
- Namespace coordination
- Glass material effects

**States:**
1. **Collapsed** - Minimal header
2. **Expanded** - Full navigation visible
3. **Department View** - Department grid
4. **Subcategory View** - Subcategory list
5. **PLP Transition** - Navigation to products

---

### Scroll Transitions

**Custom View Modifiers:**
```swift
.scrollTransition(.interactive) { content, phase in
    content
        .scaleEffect(phase.isIdentity ? 1.0 : 0.95)
        .opacity(phase.isIdentity ? 1.0 : 0.5)
}
```

**Edge Effects:**
```swift
.scrollEdgeEffectStyle(.soft, for: .top)
.scrollEdgeEffectStyle(.soft, for: .bottom)
```

---

### Safe Area Management

**Custom Extension:**
```swift
.safeAreaBar(edge: .top, spacing: 12) {
    MorphingNavHeader(showBackButton: false)
}
```

**Features:**
- Dynamic Island awareness
- Proper spacing calculations
- Content overlay without blocking

---

## 🌓 Dark Mode Support

**Implementation:**
- Semantic color tokens adapt automatically
- `TokensSemanticLight` and `TokensSemanticDark`
- Environment-based color resolution
- All components support both modes

**Usage:**
```swift
@Environment(\.colorScheme) var colorScheme

private var tokens: any TokenSemanticProtocol.Type {
    colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
}
```

---

## 📦 Component Catalog Details

### Navigation Structure
- **Root:** `ComponentCatalogView`
- **Content:** `ComponentCatalogScrollableContent`
- **Sections:** Grouped by type (Actions, Display, Selection, Input, Design System)
- **Detail Views:** Individual component showcases

### Each Component Demo Includes:
1. **Complete Examples** - Full feature sets
2. **Variations** - Different styles and states
3. **Usage Examples** - Real-world patterns
4. **Specifications** - Typography, colors, spacing
5. **Code Samples** - Implementation examples
6. **Interactive Previews** - Live component interaction

---

## 🎪 Interactive Features

### Product Interaction
- **Tap** - View product details
- **Swipe** - Quick actions
- **Star Ratings** - Visual feedback
- **Add to Cart** - Primary actions

### Filter & Sort
- **Multi-select filters** - Combine multiple criteria
- **Dynamic filtering** - Real-time results
- **Clear all** - Reset filters
- **Persistent state** - Maintains selection

### View Toggle
- **Grid/List switch** - Different browsing modes
- **Smooth transitions** - Animated layout changes
- **State preservation** - Remembers preference

### Navigation Morphing
- **Back navigation** - Reverses state transitions
- **Smooth animations** - Spring-based physics
- **State tracking** - Breadcrumb awareness

---

## 🚀 App Launch Experience

### First Launch
1. App loads with `SplashScreenView`
2. Transitions to `MainAppNavigationView`
3. After 0.5s delay, shows `AppFeatureInterstitialView`
4. User explores guided tour
5. Dismisses to begin using app

### Subsequent Launches
- Directly to last used tab
- No interstitial shown (stored in `@AppStorage`)
- Can manually open from Cart tab "View App Guide" button

---

## 📝 File Structure

### Main Navigation
- `BottomTabBar_iOS.swift` - Tab bar and app navigation
- `MainAppNavigationView` - Root navigation container

### Shop System
- `ShopNavigation.swift` - Department/subcategory navigation
- `MorphingShopMenu` - Dynamic menu states
- `ShopDepartment` & `ShopSubcategory` - Data models

### Product Listing
- `PLPView.swift` - Product list page implementation
- `PLPCategory` - Category definitions
- `DSPlpPodDetails` - Product pod component
- `DSPlpPodDetailsView.swift` - Component showcase

### Component Catalog
- `ComponentCatalogView.swift` - Catalog navigation
- `DSButton.swift`, `DSCard.swift`, etc. - Individual components
- Component showcase views (`DSButtonView`, etc.)

### Design System
- `DesignSystemGlobal.swift` - Token definitions
- `TokensSemanticLight.swift` - Light mode colors
- `TokensSemanticDark.swift` - Dark mode colors
- `TokensSpacing.swift` - Spacing scale
- Typography extensions

### Guides & Documentation
- `NAVIGATION_README.md` - Navigation patterns
- `IMAGE_LOADING_TROUBLESHOOTING_GUIDE.md` - Image handling
- `IMPLEMENTATION_SUMMARY.md` - Implementation details
- `ENHANCED_SHOP_NAVIGATION.md` - Shop menu documentation
- **APP_FEATURES_GUIDE.md** (this file) - Complete feature reference

---

## 🎯 Key User Flows

### Browse Products
1. Tap **Shop** tab
2. Shop menu morphs in from right
3. Select department (e.g., "Tools")
4. View subcategories
5. Tap subcategory (e.g., "Power Drills")
6. Navigate to PLP with products
7. Filter/sort as needed
8. View product details

### Explore Components
1. Tap **Catalog** tab
2. Scroll through component categories
3. Tap component (e.g., "Button")
4. View variants and examples
5. Read specifications
6. Navigate back
7. Explore more components

### Learn About App
1. Tap **Cart** tab
2. Tap "View App Guide" button
3. Scroll through comprehensive guide
4. Learn about tabs, features, components
5. Dismiss when ready
6. Start using app

---

## 💡 Best Practices

### Using Design Tokens
```swift
// Import
private typealias DS = DesignSystemGlobal

// Colors
.foregroundColor(DS.Brand300)
.background(DS.BackgroundContainerColorWhite)

// Spacing
.padding(DS.Spacing4)
.frame(height: DS.Spacing6)

// Typography
Text("Hello")
    .thdFont(.bodyMd)
    .foregroundColor(DS.TextOnContainerColorPrimary)

// Borders
.cornerRadius(DS.BorderRadiusLg)
```

### Navigation Patterns
```swift
// Use NavigationStack with paths
@State private var navigationPath = NavigationPath()

NavigationStack(path: $navigationPath) {
    ContentView()
        .navigationDestination(for: String.self) { destination in
            DetailView(destination: destination)
        }
}

// Custom back button with morphing header
MorphingNavHeader(
    showBackButton: showBackButton,
    onBackTapped: {
        if !navigationPath.isEmpty {
            navigationPath.removeLast()
        }
    }
)
```

### Scroll Effects
```swift
ScrollView {
    content
}
.scrollEdgeEffectStyle(.soft, for: .top)
.scrollEdgeEffectStyle(.soft, for: .bottom)
```

---

## 🎨 Design Philosophy

### Consistency
- All components use DesignSystemGlobal tokens
- Semantic color naming for context
- Unified typography scale
- Predictable spacing system

### Modularity
- Self-contained components
- Reusable view modifiers
- Protocol-driven design
- Composable architecture

### Accessibility
- Dynamic type support
- Color contrast compliance
- VoiceOver optimization
- Semantic HTML equivalents

### Performance
- Lazy loading where appropriate
- Efficient state management
- Optimized re-renders
- Memory-conscious design

---

## 🔮 Future Enhancements

### Planned Features
- **Cart Functionality** - Complete shopping cart and checkout
- **Product Details** - Full product detail pages
- **Search** - Global search with suggestions
- **User Account** - Profile, orders, favorites
- **Store Locator** - Find nearby stores
- **Barcode Scanner** - Quick product lookup
- **AR View** - Visualize products in space
- **Lists** - Shopping lists and project planning

### Component Additions
- Date Picker
- Dropdown / Select
- Toggle Switch
- Checkbox & Radio
- Progress Indicators
- Stepper
- Slider
- Toast Notifications
- Bottom Sheet
- Modal Dialog

---

## 📚 Additional Resources

### Related Files
- See `NAVIGATION_README.md` for navigation patterns
- See `ENHANCED_SHOP_NAVIGATION.md` for shop menu details
- See `IMPLEMENTATION_SUMMARY.md` for technical implementation

### Apple Documentation
- SwiftUI Framework
- matchedGeometryEffect
- NavigationStack
- Material Effects
- Accessibility

---

**Last Updated:** December 23, 2025
**Version:** 1.0
**Platform:** iOS 17.0+

---

This comprehensive guide covers all major features, components, and patterns used throughout the THD Design System App. Use this as a reference for understanding the app's capabilities and implementation details.
