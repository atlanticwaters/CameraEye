# Missing Design System Tokens Inventory

This document catalogs all tokens and values that components reference but don't exist in the current design system token structure.

---

## Colors

### Container Background Colors

| Token Name | Referenced In | Usage Context |
|------------|---------------|---------------|
| `containerBackgroundPrimary` | DSGallery, DSMiniProductCard, DSAccordion, DSContentCard, DSPLPFilterPanel, DSPLPPod | Primary container/card backgrounds |
| `containerBackgroundSecondary` | DSGallery, DSMiniProductCard, DSTabColors, DSFeatureCard | Secondary/alternate container backgrounds |

### Text Colors

| Token Name | Referenced In | Usage Context |
|------------|---------------|---------------|
| `textOnSurfaceColorTertiary` | 15+ components | Tertiary/muted text on surfaces |
| `textOnSurfaceColorDanger` | DSMiniProductCardColors | Error/danger text on surfaces |
| `textOnSurfaceColorLink` | DSPLPFilterSheet | Clickable link text |
| `textOnBrandColorPrimary` | DSPLPFilterSheet | Primary text on brand-colored backgrounds |

### Icon Colors

| Token Name | Referenced In | Usage Context |
|------------|---------------|---------------|
| `iconColorPrimary` | DSPLPFilterSheetColors | Primary icon color |
| `iconColorSecondary` | DSGallery, DSPLPFilterSheet | Secondary/muted icon color |
| `iconColorTertiary` | DSRatingMeter | Tertiary/disabled icon color |
| `iconColorBrand` | DSMiniProductCard | Brand-colored icons |
| `iconColorWarning` | DSRatingMeter | Warning state icons (e.g., star ratings) |
| `iconOnBrandColorPrimary` | DSPLPFilterSheet | Icons on brand-colored backgrounds |

### Border Colors

| Token Name | Referenced In | Usage Context |
|------------|---------------|---------------|
| `borderColorPrimary` | DSGallery, DSRatingMeter, DSPLPFilterSheet | Primary border/divider color |
| `borderColorFocus` | DSRatingMeter | Focus ring/border color |

---

## Typography

| Token Name | Referenced In | Usage Context |
|------------|---------------|---------------|
| `headlineSm` | DSCallout | Small headline text style |
| `bodyMdMedium` | DSAlert | Medium-weight body text (16px medium) |

### Notes
- Current typography includes body sizes (xs, sm, md, lg, xl) with bold variants
- Missing: medium-weight variants for body text
- Missing: explicit small headline alias

---

## Animation

| Token Name | Referenced In | Usage Context |
|------------|---------------|---------------|
| `expand` | DSAccordion | Expand/collapse animation for accordions |

### Notes
- Current animations: `press`, `stateChange`, `loading`, `spring`
- Missing: expand/collapse specific animation

---

## Hardcoded Values (Should Be Tokenized)

### DSMiniProductCard Layout Constants

| Value | Current Implementation | Suggested Token |
|-------|----------------------|-----------------|
| Card width | `Layout.cardWidth` (hardcoded) | `DSSpacing.cardWidthMini` |
| Corner radius | `Layout.cornerRadius` (hardcoded) | `DSRadius.cardDefault` |
| Image height | `Layout.imageHeight` (hardcoded) | `DSSpacing.imageHeightMini` |
| Badge offset | `Layout.badgeOffset` (hardcoded) | `DSSpacing.badgeOffset` |
| Content padding | `Layout.contentPadding` (hardcoded) | `DSSpacing.cardContentPadding` |
| Star size | `Layout.starSize` (hardcoded) | `DSSpacing.iconSizeSm` |

### DSMiniProductCard Shadow

| Value | Current Implementation | Suggested Token |
|-------|----------------------|-----------------|
| Card shadow | `Color.black.opacity(0.08), radius: 4, x: 0, y: 2` | `DSShadow.cardElevation` |

### DSAlert Padding Values

