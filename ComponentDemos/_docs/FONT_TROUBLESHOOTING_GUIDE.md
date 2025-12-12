# Font Troubleshooting Guide

## Current Issue
The custom fonts "THD LgVar Beta" and "THD SmVar Beta" are not loading properly in the app.

## Steps to Fix

### 1. Check Your Font Files in Xcode

First, verify that your font files are actually in your project:

1. In Xcode, use **⇧⌘O** (Shift-Command-O) to open the "Open Quickly" dialog
2. Type `.ttf` or `.otf` to find your font files
3. Note the **exact filenames** of your font files (they might be named differently than "THD LgVar Beta")

Common naming patterns:
- `THDLgVarBeta.ttf`
- `THD-LgVar-Beta.otf`
- `THDLgVar-Beta.ttf`
- Or any variation with spaces, hyphens, or underscores

### 2. Verify Font Files Are in Target Membership

For each font file:

1. Select the font file in Xcode
2. Open the File Inspector (⌥⌘1 or View > Inspectors > File)
3. Under "Target Membership", ensure your app target is **checked**
4. The font should also appear in your target's **Copy Bundle Resources** build phase

To check Copy Bundle Resources:
1. Select your project in the navigator
2. Select your app target
3. Go to "Build Phases"
4. Expand "Copy Bundle Resources"
5. Your font files should be listed there

### 3. Add Fonts to Info.plist

Your fonts must be declared in Info.plist:

1. Open your `Info.plist` file
2. Add a new entry: **"Fonts provided by application"** (or `UIAppFonts`)
3. Add array items with the **exact filename including extension**:
   ```
   Fonts provided by application (Array)
       Item 0: THDLgVarBeta.ttf     (or whatever your actual filename is)
       Item 1: THDSmVarBeta.ttf     (or whatever your actual filename is)
   ```

### 4. Find the PostScript Names

The filename and the font's PostScript name are often different. To find the real PostScript name:

**Option A: Use Font Book (Mac)**
1. Open the font file in Font Book (double-click the .ttf/.otf file)
2. Select the font
3. Go to Preview > Show Font Info (⌘I)
4. Look for "PostScript name" - this is what you use in code

**Option B: Use the updated registration code**
The improved `CustomFontRegistration.registerFonts()` will now print the actual PostScript names when it loads the fonts.

### 5. Update CustomFonts.swift

In `CustomFonts.swift`, update the `fontFileMapping` with your actual filenames:

```swift
private static let fontFileMapping: [(fileName: String, postScriptName: String)] = [
    // fileName = the actual file name WITHOUT extension
    // postScriptName = the font's PostScript name (what you use in .custom())
    ("YourActualFileName1", "THD LgVar Beta"),  // Display font
    ("YourActualFileName2", "THD SmVar Beta")   // Informational font
]
```

### 6. Call Font Registration at App Launch

Make sure you're calling `CustomFontRegistration.registerFonts()` when your app starts.

Add this to your App struct's `init()`:

```swift
import SwiftUI

@main
struct YourApp: App {
    init() {
        // Register custom fonts
        CustomFontRegistration.registerFonts()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
```

### 7. Test with FontVerificationView

Run your app and navigate to `FontVerificationView` to see:
- Which fonts are successfully loaded (✅ green checkmark)
- Which fonts failed to load (❌ red X)
- A visual comparison between custom fonts and system fallbacks

### 8. Check the Console Output

The improved font registration code now provides detailed debug output:

```
🔍 Starting font registration...

📦 Font files in bundle:
   • THDLgVarBeta.ttf
   • THDSmVarBeta.ttf

✅ Successfully registered font file: THDLgVarBeta.ttf
   ✅ Font is accessible as: 'THD LgVar Beta'
   📝 PostScript name: THDLgVarBeta-Regular
   👨‍👩‍👧‍👦 Family name: THD LgVar Beta

✅ Font registration complete
```

If you see warnings like:
```
⚠️ Font file not found: 'THD LgVar Beta' (tried .ttf and .otf)
```

This means the **filename** doesn't match. Update your `fontFileMapping` in CustomFonts.swift.

If you see:
```
⚠️ Font registered but not accessible with name 'THD LgVar Beta'
📝 Actual PostScript name: 'THDLgVarBeta-Regular'
```

This means the **PostScript name** is different. Update your `TokensCoreLight.swift` or use the actual PostScript name in your font definitions.

## Common Issues

### Issue: "Font file not found"
**Cause**: Font files aren't in the bundle or filenames don't match  
**Fix**: Check steps 1-2 above

### Issue: "Font registered but not accessible"
**Cause**: PostScript name doesn't match what you're using in code  
**Fix**: Use Font Book to find the real PostScript name, or check console output from the new registration code

### Issue: Fonts work in Xcode previews but not on device
**Cause**: Font files not in Info.plist  
**Fix**: Add fonts to Info.plist (step 3 above)

### Issue: Fonts show as system default
**Cause**: Font registration not called, or font names are wrong  
**Fix**: Ensure registration is called in app init (step 6) and names match (step 5)

## Quick Diagnostic Checklist

- [ ] Font files (.ttf or .otf) are visible in Xcode project
- [ ] Font files have target membership checked
- [ ] Font files are in "Copy Bundle Resources" build phase
- [ ] Fonts are listed in Info.plist under UIAppFonts
- [ ] Font filenames in code match actual filenames (without extension)
- [ ] PostScript names in code match actual font PostScript names
- [ ] `CustomFontRegistration.registerFonts()` is called in app init
- [ ] Console shows "✅ Successfully registered font" messages
- [ ] FontVerificationView shows green checkmarks

## Still Having Issues?

Run `FontVerificationView` in your app and:
1. Check the "Custom Font Status" section for red ❌ marks
2. Scroll to "All Available Fonts" and search for "THD" to see if they're loaded under a different name
3. Check the Xcode console for detailed diagnostic output
4. Compare the "Font Display Test" sections - if the orange fallback text looks the same as the custom font text, the font isn't loading

The new debug output in `CustomFontRegistration` will tell you exactly what's wrong.
