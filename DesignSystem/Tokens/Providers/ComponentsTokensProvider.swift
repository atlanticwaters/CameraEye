//
// ComponentsTokensProvider.swift
//

// Do not edit directly, this file was auto-generated.

import SwiftUI

/// Protocol defining the components tokens contract.
///
/// Both `TokensComponentsLight` and `TokensComponentsDark` conform to this protocol,
/// enabling theme-agnostic code and easier testing through dependency injection.
///
/// ## Usage
/// ```swift
/// struct MyView: View {
///     let tokens: any ComponentsTokensProvider
///     
///     var body: some View {
///         Text("Hello")
///             .foregroundColor(tokens.textPrimary)
///     }
/// }
/// ```
public protocol ComponentsTokensProvider {
    var IconActionColorGhostFilledDefault: Color { get }
    var IconActionColorGhostFilledInactive: Color { get }
    var IconActionColorGradientFilledDefault: Color { get }
    var IconActionColorGradientFilledInactive: Color { get }
    var IconActionColorOrangeFilledDefault: Color { get }
    var IconActionColorOrangeFilledInactive: Color { get }
    var IconActionColorOrangeOutlineDefault: Color { get }
    var IconActionColorOrangeOutlineInactive: Color { get }
    var IconActionColorTransparent05FilledDefault: Color { get }
    var IconActionColorTransparent05FilledInactive: Color { get }
    var IconActionColorTransparent10FilledDefault: Color { get }
    var IconActionColorTransparent10FilledInactive: Color { get }
    var IconActionColorWhiteFilledDefault: Color { get }
    var IconActionColorWhiteFilledInactive: Color { get }
    var IconInputColorActive: Color { get }
    var IconInputColorDefault: Color { get }
    var IconInputColorInactive: Color { get }
    var IconOnContainerColorAccent: Color { get }
    var IconOnContainerColorAccent2: Color { get }
    var IconOnContainerColorError: Color { get }
    var IconOnContainerColorInactive: Color { get }
    var IconOnContainerColorInformational: Color { get }
    var IconOnContainerColorInverse: Color { get }
    var IconOnContainerColorPrimary: Color { get }
    var IconOnContainerColorSecondary: Color { get }
    var IconOnContainerColorSuccess: Color { get }
    var IconOnContainerColorTertiary: Color { get }
    var IconOnContainerColorWarning: Color { get }
    var IconOnSurfaceColorAccent: Color { get }
    var IconOnSurfaceColorAccent2: Color { get }
    var IconOnSurfaceColorError: Color { get }
    var IconOnSurfaceColorInactive: Color { get }
    var IconOnSurfaceColorInformational: Color { get }
    var IconOnSurfaceColorInverse: Color { get }
    var IconOnSurfaceColorPrimary: Color { get }
    var IconOnSurfaceColorSecondary: Color { get }
    var IconOnSurfaceColorSuccess: Color { get }
    var IconOnSurfaceColorTertiary: Color { get }
    var IconOnSurfaceColorWarning: Color { get }
    var IconSelectorColorFilledActive: Color { get }
    var IconSelectorColorFilledDefault: Color { get }
    var IconSelectorColorFilledInactive: Color { get }
    var IconSelectorColorFilledSelected: Color { get }
    var IconSelectorColorOutlineActive: Color { get }
    var IconSelectorColorOutlineDefault: Color { get }
    var IconSelectorColorOutlineInactive: Color { get }
    var IconSelectorColorOutlineSelected: Color { get }
}

// MARK: - Light Theme Conformance

