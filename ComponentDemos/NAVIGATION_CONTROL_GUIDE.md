# Navigation Control Guide

## Overview
This guide explains exactly where and how navigation is controlled in the app architecture.

## Visual Layout Structure

```
┌─────────────────────────────────────────┐
│  🔝 TOP NAVIGATION (MorphingNavHeader)  │ ← Overlay via .safeAreaBar()
│  • Back Button (conditional)            │
│  • Search Button                        │
│  • Location Button                      │
├─────────────────────────────────────────┤
│                                         │
│  📜 SCROLLABLE CONTENT                  │ ← ScrollView with NavigationStack
│                                         │
│  • Scrolls underneath top nav           │
│  • .scrollEdgeEffectStyle(.soft)        │
│  • Extra top/bottom padding             │
│                                         │
│                                         │
├─────────────────────────────────────────┤
│  🔽 BOTTOM NAVIGATION (TabView)         │ ← BottomTabBar_iOS
│  [Home] [Shop] [Catalog] [Cart]        │
└─────────────────────────────────────────┘
```

## Navigation Control Points

### 1. Bottom Navigation (Tab Bar)
**Location:** `BottomTabBar_iOS.swift`

**Control Mechanism:**
```swift
TabView(selection: $selectedTab) {
    ForEach(Array(TabType.allCases), id: \.id) { tab in
        content(tab)
            .tabItem { ... }
            .tag(tab)
    }
}
```

**What it controls:**
- Which main screen is displayed (Home, Shop, Catalog, Cart)
- Tab selection state
- Tab bar icons and labels

**How to change tabs:**
```swift
@State private var selectedTab: AppTab = .home
// Change tab programmatically:
selectedTab = .catalog
```

---

### 2. Top Navigation (Header Bar)
**Location:** Applied in each tab's content view

**Control Mechanism:**
```swift
.safeAreaBar(edge: .top) {
    MorphingNavHeader(
        showBackButton: showBackButton,
        onBackTapped: {
            if !navigationPath.isEmpty {
                navigationPath.removeLast()
            }
        }
    )
}
```

**What it controls:**
- Back button visibility
- Search functionality
- Location/store selector
- Morphing animations between states

**Key State Variables:**
- `showBackButton: Bool` - Controls back button visibility
- `onBackTapped: () -> Void` - Action when back is tapped

---

### 3. Back Button Visibility
**Location:** In the main view containing NavigationStack

**Control Mechanism:**
```swift
@State private var showBackButton: Bool = false
@State private var navigationPath = NavigationPath()

// Monitor navigation depth
.onChange(of: navigationPath.count) { oldValue, newValue in
    withAnimation {
        showBackButton = newValue > 0
    }
}
```

**Logic:**
- `navigationPath.isEmpty` → `showBackButton = false`
- `navigationPath.count > 0` → `showBackButton = true`

**This is the KEY to back button control!**

---

### 4. Navigation Stack Management
**Location:** In each tab's root view

**Control Mechanism:**
```swift
NavigationStack(path: $navigationPath) {
    ContentView()
        .navigationDestination(for: String.self) { destination in
            DetailView(title: destination)
        }
        .navigationBarHidden(true)
}
```

**What it controls:**
- Navigation hierarchy within a tab
- Push/pop behavior
- Deep linking destinations

**How to navigate:**
```swift
// Navigate forward
NavigationLink(value: "DetailView") {
    Text("Go to Detail")
}

// Navigate back
navigationPath.removeLast()

// Navigate to root
navigationPath = NavigationPath()
```

---

### 5. Content Scrolling
**Location:** Within each view's ScrollView

**Control Mechanism:**
```swift
ScrollView {
    VStack {
        // Content here
    }
    .padding(.top, 16)    // Clear top nav
    .padding(.bottom, 16) // Clear bottom nav
}
.scrollEdgeEffectStyle(.soft, for: .top)
.scrollEdgeEffectStyle(.soft, for: .bottom)
```

**What it controls:**
- Content scroll behavior
- Soft fade effects at edges
- Safe area handling

---

## File Reference Map

### Core Navigation Files

| File | Purpose | Key Components |
|------|---------|----------------|
| `BottomTabBar_iOS.swift` | Bottom tab navigation | `TabView`, `AppTab`, `MainAppNavigationView` |
| `Morph_Menu.swift` | Top navigation header | `MorphingNavHeader` |
| `ComponentCatalogView.swift` | Example implementation | `.safeAreaBar()`, navigation setup |
| `NavigationLayoutDemo.swift` | Navigation demo & guide | Complete working example |

