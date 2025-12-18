//
// DesignSystemGlobal.swift
// Design System Token Aggregator
//
// This file aggregates tokens from TokensSemanticLight and TokensCoreLight
// into a single namespace for easy access throughout the app.
//

import SwiftUI

/// Global design system namespace that aggregates all design tokens
public struct DesignSystemGlobal {
    
    // MARK: - Spacing Tokens
    public static let Spacing0 = CGFloat(0)
    public static let Spacing1 = CGFloat(4)
    public static let Spacing1px = CGFloat(1)
    public static let Spacing2px = CGFloat(2)
    public static let Spacing2 = CGFloat(8)
    public static let Spacing3 = CGFloat(12)
    public static let Spacing4 = CGFloat(16)
    public static let Spacing5 = CGFloat(20)
    public static let Spacing6 = CGFloat(24)
    public static let Spacing7 = CGFloat(28)
    public static let Spacing8 = CGFloat(32)
    public static let Spacing9 = CGFloat(36)
    public static let Spacing10 = CGFloat(40)
    public static let Spacing11 = CGFloat(44)
    public static let Spacing12 = CGFloat(48)
    public static let Spacing13 = CGFloat(52)
    public static let Spacing14 = CGFloat(56)
    public static let Spacing15 = CGFloat(60)
    public static let Spacing16 = CGFloat(64)
    public static let Spacing17 = CGFloat(68)
    public static let Spacing18 = CGFloat(72)
    public static let Spacing20 = CGFloat(80)
    
    // MARK: - Font Size Tokens (from TokensCoreLight)
    public static let FontSizeBodyXs = TokensCoreLight.FontSizeBodyXs      // 12pt
    public static let FontSizeBodySm = TokensCoreLight.FontSizeBodySm      // 14pt
    public static let FontSizeBodyMd = TokensCoreLight.FontSizeBodyMd      // 16pt
    public static let FontSizeBodyLg = TokensCoreLight.FontSizeBodyLg      // 18pt
    public static let FontSizeBodyXl = TokensCoreLight.FontSizeBodyXl      // 20pt
    
    // MARK: - Font Family Tokens (from TokensCoreLight)
    public static let FontFamilyDisplay = TokensCoreLight.FontFamilyDisplay             // "THD LgVar Beta"
    public static let FontFamilyInformational = TokensCoreLight.FontFamilyInformational // "THD SmVar Beta"
    
    // MARK: - Extended Font Sizes (for Headings and Hero Text)
    // These are not in TokensCoreLight but are needed for the design system
    public static let FontSizeCaption = CGFloat(10)    // Caption text
    public static let FontSizeH6 = CGFloat(16)         // Smallest heading
    public static let FontSizeH5 = CGFloat(18)         // Small heading
    public static let FontSizeH4 = CGFloat(20)         // Medium-small heading
    public static let FontSizeH3 = CGFloat(24)         // Medium heading
    public static let FontSizeH2 = CGFloat(28)         // Large heading
    public static let FontSizeH1 = CGFloat(32)         // Largest heading
    public static let FontSizeHero5 = CGFloat(36)      // Small hero
    public static let FontSizeHero4 = CGFloat(40)      // Medium-small hero
    public static let FontSizeHero3 = CGFloat(48)      // Medium hero
    public static let FontSizeHero2 = CGFloat(56)      // Large hero
    public static let FontSizeHero1 = CGFloat(64)      // Largest hero
    
    // MARK: - Font Line Heights
    public static let FontLineHeightNone = CGFloat(1.0)   // No additional line spacing
    public static let FontLineHeightTight = CGFloat(1.25) // Tight line spacing
    public static let FontLineHeightBase = CGFloat(1.5)   // Standard line spacing
    
