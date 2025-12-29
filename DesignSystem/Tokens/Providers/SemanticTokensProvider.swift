//
// SemanticTokensProvider.swift
//

// Do not edit directly, this file was auto-generated.

import SwiftUI

/// Protocol defining the semantic tokens contract.
///
/// Both `TokensSemanticLight` and `TokensSemanticDark` conform to this protocol,
/// enabling theme-agnostic code and easier testing through dependency injection.
///
/// ## Usage
/// ```swift
/// struct MyView: View {
///     let tokens: any SemanticTokensProvider
///     
///     var body: some View {
///         Text("Hello")
///             .foregroundColor(tokens.textPrimary)
///     }
/// }
/// ```
public protocol SemanticTokensProvider {
    var BackgroundAccentColorBlue: Color { get }
    var BackgroundAccentColorBrand: Color { get }
    var BackgroundAccentColorBrown: Color { get }
    var BackgroundAccentColorDarkGreige: Color { get }
    var BackgroundAccentColorGreen: Color { get }
    var BackgroundAccentColorGreige: Color { get }
    var BackgroundAccentColorRed: Color { get }
    var BackgroundAccentColorYellow: Color { get }
    var BackgroundActionColorPrimary: Color { get }
    var BackgroundActionColorSecondary: Color { get }
    var BackgroundButtonColorBrandFilledDefault: Color { get }
    var BackgroundButtonColorBrandFilledInactive: Color { get }
    var BackgroundButtonColorBrandGradientFilledDefault: Color { get }
    var BackgroundButtonColorBrandGradientFilledInactive: Color { get }
    var BackgroundButtonColorGhostFilledDefault: Color { get }
    var BackgroundButtonColorGhostFilledInactive: Color { get }
    var BackgroundButtonColorGhostFilledPressed: Color { get }
    var BackgroundButtonColorTransparent05Active: Color { get }
    var BackgroundButtonColorTransparent05Default: Color { get }
    var BackgroundButtonColorTransparent05Inactive: Color { get }
    var BackgroundButtonColorTransparent05Pressed: Color { get }
    var BackgroundButtonColorTransparent10Active: Color { get }
    var BackgroundButtonColorTransparent10Default: Color { get }
    var BackgroundButtonColorTransparent10Inactive: Color { get }
    var BackgroundButtonColorTransparent10Pressed: Color { get }
    var BackgroundButtonColorWhiteFilledDefault: Color { get }
    var BackgroundButtonColorWhiteFilledInactive: Color { get }
    var BackgroundContainerColorBrand: Color { get }
    var BackgroundContainerColorBrandAccent: Color { get }
    var BackgroundContainerColorGreige: Color { get }
    var BackgroundContainerColorInverse: Color { get }
    var BackgroundContainerColorTransparent05: Color { get }
    var BackgroundContainerColorTransparent10: Color { get }
    var BackgroundContainerColorTransparent20: Color { get }
    var BackgroundContainerColorWhite: Color { get }
    var BackgroundContainerPrimary: Color { get }
    var BackgroundContainerSecondary: Color { get }
    var BackgroundFeedbackColorErrorAccent1: Color { get }
    var BackgroundFeedbackColorErrorAccent2: Color { get }
    var BackgroundFeedbackColorInformationalAccent1: Color { get }
    var BackgroundFeedbackColorInformationalAccent2: Color { get }
    var BackgroundFeedbackColorSuccessAccent1: Color { get }
    var BackgroundFeedbackColorSuccessAccent2: Color { get }
    var BackgroundFeedbackColorWarningAccent1: Color { get }
    var BackgroundFeedbackColorWarningAccent2: Color { get }
    var BackgroundInputColorBrandFilledDefault: Color { get }
    var BackgroundInputColorTransparent10Default: Color { get }
    var BackgroundInputColorWhiteOutlinedDefault: Color { get }
    var BackgroundInputColorWhiteOutlinedInactive: Color { get }
    var BackgroundInputColorWhiteOutlinedPressed: Color { get }
    var BackgroundOverlayColorPageScrim: Color { get }
    var BackgroundSelectorColorFilledDefault: Color { get }
    var BackgroundSelectorColorFilledInactive: Color { get }
    var BackgroundSelectorColorFilledPressed: Color { get }
    var BackgroundSelectorColorFilledSelected: Color { get }
    var BackgroundSelectorColorFilledSwitchHandleDefault: Color { get }
    var BackgroundSelectorColorFilledSwitchHandleSelected: Color { get }
    var BackgroundSelectorColorFilledTransparent: Color { get }
    var BackgroundSelectorColorOutlineDefault: Color { get }
    var BackgroundSelectorColorOutlineInactive: Color { get }
    var BackgroundSelectorColorOutlinePressed: Color { get }
    var BackgroundSelectorColorOutlineSelected: Color { get }
    var BackgroundSelectorColorOutlineSelectedAccent: Color { get }
    var BackgroundSurfaceColorGreige: Color { get }
    var BackgroundSurfaceColorInverse: Color { get }
    var BackgroundSurfaceColorSecondary: Color { get }
    var BackgroundSurfaceColorTertiary: Color { get }
    var Border0: CGFloat { get }
    var Border1: CGFloat { get }
    var Border10: CGFloat { get }
    var Border11: CGFloat { get }
    var Border12: CGFloat { get }
    var Border2: CGFloat { get }
    var Border3: CGFloat { get }
    var Border4: CGFloat { get }
    var Border5: CGFloat { get }
    var Border6: CGFloat { get }
    var Border7: CGFloat { get }
    var Border8: CGFloat { get }
    var Border9: CGFloat { get }
    var BorderButtonColorAccent: Color { get }
    var BorderButtonColorAccent2: Color { get }
    var BorderButtonColorDefault: Color { get }
    var BorderButtonColorFocus: Color { get }
    var BorderButtonColorInactive: Color { get }
    var BorderButtonColorOrangeOutlineDefault: Color { get }
    var BorderButtonColorOrangeOutlineInactive: Color { get }
    var BorderButtonColorPressed: Color { get }
    var BorderColorFocus: Color { get }
    var BorderColorPrimary: Color { get }
    var BorderInputColorAccent: Color { get }
    var BorderInputColorAccent2: Color { get }
    var BorderInputColorActive: Color { get }
    var BorderInputColorDefault: Color { get }
    var BorderInputColorError: Color { get }
    var BorderInputColorFocus: Color { get }
    var BorderInputColorInactive: Color { get }
    var BorderInputColorPressed: Color { get }
    var BorderInputColorSuccess: Color { get }
    var BorderInputColorWarning: Color { get }
    var BorderOnContainerActive: Color { get }
    var BorderOnContainerDefault: Color { get }
    var BorderOnContainerInactive: Color { get }
    var BorderOnContainerInverse: Color { get }
    var BorderOnContainerPressed: Color { get }
    var BorderRadius2xl: CGFloat { get }
    var BorderRadius3xl: CGFloat { get }
    var BorderRadiusFull: CGFloat { get }
    var BorderRadiusLg: CGFloat { get }
    var BorderRadiusMd: CGFloat { get }
    var BorderRadiusNone: CGFloat { get }
    var BorderRadiusSm: CGFloat { get }
    var BorderRadiusXl: CGFloat { get }
    var BorderRadiusXs: CGFloat { get }
    var BorderSelectorColorFilledDefault: Color { get }
    var BorderSelectorColorFilledInactive: Color { get }
    var BorderSelectorColorFilledPressed: Color { get }
    var BorderSelectorColorFilledSelected: Color { get }
    var BorderSelectorColorOutlineDefault: Color { get }
    var BorderSelectorColorOutlineInactive: Color { get }
    var BorderSelectorColorOutlinePressed: Color { get }
    var BorderSelectorColorOutlineSelected: Color { get }
    var BorderSelectorColorOutlineSelectedAccent: Color { get }
    var BorderWidth2xl: CGFloat { get }
    var BorderWidthLg: CGFloat { get }
    var BorderWidthMd: CGFloat { get }
    var BorderWidthNone: CGFloat { get }
    var BorderWidthSm: CGFloat { get }
    var BorderWidthXl: CGFloat { get }
    var BorderWidthXs: CGFloat { get }
    var Brand025: Color { get }
    var Brand050: Color { get }
    var Brand100: Color { get }
    var Brand200: Color { get }
    var Brand300: Color { get }
    var Brand400: Color { get }
    var Brand500: Color { get }
    var Brand600: Color { get }
    var Brand700: Color { get }
    var Brand800: Color { get }
    var Brand900: Color { get }
    var Brand950: Color { get }
    var Cinnabar025: Color { get }
    var Cinnabar050: Color { get }
    var Cinnabar100: Color { get }
    var Cinnabar200: Color { get }
    var Cinnabar300: Color { get }
    var Cinnabar400: Color { get }
    var Cinnabar500: Color { get }
    var Cinnabar600: Color { get }
    var Cinnabar700: Color { get }
    var Cinnabar800: Color { get }
    var Cinnabar900: Color { get }
    var Cinnabar950: Color { get }
    var Greige025: Color { get }
    var Greige050: Color { get }
    var Greige100: Color { get }
    var Greige200: Color { get }
    var Greige300: Color { get }
    var Greige400: Color { get }
    var Greige500: Color { get }
    var Greige600: Color { get }
    var Greige700: Color { get }
    var Greige800: Color { get }
    var Greige900: Color { get }
    var Greige950: Color { get }
    var Lemon025: Color { get }
    var Lemon050: Color { get }
    var Lemon100: Color { get }
    var Lemon200: Color { get }
    var Lemon300: Color { get }
    var Lemon400: Color { get }
    var Lemon500: Color { get }
    var Lemon600: Color { get }
    var Lemon700: Color { get }
    var Lemon800: Color { get }
    var Lemon900: Color { get }
    var Lemon950: Color { get }
    var Moonlight025: Color { get }
    var Moonlight050: Color { get }
    var Moonlight100: Color { get }
    var Moonlight200: Color { get }
    var Moonlight300: Color { get }
    var Moonlight400: Color { get }
    var Moonlight500: Color { get }
    var Moonlight600: Color { get }
    var Moonlight700: Color { get }
    var Moonlight800: Color { get }
    var Moonlight900: Color { get }
    var Moonlight950: Color { get }
    var NeutralsBlack: Color { get }
    var NeutralsTransparent: Color { get }
    var NeutralsWhite: Color { get }
    var OverlayPressedDarken: Color { get }
    var OverlayPressedDarkenMore: Color { get }
    var OverlayPressedLighten: Color { get }
    var OverlayPressedLightenMore: Color { get }
    var TextButtonColorGhostFilledDefault: Color { get }
    var TextButtonColorGhostFilledInactive: Color { get }
    var TextButtonColorGradientFilledDefault: Color { get }
    var TextButtonColorGradientFilledInactive: Color { get }
    var TextButtonColorOrangeFilledDefault: Color { get }
    var TextButtonColorOrangeFilledInactive: Color { get }
    var TextButtonColorOrangeOutlineDefault: Color { get }
    var TextButtonColorOrangeOutlineInactive: Color { get }
    var TextButtonColorTransparent05FilledDefault: Color { get }
    var TextButtonColorTransparent05FilledInactive: Color { get }
    var TextButtonColorTransparent10FilledDefault: Color { get }
    var TextButtonColorTransparent10FilledInactive: Color { get }
    var TextButtonColorWhiteFilledDefault: Color { get }
    var TextButtonColorWhiteFilledInactive: Color { get }
    var TextInputColorBrandFilledDefault: Color { get }
    var TextInputColorTransparent10Active: Color { get }
    var TextInputColorTransparent10Default: Color { get }
    var TextInputColorTransparent10Inactive: Color { get }
    var TextInputColorWhiteOutlinedDefault: Color { get }
    var TextOn: Color { get }
    var TextOnBrandColorPrimary: Color { get }
    var TextOnContainerColorAccent: Color { get }
    var TextOnContainerColorAccent2: Color { get }
    var TextOnContainerColorError: Color { get }
    var TextOnContainerColorInactive: Color { get }
    var TextOnContainerColorInformational: Color { get }
    var TextOnContainerColorInverse: Color { get }
    var TextOnContainerColorPrimary: Color { get }
    var TextOnContainerColorQuatrenary: Color { get }
    var TextOnContainerColorSecondary: Color { get }
    var TextOnContainerColorSuccess: Color { get }
    var TextOnContainerColorTertiary: Color { get }
    var TextOnContainerColorWarning: Color { get }
    var TextOnErrorColorPrimary: Color { get }
    var TextOnPrimaryColorPrimary: Color { get }
    var TextOnPrimaryColorSecondary: Color { get }
    var TextOnSuccessColorPrimary: Color { get }
    var TextOnSurfaceColorAccent: Color { get }
    var TextOnSurfaceColorAccent2: Color { get }
    var TextOnSurfaceColorDestructive: Color { get }
    var TextOnSurfaceColorDisabled: Color { get }
    var TextOnSurfaceColorError: Color { get }
    var TextOnSurfaceColorInactive: Color { get }
    var TextOnSurfaceColorInformational: Color { get }
    var TextOnSurfaceColorInverse: Color { get }
    var TextOnSurfaceColorLink: Color { get }
    var TextOnSurfaceColorPlaceholder: Color { get }
    var TextOnSurfaceColorPrimary: Color { get }
    var TextOnSurfaceColorQuatrenary: Color { get }
    var TextOnSurfaceColorSecondary: Color { get }
    var TextOnSurfaceColorSuccess: Color { get }
    var TextOnSurfaceColorTertiary: Color { get }
    var TextOnSurfaceColorWarning: Color { get }
    var TextSelectorColorActive: Color { get }
    var TextSelectorColorDefault: Color { get }
    var TextSelectorColorFilledActive: Color { get }
    var TextSelectorColorFilledDefault: Color { get }
    var TextSelectorColorFilledInactive: Color { get }
    var TextSelectorColorFilledSelected: Color { get }
    var TextSelectorColorInactive: Color { get }
    var TextSelectorColorOutlineActive: Color { get }
    var TextSelectorColorOutlineDefault: Color { get }
    var TextSelectorColorOutlineInactive: Color { get }
    var TextSelectorColorOutlineSelected: Color { get }
    var TextSelectorColorSelected: Color { get }
    var TextureNotebookAlt: Color { get }
    var TransparentBlackTransparentBlack025: Color { get }
    var TransparentBlackTransparentBlack050: Color { get }
    var TransparentBlackTransparentBlack075: Color { get }
    var TransparentBlackTransparentBlack100: Color { get }
    var TransparentBlackTransparentBlack200: Color { get }
    var TransparentBlackTransparentBlack300: Color { get }
    var TransparentBlackTransparentBlack400: Color { get }
    var TransparentBlackTransparentBlack500: Color { get }
    var TransparentBlackTransparentBlack600: Color { get }
    var TransparentBlackTransparentBlack700: Color { get }
    var TransparentBlackTransparentBlack800: Color { get }
    var TransparentBlackTransparentBlack900: Color { get }
    var TransparentBlackTransparentBlack950: Color { get }
    var TransparentWhiteTransparentWhite025: Color { get }
    var TransparentWhiteTransparentWhite050: Color { get }
    var TransparentWhiteTransparentWhite075: Color { get }
    var TransparentWhiteTransparentWhite100: Color { get }
    var TransparentWhiteTransparentWhite200: Color { get }
    var TransparentWhiteTransparentWhite300: Color { get }
    var TransparentWhiteTransparentWhite400: Color { get }
    var TransparentWhiteTransparentWhite500: Color { get }
    var TransparentWhiteTransparentWhite600: Color { get }
    var TransparentWhiteTransparentWhite700: Color { get }
    var TransparentWhiteTransparentWhite800: Color { get }
    var TransparentWhiteTransparentWhite900: Color { get }
    var TransparentWhiteTransparentWhite950: Color { get }
}