| Value | Current Implementation | Suggested Token |
|-------|----------------------|-----------------|
| Content top padding | `contentTopPadding` (hardcoded) | `DSSpacing.alertContentTop` |
| Content left padding | `contentLeftPadding` (hardcoded) | `DSSpacing.alertContentLeft` |
| Horizontal padding | `horizontalPadding` (hardcoded) | `DSSpacing.alertHorizontal` |
| Top padding | `topPadding` (hardcoded) | `DSSpacing.alertTop` |
| Bottom padding | `bottomPadding` (hardcoded) | `DSSpacing.alertBottom` |

---

## Components Most Affected

### High Impact (4+ missing tokens)

1. **DSMiniProductCard**
   - `containerBackgroundPrimary`
   - `containerBackgroundSecondary`
   - `iconColorBrand`
   - `textOnSurfaceColorDanger`
   - Multiple hardcoded layout values

2. **DSPLPFilterSheet**
   - `iconColorPrimary`
   - `iconColorSecondary`
   - `borderColorPrimary`
   - `textOnSurfaceColorLink`
   - `textOnBrandColorPrimary`
   - `iconOnBrandColorPrimary`

3. **DSGallery**
   - `containerBackgroundPrimary`
   - `containerBackgroundSecondary`
   - `iconColorSecondary`
   - `borderColorPrimary`

4. **DSRatingMeter**
   - `iconColorWarning`
   - `iconColorTertiary`
   - `borderColorPrimary`
   - `borderColorFocus`

### Medium Impact (2-3 missing tokens)

5. **DSAccordion**
   - `containerBackgroundPrimary`
   - `textOnSurfaceColorTertiary`
   - `DSAnimation.expand`

6. **DSAlert**
   - `DSTypography.bodyMdMedium`
   - Multiple hardcoded padding values

7. **DSCallout**
   - `DSTypography.headlineSm`

---

## Summary Statistics

| Category | Missing Count |
|----------|---------------|
| Color tokens | 14 |
| Typography tokens | 2 |
| Animation tokens | 1 |
| **Total missing tokens** | **17** |
| Hardcoded values needing tokenization | 12+ |

---

## Token Naming Conventions (For Generation)

Based on existing patterns in the codebase:

### Colors
```
DSColor.{category}{Variant}Color{State}
```
- Categories: `text`, `icon`, `border`, `container`
- Variants: `OnSurface`, `OnBrand`, `Background`
- States: `Primary`, `Secondary`, `Tertiary`, `Danger`, `Warning`, `Link`

### Typography
```
DSTypography.{size}{Weight}
```
- Sizes: `bodyXs`, `bodySm`, `bodyMd`, `bodyLg`, `bodyXl`, `headingSm`, `headingMd`, `headingLg`
- Weights: (none), `Bold`, `Medium`

### Animation
```
DSAnimation.{action}
```
- Actions: `press`, `stateChange`, `loading`, `spring`, `expand`

---

## Files to Modify

When generating these tokens, the following files need updates:

1. **Color tokens:**
   - `DesignSystem/Tokens/Semantic/TokensSemanticLight.swift`
   - `DesignSystem/Tokens/Semantic/TokensSemanticDark.swift`
   - `DesignSystem/Tokens/Providers/SemanticTokensProvider.swift`
   - `DSColor.swift`

2. **Typography tokens:**
   - `DSTypography.swift`

3. **Animation tokens:**
   - `DSAnimation.swift`

4. **Spacing/Shadow tokens (if created):**
   - New files or additions to existing token providers

---

## Standard iOS/Android Platform Tokens Missing

This section identifies standard platform surface types, component patterns, and semantic tokens that are commonly needed for iOS and Android apps but are not present in the current semantic token system.

### Surface & Background Tokens

#### Missing Primary Surface Hierarchy

| Token Name | Platform Equivalent | Purpose |
|------------|---------------------|---------|
| `BackgroundSurfaceColorPrimary` | iOS: `systemBackground`, Android: `surface` | Main app background (missing - only have Secondary, Tertiary, Greige, Inverse) |
| `BackgroundSurfaceColorElevated` | iOS: `secondarySystemBackground`, Android: `surfaceContainer` | Elevated surfaces like cards, sheets |
| `BackgroundSurfaceColorGrouped` | iOS: `systemGroupedBackground` | Grouped content backgrounds (settings-style lists) |
| `BackgroundSurfaceColorGroupedSecondary` | iOS: `secondarySystemGroupedBackground` | Secondary grouped content |

