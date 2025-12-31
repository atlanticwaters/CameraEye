//
//  RiveAnimationView.swift
//  CameraEye
//
//  A reusable SwiftUI view for displaying Rive animations
//

import SwiftUI
import RiveRuntime

/// A SwiftUI view that displays a Rive animation with optional controls and callbacks
struct RiveAnimationView: View {
    // MARK: - Properties
    
    /// The Rive view model that manages the animation
    @StateObject private var viewModel: RiveViewModel
    
    /// Optional callback when animation completes
    var onAnimationComplete: (() -> Void)?
    
    /// Whether to show playback controls (useful for debugging)
    var showControls: Bool = false
    
    // MARK: - Initialization
    
    /// Initialize with a Rive file name
    /// - Parameters:
    ///   - fileName: The name of the .riv file (without extension)
    ///   - animationName: Optional specific animation to play
    ///   - stateMachineName: Optional state machine name
    ///   - autoPlay: Whether to start playing automatically
    ///   - fit: How the animation should fit in its frame
    ///   - alignment: Alignment of the animation
    ///   - onComplete: Optional callback when animation completes
    init(
        fileName: String,
        animationName: String? = nil,
        stateMachineName: String? = nil,
        autoPlay: Bool = true,
        fit: RiveFit = .contain,
        alignment: RiveAlignment = .center,
        showControls: Bool = false,
        onComplete: (() -> Void)? = nil
    ) {
        _viewModel = StateObject(wrappedValue: RiveViewModel(
            fileName: fileName,
            animationName: animationName,
            stateMachineName: stateMachineName,
            autoPlay: autoPlay,
            fit: fit,
            alignment: alignment
        ))
        self.showControls = showControls
        self.onAnimationComplete = onComplete
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 0) {
            // The Rive animation view
            viewModel.view()
            
            // Optional debug controls
            if showControls {
                controlPanel
                    .padding(.top, 8)
            }
        }
    }
    
    // MARK: - Control Panel
    
    @ViewBuilder
    private var controlPanel: some View {
        HStack(spacing: 16) {
            Button {
                viewModel.play()
            } label: {
                Image(systemName: "play.fill")
                    .frame(width: 44, height: 44)
            }
            .buttonStyle(.bordered)
            
            Button {
                viewModel.pause()
            } label: {
                Image(systemName: "pause.fill")
                    .frame(width: 44, height: 44)
            }
            .buttonStyle(.bordered)
            
            Button {
                viewModel.stop()
            } label: {
                Image(systemName: "stop.fill")
                    .frame(width: 44, height: 44)
            }
            .buttonStyle(.bordered)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(12)
    }
}

// MARK: - Convenience Views

/// A simple loading animation view using Rive
struct RiveLoadingView: View {
    let fileName: String
    let size: CGFloat
    
    init(fileName: String = "loading", size: CGFloat = 100) {
        self.fileName = fileName
        self.size = size
    }
    
    var body: some View {
        RiveAnimationView(fileName: fileName)
            .frame(width: size, height: size)
    }
}

/// A Rive-powered splash screen
struct RiveSplashView: View {
    @Binding var isPresented: Bool
    let fileName: String
    let duration: TimeInterval
    
    init(
        isPresented: Binding<Bool>,
        fileName: String = "splash",
        duration: TimeInterval = 3.0
    ) {
        _isPresented = isPresented
        self.fileName = fileName
        self.duration = duration
    }
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            RiveAnimationView(fileName: fileName)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onAppear {
            // Auto-dismiss after duration
            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                withAnimation(.easeInOut(duration: 0.3)) {
                    isPresented = false
                }
            }
        }
    }
}

/// A Rive animation with a state machine for interactive elements
struct RiveInteractiveView: View {
    @StateObject private var viewModel: RiveViewModel
    
    init(fileName: String, stateMachineName: String) {
        _viewModel = StateObject(wrappedValue: RiveViewModel(
            fileName: fileName,
            stateMachineName: stateMachineName
        ))
    }
    
    var body: some View {
        viewModel.view()
    }
    
    /// Trigger a boolean input in the state machine
    func trigger(_ inputName: String) {
        viewModel.triggerInput(inputName)
    }
    
    /// Set a number input in the state machine
    func setNumber(_ inputName: String, value: Double) {
        viewModel.setInput(inputName, value: value)
    }
    
    /// Set a boolean input in the state machine
    func setBool(_ inputName: String, value: Bool) {
        viewModel.setInput(inputName, value: value)
    }
}

// MARK: - Preview

#Preview("Simple Animation") {
    RiveAnimationView(
        fileName: "example_animation",
        showControls: true
    )
    .frame(width: 300, height: 300)
    .padding()
}

#Preview("Loading View") {
    RiveLoadingView(size: 150)
        .padding()
}

#Preview("Splash Screen") {
    @Previewable @State var showSplash = true
    
    if showSplash {
        RiveSplashView(
            isPresented: $showSplash,
            duration: 5.0
        )
    } else {
        Text("Splash Dismissed")
            .font(.title)
    }
}
