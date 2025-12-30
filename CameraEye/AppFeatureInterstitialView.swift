//
//  AppFeatureInterstitialView.swift
//  CameraEye
//
//  Created by ANDREW WATERS on 12/29/25.
//

import SwiftUI

// MARK: - Design System Type Alias
private typealias DS = DesignSystemGlobal

// MARK: - App Feature Interstitial View
/// Interstitial view that showcases app features after splash screen
struct AppFeatureInterstitialView: View {
    @Binding var isPresented: Bool
    
    @State private var currentPage = 0
    @State private var opacity: Double = 0.0
    
    // Feature pages configuration
    private let features: [FeatureItem] = [
        FeatureItem(
            icon: "camera.fill",
            title: "Capture Moments",
            description: "Take stunning photos with advanced camera controls"
        ),
        FeatureItem(
            icon: "square.grid.2x2.fill",
            title: "Organize & Browse",
            description: "Keep your photos organized with smart collections"
        ),
        FeatureItem(
            icon: "wand.and.stars",
            title: "Edit & Enhance",
            description: "Transform your photos with powerful editing tools"
        )
    ]
    
    var body: some View {
        ZStack {
            // Semi-transparent background
            Color.black.opacity(0.6)
                .ignoresSafeArea()
                .onTapGesture {
                    dismiss()
                }
            
            // Content card
            VStack(spacing: 0) {
                // Feature pager
                TabView(selection: $currentPage) {
                    ForEach(0..<features.count, id: \.self) { index in
                        FeaturePageView(feature: features[index])
                            .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .frame(height: 400)
                
                // Action buttons
                HStack(spacing: 16) {
                    if currentPage < features.count - 1 {
                        Button("Skip") {
                            dismiss()
                        }
                        .foregroundStyle(DS.Brand300)
                        .frame(maxWidth: .infinity)
                        
                        Button("Next") {
                            withAnimation {
                                currentPage += 1
                            }
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(DS.Brand300)
                        .frame(maxWidth: .infinity)
                    } else {
                        Button("Get Started") {
                            dismiss()
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(DS.Brand300)
                        .frame(maxWidth: .infinity)
                    }
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 20)
                .background(DS.BackgroundSurfaceColorGreige)
            }
            .background(DS.BackgroundSurfaceColorGreige)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(radius: 20)
            .padding(.horizontal, 32)
            .opacity(opacity)
        }
        .onAppear {
            withAnimation(.easeOut(duration: 0.3)) {
                opacity = 1.0
            }
        }
    }
    
    // MARK: - Helper Methods
    
    private func dismiss() {
        withAnimation(.easeOut(duration: 0.2)) {
            opacity = 0.0
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            isPresented = false
        }
    }
}

// MARK: - Feature Page View
private struct FeaturePageView: View {
    let feature: FeatureItem
    
    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            
            // Icon
            Image(systemName: feature.icon)
                .font(.system(size: 80))
                .foregroundStyle(DS.Brand300)
                .symbolEffect(.bounce, value: feature.icon)
            
            // Title
            Text(feature.title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(DS.Brand300)
            
            // Description
            Text(feature.description)
                .font(.body)
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}

// MARK: - Feature Item Model
private struct FeatureItem {
    let icon: String
    let title: String
    let description: String
}

// MARK: - Preview
#Preview("App Feature Interstitial") {
    struct PreviewWrapper: View {
        @State private var isPresented = true
        
        var body: some View {
            ZStack {
                DS.BackgroundSurfaceColorGreige
                    .ignoresSafeArea()
                
                VStack {
                    Text("Home Screen")
                        .font(.largeTitle)
                        .foregroundStyle(DS.Brand300)
                }
                
                if isPresented {
                    AppFeatureInterstitialView(isPresented: $isPresented)
                }
            }
        }
    }
    
    return PreviewWrapper()
}

// MARK: - Design & Implementation Notes
/*
 APP FEATURE INTERSTITIAL VIEW
 
 This interstitial view implementation features:
 
 📱 ONBOARDING EXPERIENCE:
 - Multi-page feature showcase
 - Swipeable TabView with page indicators
 - Skip and Next navigation buttons
 - "Get Started" final action
 
 🎨 DESIGN:
 - Semi-transparent backdrop overlay
 - Centered content card with rounded corners
 - SF Symbols icons with system animations
 - Consistent Design System integration
 
 ⚡️ INTERACTIONS:
 - Tap outside to dismiss
 - Swipe between pages
 - Skip to bypass remaining pages
 - Smooth fade in/out animations
 
 🔧 CUSTOMIZATION:
 - Modify features array to add/remove pages
 - Adjust card size and styling
 - Change button colors and styles
 - Customize animation timings
 
 USAGE:
 
 ```swift
 @State private var showInterstitial = false
 
 var body: some View {
     ZStack {
         MainContentView()
         
         if showInterstitial {
             AppFeatureInterstitialView(isPresented: $showInterstitial)
                 .transition(.opacity)
                 .zIndex(100)
         }
     }
 }
 ```
*/
