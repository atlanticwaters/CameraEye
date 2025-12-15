# DSPlpFilterPanel Typography Update

## ✅ Updated to Use THD Typography System

The `DSPlpFilterPanel` component has been updated to use The Home Depot's official typography system instead of hardcoded system fonts.

## Changes Made

### 1. Title Text (Category Name)
**Before:**
```swift
.font(.system(size: 32, weight: .bold))
```

**After:**
```swift
.font(.custom(DesignSystemGlobal.FontFamilyDisplay, size: DesignSystemGlobal.FontSizeH1))
.fontWeight(.bold)
```

- **Font Family:** `FontFamilyDisplay` ("THD LgVar Beta") - Used for prominent headings
- **Font Size:** `FontSizeH1` (32pt) - Largest heading size
- **Weight:** Bold

---

### 2. Results Count Text
**Before:**
```swift
.font(.system(size: 24, weight: .semibold))
```

**After:**
```swift
.font(.custom(DesignSystemGlobal.FontFamilyDisplay, size: DesignSystemGlobal.FontSizeH3))
.fontWeight(.semibold)
```

- **Font Family:** `FontFamilyDisplay` ("THD LgVar Beta") - Used for prominent numbers
- **Font Size:** `FontSizeH3` (24pt) - Medium heading size
- **Weight:** Semibold

---

### 3. Style Pills Text
**Before:**
```swift
.font(.system(size: 14, weight: .regular))
```

**After:**
```swift
.font(.custom(DesignSystemGlobal.FontFamilyInformational, size: DesignSystemGlobal.FontSizeBodySm))
.fontWeight(.regular)
```

- **Font Family:** `FontFamilyInformational` ("THD SmVar Beta") - Used for UI elements
- **Font Size:** `FontSizeBodySm` (14pt) - Small body text
- **Weight:** Regular

---

### 4. Filter Pills Text
**Before:**
```swift
.font(.system(size: 14, weight: .regular))
```

**After:**
```swift
.font(.custom(DesignSystemGlobal.FontFamilyInformational, size: DesignSystemGlobal.FontSizeBodySm))
.fontWeight(.regular)
```

- **Font Family:** `FontFamilyInformational` ("THD SmVar Beta") - Used for UI elements
- **Font Size:** `FontSizeBodySm` (14pt) - Small body text
- **Weight:** Regular

---

### 5. Sub-Filter Pills Text
**Before:**
```swift
.font(.system(size: 14, weight: .regular))
```

**After:**
```swift
.font(.custom(DesignSystemGlobal.FontFamilyInformational, size: DesignSystemGlobal.FontSizeBodySm))
.fontWeight(.regular)
```

- **Font Family:** `FontFamilyInformational` ("THD SmVar Beta") - Used for UI elements
- **Font Size:** `FontSizeBodySm` (14pt) - Small body text
- **Weight:** Regular

---

### 6. Spacing Updates
Also updated hardcoded spacing values to use design tokens:

**Before:**
```swift
spacing: 24  // VStack
spacing: 12  // Style pills
spacing: 8   // Filter pills
spacing: 4   // Sub-filters
```

**After:**
```swift
spacing: DesignSystemGlobal.Spacing6   // VStack (24pt)
spacing: DesignSystemGlobal.Spacing3   // Style pills (12pt)
spacing: DesignSystemGlobal.Spacing2   // Filter pills (8pt)
spacing: DesignSystemGlobal.Spacing1   // Sub-filters (4pt)
```

---

## THD Typography System Overview

### Font Families
- **Display Font** (`FontFamilyDisplay`): "THD LgVar Beta"
  - Used for: Headings, prominent numbers, hero text
  - Examples: Page titles, large numbers, category names

- **Informational Font** (`FontFamilyInformational`): "THD SmVar Beta"
  - Used for: Body text, UI labels, interactive elements
  - Examples: Button text, filter labels, descriptions

### Font Sizes (Body Text)
| Token | Size | Usage |
|-------|------|-------|
| `FontSizeBodyXs` | 12pt | Caption text, very small labels |
| `FontSizeBodySm` | 14pt | Small body text, UI elements |
| `FontSizeBodyMd` | 16pt | Default body text |
| `FontSizeBodyLg` | 18pt | Large body text |
| `FontSizeBodyXl` | 20pt | Extra large body text |

### Font Sizes (Headings)
| Token | Size | Usage |
|-------|------|-------|
| `FontSizeH6` | 16pt | Smallest heading |
| `FontSizeH5` | 18pt | Small heading |
| `FontSizeH4` | 20pt | Medium-small heading |
| `FontSizeH3` | 24pt | Medium heading |
| `FontSizeH2` | 28pt | Large heading |
| `FontSizeH1` | 32pt | Largest heading |

### Font Sizes (Hero Text)
| Token | Size | Usage |
|-------|------|-------|
| `FontSizeHero5` | 36pt | Small hero |
| `FontSizeHero4` | 40pt | Medium-small hero |
| `FontSizeHero3` | 48pt | Medium hero |
| `FontSizeHero2` | 56pt | Large hero |
| `FontSizeHero1` | 64pt | Largest hero |

---

## Typography Usage Guidelines

### When to Use Display Font
✅ **Use for:**
- Page titles and category names
- Large numbers (product counts, prices)
- Hero text and headlines
- Promotional banners

❌ **Don't use for:**
- Body text
- Form labels
- Button text
- Interactive UI elements

### When to Use Informational Font
✅ **Use for:**
- Body text and descriptions
- Button labels and pill text
- Form inputs and labels
- Navigation items
- Filter options

❌ **Don't use for:**
- Large headings
- Hero text
- Prominent numbers

---

## Example Usage

```swift
// Display font for heading
Text("REFRIGERATORS")
    .font(.custom(DesignSystemGlobal.FontFamilyDisplay, size: DesignSystemGlobal.FontSizeH1))
    .fontWeight(.bold)

// Display font for count
Text("5,007 RESULTS")
    .font(.custom(DesignSystemGlobal.FontFamilyDisplay, size: DesignSystemGlobal.FontSizeH3))
    .fontWeight(.semibold)

// Informational font for UI elements
Text("Filter Label")
    .font(.custom(DesignSystemGlobal.FontFamilyInformational, size: DesignSystemGlobal.FontSizeBodySm))
    .fontWeight(.regular)
```

---

## Benefits of Using Typography Tokens

1. **Consistency** - All components use the same font system
2. **Maintainability** - Update fonts globally by changing tokens
3. **Design System Alignment** - Matches THD brand guidelines
4. **Accessibility** - Proper font hierarchy improves readability
5. **Scalability** - Easy to add new font sizes when needed

---

## Testing

Run the preview with:
```swift
#Preview("Complete Example") {
    DSPlpFilterPanel(
        title: "REFRIGERATOR",
        stylePills: [...],
        resultsCount: "5,007 RESULTS",
        filterPills: [...],
        subFilterPills: [...]
    )
}
```

You should see:
- Title in **THD LgVar Beta** (Display font) at 32pt
- Results count in **THD LgVar Beta** (Display font) at 24pt
- All pill labels in **THD SmVar Beta** (Informational font) at 14pt

---

## Related Files

- **Typography System:** `DesignSystemGlobal.swift`
- **Core Tokens:** `TokensCoreLight.swift`
- **Component:** `DSPlpFilterPanel.swift`
- **Preview:** `DSPlpFilterPanelPreviews.swift`