// MARK: - Light Theme Conformance

extension TokensSemanticLight: SemanticTokensProvider {
    public var BackgroundAccentColorBlue: Color { Self.BackgroundAccentColorBlue }
    public var BackgroundAccentColorBrand: Color { Self.BackgroundAccentColorBrand }
    public var BackgroundAccentColorBrown: Color { Self.BackgroundAccentColorBrown }
    public var BackgroundAccentColorDarkGreige: Color { Self.BackgroundAccentColorDarkGreige }
    public var BackgroundAccentColorGreen: Color { Self.BackgroundAccentColorGreen }
    public var BackgroundAccentColorGreige: Color { Self.BackgroundAccentColorGreige }
    public var BackgroundAccentColorRed: Color { Self.BackgroundAccentColorRed }
    public var BackgroundAccentColorYellow: Color { Self.BackgroundAccentColorYellow }
    public var BackgroundActionColorPrimary: Color { Self.BackgroundActionColorPrimary }
    public var BackgroundActionColorSecondary: Color { Self.BackgroundActionColorSecondary }
    public var BackgroundButtonColorBrandFilledDefault: Color { Self.BackgroundButtonColorBrandFilledDefault }
    public var BackgroundButtonColorBrandFilledInactive: Color { Self.BackgroundButtonColorBrandFilledInactive }
    public var BackgroundButtonColorBrandGradientFilledDefault: Color { Self.BackgroundButtonColorBrandGradientFilledDefault }
    public var BackgroundButtonColorBrandGradientFilledInactive: Color { Self.BackgroundButtonColorBrandGradientFilledInactive }
    public var BackgroundButtonColorGhostFilledDefault: Color { Self.BackgroundButtonColorGhostFilledDefault }
    public var BackgroundButtonColorGhostFilledInactive: Color { Self.BackgroundButtonColorGhostFilledInactive }
    public var BackgroundButtonColorGhostFilledPressed: Color { Self.BackgroundButtonColorGhostFilledPressed }
    public var BackgroundButtonColorTransparent05Active: Color { Self.BackgroundButtonColorTransparent05Active }
    public var BackgroundButtonColorTransparent05Default: Color { Self.BackgroundButtonColorTransparent05Default }
    public var BackgroundButtonColorTransparent05Inactive: Color { Self.BackgroundButtonColorTransparent05Inactive }
    public var BackgroundButtonColorTransparent05Pressed: Color { Self.BackgroundButtonColorTransparent05Pressed }
    public var BackgroundButtonColorTransparent10Active: Color { Self.BackgroundButtonColorTransparent10Active }
    public var BackgroundButtonColorTransparent10Default: Color { Self.BackgroundButtonColorTransparent10Default }
    public var BackgroundButtonColorTransparent10Inactive: Color { Self.BackgroundButtonColorTransparent10Inactive }
    public var BackgroundButtonColorTransparent10Pressed: Color { Self.BackgroundButtonColorTransparent10Pressed }
    public var BackgroundButtonColorWhiteFilledDefault: Color { Self.BackgroundButtonColorWhiteFilledDefault }
    public var BackgroundButtonColorWhiteFilledInactive: Color { Self.BackgroundButtonColorWhiteFilledInactive }
    public var BackgroundContainerColorBrand: Color { Self.BackgroundContainerColorBrand }
    public var BackgroundContainerColorBrandAccent: Color { Self.BackgroundContainerColorBrandAccent }
    public var BackgroundContainerColorGreige: Color { Self.BackgroundContainerColorGreige }
    public var BackgroundContainerColorInverse: Color { Self.BackgroundContainerColorInverse }
    public var BackgroundContainerColorTransparent05: Color { Self.BackgroundContainerColorTransparent05 }
    public var BackgroundContainerColorTransparent10: Color { Self.BackgroundContainerColorTransparent10 }
    public var BackgroundContainerColorTransparent20: Color { Self.BackgroundContainerColorTransparent20 }
    public var BackgroundContainerColorWhite: Color { Self.BackgroundContainerColorWhite }
    public var BackgroundContainerPrimary: Color { Self.BackgroundContainerPrimary }
    public var BackgroundContainerSecondary: Color { Self.BackgroundContainerSecondary }
    public var BackgroundFeedbackColorErrorAccent1: Color { Self.BackgroundFeedbackColorErrorAccent1 }
    public var BackgroundFeedbackColorErrorAccent2: Color { Self.BackgroundFeedbackColorErrorAccent2 }
    public var BackgroundFeedbackColorInformationalAccent1: Color { Self.BackgroundFeedbackColorInformationalAccent1 }
    public var BackgroundFeedbackColorInformationalAccent2: Color { Self.BackgroundFeedbackColorInformationalAccent2 }
    public var BackgroundFeedbackColorSuccessAccent1: Color { Self.BackgroundFeedbackColorSuccessAccent1 }
    public var BackgroundFeedbackColorSuccessAccent2: Color { Self.BackgroundFeedbackColorSuccessAccent2 }
    public var BackgroundFeedbackColorWarningAccent1: Color { Self.BackgroundFeedbackColorWarningAccent1 }
    public var BackgroundFeedbackColorWarningAccent2: Color { Self.BackgroundFeedbackColorWarningAccent2 }
    public var BackgroundInputColorBrandFilledDefault: Color { Self.BackgroundInputColorBrandFilledDefault }
    public var BackgroundInputColorTransparent10Default: Color { Self.BackgroundInputColorTransparent10Default }
    public var BackgroundInputColorWhiteOutlinedDefault: Color { Self.BackgroundInputColorWhiteOutlinedDefault }
    public var BackgroundInputColorWhiteOutlinedInactive: Color { Self.BackgroundInputColorWhiteOutlinedInactive }
    public var BackgroundInputColorWhiteOutlinedPressed: Color { Self.BackgroundInputColorWhiteOutlinedPressed }
    public var BackgroundOverlayColorPageScrim: Color { Self.BackgroundOverlayColorPageScrim }
    public var BackgroundSelectorColorFilledDefault: Color { Self.BackgroundSelectorColorFilledDefault }
    public var BackgroundSelectorColorFilledInactive: Color { Self.BackgroundSelectorColorFilledInactive }
    public var BackgroundSelectorColorFilledPressed: Color { Self.BackgroundSelectorColorFilledPressed }
    public var BackgroundSelectorColorFilledSelected: Color { Self.BackgroundSelectorColorFilledSelected }
    public var BackgroundSelectorColorFilledSwitchHandleDefault: Color { Self.BackgroundSelectorColorFilledSwitchHandleDefault }
    public var BackgroundSelectorColorFilledSwitchHandleSelected: Color { Self.BackgroundSelectorColorFilledSwitchHandleSelected }
    public var BackgroundSelectorColorFilledTransparent: Color { Self.BackgroundSelectorColorFilledTransparent }
    public var BackgroundSelectorColorOutlineDefault: Color { Self.BackgroundSelectorColorOutlineDefault }
    public var BackgroundSelectorColorOutlineInactive: Color { Self.BackgroundSelectorColorOutlineInactive }
    public var BackgroundSelectorColorOutlinePressed: Color { Self.BackgroundSelectorColorOutlinePressed }
    public var BackgroundSelectorColorOutlineSelected: Color { Self.BackgroundSelectorColorOutlineSelected }
    public var BackgroundSelectorColorOutlineSelectedAccent: Color { Self.BackgroundSelectorColorOutlineSelectedAccent }
    public var BackgroundSurfaceColorGreige: Color { Self.BackgroundSurfaceColorGreige }
    public var BackgroundSurfaceColorInverse: Color { Self.BackgroundSurfaceColorInverse }
    public var BackgroundSurfaceColorSecondary: Color { Self.BackgroundSurfaceColorSecondary }
    public var BackgroundSurfaceColorTertiary: Color { Self.BackgroundSurfaceColorTertiary }
    public var Border0: CGFloat { Self.Border0 }
    public var Border1: CGFloat { Self.Border1 }
    public var Border10: CGFloat { Self.Border10 }
    public var Border11: CGFloat { Self.Border11 }
    public var Border12: CGFloat { Self.Border12 }
    public var Border2: CGFloat { Self.Border2 }
    public var Border3: CGFloat { Self.Border3 }
    public var Border4: CGFloat { Self.Border4 }
    public var Border5: CGFloat { Self.Border5 }
    public var Border6: CGFloat { Self.Border6 }
    public var Border7: CGFloat { Self.Border7 }
    public var Border8: CGFloat { Self.Border8 }
    public var Border9: CGFloat { Self.Border9 }
    public var BorderButtonColorAccent: Color { Self.BorderButtonColorAccent }
    public var BorderButtonColorAccent2: Color { Self.BorderButtonColorAccent2 }
    public var BorderButtonColorDefault: Color { Self.BorderButtonColorDefault }
    public var BorderButtonColorFocus: Color { Self.BorderButtonColorFocus }
    public var BorderButtonColorInactive: Color { Self.BorderButtonColorInactive }
    public var BorderButtonColorOrangeOutlineDefault: Color { Self.BorderButtonColorOrangeOutlineDefault }
    public var BorderButtonColorOrangeOutlineInactive: Color { Self.BorderButtonColorOrangeOutlineInactive }
    public var BorderButtonColorPressed: Color { Self.BorderButtonColorPressed }
    public var BorderColorFocus: Color { Self.BorderColorFocus }
    public var BorderColorPrimary: Color { Self.BorderColorPrimary }
    public var BorderInputColorAccent: Color { Self.BorderInputColorAccent }
    public var BorderInputColorAccent2: Color { Self.BorderInputColorAccent2 }
    public var BorderInputColorActive: Color { Self.BorderInputColorActive }
    public var BorderInputColorDefault: Color { Self.BorderInputColorDefault }
    public var BorderInputColorError: Color { Self.BorderInputColorError }
    public var BorderInputColorFocus: Color { Self.BorderInputColorFocus }
    public var BorderInputColorInactive: Color { Self.BorderInputColorInactive }
    public var BorderInputColorPressed: Color { Self.BorderInputColorPressed }
    public var BorderInputColorSuccess: Color { Self.BorderInputColorSuccess }
    public var BorderInputColorWarning: Color { Self.BorderInputColorWarning }
    public var BorderOnContainerActive: Color { Self.BorderOnContainerActive }
    public var BorderOnContainerDefault: Color { Self.BorderOnContainerDefault }
    public var BorderOnContainerInactive: Color { Self.BorderOnContainerInactive }
    public var BorderOnContainerInverse: Color { Self.BorderOnContainerInverse }
    public var BorderOnContainerPressed: Color { Self.BorderOnContainerPressed }
    public var BorderRadius2xl: CGFloat { Self.BorderRadius2xl }
    public var BorderRadius3xl: CGFloat { Self.BorderRadius3xl }
    public var BorderRadiusFull: CGFloat { Self.BorderRadiusFull }
    public var BorderRadiusLg: CGFloat { Self.BorderRadiusLg }
    public var BorderRadiusMd: CGFloat { Self.BorderRadiusMd }
    public var BorderRadiusNone: CGFloat { Self.BorderRadiusNone }
    public var BorderRadiusSm: CGFloat { Self.BorderRadiusSm }
    public var BorderRadiusXl: CGFloat { Self.BorderRadiusXl }
    public var BorderRadiusXs: CGFloat { Self.BorderRadiusXs }
    public var BorderSelectorColorFilledDefault: Color { Self.BorderSelectorColorFilledDefault }
    public var BorderSelectorColorFilledInactive: Color { Self.BorderSelectorColorFilledInactive }
    public var BorderSelectorColorFilledPressed: Color { Self.BorderSelectorColorFilledPressed }
    public var BorderSelectorColorFilledSelected: Color { Self.BorderSelectorColorFilledSelected }
    public var BorderSelectorColorOutlineDefault: Color { Self.BorderSelectorColorOutlineDefault }
    public var BorderSelectorColorOutlineInactive: Color { Self.BorderSelectorColorOutlineInactive }
    public var BorderSelectorColorOutlinePressed: Color { Self.BorderSelectorColorOutlinePressed }
    public var BorderSelectorColorOutlineSelected: Color { Self.BorderSelectorColorOutlineSelected }
    public var BorderSelectorColorOutlineSelectedAccent: Color { Self.BorderSelectorColorOutlineSelectedAccent }
    public var BorderWidth2xl: CGFloat { Self.BorderWidth2xl }
    public var BorderWidthLg: CGFloat { Self.BorderWidthLg }
    public var BorderWidthMd: CGFloat { Self.BorderWidthMd }
    public var BorderWidthNone: CGFloat { Self.BorderWidthNone }
    public var BorderWidthSm: CGFloat { Self.BorderWidthSm }
    public var BorderWidthXl: CGFloat { Self.BorderWidthXl }
    public var BorderWidthXs: CGFloat { Self.BorderWidthXs }
    public var Brand025: Color { Self.Brand025 }
    public var Brand050: Color { Self.Brand050 }
    public var Brand100: Color { Self.Brand100 }
    public var Brand200: Color { Self.Brand200 }
    public var Brand300: Color { Self.Brand300 }
    public var Brand400: Color { Self.Brand400 }
    public var Brand500: Color { Self.Brand500 }
    public var Brand600: Color { Self.Brand600 }
    public var Brand700: Color { Self.Brand700 }
    public var Brand800: Color { Self.Brand800 }
    public var Brand900: Color { Self.Brand900 }
    public var Brand950: Color { Self.Brand950 }
    public var Cinnabar025: Color { Self.Cinnabar025 }
    public var Cinnabar050: Color { Self.Cinnabar050 }
    public var Cinnabar100: Color { Self.Cinnabar100 }
    public var Cinnabar200: Color { Self.Cinnabar200 }
    public var Cinnabar300: Color { Self.Cinnabar300 }
    public var Cinnabar400: Color { Self.Cinnabar400 }
    public var Cinnabar500: Color { Self.Cinnabar500 }
    public var Cinnabar600: Color { Self.Cinnabar600 }
    public var Cinnabar700: Color { Self.Cinnabar700 }
    public var Cinnabar800: Color { Self.Cinnabar800 }
    public var Cinnabar900: Color { Self.Cinnabar900 }
    public var Cinnabar950: Color { Self.Cinnabar950 }
    public var Greige025: Color { Self.Greige025 }
    public var Greige050: Color { Self.Greige050 }
    public var Greige100: Color { Self.Greige100 }
    public var Greige200: Color { Self.Greige200 }
    public var Greige300: Color { Self.Greige300 }
    public var Greige400: Color { Self.Greige400 }
    public var Greige500: Color { Self.Greige500 }
    public var Greige600: Color { Self.Greige600 }
    public var Greige700: Color { Self.Greige700 }
    public var Greige800: Color { Self.Greige800 }
    public var Greige900: Color { Self.Greige900 }
    public var Greige950: Color { Self.Greige950 }
    public var Lemon025: Color { Self.Lemon025 }
    public var Lemon050: Color { Self.Lemon050 }
    public var Lemon100: Color { Self.Lemon100 }
    public var Lemon200: Color { Self.Lemon200 }
    public var Lemon300: Color { Self.Lemon300 }
    public var Lemon400: Color { Self.Lemon400 }
    public var Lemon500: Color { Self.Lemon500 }
    public var Lemon600: Color { Self.Lemon600 }
    public var Lemon700: Color { Self.Lemon700 }
    public var Lemon800: Color { Self.Lemon800 }
    public var Lemon900: Color { Self.Lemon900 }
    public var Lemon950: Color { Self.Lemon950 }
    public var Moonlight025: Color { Self.Moonlight025 }
    public var Moonlight050: Color { Self.Moonlight050 }
    public var Moonlight100: Color { Self.Moonlight100 }
    public var Moonlight200: Color { Self.Moonlight200 }
    public var Moonlight300: Color { Self.Moonlight300 }
    public var Moonlight400: Color { Self.Moonlight400 }
    public var Moonlight500: Color { Self.Moonlight500 }
    public var Moonlight600: Color { Self.Moonlight600 }
    public var Moonlight700: Color { Self.Moonlight700 }
    public var Moonlight800: Color { Self.Moonlight800 }
    public var Moonlight900: Color { Self.Moonlight900 }
    public var Moonlight950: Color { Self.Moonlight950 }
    public var NeutralsBlack: Color { Self.NeutralsBlack }
    public var NeutralsTransparent: Color { Self.NeutralsTransparent }
    public var NeutralsWhite: Color { Self.NeutralsWhite }
    public var OverlayPressedDarken: Color { Self.OverlayPressedDarken }
    public var OverlayPressedDarkenMore: Color { Self.OverlayPressedDarkenMore }
    public var OverlayPressedLighten: Color { Self.OverlayPressedLighten }
    public var OverlayPressedLightenMore: Color { Self.OverlayPressedLightenMore }
    public var TextButtonColorGhostFilledDefault: Color { Self.TextButtonColorGhostFilledDefault }
    public var TextButtonColorGhostFilledInactive: Color { Self.TextButtonColorGhostFilledInactive }
    public var TextButtonColorGradientFilledDefault: Color { Self.TextButtonColorGradientFilledDefault }
    public var TextButtonColorGradientFilledInactive: Color { Self.TextButtonColorGradientFilledInactive }
    public var TextButtonColorOrangeFilledDefault: Color { Self.TextButtonColorOrangeFilledDefault }
    public var TextButtonColorOrangeFilledInactive: Color { Self.TextButtonColorOrangeFilledInactive }
    public var TextButtonColorOrangeOutlineDefault: Color { Self.TextButtonColorOrangeOutlineDefault }
    public var TextButtonColorOrangeOutlineInactive: Color { Self.TextButtonColorOrangeOutlineInactive }
    public var TextButtonColorTransparent05FilledDefault: Color { Self.TextButtonColorTransparent05FilledDefault }
    public var TextButtonColorTransparent05FilledInactive: Color { Self.TextButtonColorTransparent05FilledInactive }
    public var TextButtonColorTransparent10FilledDefault: Color { Self.TextButtonColorTransparent10FilledDefault }
    public var TextButtonColorTransparent10FilledInactive: Color { Self.TextButtonColorTransparent10FilledInactive }
    public var TextButtonColorWhiteFilledDefault: Color { Self.TextButtonColorWhiteFilledDefault }
    public var TextButtonColorWhiteFilledInactive: Color { Self.TextButtonColorWhiteFilledInactive }
    public var TextInputColorBrandFilledDefault: Color { Self.TextInputColorBrandFilledDefault }
    public var TextInputColorTransparent10Active: Color { Self.TextInputColorTransparent10Active }
    public var TextInputColorTransparent10Default: Color { Self.TextInputColorTransparent10Default }
    public var TextInputColorTransparent10Inactive: Color { Self.TextInputColorTransparent10Inactive }
    public var TextInputColorWhiteOutlinedDefault: Color { Self.TextInputColorWhiteOutlinedDefault }
    public var TextOn: Color { Self.TextOn }
    public var TextOnBrandColorPrimary: Color { Self.TextOnBrandColorPrimary }
    public var TextOnContainerColorAccent: Color { Self.TextOnContainerColorAccent }
    public var TextOnContainerColorAccent2: Color { Self.TextOnContainerColorAccent2 }
    public var TextOnContainerColorError: Color { Self.TextOnContainerColorError }
    public var TextOnContainerColorInactive: Color { Self.TextOnContainerColorInactive }
    public var TextOnContainerColorInformational: Color { Self.TextOnContainerColorInformational }
    public var TextOnContainerColorInverse: Color { Self.TextOnContainerColorInverse }
    public var TextOnContainerColorPrimary: Color { Self.TextOnContainerColorPrimary }
    public var TextOnContainerColorQuatrenary: Color { Self.TextOnContainerColorQuatrenary }
    public var TextOnContainerColorSecondary: Color { Self.TextOnContainerColorSecondary }
    public var TextOnContainerColorSuccess: Color { Self.TextOnContainerColorSuccess }
    public var TextOnContainerColorTertiary: Color { Self.TextOnContainerColorTertiary }
    public var TextOnContainerColorWarning: Color { Self.TextOnContainerColorWarning }
    public var TextOnErrorColorPrimary: Color { Self.TextOnErrorColorPrimary }
    public var TextOnPrimaryColorPrimary: Color { Self.TextOnPrimaryColorPrimary }
    public var TextOnPrimaryColorSecondary: Color { Self.TextOnPrimaryColorSecondary }
    public var TextOnSuccessColorPrimary: Color { Self.TextOnSuccessColorPrimary }
    public var TextOnSurfaceColorAccent: Color { Self.TextOnSurfaceColorAccent }
    public var TextOnSurfaceColorAccent2: Color { Self.TextOnSurfaceColorAccent2 }
    public var TextOnSurfaceColorDestructive: Color { Self.TextOnSurfaceColorDestructive }
    public var TextOnSurfaceColorDisabled: Color { Self.TextOnSurfaceColorDisabled }
    public var TextOnSurfaceColorError: Color { Self.TextOnSurfaceColorError }
    public var TextOnSurfaceColorInactive: Color { Self.TextOnSurfaceColorInactive }
    public var TextOnSurfaceColorInformational: Color { Self.TextOnSurfaceColorInformational }
    public var TextOnSurfaceColorInverse: Color { Self.TextOnSurfaceColorInverse }
    public var TextOnSurfaceColorLink: Color { Self.TextOnSurfaceColorLink }
    public var TextOnSurfaceColorPlaceholder: Color { Self.TextOnSurfaceColorPlaceholder }
    public var TextOnSurfaceColorPrimary: Color { Self.TextOnSurfaceColorPrimary }
    public var TextOnSurfaceColorQuatrenary: Color { Self.TextOnSurfaceColorQuatrenary }
    public var TextOnSurfaceColorSecondary: Color { Self.TextOnSurfaceColorSecondary }
    public var TextOnSurfaceColorSuccess: Color { Self.TextOnSurfaceColorSuccess }
    public var TextOnSurfaceColorTertiary: Color { Self.TextOnSurfaceColorTertiary }
    public var TextOnSurfaceColorWarning: Color { Self.TextOnSurfaceColorWarning }
    public var TextSelectorColorActive: Color { Self.TextSelectorColorActive }
    public var TextSelectorColorDefault: Color { Self.TextSelectorColorDefault }
    public var TextSelectorColorFilledActive: Color { Self.TextSelectorColorFilledActive }
    public var TextSelectorColorFilledDefault: Color { Self.TextSelectorColorFilledDefault }
    public var TextSelectorColorFilledInactive: Color { Self.TextSelectorColorFilledInactive }
    public var TextSelectorColorFilledSelected: Color { Self.TextSelectorColorFilledSelected }
    public var TextSelectorColorInactive: Color { Self.TextSelectorColorInactive }
    public var TextSelectorColorOutlineActive: Color { Self.TextSelectorColorOutlineActive }
    public var TextSelectorColorOutlineDefault: Color { Self.TextSelectorColorOutlineDefault }
    public var TextSelectorColorOutlineInactive: Color { Self.TextSelectorColorOutlineInactive }
    public var TextSelectorColorOutlineSelected: Color { Self.TextSelectorColorOutlineSelected }
    public var TextSelectorColorSelected: Color { Self.TextSelectorColorSelected }
    public var TextureNotebookAlt: Color { Self.TextureNotebookAlt }
    public var TransparentBlackTransparentBlack025: Color { Self.TransparentBlackTransparentBlack025 }
    public var TransparentBlackTransparentBlack050: Color { Self.TransparentBlackTransparentBlack050 }
    public var TransparentBlackTransparentBlack075: Color { Self.TransparentBlackTransparentBlack075 }
    public var TransparentBlackTransparentBlack100: Color { Self.TransparentBlackTransparentBlack100 }
    public var TransparentBlackTransparentBlack200: Color { Self.TransparentBlackTransparentBlack200 }
    public var TransparentBlackTransparentBlack300: Color { Self.TransparentBlackTransparentBlack300 }
    public var TransparentBlackTransparentBlack400: Color { Self.TransparentBlackTransparentBlack400 }
    public var TransparentBlackTransparentBlack500: Color { Self.TransparentBlackTransparentBlack500 }
    public var TransparentBlackTransparentBlack600: Color { Self.TransparentBlackTransparentBlack600 }
    public var TransparentBlackTransparentBlack700: Color { Self.TransparentBlackTransparentBlack700 }
    public var TransparentBlackTransparentBlack800: Color { Self.TransparentBlackTransparentBlack800 }
    public var TransparentBlackTransparentBlack900: Color { Self.TransparentBlackTransparentBlack900 }
    public var TransparentBlackTransparentBlack950: Color { Self.TransparentBlackTransparentBlack950 }
    public var TransparentWhiteTransparentWhite025: Color { Self.TransparentWhiteTransparentWhite025 }
    public var TransparentWhiteTransparentWhite050: Color { Self.TransparentWhiteTransparentWhite050 }
    public var TransparentWhiteTransparentWhite075: Color { Self.TransparentWhiteTransparentWhite075 }
    public var TransparentWhiteTransparentWhite100: Color { Self.TransparentWhiteTransparentWhite100 }
    public var TransparentWhiteTransparentWhite200: Color { Self.TransparentWhiteTransparentWhite200 }
    public var TransparentWhiteTransparentWhite300: Color { Self.TransparentWhiteTransparentWhite300 }
    public var TransparentWhiteTransparentWhite400: Color { Self.TransparentWhiteTransparentWhite400 }
    public var TransparentWhiteTransparentWhite500: Color { Self.TransparentWhiteTransparentWhite500 }
    public var TransparentWhiteTransparentWhite600: Color { Self.TransparentWhiteTransparentWhite600 }
    public var TransparentWhiteTransparentWhite700: Color { Self.TransparentWhiteTransparentWhite700 }
    public var TransparentWhiteTransparentWhite800: Color { Self.TransparentWhiteTransparentWhite800 }
    public var TransparentWhiteTransparentWhite900: Color { Self.TransparentWhiteTransparentWhite900 }
    public var TransparentWhiteTransparentWhite950: Color { Self.TransparentWhiteTransparentWhite950 }
}