### Helper Files

| File | Purpose |
|------|---------|
| `SoftScrollEdgeModifier.swift` | Scroll edge effects |
| `NAVIGATION_README.md` | Additional navigation docs |
| `SCROLL_EDGE_ARCHITECTURE.md` | Scroll behavior docs |

---

## Common Navigation Patterns

### Pattern 1: Tab with NavigationStack
```swift
struct MyTabView: View {
    @State private var showBackButton = false
    @State private var navigationPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            ScrollView {
                // Content
            }
            .navigationDestination(for: String.self) { destination in
                DetailView(title: destination)
            }
        }
        .onChange(of: navigationPath.count) { _, newValue in
            showBackButton = newValue > 0
        }
        .safeAreaBar(edge: .top) {
            MorphingNavHeader(
                showBackButton: showBackButton,
                onBackTapped: {
                    if !navigationPath.isEmpty {
                        navigationPath.removeLast()
                    }
                }
            )
        }
    }
}
```

### Pattern 2: Root View (No Back Button)
```swift
struct RootView: View {
    var body: some View {
        ScrollView {
            // Content
        }
        .safeAreaBar(edge: .top) {
            MorphingNavHeader(showBackButton: false)
        }
    }
}
```

### Pattern 3: Modal Presentation
```swift
.sheet(isPresented: $showModal) {
    ModalView()
        .safeAreaBar(edge: .top) {
            MorphingNavHeader(
                showBackButton: true,
                onBackTapped: {
                    showModal = false
                }
            )
        }
}
```

---

## Troubleshooting Guide

### Problem: Back button not appearing
**Diagnosis:** Navigation path not being monitored

**Solution:**
```swift
.onChange(of: navigationPath.count) { oldValue, newValue in
    withAnimation {
        showBackButton = newValue > 0
    }
}
```

### Problem: Back button not working
**Diagnosis:** No back action provided

**Solution:**
```swift
MorphingNavHeader(
    showBackButton: showBackButton,
    onBackTapped: {
        if !navigationPath.isEmpty {
            navigationPath.removeLast()
        }
    }
)
```

### Problem: Content scrolls under top nav
**Diagnosis:** Missing top padding

**Solution:**
```swift
VStack {
    // Content
}
.padding(.top, 16)  // Add this
```

### Problem: Top nav not staying fixed
**Diagnosis:** `.safeAreaBar()` applied in wrong place

**Solution:**
- ✅ Apply AFTER the NavigationStack/ScrollView
- ❌ Don't apply INSIDE ScrollView

```swift
// ✅ Correct
NavigationStack {
    ScrollView { }
}
.safeAreaBar(edge: .top) { }

// ❌ Wrong
NavigationStack {
    ScrollView {
        VStack { }
            .safeAreaBar(edge: .top) { } // Wrong!
    }
}
```

### Problem: Navigation state not persisting
**Diagnosis:** State not preserved across view updates

**Solution:**
```swift
// Use @State at the correct level
struct ParentView: View {
    @State private var navigationPath = NavigationPath() // ✅ Here
    
    var body: some View {
        NavigationStack(path: $navigationPath) { }
    }
}
```

---

## Quick Reference Checklist

When implementing navigation in a new view:

- [ ] Add `@State private var navigationPath = NavigationPath()`
- [ ] Add `@State private var showBackButton = false`
- [ ] Wrap content in `NavigationStack(path: $navigationPath)`
- [ ] Add `.onChange(of: navigationPath.count)` to update back button
- [ ] Apply `.safeAreaBar(edge: .top)` with `MorphingNavHeader`
- [ ] Pass `onBackTapped` closure to handle back navigation
- [ ] Add top/bottom padding to ScrollView content
- [ ] Apply `.scrollEdgeEffectStyle(.soft)` to ScrollView
- [ ] Set `.navigationBarHidden(true)`

---

## Example: Full Implementation

See `NavigationLayoutDemo.swift` for a complete, working example with:
- ✅ Bottom tab integration
- ✅ Top navigation overlay
- ✅ Back button control
- ✅ Navigation stack management
- ✅ Proper content scrolling
- ✅ Detailed annotations explaining each part

Run the preview to see it in action!
