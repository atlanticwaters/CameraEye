import SwiftUI

#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

// MARK: - DSAnimation

/// Design system animation constants and utilities.
///
/// DSAnimation provides standardized animations that respect accessibility settings
/// and ensure consistent motion throughout the design system.
///
/// ## Usage
/// ```swift
/// .animation(DSAnimation.press, value: isPressed)
/// .animation(DSAnimation.stateChange, value: state)
/// ```
///
/// ## Accessibility
/// All animations automatically respect the system's Reduce Motion preference.
/// When Reduce Motion is enabled, animations are either disabled or simplified.
public enum DSAnimation {
    // MARK: - Durations

    /// Quick animation duration (0.1s) for micro-interactions like press states
    public static let quickDuration: Double = 0.1

    /// Standard animation duration (0.2s) for state changes
    public static let standardDuration: Double = 0.2

    /// Slow animation duration (0.3s) for emphasis or larger movements
    public static let slowDuration: Double = 0.3

    // MARK: - Standard Animations

    /// Animation for press/release interactions.
    /// Uses quick duration with ease-in-out timing.
    public static var press: Animation? {
        reduceMotionEnabled ? nil : .easeInOut(duration: quickDuration)
    }

    /// Animation for general state changes (enabled/disabled, variant changes).
    /// Uses standard duration with ease-in-out timing.
    public static var stateChange: Animation? {
        reduceMotionEnabled ? nil : .easeInOut(duration: standardDuration)
    }

    /// Animation for loading or progress indicators.
    /// Uses standard duration with linear timing.
    public static var loading: Animation? {
        reduceMotionEnabled ? nil : .linear(duration: standardDuration)
    }

    /// Spring animation for more natural movement.
    /// Uses SwiftUI's default spring when motion is allowed.
    public static var spring: Animation? {
        reduceMotionEnabled ? nil : .spring(response: 0.35, dampingFraction: 0.7)
    }

    // MARK: - Accessibility

    /// Returns true if the user has enabled Reduce Motion in system settings.
    /// This is checked at access time, not cached, to respect setting changes.
    private static var reduceMotionEnabled: Bool {
        #if canImport(UIKit)
        UIAccessibility.isReduceMotionEnabled
        #else
        // macOS: Use NSWorkspace for accessibility settings
        NSWorkspace.shared.accessibilityDisplayShouldReduceMotion
        #endif
    }
}

// MARK: - View Modifier

extension View {
    /// Applies a press animation that respects Reduce Motion settings.
    ///
    /// - Parameter isPressed: The value that triggers the animation
    /// - Returns: A view with press animation applied
    public func dsAnimatePress(value isPressed: Bool) -> some View {
        animation(DSAnimation.press, value: isPressed)
    }

    /// Applies a state change animation that respects Reduce Motion settings.
    ///
    /// - Parameter value: The value that triggers the animation
    /// - Returns: A view with state change animation applied
    public func dsAnimateStateChange(value: some Equatable) -> some View {
        animation(DSAnimation.stateChange, value: value)
    }
}
