# Rive Runtime Setup Guide for CameraEye

## Overview
This guide will walk you through setting up the Rive runtime in your CameraEye iOS app. Rive is a powerful tool for creating interactive animations and vector graphics that run smoothly in your SwiftUI app.

## Step 1: Add Rive as a Swift Package Dependency

### In Xcode:

1. **Open your CameraEye project** in Xcode
2. **Select your project** in the Project Navigator (the blue CameraEye icon at the top)
3. **Select the CameraEye target** under "Targets"
4. **Click on the "General" tab**, then scroll down to "Frameworks, Libraries, and Embedded Content"
5. Alternatively, go to **File → Add Package Dependencies...**
6. **In the search bar**, paste the Rive iOS repository URL:
   ```
   https://github.com/rive-app/rive-ios
   ```
7. **Select the version**:
   - Choose "Up to Next Major Version" and enter `6.0.0` (or latest)
8. **Click "Add Package"**
9. **Select the products to add**:
   - ✅ Check **RiveRuntime** (this is the main library you need)
10. **Click "Add Package"**

## Step 2: Create a Simple Rive View

Here's a basic SwiftUI view that displays a Rive animation:

```swift
//
//  RiveExampleView.swift
//  CameraEye
//
//  Created by Rive Setup
//

import SwiftUI
import RiveRuntime

struct RiveExampleView: View {
    var body: some View {
        RiveViewModel(fileName: "your_animation").view()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    RiveExampleView()
}
```

## Step 3: Add Your Rive Animation Files

1. **Export your animation** from Rive as a `.riv` file
2. **In Xcode**, right-click on your project navigator
3. **Select "Add Files to CameraEye..."**
4. **Navigate to your `.riv` file** and select it
5. **Make sure to check**:
   - ✅ "Copy items if needed"
   - ✅ Add to target: "CameraEye"
6. **Click "Add"**

The `.riv` file will now be bundled with your app and can be loaded by name (without the extension).

## Step 4: Advanced Usage Examples

### Example 1: Interactive Rive Animation with State Machine

```swift
import SwiftUI
import RiveRuntime

struct InteractiveRiveView: View {
    @StateObject private var viewModel = RiveViewModel(
        fileName: "button_animation",
        stateMachineName: "State Machine 1"
    )
    
    var body: some View {
        VStack {
            viewModel.view()
                .frame(width: 300, height: 300)
            
            Button("Trigger Animation") {
                // Trigger a state machine input
                viewModel.triggerInput("Hover")
            }
            .padding()
        }
    }
}
```

### Example 2: Rive Animation with Playback Control

```swift
import SwiftUI
import RiveRuntime

struct ControlledRiveView: View {
    @StateObject private var viewModel = RiveViewModel(fileName: "loading_animation")
    
    var body: some View {
        VStack(spacing: 20) {
            viewModel.view()
                .frame(width: 200, height: 200)
            
            HStack(spacing: 20) {
                Button("Play") {
                    viewModel.play()
                }
                
                Button("Pause") {
                    viewModel.pause()
                }
                
                Button("Stop") {
                    viewModel.stop()
                }
            }
            .buttonStyle(.bordered)
        }
        .padding()
    }
}
```

### Example 3: Rive in Your Splash Screen

You could enhance your existing `SplashScreenView` with a Rive animation:

```swift
import SwiftUI
import RiveRuntime

struct RiveSplashScreenView: View {
    @Binding var isPresented: Bool
    @StateObject private var riveViewModel = RiveViewModel(
        fileName: "splash_animation",
        autoPlay: true
    )
    
    var body: some View {
        ZStack {
            // Background
            Color.black
                .ignoresSafeArea()
            
            // Rive Animation
            riveViewModel.view()
                .frame(width: 300, height: 300)
        }
        .onAppear {
            // Dismiss splash after animation completes (e.g., 3 seconds)
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                withAnimation {
                    isPresented = false
                }
            }
        }
    }
}
```

## Step 5: Integration Points in CameraEye

Based on your existing code structure, here are some great places to use Rive:

### 1. **Splash Screen** (`SplashScreenView`)
Replace or enhance your splash screen with an animated logo or brand animation.

### 2. **Interstitial** (`AppFeatureInterstitialView`)
Add engaging animations to showcase app features.

### 3. **Empty States**
Use Rive animations for empty product lists or loading states.

### 4. **Button Interactions**
Replace static buttons with interactive Rive button animations.

### 5. **Loading Indicators**
Create custom loading animations that match your brand.

### 6. **Product Animations**
Animate product reveals or transitions in your shop navigation.

## Common Rive Use Cases

### Loading Animation
```swift
struct RiveLoadingView: View {
    @StateObject private var viewModel = RiveViewModel(
        fileName: "loading",
        autoPlay: true,
        animationName: "spin"
    )
    
    var body: some View {
        viewModel.view()
            .frame(width: 100, height: 100)
    }
}
```

### Success/Error Feedback
```swift
struct RiveFeedbackView: View {
    let isSuccess: Bool
    
    var body: some View {
        RiveViewModel(
            fileName: isSuccess ? "success" : "error",
            autoPlay: true
        ).view()
        .frame(width: 150, height: 150)
    }
}
```

## Troubleshooting

### Package Resolution Issues
- Make sure you have an active internet connection
- Try **File → Packages → Reset Package Caches** in Xcode
- Check that your minimum deployment target is iOS 14.0 or later

### Animation Not Showing
- Verify the `.riv` file is in your app bundle
- Check the filename matches exactly (case-sensitive)
- Look for console errors about missing files

### Performance Issues
- Rive is highly optimized, but very complex animations may impact performance
- Test on physical devices, not just the simulator
- Consider using simpler animations for background elements

## Additional Resources

- **Rive Editor**: https://rive.app
- **Rive iOS Documentation**: https://github.com/rive-app/rive-ios
- **Rive Community Files**: https://rive.app/community
- **Rive Learn**: https://rive.app/learn

## Next Steps

1. ✅ Add the Rive package to your project
2. ⬜ Download or create a `.riv` animation file
3. ⬜ Add the `.riv` file to your Xcode project
4. ⬜ Create a test view using `RiveViewModel`
5. ⬜ Integrate Rive into your splash screen or other views
6. ⬜ Explore state machines for interactive animations

---

**Need Help?**
- Check the Rive iOS examples: https://github.com/rive-app/rive-ios/tree/main/Example-iOS
- Join the Rive community: https://rive.app/community
