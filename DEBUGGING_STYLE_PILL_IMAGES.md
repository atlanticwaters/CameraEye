# Debugging Product Images in Style Pills

## Current Issue
The style pills are showing SF Symbol placeholders instead of real product images from the dataset.

## Updated Code with Debugging

I've added comprehensive logging to help diagnose the issue. Here's what to check:

### 1. Run the "Refrigerators (Real Images)" Preview

```swift
#Preview("PLP - Refrigerators (Real Images)") {
    PLPView(category: .refrigeratorsWithImages)
}
```

### 2. Check Console Output

When the preview runs, you should see output like this:

#### Expected Successful Output:
```
🔍 Loading style pills with real images for: REFRIGERATORS
📊 Total datasets loaded: 500
✅ Found product for 'French Door\nRefrigerators':
   📦 Product: LG 28 cu. ft. French Door Refrigerator...
   🖼️ Image URL: https://images.thdstatic.com/productImages/abc123.jpg
✅ Found product for 'Side by Side\nRefrigerators':
   📦 Product: Samsung 25 cu. ft. Side by Side...
   🖼️ Image URL: https://images.thdstatic.com/productImages/def456.jpg
```

#### Possible Problem Outputs:

**Problem 1: No datasets loaded**
```
🔍 Loading style pills with real images for: REFRIGERATORS
📊 Total datasets loaded: 0
❌ No product found for 'French Door\nRefrigerators' matching 'French Door'
```
→ **Solution**: pip-datasets.json is missing or not loading

**Problem 2: Products found but no matches**
```
🔍 Loading style pills with real images for: REFRIGERATORS
📊 Total datasets loaded: 500
❌ No product found for 'French Door\nRefrigerators' matching 'French Door'
❌ No product found for 'Side by Side\nRefrigerators' matching 'Side by Side'
```
→ **Solution**: Breadcrumb labels in JSON don't contain "French Door", "Side by Side", etc.

**Problem 3: Image load failures**
```
✅ Found product for 'French Door\nRefrigerators':
   🖼️ Image URL: https://images.thdstatic.com/productImages/abc123.jpg
❌ Failed to load image: https://images.thdstatic.com/productImages/abc123.jpg
   Error: URLError(.cannotFindHost)
```
→ **Solution**: Network issue or invalid URL format

## Visual Indicators in UI

I've updated the style pill rendering to show different states:

### Loading State
- Gray circle with ProgressView spinner
- Shows while image is downloading

### Success State  
- Actual product image in circular frame
- This is what you want to see!

### Error State
- Red-tinted circle with fallback icon or warning symbol
- Indicates image failed to load

### No URL State
- SF Symbol (refrigerator.fill, etc.)
- Gray/colored icon
- This is what you're currently seeing

## Troubleshooting Steps

### Step 1: Verify pip-datasets.json Exists

Check that the JSON file is in your Xcode project:
1. Look in Project Navigator
2. File should be named: `pip-datasets.json` (or `plp-datasets.json`)
3. File should be included in target membership

### Step 2: Check JSON Structure

Open the JSON file and verify it has products with breadcrumbs:

```json
{
  "pipDatasets": [
    {
      "productId": "...",
      "breadcrumbs": [
        { "label": "Appliances" },
        { "label": "Refrigerators" },
        { "label": "French Door Refrigerators" }  ← Should contain "French Door"
      ],
      "media": {
        "primaryImage": "https://images.thdstatic.com/..."  ← Should be valid URL
      }
    }
  ]
}
```

### Step 3: Verify PLPDataLoader

The loader should successfully load the JSON. Check `PLPDataModels.swift`:

```swift
func loadPIPDatasets() -> [PIPDataset] {
    guard let url = Bundle.main.url(forResource: "pip-datasets", withExtension: "json") else {
        print("❌ Error: Could not find pip-datasets.json in bundle")
        return []
    }
    
    do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let container = try decoder.decode(PIPDatasetsContainer.self, from: data)
        print("✅ Successfully loaded \(container.pipDatasets.count) products from pip-datasets.json")
        return container.pipDatasets
    } catch {
        print("❌ Error loading pip-datasets.json: \(error)")
        return []
    }
}
```

### Step 4: Check Network Permissions

