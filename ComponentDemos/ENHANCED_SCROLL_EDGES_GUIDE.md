# Enhanced Scroll Edge Effects Guide

## Overview

The app now supports **two levels of scroll edge effects**:

1. **Standard Soft Edges** - System default fade
2. **Enhanced Tall Fades** - Extended gradients for more prominent effect

## Usage

### Standard Soft Edges (Default)

Use `.applySoftScrollEdges()` for standard system edge effects:

```swift
ScrollView {
    // Your content
}
.applySoftScrollEdges()
.background(DesignSystemGlobal.BackgroundSurfaceColorGreige)
```

**Effect:** Standard iOS soft edge fade (~60-80pt)

### Enhanced Tall Fades (Recommended)

Use `.applyEnhancedScrollEdges()` for taller, more prominent fades:

```swift
ScrollView {
    // Your content
}
.applyEnhancedScrollEdges()
.background(DesignSystemGlobal.BackgroundSurfaceColorGreige)
```

**Effect:** Extended gradient fades that go further behind nav bars
- Top fade: 120pt (default)
- Bottom fade: 150pt (default)

### Custom Fade Heights

Adjust the fade heights to your preference:

```swift
ScrollView {
    // Your content
}
.applyEnhancedScrollEdges(topFadeHeight: 150, bottomFadeHeight: 200)
.background(DesignSystemGlobal.BackgroundSurfaceColorGreige)
```

## Visual Comparison

### Standard Effect (60-80pt fade)
```
┌─────────────────────────────────────────┐
│  Top Navigation Bar                     │
├─────────────────────────────────────────┤
│  ▓▓▓▓▓▓▓  ← Short fade                  │
│  ▓▓▓░░░                                 │
│  ▓░░                                    │
│  Content                                │
│                                         │
│  Content                                │
│                                         │
│  ░▓░                                    │
│  ░░░▓▓▓  ← Short fade                   │
│  ▓▓▓▓▓▓▓                                │
├─────────────────────────────────────────┤
│  Bottom Navigation Bar                  │
└─────────────────────────────────────────┘
```

### Enhanced Effect (120-150pt fade)
```
┌─────────────────────────────────────────┐
│  Top Navigation Bar                     │
├─────────────────────────────────────────┤
│  ▓▓▓▓▓▓▓                                │
│  ▓▓▓▓▓▓░  ← Taller fade                │
│  ▓▓▓▓░░░     extends further           │
│  ▓▓▓░░░░     behind nav                │
│  ▓▓░░░░░                                │
│  ▓░░░░░░                                │
│  ░░░░░░░                                │
│  Content                                │
│                                         │
│  ░░░░░░░                                │
│  ░░░░░▓▓  ← Taller fade                │
│  ░░░▓▓▓▓     extends further           │
│  ░▓▓▓▓▓▓     behind nav                │
│  ▓▓▓▓▓▓▓                                │
├─────────────────────────────────────────┤
│  Bottom Navigation Bar                  │
└─────────────────────────────────────────┘
```

## How It Works

The enhanced modifier combines:

1. **System Scroll Edge Effect** - `.scrollEdgeEffectStyle(.automatic, for: .vertical)`
2. **Top Gradient Overlay** - LinearGradient from background color to clear
3. **Bottom Gradient Overlay** - LinearGradient from clear to background color

### Technical Details

```swift
.overlay(alignment: .top) {
    LinearGradient(
        colors: [
            DesignSystemGlobal.BackgroundSurfaceColorGreige,      // Solid
            DesignSystemGlobal.BackgroundSurfaceColorGreige.opacity(0.8),  // 80%
            .clear                                                 // Transparent
        ],
        startPoint: .top,
        endPoint: .bottom
    )
    .frame(height: 120)  // ← Adjustable height
    .allowsHitTesting(false)  // ← Gradient doesn't block touches
}
```

## Benefits

### Standard Soft Edges
✅ **Clean & Minimal** - Subtle, unobtrusive
✅ **System Native** - Uses iOS default behavior
✅ **Best For** - Simple content, less scrolling

