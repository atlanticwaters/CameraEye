//
// TokensComponentsTheme.swift
//

// Do not edit directly, this file was auto-generated.

import SwiftUI

public struct TokensComponentsTheme {
    public static func value<T>(light: T, dark: T) -> T {
        // This is a compile-time helper. Use with @Environment(\.colorScheme)
        // Example: TokensComponentsTheme.value(light: TokensComponentsLight.color, dark: TokensComponentsDark.color)
        return light // Default to light, actual switching happens at call site
    }
}

// MARK: - Environment-based theme switching
public extension View {
    func themedComponents<T>(_ keyPath: KeyPath<TokensComponentsLight.Type, T>, 
                              light: KeyPath<TokensComponentsLight.Type, T>,
                              dark: KeyPath<TokensComponentsDark.Type, T>) -> some View {
        self.modifier(ThemedComponentsModifier(light: light, dark: dark))
    }
}

private struct ThemedComponentsModifier<T>: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    let light: KeyPath<TokensComponentsLight.Type, T>
    let dark: KeyPath<TokensComponentsDark.Type, T>
    
    func body(content: Content) -> some View {
        content
    }
}