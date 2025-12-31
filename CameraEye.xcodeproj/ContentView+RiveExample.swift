//
//  ContentView+RiveExample.swift
//  CameraEye
//
//  Example showing how to integrate Rive into your existing ContentView
//

import SwiftUI

// MARK: - Example 1: Replace Splash Screen with Rive

/// This is an example of how you could modify ContentView to use a Rive splash screen
/// To use this, simply replace your ContentView implementation
struct ContentViewWithRiveSplash: View {
    @State private var showSplash = true
    @State private var showInterstitial = false
    
    var body: some View {
        ZStack {
            if showSplash {
                // Option 1: Use the pre-built RiveSplashView
                RiveSplashView(
                    isPresented: $showSplash,
                    fileName: "splash_animation", // Replace with your .riv filename
                    duration: 3.0
                )
                .transition(.opacity)
            } else {
                // Navigate to Home Screen with full navigation (bottom tabs + morphing nav)
                HomeScreenDemoView()
                    .transition(.opacity)
            }
            
            // App Feature Interstitial - Shows after splash dismisses
            if showInterstitial {
                AppFeatureInterstitialView(isPresented: $showInterstitial)
                    .transition(.opacity.combined(with: .scale(scale: 0.9)))
                    .zIndex(100)
            }
        }
        .animation(.easeInOut(duration: 0.3), value: showSplash)
        .animation(.spring(response: 0.35, dampingFraction: 0.85), value: showInterstitial)
        .onChange(of: showSplash) { oldValue, newValue in
            // When splash dismisses, show interstitial after a brief delay
            if !newValue && oldValue {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    showInterstitial = true
                }
            }
        }
    }
}

// MARK: - Example 2: Enhanced Splash with Rive Animation

/// Custom splash screen that combines your existing design with Rive
struct EnhancedSplashScreenView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            // Your existing splash background
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                // Add Rive animation for your logo
                RiveAnimationView(fileName: "logo_animation")
                    .frame(width: 200, height: 200)
                
                // You can still include text or other elements
                Text("CameraEye")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
        }
        .onAppear {
            // Auto-dismiss after animation
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                withAnimation {
                    isPresented = false
                }
            }
        }
    }
}

// MARK: - Example 3: Rive Loading State

/// Show a Rive loading animation while content loads
struct ContentViewWithRiveLoading: View {
    @State private var isLoading = true
    
    var body: some View {
        ZStack {
            // Your main content
            if !isLoading {
                ContentView()
            }
            
            // Rive loading overlay
            if isLoading {
                ZStack {
                    Color.black.opacity(0.8)
                        .ignoresSafeArea()
                    
                    VStack(spacing: 20) {
                        RiveLoadingView(
                            fileName: "loading_spinner",
                            size: 120
                        )
                        
                        Text("Loading...")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                }
                .transition(.opacity)
            }
        }
        .onAppear {
            // Simulate loading time
            loadContent()
        }
    }
    
    private func loadContent() {
        // Replace with actual loading logic
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation {
                isLoading = false
            }
        }
    }
}

// MARK: - Example 4: Interactive Rive Button

/// A custom button with Rive animation
struct RiveAnimatedButton: View {
    let title: String
    let riveFileName: String
    let action: () -> Void
    
    @State private var isPressed = false
    
    var body: some View {
        Button(action: {
            isPressed.toggle()
            action()
        }) {
            HStack {
                RiveAnimationView(
                    fileName: riveFileName,
                    stateMachineName: "Button State"
                )
                .frame(width: 40, height: 40)
                
                Text(title)
                    .font(.headline)
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(12)
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Example 5: Rive Empty State

/// Use Rive for empty states in your app
struct RiveEmptyStateView: View {
    let title: String
    let message: String
    let riveFileName: String
    let actionTitle: String?
    let action: (() -> Void)?
    
    init(
        title: String,
        message: String,
        riveFileName: String = "empty_state",
        actionTitle: String? = nil,
        action: (() -> Void)? = nil
    ) {
        self.title = title
        self.message = message
        self.riveFileName = riveFileName
        self.actionTitle = actionTitle
        self.action = action
    }
    
    var body: some View {
        VStack(spacing: 24) {
            RiveAnimationView(fileName: riveFileName)
                .frame(width: 250, height: 250)
            
            VStack(spacing: 12) {
                Text(title)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(message)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            
            if let actionTitle = actionTitle, let action = action {
                Button(actionTitle) {
                    action()
                }
                .buttonStyle(.borderedProminent)
                .padding(.top, 8)
            }
        }
        .padding()
    }
}

// MARK: - Usage Examples

#Preview("Rive Splash") {
    @Previewable @State var showSplash = true
    
    ContentViewWithRiveSplash()
}

#Preview("Enhanced Splash") {
    @Previewable @State var showSplash = true
    
    EnhancedSplashScreenView(isPresented: $showSplash)
}

#Preview("Loading State") {
    ContentViewWithRiveLoading()
}

#Preview("Animated Button") {
    RiveAnimatedButton(
        title: "Get Started",
        riveFileName: "button_animation"
    ) {
        print("Button tapped!")
    }
}

#Preview("Empty State") {
    RiveEmptyStateView(
        title: "No Products Found",
        message: "Try adjusting your filters or search terms",
        actionTitle: "Clear Filters"
    ) {
        print("Clear filters tapped")
    }
}
