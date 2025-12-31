# Missing Tokens Report

This document identifies use cases in DS Component View files that may need new design tokens.

## Summary

After auditing all 28 DS Component View files for dark/light theme support, the following observations were made:

### Tokens That Already Exist (Use These)

| Use Case | Current Code | Correct Token |
|----------|--------------|---------------|
| Code block background | `Color.black.opacity(0.05)` | `BackgroundContainerColorTransparent05` |
| Shadow/overlay 10% | `Color.black.opacity(0.1)` | `BackgroundContainerColorTransparent10` |
| Shadow/overlay 20% | `Color.black.opacity(0.2)` | `BackgroundContainerColorTransparent20` |
| Orange/brand color | `Color.orange` | `Brand400` |
| Orange accent text | `.foregroundStyle(.orange)` | `TextOnContainerColorAccent` |
| Yellow (stars/ratings) | `.foregroundStyle(.yellow)` | `Lemon200` |
| Green accent | `Color.green` | `BackgroundAccentColorGreen` |
| Red accent | `Color.red` | `BackgroundAccentColorRed` or `Cinnabar500` |
| Blue accent | `Color.blue` | `BackgroundAccentColorBlue` or `Moonlight700` |
| Pure white | `Color.white` | `NeutralsWhite` |
| Pure black | `Color.black` | `NeutralsBlack` |
| Gray text | `Color.gray` | `TextOnContainerColorTertiary` |
| Gray borders | `Color.gray.opacity(0.3)` | `BorderOnContainerDefault` |
| Selected border | `Color.orange` (selected state) | `Brand400` or `BorderSelectorColorOutlineSelectedAccent` |
| Unselected border | `Color.gray.opacity(0.5)` | `BorderOnContainerDefault` |

## Potentially Missing Tokens

The following tokens might be beneficial to add to the design system:

### 1. Link Text Color
- **Use Case**: Text links that should appear blue/clickable
- **Current Usage**: `Color.blue` in some places
- **Suggested Token**: `TextLinkColorDefault`
- **Note**: Could use `Moonlight500` or `BackgroundAccentColorBlue` as interim solution

### 2. Code Block Background (Distinct from Container)
- **Use Case**: Monospace code example backgrounds
- **Current Usage**: `Color.black.opacity(0.05)`
- **Available Token**: `BackgroundContainerColorTransparent05` works but may want dedicated token
- **Suggested Token**: `BackgroundCodeBlockColor`
- **Note**: The transparent05 token is semantically correct for this use case

## Tokens Used in View Files

The following semantic tokens are used across View files and properly support dark/light mode:

### Text Colors
- `TextOnContainerColorPrimary` - Main text
- `TextOnContainerColorSecondary` - Secondary text
- `TextOnContainerColorTertiary` - Subtle/caption text
- `TextOnContainerColorAccent` - Brand/orange accent text
- `TextOnContainerColorInverse` - Text on dark backgrounds

### Background Colors
- `BackgroundSurfaceColorGreige` - Page background
- `BackgroundContainerColorWhite` - Card backgrounds
- `BackgroundContainerColorGreige` - Section backgrounds
- `BackgroundContainerColorTransparent05` - Subtle overlays
- `BackgroundContainerColorTransparent10` - Medium overlays

### Border Colors
- `BorderOnContainerDefault` - Standard borders
- `BorderOnContainerActive` - Active/focused borders

### Accent Colors (for demos)
- `Brand400` - Primary brand orange
- `Brand100` - Light orange
- `Lemon200` - Yellow for ratings
- `Lemon100` - Light yellow
- `BackgroundAccentColorGreen` - Success indicators
- `BackgroundAccentColorRed` - Error indicators
- `BackgroundAccentColorBlue` - Info indicators

### Sizing
- `BorderRadiusLg` - Large corner radius
- `BorderRadiusXl` - Extra large corner radius

## Recommendation

**No new tokens are strictly required.** All current use cases can be mapped to existing tokens. The hardcoded colors found in View files should be replaced with the existing semantic tokens listed above.

If a `TextLinkColorDefault` token is desired for consistency, it could be added with these values:
- Light mode: `Moonlight500` (#6974A5)
- Dark mode: `Moonlight300` (#8B93B9)
