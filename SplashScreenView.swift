//
//  SplashScreenView.swift
//  CameraEye
//
//  Created by ANDREW WATERS on 12/20/25.
//

import SwiftUI

// MARK: - Design System Type Alias
private typealias DS = DesignSystemGlobal

// MARK: - Splash Screen View
/// Splash screen with native SwiftUI animation that displays on app launch
struct SplashScreenView: View {
    @Binding var isPresented: Bool
    
    // Animation state
    @State private var logoScale: CGFloat = 0.5
    @State private var logoOpacity: Double = 0.0
    @State private var animationOpacity: Double = 1.0
    
    // Timing configuration
    private let minimumDisplayDuration: TimeUnit = 2.0 // Minimum time to show splash
    private let fadeOutDuration: TimeUnit = 0.5 // Fade out animation duration
    
    var body: some View {
        ZStack {
            // Background color
            DS.BackgroundSurfaceColorGreige
                .ignoresSafeArea()
            
            // App logo/branding with native animation
            VStack(spacing: 20) {
                Image(systemName: "camera.fill")
                    .font(.system(size: 80))
                    .foregroundStyle(DS.Brand300)
                    .scaleEffect(logoScale)
                    .opacity(logoOpacity)
                
                Text("CameraEye")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(DS.Brand300)
                    .opacity(logoOpacity)
            }
            .opacity(animationOpacity)
        }
        .onAppear {
            startSplashSequence()
        }
    }
    
    // MARK: - Setup Methods
    
    private func startSplashSequence() {
        // Animate logo entrance
        withAnimation(.spring(response: 0.6, dampingFraction: 0.7)) {
            logoScale = 1.0
            logoOpacity = 1.0
        }
        
        // Wait for minimum display duration
        Task {
            try? await Task.sleep(for: .seconds(minimumDisplayDuration))
            
            // Fade out animation
            await MainActor.run {
                withAnimation(.easeOut(duration: fadeOutDuration)) {
                    animationOpacity = 0
                }
            }
            
            // Dismiss splash after fade completes
            try? await Task.sleep(for: .seconds(fadeOutDuration))
            await MainActor.run {
                dismissSplash()
            }
        }
    }
    
    private func dismissSplash() {
        withAnimation {
            isPresented = false
        }
    }
}

// MARK: - Type Alias
private typealias TimeUnit = Double

// MARK: - Preview
#Preview("Splash Screen") {
    struct PreviewWrapper: View {
        @State private var isPresented = true
        
        var body: some View {
            if isPresented {
                SplashScreenView(isPresented: $isPresented)
            } else {
                ZStack {
                    DS.BackgroundSurfaceColorGreige
                        .ignoresSafeArea()
                    VStack {
                        Image(systemName: "checkmark.circle.fill")
                            .font(.system(size: 60))
                            .foregroundStyle(DS.Brand300)
                        Text("Splash Dismissed")
                            .font(.title)
                            .foregroundStyle(DS.Brand300)
                    }
                }
            }
        }
    }
    
    return PreviewWrapper()
}

// MARK: - Design & Implementation Notes
/*
 RIVE ANIMATION SPLASH SCREEN
 
 This splash screen implementation features:
 
 🎬 RIVE ANIMATION:
 - Loads thd_camera_eye_.riv from app bundle
 - Automatically plays animation on appear
 - UIViewRepresentable wrapper for RiveView
 - Fallback ProgressView if animation fails to load
 
 ⏱️ TIMING CONTROL:
 - Minimum display duration: 2 seconds (configurable)
 - Fade out duration: 0.5 seconds (configurable)
 - Smooth fade out transition before dismissal
 - Binding-based state management
 
 🎨 DESIGN SYSTEM INTEGRATION:
 - Uses DS.BackgroundSurfaceColorGreige for background
 - DS.Brand300 for loading indicator
 - Consistent with app's visual design
 
 📱 RESPONSIVE:
 - aspectRatio(.fit) scales animation appropriately
 - Works across all device sizes
 - Safe area handling with ignoresSafeArea()
 
 USAGE:
 
 ```swift
 struct ContentView: View {
     @State private var showSplash = true
     
     var body: some View {
         ZStack {
             if showSplash {
                 SplashScreenView(isPresented: $showSplash)
             } else {
                 MainAppNavigationView()
             }
         }
     }
 }
 ```
 
 CUSTOMIZATION:
 - Adjust minimumDisplayDuration for longer/shorter display
 - Adjust fadeOutDuration for faster/slower fade out
 - Change background color in the ZStack
 - Add additional branding elements if needed
 
 RIVE SETUP:
 - Ensure thd_camera_eye_.riv is added to Xcode project
 - File should be in the app's main bundle
 - RiveRuntime framework must be linked
 - Animation plays automatically on load
*/
