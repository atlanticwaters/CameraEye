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
    var IconColorPrimary: Color { get }
    var IconColorSecondary: Color { get }
    var IconColorTertiary: Color { get }
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
    var IconOnSurfaceColorDanger: Color { get }
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
    var IconSelectorColorFilledIconcolorbrand: Color { get }
    var IconSelectorColorFilledIconcolorwarning: Color { get }
    var IconSelectorColorFilledIcononbrandcolorprimary: Color { get }
    var IconSelectorColorFilledIcononsurfacecolordisabled: Color { get }
    var IconSelectorColorFilledIcononsurfacecolorprimary: Color { get }
    var IconSelectorColorFilledIcononsurfacecolorsecondary: Color { get }
    var IconSelectorColorFilledIcononsurfacecolortertiary: Color { get }
    var IconSelectorColorFilledInactive: Color { get }
    var IconSelectorColorFilledSelected: Color { get }
    var IconSelectorColorOutlineActive: Color { get }
    var IconSelectorColorOutlineDefault: Color { get }
    var IconSelectorColorOutlineInactive: Color { get }
    var IconSelectorColorOutlineSelected: Color { get }
    var InputBackgroundDefault: Color { get }
    var InputBackgroundError: Color { get }
    var InputBackgroundFocused: Color { get }
    var InputBorderDefault: Color { get }
    var InputBorderError: Color { get }
    var InputBorderFocused: Color { get }
    var InputTextError: Color { get }
    var InputTextHelper: Color { get }
    var InputTextLabel: Color { get }
    var InputTextPlaceholder: Color { get }
    var UiAnimationDurationFast: CGFloat { get }
    var UiAnimationDurationInstant: CGFloat { get }
    var UiAnimationDurationNormal: CGFloat { get }
    var UiAnimationDurationSlow: CGFloat { get }
    var UiAnimationDurationVerySlow: CGFloat { get }
    var UiAnimationMovementEasein: CGFloat { get }
    var UiAnimationMovementEaseinout: CGFloat { get }
    var UiAnimationMovementEaseout: CGFloat { get }
    var UiAnimationMovementSpring: CGFloat { get }
    var UiBackgroundMenuColor: Color { get }
    var UiBackgroundModalColor: Color { get }
    var UiBackgroundNavigationbar: Color { get }
    var UiBackgroundPopoverColor: Color { get }
    var UiBackgroundSearchbar: Color { get }
    var UiBackgroundSheetColor: Color { get }
    var UiBackgroundStatusbar: Color { get }
    var UiBackgroundSurfaceColorElevated: Color { get }
    var UiBackgroundSurfaceColorGrouped: Color { get }
    var UiBackgroundSurfaceColorPrimary: Color { get }
    var UiBackgroundSurfaceColorSecondary: Color { get }
    var UiBackgroundSurfacecolorElevated: Color { get }
    var UiBackgroundSurfacecolorGrouped: Color { get }
    var UiBackgroundSurfacecolorPrimary: Color { get }
    var UiBackgroundSurfacecolorSecondary: Color { get }
    var UiBackgroundTabbar: Color { get }
    var UiBackgroundToastColor: Color { get }
    var UiBackgroundToolbar: Color { get }
    var UiElevation2x: CGFloat { get }
    var UiElevationLg: CGFloat { get }
    var UiElevationMd: CGFloat { get }
    var UiElevationNone: CGFloat { get }
    var UiElevationSm: CGFloat { get }
    var UiElevationXl: CGFloat { get }
    var UiElevationXs: CGFloat { get }
    var UiFillColorPrimary: Color { get }
    var UiFillColorQuaternary: Color { get }
    var UiFillColorSecondary: Color { get }
    var UiFillColorTertiary: Color { get }
    var UiFillPrimary: Color { get }
    var UiFillQuaternary: Color { get }
    var UiFillSecondary: Color { get }
    var UiFillTertiary: Color { get }
    var UiInputBackgroundDefault: Color { get }
    var UiInputBackgroundError: Color { get }
    var UiInputBackgroundFocused: Color { get }
    var UiInputBorderDefault: Color { get }
    var UiInputBorderError: Color { get }
    var UiInputBorderFocused: Color { get }
    var UiInputTextError: Color { get }
    var UiInputTextHelper: Color { get }
    var UiInputTextLabel: Color { get }
    var UiInputTextPlaceholder: Color { get }
    var UiListTableDefault: Color { get }
    var UiListTableFooter: Color { get }
    var UiListTableHeader: Color { get }
    var UiListTableHighlighted: Color { get }
    var UiListTableSelected: Color { get }
    var UiListTableSwipeAction: Color { get }
    var UiNavigationBackindicator: Color { get }
    var UiNavigationButtontint: Color { get }
    var UiNavigationTitlecolor: Color { get }
    var UiSpacingContentInsetHorizontal: CGFloat { get }
    var UiSpacingContentInsetVertical: CGFloat { get }
    var UiSpacingContentPaddingCard: CGFloat { get }
    var UiSpacingContentPaddingListItem: CGFloat { get }
    var UiSpacingContentPaddingSection: CGFloat { get }
    var UiSpacingContentPaddingStack: CGFloat { get }
    var UiSpacingContentSafeAreaBottom: CGFloat { get }
    var UiSpacingContentSafeAreaTop: CGFloat { get }
    var UiSpacingSpacing0: CGFloat { get }
    var UiSpacingSpacing1: CGFloat { get }
    var UiSpacingSpacing10: CGFloat { get }
    var UiSpacingSpacing2: CGFloat { get }
    var UiSpacingSpacing3: CGFloat { get }
    var UiSpacingSpacing4: CGFloat { get }
    var UiSpacingSpacing5: CGFloat { get }
    var UiSpacingSpacing6: CGFloat { get }
    var UiSpacingSpacing7: CGFloat { get }
    var UiSpacingSpacing8: CGFloat { get }
    var UiSpacingSpacing9: CGFloat { get }
    var UiTabbarBadgebackground: Color { get }
    var UiTabbarBadgetext: Color { get }
    var UiTabbarItemactive: Color { get }
    var UiTabbarIteminactive: Color { get }
    var UiTabbarIteninactive: Color { get }
    var UiTintColorPrimary: Color { get }
    var UiTintColorQuaternary: Color { get }
    var UiTintColorSecondary: Color { get }
    var UiTintColorTertiary: Color { get }
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
    public var IconColorPrimary: Color { Self.IconColorPrimary }
    public var IconColorSecondary: Color { Self.IconColorSecondary }
    public var IconColorTertiary: Color { Self.IconColorTertiary }
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
    public var IconOnSurfaceColorDanger: Color { Self.IconOnSurfaceColorDanger }
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
    public var IconSelectorColorFilledIconcolorbrand: Color { Self.IconSelectorColorFilledIconcolorbrand }
    public var IconSelectorColorFilledIconcolorwarning: Color { Self.IconSelectorColorFilledIconcolorwarning }
    public var IconSelectorColorFilledIcononbrandcolorprimary: Color { Self.IconSelectorColorFilledIcononbrandcolorprimary }
    public var IconSelectorColorFilledIcononsurfacecolordisabled: Color { Self.IconSelectorColorFilledIcononsurfacecolordisabled }
    public var IconSelectorColorFilledIcononsurfacecolorprimary: Color { Self.IconSelectorColorFilledIcononsurfacecolorprimary }
    public var IconSelectorColorFilledIcononsurfacecolorsecondary: Color { Self.IconSelectorColorFilledIcononsurfacecolorsecondary }
    public var IconSelectorColorFilledIcononsurfacecolortertiary: Color { Self.IconSelectorColorFilledIcononsurfacecolortertiary }
    public var IconSelectorColorFilledInactive: Color { Self.IconSelectorColorFilledInactive }
    public var IconSelectorColorFilledSelected: Color { Self.IconSelectorColorFilledSelected }
    public var IconSelectorColorOutlineActive: Color { Self.IconSelectorColorOutlineActive }
    public var IconSelectorColorOutlineDefault: Color { Self.IconSelectorColorOutlineDefault }
    public var IconSelectorColorOutlineInactive: Color { Self.IconSelectorColorOutlineInactive }
    public var IconSelectorColorOutlineSelected: Color { Self.IconSelectorColorOutlineSelected }
    public var InputBackgroundDefault: Color { Self.InputBackgroundDefault }
    public var InputBackgroundError: Color { Self.InputBackgroundError }
    public var InputBackgroundFocused: Color { Self.InputBackgroundFocused }
    public var InputBorderDefault: Color { Self.InputBorderDefault }
    public var InputBorderError: Color { Self.InputBorderError }
    public var InputBorderFocused: Color { Self.InputBorderFocused }
    public var InputTextError: Color { Self.InputTextError }
    public var InputTextHelper: Color { Self.InputTextHelper }
    public var InputTextLabel: Color { Self.InputTextLabel }
    public var InputTextPlaceholder: Color { Self.InputTextPlaceholder }
    public var UiAnimationDurationFast: CGFloat { Self.UiAnimationDurationFast }
    public var UiAnimationDurationInstant: CGFloat { Self.UiAnimationDurationInstant }
    public var UiAnimationDurationNormal: CGFloat { Self.UiAnimationDurationNormal }
    public var UiAnimationDurationSlow: CGFloat { Self.UiAnimationDurationSlow }
    public var UiAnimationDurationVerySlow: CGFloat { Self.UiAnimationDurationVerySlow }
    public var UiAnimationMovementEasein: CGFloat { Self.UiAnimationMovementEasein }
    public var UiAnimationMovementEaseinout: CGFloat { Self.UiAnimationMovementEaseinout }
    public var UiAnimationMovementEaseout: CGFloat { Self.UiAnimationMovementEaseout }
    public var UiAnimationMovementSpring: CGFloat { Self.UiAnimationMovementSpring }
    public var UiBackgroundMenuColor: Color { Self.UiBackgroundMenuColor }
    public var UiBackgroundModalColor: Color { Self.UiBackgroundModalColor }
    public var UiBackgroundNavigationbar: Color { Self.UiBackgroundNavigationbar }
    public var UiBackgroundPopoverColor: Color { Self.UiBackgroundPopoverColor }
    public var UiBackgroundSearchbar: Color { Self.UiBackgroundSearchbar }
    public var UiBackgroundSheetColor: Color { Self.UiBackgroundSheetColor }
    public var UiBackgroundStatusbar: Color { Self.UiBackgroundStatusbar }
    public var UiBackgroundSurfaceColorElevated: Color { Self.UiBackgroundSurfaceColorElevated }
    public var UiBackgroundSurfaceColorGrouped: Color { Self.UiBackgroundSurfaceColorGrouped }
    public var UiBackgroundSurfaceColorPrimary: Color { Self.UiBackgroundSurfaceColorPrimary }
    public var UiBackgroundSurfaceColorSecondary: Color { Self.UiBackgroundSurfaceColorSecondary }
    public var UiBackgroundSurfacecolorElevated: Color { Self.UiBackgroundSurfacecolorElevated }
    public var UiBackgroundSurfacecolorGrouped: Color { Self.UiBackgroundSurfacecolorGrouped }
    public var UiBackgroundSurfacecolorPrimary: Color { Self.UiBackgroundSurfacecolorPrimary }
    public var UiBackgroundSurfacecolorSecondary: Color { Self.UiBackgroundSurfacecolorSecondary }
    public var UiBackgroundTabbar: Color { Self.UiBackgroundTabbar }
    public var UiBackgroundToastColor: Color { Self.UiBackgroundToastColor }
    public var UiBackgroundToolbar: Color { Self.UiBackgroundToolbar }
    public var UiElevation2x: CGFloat { Self.UiElevation2x }
    public var UiElevationLg: CGFloat { Self.UiElevationLg }
    public var UiElevationMd: CGFloat { Self.UiElevationMd }
    public var UiElevationNone: CGFloat { Self.UiElevationNone }
    public var UiElevationSm: CGFloat { Self.UiElevationSm }
    public var UiElevationXl: CGFloat { Self.UiElevationXl }
    public var UiElevationXs: CGFloat { Self.UiElevationXs }
    public var UiFillColorPrimary: Color { Self.UiFillColorPrimary }
    public var UiFillColorQuaternary: Color { Self.UiFillColorQuaternary }
    public var UiFillColorSecondary: Color { Self.UiFillColorSecondary }
    public var UiFillColorTertiary: Color { Self.UiFillColorTertiary }
    public var UiFillPrimary: Color { Self.UiFillPrimary }
    public var UiFillQuaternary: Color { Self.UiFillQuaternary }
    public var UiFillSecondary: Color { Self.UiFillSecondary }
    public var UiFillTertiary: Color { Self.UiFillTertiary }
    public var UiInputBackgroundDefault: Color { Self.UiInputBackgroundDefault }
    public var UiInputBackgroundError: Color { Self.UiInputBackgroundError }
    public var UiInputBackgroundFocused: Color { Self.UiInputBackgroundFocused }
    public var UiInputBorderDefault: Color { Self.UiInputBorderDefault }
    public var UiInputBorderError: Color { Self.UiInputBorderError }
    public var UiInputBorderFocused: Color { Self.UiInputBorderFocused }
    public var UiInputTextError: Color { Self.UiInputTextError }
    public var UiInputTextHelper: Color { Self.UiInputTextHelper }
    public var UiInputTextLabel: Color { Self.UiInputTextLabel }
    public var UiInputTextPlaceholder: Color { Self.UiInputTextPlaceholder }
    public var UiListTableDefault: Color { Self.UiListTableDefault }
    public var UiListTableFooter: Color { Self.UiListTableFooter }
    public var UiListTableHeader: Color { Self.UiListTableHeader }
    public var UiListTableHighlighted: Color { Self.UiListTableHighlighted }
    public var UiListTableSelected: Color { Self.UiListTableSelected }
    public var UiListTableSwipeAction: Color { Self.UiListTableSwipeAction }
    public var UiNavigationBackindicator: Color { Self.UiNavigationBackindicator }
    public var UiNavigationButtontint: Color { Self.UiNavigationButtontint }
    public var UiNavigationTitlecolor: Color { Self.UiNavigationTitlecolor }
    public var UiSpacingContentInsetHorizontal: CGFloat { Self.UiSpacingContentInsetHorizontal }
    public var UiSpacingContentInsetVertical: CGFloat { Self.UiSpacingContentInsetVertical }
    public var UiSpacingContentPaddingCard: CGFloat { Self.UiSpacingContentPaddingCard }
    public var UiSpacingContentPaddingListItem: CGFloat { Self.UiSpacingContentPaddingListItem }
    public var UiSpacingContentPaddingSection: CGFloat { Self.UiSpacingContentPaddingSection }
    public var UiSpacingContentPaddingStack: CGFloat { Self.UiSpacingContentPaddingStack }
    public var UiSpacingContentSafeAreaBottom: CGFloat { Self.UiSpacingContentSafeAreaBottom }
    public var UiSpacingContentSafeAreaTop: CGFloat { Self.UiSpacingContentSafeAreaTop }
    public var UiSpacingSpacing0: CGFloat { Self.UiSpacingSpacing0 }
    public var UiSpacingSpacing1: CGFloat { Self.UiSpacingSpacing1 }
    public var UiSpacingSpacing10: CGFloat { Self.UiSpacingSpacing10 }
    public var UiSpacingSpacing2: CGFloat { Self.UiSpacingSpacing2 }
    public var UiSpacingSpacing3: CGFloat { Self.UiSpacingSpacing3 }
    public var UiSpacingSpacing4: CGFloat { Self.UiSpacingSpacing4 }
    public var UiSpacingSpacing5: CGFloat { Self.UiSpacingSpacing5 }
    public var UiSpacingSpacing6: CGFloat { Self.UiSpacingSpacing6 }
    public var UiSpacingSpacing7: CGFloat { Self.UiSpacingSpacing7 }
    public var UiSpacingSpacing8: CGFloat { Self.UiSpacingSpacing8 }
    public var UiSpacingSpacing9: CGFloat { Self.UiSpacingSpacing9 }
    public var UiTabbarBadgebackground: Color { Self.UiTabbarBadgebackground }
    public var UiTabbarBadgetext: Color { Self.UiTabbarBadgetext }
    public var UiTabbarItemactive: Color { Self.UiTabbarItemactive }
    public var UiTabbarIteminactive: Color { Self.UiTabbarIteminactive }
    public var UiTabbarIteninactive: Color { Self.UiTabbarIteninactive }
    public var UiTintColorPrimary: Color { Self.UiTintColorPrimary }
    public var UiTintColorQuaternary: Color { Self.UiTintColorQuaternary }
    public var UiTintColorSecondary: Color { Self.UiTintColorSecondary }
    public var UiTintColorTertiary: Color { Self.UiTintColorTertiary }
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
    public var IconColorPrimary: Color { Self.IconColorPrimary }
    public var IconColorSecondary: Color { Self.IconColorSecondary }
    public var IconColorTertiary: Color { Self.IconColorTertiary }
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
    public var IconOnSurfaceColorDanger: Color { Self.IconOnSurfaceColorDanger }
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
    public var IconSelectorColorFilledIconcolorbrand: Color { Self.IconSelectorColorFilledIconcolorbrand }
    public var IconSelectorColorFilledIconcolorwarning: Color { Self.IconSelectorColorFilledIconcolorwarning }
    public var IconSelectorColorFilledIcononbrandcolorprimary: Color { Self.IconSelectorColorFilledIcononbrandcolorprimary }
    public var IconSelectorColorFilledIcononsurfacecolordisabled: Color { Self.IconSelectorColorFilledIcononsurfacecolordisabled }
    public var IconSelectorColorFilledIcononsurfacecolorprimary: Color { Self.IconSelectorColorFilledIcononsurfacecolorprimary }
    public var IconSelectorColorFilledIcononsurfacecolorsecondary: Color { Self.IconSelectorColorFilledIcononsurfacecolorsecondary }
    public var IconSelectorColorFilledIcononsurfacecolortertiary: Color { Self.IconSelectorColorFilledIcononsurfacecolortertiary }
    public var IconSelectorColorFilledInactive: Color { Self.IconSelectorColorFilledInactive }
    public var IconSelectorColorFilledSelected: Color { Self.IconSelectorColorFilledSelected }
    public var IconSelectorColorOutlineActive: Color { Self.IconSelectorColorOutlineActive }
    public var IconSelectorColorOutlineDefault: Color { Self.IconSelectorColorOutlineDefault }
    public var IconSelectorColorOutlineInactive: Color { Self.IconSelectorColorOutlineInactive }
    public var IconSelectorColorOutlineSelected: Color { Self.IconSelectorColorOutlineSelected }
    public var InputBackgroundDefault: Color { Self.InputBackgroundDefault }
    public var InputBackgroundError: Color { Self.InputBackgroundError }
    public var InputBackgroundFocused: Color { Self.InputBackgroundFocused }
    public var InputBorderDefault: Color { Self.InputBorderDefault }
    public var InputBorderError: Color { Self.InputBorderError }
    public var InputBorderFocused: Color { Self.InputBorderFocused }
    public var InputTextError: Color { Self.InputTextError }
    public var InputTextHelper: Color { Self.InputTextHelper }
    public var InputTextLabel: Color { Self.InputTextLabel }
    public var InputTextPlaceholder: Color { Self.InputTextPlaceholder }
    public var UiAnimationDurationFast: CGFloat { Self.UiAnimationDurationFast }
    public var UiAnimationDurationInstant: CGFloat { Self.UiAnimationDurationInstant }
    public var UiAnimationDurationNormal: CGFloat { Self.UiAnimationDurationNormal }
    public var UiAnimationDurationSlow: CGFloat { Self.UiAnimationDurationSlow }
    public var UiAnimationDurationVerySlow: CGFloat { Self.UiAnimationDurationVerySlow }
    public var UiAnimationMovementEasein: CGFloat { Self.UiAnimationMovementEasein }
    public var UiAnimationMovementEaseinout: CGFloat { Self.UiAnimationMovementEaseinout }
    public var UiAnimationMovementEaseout: CGFloat { Self.UiAnimationMovementEaseout }
    public var UiAnimationMovementSpring: CGFloat { Self.UiAnimationMovementSpring }
    public var UiBackgroundMenuColor: Color { Self.UiBackgroundMenuColor }
    public var UiBackgroundModalColor: Color { Self.UiBackgroundModalColor }
    public var UiBackgroundNavigationbar: Color { Self.UiBackgroundNavigationbar }
    public var UiBackgroundPopoverColor: Color { Self.UiBackgroundPopoverColor }
    public var UiBackgroundSearchbar: Color { Self.UiBackgroundSearchbar }
    public var UiBackgroundSheetColor: Color { Self.UiBackgroundSheetColor }
    public var UiBackgroundStatusbar: Color { Self.UiBackgroundStatusbar }
    public var UiBackgroundSurfaceColorElevated: Color { Self.UiBackgroundSurfaceColorElevated }
    public var UiBackgroundSurfaceColorGrouped: Color { Self.UiBackgroundSurfaceColorGrouped }
    public var UiBackgroundSurfaceColorPrimary: Color { Self.UiBackgroundSurfaceColorPrimary }
    public var UiBackgroundSurfaceColorSecondary: Color { Self.UiBackgroundSurfaceColorSecondary }
    public var UiBackgroundSurfacecolorElevated: Color { Self.UiBackgroundSurfacecolorElevated }
    public var UiBackgroundSurfacecolorGrouped: Color { Self.UiBackgroundSurfacecolorGrouped }
    public var UiBackgroundSurfacecolorPrimary: Color { Self.UiBackgroundSurfacecolorPrimary }
    public var UiBackgroundSurfacecolorSecondary: Color { Self.UiBackgroundSurfacecolorSecondary }
    public var UiBackgroundTabbar: Color { Self.UiBackgroundTabbar }
    public var UiBackgroundToastColor: Color { Self.UiBackgroundToastColor }
    public var UiBackgroundToolbar: Color { Self.UiBackgroundToolbar }
    public var UiElevation2x: CGFloat { Self.UiElevation2x }
    public var UiElevationLg: CGFloat { Self.UiElevationLg }
    public var UiElevationMd: CGFloat { Self.UiElevationMd }
    public var UiElevationNone: CGFloat { Self.UiElevationNone }
    public var UiElevationSm: CGFloat { Self.UiElevationSm }
    public var UiElevationXl: CGFloat { Self.UiElevationXl }
    public var UiElevationXs: CGFloat { Self.UiElevationXs }
    public var UiFillColorPrimary: Color { Self.UiFillColorPrimary }
    public var UiFillColorQuaternary: Color { Self.UiFillColorQuaternary }
    public var UiFillColorSecondary: Color { Self.UiFillColorSecondary }
    public var UiFillColorTertiary: Color { Self.UiFillColorTertiary }
    public var UiFillPrimary: Color { Self.UiFillPrimary }
    public var UiFillQuaternary: Color { Self.UiFillQuaternary }
    public var UiFillSecondary: Color { Self.UiFillSecondary }
    public var UiFillTertiary: Color { Self.UiFillTertiary }
    public var UiInputBackgroundDefault: Color { Self.UiInputBackgroundDefault }
    public var UiInputBackgroundError: Color { Self.UiInputBackgroundError }
    public var UiInputBackgroundFocused: Color { Self.UiInputBackgroundFocused }
    public var UiInputBorderDefault: Color { Self.UiInputBorderDefault }
    public var UiInputBorderError: Color { Self.UiInputBorderError }
    public var UiInputBorderFocused: Color { Self.UiInputBorderFocused }
    public var UiInputTextError: Color { Self.UiInputTextError }
    public var UiInputTextHelper: Color { Self.UiInputTextHelper }
    public var UiInputTextLabel: Color { Self.UiInputTextLabel }
    public var UiInputTextPlaceholder: Color { Self.UiInputTextPlaceholder }
    public var UiListTableDefault: Color { Self.UiListTableDefault }
    public var UiListTableFooter: Color { Self.UiListTableFooter }
    public var UiListTableHeader: Color { Self.UiListTableHeader }
    public var UiListTableHighlighted: Color { Self.UiListTableHighlighted }
    public var UiListTableSelected: Color { Self.UiListTableSelected }
    public var UiListTableSwipeAction: Color { Self.UiListTableSwipeAction }
    public var UiNavigationBackindicator: Color { Self.UiNavigationBackindicator }
    public var UiNavigationButtontint: Color { Self.UiNavigationButtontint }
    public var UiNavigationTitlecolor: Color { Self.UiNavigationTitlecolor }
    public var UiSpacingContentInsetHorizontal: CGFloat { Self.UiSpacingContentInsetHorizontal }
    public var UiSpacingContentInsetVertical: CGFloat { Self.UiSpacingContentInsetVertical }
    public var UiSpacingContentPaddingCard: CGFloat { Self.UiSpacingContentPaddingCard }
    public var UiSpacingContentPaddingListItem: CGFloat { Self.UiSpacingContentPaddingListItem }
    public var UiSpacingContentPaddingSection: CGFloat { Self.UiSpacingContentPaddingSection }
    public var UiSpacingContentPaddingStack: CGFloat { Self.UiSpacingContentPaddingStack }
    public var UiSpacingContentSafeAreaBottom: CGFloat { Self.UiSpacingContentSafeAreaBottom }
    public var UiSpacingContentSafeAreaTop: CGFloat { Self.UiSpacingContentSafeAreaTop }
    public var UiSpacingSpacing0: CGFloat { Self.UiSpacingSpacing0 }
    public var UiSpacingSpacing1: CGFloat { Self.UiSpacingSpacing1 }
    public var UiSpacingSpacing10: CGFloat { Self.UiSpacingSpacing10 }
    public var UiSpacingSpacing2: CGFloat { Self.UiSpacingSpacing2 }
    public var UiSpacingSpacing3: CGFloat { Self.UiSpacingSpacing3 }
    public var UiSpacingSpacing4: CGFloat { Self.UiSpacingSpacing4 }
    public var UiSpacingSpacing5: CGFloat { Self.UiSpacingSpacing5 }
    public var UiSpacingSpacing6: CGFloat { Self.UiSpacingSpacing6 }
    public var UiSpacingSpacing7: CGFloat { Self.UiSpacingSpacing7 }
    public var UiSpacingSpacing8: CGFloat { Self.UiSpacingSpacing8 }
    public var UiSpacingSpacing9: CGFloat { Self.UiSpacingSpacing9 }
    public var UiTabbarBadgebackground: Color { Self.UiTabbarBadgebackground }
    public var UiTabbarBadgetext: Color { Self.UiTabbarBadgetext }
    public var UiTabbarItemactive: Color { Self.UiTabbarItemactive }
    public var UiTabbarIteminactive: Color { Self.UiTabbarIteminactive }
    public var UiTabbarIteninactive: Color { Self.UiTabbarIteninactive }
    public var UiTintColorPrimary: Color { Self.UiTintColorPrimary }
    public var UiTintColorQuaternary: Color { Self.UiTintColorQuaternary }
    public var UiTintColorSecondary: Color { Self.UiTintColorSecondary }
    public var UiTintColorTertiary: Color { Self.UiTintColorTertiary }
}