### Enhanced Tall Fades
✅ **More Prominent** - Clearly visible fade
✅ **Better Context** - Shows more content behind nav
✅ **Smoother Transition** - Gradual fade over longer distance
✅ **Premium Feel** - Polished, professional appearance
✅ **Best For** - Long scrolling content, complex layouts

## Recommended Heights

| Scenario | Top Height | Bottom Height | Notes |
|----------|-----------|---------------|-------|
| **Minimal** | 80pt | 100pt | Subtle effect |
| **Standard** | 120pt | 150pt | Balanced (default) |
| **Prominent** | 150pt | 200pt | Very visible |
| **Maximum** | 200pt | 250pt | Dramatic effect |

## Current Implementation

### Views Using Enhanced Effect
- ✅ ComponentCatalogView - Uses `.applyEnhancedScrollEdges()`

### Views Using Standard Effect
- TypographyDemoView
- ProductListingPage
- ButtonDemoView
- BadgeDemoView
- AlertDemoView
- CalloutDemoView
- PillDemoView
- TileDemoView
- QuantityDemoView
- DesignSystemDemoView
- PlaceholderView

## Migration Guide

To switch any view from standard to enhanced:

**Before:**
```swift
.applySoftScrollEdges()
```

**After:**
```swift
.applyEnhancedScrollEdges()
```

**Custom Heights:**
```swift
.applyEnhancedScrollEdges(topFadeHeight: 150, bottomFadeHeight: 180)
```

## Troubleshooting

### Fade Not Visible
**Problem:** Can't see the gradient fade
**Solution:** Ensure background matches the gradient colors:
```swift
.applyEnhancedScrollEdges()
.background(DesignSystemGlobal.BackgroundSurfaceColorGreige) // Must match!
```

### Fade Blocks Navigation
**Problem:** Can't tap buttons in nav bars
**Solution:** Ensure `.allowsHitTesting(false)` is on gradients (already set)

### Fade Too Short/Long
**Problem:** Fade height doesn't look right
**Solution:** Adjust heights:
```swift
.applyEnhancedScrollEdges(topFadeHeight: 180, bottomFadeHeight: 220)
```

### Gradient Color Mismatch
**Problem:** Gradient doesn't match background
**Solution:** Update gradient colors in `SoftScrollEdgeModifier.swift`:
```swift
LinearGradient(
    colors: [
        YourCustomColor,           // ← Change this
        YourCustomColor.opacity(0.8),  // ← And this
        .clear
    ],
    startPoint: .top,
    endPoint: .bottom
)
```

## Performance Notes

- Gradients are lightweight overlays
- `.allowsHitTesting(false)` prevents performance impact
- No impact on scroll performance
- Works smoothly with system scroll edge effects

## Best Practices

1. **Consistency:** Use the same effect type across similar views
2. **Test Heights:** Adjust to match your content density
3. **Match Background:** Always match gradient color to background
4. **Don't Overdo:** Longer isn't always better
5. **Consider Content:** Dense content = taller fade, sparse = shorter

## Examples

### Product Listing (Tall Fade)
```swift
ScrollView {
    LazyVStack {
        ForEach(products) { product in
            ProductCard(product)
        }
    }
}
.applyEnhancedScrollEdges(topFadeHeight: 150, bottomFadeHeight: 180)
```

### Simple Settings View (Standard Fade)
```swift
ScrollView {
    VStack {
        ForEach(settings) { setting in
            SettingRow(setting)
        }
    }
}
.applySoftScrollEdges()
```

### Hero Content (Very Tall Fade)
```swift
ScrollView {
    VStack {
        HeroImage()
        ContentArea()
    }
}
.applyEnhancedScrollEdges(topFadeHeight: 200, bottomFadeHeight: 250)
```

## Summary

You now have **two powerful options** for scroll edge effects:

1. **`.applySoftScrollEdges()`** - Standard iOS effect
2. **`.applyEnhancedScrollEdges()`** - Extended gradient fades (customizable)

Choose based on your content and desired visual impact!
