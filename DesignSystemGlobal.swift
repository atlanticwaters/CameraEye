//
// DesignSystemGlobal.swift
// Design System Token Aggregator (Compatibility Layer)
//
// This file provides backward compatibility with the old DesignSystemGlobal API
// while using the new token system under the hood.
//
// For new code, prefer using DSColor for theme-aware colors:
//   DSColor.textOnSurfaceColorPrimary.resolve
//

import SwiftUI

/// Global design system namespace that aggregates all design tokens.
/// For theme-aware colors, use DSColor instead.
public struct DesignSystemGlobal {

    // MARK: - Spacing Tokens (from TokensCoreLight)
    public static let Spacing0 = TokensCoreLight.Spacing0
    public static let Spacing1 = TokensCoreLight.Spacing1
    public static let Spacing1px = TokensCoreLight.Spacing1px
    public static let Spacing2px = TokensCoreLight.Spacing2px
    public static let Spacing2 = TokensCoreLight.Spacing2
    public static let Spacing3 = TokensCoreLight.Spacing3
    public static let Spacing4 = TokensCoreLight.Spacing4
    public static let Spacing5 = TokensCoreLight.Spacing5
    public static let Spacing6 = TokensCoreLight.Spacing6
    public static let Spacing7 = TokensCoreLight.Spacing7
    public static let Spacing8 = TokensCoreLight.Spacing8
    public static let Spacing9 = TokensCoreLight.Spacing9
    public static let Spacing10 = TokensCoreLight.Spacing10
    public static let Spacing11 = TokensCoreLight.Spacing11
    public static let Spacing12 = TokensCoreLight.Spacing12
    public static let Spacing13 = TokensCoreLight.Spacing13
    public static let Spacing14 = TokensCoreLight.Spacing14
    public static let Spacing15 = TokensCoreLight.Spacing15
    public static let Spacing16 = TokensCoreLight.Spacing16
    public static let Spacing17 = TokensCoreLight.Spacing17
    public static let Spacing18 = TokensCoreLight.Spacing18
    public static let Spacing20 = TokensCoreLight.Spacing20

    // MARK: - Font Size Tokens (from TokensCoreLight)
    public static let FontSizeBodyXs = TokensCoreLight.FontSizeBodyXs
    public static let FontSizeBodySm = TokensCoreLight.FontSizeBodySm
    public static let FontSizeBodyMd = TokensCoreLight.FontSizeBodyMd
    public static let FontSizeBodyLg = TokensCoreLight.FontSizeBodyLg
    public static let FontSizeBodyXl = TokensCoreLight.FontSizeBodyXl

    // MARK: - Font Family Tokens (from TokensCoreLight)
    public static let FontFamilyDisplay = TokensCoreLight.FontFamilyDisplay
    public static let FontFamilyInformational = TokensCoreLight.FontFamilyInformational

    // MARK: - Extended Font Sizes
    public static let FontSizeCaption = CGFloat(10)
    public static let FontSizeH6 = CGFloat(16)
    public static let FontSizeH5 = CGFloat(18)
    public static let FontSizeH4 = CGFloat(20)
    public static let FontSizeH3 = CGFloat(24)
    public static let FontSizeH2 = CGFloat(28)
    public static let FontSizeH1 = CGFloat(32)
    public static let FontSizeHero5 = CGFloat(36)
    public static let FontSizeHero4 = CGFloat(40)
    public static let FontSizeHero3 = CGFloat(48)
    public static let FontSizeHero2 = CGFloat(56)
    public static let FontSizeHero1 = CGFloat(64)

    // MARK: - Font Line Heights
    public static let FontLineHeightNone = CGFloat(1.0)
    public static let FontLineHeightTight = CGFloat(1.25)
    public static let FontLineHeightBase = CGFloat(1.5)

    // MARK: - Color Tokens - Background (using theme-aware resolution)
    public static var BackgroundSurfaceColorGreige: Color { DSColor.backgroundSurfaceColorGreige.resolve }
    public static var BackgroundSurfaceColorInverse: Color { DSColor.backgroundSurfaceColorInverse.resolve }
    public static var BackgroundContainerColorWhite: Color { DSColor.containerBackgroundWhite.resolve }
    public static var BackgroundContainerColorGreige: Color { DSColor.containerBackgroundGreige.resolve }
    public static var BackgroundContainerColorBrand: Color { DSColor.containerBackgroundBrand.resolve }
    public static var BackgroundContainerColorBrandAccent: Color { DSColor.containerBackgroundBrandAccent.resolve }
    public static var BackgroundContainerColorInverse: Color { DSColor.containerBackgroundInverse.resolve }
    public static var BackgroundContainerColorTransparent05: Color { DSColor.containerBackgroundTransparent05.resolve }
    public static var BackgroundContainerColorTransparent10: Color { DSColor.containerBackgroundTransparent10.resolve }
    public static var BackgroundContainerColorTransparent20: Color { DSColor.containerBackgroundTransparent20.resolve }

