//
// TokensCoreTheme.swift
//

// Do not edit directly, this file was auto-generated.

import SwiftUI

public struct TokensCoreTheme {
    public static func value<T>(light: T, dark: T) -> T {
        // This is a compile-time helper. Use with @Environment(\.colorScheme)
        // Example: TokensCoreTheme.value(light: TokensCoreLight.color, dark: TokensCoreDark.color)
        return light // Default to light, actual switching happens at call site
    }
}

// MARK: - Environment-based theme switching
public extension View {
    func themedCore<T>(_ keyPath: KeyPath<TokensCoreLight.Type, T>, 
                              light: KeyPath<TokensCoreLight.Type, T>,
                              dark: KeyPath<TokensCoreDark.Type, T>) -> some View {
        self.modifier(ThemedCoreModifier(light: light, dark: dark))
    }
}

private struct ThemedCoreModifier<T>: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    let light: KeyPath<TokensCoreLight.Type, T>
    let dark: KeyPath<TokensCoreDark.Type, T>
    
    func body(content: Content) -> some View {
        content
    }
}