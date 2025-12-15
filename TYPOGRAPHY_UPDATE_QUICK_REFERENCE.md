# Typography Update - Quick Reference

## Before vs After

### Title Text
```swift
// ❌ Before - Generic system font
.font(.system(size: 32, weight: .bold))

// ✅ After - THD Display font
.font(.custom(DesignSystemGlobal.FontFamilyDisplay, size: DesignSystemGlobal.FontSizeH1))
.fontWeight(.bold)
```

### Results Count
```swift
// ❌ Before - Generic system font
.font(.system(size: 24, weight: .semibold))

// ✅ After - THD Display font
.font(.custom(DesignSystemGlobal.FontFamilyDisplay, size: DesignSystemGlobal.FontSizeH3))
.fontWeight(.semibold)
```

### UI Elements (Pills, Filters)
```swift
// ❌ Before - Generic system font
.font(.system(size: 14, weight: .regular))

// ✅ After - THD Informational font
.font(.custom(DesignSystemGlobal.FontFamilyInformational, size: DesignSystemGlobal.FontSizeBodySm))
.fontWeight(.regular)
```

---

## Typography Token Quick Reference

### Font Families
| Token | Font Name | Usage |
|-------|-----------|-------|
| `FontFamilyDisplay` | "THD LgVar Beta" | Headings, prominent text |
| `FontFamilyInformational` | "THD SmVar Beta" | Body text, UI labels |

### Common Font Sizes
| Token | Size | Example Usage |
|-------|------|---------------|
| `FontSizeBodyXs` | 12pt | Captions, tiny labels |
| `FontSizeBodySm` | 14pt | Pills, filters, small UI |
| `FontSizeBodyMd` | 16pt | Default body text |
| `FontSizeH3` | 24pt | Results count, medium headings |
| `FontSizeH1` | 32pt | Page titles, category names |

---

## Usage Pattern

### For Headings/Titles (Large, Prominent Text)
```swift
Text("CATEGORY NAME")
    .font(.custom(DesignSystemGlobal.FontFamilyDisplay, size: DesignSystemGlobal.FontSizeH1))
    .fontWeight(.bold)
```

### For Numbers/Counts (Prominent, but not as large)
```swift
Text("5,007 RESULTS")
    .font(.custom(DesignSystemGlobal.FontFamilyDisplay, size: DesignSystemGlobal.FontSizeH3))
    .fontWeight(.semibold)
```

### For Interactive UI Elements (Buttons, Pills, Filters)
```swift
Text("Filter Label")
    .font(.custom(DesignSystemGlobal.FontFamilyInformational, size: DesignSystemGlobal.FontSizeBodySm))
    .fontWeight(.regular)
```

---

## All Components Updated

✅ **Title** - Display font, H1 size (32pt)  
✅ **Results Count** - Display font, H3 size (24pt)  
✅ **Style Pills** - Informational font, BodySm size (14pt)  
✅ **Filter Pills** - Informational font, BodySm size (14pt)  
✅ **Sub-Filter Pills** - Informational font, BodySm size (14pt)  

---

## Spacing Also Updated

All hardcoded spacing values now use design tokens:

```swift
// VStack main spacing
spacing: DesignSystemGlobal.Spacing6   // 24pt

// Style pill HStack
spacing: DesignSystemGlobal.Spacing3   // 12pt

// Filter pill HStack
spacing: DesignSystemGlobal.Spacing2   // 8pt

// Sub-filter internal spacing
spacing: DesignSystemGlobal.Spacing1   // 4pt

// Padding
.padding(.vertical, DesignSystemGlobal.Spacing4)  // 16pt
.padding(.horizontal, DesignSystemGlobal.Spacing4) // 16pt
```