    // MARK: - Color Tokens - Button Backgrounds
    public static var BackgroundButtonColorBrandFilledDefault: Color { DSColor.buttonBackgroundBrandFilledDefault.resolve }
    public static var BackgroundButtonColorBrandFilledInactive: Color { DSColor.buttonBackgroundBrandFilledInactive.resolve }
    public static var BackgroundButtonColorWhiteFilledDefault: Color { DSColor.buttonBackgroundWhiteFilledDefault.resolve }
    public static var BackgroundButtonColorWhiteFilledInactive: Color { DSColor.buttonBackgroundWhiteFilledInactive.resolve }
    public static var BackgroundButtonColorGhostFilledDefault: Color { DSColor.buttonBackgroundGhostFilledDefault.resolve }
    public static var BackgroundButtonColorGhostFilledInactive: Color { DSColor.buttonBackgroundGhostFilledInactive.resolve }
    public static var BackgroundButtonColorGhostFilledPressed: Color { DSColor.buttonBackgroundGhostFilledPressed.resolve }
    public static var BackgroundButtonColorTransparent05Default: Color { DSColor.buttonBackgroundTransparent05Default.resolve }
    public static var BackgroundButtonColorTransparent10Default: Color { DSColor.buttonBackgroundTransparent10Default.resolve }

    // MARK: - Color Tokens - Feedback
    public static var BackgroundFeedbackColorSuccessAccent1: Color { DSColor.feedbackBackgroundSuccessAccent1.resolve }
    public static var BackgroundFeedbackColorSuccessAccent2: Color { DSColor.feedbackBackgroundSuccessAccent2.resolve }
    public static var BackgroundFeedbackColorErrorAccent1: Color { DSColor.feedbackBackgroundErrorAccent1.resolve }
    public static var BackgroundFeedbackColorErrorAccent2: Color { DSColor.feedbackBackgroundErrorAccent2.resolve }
    public static var BackgroundFeedbackColorWarningAccent1: Color { DSColor.feedbackBackgroundWarningAccent1.resolve }
    public static var BackgroundFeedbackColorWarningAccent2: Color { DSColor.feedbackBackgroundWarningAccent2.resolve }
    public static var BackgroundFeedbackColorInformationalAccent1: Color { DSColor.feedbackBackgroundInformationalAccent1.resolve }
    public static var BackgroundFeedbackColorInformationalAccent2: Color { DSColor.feedbackBackgroundInformationalAccent2.resolve }

    // MARK: - Color Tokens - Accent Backgrounds
    public static var BackgroundAccentColorBlue: Color { DSColor.accentBackgroundBlue.resolve }
    public static var BackgroundAccentColorGreen: Color { DSColor.accentBackgroundGreen.resolve }
    public static var BackgroundAccentColorYellow: Color { DSColor.accentBackgroundYellow.resolve }
    public static var BackgroundAccentColorRed: Color { DSColor.accentBackgroundRed.resolve }
    public static var BackgroundAccentColorBrown: Color { DSColor.accentBackgroundBrown.resolve }

    // MARK: - Color Tokens - Text
    public static var TextOnSurfaceColorPrimary: Color { DSColor.textOnSurfaceColorPrimary.resolve }
    public static var TextOnSurfaceColorSecondary: Color { DSColor.textOnSurfaceColorSecondary.resolve }
    public static var TextOnSurfaceColorTertiary: Color { DSColor.textOnSurfaceColorTertiary.resolve }
    public static var TextOnSurfaceColorAccent: Color { DSColor.textOnSurfaceColorAccent.resolve }
    public static var TextOnSurfaceColorAccent2: Color { DSColor.textOnSurfaceColorAccent2.resolve }
    public static var TextOnSurfaceColorError: Color { DSColor.textOnSurfaceColorError.resolve }
    public static var TextOnSurfaceColorSuccess: Color { DSColor.textOnSurfaceColorSuccess.resolve }
    public static var TextOnSurfaceColorWarning: Color { DSColor.textOnSurfaceColorWarning.resolve }
    public static var TextOnSurfaceColorInformational: Color { DSColor.textOnSurfaceColorInformational.resolve }
    public static var TextOnSurfaceColorInactive: Color { DSColor.textOnSurfaceColorInactive.resolve }
    public static var TextOnSurfaceColorInverse: Color { DSColor.textOnSurfaceColorInverse.resolve }

