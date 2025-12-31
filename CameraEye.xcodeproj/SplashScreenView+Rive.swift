//
//  SplashScreenView+Rive.swift
//  CameraEye
//
//  Enhanced splash screen options using Rive animations
//

import SwiftUI
import RiveRuntime

// MARK: - Option 1: Simple Rive Splash

/// Replace your entire splash screen with a Rive animation
/// Usage: In ContentView, replace SplashScreenView with RiveOnlySplash
struct RiveOnlySplash: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            RiveAnimationView(
                fileName: "splash", // Replace with your .riv filename
                autoPlay: true
            )
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onAppear {
            // Auto-dismiss after 3 seconds (adjust as needed)
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                withAnimation(.easeInOut(duration: 0.3)) {
                    isPresented = false
                }
            }
        }
    }
}

// MARK: - Option 2: Hybrid Splash (Rive + Existing Content)

/// Combine Rive animation with your existing splash screen design
/// This lets you keep any text, buttons, or other elements you already have
struct HybridRiveSplash: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            // Background
            LinearGradient(
                colors: [Color.blue, Color.purple],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 30) {
                // Rive logo animation
                RiveAnimationView(fileName: "logo_animation")
                    .frame(width: 250, height: 250)
                
                // App name
                Text("CameraEye")
                    .font(.system(size: 48, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                
                // Tagline
                Text("Discover with Vision")
                    .font(.title3)
                    .foregroundColor(.white.opacity(0.8))
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                withAnimation {
                    isPresented = false
                }
            }
        }
    }
}

// MARK: - Option 3: Layered Splash (Multiple Rive Elements)

/// Use multiple Rive animations for a more complex splash
struct LayeredRiveSplash: View {
    @Binding var isPresented: Bool
    @State private var showContent = false
    
    var body: some View {
        ZStack {
            // Background animation
            RiveAnimationView(
                fileName: "background_animation",
                autoPlay: true
            )
            .ignoresSafeArea()
            .blur(radius: 20)
            
            if showContent {
                VStack(spacing: 40) {
                    // Logo animation
                    RiveAnimationView(
                        fileName: "logo_reveal",
                        autoPlay: true
                    )
                    .frame(width: 200, height: 200)
                    
                    // Loading indicator
                    RiveLoadingView(
                        fileName: "loading_spinner",
                        size: 60
                    )
                }
                .transition(.scale.combined(with: .opacity))
            }
        }
        .onAppear {
            // Show content after brief delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.7)) {
                    showContent = true
                }
            }
            
            // Dismiss splash
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                withAnimation {
                    isPresented = false
                }
            }
        }
    }
}

// MARK: - Option 4: Interactive Splash

/// A splash screen with an interactive Rive element
/// Users can tap to skip or interact with the animation
struct InteractiveRiveSplash: View {
    @Binding var isPresented: Bool
    @State private var hasInteracted = false
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 40) {
                // Main splash animation
                RiveAnimationView(
                    fileName: "interactive_logo",
                    stateMachineName: "State Machine 1"
                )
                .frame(width: 300, height: 300)
                
                // Tap to continue hint
                if !hasInteracted {
                    Text("Tap to continue")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.6))
                        .transition(.opacity)
                }
            }
        }
        .onTapGesture {
            hasInteracted = true
            // Dismiss when tapped
            withAnimation {
                isPresented = false
            }
        }
        .onAppear {
            // Auto-dismiss if user doesn't interact
            DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                if !hasInteracted {
                    withAnimation {
                        isPresented = false
                    }
                }
            }
        }
    }
}

// MARK: - Option 5: Progressive Splash

/// Multi-stage splash screen with different Rive animations
struct ProgressiveRiveSplash: View {
    @Binding var isPresented: Bool
    @State private var stage: SplashStage = .logo
    
    enum SplashStage {
        case logo
        case loading
        case complete
    }
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            Group {
                switch stage {
                case .logo:
                    // Stage 1: Logo reveal
                    RiveAnimationView(
                        fileName: "logo_reveal",
                        autoPlay: true
                    )
                    .frame(width: 250, height: 250)
                    .transition(.opacity)
                    
                case .loading:
                    // Stage 2: Loading animation
                    VStack(spacing: 20) {
                        Text("CameraEye")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        RiveLoadingView(
                            fileName: "loading",
                            size: 80
                        )
                        
                        Text("Loading your experience...")
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.7))
                    }
                    .transition(.opacity)
                    
                case .complete:
                    // Stage 3: Success animation
                    RiveAnimationView(
                        fileName: "success",
                        autoPlay: true
                    )
                    .frame(width: 150, height: 150)
                    .transition(.scale)
                }
            }
        }
        .onAppear {
            // Progress through stages
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation {
                    stage = .loading
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                withAnimation {
                    stage = .complete
                }
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                withAnimation {
                    isPresented = false
                }
            }
        }
    }
}

// MARK: - How to Use in ContentView

/*
 To replace your existing splash screen with any of these options:
 
 1. In ContentView.swift, find this code:
 
    if showSplash {
        SplashScreenView(isPresented: $showSplash)
            .transition(.opacity)
    }
 
 2. Replace with one of these:
 
    // Option 1: Simple Rive splash
    if showSplash {
        RiveOnlySplash(isPresented: $showSplash)
            .transition(.opacity)
    }
 
    // Option 2: Hybrid approach
    if showSplash {
        HybridRiveSplash(isPresented: $showSplash)
            .transition(.opacity)
    }
 
    // Option 3: Layered animations
    if showSplash {
        LayeredRiveSplash(isPresented: $showSplash)
            .transition(.opacity)
    }
 
    // Option 4: Interactive
    if showSplash {
        InteractiveRiveSplash(isPresented: $showSplash)
            .transition(.opacity)
    }
 
    // Option 5: Progressive stages
    if showSplash {
        ProgressiveRiveSplash(isPresented: $showSplash)
            .transition(.opacity)
    }
 
 3. Make sure you have the corresponding .riv files in your project
 */

// MARK: - Previews

#Preview("Simple Rive Splash") {
    @Previewable @State var isPresented = true
    RiveOnlySplash(isPresented: $isPresented)
}

#Preview("Hybrid Splash") {
    @Previewable @State var isPresented = true
    HybridRiveSplash(isPresented: $isPresented)
}

#Preview("Interactive Splash") {
    @Previewable @State var isPresented = true
    InteractiveRiveSplash(isPresented: $isPresented)
}

#Preview("Progressive Splash") {
    @Previewable @State var isPresented = true
    ProgressiveRiveSplash(isPresented: $isPresented)
}