extension TokensComponentsLight: ComponentsTokensProvider {
    public var IconActionColorGhostFilledDefault: Color { Self.IconActionColorGhostFilledDefault }
    public var IconActionColorGhostFilledInactive: Color { Self.IconActionColorGhostFilledInactive }
    public var IconActionColorGradientFilledDefault: Color { Self.IconActionColorGradientFilledDefault }
    public var IconActionColorGradientFilledInactive: Color { Self.IconActionColorGradientFilledInactive }
    public var IconActionColorOrangeFilledDefault: Color { Self.IconActionColorOrangeFilledDefault }
    public var IconActionColorOrangeFilledInactive: Color { Self.IconActionColorOrangeFilledInactive }
    public var IconActionColorOrangeOutlineDefault: Color { Self.IconActionColorOrangeOutlineDefault }
    public var IconActionColorOrangeOutlineInactive: Color { Self.IconActionColorOrangeOutlineInactive }
    public var IconActionColorTransparent05FilledDefault: Color { Self.IconActionColorTransparent05FilledDefault }
    public var IconActionColorTransparent05FilledInactive: Color { Self.IconActionColorTransparent05FilledInactive }
    public var IconActionColorTransparent10FilledDefault: Color { Self.IconActionColorTransparent10FilledDefault }
    public var IconActionColorTransparent10FilledInactive: Color { Self.IconActionColorTransparent10FilledInactive }
    public var IconActionColorWhiteFilledDefault: Color { Self.IconActionColorWhiteFilledDefault }
    public var IconActionColorWhiteFilledInactive: Color { Self.IconActionColorWhiteFilledInactive }
    public var IconInputColorActive: Color { Self.IconInputColorActive }
    public var IconInputColorDefault: Color { Self.IconInputColorDefault }
    public var IconInputColorInactive: Color { Self.IconInputColorInactive }
    public var IconOnContainerColorAccent: Color { Self.IconOnContainerColorAccent }
    public var IconOnContainerColorAccent2: Color { Self.IconOnContainerColorAccent2 }
    public var IconOnContainerColorError: Color { Self.IconOnContainerColorError }
    public var IconOnContainerColorInactive: Color { Self.IconOnContainerColorInactive }
    public var IconOnContainerColorInformational: Color { Self.IconOnContainerColorInformational }
    public var IconOnContainerColorInverse: Color { Self.IconOnContainerColorInverse }
    public var IconOnContainerColorPrimary: Color { Self.IconOnContainerColorPrimary }
    public var IconOnContainerColorSecondary: Color { Self.IconOnContainerColorSecondary }
    public var IconOnContainerColorSuccess: Color { Self.IconOnContainerColorSuccess }
    public var IconOnContainerColorTertiary: Color { Self.IconOnContainerColorTertiary }
    public var IconOnContainerColorWarning: Color { Self.IconOnContainerColorWarning }
    public var IconOnSurfaceColorAccent: Color { Self.IconOnSurfaceColorAccent }
    public var IconOnSurfaceColorAccent2: Color { Self.IconOnSurfaceColorAccent2 }
    public var IconOnSurfaceColorError: Color { Self.IconOnSurfaceColorError }
    public var IconOnSurfaceColorInactive: Color { Self.IconOnSurfaceColorInactive }
    public var IconOnSurfaceColorInformational: Color { Self.IconOnSurfaceColorInformational }
    public var IconOnSurfaceColorInverse: Color { Self.IconOnSurfaceColorInverse }
    public var IconOnSurfaceColorPrimary: Color { Self.IconOnSurfaceColorPrimary }
    public var IconOnSurfaceColorSecondary: Color { Self.IconOnSurfaceColorSecondary }
    public var IconOnSurfaceColorSuccess: Color { Self.IconOnSurfaceColorSuccess }
    public var IconOnSurfaceColorTertiary: Color { Self.IconOnSurfaceColorTertiary }
    public var IconOnSurfaceColorWarning: Color { Self.IconOnSurfaceColorWarning }
    public var IconSelectorColorFilledActive: Color { Self.IconSelectorColorFilledActive }
    public var IconSelectorColorFilledDefault: Color { Self.IconSelectorColorFilledDefault }
    public var IconSelectorColorFilledInactive: Color { Self.IconSelectorColorFilledInactive }
    public var IconSelectorColorFilledSelected: Color { Self.IconSelectorColorFilledSelected }
    public var IconSelectorColorOutlineActive: Color { Self.IconSelectorColorOutlineActive }
    public var IconSelectorColorOutlineDefault: Color { Self.IconSelectorColorOutlineDefault }
    public var IconSelectorColorOutlineInactive: Color { Self.IconSelectorColorOutlineInactive }
    public var IconSelectorColorOutlineSelected: Color { Self.IconSelectorColorOutlineSelected }
}

// MARK: - Dark Theme Conformance

