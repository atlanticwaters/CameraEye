# Quick Reference - THD Design System App

## 🚀 Quick Start

### First Launch
1. App shows welcome interstitial automatically
2. Learn about all tabs and features
3. Tap "Get Started" or tap outside to dismiss

### Access Guide Anytime
1. Go to **Cart** tab
2. Tap **"View App Guide"** button
3. Scroll through comprehensive feature list

---

## 📱 Four Main Tabs

| Tab | Icon | Purpose | Key Features |
|-----|------|---------|--------------|
| **Home** | 🏠 | Landing page | Hero sections, carousels, morphing header |
| **Shop** | 🛍️ | Browse departments | 20 departments, morphing menu, PLP navigation |
| **Catalog** | 📚 | Component library | 9+ components, design tokens, interactive demos |
| **Cart** | 🛒 | Shopping & guide | Cart (coming soon), app guide access |

---

## 🎨 9+ Components Available

### Action Components
- **Button** - Primary, secondary, ghost, icon variants

### Display Components
- **Card** - Content cards, mini product cards, layouts
- **Product Card** - B2C/B2B, badges, swatches, ratings
- **Badge** - Outline, filled subtle/strong, indicator
- **Alert** - Info, success, warning, error
- **Callout** - Neutral, inverse, brand

### Selection Components
- **Pill** - Outlined, filled, with icons
- **Tile** - Selection tiles for options

### Input Components
- **Quantity Picker** - Expandable quantity selector

### Foundation
- **Typography** - Display & informational fonts, type scale
- **Design Tokens** - Colors, spacing, borders, elevation

---

## 🛍️ Shop Navigation Flow

```
Shop Tab (Tap)
    ↓
Menu Morphs In (from right)
    ↓
Select Department (e.g., "Tools")
    ↓
View Subcategories (e.g., "Power Tools")
    ↓
Select Subcategory (e.g., "Drills")
    ↓
Product List Page (PLP)
    ↓
Filter/Sort/Browse Products
```

**20 Departments Include:**
Appliances, Bath, Building Materials, Cleaning, Decor, Doors & Windows, Electrical, Flooring, Hardware, Heating & Cooling, Kitchen, Lawn & Garden, Lighting, Outdoor Living, Paint, Plumbing, Storage, Tools, etc.

---

## 📦 Product List Pages (PLP)

### View Modes
- **Grid View** - 2-column product grid
- **List View** - Single-column detailed list

### Sorting Options
- Best Match
- Price (Low/High)
- Top Rated
- Most Reviewed
- Newest

### Filter Categories
- Price Range
- Brand
- Rating
- Features
- Availability

---

## 🎨 Design System Tokens

### Quick Token Reference

#### Colors
```swift
DS.Brand300              // Primary orange
DS.Greige050 - Greige900 // Neutral scale
DS.Moonlight050 - 900    // Cool neutrals
```

#### Spacing
```swift
DS.Spacing1  // 4pt
DS.Spacing2  // 8pt
DS.Spacing3  // 12pt
DS.Spacing4  // 16pt
DS.Spacing5  // 24pt
DS.Spacing6  // 32pt
```

#### Typography
```swift
.thdFont(.hero1)    // Largest display
.thdFont(.h1)       // Heading 1
.thdFont(.bodyMd)   // Body medium
.thdFont(.caption)  // Smallest text
```

#### Border Radius
```swift
DS.BorderRadiusSm   // 4pt
DS.BorderRadiusMd   // 8pt
DS.BorderRadiusLg   // 12pt
DS.BorderRadiusXl   // 16pt
```

---

## 💻 Common Code Patterns

### Using Design Tokens
```swift
import SwiftUI
private typealias DS = DesignSystemGlobal

VStack(spacing: DS.Spacing3) {
    Text("Hello")
        .thdFont(.bodyMd)
        .foregroundColor(DS.TextOnContainerColorPrimary)
}
.padding(DS.Spacing4)
.background(DS.BackgroundContainerColorWhite)
.cornerRadius(DS.BorderRadiusLg)
```

### Navigation with Morphing Header
```swift
@State private var navigationPath = NavigationPath()
@State private var showBackButton = false

NavigationStack(path: $navigationPath) {
    ContentView()
}
.safeAreaBar(edge: .top) {
    MorphingNavHeader(
        showBackButton: showBackButton,
        onBackTapped: {
            navigationPath.removeLast()
        }
    )
}
```

### Scroll Effects
```swift
ScrollView {
    // Content
}
.scrollEdgeEffectStyle(.soft, for: .top)
.scrollEdgeEffectStyle(.soft, for: .bottom)
```

---

## 🎯 Interactive Features

### Product Interaction
- **Tap** product → View details
- **Swipe** → Quick actions
- **Star ratings** → Visual feedback
- **Add to cart** → Primary action