    public static var TextOnContainerColorPrimary: Color { DSColor.textOnContainerColorPrimary.resolve }
    public static var TextOnContainerColorSecondary: Color { DSColor.textOnContainerColorSecondary.resolve }
    public static var TextOnContainerColorTertiary: Color { DSColor.textOnContainerColorTertiary.resolve }
    public static var TextOnContainerColorAccent: Color { DSColor.textOnContainerColorAccent.resolve }
    public static var TextOnContainerColorAccent2: Color { DSColor.textOnContainerColorAccent2.resolve }
    public static var TextOnContainerColorInactive: Color { DSColor.textOnContainerColorInactive.resolve }
    public static var TextOnContainerColorInverse: Color { DSColor.textOnContainerColorInverse.resolve }

    // MARK: - Color Tokens - Greige Scale (direct access for gradients)
    public static let Greige025 = TokensSemanticLight.Greige025
    public static let Greige050 = TokensSemanticLight.Greige050
    public static let Greige100 = TokensSemanticLight.Greige100
    public static let Greige200 = TokensSemanticLight.Greige200
    public static let Greige300 = TokensSemanticLight.Greige300
    public static let Greige400 = TokensSemanticLight.Greige400
    public static let Greige500 = TokensSemanticLight.Greige500
    public static let Greige600 = TokensSemanticLight.Greige600
    public static let Greige700 = TokensSemanticLight.Greige700
    public static let Greige800 = TokensSemanticLight.Greige800
    public static let Greige900 = TokensSemanticLight.Greige900
    public static let Greige950 = TokensSemanticLight.Greige950

    // Legacy aliases (old naming pattern)
    public static let GreigeGreige050 = Greige050
    public static let GreigeGreige100 = Greige100

    // MARK: - Color Tokens - Brand Scale
    public static let Brand025 = TokensSemanticLight.Brand025
    public static let Brand050 = TokensSemanticLight.Brand050
    public static let Brand100 = TokensSemanticLight.Brand100
    public static let Brand200 = TokensSemanticLight.Brand200
    public static let Brand300 = TokensSemanticLight.Brand300
    public static let Brand400 = TokensSemanticLight.Brand400
    public static let Brand500 = TokensSemanticLight.Brand500
    public static let Brand600 = TokensSemanticLight.Brand600
    public static let Brand700 = TokensSemanticLight.Brand700
    public static let Brand800 = TokensSemanticLight.Brand800
    public static let Brand900 = TokensSemanticLight.Brand900
    public static let Brand950 = TokensSemanticLight.Brand950

    // Legacy aliases (old naming pattern)
    public static let BrandBrand050 = Brand050
    public static let BrandBrand200 = Brand200
    public static let BrandBrand300 = Brand300
    public static let BrandBrand400 = Brand400

    // MARK: - Color Tokens - Moonlight Scale (Blue)
    public static let Moonlight025 = TokensSemanticLight.Moonlight025
    public static let Moonlight050 = TokensSemanticLight.Moonlight050
    public static let Moonlight100 = TokensSemanticLight.Moonlight100
    public static let Moonlight200 = TokensSemanticLight.Moonlight200
    public static let Moonlight300 = TokensSemanticLight.Moonlight300
    public static let Moonlight400 = TokensSemanticLight.Moonlight400
    public static let Moonlight500 = TokensSemanticLight.Moonlight500
    public static let Moonlight600 = TokensSemanticLight.Moonlight600
    public static let Moonlight700 = TokensSemanticLight.Moonlight700
    public static let Moonlight800 = TokensSemanticLight.Moonlight800
    public static let Moonlight900 = TokensSemanticLight.Moonlight900
    public static let Moonlight950 = TokensSemanticLight.Moonlight950

    // Legacy aliases
    public static let MoonlightMoonlight300 = Moonlight300
    public static let MoonlightMoonlight500 = Moonlight500

