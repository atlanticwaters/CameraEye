# Design Tokens Audit Report

This document identifies gaps and missing items in the DesignSystem token files that need to be updated from Figma.

**Last Updated:** December 2024

---

## Summary of Changes Made

The following token gaps have been filled:

| Token Set | Status | Changes Made |
|-----------|--------|--------------|
| **BorderRadius** | COMPLETED | Added `BorderRadius4xl` (20), `BorderRadius5xl` (24), `BorderRadiusMdLg` (4) |
| **BottleGreen Colors** | COMPLETED | Added full 025-950 scale to Light & Dark |
| **Spacing** | COMPLETED | Added `Spacing0` (0), `Spacing05` (2), `Spacing15` (6) |
| **Typography** | COMPLETED | Added display sizes, font weights, line heights, letter spacing |
| **Icon Sizes** | COMPLETED | Created new `TokensSizing.swift` file |
| **Component Sizes** | COMPLETED | Added to `TokensSizing.swift` |
| **Opacity** | COMPLETED | Created new `TokensOpacity.swift` file |
| **Dark Theme Colors** | PENDING | All dark tokens still identical to light - need proper dark values from Figma |

---

## 1. Border Radius (TokensSemanticLight/Dark) - COMPLETED

### Current Tokens (Updated)
| Token | Value |
|-------|-------|
| `BorderRadiusNone` | 0 |
| `BorderRadiusXs` | 1 |
| `BorderRadiusSm` | 2 |
| `BorderRadiusMd` | 3 |
| `BorderRadiusMdLg` | 4 |
| `BorderRadiusLg` | 6 |
| `BorderRadiusXl` | 8 |
| `BorderRadius2xl` | 12 |
| `BorderRadius3xl` | 16 |
| `BorderRadius4xl` | 20 |
| `BorderRadius5xl` | 24 |
| `BorderRadiusFull` | 9999 |

---

## 2. Green Color Scale (TokensSemanticLight/Dark) - COMPLETED

### BottleGreen Scale Added
| Token | RGB Value |
|-------|-----------|
| `BottleGreen025` | (0.957, 0.98, 0.969) |
| `BottleGreen050` | (0.89, 0.95, 0.92) |
| `BottleGreen100` | (0.8, 0.906, 0.855) |
| `BottleGreen200` | (0.6, 0.804, 0.702) |
| `BottleGreen300` | (0.388, 0.694, 0.545) |
| `BottleGreen400` | (0.29, 0.596, 0.443) |
| `BottleGreen500` | (0.29, 0.506, 0.396) |
| `BottleGreen600` | (0.22, 0.435, 0.329) |
| `BottleGreen700` | (0.133, 0.384, 0.259) |
| `BottleGreen800` | (0.098, 0.298, 0.2) |
| `BottleGreen900` | (0.059, 0.196, 0.129) |
| `BottleGreen950` | (0.027, 0.098, 0.063) |

**Note:** Values for 025-950 scale were interpolated based on hardcoded values found in DSBadge.swift. Update from Figma if official values differ.

---

## 3. Spacing (TokensSpacing.swift) - COMPLETED

### Added Tokens
| Token | Value | Purpose |
|-------|-------|---------|
| `Spacing0` | 0 | Reset/None spacing |
| `Spacing05` | 2 | Fine adjustments |
| `Spacing15` | 6 | Between Spacing1 (4) and Spacing2 (8) |

---

## 4. Typography (TokensCoreLight/Dark) - COMPLETED

### Added Display Sizes
| Token | Value |
|-------|-------|
| `FontSizeDisplayXs` | 22 |
| `FontSizeDisplaySm` | 24 |
| `FontSizeDisplayMd` | 28 |
| `FontSizeDisplayLg` | 32 |
| `FontSizeDisplayXl` | 40 |
| `FontSizeDisplay2xl` | 48 |
| `FontSizeDisplay3xl` | 56 |

### Added Font Weights
| Token | Value |
|-------|-------|
| `FontWeightRegular` | 400 |
| `FontWeightMedium` | 500 |
| `FontWeightSemibold` | 600 |
| `FontWeightBold` | 700 |

### Added Line Heights
| Token | Value |
|-------|-------|
| `LineHeightTight` | 1.2 |
| `LineHeightNormal` | 1.4 |
| `LineHeightRelaxed` | 1.6 |
| `LineHeightLoose` | 1.8 |

### Added Letter Spacing
| Token | Value |
|-------|-------|
| `LetterSpacingTight` | -0.5 |
| `LetterSpacingNormal` | 0 |
| `LetterSpacingWide` | 0.5 |
| `LetterSpacingWider` | 1.0 |

---

## 5. Icon & Component Sizes (TokensSizing.swift) - NEW FILE

### Icon Sizes
| Token | Value | Usage |
|-------|-------|-------|
| `IconSizeXs` | 12 | Extra small indicators |
| `IconSizeSm` | 14 | DSPlpPodDetails |
| `IconSizeMd` | 16 | DSAlert, DSCallout |
| `IconSizeLg` | 20 | Standard icons |
| `IconSizeXl` | 24 | DSMenuItem |
| `IconSize2xl` | 28 | Large icons |
| `IconSize3xl` | 32 | Jumbo icons |
| `IconSize4xl` | 36 | Display icons |
| `IconSize5xl` | 40 | Hero icons |

### Touch Targets
| Token | Value | Purpose |
|-------|-------|---------|
| `TouchTargetMin` | 44 | Minimum (Apple HIG) |
| `TouchTargetMd` | 48 | Comfortable |
| `TouchTargetLg` | 56 | Large |

