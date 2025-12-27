//
//  SplashScreenView.swift
//  CameraEye
//
//  Created by ANDREW WATERS on 12/20/25.
//

import SwiftUI
import RiveRuntime

// MARK: - Design System Type Alias
private typealias DS = DesignSystemGlobal

// MARK: - Splash Screen View
/// Splash screen with Rive animation that displays on app launch
struct SplashScreenView: View {
    @Binding var isPresented: Bool
    
    // Rive animation state
    @State private var riveViewModel: RiveViewModel?
    @State private var animationOpacity: Double = 1.0
    
    // Timing configuration
    private let minimumDisplayDuration: TimeUnit = 2.0 // Minimum time to show splash
    private let fadeOutDuration: TimeUnit = 0.5 // Fade out animation duration
    
    var body: some View {
        ZStack {
            // Background color
            DS.BackgroundSurfaceColorGreige
                .ignoresSafeArea()
            
            // Rive animation
            if let viewModel = riveViewModel {
                RiveViewRepresentable(viewModel: viewModel)
                    .ignoresSafeArea()
                    .opacity(animationOpacity)
            } else {
                // Fallback while loading
                ProgressView()
                    .tint(DS.Brand300)
            }
        }
        .onAppear {
            setupRiveAnimation()
            startSplashSequence()
        }
    }
    
    // MARK: - Setup Methods
    
    private func setupRiveAnimation() {
        // Load the Rive file and create view model
        // Create view model directly from the file name with cover fit
        let viewModel = RiveViewModel(
            fileName: "thd_camera_eye_",
            fit: .cover,
            alignment: .center
        )
        
        // Play the animation automatically
        viewModel.play()
        
        self.riveViewModel = viewModel
    }
    
    private func startSplashSequence() {
        // Wait for minimum display duration
        DispatchQueue.main.asyncAfter(deadline: .now() + minimumDisplayDuration) {
            // Fade out animation
            withAnimation(.easeOut(duration: fadeOutDuration)) {
                animationOpacity = 0
            }
            
            // Dismiss splash after fade completes
            DispatchQueue.main.asyncAfter(deadline: .now() + fadeOutDuration) {
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

// MARK: - Rive View Representable
/// UIViewRepresentable wrapper for RiveViewModel
private struct RiveViewRepresentable: UIViewRepresentable {
    let viewModel: RiveViewModel
    
    func makeUIView(context: Context) -> RiveView {
        let view = viewModel.createRiveView()
        // The fit and alignment are already configured on the viewModel
        return view
    }
    
    func updateUIView(_ uiView: RiveView, context: Context) {
        // Updates are handled by the viewModel
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