    // MARK: - Color Tokens - BottleGreen Scale (Green)
    // Note: BottleGreen palette not in new tokens, using hardcoded values from legacy
    public static let BottleGreen025 = Color(red: 0.980, green: 0.988, blue: 0.984, opacity: 1)
    public static let BottleGreen050 = Color(red: 0.941, green: 0.969, blue: 0.953, opacity: 1)
    public static let BottleGreen100 = Color(red: 0.847, green: 0.894, blue: 0.871, opacity: 1)
    public static let BottleGreen200 = Color(red: 0.627, green: 0.745, blue: 0.682, opacity: 1)
    public static let BottleGreen300 = Color(red: 0.451, green: 0.608, blue: 0.533, opacity: 1)
    public static let BottleGreen400 = Color(red: 0.388, green: 0.576, blue: 0.482, opacity: 1)
    public static let BottleGreen500 = Color(red: 0.290, green: 0.506, blue: 0.396, opacity: 1)
    public static let BottleGreen600 = Color(red: 0.224, green: 0.455, blue: 0.337, opacity: 1)
    public static let BottleGreen700 = Color(red: 0.133, green: 0.384, blue: 0.259, opacity: 1)
    public static let BottleGreen800 = Color(red: 0.051, green: 0.314, blue: 0.180, opacity: 1)
    public static let BottleGreen900 = Color(red: 0.008, green: 0.761, blue: 0.071, opacity: 1)
    public static let BottleGreen950 = Color(red: 0.004, green: 0.063, blue: 0.024, opacity: 1)

    // Legacy aliases
    public static let BottleGreenBottleGreen300 = BottleGreen300
    public static let BottleGreenBottleGreen500 = BottleGreen500

    // MARK: - Color Tokens - Lemon Scale (Yellow)
    public static let Lemon025 = TokensSemanticLight.Lemon025
    public static let Lemon050 = TokensSemanticLight.Lemon050
    public static let Lemon100 = TokensSemanticLight.Lemon100
    public static let Lemon200 = TokensSemanticLight.Lemon200
    public static let Lemon300 = TokensSemanticLight.Lemon300
    public static let Lemon400 = TokensSemanticLight.Lemon400
    public static let Lemon500 = TokensSemanticLight.Lemon500
    public static let Lemon600 = TokensSemanticLight.Lemon600
    public static let Lemon700 = TokensSemanticLight.Lemon700
    public static let Lemon800 = TokensSemanticLight.Lemon800
    public static let Lemon900 = TokensSemanticLight.Lemon900
    public static let Lemon950 = TokensSemanticLight.Lemon950

    // MARK: - Color Tokens - Cinnabar Scale (Red)
    public static let Cinnabar025 = TokensSemanticLight.Cinnabar025
    public static let Cinnabar050 = TokensSemanticLight.Cinnabar050
    public static let Cinnabar100 = TokensSemanticLight.Cinnabar100
    public static let Cinnabar200 = TokensSemanticLight.Cinnabar200
    public static let Cinnabar300 = TokensSemanticLight.Cinnabar300
    public static let Cinnabar400 = TokensSemanticLight.Cinnabar400
    public static let Cinnabar500 = TokensSemanticLight.Cinnabar500
    public static let Cinnabar600 = TokensSemanticLight.Cinnabar600
    public static let Cinnabar700 = TokensSemanticLight.Cinnabar700
    public static let Cinnabar800 = TokensSemanticLight.Cinnabar800
    public static let Cinnabar900 = TokensSemanticLight.Cinnabar900
    public static let Cinnabar950 = TokensSemanticLight.Cinnabar950

    // MARK: - Border Tokens
    public static let BorderRadius3xl = TokensSemanticLight.BorderRadius3xl
    public static let BorderRadius2xl = TokensSemanticLight.BorderRadius2xl
    public static let BorderRadiusXl = TokensSemanticLight.BorderRadiusXl
    public static let BorderRadiusLg = TokensSemanticLight.BorderRadiusLg
    public static let BorderRadiusMd = TokensSemanticLight.BorderRadiusMd
    public static let BorderRadiusSm = TokensSemanticLight.BorderRadiusSm
    public static let BorderRadiusXs = TokensSemanticLight.BorderRadiusXs
    public static let BorderRadiusNone = TokensSemanticLight.BorderRadiusNone
    public static let BorderRadiusFull = TokensSemanticLight.BorderRadiusFull

