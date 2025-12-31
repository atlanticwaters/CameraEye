# Dark Mode Token Values Reference

This document provides the expected dark mode values for the design token system. Use this as a reference when updating the design token source (Figma/JSON) for proper dark mode support.

## Overview

The TokensSemanticDark.swift file has been manually updated with proper dark mode values. When regenerating tokens via `npm run tokens:build`, ensure the source includes these dark mode definitions or re-apply these values.

---

## Color Value Reference

### Surface Backgrounds (Page Level)

| Token | Light Mode | Dark Mode | Hex (Dark) |
|-------|------------|-----------|------------|
| `BackgroundSurfaceColorGreige` | rgb(248, 245, 242) | rgb(26, 26, 26) | `#1A1A1A` |
| `BackgroundSurfaceColorInverse` | rgb(13, 13, 13) | rgb(245, 243, 241) | `#F5F3F1` |
| `BackgroundSurfaceColorSecondary` | rgba(0,0,0, 10%) | rgba(255,255,255, 10%) | White 10% |
| `BackgroundSurfaceColorTertiary` | rgb(255, 255, 255) | rgb(45, 45, 45) | `#2D2D2D` |

### Container Backgrounds (Cards, Sections)

| Token | Light Mode | Dark Mode | Hex (Dark) |
|-------|------------|-----------|------------|
| `BackgroundContainerColorWhite` | rgb(255, 255, 255) | rgb(37, 37, 37) | `#252525` |
| `BackgroundContainerColorGreige` | rgb(248, 245, 242) | rgb(45, 45, 45) | `#2D2D2D` |
| `BackgroundContainerColorInverse` | rgb(37, 37, 36) | rgb(245, 243, 241) | `#F5F3F1` |
| `BackgroundContainerColorBrandAccent` | rgb(254, 242, 233) | rgb(51, 31, 15) | `#331F0F` |
| `BackgroundContainerColorTransparent05` | rgba(0,0,0, 5%) | rgba(255,255,255, 5%) | White 5% |
| `BackgroundContainerColorTransparent10` | rgba(0,0,0, 10%) | rgba(255,255,255, 10%) | White 10% |
| `BackgroundContainerColorTransparent20` | rgba(0,0,0, 20%) | rgba(255,255,255, 20%) | White 20% |

### Text Colors (On Container)

| Token | Light Mode | Dark Mode | Hex (Dark) |
|-------|------------|-----------|------------|
| `TextOnContainerColorPrimary` | rgb(37, 37, 36) | rgb(245, 245, 245) | `#F5F5F5` |
| `TextOnContainerColorSecondary` | rgb(71, 69, 69) | rgb(176, 176, 176) | `#B0B0B0` |
| `TextOnContainerColorTertiary` | rgb(106, 104, 103) | rgb(136, 136, 136) | `#888888` |
| `TextOnContainerColorQuatrenary` | rgb(139, 136, 135) | rgb(119, 119, 119) | `#777777` |
| `TextOnContainerColorInactive` | rgb(120, 118, 117) | rgb(102, 102, 102) | `#666666` |
| `TextOnContainerColorInverse` | rgb(248, 245, 242) | rgb(37, 37, 36) | `#252524` |

### Text Colors (On Surface)

Same values as "On Container" - surfaces and containers use consistent text colors in dark mode.

### Feedback Backgrounds (Alerts, Banners)

| Token | Light Mode | Dark Mode | Notes |
|-------|------------|-----------|-------|
| `BackgroundFeedbackColorErrorAccent1` | rgb(253, 241, 240) | rgb(64, 31, 28) | Dark red tint |
| `BackgroundFeedbackColorSuccessAccent1` | rgb(240, 245, 243) | rgb(31, 56, 43) | Dark green tint |
| `BackgroundFeedbackColorWarningAccent1` | rgb(253, 246, 210) | rgb(71, 61, 26) | Dark yellow tint |
| `BackgroundFeedbackColorInformationalAccent1` | rgb(243, 244, 248) | rgb(36, 41, 61) | Dark blue tint |

### Border Colors

| Token | Light Mode | Dark Mode | Hex (Dark) |
|-------|------------|-----------|------------|
| `BorderOnContainerDefault` | rgb(186, 183, 180) | rgb(89, 89, 89) | `#595959` |
| `BorderOnContainerActive` | rgb(37, 37, 36) | rgb(153, 153, 153) | `#999999` |
| `BorderOnContainerInactive` | rgb(229, 225, 222) | rgb(64, 64, 64) | `#404040` |
| `BorderOnContainerPressed` | rgb(37, 37, 36) | rgb(128, 128, 128) | `#808080` |
| `BorderInputColorDefault` | rgb(186, 183, 180) | rgb(89, 89, 89) | `#595959` |
| `BorderInputColorFocus` | rgb(37, 37, 36) | rgb(249, 99, 2) | Brand orange |

### Button Colors

Button backgrounds generally follow container patterns:
- "White" buttons use dark container color (`#2D2D2D`)
- Brand/orange buttons remain the same (brand orange works in both modes)
- Ghost/transparent buttons use white opacity instead of black opacity
- Inactive states use darker grays (`#595959`)

### Selector Colors

| Token | Light Mode | Dark Mode | Notes |
|-------|------------|-----------|-------|
| `BackgroundSelectorColorFilledDefault` | rgba(0,0,0, 5%) | rgba(255,255,255, 5%) | Inverted opacity |
| `BackgroundSelectorColorFilledSelected` | rgb(37, 37, 36) | rgb(230, 230, 230) | Light for contrast |
| `BackgroundSelectorColorOutlineDefault` | rgb(255, 255, 255) | rgb(45, 45, 45) | Dark container |

---

## Design Principles for Dark Mode

### 1. Surface Hierarchy
- **Surface (page)**: Very dark (`#1A1A1A`)
- **Container (cards)**: Slightly lighter (`#252525`)
- **Nested elements**: Even lighter (`#2D2D2D`)

### 2. Text Contrast
- Primary text should be off-white (`#F5F5F5`), not pure white
- Secondary and tertiary text use progressively darker grays
- Maintain WCAG AA contrast ratios (4.5:1 for normal text)

### 3. Transparency Inversion
- Light mode uses black with opacity (e.g., `rgba(0,0,0, 0.05)`)
- Dark mode uses white with opacity (e.g., `rgba(255,255,255, 0.05)`)

### 4. Brand Colors
- Keep brand orange (`#F96302`) consistent in both modes
- Adjust accent backgrounds to be darker tinted versions

### 5. Feedback Colors
- Keep the main feedback color (error red, success green, etc.) the same
- Adjust background tints to be darker versions of the light mode tints

---

## Implementation Notes

### Files Modified
1. `TokensSemanticDark.swift` - Contains all dark mode color values
2. `DSColorDarkOverrides.swift` - Additional override helpers (can be removed after tokens are regenerated)

### Token Regeneration
When running `npm run tokens:build`:
1. Update the design token source with dark mode values
2. Regenerate tokens
3. Verify TokensSemanticDark.swift has the correct values
4. Remove DSColorDarkOverrides.swift if no longer needed

### Testing
After changes, verify dark mode in:
- All DS___View showcase views
- ComponentCatalogView
- Main app screens

Use the ThemeSwitcher component to toggle between Light/Dark/Auto modes.
