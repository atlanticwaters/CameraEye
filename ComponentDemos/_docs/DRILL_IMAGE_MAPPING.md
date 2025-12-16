# Power Drills Image Mapping

## Overview
This document maps the power drill products in `power-drills.json` to their expected local image filenames in the `product-images` folder.

## Image Naming Convention
Images follow this pattern: `{brand}-{model}-{description}.jpg`
- Brand: lowercase (dewalt, milwaukee, makita, ryobi, bosch)
- Model: lowercase model number
- Description: abbreviated product description (kebab-case)

## Product Image Mapping

### 1. DeWalt DCD791D2 - 20V MAX XR Cordless Drill/Driver Kit
- **Product ID**: 204279858
- **Model**: DCD791D2
- **Expected Filename**: `dewalt-dcd791d2-20v-max-xr-cordless-drill-driver-kit.jpg`
- **Alternate Filename**: `dewalt-dcd791d2-alt.jpg`
- **Use Case**: Cordless Drills style pill

### 2. Milwaukee 2804-22 - M18 FUEL Hammer Drill/Driver Kit
- **Product ID**: 325479354
- **Model**: 2804-22
- **Expected Filename**: `milwaukee-2804-22-m18-fuel-hammer-drill-driver-kit.jpg`
- **Use Case**: Hammer Drills style pill

### 3. Ryobi P215K - ONE+ 18V Cordless Drill/Driver Kit
- **Product ID**: 305529238
- **Model**: P215K
- **Expected Filename**: `ryobi-p215k-one-plus-18v-cordless-drill-driver-kit.jpg`
- **Use Case**: Product listing

### 4. Makita XFD131 - 18V LXT Brushless Driver-Drill Kit
- **Product ID**: 322138372
- **Model**: XFD131
- **Expected Filename**: `makita-xfd131-18v-lxt-brushless-driver-drill-kit.jpg`
- **Use Case**: Product listing

### 5. Bosch GSB18V-490B12 - 18V EC Brushless Hammer Drill
- **Product ID**: 308067442
- **Model**: GSB18V-490B12
- **Expected Filename**: `bosch-gsb18v-490b12-18v-ec-brushless-hammer-drill.jpg`
- **Use Case**: Corded Drills style pill (note: actually cordless, but used for this style)

### 6. DeWalt DCD999T1 - 20V MAX XR FLEXVOLT Hammer Drill
- **Product ID**: 312119566
- **Model**: DCD999T1
- **Expected Filename**: `dewalt-dcd999t1-20v-max-xr-flexvolt-hammer-drill.jpg`
- **Use Case**: Drill Combo Kits style pill

### 7. Milwaukee 2903-22 - M18 FUEL Drill/Driver (Tool-Only)
- **Product ID**: 204632932
- **Model**: 2903-22
- **Expected Filename**: `milwaukee-2903-22-m18-fuel-drill-driver-tool-only.jpg`
- **Use Case**: Impact Drivers style pill

### 8. Ryobi PBLDD01K - ONE+ HP 18V Brushless Drill/Driver Kit
- **Product ID**: 325544370
- **Model**: PBLDD01K
- **Expected Filename**: `ryobi-pbldd01k-one-plus-hp-18v-brushless-drill-driver.jpg`
- **Use Case**: Product listing

### 9. Makita XPH14Z - 18V LXT Brushless Hammer Driver-Drill
- **Product ID**: 326112747
- **Model**: XPH14Z
- **Expected Filename**: `makita-xph14z-18v-lxt-brushless-hammer-driver-drill.jpg`
- **Use Case**: Product listing

### 10. DeWalt DCD708C2 - ATOMIC 20V MAX Compact Drill/Driver
- **Product ID**: 311575948
- **Model**: DCD708C2
- **Expected Filename**: `dewalt-dcd708c2-atomic-20v-max-compact-drill-driver.jpg`
- **Use Case**: Product listing

## Style Pill Image Requirements

The 5 category style pills require these images:

1. **Cordless Drills**: `dewalt-dcd791d2-20v-max-xr-cordless-drill-driver-kit.jpg`
2. **Corded Drills**: `bosch-gsb18v-490b12-18v-ec-brushless-hammer-drill.jpg`
3. **Hammer Drills**: `milwaukee-2804-22-m18-fuel-hammer-drill-driver-kit.jpg`
4. **Impact Drivers**: `milwaukee-2903-22-m18-fuel-drill-driver-tool-only.jpg`
5. **Drill Combo Kits**: `dewalt-dcd999t1-20v-max-xr-flexvolt-hammer-drill.jpg`

## How Images are Resolved

1. **JSON stores path**: `"product-images/dewalt-dcd791d2-20v-max-xr-cordless-drill-driver-kit.jpg"`
2. **Code extracts filename**: `convertToAssetName()` removes path and extension
3. **Asset name becomes**: `dewalt-dcd791d2-20v-max-xr-cordless-drill-driver-kit`
4. **Xcode looks for**: Asset in catalog OR file in product-images folder

## Fallback Behavior

If images aren't found:
- Style pills will fall back to SF Symbols (wrench.and.screwdriver icon)
- Product cards will show placeholder or no image
- App will continue to function with JSON data

## Next Steps

To make images appear:
1. Download product images from Home Depot or manufacturer websites
2. Rename them according to the mapping above
3. Place them in the `product-images` folder in Xcode
4. Ensure they're added to the target (check Target Membership in Xcode)
5. Build and run - images should now appear!

## Alternative: Using Asset Catalog

Instead of file references, you can also:
1. Add images to Assets.xcassets
2. Name them exactly as shown above (without .jpg extension)
3. The code will automatically find them by name