#### Missing Navigation & System UI

| Token Name | Platform Equivalent | Purpose |
|------------|---------------------|---------|
| `BackgroundNavigationBar` | iOS: Navigation bar background | Top navigation bar background |
| `BackgroundTabBar` | iOS: Tab bar background | Bottom tab bar background |
| `BackgroundToolbar` | iOS: Toolbar background | Toolbar backgrounds |
| `BackgroundStatusBar` | Android: Status bar | Status bar tint color |
| `BackgroundSearchBar` | iOS: Search bar background | Search input container |

#### Missing Sheet & Modal Surfaces

| Token Name | Platform Equivalent | Purpose |
|------------|---------------------|---------|
| `BackgroundSheetColor` | iOS: Sheet background | Bottom sheet / half-sheet backgrounds |
| `BackgroundModalColor` | iOS/Android: Dialog background | Modal dialog backgrounds |
| `BackgroundPopoverColor` | iOS: Popover background | Popover/tooltip backgrounds |
| `BackgroundMenuColor` | iOS: Menu background, Android: Menu | Context menu backgrounds |
| `BackgroundToastColor` | Android: Snackbar | Toast/snackbar backgrounds |

### Text Color Tokens

#### Missing Standard Text Hierarchy

| Token Name | Platform Equivalent | Purpose |
|------------|---------------------|---------|
| `TextOnSurfaceColorPlaceholder` | iOS: `placeholderText`, Android: `onSurfaceVariant` | Placeholder/hint text in inputs |
| `TextOnSurfaceColorDisabled` | iOS: `tertiaryLabel`, Android: `onSurface` @ 38% | Disabled text state |
| `TextOnSurfaceColorLink` | iOS: `link`, Android: `primary` | Hyperlink text (requested by components) |
| `TextOnSurfaceColorDestructive` | iOS: `systemRed` | Destructive action text |

#### Missing Inverted/On-Color Text

| Token Name | Platform Equivalent | Purpose |
|------------|---------------------|---------|
| `TextOnPrimaryColorPrimary` | Android: `onPrimary` | Text on primary brand color |
| `TextOnPrimaryColorSecondary` | Android: `onPrimary` @ 70% | Secondary text on primary |
| `TextOnErrorColorPrimary` | Android: `onError` | Text on error backgrounds |
| `TextOnSuccessColorPrimary` | - | Text on success backgrounds |

### Icon Color Tokens

#### Missing Icon Semantic Colors

| Token Name | Platform Equivalent | Purpose |
|------------|---------------------|---------|
| `IconOnSurfaceColorPrimary` | iOS: `label`, Android: `onSurface` | Primary icons on surfaces |
| `IconOnSurfaceColorSecondary` | iOS: `secondaryLabel`, Android: `onSurfaceVariant` | Secondary/muted icons |
| `IconOnSurfaceColorTertiary` | iOS: `tertiaryLabel` | Tertiary/hint icons |
| `IconOnSurfaceColorDisabled` | iOS: `quaternaryLabel` | Disabled icon state |
| `IconOnSurfaceColorBrand` | - | Brand-colored icons (requested) |
| `IconOnSurfaceColorSuccess` | iOS: `systemGreen` | Success state icons |
| `IconOnSurfaceColorWarning` | iOS: `systemYellow` | Warning state icons (requested for ratings) |
| `IconOnSurfaceColorError` | iOS: `systemRed` | Error state icons |
| `IconOnSurfaceColorInfo` | iOS: `systemBlue` | Informational icons |
| `IconOnPrimaryColorPrimary` | Android: `onPrimary` | Icons on brand/primary backgrounds |

### Border & Divider Tokens

#### Missing Separator/Divider Colors