// MARK: - Dark Theme Conformance

extension TokensSemanticDark: SemanticTokensProvider {
    public var BackgroundAccentColorBlue: Color { Self.BackgroundAccentColorBlue }
    public var BackgroundAccentColorBrand: Color { Self.BackgroundAccentColorBrand }
    public var BackgroundAccentColorBrown: Color { Self.BackgroundAccentColorBrown }
    public var BackgroundAccentColorDarkGreige: Color { Self.BackgroundAccentColorDarkGreige }
    public var BackgroundAccentColorGreen: Color { Self.BackgroundAccentColorGreen }
    public var BackgroundAccentColorGreige: Color { Self.BackgroundAccentColorGreige }
    public var BackgroundAccentColorRed: Color { Self.BackgroundAccentColorRed }
    public var BackgroundAccentColorYellow: Color { Self.BackgroundAccentColorYellow }
    public var BackgroundActionColorPrimary: Color { Self.BackgroundActionColorPrimary }
    public var BackgroundActionColorSecondary: Color { Self.BackgroundActionColorSecondary }
    public var BackgroundButtonColorBrandFilledDefault: Color { Self.BackgroundButtonColorBrandFilledDefault }
    public var BackgroundButtonColorBrandFilledInactive: Color { Self.BackgroundButtonColorBrandFilledInactive }
    public var BackgroundButtonColorBrandGradientFilledDefault: Color { Self.BackgroundButtonColorBrandGradientFilledDefault }
    public var BackgroundButtonColorBrandGradientFilledInactive: Color { Self.BackgroundButtonColorBrandGradientFilledInactive }
    public var BackgroundButtonColorGhostFilledDefault: Color { Self.BackgroundButtonColorGhostFilledDefault }
    public var BackgroundButtonColorGhostFilledInactive: Color { Self.BackgroundButtonColorGhostFilledInactive }
    public var BackgroundButtonColorGhostFilledPressed: Color { Self.BackgroundButtonColorGhostFilledPressed }
    public var BackgroundButtonColorTransparent05Active: Color { Self.BackgroundButtonColorTransparent05Active }
    public var BackgroundButtonColorTransparent05Default: Color { Self.BackgroundButtonColorTransparent05Default }
    public var BackgroundButtonColorTransparent05Inactive: Color { Self.BackgroundButtonColorTransparent05Inactive }
    public var BackgroundButtonColorTransparent05Pressed: Color { Self.BackgroundButtonColorTransparent05Pressed }
    public var BackgroundButtonColorTransparent10Active: Color { Self.BackgroundButtonColorTransparent10Active }
    public var BackgroundButtonColorTransparent10Default: Color { Self.BackgroundButtonColorTransparent10Default }
    public var BackgroundButtonColorTransparent10Inactive: Color { Self.BackgroundButtonColorTransparent10Inactive }
    public var BackgroundButtonColorTransparent10Pressed: Color { Self.BackgroundButtonColorTransparent10Pressed }
    public var BackgroundButtonColorWhiteFilledDefault: Color { Self.BackgroundButtonColorWhiteFilledDefault }
    public var BackgroundButtonColorWhiteFilledInactive: Color { Self.BackgroundButtonColorWhiteFilledInactive }
    public var BackgroundContainerColorBrand: Color { Self.BackgroundContainerColorBrand }
    public var BackgroundContainerColorBrandAccent: Color { Self.BackgroundContainerColorBrandAccent }
    public var BackgroundContainerColorGreige: Color { Self.BackgroundContainerColorGreige }
    public var BackgroundContainerColorInverse: Color { Self.BackgroundContainerColorInverse }
    public var BackgroundContainerColorTransparent05: Color { Self.BackgroundContainerColorTransparent05 }
    public var BackgroundContainerColorTransparent10: Color { Self.BackgroundContainerColorTransparent10 }
    public var BackgroundContainerColorTransparent20: Color { Self.BackgroundContainerColorTransparent20 }
    public var BackgroundContainerColorWhite: Color { Self.BackgroundContainerColorWhite }
    public var BackgroundContainerPrimary: Color { Self.BackgroundContainerPrimary }
    public var BackgroundContainerSecondary: Color { Self.BackgroundContainerSecondary }
    public var BackgroundFeedbackColorErrorAccent1: Color { Self.BackgroundFeedbackColorErrorAccent1 }
    public var BackgroundFeedbackColorErrorAccent2: Color { Self.BackgroundFeedbackColorErrorAccent2 }
    public var BackgroundFeedbackColorInformationalAccent1: Color { Self.BackgroundFeedbackColorInformationalAccent1 }
    public var BackgroundFeedbackColorInformationalAccent2: Color { Self.BackgroundFeedbackColorInformationalAccent2 }
    public var BackgroundFeedbackColorSuccessAccent1: Color { Self.BackgroundFeedbackColorSuccessAccent1 }
    public var BackgroundFeedbackColorSuccessAccent2: Color { Self.BackgroundFeedbackColorSuccessAccent2 }
    public var BackgroundFeedbackColorWarningAccent1: Color { Self.BackgroundFeedbackColorWarningAccent1 }
    public var BackgroundFeedbackColorWarningAccent2: Color { Self.BackgroundFeedbackColorWarningAccent2 }
    public var BackgroundInputColorBrandFilledDefault: Color { Self.BackgroundInputColorBrandFilledDefault }
    public var BackgroundInputColorTransparent10Default: Color { Self.BackgroundInputColorTransparent10Default }
    public var BackgroundInputColorWhiteOutlinedDefault: Color { Self.BackgroundInputColorWhiteOutlinedDefault }
    public var BackgroundInputColorWhiteOutlinedInactive: Color { Self.BackgroundInputColorWhiteOutlinedInactive }
    public var BackgroundInputColorWhiteOutlinedPressed: Color { Self.BackgroundInputColorWhiteOutlinedPressed }
    public var BackgroundOverlayColorPageScrim: Color { Self.BackgroundOverlayColorPageScrim }
    public var BackgroundSelectorColorFilledDefault: Color { Self.BackgroundSelectorColorFilledDefault }
    public var BackgroundSelectorColorFilledInactive: Color { Self.BackgroundSelectorColorFilledInactive }
    public var BackgroundSelectorColorFilledPressed: Color { Self.BackgroundSelectorColorFilledPressed }
    public var BackgroundSelectorColorFilledSelected: Color { Self.BackgroundSelectorColorFilledSelected }
    public var BackgroundSelectorColorFilledSwitchHandleDefault: Color { Self.BackgroundSelectorColorFilledSwitchHandleDefault }
    public var BackgroundSelectorColorFilledSwitchHandleSelected: Color { Self.BackgroundSelectorColorFilledSwitchHandleSelected }
    public var BackgroundSelectorColorFilledTransparent: Color { Self.BackgroundSelectorColorFilledTransparent }
    public var BackgroundSelectorColorOutlineDefault: Color { Self.BackgroundSelectorColorOutlineDefault }
    public var BackgroundSelectorColorOutlineInactive: Color { Self.BackgroundSelectorColorOutlineInactive }
    public var BackgroundSelectorColorOutlinePressed: Color { Self.BackgroundSelectorColorOutlinePressed }
    public var BackgroundSelectorColorOutlineSelected: Color { Self.BackgroundSelectorColorOutlineSelected }
    public var BackgroundSelectorColorOutlineSelectedAccent: Color { Self.BackgroundSelectorColorOutlineSelectedAccent }
    public var BackgroundSurfaceColorGreige: Color { Self.BackgroundSurfaceColorGreige }
    public var BackgroundSurfaceColorInverse: Color { Self.BackgroundSurfaceColorInverse }
    public var BackgroundSurfaceColorSecondary: Color { Self.BackgroundSurfaceColorSecondary }
    public var BackgroundSurfaceColorTertiary: Color { Self.BackgroundSurfaceColorTertiary }
    public var Border0: CGFloat { Self.Border0 }
    public var Border1: CGFloat { Self.Border1 }
    public var Border10: CGFloat { Self.Border10 }
    public var Border11: CGFloat { Self.Border11 }
    public var Border12: CGFloat { Self.Border12 }
    public var Border2: CGFloat { Self.Border2 }
    public var Border3: CGFloat { Self.Border3 }
    public var Border4: CGFloat { Self.Border4 }
    public var Border5: CGFloat { Self.Border5 }
    public var Border6: CGFloat { Self.Border6 }
    public var Border7: CGFloat { Self.Border7 }
    public var Border8: CGFloat { Self.Border8 }
    public var Border9: CGFloat { Self.Border9 }
    public var BorderButtonColorAccent: Color { Self.BorderButtonColorAccent }
    public var BorderButtonColorAccent2: Color { Self.BorderButtonColorAccent2 }
    public var BorderButtonColorDefault: Color { Self.BorderButtonColorDefault }
    public var BorderButtonColorFocus: Color { Self.BorderButtonColorFocus }
    public var BorderButtonColorInactive: Color { Self.BorderButtonColorInactive }
    public var BorderButtonColorOrangeOutlineDefault: Color { Self.BorderButtonColorOrangeOutlineDefault }
    public var BorderButtonColorOrangeOutlineInactive: Color { Self.BorderButtonColorOrangeOutlineInactive }
    public var BorderButtonColorPressed: Color { Self.BorderButtonColorPressed }
    public var BorderColorFocus: Color { Self.BorderColorFocus }
    public var BorderColorPrimary: Color { Self.BorderColorPrimary }
    public var BorderInputColorAccent: Color { Self.BorderInputColorAccent }
    public var BorderInputColorAccent2: Color { Self.BorderInputColorAccent2 }
    public var BorderInputColorActive: Color { Self.BorderInputColorActive }
    public var BorderInputColorDefault: Color { Self.BorderInputColorDefault }
    public var BorderInputColorError: Color { Self.BorderInputColorError }
    public var BorderInputColorFocus: Color { Self.BorderInputColorFocus }
    public var BorderInputColorInactive: Color { Self.BorderInputColorInactive }
    public var BorderInputColorPressed: Color { Self.BorderInputColorPressed }
    public var BorderInputColorSuccess: Color { Self.BorderInputColorSuccess }
    public var BorderInputColorWarning: Color { Self.BorderInputColorWarning }
    public var BorderOnContainerActive: Color { Self.BorderOnContainerActive }
    public var BorderOnContainerDefault: Color { Self.BorderOnContainerDefault }
    public var BorderOnContainerInactive: Color { Self.BorderOnContainerInactive }
    public var BorderOnContainerInverse: Color { Self.BorderOnContainerInverse }
    public var BorderOnContainerPressed: Color { Self.BorderOnContainerPressed }
    public var BorderRadius2xl: CGFloat { Self.BorderRadius2xl }
    public var BorderRadius3xl: CGFloat { Self.BorderRadius3xl }
    public var BorderRadiusFull: CGFloat { Self.BorderRadiusFull }
    public var BorderRadiusLg: CGFloat { Self.BorderRadiusLg }
    public var BorderRadiusMd: CGFloat { Self.BorderRadiusMd }
    public var BorderRadiusNone: CGFloat { Self.BorderRadiusNone }
    public var BorderRadiusSm: CGFloat { Self.BorderRadiusSm }
    public var BorderRadiusXl: CGFloat { Self.BorderRadiusXl }
    public var BorderRadiusXs: CGFloat { Self.BorderRadiusXs }
    public var BorderSelectorColorFilledDefault: Color { Self.BorderSelectorColorFilledDefault }
    public var BorderSelectorColorFilledInactive: Color { Self.BorderSelectorColorFilledInactive }
    public var BorderSelectorColorFilledPressed: Color { Self.BorderSelectorColorFilledPressed }
    public var BorderSelectorColorFilledSelected: Color { Self.BorderSelectorColorFilledSelected }
    public var BorderSelectorColorOutlineDefault: Color { Self.BorderSelectorColorOutlineDefault }
    public var BorderSelectorColorOutlineInactive: Color { Self.BorderSelectorColorOutlineInactive }
    public var BorderSelectorColorOutlinePressed: Color { Self.BorderSelectorColorOutlinePressed }
    public var BorderSelectorColorOutlineSelected: Color { Self.BorderSelectorColorOutlineSelected }
    public var BorderSelectorColorOutlineSelectedAccent: Color { Self.BorderSelectorColorOutlineSelectedAccent }
    public var BorderWidth2xl: CGFloat { Self.BorderWidth2xl }
    public var BorderWidthLg: CGFloat { Self.BorderWidthLg }
    public var BorderWidthMd: CGFloat { Self.BorderWidthMd }
    public var BorderWidthNone: CGFloat { Self.BorderWidthNone }
    public var BorderWidthSm: CGFloat { Self.BorderWidthSm }
    public var BorderWidthXl: CGFloat { Self.BorderWidthXl }
    public var BorderWidthXs: CGFloat { Self.BorderWidthXs }
    public var Brand025: Color { Self.Brand025 }
    public var Brand050: Color { Self.Brand050 }
    public var Brand100: Color { Self.Brand100 }
    public var Brand200: Color { Self.Brand200 }
    public var Brand300: Color { Self.Brand300 }
    public var Brand400: Color { Self.Brand400 }
    public var Brand500: Color { Self.Brand500 }
    public var Brand600: Color { Self.Brand600 }
    public var Brand700: Color { Self.Brand700 }
    public var Brand800: Color { Self.Brand800 }
    public var Brand900: Color { Self.Brand900 }
    public var Brand950: Color { Self.Brand950 }
    public var Cinnabar025: Color { Self.Cinnabar025 }
    public var Cinnabar050: Color { Self.Cinnabar050 }
    public var Cinnabar100: Color { Self.Cinnabar100 }
    public var Cinnabar200: Color { Self.Cinnabar200 }
    public var Cinnabar300: Color { Self.Cinnabar300 }
    public var Cinnabar400: Color { Self.Cinnabar400 }
    public var Cinnabar500: Color { Self.Cinnabar500 }
    public var Cinnabar600: Color { Self.Cinnabar600 }
    public var Cinnabar700: Color { Self.Cinnabar700 }
    public var Cinnabar800: Color { Self.Cinnabar800 }
    public var Cinnabar900: Color { Self.Cinnabar900 }
    public var Cinnabar950: Color { Self.Cinnabar950 }
    public var Greige025: Color { Self.Greige025 }
    public var Greige050: Color { Self.Greige050 }
    public var Greige100: Color { Self.Greige100 }
    public var Greige200: Color { Self.Greige200 }
    public var Greige300: Color { Self.Greige300 }
    public var Greige400: Color { Self.Greige400 }
    public var Greige500: Color { Self.Greige500 }
    public var Greige600: Color { Self.Greige600 }
    public var Greige700: Color { Self.Greige700 }
    public var Greige800: Color { Self.Greige800 }
    public var Greige900: Color { Self.Greige900 }
    public var Greige950: Color { Self.Greige950 }
    public var Lemon025: Color { Self.Lemon025 }
    public var Lemon050: Color { Self.Lemon050 }
    public var Lemon100: Color { Self.Lemon100 }
    public var Lemon200: Color { Self.Lemon200 }
    public var Lemon300: Color { Self.Lemon300 }
    public var Lemon400: Color { Self.Lemon400 }
    public var Lemon500: Color { Self.Lemon500 }
    public var Lemon600: Color { Self.Lemon600 }
    public var Lemon700: Color { Self.Lemon700 }
    public var Lemon800: Color { Self.Lemon800 }
    public var Lemon900: Color { Self.Lemon900 }
    public var Lemon950: Color { Self.Lemon950 }
    public var Moonlight025: Color { Self.Moonlight025 }
    public var Moonlight050: Color { Self.Moonlight050 }
    public var Moonlight100: Color { Self.Moonlight100 }
    public var Moonlight200: Color { Self.Moonlight200 }
    public var Moonlight300: Color { Self.Moonlight300 }
    public var Moonlight400: Color { Self.Moonlight400 }
    public var Moonlight500: Color { Self.Moonlight500 }
    public var Moonlight600: Color { Self.Moonlight600 }
    public var Moonlight700: Color { Self.Moonlight700 }
    public var Moonlight800: Color { Self.Moonlight800 }
    public var Moonlight900: Color { Self.Moonlight900 }
    public var Moonlight950: Color { Self.Moonlight950 }
    public var NeutralsBlack: Color { Self.NeutralsBlack }
    public var NeutralsTransparent: Color { Self.NeutralsTransparent }
    public var NeutralsWhite: Color { Self.NeutralsWhite }
    public var OverlayPressedDarken: Color { Self.OverlayPressedDarken }
    public var OverlayPressedDarkenMore: Color { Self.OverlayPressedDarkenMore }
    public var OverlayPressedLighten: Color { Self.OverlayPressedLighten }
    public var OverlayPressedLightenMore: Color { Self.OverlayPressedLightenMore }
    public var TextButtonColorGhostFilledDefault: Color { Self.TextButtonColorGhostFilledDefault }
    public var TextButtonColorGhostFilledInactive: Color { Self.TextButtonColorGhostFilledInactive }
    public var TextButtonColorGradientFilledDefault: Color { Self.TextButtonColorGradientFilledDefault }
    public var TextButtonColorGradientFilledInactive: Color { Self.TextButtonColorGradientFilledInactive }
    public var TextButtonColorOrangeFilledDefault: Color { Self.TextButtonColorOrangeFilledDefault }
    public var TextButtonColorOrangeFilledInactive: Color { Self.TextButtonColorOrangeFilledInactive }
    public var TextButtonColorOrangeOutlineDefault: Color { Self.TextButtonColorOrangeOutlineDefault }
    public var TextButtonColorOrangeOutlineInactive: Color { Self.TextButtonColorOrangeOutlineInactive }
    public var TextButtonColorTransparent05FilledDefault: Color { Self.TextButtonColorTransparent05FilledDefault }
    public var TextButtonColorTransparent05FilledInactive: Color { Self.TextButtonColorTransparent05FilledInactive }
    public var TextButtonColorTransparent10FilledDefault: Color { Self.TextButtonColorTransparent10FilledDefault }
    public var TextButtonColorTransparent10FilledInactive: Color { Self.TextButtonColorTransparent10FilledInactive }
    public var TextButtonColorWhiteFilledDefault: Color { Self.TextButtonColorWhiteFilledDefault }
    public var TextButtonColorWhiteFilledInactive: Color { Self.TextButtonColorWhiteFilledInactive }
    public var TextInputColorBrandFilledDefault: Color { Self.TextInputColorBrandFilledDefault }
    public var TextInputColorTransparent10Active: Color { Self.TextInputColorTransparent10Active }
    public var TextInputColorTransparent10Default: Color { Self.TextInputColorTransparent10Default }
    public var TextInputColorTransparent10Inactive: Color { Self.TextInputColorTransparent10Inactive }
    public var TextInputColorWhiteOutlinedDefault: Color { Self.TextInputColorWhiteOutlinedDefault }
    public var TextOn: Color { Self.TextOn }
    public var TextOnBrandColorPrimary: Color { Self.TextOnBrandColorPrimary }
    public var TextOnContainerColorAccent: Color { Self.TextOnContainerColorAccent }
    public var TextOnContainerColorAccent2: Color { Self.TextOnContainerColorAccent2 }
    public var TextOnContainerColorError: Color { Self.TextOnContainerColorError }
    public var TextOnContainerColorInactive: Color { Self.TextOnContainerColorInactive }
    public var TextOnContainerColorInformational: Color { Self.TextOnContainerColorInformational }
    public var TextOnContainerColorInverse: Color { Self.TextOnContainerColorInverse }
    public var TextOnContainerColorPrimary: Color { Self.TextOnContainerColorPrimary }
    public var TextOnContainerColorQuatrenary: Color { Self.TextOnContainerColorQuatrenary }
    public var TextOnContainerColorSecondary: Color { Self.TextOnContainerColorSecondary }
    public var TextOnContainerColorSuccess: Color { Self.TextOnContainerColorSuccess }
    public var TextOnContainerColorTertiary: Color { Self.TextOnContainerColorTertiary }
    public var TextOnContainerColorWarning: Color { Self.TextOnContainerColorWarning }
    public var TextOnErrorColorPrimary: Color { Self.TextOnErrorColorPrimary }
    public var TextOnPrimaryColorPrimary: Color { Self.TextOnPrimaryColorPrimary }
    public var TextOnPrimaryColorSecondary: Color { Self.TextOnPrimaryColorSecondary }
    public var TextOnSuccessColorPrimary: Color { Self.TextOnSuccessColorPrimary }
    public var TextOnSurfaceColorAccent: Color { Self.TextOnSurfaceColorAccent }
    public var TextOnSurfaceColorAccent2: Color { Self.TextOnSurfaceColorAccent2 }
    public var TextOnSurfaceColorDestructive: Color { Self.TextOnSurfaceColorDestructive }
    public var TextOnSurfaceColorDisabled: Color { Self.TextOnSurfaceColorDisabled }
    public var TextOnSurfaceColorError: Color { Self.TextOnSurfaceColorError }
    public var TextOnSurfaceColorInactive: Color { Self.TextOnSurfaceColorInactive }
    public var TextOnSurfaceColorInformational: Color { Self.TextOnSurfaceColorInformational }
    public var TextOnSurfaceColorInverse: Color { Self.TextOnSurfaceColorInverse }
    public var TextOnSurfaceColorLink: Color { Self.TextOnSurfaceColorLink }
    public var TextOnSurfaceColorPlaceholder: Color { Self.TextOnSurfaceColorPlaceholder }
    public var TextOnSurfaceColorPrimary: Color { Self.TextOnSurfaceColorPrimary }
    public var TextOnSurfaceColorQuatrenary: Color { Self.TextOnSurfaceColorQuatrenary }
    public var TextOnSurfaceColorSecondary: Color { Self.TextOnSurfaceColorSecondary }
    public var TextOnSurfaceColorSuccess: Color { Self.TextOnSurfaceColorSuccess }
    public var TextOnSurfaceColorTertiary: Color { Self.TextOnSurfaceColorTertiary }
    public var TextOnSurfaceColorWarning: Color { Self.TextOnSurfaceColorWarning }
    public var TextSelectorColorActive: Color { Self.TextSelectorColorActive }
    public var TextSelectorColorDefault: Color { Self.TextSelectorColorDefault }
    public var TextSelectorColorFilledActive: Color { Self.TextSelectorColorFilledActive }
    public var TextSelectorColorFilledDefault: Color { Self.TextSelectorColorFilledDefault }
    public var TextSelectorColorFilledInactive: Color { Self.TextSelectorColorFilledInactive }
    public var TextSelectorColorFilledSelected: Color { Self.TextSelectorColorFilledSelected }
    public var TextSelectorColorInactive: Color { Self.TextSelectorColorInactive }
    public var TextSelectorColorOutlineActive: Color { Self.TextSelectorColorOutlineActive }
    public var TextSelectorColorOutlineDefault: Color { Self.TextSelectorColorOutlineDefault }
    public var TextSelectorColorOutlineInactive: Color { Self.TextSelectorColorOutlineInactive }
    public var TextSelectorColorOutlineSelected: Color { Self.TextSelectorColorOutlineSelected }
    public var TextSelectorColorSelected: Color { Self.TextSelectorColorSelected }
    public var TextureNotebookAlt: Color { Self.TextureNotebookAlt }
    public var TransparentBlackTransparentBlack025: Color { Self.TransparentBlackTransparentBlack025 }
    public var TransparentBlackTransparentBlack050: Color { Self.TransparentBlackTransparentBlack050 }
    public var TransparentBlackTransparentBlack075: Color { Self.TransparentBlackTransparentBlack075 }
    public var TransparentBlackTransparentBlack100: Color { Self.TransparentBlackTransparentBlack100 }
    public var TransparentBlackTransparentBlack200: Color { Self.TransparentBlackTransparentBlack200 }
    public var TransparentBlackTransparentBlack300: Color { Self.TransparentBlackTransparentBlack300 }
    public var TransparentBlackTransparentBlack400: Color { Self.TransparentBlackTransparentBlack400 }
    public var TransparentBlackTransparentBlack500: Color { Self.TransparentBlackTransparentBlack500 }
    public var TransparentBlackTransparentBlack600: Color { Self.TransparentBlackTransparentBlack600 }
    public var TransparentBlackTransparentBlack700: Color { Self.TransparentBlackTransparentBlack700 }
    public var TransparentBlackTransparentBlack800: Color { Self.TransparentBlackTransparentBlack800 }
    public var TransparentBlackTransparentBlack900: Color { Self.TransparentBlackTransparentBlack900 }
    public var TransparentBlackTransparentBlack950: Color { Self.TransparentBlackTransparentBlack950 }
    public var TransparentWhiteTransparentWhite025: Color { Self.TransparentWhiteTransparentWhite025 }
    public var TransparentWhiteTransparentWhite050: Color { Self.TransparentWhiteTransparentWhite050 }
    public var TransparentWhiteTransparentWhite075: Color { Self.TransparentWhiteTransparentWhite075 }
    public var TransparentWhiteTransparentWhite100: Color { Self.TransparentWhiteTransparentWhite100 }
    public var TransparentWhiteTransparentWhite200: Color { Self.TransparentWhiteTransparentWhite200 }
    public var TransparentWhiteTransparentWhite300: Color { Self.TransparentWhiteTransparentWhite300 }
    public var TransparentWhiteTransparentWhite400: Color { Self.TransparentWhiteTransparentWhite400 }
    public var TransparentWhiteTransparentWhite500: Color { Self.TransparentWhiteTransparentWhite500 }
    public var TransparentWhiteTransparentWhite600: Color { Self.TransparentWhiteTransparentWhite600 }
    public var TransparentWhiteTransparentWhite700: Color { Self.TransparentWhiteTransparentWhite700 }
    public var TransparentWhiteTransparentWhite800: Color { Self.TransparentWhiteTransparentWhite800 }
    public var TransparentWhiteTransparentWhite900: Color { Self.TransparentWhiteTransparentWhite900 }
    public var TransparentWhiteTransparentWhite950: Color { Self.TransparentWhiteTransparentWhite950 }
}