    public static let BorderWidthXs = TokensSemanticLight.BorderWidthXs
    public static let BorderWidthSm = TokensSemanticLight.BorderWidthSm
    public static let BorderWidthMd = TokensSemanticLight.BorderWidthMd
    public static let BorderWidthLg = TokensSemanticLight.BorderWidthLg
    public static let BorderWidthXl = TokensSemanticLight.BorderWidthXl
    public static let BorderWidth2xl = TokensSemanticLight.BorderWidth2xl
    public static let BorderWidthNone = TokensSemanticLight.BorderWidthNone

    public static var BorderButtonColorAccent: Color { DSColor.buttonBorderAccent.resolve }
    public static var BorderButtonColorAccent2: Color { DSColor.buttonBorderAccent2.resolve }
    public static var BorderButtonColorDefault: Color { DSColor.buttonBorderDefault.resolve }
    public static var BorderButtonColorPressed: Color { DSColor.buttonBorderPressed.resolve }
    public static var BorderButtonColorInactive: Color { DSColor.buttonBorderInactive.resolve }
    public static var BorderButtonColorFocus: Color { DSColor.buttonBorderFocus.resolve }
    public static var BorderButtonColorOrangeOutlineDefault: Color { DSColor.buttonBorderOrangeOutlineDefault.resolve }
    public static var BorderButtonColorOrangeOutlineInactive: Color { DSColor.buttonBorderOrangeOutlineInactive.resolve }

    public static var BorderInputColorDefault: Color { DSColor.inputBorderDefault.resolve }
    public static var BorderInputColorActive: Color { DSColor.inputBorderActive.resolve }
    public static var BorderInputColorPressed: Color { DSColor.inputBorderPressed.resolve }
    public static var BorderInputColorInactive: Color { DSColor.inputBorderInactive.resolve }
    public static var BorderInputColorFocus: Color { DSColor.inputBorderFocus.resolve }
    public static var BorderInputColorAccent: Color { DSColor.inputBorderAccent.resolve }
    public static var BorderInputColorAccent2: Color { DSColor.inputBorderAccent2.resolve }
    public static var BorderInputColorError: Color { DSColor.inputBorderError.resolve }
    public static var BorderInputColorSuccess: Color { DSColor.inputBorderSuccess.resolve }
    public static var BorderInputColorWarning: Color { DSColor.inputBorderWarning.resolve }

    public static var BorderOnContainerDefault: Color { DSColor.borderOnContainerDefault.resolve }
    public static var BorderOnContainerActive: Color { DSColor.borderOnContainerActive.resolve }
    public static var BorderOnContainerPressed: Color { DSColor.borderOnContainerPressed.resolve }
    public static var BorderOnContainerInactive: Color { DSColor.borderOnContainerInactive.resolve }
    public static var BorderOnContainerInverse: Color { DSColor.borderOnContainerInverse.resolve }

    // MARK: - Elevation Tokens (from TokensCoreLight)
    public static let ElevationLowest = TokensCoreLight.ElevationLowest
    public static let ElevationLow = TokensCoreLight.ElevationLow
    public static let ElevationMed = TokensCoreLight.ElevationMed
    public static let ElevationHigh = TokensCoreLight.ElevationHigh
    public static let ElevationHighest = TokensCoreLight.ElevationHighest

    public static let ElevationBlurRadiusBlur1 = CGFloat(TokensCoreLight.ElevationBlurRadiusBlur1)
    public static let ElevationBlurRadiusBlur2 = CGFloat(TokensCoreLight.ElevationBlurRadiusBlur2)
    public static let ElevationBlurRadiusBlur3 = CGFloat(TokensCoreLight.ElevationBlurRadiusBlur3)
    public static let ElevationBlurRadiusBlur4 = CGFloat(TokensCoreLight.ElevationBlurRadiusBlur4)
    public static let ElevationBlurRadiusBlur5 = CGFloat(TokensCoreLight.ElevationBlurRadiusBlur5)

    public static let ElevationPositionX1 = CGFloat(0)
    public static let ElevationPositionX2 = CGFloat(0)
    public static let ElevationPositionX3 = CGFloat(0)
    public static let ElevationPositionX4 = CGFloat(0)
    public static let ElevationPositionX5 = CGFloat(0)

    public static let ElevationPositionY1 = CGFloat(TokensCoreLight.ElevationPositionY1)
    public static let ElevationPositionY2 = CGFloat(TokensCoreLight.ElevationPositionY2)
    public static let ElevationPositionY3 = CGFloat(TokensCoreLight.ElevationPositionY3)
    public static let ElevationPositionY4 = CGFloat(TokensCoreLight.ElevationPositionY4)
    public static let ElevationPositionY5 = CGFloat(TokensCoreLight.ElevationPositionY5)