If using simulator/device, ensure network access is allowed:
- Check Info.plist for App Transport Security settings
- Simulator should have network access by default
- Real device needs internet connection

### Step 5: Inspect Actual Data

Add this temporary code to see what's in the dataset:

```swift
// In withProductImages(), after loading datasets:
if let firstProduct = datasets.first {
    print("📋 Sample product breadcrumbs:")
    firstProduct.breadcrumbs.forEach { breadcrumb in
        print("   - \(breadcrumb.label)")
    }
    print("🖼️ Sample image URL: \(firstProduct.media.primaryImage)")
}
```

## Common Issues & Solutions

### Issue 1: SF Symbols Showing (No Image URL)

**Symptom**: Generic refrigerator icons, no loading spinner
**Cause**: `item.imageURL` is `nil`
**Debug**: Check console for "❌ No product found for..."
**Solution**: 
- Verify JSON file exists and loads
- Check breadcrumb matching logic
- May need to adjust breadcrumbMatch strings

### Issue 2: Red Circle with Warning

**Symptom**: Red-tinted circle, warning triangle icon  
**Cause**: Image URL found but failed to load
**Debug**: Check console for "❌ Failed to load image:"
**Solution**:
- Check URL format (should start with http:// or https://)
- Verify network connectivity
- Check if URL is actually valid (test in browser)

### Issue 3: Spinner Never Completes

**Symptom**: Gray circle with spinner indefinitely
**Cause**: AsyncImage stuck in .empty state
**Solution**:
- Network timeout
- Invalid URL that doesn't fail quickly
- Check device/simulator network settings

### Issue 4: Wrong Images Loading

**Symptom**: Images load but wrong products shown
**Cause**: Breadcrumb matching too broad
**Solution**: Make breadcrumbMatch more specific:

```swift
// Too broad - might match wrong products
("Refrigerators", "Refr", "refrigerator.fill")

// Better - more specific
("French Door\nRefrigerators", "French Door Refrigerator", "refrigerator.fill")
```

## Quick Test

### Create a Simple Test Category

Add this to PLPCategory to test with a simpler example:

```swift
static let testWithHardcodedURL: PLPCategory = {
    let testPills = [
        DSStylePillItem(
            text: "Test Image",
            image: Image(systemName: "photo"),
            imageURL: "https://via.placeholder.com/150"  // Known working URL
        )
    ]
    
    return PLPCategory(
        title: "TEST",
        breadcrumbFilter: "Test",
        stylePills: testPills,
        filterPills: [],
        subFilterPills: []
    )
}()
```

Then preview:
```swift
#Preview("Test Hardcoded URL") {
    PLPView(category: .testWithHardcodedURL)
}
```

If this shows a real image, the AsyncImage rendering works and the issue is with data loading.

## Expected Behavior

### When Working Correctly:

1. **Category loads** → `withProductImages()` called
2. **Console shows**: "📊 Total datasets loaded: 500"
3. **For each style**: Console shows "✅ Found product..." with URL
4. **Pills render**: 
   - Brief gray spinner (0.5-2 seconds)
   - Then real product image appears
5. **Subsequent views**: Images cached, load instantly

### Timeline:
```
0.0s - Category created, withProductImages() runs
0.1s - Datasets loaded from JSON
0.2s - Products matched, URLs extracted
0.3s - Style pills render with AsyncImage
0.5s - First image appears
1.0s - All images loaded
```

## Next Steps

1. **Run the preview** with "Refrigerators (Real Images)"
2. **Check console** for the debug output
3. **Report back** what you see:
   - Total datasets loaded?
   - Any products found?
   - What image URLs are logged?
   - What error messages appear?

Based on the console output, we can identify exactly what's wrong and fix it!

## Fallback Plan

If you can't get real images loading, you can still use local image assets:

1. Add images to Assets.xcassets named:
   - `refrigerator_french_door`
   - `refrigerator_side_by_side`
   - etc.

2. Update category:
```swift
DSStylePillItem(
    text: "French Door\nRefrigerators",
    image: Image("refrigerator_french_door")  // Uses asset
)
```

This bypasses the async loading entirely.

---

**Please check your console output and let me know what you see!** 🔍
