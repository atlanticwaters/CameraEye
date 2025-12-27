//
//  ContentView.swift
//  CameraEye
//
//  Created by ANDREW WATERS on 12/10/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showSplash = true
    @State private var showInterstitial = false
    
    var body: some View {
        ZStack {
            if showSplash {
                SplashScreenView(isPresented: $showSplash)
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

#Preview {
    ContentView()
}