### Avatar Sizes
| Token | Value |
|-------|-------|
| `AvatarSizeXs` | 24 |
| `AvatarSizeSm` | 32 |
| `AvatarSizeMd` | 40 |
| `AvatarSizeLg` | 48 |
| `AvatarSizeXl` | 64 |
| `AvatarSize2xl` | 80 |

### Button Heights
| Token | Value |
|-------|-------|
| `ButtonHeightSm` | 32 |
| `ButtonHeightMd` | 40 |
| `ButtonHeightLg` | 48 |
| `ButtonHeightXl` | 56 |

### Input Heights
| Token | Value |
|-------|-------|
| `InputHeightSm` | 36 |
| `InputHeightMd` | 44 |
| `InputHeightLg` | 52 |

### Container Sizes
| Token | Value |
|-------|-------|
| `ContainerSizeSm` | 100 |
| `ContainerSizeMd` | 150 |
| `ContainerSizeLg` | 200 |
| `ContainerSizeXl` | 280 |

### Circle/Dismiss Sizes
| Token | Value |
|-------|-------|
| `CircleSizeSm` | 24 |
| `CircleSizeMd` | 32 |
| `CircleSizeLg` | 36 |
| `CircleSizeXl` | 44 |

---

## 6. Opacity (TokensOpacity.swift) - NEW FILE

### General Opacity Levels
| Token | Value |
|-------|-------|
| `Opacity0` | 0 |
| `Opacity5` | 0.05 |
| `Opacity10` | 0.1 |
| `Opacity15` | 0.15 |
| `Opacity20` | 0.2 |
| `Opacity25` | 0.25 |
| `Opacity30` | 0.3 |
| `Opacity40` | 0.4 |
| `Opacity50` | 0.5 |
| `Opacity60` | 0.6 |
| `Opacity70` | 0.7 |
| `Opacity80` | 0.8 |
| `Opacity90` | 0.9 |
| `Opacity100` | 1.0 |

### Semantic Opacity Tokens
| Token | Value | Usage |
|-------|-------|-------|
| `OpacityShadowLight` | 0.05 | Subtle card backgrounds |
| `OpacityShadowMed` | 0.1 | Standard shadows |
| `OpacityShadowHeavy` | 0.15 | Prominent shadows |
| `OpacityDisabled` | 0.3 | Inactive elements |
| `OpacityOverlay` | 0.5 | Modal scrims |
| `OpacityOverlayHeavy` | 0.7 | Dark modal backgrounds |
| `OpacityStroke` | 0.7 | Subtle strokes |
| `OpacityHover` | 0.08 | Hover backgrounds |
| `OpacityPressed` | 0.12 | Pressed backgrounds |
| `OpacityFocus` | 0.4 | Focus indicators |

---

## 7. Light vs Dark Theme - STILL PENDING

### Critical Issue: Light and Dark tokens are IDENTICAL

After comparing token files:
- **TokensSemanticLight** = **TokensSemanticDark** (identical values)
- **TokensCoreLight** = **TokensCoreDark** (identical values)
- **TokensComponentsLight** = **TokensComponentsDark** (identical values)

**Dark mode is not implemented in the token layer.** All values need to be updated from Figma with proper dark mode values.

### Tokens That Should Differ for Dark Mode
| Category | Examples |
|----------|----------|
| **Backgrounds** | `BackgroundContainerColorWhite`, `BackgroundSurfaceColorGreige`, etc. |
| **Text Colors** | `TextOnSurfaceColorPrimary`, `TextOnContainerColorPrimary`, etc. |
| **Border Colors** | `BorderOnContainerDefault`, `BorderInputColorDefault`, etc. |
| **Icon Colors** | `IconOnSurfaceColorPrimary`, `IconOnContainerColorPrimary`, etc. |
| **Elevation/Shadows** | `ElevationHigh`, `ElevationMed`, `ElevationLow`, etc. |

---

## Files Updated

1. `DesignSystem/Tokens/TokensSemanticLight.swift` - Added BorderRadius tokens, BottleGreen scale
2. `DesignSystem/Tokens/TokensSemanticDark.swift` - Added BorderRadius tokens, BottleGreen scale
3. `DesignSystem/Tokens/TokensSpacing.swift` - Added Spacing0, Spacing05, Spacing15
4. `DesignSystem/Tokens/TokensCoreLight.swift` - Added typography tokens
5. `DesignSystem/Tokens/TokensCoreDark.swift` - Added typography tokens
6. `DesignSystem/Tokens/TokensSizing.swift` - NEW FILE (icon, component, touch target sizes)
7. `DesignSystem/Tokens/TokensOpacity.swift` - NEW FILE (opacity values)

---

## Files with Hardcoded Values (Refactoring Needed)

These files should be refactored to use the new tokens:

1. `DS Components/DSCard/DSCard.swift` - 15+ hardcoded values
2. `DS Components/DSBadge/DSBadge.swift` - 8+ hardcoded RGB colors (can now use BottleGreen tokens)
3. `DS Components/DSPipZoneA/DSPipZoneA.swift` - 6+ brand color instances
4. `DS Components/DSMenuItem/DSMenuItem.swift` - Multiple spacing/frame sizes
5. `DS Components/DSCallout/DSCallout.swift` - Font sizes, spacing, corner radius
6. `DS Components/DSAlert/DSAlert.swift` - Frame sizes, opacity values
7. `Views/ColorAndGradientView.swift` - 10+ hardcoded corner radius values
8. `ComponentDemos/TokenViewerView.swift` - Multiple hardcoded radius values
9. `ComponentDemos/SearchDemoView.swift` - Multiple hardcoded radius values

---

*Generated: December 2024*