    // MARK: - Color Tokens - Background
    public static let BackgroundSurfaceColorGreige = TokensSemanticLight.BackgroundSurfaceColorGreige
    public static let BackgroundSurfaceColorInverse = TokensSemanticLight.BackgroundSurfaceColorInverse
    public static let BackgroundContainerColorWhite = TokensSemanticLight.BackgroundContainerColorWhite
    public static let BackgroundContainerColorGreige = TokensSemanticLight.BackgroundContainerColorGreige
    public static let BackgroundContainerColorBrand = TokensSemanticLight.BackgroundContainerColorBrand
    public static let BackgroundContainerColorBrandAccent = TokensSemanticLight.BackgroundContainerColorBrandAccent
    public static let BackgroundContainerColorInverse = TokensSemanticLight.BackgroundContainerColorInverse
    public static let BackgroundContainerColorTransparent05 = TokensSemanticLight.BackgroundContainerColorTransparent05
    public static let BackgroundContainerColorTransparent10 = TokensSemanticLight.BackgroundContainerColorTransparent10
    public static let BackgroundContainerColorTransparent20 = TokensSemanticLight.BackgroundContainerColorTransparent20
    
    // MARK: - Color Tokens - Button Backgrounds
    public static let BackgroundButtonColorBrandFilledDefault = TokensSemanticLight.BackgroundButtonColorBrandFilledDefault
    public static let BackgroundButtonColorBrandFilledInactive = TokensSemanticLight.BackgroundButtonColorBrandFilledInactive
    public static let BackgroundButtonColorWhiteFilledDefault = TokensSemanticLight.BackgroundButtonColorWhiteFilledDefault
    public static let BackgroundButtonColorWhiteFilledInactive = TokensSemanticLight.BackgroundButtonColorWhiteFilledInactive
    public static let BackgroundButtonColorGhostFilledDefault = TokensSemanticLight.BackgroundButtonColorGhostFilledDefault
    public static let BackgroundButtonColorGhostFilledInactive = TokensSemanticLight.BackgroundButtonColorGhostFilledInactive
    public static let BackgroundButtonColorGhostFilledPressed = TokensSemanticLight.BackgroundButtonColorGhostFilledPressed
    public static let BackgroundButtonColorTransparent05Default = TokensSemanticLight.BackgroundButtonColorTransparent05Default
    public static let BackgroundButtonColorTransparent10Default = TokensSemanticLight.BackgroundButtonColorTransparent10Default
    
    // MARK: - Color Tokens - Feedback
    public static let BackgroundFeedbackColorSuccessAccent1 = TokensSemanticLight.BackgroundFeedbackColorSuccessAccent1
    public static let BackgroundFeedbackColorSuccessAccent2 = TokensSemanticLight.BackgroundFeedbackColorSuccessAccent2
    public static let BackgroundFeedbackColorErrorAccent1 = TokensSemanticLight.BackgroundFeedbackColorErrorAccent1
    public static let BackgroundFeedbackColorErrorAccent2 = TokensSemanticLight.BackgroundFeedbackColorErrorAccent2
    public static let BackgroundFeedbackColorWarningAccent1 = TokensSemanticLight.BackgroundFeedbackColorWarningAccent1
    public static let BackgroundFeedbackColorWarningAccent2 = TokensSemanticLight.BackgroundFeedbackColorWarningAccent2
    public static let BackgroundFeedbackColorInformationalAccent1 = TokensSemanticLight.BackgroundFeedbackColorInformationalAccent1
    public static let BackgroundFeedbackColorInformationalAccent2 = TokensSemanticLight.BackgroundFeedbackColorInformationalAccent2
    
    // MARK: - Color Tokens - Accent Backgrounds
    public static let BackgroundAccentColorBlue = TokensSemanticLight.BackgroundAccentColorBlue
    public static let BackgroundAccentColorGreen = TokensSemanticLight.BackgroundAccentColorGreen
    public static let BackgroundAccentColorYellow = TokensSemanticLight.BackgroundAccentColorYellow
    public static let BackgroundAccentColorRed = TokensSemanticLight.BackgroundAccentColorRed
    public static let BackgroundAccentColorBrown = TokensSemanticLight.BackgroundAccentColorBrown
    
