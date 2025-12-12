//
// TokensSemanticTheme.swift
//

// Do not edit directly, this file was auto-generated.

import SwiftUI

public struct TokensSemanticTheme {
    public static func value<T>(light: T, dark: T) -> T {
        // This is a compile-time helper. Use with @Environment(\.colorScheme)
        // Example: TokensSemanticTheme.value(light: TokensSemanticLight.color, dark: TokensSemanticDark.color)
        return light // Default to light, actual switching happens at call site
    }
}

// MARK: - Environment-based theme switching
public extension View {
    func themedSemantic<T>(_ keyPath: KeyPath<TokensSemanticLight.Type, T>, 
                              light: KeyPath<TokensSemanticLight.Type, T>,
                              dark: KeyPath<TokensSemanticDark.Type, T>) -> some View {
        self.modifier(ThemedSemanticModifier(light: light, dark: dark))
    }
}

private struct ThemedSemanticModifier<T>: ViewModifier {
    @Environment(\.colorScheme) var colorScheme
    let light: KeyPath<TokensSemanticLight.Type, T>
    let dark: KeyPath<TokensSemanticDark.Type, T>
    
    func body(content: Content) -> some View {
        content
    }
}