### Filter & Sort
- **Multi-select** → Combine criteria
- **Real-time results** → Dynamic filtering
- **Clear all** → Reset filters

### View Toggle
- **Grid/List** → Switch layouts
- **Smooth transitions** → Animated changes

### Navigation Morphing
- **Back button** → Reverse transitions
- **State tracking** → Breadcrumb awareness

---

## 📁 Key Files

### Navigation
- `BottomTabBar_iOS.swift` - Main tab navigation
- `ShopNavigation.swift` - Shop menu system

### Product Listing
- `PLPView.swift` - Product list pages
- `DSPlpPodDetails.swift` - Product pod component

### Components
- `DSButton.swift`, `DSCard.swift`, `DSProductCard.swift`
- `DSBadge.swift`, `DSAlert.swift`
- Component showcase views

### Design System
- `DesignSystemGlobal.swift` - Token definitions
- `TokensSemanticLight/Dark.swift` - Color tokens

### Documentation
- `APP_FEATURES_GUIDE.md` - Complete feature reference (this doc)
- `NAVIGATION_README.md` - Navigation patterns
- `ENHANCED_SHOP_NAVIGATION.md` - Shop menu details

---

## 🌓 Dark Mode

All components automatically support dark mode through semantic tokens:

```swift
@Environment(\.colorScheme) var colorScheme

private var tokens: any TokenSemanticProtocol.Type {
    colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
}
```

Colors adapt automatically based on system appearance.

---

## 🎪 Demo Features

### Component Catalog
1. Tap **Catalog** tab
2. Browse component categories
3. Tap any component for detailed demo
4. See variants, examples, specifications

### Product Browse
1. Tap **Shop** tab
2. Select department → subcategory
3. View products in grid or list
4. Apply filters and sorting

### App Guide
1. Tap **Cart** tab
2. Tap **"View App Guide"**
3. Learn about features
4. Dismiss when ready

---

## ⚡ Performance Tips

- Components use lazy loading
- Efficient state management
- Optimized re-renders
- Memory-conscious design
- Native iOS animations

---

## 🔧 Customization

All components are built with:
- DesignSystemGlobal tokens
- Modular architecture
- Reusable view modifiers
- Protocol-driven design
- Easy theming

To customize:
1. Update token values in `DesignSystemGlobal.swift`
2. Components automatically reflect changes
3. No need to modify individual components

---

## 📞 Component Quick Access

| Component | View Modifier | Primary Use |
|-----------|--------------|-------------|
| Button | `.thdFont()` | Actions, CTAs |
| Card | `DS.BorderRadius` | Content containers |
| Badge | `DSBadge()` | Status, labels |
| Alert | `DSAlert()` | Feedback messages |
| Typography | `.thdFont(.bodyMd)` | All text content |

---

## 🎨 Color System

### Brand Colors
- `Brand300` - Primary orange (#F96302)
- Used for CTAs, active states, highlights

### Neutral Colors
- `Greige` scale - Warm neutrals
- `Moonlight` scale - Cool neutrals

### Semantic Colors
- `BottleGreen` - Success states
- `Lemon` - Warning states
- `Cinnabar` - Error states

### Contextual Colors
- `TextOnContainerColorPrimary` - Main text
- `TextOnContainerColorSecondary` - Supporting text
- `TextOnContainerColorTertiary` - Subtle text
- `BackgroundContainerColorWhite` - White containers
- `BackgroundContainerColorGreige` - Grey containers
- `BackgroundSurfaceColorGreige` - Page background

---

## 📊 App Statistics

- **4** main navigation tabs
- **9+** interactive components
- **20** shop departments
- **100+** subcategories
- **1000+** lines of documentation
- **Full** dark mode support
- **iOS 17.0+** minimum version

---

## 🚀 Next Steps

1. **Explore the App**
   - Browse each tab
   - Try the morphing navigation
   - View component demos

2. **Read Documentation**
   - `APP_FEATURES_GUIDE.md` - Complete reference
   - `NAVIGATION_README.md` - Navigation patterns
   - Component showcase views - Usage examples

3. **Build Your Own**
   - Use DesignSystemGlobal tokens
   - Follow established patterns
   - Reuse existing components

---

## 💡 Tips & Tricks

### Navigation
- **Back button** appears automatically in deep navigation
- **Shop menu** slides from right, preserves previous tab
- **Smooth animations** use spring physics

### Components
- All use **DesignSystemGlobal** for consistency
- **Dark mode** works automatically
- **Variants** cover most use cases

### Performance
- **Lazy loading** for large lists
- **Efficient** state updates
- **Native** iOS components where possible

---

**Quick Tip:** Access the interactive app guide anytime from the Cart tab!

---

**Version:** 1.0  
**Platform:** iOS 17.0+  
**Last Updated:** December 23, 2025