| Token Name | Platform Equivalent | Purpose |
|------------|---------------------|---------|
| `BorderDividerColorPrimary` | iOS: `separator`, Android: `outlineVariant` | Standard list dividers |
| `BorderDividerColorOpaque` | iOS: `opaqueSeparator` | Opaque dividers (no transparency) |
| `BorderOutlineColorPrimary` | Android: `outline` | General outline borders |
| `BorderOutlineColorVariant` | Android: `outlineVariant` | Subtle outline variant |
| `BorderFocusRing` | iOS: Focus ring, Android: Focus indicator | Accessibility focus indicator |

### Fill & Tint Tokens

#### Missing System Fill Colors

| Token Name | Platform Equivalent | Purpose |
|------------|---------------------|---------|
| `FillColorPrimary` | iOS: `systemFill` | Primary fill for shapes |
| `FillColorSecondary` | iOS: `secondarySystemFill` | Secondary fill |
| `FillColorTertiary` | iOS: `tertiarySystemFill` | Tertiary fill |
| `FillColorQuaternary` | iOS: `quaternarySystemFill` | Quaternary fill |

#### Missing Tint Colors

| Token Name | Platform Equivalent | Purpose |
|------------|---------------------|---------|
| `TintColorPrimary` | iOS: App tint color | Primary interactive tint |
| `TintColorSecondary` | - | Secondary tint for less prominent actions |

### Spacing Tokens

#### Missing Standard Spacing Scale

| Token Name | Value | Platform Reference |
|------------|-------|-------------------|
| `Spacing0` | 0 | Zero spacing |
| `Spacing1` | 4 | Extra small |
| `Spacing2` | 8 | Small (iOS standard) |
| `Spacing3` | 12 | Medium-small |
| `Spacing4` | 16 | Medium (iOS standard) |
| `Spacing5` | 20 | Medium-large |
| `Spacing6` | 24 | Large |
| `Spacing7` | 32 | Extra large |
| `Spacing8` | 40 | 2X large |
| `Spacing9` | 48 | 3X large |
| `Spacing10` | 64 | 4X large |

#### Missing Layout-Specific Spacing

| Token Name | Purpose |
|------------|---------|
| `SpacingContentInsetHorizontal` | Standard horizontal content inset (16pt iOS) |
| `SpacingContentInsetVertical` | Standard vertical content inset |
| `SpacingSafeAreaTop` | Safe area top inset reference |
| `SpacingSafeAreaBottom` | Safe area bottom inset reference |
| `SpacingListItemPadding` | Standard list item internal padding |
| `SpacingCardPadding` | Standard card internal padding |
| `SpacingSectionSpacing` | Spacing between content sections |
| `SpacingStackSpacing` | Default VStack/HStack spacing |

### Shadow/Elevation Tokens

#### Missing Elevation Scale

| Token Name | iOS Equivalent | Android Equivalent | Purpose |
|------------|----------------|-------------------|---------|
| `ElevationNone` | No shadow | 0dp | Flat surfaces |
| `ElevationXs` | Subtle shadow | 1dp | Slight lift (cards at rest) |
| `ElevationSm` | Light shadow | 2dp | Cards, tiles |
| `ElevationMd` | Medium shadow | 4dp | Raised buttons, FAB at rest |
| `ElevationLg` | Strong shadow | 8dp | Bottom sheets, dialogs |
| `ElevationXl` | Heavy shadow | 12dp | Navigation drawers |
| `Elevation2xl` | Maximum shadow | 16dp | Modals, popovers |

### Animation/Motion Tokens

#### Missing Standard Motion Curves

| Token Name | iOS Equivalent | Android Equivalent | Purpose |
|------------|----------------|-------------------|---------|
| `AnimationDurationInstant` | 0ms | 0ms | Instant/no animation |
| `AnimationDurationFast` | 100ms | 100ms | Quick micro-interactions |
| `AnimationDurationNormal` | 250ms | 250ms | Standard transitions |
| `AnimationDurationSlow` | 400ms | 400ms | Emphasis animations |
| `AnimationDurationVerySlow` | 500ms+ | 500ms+ | Complex sequences |
| `AnimationEaseIn` | easeIn | accelerate | Enter animations |
| `AnimationEaseOut` | easeOut | decelerate | Exit animations |
| `AnimationEaseInOut` | easeInOut | standard | Symmetric transitions |
| `AnimationSpring` | spring | - | Natural bounce (exists but document) |

