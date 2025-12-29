import SwiftUI

// MARK: - DesignSystem

/// Design System entry point providing theme-aware token access
public enum DesignSystem {
    /// Returns the appropriate value based on the provided color scheme.
    /// - Parameters:
    ///   - light: Value to use in light mode
    ///   - dark: Value to use in dark mode
    ///   - colorScheme: The current color scheme
    /// - Returns: The appropriate value for the color scheme
    public static func themed<T>(_ light: T, _ dark: T, for colorScheme: ColorScheme) -> T {
        colorScheme == .dark ? dark : light
    }
}

// MARK: - ThemedTokensKey

/// Environment key for accessing themed tokens
public struct ThemedTokensKey: EnvironmentKey {
    public static let defaultValue: ColorScheme = .light
}

extension EnvironmentValues {
    public var themeMode: ColorScheme {
        get { self[ThemedTokensKey.self] }
        set { self[ThemedTokensKey.self] = newValue }
    }
}