    // MARK: - Color Tokens - Text
    public static let TextOnSurfaceColorPrimary = TokensSemanticLight.TextOnSurfaceColorPrimary
    public static let TextOnSurfaceColorSecondary = TokensSemanticLight.TextOnSurfaceColorSecondary
    public static let TextOnSurfaceColorTertiary = TokensSemanticLight.TextOnSurfaceColorTertiary
    public static let TextOnSurfaceColorAccent = TokensSemanticLight.TextOnSurfaceColorAccent
    public static let TextOnSurfaceColorAccent2 = TokensSemanticLight.TextOnSurfaceColorAccent2
    public static let TextOnSurfaceColorError = TokensSemanticLight.TextOnSurfaceColorError
    public static let TextOnSurfaceColorSuccess = TokensSemanticLight.TextOnSurfaceColorSuccess
    public static let TextOnSurfaceColorWarning = TokensSemanticLight.TextOnSurfaceColorWarning
    public static let TextOnSurfaceColorInformational = TokensSemanticLight.TextOnSurfaceColorInformational
    public static let TextOnSurfaceColorInactive = TokensSemanticLight.TextOnSurfaceColorInactive
    public static let TextOnSurfaceColorInverse = TokensSemanticLight.TextOnSurfaceColorInverse
    
    public static let TextOnContainerColorPrimary = TokensSemanticLight.TextOnContainerColorPrimary
    public static let TextOnContainerColorSecondary = TokensSemanticLight.TextOnContainerColorSecondary
    public static let TextOnContainerColorTertiary = TokensSemanticLight.TextOnContainerColorTertiary
    public static let TextOnContainerColorAccent = TokensSemanticLight.TextOnContainerColorAccent
    public static let TextOnContainerColorAccent2 = TokensSemanticLight.TextOnContainerColorAccent2
    
    // MARK: - Color Tokens - Greige Scale
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
    
    // MARK: - Color Tokens - BottleGreen Scale
    public static let BottleGreen025 = TokensSemanticLight.BottleGreen025
    public static let BottleGreen050 = TokensSemanticLight.BottleGreen050
    public static let BottleGreen100 = TokensSemanticLight.BottleGreen100
    public static let BottleGreen200 = TokensSemanticLight.BottleGreen200
    public static let BottleGreen300 = TokensSemanticLight.BottleGreen300
    public static let BottleGreen400 = TokensSemanticLight.BottleGreen400
    public static let BottleGreen500 = TokensSemanticLight.BottleGreen500
    public static let BottleGreen600 = TokensSemanticLight.BottleGreen600
    public static let BottleGreen700 = TokensSemanticLight.BottleGreen700
    public static let BottleGreen800 = TokensSemanticLight.BottleGreen800
    public static let BottleGreen900 = TokensSemanticLight.BottleGreen900
    public static let BottleGreen950 = TokensSemanticLight.BottleGreen950
    
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
    
    public static let BorderButtonColorAccent = TokensSemanticLight.BorderButtonColorAccent
    public static let BorderButtonColorAccent2 = TokensSemanticLight.BorderButtonColorAccent2
    public static let BorderButtonColorDefault = TokensSemanticLight.BorderButtonColorDefault
    public static let BorderButtonColorPressed = TokensSemanticLight.BorderButtonColorPressed
    public static let BorderButtonColorInactive = TokensSemanticLight.BorderButtonColorInactive
    public static let BorderButtonColorFocus = TokensSemanticLight.BorderButtonColorFocus
    public static let BorderButtonColorOrangeOutlineDefault = TokensSemanticLight.BorderButtonColorOrangeOutlineDefault
    public static let BorderButtonColorOrangeOutlineInactive = TokensSemanticLight.BorderButtonColorOrangeOutlineInactive
    
