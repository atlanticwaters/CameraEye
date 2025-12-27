// Generated file - DO NOT EDIT
// Run `npm run tokens:build` to regenerate

#if canImport(UIKit)
import UIKit
#endif
import SwiftUI

// MARK: - DSBackgroundFill

/// A theme-aware fill that can be either a solid color or a gradient.
///
/// `DSBackgroundFill` provides a unified type for component backgrounds that may use
/// either solid colors or gradients. It automatically resolves to the appropriate
/// theme variant based on the current environment.
///
/// ## Usage
///
/// Use the view modifier (recommended):
/// ```swift
/// Text("Hello")
///     .dsFillBackground(DSBackgroundFill.brandGradientPrimary)
/// ```
///
/// Or access the underlying values directly:
/// ```swift
/// @Environment(\.colorScheme) var colorScheme
/// let fillValue = fill.value(for: colorScheme)
/// ```
///
/// For conditional fill (color or gradient based on variant):
/// ```swift
/// .dsFillBackground(variant.fill)
/// ```
public struct DSBackgroundFill: Sendable {
    private let light: FillValue
    private let dark: FillValue

    /// The underlying fill representation
    public enum FillValue: Sendable {
        case color(Color)
        case linearGradient(LinearGradient)
    }

    // MARK: - Initialization

    /// Creates a fill with solid colors for light and dark modes.
    public init(light: Color, dark: Color) {
        self.light = .color(light)
        self.dark = .color(dark)
    }

    /// Creates a fill with gradients for light and dark modes.
    public init(light: LinearGradient, dark: LinearGradient) {
        self.light = .linearGradient(light)
        self.dark = .linearGradient(dark)
    }

    /// Creates a fill with a single gradient for both modes.
    public init(gradient: LinearGradient) {
        self.light = .linearGradient(gradient)
        self.dark = .linearGradient(gradient)
    }

    /// Creates a fill with explicit FillValue for each mode.
    public init(light: FillValue, dark: FillValue) {
        self.light = light
        self.dark = dark
    }

    // MARK: - Resolution

    /// Returns the fill value for the given color scheme.
    public func value(for colorScheme: ColorScheme) -> FillValue {
        colorScheme == .dark ? dark : light
    }

    /// Resolves to the light variant explicitly.
    public var lightValue: FillValue { light }

    /// Resolves to the dark variant explicitly.
    public var darkValue: FillValue { dark }

    // MARK: - Token-Based Fills

    /// Primary brand gradient (orange, left to right)
    public static var brandGradientPrimary: Self {
        Self(light: TokensCoreLight.GradientBrandPrimary, dark: TokensCoreDark.GradientBrandPrimary)
    }

    /// Secondary brand gradient (orange, diagonal with 3 stops)
    public static var brandGradientSecondary: Self {
        Self(light: TokensCoreLight.GradientBrandSecondary, dark: TokensCoreDark.GradientBrandSecondary)
    }

    /// Subtle surface gradient for backgrounds
    public static var surfaceGradientSubtle: Self {
        Self(light: TokensCoreLight.GradientSurfaceSubtle, dark: TokensCoreDark.GradientSurfaceSubtle)
    }
}

// MARK: - DSFillBackgroundModifier

/// View modifier for applying DSBackgroundFill as a background.
public struct DSFillBackgroundModifier: ViewModifier {
    let fill: DSBackgroundFill
    @Environment(\.colorScheme)
    private var colorScheme

    public func body(content: Content) -> some View {
        let fillValue = fill.value(for: colorScheme)
        content.background {
            switch fillValue {
            case let .color(color):
                color
            case let .linearGradient(gradient):
                gradient
            }
        }
    }
}

extension View {
    /// Applies a DSBackgroundFill as the view's background.
    ///
    /// ```swift
    /// Text("Hello")
    ///     .dsFillBackground(DSBackgroundFill.brandGradientPrimary)
    /// ```
    public func dsFillBackground(_ fill: DSBackgroundFill) -> some View {
        modifier(DSFillBackgroundModifier(fill: fill))
    }
}

// MARK: - DSFillShape

/// View that renders a Shape filled with a DSBackgroundFill.
public struct DSFillShape<S: Shape>: View {
    let shape: S
    let fill: DSBackgroundFill
    @Environment(\.colorScheme)
    private var colorScheme

    public init(shape: S, fill: DSBackgroundFill) {
        self.shape = shape
        self.fill = fill
    }

    public var body: some View {
        switch fill.value(for: colorScheme) {
        case let .color(color):
            shape.fill(color)
        case let .linearGradient(gradient):
            shape.fill(gradient)
        }
    }
}

extension Shape {
    /// Fills the shape with a DSBackgroundFill (supports both solid colors and gradients).
    ///
    /// ```swift
    /// RoundedRectangle(cornerRadius: 8)
    ///     .dsBackgroundFill(DSBackgroundFill.brandGradientPrimary)
    /// ```
    public func dsBackgroundFill(_ fill: DSBackgroundFill) -> DSFillShape<Self> {
        DSFillShape(shape: self, fill: fill)
    }
}