extension TokensComponentsDark: ComponentsTokensProvider {
    public var IconActionColorGhostFilledDefault: Color { Self.IconActionColorGhostFilledDefault }
    public var IconActionColorGhostFilledInactive: Color { Self.IconActionColorGhostFilledInactive }
    public var IconActionColorGradientFilledDefault: Color { Self.IconActionColorGradientFilledDefault }
    public var IconActionColorGradientFilledInactive: Color { Self.IconActionColorGradientFilledInactive }
    public var IconActionColorOrangeFilledDefault: Color { Self.IconActionColorOrangeFilledDefault }
    public var IconActionColorOrangeFilledInactive: Color { Self.IconActionColorOrangeFilledInactive }
    public var IconActionColorOrangeOutlineDefault: Color { Self.IconActionColorOrangeOutlineDefault }
    public var IconActionColorOrangeOutlineInactive: Color { Self.IconActionColorOrangeOutlineInactive }
    public var IconActionColorTransparent05FilledDefault: Color { Self.IconActionColorTransparent05FilledDefault }
    public var IconActionColorTransparent05FilledInactive: Color { Self.IconActionColorTransparent05FilledInactive }
    public var IconActionColorTransparent10FilledDefault: Color { Self.IconActionColorTransparent10FilledDefault }
    public var IconActionColorTransparent10FilledInactive: Color { Self.IconActionColorTransparent10FilledInactive }
    public var IconActionColorWhiteFilledDefault: Color { Self.IconActionColorWhiteFilledDefault }
    public var IconActionColorWhiteFilledInactive: Color { Self.IconActionColorWhiteFilledInactive }
    public var IconInputColorActive: Color { Self.IconInputColorActive }
    public var IconInputColorDefault: Color { Self.IconInputColorDefault }
    public var IconInputColorInactive: Color { Self.IconInputColorInactive }
    public var IconOnContainerColorAccent: Color { Self.IconOnContainerColorAccent }
    public var IconOnContainerColorAccent2: Color { Self.IconOnContainerColorAccent2 }
    public var IconOnContainerColorError: Color { Self.IconOnContainerColorError }
    public var IconOnContainerColorInactive: Color { Self.IconOnContainerColorInactive }
    public var IconOnContainerColorInformational: Color { Self.IconOnContainerColorInformational }
    public var IconOnContainerColorInverse: Color { Self.IconOnContainerColorInverse }
    public var IconOnContainerColorPrimary: Color { Self.IconOnContainerColorPrimary }
    public var IconOnContainerColorSecondary: Color { Self.IconOnContainerColorSecondary }
    public var IconOnContainerColorSuccess: Color { Self.IconOnContainerColorSuccess }
    public var IconOnContainerColorTertiary: Color { Self.IconOnContainerColorTertiary }
    public var IconOnContainerColorWarning: Color { Self.IconOnContainerColorWarning }
    public var IconOnSurfaceColorAccent: Color { Self.IconOnSurfaceColorAccent }
    public var IconOnSurfaceColorAccent2: Color { Self.IconOnSurfaceColorAccent2 }
    public var IconOnSurfaceColorError: Color { Self.IconOnSurfaceColorError }
    public var IconOnSurfaceColorInactive: Color { Self.IconOnSurfaceColorInactive }
    public var IconOnSurfaceColorInformational: Color { Self.IconOnSurfaceColorInformational }
    public var IconOnSurfaceColorInverse: Color { Self.IconOnSurfaceColorInverse }
    public var IconOnSurfaceColorPrimary: Color { Self.IconOnSurfaceColorPrimary }
    public var IconOnSurfaceColorSecondary: Color { Self.IconOnSurfaceColorSecondary }
    public var IconOnSurfaceColorSuccess: Color { Self.IconOnSurfaceColorSuccess }
    public var IconOnSurfaceColorTertiary: Color { Self.IconOnSurfaceColorTertiary }
    public var IconOnSurfaceColorWarning: Color { Self.IconOnSurfaceColorWarning }
    public var IconSelectorColorFilledActive: Color { Self.IconSelectorColorFilledActive }
    public var IconSelectorColorFilledDefault: Color { Self.IconSelectorColorFilledDefault }
    public var IconSelectorColorFilledInactive: Color { Self.IconSelectorColorFilledInactive }
    public var IconSelectorColorFilledSelected: Color { Self.IconSelectorColorFilledSelected }
    public var IconSelectorColorOutlineActive: Color { Self.IconSelectorColorOutlineActive }
    public var IconSelectorColorOutlineDefault: Color { Self.IconSelectorColorOutlineDefault }
    public var IconSelectorColorOutlineInactive: Color { Self.IconSelectorColorOutlineInactive }
    public var IconSelectorColorOutlineSelected: Color { Self.IconSelectorColorOutlineSelected }
}