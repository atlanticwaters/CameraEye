# Debugging Refrigerator Style Pill Images

## Problem
The refrigerator category style pills are showing SF Symbol placeholders instead of real product images.

## Changes Made

I've added comprehensive diagnostic logging throughout the image loading pipeline to help identify where the issue is occurring.

## What to Check

### 1. Run the Refrigerator Preview

```swift
#Preview("PLP - Refrigerators") {
    PLPView(category: .refrigerators)
}
```

### 2. Check Your Console Output

You should now see detailed logging that will tell us exactly what's happening. Here's what to look for:

#### ✅ Expected Success Output:

```
✅ Successfully loaded category data from french-door-refrigerators.json
   📊 Total products: 10
   🎨 Style pills: 6
🎨 Created 6 style pills from category data
   ✅ French Door
Refrigerators: https://images.thdstatic.com/productImages/311411352/311411352_64_400.jpg
   ✅ Side by Side
Refrigerators: https://images.thdstatic.com/productImages/312283386/312283386_64_400.jpg
   ✅ Top Freezer
Refrigerators: https://images.thdstatic.com/productImages/319881477/319881477_64_400.jpg
   ✅ Bottom Freezer
Refrigerators: https://images.thdstatic.com/productImages/319240123/319240123_64_400.jpg
   ✅ Mini Fridges: https://images.thdstatic.com/productImages/328264448/328264448_64_400.jpg
   ✅ Freezerless
Refrigerators: https://images.thdstatic.com/productImages/325646357/325646357_64_400.jpg
🔄 Loading remote image for 'French Door
Refrigerators': https://images.thdstatic.com/productImages/311411352/311411352_64_400.jpg
🔄 Loading remote image for 'Side by Side
Refrigerators': https://images.thdstatic.com/productImages/312283386/312283386_64_400.jpg
... (more loading messages)
✅ Successfully loaded image: https://images.thdstatic.com/productImages/311411352/311411352_64_400.jpg
✅ Successfully loaded image: https://images.thdstatic.com/productImages/312283386/312283386_64_400.jpg
... (more success messages)
```

#### ❌ Problem Scenario 1: JSON File Not Found

```
❌ Error: Could not find french-door-refrigerators.json in bundle
```

**What this means**: The JSON file isn't in your Xcode project or isn't included in the target.

**Solution**:
1. Open Xcode Project Navigator (⌘1)
2. Look for `french-door-refrigerators.json`
3. If it doesn't exist, you need to add it to your project
4. If it exists, select it and check the File Inspector (⌥⌘1)
5. Ensure "Target Membership" includes your app target (checkbox should be checked)

#### ❌ Problem Scenario 2: JSON Loaded But No Image URLs

```
✅ Successfully loaded category data from french-door-refrigerators.json
   📊 Total products: 10
   🎨 Style pills: 6
🎨 Created 6 style pills from category data
   ⚠️ French Door
Refrigerators: No image URL (using fallback)
   ⚠️ Side by Side
Refrigerators: No image URL (using fallback)
... (all showing warnings)
```

**What this means**: The JSON file loads, but the `refrigeratorStyles[].image` field is missing or empty.

**Solution**: Check the JSON file structure. Each item in `refrigeratorStyles` should have an `image` field:

```json
{
  "refrigeratorStyles": [
    {
      "styleId": "french-door",
      "styleName": "French Door\nRefrigerators",
      "image": "https://images.thdstatic.com/productImages/...",
      ...
    }
  ]
}
```

#### ❌ Problem Scenario 3: URLs Present But Images Not Loading

```
✅ Successfully loaded category data from french-door-refrigerators.json
🎨 Created 6 style pills from category data
   ✅ French Door
Refrigerators: https://images.thdstatic.com/productImages/311411352/311411352_64_400.jpg
🔄 Loading remote image for 'French Door
Refrigerators': https://images.thdstatic.com/productImages/311411352/311411352_64_400.jpg
❌ Failed to load remote image: https://images.thdstatic.com/productImages/311411352/311411352_64_400.jpg
   Error: URLError(_nsError: Error Domain=NSURLErrorDomain Code=-1009 ...)
```

**What this means**: The URLs are correct, but network loading is failing.

**Possible causes**:
1. **No internet connection** - Check your simulator/device network
2. **App Transport Security** - THD images use HTTPS so this shouldn't be the issue
3. **Network permissions** - Ensure your app has network access
4. **Simulator network issue** - Try resetting the simulator

**Solutions**:
- Check network connectivity
- Try opening one of the image URLs in Safari to verify it works
- Reset simulator: Device → Erase All Content and Settings
- Check Console.app for more detailed network errors

#### ❌ Problem Scenario 4: No Console Output At All