### Component-Specific Platform Tokens

#### Missing List/Table Tokens

| Token Name | Purpose |
|------------|---------|
| `ListRowBackgroundDefault` | Default list row background |
| `ListRowBackgroundSelected` | Selected row background |
| `ListRowBackgroundHighlighted` | Pressed/highlighted row |
| `ListRowBackgroundSwipeAction` | Swipe action background |
| `ListSectionHeaderBackground` | Section header background |
| `ListSectionFooterBackground` | Section footer background |

#### Missing Navigation Tokens

| Token Name | Purpose |
|------------|---------|
| `NavigationTitleColor` | Navigation bar title color |
| `NavigationButtonTint` | Navigation button tint |
| `NavigationBackIndicator` | Back button indicator color |
| `TabBarItemActive` | Active tab item color |
| `TabBarItemInactive` | Inactive tab item color |
| `TabBarBadgeBackground` | Tab badge background |
| `TabBarBadgeText` | Tab badge text color |

#### Missing Form/Input Tokens

| Token Name | Purpose |
|------------|---------|
| `InputBackgroundDefault` | Text field background |
| `InputBackgroundFocused` | Focused input background |
| `InputBackgroundError` | Error state background |
| `InputBorderDefault` | Default input border |
| `InputBorderFocused` | Focused input border |
| `InputBorderError` | Error state border |
| `InputPlaceholderText` | Placeholder text color |
| `InputLabelText` | Input label color |
| `InputHelperText` | Helper/hint text color |
| `InputErrorText` | Error message text color |

---

## Summary: Platform Token Gaps

### Current Coverage Analysis

**What EXISTS in the current token system:**
- Button colors (brand, ghost, transparent, white variants with states)
- Feedback colors (error, warning, success, informational with accent variants)
- Selector colors (filled, outline variants with states)
- Input colors (basic states)
- Container colors (brand, greige, inverse, transparent variants)
- Text on container/surface (primary, secondary, tertiary, quaternary, accent, feedback states)
- Border colors for buttons, inputs, selectors, containers
- Border radius and width scales
- Color palettes (Brand, Cinnabar, Greige, Lemon, Moonlight, Neutrals, Transparent)
- Overlay pressed states

**What is MISSING for standard platform parity:**

| Category | Missing Count | Priority |
|----------|---------------|----------|
| Surface hierarchy tokens | 4 | High |
| Navigation/System UI surfaces | 5 | Medium |
| Sheet/Modal surfaces | 5 | High |
| Text hierarchy completion | 4 | High |
| On-color text variants | 4 | Medium |
| Icon semantic colors | 10 | High |
| Border/Divider colors | 5 | Medium |
| Fill/Tint colors | 6 | Low |
| Spacing scale | 10+ | High |
| Layout-specific spacing | 8 | Medium |
| Elevation/Shadow scale | 7 | High |
| Animation timing tokens | 9 | Medium |
| List/Table tokens | 6 | Medium |
| Navigation tokens | 7 | Medium |
| Form/Input tokens | 10 | High |

**Total platform standard tokens missing: ~100 tokens**

---

## Recommended Generation Priority

### Phase 1: Critical (Blocking Component Development)
1. Icon semantic colors (iconOnSurface variants)
2. Surface primary background
3. Spacing scale (Spacing0-10)
4. Elevation/Shadow scale

### Phase 2: High (Common UI Patterns)
1. Sheet/Modal surface colors
2. Form/Input tokens
3. Text placeholder/disabled states
4. Border divider colors

### Phase 3: Medium (Platform Completeness)
1. Navigation tokens
2. List/Table tokens
3. Animation timing tokens
4. Fill/Tint colors

### Phase 4: Nice to Have
1. Grouped background variants
2. Advanced on-color variants
3. System UI surfaces (if not using system defaults)
