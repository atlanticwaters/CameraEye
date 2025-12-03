# App Navigation Structure

## Overview
The app now uses a centralized navigation system that connects all views through the bottom tab bar and manages the back button in the top navigation.

## Navigation Coordinator
**File:** `AppNavigationView.swift`

This is the main navigation coordinator that:
- Manages the currently selected tab
- Tracks navigation history for the back button
- Controls which view is displayed
- Handles transitions between views

## Tab Mapping

| Tab Icon | Tab Label | View Displayed | Description |
|----------|-----------|----------------|-------------|
| house | Home | `TypographyDemoView` | Font test view showing typography system |
| tag | Deals | `ProductListingPage` | Product listing with refrigerators |
| list.bullet | Label | `ComponentCatalogView` | Component catalog for design system |
| plus | Label | `PlaceholderView` | Placeholder for future content |
| person | Profile | `PlaceholderView` | Placeholder for profile view |

## Navigation Components

### Top Navigation (`AppTopNavigation`)
- Shows back button when navigation history exists
- Back button returns to previous tab
- Includes search, favorite, and share buttons
- Morphs between action buttons and search bar

### Bottom Navigation (`AppBottomNavigation`)
- Uses existing `MorphingTabBar` design
- Shows 4 main tabs plus profile button
- Animated tab indicator morphs between selections
- Triggers navigation when tabs are selected

## How Navigation Works

1. **Tab Selection**: When you tap a tab in the bottom navigation:
   - The current tab is added to navigation history
   - The selected tab becomes active
   - The view transitions with animation

2. **Back Button**: 
   - Only appears when there's navigation history
   - Returns to the previous tab
   - Animates smoothly with the view transition

3. **View Transitions**:
   - Home → Deals/Catalog: Slides from right
   - Deals/Catalog → Home: Slides from left
   - Other tabs: Fade in/out

## Files Modified

1. **`AppNavigationView.swift`** (NEW)
   - Main navigation coordinator
   - Custom top and bottom navigation components
   - Placeholder view for future tabs

2. **`ComponentTestApp.swift`** (UPDATED)
   - Changed entry point from `ComponentCatalogView` to `AppNavigationView`

3. **`ProductListingPage.swift`** (UPDATED)
   - Removed embedded top and bottom navigation
   - Simplified to just show content
   - Navigation is now managed by `AppNavigationView`

## Adding New Views

To add a new view to a tab:

1. Update the `AppTab` enum in `AppNavigationView.swift`:
```swift
enum AppTab: Int {
    case home = 0
    case deals = 1
    case catalog = 2
    case myNewTab = 3  // Add your new case
    case profile = 4
}
```

2. Update the `tabs` array in `AppBottomNavigation`:
```swift
private let tabs: [(tab: AppTab, icon: String, label: String)] = [
    (.home, "house", "Home"),
    (.deals, "tag", "Deals"),
    (.catalog, "list.bullet", "Label"),
    (.myNewTab, "star", "New Tab")  // Add your tab info
]
```

3. Add a case in the `contentView` switch statement in `AppNavigationView`:
```swift
case .myNewTab:
    MyNewView()
        .transition(.opacity)
```

## Design System Integration

All navigation components use the `DesignSystemGlobal` tokens:
- Colors: Brand orange, greige backgrounds, surface colors
- Spacing: Consistent padding and margins
- Typography: System fonts with design system sizes
- Elevation: Shadows for depth and hierarchy
- Animation: Spring animations for smooth transitions

## Notes

- The back button navigation creates a simple history stack
- Each tab change is recorded so you can navigate back
- Views are lazy-loaded when their tab is selected
- The ComponentCatalogView retains its internal NavigationStack for drilling into components