    public static let BorderInputColorDefault = TokensSemanticLight.BorderInputColorDefault
    public static let BorderInputColorActive = TokensSemanticLight.BorderInputColorActive
    public static let BorderInputColorPressed = TokensSemanticLight.BorderInputColorPressed
    public static let BorderInputColorInactive = TokensSemanticLight.BorderInputColorInactive
    public static let BorderInputColorFocus = TokensSemanticLight.BorderInputColorFocus
    public static let BorderInputColorAccent = TokensSemanticLight.BorderInputColorAccent
    public static let BorderInputColorAccent2 = TokensSemanticLight.BorderInputColorAccent2
    public static let BorderInputColorError = TokensSemanticLight.BorderInputColorError
    public static let BorderInputColorSuccess = TokensSemanticLight.BorderInputColorSuccess
    public static let BorderInputColorWarning = TokensSemanticLight.BorderInputColorWarning
    
    public static let BorderOnContainerDefault = TokensSemanticLight.BorderInputColorDefault
    public static let BorderOnContainerActive = TokensSemanticLight.BorderInputColorActive
    public static let BorderOnContainerPressed = TokensSemanticLight.BorderInputColorPressed
    public static let BorderOnContainerInactive = TokensSemanticLight.BorderInputColorInactive
    public static let BorderOnContainerInverse = TokensSemanticLight.BorderButtonColorAccent2
    
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
    public static let NeutralsWhite = TokensSemanticLight.NeutralsWhite
    public static let NeutralsBlack = TokensSemanticLight.NeutralsBlack
    public static let NeutralsTransparent = TokensSemanticLight.NeutralsTransparent
    
    // MARK: - Transparent Black Scale
    public static let TransparentBlack025 = TokensSemanticLight.TransparentBlackTransparentBlack025
    public static let TransparentBlack050 = TokensSemanticLight.TransparentBlackTransparentBlack050
    public static let TransparentBlack075 = TokensSemanticLight.TransparentBlackTransparentBlack075
    public static let TransparentBlack100 = TokensSemanticLight.TransparentBlackTransparentBlack100
    public static let TransparentBlack200 = TokensSemanticLight.TransparentBlackTransparentBlack200
    public static let TransparentBlack300 = TokensSemanticLight.TransparentBlackTransparentBlack300
    public static let TransparentBlack400 = TokensSemanticLight.TransparentBlackTransparentBlack400
    public static let TransparentBlack500 = TokensSemanticLight.TransparentBlackTransparentBlack500
    public static let TransparentBlack600 = TokensSemanticLight.TransparentBlackTransparentBlack600
    public static let TransparentBlack700 = TokensSemanticLight.TransparentBlackTransparentBlack700
    public static let TransparentBlack800 = TokensSemanticLight.TransparentBlackTransparentBlack800
    public static let TransparentBlack900 = TokensSemanticLight.TransparentBlackTransparentBlack900
    public static let TransparentBlack950 = TokensSemanticLight.TransparentBlackTransparentBlack950
    
    // MARK: - Transparent White Scale
    public static let TransparentWhite025 = TokensSemanticLight.TransparentWhiteTransparentWhite025
    public static let TransparentWhite050 = TokensSemanticLight.TransparentWhiteTransparentWhite050
    public static let TransparentWhite075 = TokensSemanticLight.TransparentWhiteTransparentWhite075
    public static let TransparentWhite100 = TokensSemanticLight.TransparentWhiteTransparentWhite100
    public static let TransparentWhite200 = TokensSemanticLight.TransparentWhiteTransparentWhite200
    public static let TransparentWhite300 = TokensSemanticLight.TransparentWhiteTransparentWhite300
    public static let TransparentWhite400 = TokensSemanticLight.TransparentWhiteTransparentWhite400
    public static let TransparentWhite500 = TokensSemanticLight.TransparentWhiteTransparentWhite500
    public static let TransparentWhite600 = TokensSemanticLight.TransparentWhiteTransparentWhite600
    public static let TransparentWhite700 = TokensSemanticLight.TransparentWhiteTransparentWhite700
    public static let TransparentWhite800 = TokensSemanticLight.TransparentWhiteTransparentWhite800
    public static let TransparentWhite900 = TokensSemanticLight.TransparentWhiteTransparentWhite900
    public static let TransparentWhite950 = TokensSemanticLight.TransparentWhiteTransparentWhite950
    
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
