# French Door Images Setup Guide

## Overview
This folder contains local images for the French Door Refrigerators filter panel. These images need to be added to your Xcode project to be loaded at runtime.

## Quick Setup Instructions

### Option 1: Add Folder as Resource to Xcode Project (Recommended)

1. **Open Xcode** with your CameraEye project
2. **Right-click** on the project navigator (left sidebar) and select **"Add Files to CameraEye..."**
3. **Navigate** to `ComponentDemos/Data/french-door-images/`
4. **Select the entire `french-door-images` folder**
5. **Check these options:**
   - ✅ "Copy items if needed"
   - ✅ "Create folder references" (NOT "Create groups")
   - ✅ Add to target: "CameraEye"
6. **Click "Add"**

### Option 2: Add to Asset Catalog

Alternatively, you can add individual images to your Assets.xcassets:

1. Open `Assets.xcassets` in Xcode
2. Drag the images from `french-door-images/` into the asset catalog
3. The images will be available by their name (e.g., `imgi_39_fingerprint-resistant-stainless-steel-ge-french-door-refrigerators-gfe26jymfs-64_600`)

## Current Images (18 files)

### Hero Image
- `imgi_10_D29A-2025-Winter-Appliances-Hero-Refrigerators.png`

### Product Images (10)
- `imgi_5_stainless-steel-samsung-french-door-refrigerators-rf70f29mer-64_600.jpg`
- `imgi_36_printproof-stainless-steel-lg-french-door-refrigerators-lf25z6211s-64_600.jpg`
- `imgi_39_fingerprint-resistant-stainless-steel-ge-french-door-refrigerators-gfe26jymfs-64_600.jpg`
- `imgi_46_printproof-stainless-steel-lg-french-door-refrigerators-lf29h8330s-64_600.jpg`
- `imgi_48_stainless-steel-lg-french-door-refrigerators-lfcs22520s-64_600.jpg`
- `imgi_50_smudge-proof-stainless-steel-frigidaire-french-door-refrigerators-frfn2813af-64_600.jpg`
- `imgi_57_smudge-proof-stainless-steel-frigidaire-french-door-refrigerators-grmc2273cf-64_600.jpg`
- `imgi_75_stainless-steel-ge-french-door-refrigerators-pxd22bypfs-64_600.jpg`
- `imgi_76_stainless-steel-ge-french-door-refrigerators-pxd22bypfs-e4_600.jpg`

### Style Pill Images (3)
- `imgi_56_10Oct23_SidebySide_Refrigerator.jpg` - Side by Side style
- `imgi_57_10Oct23_TopFreezer.jpg` - Top Freezer style
- `imgi_60_10OCT23_Refrigerators_MiniFridge.jpg` - Mini Fridge style

### Color Swatches (5)
- `imgi_67_bf5e6e0b-fd07-48db-bd54-f7d39dc73900_Stainless_Steel_Swatch__2_.jpg`
- `imgi_68_1023Refrigeration_BlkStainlessSteel.jpg`
- `imgi_69_1023Refrigeration_White.jpg`
- `imgi_70_1023Refrigeration_Black.jpg`
- `imgi_71_1023Refrigeration_Slate.jpg`

## How It Works

The `DSPlpFilterPanel` component now supports both remote URLs and local file paths:

### Remote URLs (HTTP/HTTPS)
```swift
DSStylePillItem(
    text: "French Door",
    imageURL: "https://images.thdstatic.com/..."
)
```

### Local File Paths
```swift
DSStylePillItem(
    text: "French Door",
    imageURL: "french-door-images/imgi_39_fingerprint-resistant-stainless-steel-ge-french-door-refrigerators-gfe26jymfs-64_600.jpg"
)
```

The component automatically detects which type of path it is and loads accordingly.

## Testing

After adding the images to your Xcode project:

1. Build and run the app
2. Navigate to the PLP view (Product Listing Page)
3. Check the filter panel at the top
4. You should see the style pills with actual refrigerator images instead of SF Symbols

## Troubleshooting

### Images not showing up?

Check the console output for messages like:
- ⚠️ Failed to load local image: ...
- ❌ Failed to load remote image: ...

### Common Issues:

1. **Images not in bundle**: Make sure you added them as resources (Option 1 above)
2. **Wrong path**: Verify the JSON paths match the actual filenames
3. **Wrong target**: Ensure the images are added to the correct app target

## File Structure

```
ComponentDemos/
  Data/
    french-door-images/
      imgi_5_...jpg
      imgi_10_...png
      imgi_36_...jpg
      (etc.)
    french-door-refrigerators.json  ← References these images
    pip-datasets.json
```

## JSON Integration

The images are referenced in `french-door-refrigerators.json`:

```json
{
  "refrigeratorStyles": [
    {
      "styleId": "french-door",
      "styleName": "French Door",
      "image": "french-door-images/imgi_39_fingerprint-resistant-stainless-steel-ge-french-door-refrigerators-gfe26jymfs-64_600.jpg"
    }
  ]
}
```

## Updates Made

1. ✅ Renamed folder from "French Door Refrigerators - The Home Depot/" to "french-door-images/"
2. ✅ Updated 3 JSON files with local paths
3. ✅ Deleted 93 unused images (social media icons, promotional banners, etc.)
4. ✅ Kept 18 essential images
5. ✅ Updated DSPlpFilterPanel to support local image loading
