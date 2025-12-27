//
// TokensSemanticTheme.swift
//

// Do not edit directly, this file was auto-generated.

import SwiftUI

// MARK: - Theme Provider

/// Theme-aware provider for Semantic tokens.
/// Selects light or dark tokens based on the current color scheme.
///
/// ## Usage
/// ```swift
/// struct MyView: View {
///     @Environment(\.colorScheme) var colorScheme
///     
///     var body: some View {
///         Text("Hello")
///             .foregroundColor(TokensSemanticTheme.value(
///                 for: colorScheme,
///                 light: TokensSemanticLight.textPrimary,
///                 dark: TokensSemanticDark.textPrimary
///             ))
///     }
/// }
/// ```
public enum TokensSemanticTheme {
    /// Returns the appropriate value based on the current color scheme.
    /// - Parameters:
    ///   - colorScheme: The current color scheme
    ///   - light: Value to use in light mode
    ///   - dark: Value to use in dark mode
    /// - Returns: The appropriate value for the current theme
    public static func value<T>(
        for colorScheme: ColorScheme,
        light: T,
        dark: T
    ) -> T {
        colorScheme == .dark ? dark : light
    }
}