**What this means**: The category initialization isn't running, or the preview isn't loading.

**Solution**:
1. Make sure the preview is actually running (click the preview refresh button)
2. Check for any build errors
3. Try cleaning the build folder (⌘⇧K) and rebuilding

## Diagnostic Checklist

Run through this checklist and note what you see:

- [ ] Preview compiles without errors
- [ ] Preview shows the PLP view
- [ ] Console shows: "Successfully loaded category data from french-door-refrigerators.json"
- [ ] Console shows: "Created 6 style pills from category data"
- [ ] Console shows: Image URLs for each style pill (✅ vs ⚠️)
- [ ] Console shows: "Loading remote image" messages
- [ ] Console shows: "Successfully loaded image" messages (or error messages)
- [ ] UI shows: Gray spinner circles (loading state)
- [ ] UI shows: Red circles with warnings (error state)
- [ ] UI shows: Actual product images (success state)
- [ ] UI shows: SF Symbol icons only (fallback state)

## Quick Tests

### Test 1: Verify JSON File Exists
Add this temporary code to check if the file can be found:

```swift
// Add to your preview or app startup
let testURL = Bundle.main.url(forResource: "french-door-refrigerators", withExtension: "json")
print("📁 JSON file URL: \(testURL?.path ?? "NOT FOUND")")
```

### Test 2: Test with Known Working URL
Create a test category with a known working image URL:

```swift
static let testCategory = PLPCategory(
    title: "TEST",
    breadcrumbFilter: "Test",
    stylePills: [
        DSStylePillItem(
            text: "Test Image",
            image: Image(systemName: "photo"),
            imageURL: "https://images.thdstatic.com/productImages/311411352/311411352_64_400.jpg"
        )
    ],
    filterPills: [],
    subFilterPills: []
)

#Preview("Test") {
    PLPView(category: .testCategory)
}
```

If this shows a real image, then `AsyncImage` works and the issue is with data loading.

### Test 3: Check Network Connectivity
Try loading any image in the simulator:

```swift
#Preview("Network Test") {
    AsyncImage(url: URL(string: "https://images.thdstatic.com/productImages/311411352/311411352_64_400.jpg")) { phase in
        switch phase {
        case .empty:
            Text("Loading...")
        case .success(let image):
            image.resizable().scaledToFit()
        case .failure(let error):
            Text("Error: \(error.localizedDescription)")
        @unknown default:
            Text("Unknown")
        }
    }
    .frame(width: 200, height: 200)
}
```

## Common Solutions

### Solution 1: Add JSON File to Project
1. Drag `french-door-refrigerators.json` into Xcode
2. Check "Copy items if needed"
3. Select your app target
4. Click "Finish"

### Solution 2: Fix Target Membership
1. Select `french-door-refrigerators.json` in Project Navigator
2. Open File Inspector (⌥⌘1)
3. Under "Target Membership", check your app target

### Solution 3: Clean and Rebuild
1. Clean build folder: ⌘⇧K
2. Clear derived data: Xcode → Settings → Locations → Derived Data → Delete
3. Quit and restart Xcode
4. Rebuild project

### Solution 4: Network Permissions (macOS apps)
If building for macOS, check your entitlements:
1. Select your target
2. Signing & Capabilities
3. Ensure "Outgoing Connections (Client)" is enabled in App Sandbox

### Solution 5: Use Local Images
As a temporary workaround, you can add images to Assets.xcassets:
1. Add images named `refrigerator_french_door`, etc.
2. Update style pills:
```swift
DSStylePillItem(
    text: "French Door\nRefrigerators",
    image: Image("refrigerator_french_door")
)
```

## Expected Behavior When Working

1. **Initial Load** (0-0.5s):
   - Style pills render with gray circles
   - ProgressView spinners show

2. **Image Loading** (0.5-2s):
   - Console shows "Loading remote image" for each pill
   - AsyncImage begins downloading

3. **Success** (1-3s):
   - Console shows "Successfully loaded image" for each
   - Circular product photos appear in pills
   - Images should be from the actual refrigerator products

4. **Cached** (subsequent views):
   - Images load instantly from cache
   - No spinners, immediate display

## Report Back

After running the preview, please report:

1. **What console output do you see?** (copy/paste the relevant logs)
2. **What do the style pills look like in the UI?**
   - SF Symbol icons only?
   - Gray circles with spinners?
   - Red circles with warnings?
   - Actual product images?
3. **Do you see any errors in the console?**

With this information, I can provide specific guidance on fixing the issue!

## Summary

The logging additions will help us determine:
- ✅ Is the JSON file loading?
- ✅ Are image URLs being extracted?
- ✅ Are images being requested?
- ✅ Are images loading successfully or failing?

**Check your console output and let me know what you see!** 🔍