    // MARK: - Neutrals
    public static var NeutralsWhite: Color { DSColor.neutralsWhite.resolve }
    public static var NeutralsBlack: Color { DSColor.neutralsBlack.resolve }
    public static var NeutralsTransparent: Color { DSColor.neutralsTransparent.resolve }

    // MARK: - Transparent Black Scale
    public static var TransparentBlack025: Color { DSColor.transparentBlackTransparentBlack025.resolve }
    public static var TransparentBlack050: Color { DSColor.transparentBlackTransparentBlack050.resolve }
    public static var TransparentBlack075: Color { DSColor.transparentBlackTransparentBlack075.resolve }
    public static var TransparentBlack100: Color { DSColor.transparentBlackTransparentBlack100.resolve }
    public static var TransparentBlack200: Color { DSColor.transparentBlackTransparentBlack200.resolve }
    public static var TransparentBlack300: Color { DSColor.transparentBlackTransparentBlack300.resolve }
    public static var TransparentBlack400: Color { DSColor.transparentBlackTransparentBlack400.resolve }
    public static var TransparentBlack500: Color { DSColor.transparentBlackTransparentBlack500.resolve }
    public static var TransparentBlack600: Color { DSColor.transparentBlackTransparentBlack600.resolve }
    public static var TransparentBlack700: Color { DSColor.transparentBlackTransparentBlack700.resolve }
    public static var TransparentBlack800: Color { DSColor.transparentBlackTransparentBlack800.resolve }
    public static var TransparentBlack900: Color { DSColor.transparentBlackTransparentBlack900.resolve }
    public static var TransparentBlack950: Color { DSColor.transparentBlackTransparentBlack950.resolve }

    // MARK: - Transparent White Scale
    public static var TransparentWhite025: Color { DSColor.transparentWhiteTransparentWhite025.resolve }
    public static var TransparentWhite050: Color { DSColor.transparentWhiteTransparentWhite050.resolve }
    public static var TransparentWhite075: Color { DSColor.transparentWhiteTransparentWhite075.resolve }
    public static var TransparentWhite100: Color { DSColor.transparentWhiteTransparentWhite100.resolve }
    public static var TransparentWhite200: Color { DSColor.transparentWhiteTransparentWhite200.resolve }
    public static var TransparentWhite300: Color { DSColor.transparentWhiteTransparentWhite300.resolve }
    public static var TransparentWhite400: Color { DSColor.transparentWhiteTransparentWhite400.resolve }
    public static var TransparentWhite500: Color { DSColor.transparentWhiteTransparentWhite500.resolve }
    public static var TransparentWhite600: Color { DSColor.transparentWhiteTransparentWhite600.resolve }
    public static var TransparentWhite700: Color { DSColor.transparentWhiteTransparentWhite700.resolve }
    public static var TransparentWhite800: Color { DSColor.transparentWhiteTransparentWhite800.resolve }
    public static var TransparentWhite900: Color { DSColor.transparentWhiteTransparentWhite900.resolve }
    public static var TransparentWhite950: Color { DSColor.transparentWhiteTransparentWhite950.resolve }

    // MARK: - Icon Tokens (from TokensComponentsLight)
    public static let IconOnContainerColorInactive = TokensComponentsLight.IconOnContainerColorInactive
    public static let IconOnContainerColorPrimary = TokensComponentsLight.IconOnContainerColorPrimary
    public static let IconOnContainerColorSecondary = TokensComponentsLight.IconOnContainerColorSecondary
    public static let IconOnContainerColorTertiary = TokensComponentsLight.IconOnContainerColorTertiary
    public static let IconOnContainerColorInverse = TokensComponentsLight.IconOnContainerColorInverse
    public static let IconOnContainerColorAccent = TokensComponentsLight.IconOnContainerColorAccent
    public static let IconOnContainerColorAccent2 = TokensComponentsLight.IconOnContainerColorAccent2
    public static let IconOnContainerColorSuccess = TokensComponentsLight.IconOnContainerColorSuccess
    public static let IconOnContainerColorWarning = TokensComponentsLight.IconOnContainerColorWarning
    public static let IconOnContainerColorError = TokensComponentsLight.IconOnContainerColorError
    public static let IconOnContainerColorInformational = TokensComponentsLight.IconOnContainerColorInformational
}
