//
// CoreTokensProvider.swift
//

// Do not edit directly, this file was auto-generated.

import SwiftUI

/// Protocol defining the core tokens contract.
///
/// Both `TokensCoreLight` and `TokensCoreDark` conform to this protocol,
/// enabling theme-agnostic code and easier testing through dependency injection.
///
/// ## Usage
/// ```swift
/// struct MyView: View {
///     let tokens: any CoreTokensProvider
///     
///     var body: some View {
///         Text("Hello")
///             .foregroundColor(tokens.textPrimary)
///     }
/// }
/// ```
public protocol CoreTokensProvider {
    var BodyLgBoldBaseFontFamily: String { get }
    var BodyLgBoldBaseFontSize: Int { get }
    var BodyLgBoldBaseFontWeight: String { get }
    var BodyLgBoldBaseLetterSpacing: Int { get }
    var BodyLgBoldBaseLineHeight: Int { get }
    var BodyLgBoldNoneFontFamily: String { get }
    var BodyLgBoldNoneFontSize: Int { get }
    var BodyLgBoldNoneFontWeight: String { get }
    var BodyLgBoldNoneLetterSpacing: Int { get }
    var BodyLgBoldNoneLineHeight: Int { get }
    var BodyLgBoldTightFontFamily: String { get }
    var BodyLgBoldTightFontSize: Int { get }
    var BodyLgBoldTightFontWeight: String { get }
    var BodyLgBoldTightLetterSpacing: Int { get }
    var BodyLgBoldTightLineHeight: Int { get }
    var BodyLgRegularBaseFontFamily: String { get }
    var BodyLgRegularBaseFontSize: Int { get }
    var BodyLgRegularBaseFontWeight: String { get }
    var BodyLgRegularBaseLetterSpacing: Int { get }
    var BodyLgRegularBaseLineHeight: Int { get }
    var BodyLgRegularNoneFontFamily: String { get }
    var BodyLgRegularNoneFontSize: Int { get }
    var BodyLgRegularNoneFontWeight: String { get }
    var BodyLgRegularNoneLetterSpacing: Int { get }
    var BodyLgRegularNoneLineHeight: Int { get }
    var BodyLgRegularTightFontFamily: String { get }
    var BodyLgRegularTightFontSize: Int { get }
    var BodyLgRegularTightFontWeight: String { get }
    var BodyLgRegularTightLetterSpacing: Int { get }
    var BodyLgRegularTightLineHeight: Int { get }
    var BodyLgSemiboldBaseFontFamily: String { get }
    var BodyLgSemiboldBaseFontSize: Int { get }
    var BodyLgSemiboldBaseFontWeight: String { get }
    var BodyLgSemiboldBaseLetterSpacing: Int { get }
    var BodyLgSemiboldBaseLineHeight: Int { get }
    var BodyLgSemiboldNoneFontFamily: String { get }
    var BodyLgSemiboldNoneFontSize: Int { get }
    var BodyLgSemiboldNoneFontWeight: String { get }
    var BodyLgSemiboldNoneLetterSpacing: Int { get }
    var BodyLgSemiboldNoneLineHeight: Int { get }
    var BodyLgSemiboldTightFontFamily: String { get }
    var BodyLgSemiboldTightFontSize: Int { get }
    var BodyLgSemiboldTightFontWeight: String { get }
    var BodyLgSemiboldTightLetterSpacing: Int { get }
    var BodyLgSemiboldTightLineHeight: Int { get }
    var BodyMdBoldBaseFontFamily: String { get }
    var BodyMdBoldBaseFontSize: Int { get }
    var BodyMdBoldBaseFontWeight: String { get }
    var BodyMdBoldBaseLetterSpacing: Int { get }
    var BodyMdBoldBaseLineHeight: Int { get }
    var BodyMdBoldNoneFontFamily: String { get }
    var BodyMdBoldNoneFontSize: Int { get }
    var BodyMdBoldNoneFontWeight: String { get }
    var BodyMdBoldNoneLetterSpacing: Int { get }
    var BodyMdBoldNoneLineHeight: Int { get }
    var BodyMdBoldTightFontFamily: String { get }
    var BodyMdBoldTightFontSize: Int { get }
    var BodyMdBoldTightFontWeight: String { get }
    var BodyMdBoldTightLetterSpacing: Int { get }
    var BodyMdBoldTightLineHeight: Int { get }
    var BodyMdRegularBaseFontFamily: String { get }
    var BodyMdRegularBaseFontSize: Int { get }
    var BodyMdRegularBaseFontWeight: String { get }
    var BodyMdRegularBaseLetterSpacing: Int { get }
    var BodyMdRegularBaseLineHeight: Int { get }
    var BodyMdRegularNoneFontFamily: String { get }
    var BodyMdRegularNoneFontSize: Int { get }
    var BodyMdRegularNoneFontWeight: String { get }
    var BodyMdRegularNoneLetterSpacing: Int { get }
    var BodyMdRegularNoneLineHeight: Int { get }
    var BodyMdRegularTightFontFamily: String { get }
    var BodyMdRegularTightFontSize: Int { get }
    var BodyMdRegularTightFontWeight: String { get }
    var BodyMdRegularTightLetterSpacing: Int { get }
    var BodyMdRegularTightLineHeight: Int { get }
    var BodyMdSemiboldBaseFontFamily: String { get }
    var BodyMdSemiboldBaseFontSize: Int { get }
    var BodyMdSemiboldBaseFontWeight: String { get }
    var BodyMdSemiboldBaseLetterSpacing: Int { get }
    var BodyMdSemiboldBaseLineHeight: Int { get }
    var BodyMdSemiboldNoneFontFamily: String { get }
    var BodyMdSemiboldNoneFontSize: Int { get }
    var BodyMdSemiboldNoneFontWeight: String { get }
    var BodyMdSemiboldNoneLetterSpacing: Int { get }
    var BodyMdSemiboldNoneLineHeight: Int { get }
    var BodyMdSemiboldTightFontFamily: String { get }
    var BodyMdSemiboldTightFontSize: Int { get }
    var BodyMdSemiboldTightFontWeight: String { get }
    var BodyMdSemiboldTightLetterSpacing: Int { get }
    var BodyMdSemiboldTightLineHeight: Int { get }
    var BodySmDefaultBoldBaseFontFamily: String { get }
    var BodySmDefaultBoldBaseFontSize: Int { get }
    var BodySmDefaultBoldBaseFontWeight: String { get }
    var BodySmDefaultBoldBaseLetterSpacing: Int { get }
    var BodySmDefaultBoldBaseLineHeight: Int { get }
    var BodySmDefaultBoldNoneFontFamily: String { get }
    var BodySmDefaultBoldNoneFontSize: Int { get }
    var BodySmDefaultBoldNoneFontWeight: String { get }
    var BodySmDefaultBoldNoneLetterSpacing: Int { get }
    var BodySmDefaultBoldNoneLineHeight: Int { get }
    var BodySmDefaultBoldTightFontFamily: String { get }
    var BodySmDefaultBoldTightFontSize: Int { get }
    var BodySmDefaultBoldTightFontWeight: String { get }
    var BodySmDefaultBoldTightLetterSpacing: Int { get }
    var BodySmDefaultBoldTightLineHeight: Int { get }
    var BodySmDefaultRegularBaseFontFamily: String { get }
    var BodySmDefaultRegularBaseFontSize: Int { get }
    var BodySmDefaultRegularBaseFontWeight: String { get }
    var BodySmDefaultRegularBaseLetterSpacing: Int { get }
    var BodySmDefaultRegularBaseLineHeight: Int { get }
    var BodySmDefaultRegularNoneFontFamily: String { get }
    var BodySmDefaultRegularNoneFontSize: Int { get }
    var BodySmDefaultRegularNoneFontWeight: String { get }
    var BodySmDefaultRegularNoneLetterSpacing: Int { get }
    var BodySmDefaultRegularNoneLineHeight: Int { get }
    var BodySmDefaultRegularTightFontFamily: String { get }
    var BodySmDefaultRegularTightFontSize: Int { get }
    var BodySmDefaultRegularTightFontWeight: String { get }
    var BodySmDefaultRegularTightLetterSpacing: Int { get }
    var BodySmDefaultRegularTightLineHeight: Int { get }
    var BodySmDefaultSemiboldBaseFontFamily: String { get }
    var BodySmDefaultSemiboldBaseFontSize: Int { get }
    var BodySmDefaultSemiboldBaseFontWeight: String { get }
    var BodySmDefaultSemiboldBaseLetterSpacing: Int { get }
    var BodySmDefaultSemiboldBaseLineHeight: Int { get }
    var BodySmDefaultSemiboldNoneFontFamily: String { get }
    var BodySmDefaultSemiboldNoneFontSize: Int { get }
    var BodySmDefaultSemiboldNoneFontWeight: String { get }
    var BodySmDefaultSemiboldNoneLetterSpacing: Int { get }
    var BodySmDefaultSemiboldNoneLineHeight: Int { get }
    var BodySmDefaultSemiboldTightFontFamily: String { get }
    var BodySmDefaultSemiboldTightFontSize: Int { get }
    var BodySmDefaultSemiboldTightFontWeight: String { get }
    var BodySmDefaultSemiboldTightLetterSpacing: Int { get }
    var BodySmDefaultSemiboldTightLineHeight: Int { get }
    var BodyXlBoldBaseFontFamily: String { get }
    var BodyXlBoldBaseFontSize: Int { get }
    var BodyXlBoldBaseFontWeight: String { get }
    var BodyXlBoldBaseLetterSpacing: Int { get }
    var BodyXlBoldBaseLineHeight: Int { get }
    var BodyXlBoldNoneFontFamily: String { get }
    var BodyXlBoldNoneFontSize: Int { get }
    var BodyXlBoldNoneFontWeight: String { get }
    var BodyXlBoldNoneLetterSpacing: Int { get }
    var BodyXlBoldNoneLineHeight: Int { get }
    var BodyXlBoldTightFontFamily: String { get }
    var BodyXlBoldTightFontSize: Int { get }
    var BodyXlBoldTightFontWeight: String { get }
    var BodyXlBoldTightLetterSpacing: Int { get }
    var BodyXlBoldTightLineHeight: Int { get }
    var BodyXlRegularBaseFontFamily: String { get }
    var BodyXlRegularBaseFontSize: Int { get }
    var BodyXlRegularBaseFontWeight: String { get }
    var BodyXlRegularBaseLetterSpacing: Int { get }
    var BodyXlRegularBaseLineHeight: Int { get }
    var BodyXlRegularNoneFontFamily: String { get }
    var BodyXlRegularNoneFontSize: Int { get }
    var BodyXlRegularNoneFontWeight: String { get }
    var BodyXlRegularNoneLetterSpacing: Int { get }
    var BodyXlRegularNoneLineHeight: Int { get }
    var BodyXlRegularTightFontFamily: String { get }
    var BodyXlRegularTightFontSize: Int { get }
    var BodyXlRegularTightFontWeight: String { get }
    var BodyXlRegularTightLetterSpacing: Int { get }
    var BodyXlRegularTightLineHeight: Int { get }
    var BodyXlSemiboldBaseFontFamily: String { get }
    var BodyXlSemiboldBaseFontSize: Int { get }
    var BodyXlSemiboldBaseFontWeight: String { get }
    var BodyXlSemiboldBaseLetterSpacing: Int { get }
    var BodyXlSemiboldBaseLineHeight: Int { get }
    var BodyXlSemiboldNoneFontFamily: String { get }
    var BodyXlSemiboldNoneFontSize: Int { get }
    var BodyXlSemiboldNoneFontWeight: String { get }
    var BodyXlSemiboldNoneLetterSpacing: Int { get }
    var BodyXlSemiboldNoneLineHeight: Int { get }
    var BodyXlSemiboldTightFontFamily: String { get }
    var BodyXlSemiboldTightFontSize: Int { get }
    var BodyXlSemiboldTightFontWeight: String { get }
    var BodyXlSemiboldTightLetterSpacing: Int { get }
    var BodyXlSemiboldTightLineHeight: Int { get }
    var BodyXsBoldBaseFontFamily: String { get }
    var BodyXsBoldBaseFontSize: Int { get }
    var BodyXsBoldBaseFontWeight: String { get }
    var BodyXsBoldBaseLetterSpacing: Int { get }
    var BodyXsBoldBaseLineHeight: Int { get }
    var BodyXsBoldNoneFontFamily: String { get }
    var BodyXsBoldNoneFontSize: Int { get }
    var BodyXsBoldNoneFontWeight: String { get }
    var BodyXsBoldNoneLetterSpacing: Int { get }
    var BodyXsBoldNoneLineHeight: Int { get }
    var BodyXsBoldTightFontFamily: String { get }
    var BodyXsBoldTightFontSize: Int { get }
    var BodyXsBoldTightFontWeight: String { get }
    var BodyXsBoldTightLetterSpacing: Int { get }
    var BodyXsBoldTightLineHeight: Int { get }
    var BodyXsRegularBaseFontFamily: String { get }
    var BodyXsRegularBaseFontSize: Int { get }
    var BodyXsRegularBaseFontWeight: String { get }
    var BodyXsRegularBaseLetterSpacing: Int { get }
    var BodyXsRegularBaseLineHeight: Int { get }
    var BodyXsRegularNoneFontFamily: String { get }
    var BodyXsRegularNoneFontSize: Int { get }
    var BodyXsRegularNoneFontWeight: String { get }
    var BodyXsRegularNoneLetterSpacing: Int { get }
    var BodyXsRegularNoneLineHeight: Int { get }
    var BodyXsRegularTightFontFamily: String { get }
    var BodyXsRegularTightFontSize: Int { get }
    var BodyXsRegularTightFontWeight: String { get }
    var BodyXsRegularTightLetterSpacing: Int { get }
    var BodyXsRegularTightLineHeight: Int { get }
    var BodyXsSemiboldBaseFontFamily: String { get }
    var BodyXsSemiboldBaseFontSize: Int { get }
    var BodyXsSemiboldBaseFontWeight: String { get }
    var BodyXsSemiboldBaseLetterSpacing: Int { get }
    var BodyXsSemiboldBaseLineHeight: Int { get }
    var BodyXsSemiboldNoneFontFamily: String { get }
    var BodyXsSemiboldNoneFontSize: Int { get }
    var BodyXsSemiboldNoneFontWeight: String { get }
    var BodyXsSemiboldNoneLetterSpacing: Int { get }
    var BodyXsSemiboldNoneLineHeight: Int { get }
    var BodyXsSemiboldTightFontFamily: String { get }
    var BodyXsSemiboldTightFontSize: Int { get }
    var BodyXsSemiboldTightFontWeight: String { get }
    var BodyXsSemiboldTightLetterSpacing: Int { get }
    var BodyXsSemiboldTightLineHeight: Int { get }
    var ElevationAbove1: DSShadow { get }
    var ElevationAbove2: DSShadow { get }
    var ElevationAbove3: DSShadow { get }
    var ElevationAbove4: DSShadow { get }
    var ElevationAbove5: DSShadow { get }
    var ElevationBelow1: DSShadow { get }
    var ElevationBelow2: DSShadow { get }
    var ElevationBelow3: DSShadow { get }
    var ElevationBelow4: DSShadow { get }
    var ElevationBelow5: DSShadow { get }
    var ElevationBlurRadiusBlur1: CGFloat { get }
    var ElevationBlurRadiusBlur2: CGFloat { get }
    var ElevationBlurRadiusBlur3: CGFloat { get }
    var ElevationBlurRadiusBlur4: CGFloat { get }
    var ElevationBlurRadiusBlur5: CGFloat { get }
    var ElevationHigh: Color { get }
    var ElevationHighest: Color { get }
    var ElevationLow: Color { get }
    var ElevationLowest: Color { get }
    var ElevationMed: Color { get }
    var ElevationPositionX1: CGFloat { get }
    var ElevationPositionX2: CGFloat { get }
    var ElevationPositionX3: CGFloat { get }
    var ElevationPositionX4: CGFloat { get }
    var ElevationPositionX5: CGFloat { get }
    var ElevationPositionY1: CGFloat { get }
    var ElevationPositionY2: CGFloat { get }
    var ElevationPositionY3: CGFloat { get }
    var ElevationPositionY4: CGFloat { get }
    var ElevationPositionY5: CGFloat { get }
    var FontFamilyDisplay: String { get }
    var FontFamilyInformational: String { get }
    var FontLetterSpacingBase: CGFloat { get }
    var FontLetterSpacingNlarge: CGFloat { get }
    var FontLetterSpacingNsmall: CGFloat { get }
    var FontLetterSpacingPlarge: CGFloat { get }
    var FontLetterSpacingPsmall: CGFloat { get }
    var FontLineHeightBase: CGFloat { get }
    var FontLineHeightNone: CGFloat { get }
    var FontLineHeightTight: CGFloat { get }
    var FontSizeBodyLg: CGFloat { get }
    var FontSizeBodyMd: CGFloat { get }
    var FontSizeBodySm: CGFloat { get }
    var FontSizeBodyXl: CGFloat { get }
    var FontSizeBodyXs: CGFloat { get }
    var FontSizeCaption: CGFloat { get }
    var FontSizeH1: CGFloat { get }
    var FontSizeH2: CGFloat { get }
    var FontSizeH3: CGFloat { get }
    var FontSizeH4: CGFloat { get }
    var FontSizeH5: CGFloat { get }
    var FontSizeH6: CGFloat { get }
    var FontSizeHero1: CGFloat { get }
    var FontSizeHero2: CGFloat { get }
    var FontSizeHero3: CGFloat { get }
    var FontSizeHero4: CGFloat { get }
    var FontSizeHero5: CGFloat { get }
    var FontWeightBodyBold: String { get }
    var FontWeightBodyLight: String { get }
    var FontWeightBodyMedium: String { get }
    var FontWeightBodyRegular: String { get }
    var FontWeightBodySemibold: String { get }
    var FontWeightCondensedBold: CGFloat { get }
    var FontWeightCondensedRegular: CGFloat { get }
    var FontWeightCondensedSemibold: CGFloat { get }
    var FontWeightHeadingBold: String { get }
    var FontWeightHeadingExtrabold: String { get }
    var FontWeightHeadingSemibold: String { get }
    var GradientBrandPrimary: LinearGradient { get }
    var GradientBrandSecondary: LinearGradient { get }
    var GradientSurfaceSubtle: LinearGradient { get }
    var HeadingH1ExtraboldBaseFontFamily: String { get }
    var HeadingH1ExtraboldBaseFontSize: Int { get }
    var HeadingH1ExtraboldBaseFontWeight: String { get }
    var HeadingH1ExtraboldBaseLetterSpacing: Int { get }
    var HeadingH1ExtraboldBaseLineHeight: Int { get }
    var HeadingH1ExtraboldNoneFontFamily: String { get }
    var HeadingH1ExtraboldNoneFontSize: Int { get }
    var HeadingH1ExtraboldNoneFontWeight: String { get }
    var HeadingH1ExtraboldNoneLetterSpacing: Int { get }
    var HeadingH1ExtraboldNoneLineHeight: Int { get }
    var HeadingH1ExtraboldTightFontFamily: String { get }
    var HeadingH1ExtraboldTightFontSize: Int { get }
    var HeadingH1ExtraboldTightFontWeight: String { get }
    var HeadingH1ExtraboldTightLetterSpacing: Int { get }
    var HeadingH1ExtraboldTightLineHeight: Int { get }
    var HeadingH1SemiboldBaseFontFamily: String { get }
    var HeadingH1SemiboldBaseFontSize: Int { get }
    var HeadingH1SemiboldBaseFontWeight: String { get }
    var HeadingH1SemiboldBaseLetterSpacing: Int { get }
    var HeadingH1SemiboldBaseLineHeight: Int { get }
    var HeadingH1SemiboldNoneFontFamily: String { get }
    var HeadingH1SemiboldNoneFontSize: Int { get }
    var HeadingH1SemiboldNoneFontWeight: String { get }
    var HeadingH1SemiboldNoneLetterSpacing: Int { get }
    var HeadingH1SemiboldNoneLineHeight: Int { get }
    var HeadingH1SemiboldTightFontFamily: String { get }
    var HeadingH1SemiboldTightFontSize: Int { get }
    var HeadingH1SemiboldTightFontWeight: String { get }
    var HeadingH1SemiboldTightLetterSpacing: Int { get }
    var HeadingH1SemiboldTightLineHeight: Int { get }
    var HeadingH2ExtraboldBaseFontFamily: String { get }
    var HeadingH2ExtraboldBaseFontSize: Int { get }
    var HeadingH2ExtraboldBaseFontWeight: String { get }
    var HeadingH2ExtraboldBaseLetterSpacing: Int { get }
    var HeadingH2ExtraboldBaseLineHeight: Int { get }
    var HeadingH2ExtraboldNoneFontFamily: String { get }
    var HeadingH2ExtraboldNoneFontSize: Int { get }
    var HeadingH2ExtraboldNoneFontWeight: String { get }
    var HeadingH2ExtraboldNoneLetterSpacing: Int { get }
    var HeadingH2ExtraboldNoneLineHeight: Int { get }
    var HeadingH2ExtraboldTightFontFamily: String { get }
    var HeadingH2ExtraboldTightFontSize: Int { get }
    var HeadingH2ExtraboldTightFontWeight: String { get }
    var HeadingH2ExtraboldTightLetterSpacing: Int { get }
    var HeadingH2ExtraboldTightLineHeight: Int { get }
    var HeadingH2SemiboldBaseFontFamily: String { get }
    var HeadingH2SemiboldBaseFontSize: Int { get }
    var HeadingH2SemiboldBaseFontWeight: String { get }
    var HeadingH2SemiboldBaseLetterSpacing: Int { get }
    var HeadingH2SemiboldBaseLineHeight: Int { get }
    var HeadingH2SemiboldNoneFontFamily: String { get }
    var HeadingH2SemiboldNoneFontSize: Int { get }
    var HeadingH2SemiboldNoneFontWeight: String { get }
    var HeadingH2SemiboldNoneLetterSpacing: Int { get }
    var HeadingH2SemiboldNoneLineHeight: Int { get }
    var HeadingH2SemiboldTightFontFamily: String { get }
    var HeadingH2SemiboldTightFontSize: Int { get }
    var HeadingH2SemiboldTightFontWeight: String { get }
    var HeadingH2SemiboldTightLetterSpacing: Int { get }
    var HeadingH2SemiboldTightLineHeight: Int { get }
    var HeadingH3ExtraboldBaseFontFamily: String { get }
    var HeadingH3ExtraboldBaseFontSize: Int { get }
    var HeadingH3ExtraboldBaseFontWeight: String { get }
    var HeadingH3ExtraboldBaseLetterSpacing: Int { get }
    var HeadingH3ExtraboldBaseLineHeight: Int { get }
    var HeadingH3ExtraboldNoneFontFamily: String { get }
    var HeadingH3ExtraboldNoneFontSize: Int { get }
    var HeadingH3ExtraboldNoneFontWeight: String { get }
    var HeadingH3ExtraboldNoneLetterSpacing: Int { get }
    var HeadingH3ExtraboldNoneLineHeight: Int { get }
    var HeadingH3ExtraboldTightFontFamily: String { get }
    var HeadingH3ExtraboldTightFontSize: Int { get }
    var HeadingH3ExtraboldTightFontWeight: String { get }
    var HeadingH3ExtraboldTightLetterSpacing: Int { get }
    var HeadingH3ExtraboldTightLineHeight: Int { get }
    var HeadingH3SemiboldBaseFontFamily: String { get }
    var HeadingH3SemiboldBaseFontSize: Int { get }
    var HeadingH3SemiboldBaseFontWeight: String { get }
    var HeadingH3SemiboldBaseLetterSpacing: Int { get }
    var HeadingH3SemiboldBaseLineHeight: Int { get }
    var HeadingH3SemiboldNoneFontFamily: String { get }
    var HeadingH3SemiboldNoneFontSize: Int { get }
    var HeadingH3SemiboldNoneFontWeight: String { get }
    var HeadingH3SemiboldNoneLetterSpacing: Int { get }
    var HeadingH3SemiboldNoneLineHeight: Int { get }
    var HeadingH3SemiboldTightFontFamily: String { get }
    var HeadingH3SemiboldTightFontSize: Int { get }
    var HeadingH3SemiboldTightFontWeight: String { get }
    var HeadingH3SemiboldTightLetterSpacing: Int { get }
    var HeadingH3SemiboldTightLineHeight: Int { get }
    var HeadingH4ExtraboldBaseFontFamily: String { get }
    var HeadingH4ExtraboldBaseFontSize: Int { get }
    var HeadingH4ExtraboldBaseFontWeight: String { get }
    var HeadingH4ExtraboldBaseLetterSpacing: Int { get }
    var HeadingH4ExtraboldBaseLineHeight: Int { get }
    var HeadingH4ExtraboldNoneFontFamily: String { get }
    var HeadingH4ExtraboldNoneFontSize: Int { get }
    var HeadingH4ExtraboldNoneFontWeight: String { get }
    var HeadingH4ExtraboldNoneLetterSpacing: Int { get }
    var HeadingH4ExtraboldNoneLineHeight: Int { get }
    var HeadingH4ExtraboldTightFontFamily: String { get }
    var HeadingH4ExtraboldTightFontSize: Int { get }
    var HeadingH4ExtraboldTightFontWeight: String { get }
    var HeadingH4ExtraboldTightLetterSpacing: Int { get }
    var HeadingH4ExtraboldTightLineHeight: Int { get }
    var HeadingH4SemiboldBaseFontFamily: String { get }
    var HeadingH4SemiboldBaseFontSize: Int { get }
    var HeadingH4SemiboldBaseFontWeight: String { get }
    var HeadingH4SemiboldBaseLetterSpacing: Int { get }
    var HeadingH4SemiboldBaseLineHeight: Int { get }
    var HeadingH4SemiboldNoneFontFamily: String { get }
    var HeadingH4SemiboldNoneFontSize: Int { get }
    var HeadingH4SemiboldNoneFontWeight: String { get }
    var HeadingH4SemiboldNoneLetterSpacing: Int { get }
    var HeadingH4SemiboldNoneLineHeight: Int { get }
    var HeadingH4SemiboldTightFontFamily: String { get }
    var HeadingH4SemiboldTightFontSize: Int { get }
    var HeadingH4SemiboldTightFontWeight: String { get }
    var HeadingH4SemiboldTightLetterSpacing: Int { get }
    var HeadingH4SemiboldTightLineHeight: Int { get }
    var HeadingH5ExtraboldBaseFontFamily: String { get }
    var HeadingH5ExtraboldBaseFontSize: Int { get }
    var HeadingH5ExtraboldBaseFontWeight: String { get }
    var HeadingH5ExtraboldBaseLetterSpacing: Int { get }
    var HeadingH5ExtraboldBaseLineHeight: Int { get }
    var HeadingH5ExtraboldNoneFontFamily: String { get }
    var HeadingH5ExtraboldNoneFontSize: Int { get }
    var HeadingH5ExtraboldNoneFontWeight: String { get }
    var HeadingH5ExtraboldNoneLetterSpacing: Int { get }
    var HeadingH5ExtraboldNoneLineHeight: Int { get }
    var HeadingH5ExtraboldTightFontFamily: String { get }
    var HeadingH5ExtraboldTightFontSize: Int { get }
    var HeadingH5ExtraboldTightFontWeight: String { get }
    var HeadingH5ExtraboldTightLetterSpacing: Int { get }
    var HeadingH5ExtraboldTightLineHeight: Int { get }
    var HeadingH5SemiboldBaseFontFamily: String { get }
    var HeadingH5SemiboldBaseFontSize: Int { get }
    var HeadingH5SemiboldBaseFontWeight: String { get }
    var HeadingH5SemiboldBaseLetterSpacing: Int { get }
    var HeadingH5SemiboldBaseLineHeight: Int { get }
    var HeadingH5SemiboldNoneFontFamily: String { get }
    var HeadingH5SemiboldNoneFontSize: Int { get }
    var HeadingH5SemiboldNoneFontWeight: String { get }
    var HeadingH5SemiboldNoneLetterSpacing: Int { get }
    var HeadingH5SemiboldNoneLineHeight: Int { get }
    var HeadingH5SemiboldTightFontFamily: String { get }
    var HeadingH5SemiboldTightFontSize: Int { get }
    var HeadingH5SemiboldTightFontWeight: String { get }
    var HeadingH5SemiboldTightLetterSpacing: Int { get }
    var HeadingH5SemiboldTightLineHeight: Int { get }
    var HeadingH6ExtraboldBaseFontFamily: String { get }
    var HeadingH6ExtraboldBaseFontSize: Int { get }
    var HeadingH6ExtraboldBaseFontWeight: String { get }
    var HeadingH6ExtraboldBaseLetterSpacing: Int { get }
    var HeadingH6ExtraboldBaseLineHeight: Int { get }
    var HeadingH6ExtraboldNoneFontFamily: String { get }
    var HeadingH6ExtraboldNoneFontSize: Int { get }
    var HeadingH6ExtraboldNoneFontWeight: String { get }
    var HeadingH6ExtraboldNoneLetterSpacing: Int { get }
    var HeadingH6ExtraboldNoneLineHeight: Int { get }
    var HeadingH6ExtraboldTightFontFamily: String { get }
    var HeadingH6ExtraboldTightFontSize: Int { get }
    var HeadingH6ExtraboldTightFontWeight: String { get }
    var HeadingH6ExtraboldTightLetterSpacing: Int { get }
    var HeadingH6ExtraboldTightLineHeight: Int { get }
    var HeadingH6SemiboldBaseFontFamily: String { get }
    var HeadingH6SemiboldBaseFontSize: Int { get }
    var HeadingH6SemiboldBaseFontWeight: String { get }
    var HeadingH6SemiboldBaseLetterSpacing: Int { get }
    var HeadingH6SemiboldBaseLineHeight: Int { get }
    var HeadingH6SemiboldNoneFontFamily: String { get }
    var HeadingH6SemiboldNoneFontSize: Int { get }
    var HeadingH6SemiboldNoneFontWeight: String { get }
    var HeadingH6SemiboldNoneLetterSpacing: Int { get }
    var HeadingH6SemiboldNoneLineHeight: Int { get }
    var HeadingH6SemiboldTightFontFamily: String { get }
    var HeadingH6SemiboldTightFontSize: Int { get }
    var HeadingH6SemiboldTightFontWeight: String { get }
    var HeadingH6SemiboldTightLetterSpacing: Int { get }
    var HeadingH6SemiboldTightLineHeight: Int { get }
    var Radius: CGFloat { get }
    var Radius0: CGFloat { get }
    var Radius1: CGFloat { get }
    var Radius10: CGFloat { get }
    var Radius11: CGFloat { get }
    var Radius12: CGFloat { get }
    var Radius13: CGFloat { get }
    var Radius14: CGFloat { get }
    var Radius15: CGFloat { get }
    var Radius16: CGFloat { get }
    var Radius17: CGFloat { get }
    var Radius18: CGFloat { get }
    var Radius19: CGFloat { get }
    var Radius2: CGFloat { get }
    var Radius20: CGFloat { get }
    var Radius3: CGFloat { get }
    var Radius4: CGFloat { get }
    var Radius5: CGFloat { get }
    var Radius6: CGFloat { get }
    var Radius7: CGFloat { get }
    var Radius8: CGFloat { get }
    var Radius9: CGFloat { get }
    var Radius999: CGFloat { get }
    var Spacing0: CGFloat { get }
    var Spacing1: CGFloat { get }
    var Spacing10: CGFloat { get }
    var Spacing11: CGFloat { get }
    var Spacing12: CGFloat { get }
    var Spacing13: CGFloat { get }
    var Spacing14: CGFloat { get }
    var Spacing15: CGFloat { get }
    var Spacing16: CGFloat { get }
    var Spacing17: CGFloat { get }
    var Spacing18: CGFloat { get }
    var Spacing19: CGFloat { get }
    var Spacing1px: CGFloat { get }
    var Spacing2: CGFloat { get }
    var Spacing20: CGFloat { get }
    var Spacing21: CGFloat { get }
    var Spacing22: CGFloat { get }
    var Spacing23: CGFloat { get }
    var Spacing24: CGFloat { get }
    var Spacing25: CGFloat { get }
    var Spacing26: CGFloat { get }
    var Spacing27: CGFloat { get }
    var Spacing28: CGFloat { get }
    var Spacing29: CGFloat { get }
    var Spacing2Tba: CGFloat { get }
    var Spacing2px: CGFloat { get }
    var Spacing3: CGFloat { get }
    var Spacing30: CGFloat { get }
    var Spacing31: CGFloat { get }
    var Spacing32: CGFloat { get }
    var Spacing33: CGFloat { get }
    var Spacing34: CGFloat { get }
    var Spacing35: CGFloat { get }
    var Spacing36: CGFloat { get }
    var Spacing4: CGFloat { get }
    var Spacing5: CGFloat { get }
    var Spacing6: CGFloat { get }
    var Spacing6px: CGFloat { get }
    var Spacing7: CGFloat { get }
    var Spacing8: CGFloat { get }
    var Spacing9: CGFloat { get }
}

// MARK: - Light Theme Conformance

extension TokensCoreLight: CoreTokensProvider {
    public var BodyLgBoldBaseFontFamily: String { Self.BodyLgBoldBaseFontFamily }
    public var BodyLgBoldBaseFontSize: Int { Self.BodyLgBoldBaseFontSize }
    public var BodyLgBoldBaseFontWeight: String { Self.BodyLgBoldBaseFontWeight }
    public var BodyLgBoldBaseLetterSpacing: Int { Self.BodyLgBoldBaseLetterSpacing }
    public var BodyLgBoldBaseLineHeight: Int { Self.BodyLgBoldBaseLineHeight }
    public var BodyLgBoldNoneFontFamily: String { Self.BodyLgBoldNoneFontFamily }
    public var BodyLgBoldNoneFontSize: Int { Self.BodyLgBoldNoneFontSize }
    public var BodyLgBoldNoneFontWeight: String { Self.BodyLgBoldNoneFontWeight }
    public var BodyLgBoldNoneLetterSpacing: Int { Self.BodyLgBoldNoneLetterSpacing }
    public var BodyLgBoldNoneLineHeight: Int { Self.BodyLgBoldNoneLineHeight }
    public var BodyLgBoldTightFontFamily: String { Self.BodyLgBoldTightFontFamily }
    public var BodyLgBoldTightFontSize: Int { Self.BodyLgBoldTightFontSize }
    public var BodyLgBoldTightFontWeight: String { Self.BodyLgBoldTightFontWeight }
    public var BodyLgBoldTightLetterSpacing: Int { Self.BodyLgBoldTightLetterSpacing }
    public var BodyLgBoldTightLineHeight: Int { Self.BodyLgBoldTightLineHeight }
    public var BodyLgRegularBaseFontFamily: String { Self.BodyLgRegularBaseFontFamily }
    public var BodyLgRegularBaseFontSize: Int { Self.BodyLgRegularBaseFontSize }
    public var BodyLgRegularBaseFontWeight: String { Self.BodyLgRegularBaseFontWeight }
    public var BodyLgRegularBaseLetterSpacing: Int { Self.BodyLgRegularBaseLetterSpacing }
    public var BodyLgRegularBaseLineHeight: Int { Self.BodyLgRegularBaseLineHeight }
    public var BodyLgRegularNoneFontFamily: String { Self.BodyLgRegularNoneFontFamily }
    public var BodyLgRegularNoneFontSize: Int { Self.BodyLgRegularNoneFontSize }
    public var BodyLgRegularNoneFontWeight: String { Self.BodyLgRegularNoneFontWeight }
    public var BodyLgRegularNoneLetterSpacing: Int { Self.BodyLgRegularNoneLetterSpacing }
    public var BodyLgRegularNoneLineHeight: Int { Self.BodyLgRegularNoneLineHeight }
    public var BodyLgRegularTightFontFamily: String { Self.BodyLgRegularTightFontFamily }
    public var BodyLgRegularTightFontSize: Int { Self.BodyLgRegularTightFontSize }
    public var BodyLgRegularTightFontWeight: String { Self.BodyLgRegularTightFontWeight }
    public var BodyLgRegularTightLetterSpacing: Int { Self.BodyLgRegularTightLetterSpacing }
    public var BodyLgRegularTightLineHeight: Int { Self.BodyLgRegularTightLineHeight }
    public var BodyLgSemiboldBaseFontFamily: String { Self.BodyLgSemiboldBaseFontFamily }
    public var BodyLgSemiboldBaseFontSize: Int { Self.BodyLgSemiboldBaseFontSize }
    public var BodyLgSemiboldBaseFontWeight: String { Self.BodyLgSemiboldBaseFontWeight }
    public var BodyLgSemiboldBaseLetterSpacing: Int { Self.BodyLgSemiboldBaseLetterSpacing }
    public var BodyLgSemiboldBaseLineHeight: Int { Self.BodyLgSemiboldBaseLineHeight }
    public var BodyLgSemiboldNoneFontFamily: String { Self.BodyLgSemiboldNoneFontFamily }
    public var BodyLgSemiboldNoneFontSize: Int { Self.BodyLgSemiboldNoneFontSize }
    public var BodyLgSemiboldNoneFontWeight: String { Self.BodyLgSemiboldNoneFontWeight }
    public var BodyLgSemiboldNoneLetterSpacing: Int { Self.BodyLgSemiboldNoneLetterSpacing }
    public var BodyLgSemiboldNoneLineHeight: Int { Self.BodyLgSemiboldNoneLineHeight }
    public var BodyLgSemiboldTightFontFamily: String { Self.BodyLgSemiboldTightFontFamily }
    public var BodyLgSemiboldTightFontSize: Int { Self.BodyLgSemiboldTightFontSize }
    public var BodyLgSemiboldTightFontWeight: String { Self.BodyLgSemiboldTightFontWeight }
    public var BodyLgSemiboldTightLetterSpacing: Int { Self.BodyLgSemiboldTightLetterSpacing }
    public var BodyLgSemiboldTightLineHeight: Int { Self.BodyLgSemiboldTightLineHeight }
    public var BodyMdBoldBaseFontFamily: String { Self.BodyMdBoldBaseFontFamily }
    public var BodyMdBoldBaseFontSize: Int { Self.BodyMdBoldBaseFontSize }
    public var BodyMdBoldBaseFontWeight: String { Self.BodyMdBoldBaseFontWeight }
    public var BodyMdBoldBaseLetterSpacing: Int { Self.BodyMdBoldBaseLetterSpacing }
    public var BodyMdBoldBaseLineHeight: Int { Self.BodyMdBoldBaseLineHeight }
    public var BodyMdBoldNoneFontFamily: String { Self.BodyMdBoldNoneFontFamily }
    public var BodyMdBoldNoneFontSize: Int { Self.BodyMdBoldNoneFontSize }
    public var BodyMdBoldNoneFontWeight: String { Self.BodyMdBoldNoneFontWeight }
    public var BodyMdBoldNoneLetterSpacing: Int { Self.BodyMdBoldNoneLetterSpacing }
    public var BodyMdBoldNoneLineHeight: Int { Self.BodyMdBoldNoneLineHeight }
    public var BodyMdBoldTightFontFamily: String { Self.BodyMdBoldTightFontFamily }
    public var BodyMdBoldTightFontSize: Int { Self.BodyMdBoldTightFontSize }
    public var BodyMdBoldTightFontWeight: String { Self.BodyMdBoldTightFontWeight }
    public var BodyMdBoldTightLetterSpacing: Int { Self.BodyMdBoldTightLetterSpacing }
    public var BodyMdBoldTightLineHeight: Int { Self.BodyMdBoldTightLineHeight }
    public var BodyMdRegularBaseFontFamily: String { Self.BodyMdRegularBaseFontFamily }
    public var BodyMdRegularBaseFontSize: Int { Self.BodyMdRegularBaseFontSize }
    public var BodyMdRegularBaseFontWeight: String { Self.BodyMdRegularBaseFontWeight }
    public var BodyMdRegularBaseLetterSpacing: Int { Self.BodyMdRegularBaseLetterSpacing }
    public var BodyMdRegularBaseLineHeight: Int { Self.BodyMdRegularBaseLineHeight }
    public var BodyMdRegularNoneFontFamily: String { Self.BodyMdRegularNoneFontFamily }
    public var BodyMdRegularNoneFontSize: Int { Self.BodyMdRegularNoneFontSize }
    public var BodyMdRegularNoneFontWeight: String { Self.BodyMdRegularNoneFontWeight }
    public var BodyMdRegularNoneLetterSpacing: Int { Self.BodyMdRegularNoneLetterSpacing }
    public var BodyMdRegularNoneLineHeight: Int { Self.BodyMdRegularNoneLineHeight }
    public var BodyMdRegularTightFontFamily: String { Self.BodyMdRegularTightFontFamily }
    public var BodyMdRegularTightFontSize: Int { Self.BodyMdRegularTightFontSize }
    public var BodyMdRegularTightFontWeight: String { Self.BodyMdRegularTightFontWeight }
    public var BodyMdRegularTightLetterSpacing: Int { Self.BodyMdRegularTightLetterSpacing }
    public var BodyMdRegularTightLineHeight: Int { Self.BodyMdRegularTightLineHeight }
    public var BodyMdSemiboldBaseFontFamily: String { Self.BodyMdSemiboldBaseFontFamily }
    public var BodyMdSemiboldBaseFontSize: Int { Self.BodyMdSemiboldBaseFontSize }
    public var BodyMdSemiboldBaseFontWeight: String { Self.BodyMdSemiboldBaseFontWeight }
    public var BodyMdSemiboldBaseLetterSpacing: Int { Self.BodyMdSemiboldBaseLetterSpacing }
    public var BodyMdSemiboldBaseLineHeight: Int { Self.BodyMdSemiboldBaseLineHeight }
    public var BodyMdSemiboldNoneFontFamily: String { Self.BodyMdSemiboldNoneFontFamily }
    public var BodyMdSemiboldNoneFontSize: Int { Self.BodyMdSemiboldNoneFontSize }
    public var BodyMdSemiboldNoneFontWeight: String { Self.BodyMdSemiboldNoneFontWeight }
    public var BodyMdSemiboldNoneLetterSpacing: Int { Self.BodyMdSemiboldNoneLetterSpacing }
    public var BodyMdSemiboldNoneLineHeight: Int { Self.BodyMdSemiboldNoneLineHeight }
    public var BodyMdSemiboldTightFontFamily: String { Self.BodyMdSemiboldTightFontFamily }
    public var BodyMdSemiboldTightFontSize: Int { Self.BodyMdSemiboldTightFontSize }
    public var BodyMdSemiboldTightFontWeight: String { Self.BodyMdSemiboldTightFontWeight }
    public var BodyMdSemiboldTightLetterSpacing: Int { Self.BodyMdSemiboldTightLetterSpacing }
    public var BodyMdSemiboldTightLineHeight: Int { Self.BodyMdSemiboldTightLineHeight }
    public var BodySmDefaultBoldBaseFontFamily: String { Self.BodySmDefaultBoldBaseFontFamily }
    public var BodySmDefaultBoldBaseFontSize: Int { Self.BodySmDefaultBoldBaseFontSize }
    public var BodySmDefaultBoldBaseFontWeight: String { Self.BodySmDefaultBoldBaseFontWeight }
    public var BodySmDefaultBoldBaseLetterSpacing: Int { Self.BodySmDefaultBoldBaseLetterSpacing }
    public var BodySmDefaultBoldBaseLineHeight: Int { Self.BodySmDefaultBoldBaseLineHeight }
    public var BodySmDefaultBoldNoneFontFamily: String { Self.BodySmDefaultBoldNoneFontFamily }
    public var BodySmDefaultBoldNoneFontSize: Int { Self.BodySmDefaultBoldNoneFontSize }
    public var BodySmDefaultBoldNoneFontWeight: String { Self.BodySmDefaultBoldNoneFontWeight }
    public var BodySmDefaultBoldNoneLetterSpacing: Int { Self.BodySmDefaultBoldNoneLetterSpacing }
    public var BodySmDefaultBoldNoneLineHeight: Int { Self.BodySmDefaultBoldNoneLineHeight }
    public var BodySmDefaultBoldTightFontFamily: String { Self.BodySmDefaultBoldTightFontFamily }
    public var BodySmDefaultBoldTightFontSize: Int { Self.BodySmDefaultBoldTightFontSize }
    public var BodySmDefaultBoldTightFontWeight: String { Self.BodySmDefaultBoldTightFontWeight }
    public var BodySmDefaultBoldTightLetterSpacing: Int { Self.BodySmDefaultBoldTightLetterSpacing }
    public var BodySmDefaultBoldTightLineHeight: Int { Self.BodySmDefaultBoldTightLineHeight }
    public var BodySmDefaultRegularBaseFontFamily: String { Self.BodySmDefaultRegularBaseFontFamily }
    public var BodySmDefaultRegularBaseFontSize: Int { Self.BodySmDefaultRegularBaseFontSize }
    public var BodySmDefaultRegularBaseFontWeight: String { Self.BodySmDefaultRegularBaseFontWeight }
    public var BodySmDefaultRegularBaseLetterSpacing: Int { Self.BodySmDefaultRegularBaseLetterSpacing }
    public var BodySmDefaultRegularBaseLineHeight: Int { Self.BodySmDefaultRegularBaseLineHeight }
    public var BodySmDefaultRegularNoneFontFamily: String { Self.BodySmDefaultRegularNoneFontFamily }
    public var BodySmDefaultRegularNoneFontSize: Int { Self.BodySmDefaultRegularNoneFontSize }
    public var BodySmDefaultRegularNoneFontWeight: String { Self.BodySmDefaultRegularNoneFontWeight }
    public var BodySmDefaultRegularNoneLetterSpacing: Int { Self.BodySmDefaultRegularNoneLetterSpacing }
    public var BodySmDefaultRegularNoneLineHeight: Int { Self.BodySmDefaultRegularNoneLineHeight }
    public var BodySmDefaultRegularTightFontFamily: String { Self.BodySmDefaultRegularTightFontFamily }
    public var BodySmDefaultRegularTightFontSize: Int { Self.BodySmDefaultRegularTightFontSize }
    public var BodySmDefaultRegularTightFontWeight: String { Self.BodySmDefaultRegularTightFontWeight }
    public var BodySmDefaultRegularTightLetterSpacing: Int { Self.BodySmDefaultRegularTightLetterSpacing }
    public var BodySmDefaultRegularTightLineHeight: Int { Self.BodySmDefaultRegularTightLineHeight }
    public var BodySmDefaultSemiboldBaseFontFamily: String { Self.BodySmDefaultSemiboldBaseFontFamily }
    public var BodySmDefaultSemiboldBaseFontSize: Int { Self.BodySmDefaultSemiboldBaseFontSize }
    public var BodySmDefaultSemiboldBaseFontWeight: String { Self.BodySmDefaultSemiboldBaseFontWeight }
    public var BodySmDefaultSemiboldBaseLetterSpacing: Int { Self.BodySmDefaultSemiboldBaseLetterSpacing }
    public var BodySmDefaultSemiboldBaseLineHeight: Int { Self.BodySmDefaultSemiboldBaseLineHeight }
    public var BodySmDefaultSemiboldNoneFontFamily: String { Self.BodySmDefaultSemiboldNoneFontFamily }
    public var BodySmDefaultSemiboldNoneFontSize: Int { Self.BodySmDefaultSemiboldNoneFontSize }
    public var BodySmDefaultSemiboldNoneFontWeight: String { Self.BodySmDefaultSemiboldNoneFontWeight }
    public var BodySmDefaultSemiboldNoneLetterSpacing: Int { Self.BodySmDefaultSemiboldNoneLetterSpacing }
    public var BodySmDefaultSemiboldNoneLineHeight: Int { Self.BodySmDefaultSemiboldNoneLineHeight }
    public var BodySmDefaultSemiboldTightFontFamily: String { Self.BodySmDefaultSemiboldTightFontFamily }
    public var BodySmDefaultSemiboldTightFontSize: Int { Self.BodySmDefaultSemiboldTightFontSize }
    public var BodySmDefaultSemiboldTightFontWeight: String { Self.BodySmDefaultSemiboldTightFontWeight }
    public var BodySmDefaultSemiboldTightLetterSpacing: Int { Self.BodySmDefaultSemiboldTightLetterSpacing }
    public var BodySmDefaultSemiboldTightLineHeight: Int { Self.BodySmDefaultSemiboldTightLineHeight }
    public var BodyXlBoldBaseFontFamily: String { Self.BodyXlBoldBaseFontFamily }
    public var BodyXlBoldBaseFontSize: Int { Self.BodyXlBoldBaseFontSize }
    public var BodyXlBoldBaseFontWeight: String { Self.BodyXlBoldBaseFontWeight }
    public var BodyXlBoldBaseLetterSpacing: Int { Self.BodyXlBoldBaseLetterSpacing }
    public var BodyXlBoldBaseLineHeight: Int { Self.BodyXlBoldBaseLineHeight }
    public var BodyXlBoldNoneFontFamily: String { Self.BodyXlBoldNoneFontFamily }
    public var BodyXlBoldNoneFontSize: Int { Self.BodyXlBoldNoneFontSize }
    public var BodyXlBoldNoneFontWeight: String { Self.BodyXlBoldNoneFontWeight }
    public var BodyXlBoldNoneLetterSpacing: Int { Self.BodyXlBoldNoneLetterSpacing }
    public var BodyXlBoldNoneLineHeight: Int { Self.BodyXlBoldNoneLineHeight }
    public var BodyXlBoldTightFontFamily: String { Self.BodyXlBoldTightFontFamily }
    public var BodyXlBoldTightFontSize: Int { Self.BodyXlBoldTightFontSize }
    public var BodyXlBoldTightFontWeight: String { Self.BodyXlBoldTightFontWeight }
    public var BodyXlBoldTightLetterSpacing: Int { Self.BodyXlBoldTightLetterSpacing }
    public var BodyXlBoldTightLineHeight: Int { Self.BodyXlBoldTightLineHeight }
    public var BodyXlRegularBaseFontFamily: String { Self.BodyXlRegularBaseFontFamily }
    public var BodyXlRegularBaseFontSize: Int { Self.BodyXlRegularBaseFontSize }
    public var BodyXlRegularBaseFontWeight: String { Self.BodyXlRegularBaseFontWeight }
    public var BodyXlRegularBaseLetterSpacing: Int { Self.BodyXlRegularBaseLetterSpacing }
    public var BodyXlRegularBaseLineHeight: Int { Self.BodyXlRegularBaseLineHeight }
    public var BodyXlRegularNoneFontFamily: String { Self.BodyXlRegularNoneFontFamily }
    public var BodyXlRegularNoneFontSize: Int { Self.BodyXlRegularNoneFontSize }
    public var BodyXlRegularNoneFontWeight: String { Self.BodyXlRegularNoneFontWeight }
    public var BodyXlRegularNoneLetterSpacing: Int { Self.BodyXlRegularNoneLetterSpacing }
    public var BodyXlRegularNoneLineHeight: Int { Self.BodyXlRegularNoneLineHeight }
    public var BodyXlRegularTightFontFamily: String { Self.BodyXlRegularTightFontFamily }
    public var BodyXlRegularTightFontSize: Int { Self.BodyXlRegularTightFontSize }
    public var BodyXlRegularTightFontWeight: String { Self.BodyXlRegularTightFontWeight }
    public var BodyXlRegularTightLetterSpacing: Int { Self.BodyXlRegularTightLetterSpacing }
    public var BodyXlRegularTightLineHeight: Int { Self.BodyXlRegularTightLineHeight }
    public var BodyXlSemiboldBaseFontFamily: String { Self.BodyXlSemiboldBaseFontFamily }
    public var BodyXlSemiboldBaseFontSize: Int { Self.BodyXlSemiboldBaseFontSize }
    public var BodyXlSemiboldBaseFontWeight: String { Self.BodyXlSemiboldBaseFontWeight }
    public var BodyXlSemiboldBaseLetterSpacing: Int { Self.BodyXlSemiboldBaseLetterSpacing }
    public var BodyXlSemiboldBaseLineHeight: Int { Self.BodyXlSemiboldBaseLineHeight }
    public var BodyXlSemiboldNoneFontFamily: String { Self.BodyXlSemiboldNoneFontFamily }
    public var BodyXlSemiboldNoneFontSize: Int { Self.BodyXlSemiboldNoneFontSize }
    public var BodyXlSemiboldNoneFontWeight: String { Self.BodyXlSemiboldNoneFontWeight }
    public var BodyXlSemiboldNoneLetterSpacing: Int { Self.BodyXlSemiboldNoneLetterSpacing }
    public var BodyXlSemiboldNoneLineHeight: Int { Self.BodyXlSemiboldNoneLineHeight }
    public var BodyXlSemiboldTightFontFamily: String { Self.BodyXlSemiboldTightFontFamily }
    public var BodyXlSemiboldTightFontSize: Int { Self.BodyXlSemiboldTightFontSize }
    public var BodyXlSemiboldTightFontWeight: String { Self.BodyXlSemiboldTightFontWeight }
    public var BodyXlSemiboldTightLetterSpacing: Int { Self.BodyXlSemiboldTightLetterSpacing }
    public var BodyXlSemiboldTightLineHeight: Int { Self.BodyXlSemiboldTightLineHeight }
    public var BodyXsBoldBaseFontFamily: String { Self.BodyXsBoldBaseFontFamily }
    public var BodyXsBoldBaseFontSize: Int { Self.BodyXsBoldBaseFontSize }
    public var BodyXsBoldBaseFontWeight: String { Self.BodyXsBoldBaseFontWeight }
    public var BodyXsBoldBaseLetterSpacing: Int { Self.BodyXsBoldBaseLetterSpacing }
    public var BodyXsBoldBaseLineHeight: Int { Self.BodyXsBoldBaseLineHeight }
    public var BodyXsBoldNoneFontFamily: String { Self.BodyXsBoldNoneFontFamily }
    public var BodyXsBoldNoneFontSize: Int { Self.BodyXsBoldNoneFontSize }
    public var BodyXsBoldNoneFontWeight: String { Self.BodyXsBoldNoneFontWeight }
    public var BodyXsBoldNoneLetterSpacing: Int { Self.BodyXsBoldNoneLetterSpacing }
    public var BodyXsBoldNoneLineHeight: Int { Self.BodyXsBoldNoneLineHeight }
    public var BodyXsBoldTightFontFamily: String { Self.BodyXsBoldTightFontFamily }
    public var BodyXsBoldTightFontSize: Int { Self.BodyXsBoldTightFontSize }
    public var BodyXsBoldTightFontWeight: String { Self.BodyXsBoldTightFontWeight }
    public var BodyXsBoldTightLetterSpacing: Int { Self.BodyXsBoldTightLetterSpacing }
    public var BodyXsBoldTightLineHeight: Int { Self.BodyXsBoldTightLineHeight }
    public var BodyXsRegularBaseFontFamily: String { Self.BodyXsRegularBaseFontFamily }
    public var BodyXsRegularBaseFontSize: Int { Self.BodyXsRegularBaseFontSize }
    public var BodyXsRegularBaseFontWeight: String { Self.BodyXsRegularBaseFontWeight }
    public var BodyXsRegularBaseLetterSpacing: Int { Self.BodyXsRegularBaseLetterSpacing }
    public var BodyXsRegularBaseLineHeight: Int { Self.BodyXsRegularBaseLineHeight }
    public var BodyXsRegularNoneFontFamily: String { Self.BodyXsRegularNoneFontFamily }
    public var BodyXsRegularNoneFontSize: Int { Self.BodyXsRegularNoneFontSize }
    public var BodyXsRegularNoneFontWeight: String { Self.BodyXsRegularNoneFontWeight }
    public var BodyXsRegularNoneLetterSpacing: Int { Self.BodyXsRegularNoneLetterSpacing }
    public var BodyXsRegularNoneLineHeight: Int { Self.BodyXsRegularNoneLineHeight }
    public var BodyXsRegularTightFontFamily: String { Self.BodyXsRegularTightFontFamily }
    public var BodyXsRegularTightFontSize: Int { Self.BodyXsRegularTightFontSize }
    public var BodyXsRegularTightFontWeight: String { Self.BodyXsRegularTightFontWeight }
    public var BodyXsRegularTightLetterSpacing: Int { Self.BodyXsRegularTightLetterSpacing }
    public var BodyXsRegularTightLineHeight: Int { Self.BodyXsRegularTightLineHeight }
    public var BodyXsSemiboldBaseFontFamily: String { Self.BodyXsSemiboldBaseFontFamily }
    public var BodyXsSemiboldBaseFontSize: Int { Self.BodyXsSemiboldBaseFontSize }
    public var BodyXsSemiboldBaseFontWeight: String { Self.BodyXsSemiboldBaseFontWeight }
    public var BodyXsSemiboldBaseLetterSpacing: Int { Self.BodyXsSemiboldBaseLetterSpacing }
    public var BodyXsSemiboldBaseLineHeight: Int { Self.BodyXsSemiboldBaseLineHeight }
    public var BodyXsSemiboldNoneFontFamily: String { Self.BodyXsSemiboldNoneFontFamily }
    public var BodyXsSemiboldNoneFontSize: Int { Self.BodyXsSemiboldNoneFontSize }
    public var BodyXsSemiboldNoneFontWeight: String { Self.BodyXsSemiboldNoneFontWeight }
    public var BodyXsSemiboldNoneLetterSpacing: Int { Self.BodyXsSemiboldNoneLetterSpacing }
    public var BodyXsSemiboldNoneLineHeight: Int { Self.BodyXsSemiboldNoneLineHeight }
    public var BodyXsSemiboldTightFontFamily: String { Self.BodyXsSemiboldTightFontFamily }
    public var BodyXsSemiboldTightFontSize: Int { Self.BodyXsSemiboldTightFontSize }
    public var BodyXsSemiboldTightFontWeight: String { Self.BodyXsSemiboldTightFontWeight }
    public var BodyXsSemiboldTightLetterSpacing: Int { Self.BodyXsSemiboldTightLetterSpacing }
    public var BodyXsSemiboldTightLineHeight: Int { Self.BodyXsSemiboldTightLineHeight }
    public var ElevationAbove1: DSShadow { Self.ElevationAbove1 }
    public var ElevationAbove2: DSShadow { Self.ElevationAbove2 }
    public var ElevationAbove3: DSShadow { Self.ElevationAbove3 }
    public var ElevationAbove4: DSShadow { Self.ElevationAbove4 }
    public var ElevationAbove5: DSShadow { Self.ElevationAbove5 }
    public var ElevationBelow1: DSShadow { Self.ElevationBelow1 }
    public var ElevationBelow2: DSShadow { Self.ElevationBelow2 }
    public var ElevationBelow3: DSShadow { Self.ElevationBelow3 }
    public var ElevationBelow4: DSShadow { Self.ElevationBelow4 }
    public var ElevationBelow5: DSShadow { Self.ElevationBelow5 }
    public var ElevationBlurRadiusBlur1: CGFloat { Self.ElevationBlurRadiusBlur1 }
    public var ElevationBlurRadiusBlur2: CGFloat { Self.ElevationBlurRadiusBlur2 }
    public var ElevationBlurRadiusBlur3: CGFloat { Self.ElevationBlurRadiusBlur3 }
    public var ElevationBlurRadiusBlur4: CGFloat { Self.ElevationBlurRadiusBlur4 }
    public var ElevationBlurRadiusBlur5: CGFloat { Self.ElevationBlurRadiusBlur5 }
    public var ElevationHigh: Color { Self.ElevationHigh }
    public var ElevationHighest: Color { Self.ElevationHighest }
    public var ElevationLow: Color { Self.ElevationLow }
    public var ElevationLowest: Color { Self.ElevationLowest }
    public var ElevationMed: Color { Self.ElevationMed }
    public var ElevationPositionX1: CGFloat { Self.ElevationPositionX1 }
    public var ElevationPositionX2: CGFloat { Self.ElevationPositionX2 }
    public var ElevationPositionX3: CGFloat { Self.ElevationPositionX3 }
    public var ElevationPositionX4: CGFloat { Self.ElevationPositionX4 }
    public var ElevationPositionX5: CGFloat { Self.ElevationPositionX5 }
    public var ElevationPositionY1: CGFloat { Self.ElevationPositionY1 }
    public var ElevationPositionY2: CGFloat { Self.ElevationPositionY2 }
    public var ElevationPositionY3: CGFloat { Self.ElevationPositionY3 }
    public var ElevationPositionY4: CGFloat { Self.ElevationPositionY4 }
    public var ElevationPositionY5: CGFloat { Self.ElevationPositionY5 }
    public var FontFamilyDisplay: String { Self.FontFamilyDisplay }
    public var FontFamilyInformational: String { Self.FontFamilyInformational }
    public var FontLetterSpacingBase: CGFloat { Self.FontLetterSpacingBase }
    public var FontLetterSpacingNlarge: CGFloat { Self.FontLetterSpacingNlarge }
    public var FontLetterSpacingNsmall: CGFloat { Self.FontLetterSpacingNsmall }
    public var FontLetterSpacingPlarge: CGFloat { Self.FontLetterSpacingPlarge }
    public var FontLetterSpacingPsmall: CGFloat { Self.FontLetterSpacingPsmall }
    public var FontLineHeightBase: CGFloat { Self.FontLineHeightBase }
    public var FontLineHeightNone: CGFloat { Self.FontLineHeightNone }
    public var FontLineHeightTight: CGFloat { Self.FontLineHeightTight }
    public var FontSizeBodyLg: CGFloat { Self.FontSizeBodyLg }
    public var FontSizeBodyMd: CGFloat { Self.FontSizeBodyMd }
    public var FontSizeBodySm: CGFloat { Self.FontSizeBodySm }
    public var FontSizeBodyXl: CGFloat { Self.FontSizeBodyXl }
    public var FontSizeBodyXs: CGFloat { Self.FontSizeBodyXs }
    public var FontSizeCaption: CGFloat { Self.FontSizeCaption }
    public var FontSizeH1: CGFloat { Self.FontSizeH1 }
    public var FontSizeH2: CGFloat { Self.FontSizeH2 }
    public var FontSizeH3: CGFloat { Self.FontSizeH3 }
    public var FontSizeH4: CGFloat { Self.FontSizeH4 }
    public var FontSizeH5: CGFloat { Self.FontSizeH5 }
    public var FontSizeH6: CGFloat { Self.FontSizeH6 }
    public var FontSizeHero1: CGFloat { Self.FontSizeHero1 }
    public var FontSizeHero2: CGFloat { Self.FontSizeHero2 }
    public var FontSizeHero3: CGFloat { Self.FontSizeHero3 }
    public var FontSizeHero4: CGFloat { Self.FontSizeHero4 }
    public var FontSizeHero5: CGFloat { Self.FontSizeHero5 }
    public var FontWeightBodyBold: String { Self.FontWeightBodyBold }
    public var FontWeightBodyLight: String { Self.FontWeightBodyLight }
    public var FontWeightBodyMedium: String { Self.FontWeightBodyMedium }
    public var FontWeightBodyRegular: String { Self.FontWeightBodyRegular }
    public var FontWeightBodySemibold: String { Self.FontWeightBodySemibold }
    public var FontWeightCondensedBold: CGFloat { Self.FontWeightCondensedBold }
    public var FontWeightCondensedRegular: CGFloat { Self.FontWeightCondensedRegular }
    public var FontWeightCondensedSemibold: CGFloat { Self.FontWeightCondensedSemibold }
    public var FontWeightHeadingBold: String { Self.FontWeightHeadingBold }
    public var FontWeightHeadingExtrabold: String { Self.FontWeightHeadingExtrabold }
    public var FontWeightHeadingSemibold: String { Self.FontWeightHeadingSemibold }
    public var GradientBrandPrimary: LinearGradient { Self.GradientBrandPrimary }
    public var GradientBrandSecondary: LinearGradient { Self.GradientBrandSecondary }
    public var GradientSurfaceSubtle: LinearGradient { Self.GradientSurfaceSubtle }
    public var HeadingH1ExtraboldBaseFontFamily: String { Self.HeadingH1ExtraboldBaseFontFamily }
    public var HeadingH1ExtraboldBaseFontSize: Int { Self.HeadingH1ExtraboldBaseFontSize }
    public var HeadingH1ExtraboldBaseFontWeight: String { Self.HeadingH1ExtraboldBaseFontWeight }
    public var HeadingH1ExtraboldBaseLetterSpacing: Int { Self.HeadingH1ExtraboldBaseLetterSpacing }
    public var HeadingH1ExtraboldBaseLineHeight: Int { Self.HeadingH1ExtraboldBaseLineHeight }
    public var HeadingH1ExtraboldNoneFontFamily: String { Self.HeadingH1ExtraboldNoneFontFamily }
    public var HeadingH1ExtraboldNoneFontSize: Int { Self.HeadingH1ExtraboldNoneFontSize }
    public var HeadingH1ExtraboldNoneFontWeight: String { Self.HeadingH1ExtraboldNoneFontWeight }
    public var HeadingH1ExtraboldNoneLetterSpacing: Int { Self.HeadingH1ExtraboldNoneLetterSpacing }
    public var HeadingH1ExtraboldNoneLineHeight: Int { Self.HeadingH1ExtraboldNoneLineHeight }
    public var HeadingH1ExtraboldTightFontFamily: String { Self.HeadingH1ExtraboldTightFontFamily }
    public var HeadingH1ExtraboldTightFontSize: Int { Self.HeadingH1ExtraboldTightFontSize }
    public var HeadingH1ExtraboldTightFontWeight: String { Self.HeadingH1ExtraboldTightFontWeight }
    public var HeadingH1ExtraboldTightLetterSpacing: Int { Self.HeadingH1ExtraboldTightLetterSpacing }
    public var HeadingH1ExtraboldTightLineHeight: Int { Self.HeadingH1ExtraboldTightLineHeight }
    public var HeadingH1SemiboldBaseFontFamily: String { Self.HeadingH1SemiboldBaseFontFamily }
    public var HeadingH1SemiboldBaseFontSize: Int { Self.HeadingH1SemiboldBaseFontSize }
    public var HeadingH1SemiboldBaseFontWeight: String { Self.HeadingH1SemiboldBaseFontWeight }
    public var HeadingH1SemiboldBaseLetterSpacing: Int { Self.HeadingH1SemiboldBaseLetterSpacing }
    public var HeadingH1SemiboldBaseLineHeight: Int { Self.HeadingH1SemiboldBaseLineHeight }
    public var HeadingH1SemiboldNoneFontFamily: String { Self.HeadingH1SemiboldNoneFontFamily }
    public var HeadingH1SemiboldNoneFontSize: Int { Self.HeadingH1SemiboldNoneFontSize }
    public var HeadingH1SemiboldNoneFontWeight: String { Self.HeadingH1SemiboldNoneFontWeight }
    public var HeadingH1SemiboldNoneLetterSpacing: Int { Self.HeadingH1SemiboldNoneLetterSpacing }
    public var HeadingH1SemiboldNoneLineHeight: Int { Self.HeadingH1SemiboldNoneLineHeight }
    public var HeadingH1SemiboldTightFontFamily: String { Self.HeadingH1SemiboldTightFontFamily }
    public var HeadingH1SemiboldTightFontSize: Int { Self.HeadingH1SemiboldTightFontSize }
    public var HeadingH1SemiboldTightFontWeight: String { Self.HeadingH1SemiboldTightFontWeight }
    public var HeadingH1SemiboldTightLetterSpacing: Int { Self.HeadingH1SemiboldTightLetterSpacing }
    public var HeadingH1SemiboldTightLineHeight: Int { Self.HeadingH1SemiboldTightLineHeight }
    public var HeadingH2ExtraboldBaseFontFamily: String { Self.HeadingH2ExtraboldBaseFontFamily }
    public var HeadingH2ExtraboldBaseFontSize: Int { Self.HeadingH2ExtraboldBaseFontSize }
    public var HeadingH2ExtraboldBaseFontWeight: String { Self.HeadingH2ExtraboldBaseFontWeight }
    public var HeadingH2ExtraboldBaseLetterSpacing: Int { Self.HeadingH2ExtraboldBaseLetterSpacing }
    public var HeadingH2ExtraboldBaseLineHeight: Int { Self.HeadingH2ExtraboldBaseLineHeight }
    public var HeadingH2ExtraboldNoneFontFamily: String { Self.HeadingH2ExtraboldNoneFontFamily }
    public var HeadingH2ExtraboldNoneFontSize: Int { Self.HeadingH2ExtraboldNoneFontSize }
    public var HeadingH2ExtraboldNoneFontWeight: String { Self.HeadingH2ExtraboldNoneFontWeight }
    public var HeadingH2ExtraboldNoneLetterSpacing: Int { Self.HeadingH2ExtraboldNoneLetterSpacing }
    public var HeadingH2ExtraboldNoneLineHeight: Int { Self.HeadingH2ExtraboldNoneLineHeight }
    public var HeadingH2ExtraboldTightFontFamily: String { Self.HeadingH2ExtraboldTightFontFamily }
    public var HeadingH2ExtraboldTightFontSize: Int { Self.HeadingH2ExtraboldTightFontSize }
    public var HeadingH2ExtraboldTightFontWeight: String { Self.HeadingH2ExtraboldTightFontWeight }
    public var HeadingH2ExtraboldTightLetterSpacing: Int { Self.HeadingH2ExtraboldTightLetterSpacing }
    public var HeadingH2ExtraboldTightLineHeight: Int { Self.HeadingH2ExtraboldTightLineHeight }
    public var HeadingH2SemiboldBaseFontFamily: String { Self.HeadingH2SemiboldBaseFontFamily }
    public var HeadingH2SemiboldBaseFontSize: Int { Self.HeadingH2SemiboldBaseFontSize }
    public var HeadingH2SemiboldBaseFontWeight: String { Self.HeadingH2SemiboldBaseFontWeight }
    public var HeadingH2SemiboldBaseLetterSpacing: Int { Self.HeadingH2SemiboldBaseLetterSpacing }
    public var HeadingH2SemiboldBaseLineHeight: Int { Self.HeadingH2SemiboldBaseLineHeight }
    public var HeadingH2SemiboldNoneFontFamily: String { Self.HeadingH2SemiboldNoneFontFamily }
    public var HeadingH2SemiboldNoneFontSize: Int { Self.HeadingH2SemiboldNoneFontSize }
    public var HeadingH2SemiboldNoneFontWeight: String { Self.HeadingH2SemiboldNoneFontWeight }
    public var HeadingH2SemiboldNoneLetterSpacing: Int { Self.HeadingH2SemiboldNoneLetterSpacing }
    public var HeadingH2SemiboldNoneLineHeight: Int { Self.HeadingH2SemiboldNoneLineHeight }
    public var HeadingH2SemiboldTightFontFamily: String { Self.HeadingH2SemiboldTightFontFamily }
    public var HeadingH2SemiboldTightFontSize: Int { Self.HeadingH2SemiboldTightFontSize }
    public var HeadingH2SemiboldTightFontWeight: String { Self.HeadingH2SemiboldTightFontWeight }
    public var HeadingH2SemiboldTightLetterSpacing: Int { Self.HeadingH2SemiboldTightLetterSpacing }
    public var HeadingH2SemiboldTightLineHeight: Int { Self.HeadingH2SemiboldTightLineHeight }
    public var HeadingH3ExtraboldBaseFontFamily: String { Self.HeadingH3ExtraboldBaseFontFamily }
    public var HeadingH3ExtraboldBaseFontSize: Int { Self.HeadingH3ExtraboldBaseFontSize }
    public var HeadingH3ExtraboldBaseFontWeight: String { Self.HeadingH3ExtraboldBaseFontWeight }
    public var HeadingH3ExtraboldBaseLetterSpacing: Int { Self.HeadingH3ExtraboldBaseLetterSpacing }
    public var HeadingH3ExtraboldBaseLineHeight: Int { Self.HeadingH3ExtraboldBaseLineHeight }
    public var HeadingH3ExtraboldNoneFontFamily: String { Self.HeadingH3ExtraboldNoneFontFamily }
    public var HeadingH3ExtraboldNoneFontSize: Int { Self.HeadingH3ExtraboldNoneFontSize }
    public var HeadingH3ExtraboldNoneFontWeight: String { Self.HeadingH3ExtraboldNoneFontWeight }
    public var HeadingH3ExtraboldNoneLetterSpacing: Int { Self.HeadingH3ExtraboldNoneLetterSpacing }
    public var HeadingH3ExtraboldNoneLineHeight: Int { Self.HeadingH3ExtraboldNoneLineHeight }
    public var HeadingH3ExtraboldTightFontFamily: String { Self.HeadingH3ExtraboldTightFontFamily }
    public var HeadingH3ExtraboldTightFontSize: Int { Self.HeadingH3ExtraboldTightFontSize }
    public var HeadingH3ExtraboldTightFontWeight: String { Self.HeadingH3ExtraboldTightFontWeight }
    public var HeadingH3ExtraboldTightLetterSpacing: Int { Self.HeadingH3ExtraboldTightLetterSpacing }
    public var HeadingH3ExtraboldTightLineHeight: Int { Self.HeadingH3ExtraboldTightLineHeight }
    public var HeadingH3SemiboldBaseFontFamily: String { Self.HeadingH3SemiboldBaseFontFamily }
    public var HeadingH3SemiboldBaseFontSize: Int { Self.HeadingH3SemiboldBaseFontSize }
    public var HeadingH3SemiboldBaseFontWeight: String { Self.HeadingH3SemiboldBaseFontWeight }
    public var HeadingH3SemiboldBaseLetterSpacing: Int { Self.HeadingH3SemiboldBaseLetterSpacing }
    public var HeadingH3SemiboldBaseLineHeight: Int { Self.HeadingH3SemiboldBaseLineHeight }
    public var HeadingH3SemiboldNoneFontFamily: String { Self.HeadingH3SemiboldNoneFontFamily }
    public var HeadingH3SemiboldNoneFontSize: Int { Self.HeadingH3SemiboldNoneFontSize }
    public var HeadingH3SemiboldNoneFontWeight: String { Self.HeadingH3SemiboldNoneFontWeight }
    public var HeadingH3SemiboldNoneLetterSpacing: Int { Self.HeadingH3SemiboldNoneLetterSpacing }
    public var HeadingH3SemiboldNoneLineHeight: Int { Self.HeadingH3SemiboldNoneLineHeight }
    public var HeadingH3SemiboldTightFontFamily: String { Self.HeadingH3SemiboldTightFontFamily }
    public var HeadingH3SemiboldTightFontSize: Int { Self.HeadingH3SemiboldTightFontSize }
    public var HeadingH3SemiboldTightFontWeight: String { Self.HeadingH3SemiboldTightFontWeight }
    public var HeadingH3SemiboldTightLetterSpacing: Int { Self.HeadingH3SemiboldTightLetterSpacing }
    public var HeadingH3SemiboldTightLineHeight: Int { Self.HeadingH3SemiboldTightLineHeight }
    public var HeadingH4ExtraboldBaseFontFamily: String { Self.HeadingH4ExtraboldBaseFontFamily }
    public var HeadingH4ExtraboldBaseFontSize: Int { Self.HeadingH4ExtraboldBaseFontSize }
    public var HeadingH4ExtraboldBaseFontWeight: String { Self.HeadingH4ExtraboldBaseFontWeight }
    public var HeadingH4ExtraboldBaseLetterSpacing: Int { Self.HeadingH4ExtraboldBaseLetterSpacing }
    public var HeadingH4ExtraboldBaseLineHeight: Int { Self.HeadingH4ExtraboldBaseLineHeight }
    public var HeadingH4ExtraboldNoneFontFamily: String { Self.HeadingH4ExtraboldNoneFontFamily }
    public var HeadingH4ExtraboldNoneFontSize: Int { Self.HeadingH4ExtraboldNoneFontSize }
    public var HeadingH4ExtraboldNoneFontWeight: String { Self.HeadingH4ExtraboldNoneFontWeight }
    public var HeadingH4ExtraboldNoneLetterSpacing: Int { Self.HeadingH4ExtraboldNoneLetterSpacing }
    public var HeadingH4ExtraboldNoneLineHeight: Int { Self.HeadingH4ExtraboldNoneLineHeight }
    public var HeadingH4ExtraboldTightFontFamily: String { Self.HeadingH4ExtraboldTightFontFamily }
    public var HeadingH4ExtraboldTightFontSize: Int { Self.HeadingH4ExtraboldTightFontSize }
    public var HeadingH4ExtraboldTightFontWeight: String { Self.HeadingH4ExtraboldTightFontWeight }
    public var HeadingH4ExtraboldTightLetterSpacing: Int { Self.HeadingH4ExtraboldTightLetterSpacing }
    public var HeadingH4ExtraboldTightLineHeight: Int { Self.HeadingH4ExtraboldTightLineHeight }
    public var HeadingH4SemiboldBaseFontFamily: String { Self.HeadingH4SemiboldBaseFontFamily }
    public var HeadingH4SemiboldBaseFontSize: Int { Self.HeadingH4SemiboldBaseFontSize }
    public var HeadingH4SemiboldBaseFontWeight: String { Self.HeadingH4SemiboldBaseFontWeight }
    public var HeadingH4SemiboldBaseLetterSpacing: Int { Self.HeadingH4SemiboldBaseLetterSpacing }
    public var HeadingH4SemiboldBaseLineHeight: Int { Self.HeadingH4SemiboldBaseLineHeight }
    public var HeadingH4SemiboldNoneFontFamily: String { Self.HeadingH4SemiboldNoneFontFamily }
    public var HeadingH4SemiboldNoneFontSize: Int { Self.HeadingH4SemiboldNoneFontSize }
    public var HeadingH4SemiboldNoneFontWeight: String { Self.HeadingH4SemiboldNoneFontWeight }
    public var HeadingH4SemiboldNoneLetterSpacing: Int { Self.HeadingH4SemiboldNoneLetterSpacing }
    public var HeadingH4SemiboldNoneLineHeight: Int { Self.HeadingH4SemiboldNoneLineHeight }
    public var HeadingH4SemiboldTightFontFamily: String { Self.HeadingH4SemiboldTightFontFamily }
    public var HeadingH4SemiboldTightFontSize: Int { Self.HeadingH4SemiboldTightFontSize }
    public var HeadingH4SemiboldTightFontWeight: String { Self.HeadingH4SemiboldTightFontWeight }
    public var HeadingH4SemiboldTightLetterSpacing: Int { Self.HeadingH4SemiboldTightLetterSpacing }
    public var HeadingH4SemiboldTightLineHeight: Int { Self.HeadingH4SemiboldTightLineHeight }
    public var HeadingH5ExtraboldBaseFontFamily: String { Self.HeadingH5ExtraboldBaseFontFamily }
    public var HeadingH5ExtraboldBaseFontSize: Int { Self.HeadingH5ExtraboldBaseFontSize }
    public var HeadingH5ExtraboldBaseFontWeight: String { Self.HeadingH5ExtraboldBaseFontWeight }
    public var HeadingH5ExtraboldBaseLetterSpacing: Int { Self.HeadingH5ExtraboldBaseLetterSpacing }
    public var HeadingH5ExtraboldBaseLineHeight: Int { Self.HeadingH5ExtraboldBaseLineHeight }
    public var HeadingH5ExtraboldNoneFontFamily: String { Self.HeadingH5ExtraboldNoneFontFamily }
    public var HeadingH5ExtraboldNoneFontSize: Int { Self.HeadingH5ExtraboldNoneFontSize }
    public var HeadingH5ExtraboldNoneFontWeight: String { Self.HeadingH5ExtraboldNoneFontWeight }
    public var HeadingH5ExtraboldNoneLetterSpacing: Int { Self.HeadingH5ExtraboldNoneLetterSpacing }
    public var HeadingH5ExtraboldNoneLineHeight: Int { Self.HeadingH5ExtraboldNoneLineHeight }
    public var HeadingH5ExtraboldTightFontFamily: String { Self.HeadingH5ExtraboldTightFontFamily }
    public var HeadingH5ExtraboldTightFontSize: Int { Self.HeadingH5ExtraboldTightFontSize }
    public var HeadingH5ExtraboldTightFontWeight: String { Self.HeadingH5ExtraboldTightFontWeight }
    public var HeadingH5ExtraboldTightLetterSpacing: Int { Self.HeadingH5ExtraboldTightLetterSpacing }
    public var HeadingH5ExtraboldTightLineHeight: Int { Self.HeadingH5ExtraboldTightLineHeight }
    public var HeadingH5SemiboldBaseFontFamily: String { Self.HeadingH5SemiboldBaseFontFamily }
    public var HeadingH5SemiboldBaseFontSize: Int { Self.HeadingH5SemiboldBaseFontSize }
    public var HeadingH5SemiboldBaseFontWeight: String { Self.HeadingH5SemiboldBaseFontWeight }
    public var HeadingH5SemiboldBaseLetterSpacing: Int { Self.HeadingH5SemiboldBaseLetterSpacing }
    public var HeadingH5SemiboldBaseLineHeight: Int { Self.HeadingH5SemiboldBaseLineHeight }
    public var HeadingH5SemiboldNoneFontFamily: String { Self.HeadingH5SemiboldNoneFontFamily }
    public var HeadingH5SemiboldNoneFontSize: Int { Self.HeadingH5SemiboldNoneFontSize }
    public var HeadingH5SemiboldNoneFontWeight: String { Self.HeadingH5SemiboldNoneFontWeight }
    public var HeadingH5SemiboldNoneLetterSpacing: Int { Self.HeadingH5SemiboldNoneLetterSpacing }
    public var HeadingH5SemiboldNoneLineHeight: Int { Self.HeadingH5SemiboldNoneLineHeight }
    public var HeadingH5SemiboldTightFontFamily: String { Self.HeadingH5SemiboldTightFontFamily }
    public var HeadingH5SemiboldTightFontSize: Int { Self.HeadingH5SemiboldTightFontSize }
    public var HeadingH5SemiboldTightFontWeight: String { Self.HeadingH5SemiboldTightFontWeight }
    public var HeadingH5SemiboldTightLetterSpacing: Int { Self.HeadingH5SemiboldTightLetterSpacing }
    public var HeadingH5SemiboldTightLineHeight: Int { Self.HeadingH5SemiboldTightLineHeight }
    public var HeadingH6ExtraboldBaseFontFamily: String { Self.HeadingH6ExtraboldBaseFontFamily }
    public var HeadingH6ExtraboldBaseFontSize: Int { Self.HeadingH6ExtraboldBaseFontSize }
    public var HeadingH6ExtraboldBaseFontWeight: String { Self.HeadingH6ExtraboldBaseFontWeight }
    public var HeadingH6ExtraboldBaseLetterSpacing: Int { Self.HeadingH6ExtraboldBaseLetterSpacing }
    public var HeadingH6ExtraboldBaseLineHeight: Int { Self.HeadingH6ExtraboldBaseLineHeight }
    public var HeadingH6ExtraboldNoneFontFamily: String { Self.HeadingH6ExtraboldNoneFontFamily }
    public var HeadingH6ExtraboldNoneFontSize: Int { Self.HeadingH6ExtraboldNoneFontSize }
    public var HeadingH6ExtraboldNoneFontWeight: String { Self.HeadingH6ExtraboldNoneFontWeight }
    public var HeadingH6ExtraboldNoneLetterSpacing: Int { Self.HeadingH6ExtraboldNoneLetterSpacing }
    public var HeadingH6ExtraboldNoneLineHeight: Int { Self.HeadingH6ExtraboldNoneLineHeight }
    public var HeadingH6ExtraboldTightFontFamily: String { Self.HeadingH6ExtraboldTightFontFamily }
    public var HeadingH6ExtraboldTightFontSize: Int { Self.HeadingH6ExtraboldTightFontSize }
    public var HeadingH6ExtraboldTightFontWeight: String { Self.HeadingH6ExtraboldTightFontWeight }
    public var HeadingH6ExtraboldTightLetterSpacing: Int { Self.HeadingH6ExtraboldTightLetterSpacing }
    public var HeadingH6ExtraboldTightLineHeight: Int { Self.HeadingH6ExtraboldTightLineHeight }
    public var HeadingH6SemiboldBaseFontFamily: String { Self.HeadingH6SemiboldBaseFontFamily }
    public var HeadingH6SemiboldBaseFontSize: Int { Self.HeadingH6SemiboldBaseFontSize }
    public var HeadingH6SemiboldBaseFontWeight: String { Self.HeadingH6SemiboldBaseFontWeight }
    public var HeadingH6SemiboldBaseLetterSpacing: Int { Self.HeadingH6SemiboldBaseLetterSpacing }
    public var HeadingH6SemiboldBaseLineHeight: Int { Self.HeadingH6SemiboldBaseLineHeight }
    public var HeadingH6SemiboldNoneFontFamily: String { Self.HeadingH6SemiboldNoneFontFamily }
    public var HeadingH6SemiboldNoneFontSize: Int { Self.HeadingH6SemiboldNoneFontSize }
    public var HeadingH6SemiboldNoneFontWeight: String { Self.HeadingH6SemiboldNoneFontWeight }
    public var HeadingH6SemiboldNoneLetterSpacing: Int { Self.HeadingH6SemiboldNoneLetterSpacing }
    public var HeadingH6SemiboldNoneLineHeight: Int { Self.HeadingH6SemiboldNoneLineHeight }
    public var HeadingH6SemiboldTightFontFamily: String { Self.HeadingH6SemiboldTightFontFamily }
    public var HeadingH6SemiboldTightFontSize: Int { Self.HeadingH6SemiboldTightFontSize }
    public var HeadingH6SemiboldTightFontWeight: String { Self.HeadingH6SemiboldTightFontWeight }
    public var HeadingH6SemiboldTightLetterSpacing: Int { Self.HeadingH6SemiboldTightLetterSpacing }
    public var HeadingH6SemiboldTightLineHeight: Int { Self.HeadingH6SemiboldTightLineHeight }
    public var Radius: CGFloat { Self.Radius }
    public var Radius0: CGFloat { Self.Radius0 }
    public var Radius1: CGFloat { Self.Radius1 }
    public var Radius10: CGFloat { Self.Radius10 }
    public var Radius11: CGFloat { Self.Radius11 }
    public var Radius12: CGFloat { Self.Radius12 }
    public var Radius13: CGFloat { Self.Radius13 }
    public var Radius14: CGFloat { Self.Radius14 }
    public var Radius15: CGFloat { Self.Radius15 }
    public var Radius16: CGFloat { Self.Radius16 }
    public var Radius17: CGFloat { Self.Radius17 }
    public var Radius18: CGFloat { Self.Radius18 }
    public var Radius19: CGFloat { Self.Radius19 }
    public var Radius2: CGFloat { Self.Radius2 }
    public var Radius20: CGFloat { Self.Radius20 }
    public var Radius3: CGFloat { Self.Radius3 }
    public var Radius4: CGFloat { Self.Radius4 }
    public var Radius5: CGFloat { Self.Radius5 }
    public var Radius6: CGFloat { Self.Radius6 }
    public var Radius7: CGFloat { Self.Radius7 }
    public var Radius8: CGFloat { Self.Radius8 }
    public var Radius9: CGFloat { Self.Radius9 }
    public var Radius999: CGFloat { Self.Radius999 }
    public var Spacing0: CGFloat { Self.Spacing0 }
    public var Spacing1: CGFloat { Self.Spacing1 }
    public var Spacing10: CGFloat { Self.Spacing10 }
    public var Spacing11: CGFloat { Self.Spacing11 }
    public var Spacing12: CGFloat { Self.Spacing12 }
    public var Spacing13: CGFloat { Self.Spacing13 }
    public var Spacing14: CGFloat { Self.Spacing14 }
    public var Spacing15: CGFloat { Self.Spacing15 }
    public var Spacing16: CGFloat { Self.Spacing16 }
    public var Spacing17: CGFloat { Self.Spacing17 }
    public var Spacing18: CGFloat { Self.Spacing18 }
    public var Spacing19: CGFloat { Self.Spacing19 }
    public var Spacing1px: CGFloat { Self.Spacing1px }
    public var Spacing2: CGFloat { Self.Spacing2 }
    public var Spacing20: CGFloat { Self.Spacing20 }
    public var Spacing21: CGFloat { Self.Spacing21 }
    public var Spacing22: CGFloat { Self.Spacing22 }
    public var Spacing23: CGFloat { Self.Spacing23 }
    public var Spacing24: CGFloat { Self.Spacing24 }
    public var Spacing25: CGFloat { Self.Spacing25 }
    public var Spacing26: CGFloat { Self.Spacing26 }
    public var Spacing27: CGFloat { Self.Spacing27 }
    public var Spacing28: CGFloat { Self.Spacing28 }
    public var Spacing29: CGFloat { Self.Spacing29 }
    public var Spacing2Tba: CGFloat { Self.Spacing2Tba }
    public var Spacing2px: CGFloat { Self.Spacing2px }
    public var Spacing3: CGFloat { Self.Spacing3 }
    public var Spacing30: CGFloat { Self.Spacing30 }
    public var Spacing31: CGFloat { Self.Spacing31 }
    public var Spacing32: CGFloat { Self.Spacing32 }
    public var Spacing33: CGFloat { Self.Spacing33 }
    public var Spacing34: CGFloat { Self.Spacing34 }
    public var Spacing35: CGFloat { Self.Spacing35 }
    public var Spacing36: CGFloat { Self.Spacing36 }
    public var Spacing4: CGFloat { Self.Spacing4 }
    public var Spacing5: CGFloat { Self.Spacing5 }
    public var Spacing6: CGFloat { Self.Spacing6 }
    public var Spacing6px: CGFloat { Self.Spacing6px }
    public var Spacing7: CGFloat { Self.Spacing7 }
    public var Spacing8: CGFloat { Self.Spacing8 }
    public var Spacing9: CGFloat { Self.Spacing9 }
}

// MARK: - Dark Theme Conformance

extension TokensCoreDark: CoreTokensProvider {
    public var BodyLgBoldBaseFontFamily: String { Self.BodyLgBoldBaseFontFamily }
    public var BodyLgBoldBaseFontSize: Int { Self.BodyLgBoldBaseFontSize }
    public var BodyLgBoldBaseFontWeight: String { Self.BodyLgBoldBaseFontWeight }
    public var BodyLgBoldBaseLetterSpacing: Int { Self.BodyLgBoldBaseLetterSpacing }
    public var BodyLgBoldBaseLineHeight: Int { Self.BodyLgBoldBaseLineHeight }
    public var BodyLgBoldNoneFontFamily: String { Self.BodyLgBoldNoneFontFamily }
    public var BodyLgBoldNoneFontSize: Int { Self.BodyLgBoldNoneFontSize }
    public var BodyLgBoldNoneFontWeight: String { Self.BodyLgBoldNoneFontWeight }
    public var BodyLgBoldNoneLetterSpacing: Int { Self.BodyLgBoldNoneLetterSpacing }
    public var BodyLgBoldNoneLineHeight: Int { Self.BodyLgBoldNoneLineHeight }
    public var BodyLgBoldTightFontFamily: String { Self.BodyLgBoldTightFontFamily }
    public var BodyLgBoldTightFontSize: Int { Self.BodyLgBoldTightFontSize }
    public var BodyLgBoldTightFontWeight: String { Self.BodyLgBoldTightFontWeight }
    public var BodyLgBoldTightLetterSpacing: Int { Self.BodyLgBoldTightLetterSpacing }
    public var BodyLgBoldTightLineHeight: Int { Self.BodyLgBoldTightLineHeight }
    public var BodyLgRegularBaseFontFamily: String { Self.BodyLgRegularBaseFontFamily }
    public var BodyLgRegularBaseFontSize: Int { Self.BodyLgRegularBaseFontSize }
    public var BodyLgRegularBaseFontWeight: String { Self.BodyLgRegularBaseFontWeight }
    public var BodyLgRegularBaseLetterSpacing: Int { Self.BodyLgRegularBaseLetterSpacing }
    public var BodyLgRegularBaseLineHeight: Int { Self.BodyLgRegularBaseLineHeight }
    public var BodyLgRegularNoneFontFamily: String { Self.BodyLgRegularNoneFontFamily }
    public var BodyLgRegularNoneFontSize: Int { Self.BodyLgRegularNoneFontSize }
    public var BodyLgRegularNoneFontWeight: String { Self.BodyLgRegularNoneFontWeight }
    public var BodyLgRegularNoneLetterSpacing: Int { Self.BodyLgRegularNoneLetterSpacing }
    public var BodyLgRegularNoneLineHeight: Int { Self.BodyLgRegularNoneLineHeight }
    public var BodyLgRegularTightFontFamily: String { Self.BodyLgRegularTightFontFamily }
    public var BodyLgRegularTightFontSize: Int { Self.BodyLgRegularTightFontSize }
    public var BodyLgRegularTightFontWeight: String { Self.BodyLgRegularTightFontWeight }
    public var BodyLgRegularTightLetterSpacing: Int { Self.BodyLgRegularTightLetterSpacing }
    public var BodyLgRegularTightLineHeight: Int { Self.BodyLgRegularTightLineHeight }
    public var BodyLgSemiboldBaseFontFamily: String { Self.BodyLgSemiboldBaseFontFamily }
    public var BodyLgSemiboldBaseFontSize: Int { Self.BodyLgSemiboldBaseFontSize }
    public var BodyLgSemiboldBaseFontWeight: String { Self.BodyLgSemiboldBaseFontWeight }
    public var BodyLgSemiboldBaseLetterSpacing: Int { Self.BodyLgSemiboldBaseLetterSpacing }
    public var BodyLgSemiboldBaseLineHeight: Int { Self.BodyLgSemiboldBaseLineHeight }
    public var BodyLgSemiboldNoneFontFamily: String { Self.BodyLgSemiboldNoneFontFamily }
    public var BodyLgSemiboldNoneFontSize: Int { Self.BodyLgSemiboldNoneFontSize }
    public var BodyLgSemiboldNoneFontWeight: String { Self.BodyLgSemiboldNoneFontWeight }
    public var BodyLgSemiboldNoneLetterSpacing: Int { Self.BodyLgSemiboldNoneLetterSpacing }
    public var BodyLgSemiboldNoneLineHeight: Int { Self.BodyLgSemiboldNoneLineHeight }
    public var BodyLgSemiboldTightFontFamily: String { Self.BodyLgSemiboldTightFontFamily }
    public var BodyLgSemiboldTightFontSize: Int { Self.BodyLgSemiboldTightFontSize }
    public var BodyLgSemiboldTightFontWeight: String { Self.BodyLgSemiboldTightFontWeight }
    public var BodyLgSemiboldTightLetterSpacing: Int { Self.BodyLgSemiboldTightLetterSpacing }
    public var BodyLgSemiboldTightLineHeight: Int { Self.BodyLgSemiboldTightLineHeight }
    public var BodyMdBoldBaseFontFamily: String { Self.BodyMdBoldBaseFontFamily }
    public var BodyMdBoldBaseFontSize: Int { Self.BodyMdBoldBaseFontSize }
    public var BodyMdBoldBaseFontWeight: String { Self.BodyMdBoldBaseFontWeight }
    public var BodyMdBoldBaseLetterSpacing: Int { Self.BodyMdBoldBaseLetterSpacing }
    public var BodyMdBoldBaseLineHeight: Int { Self.BodyMdBoldBaseLineHeight }
    public var BodyMdBoldNoneFontFamily: String { Self.BodyMdBoldNoneFontFamily }
    public var BodyMdBoldNoneFontSize: Int { Self.BodyMdBoldNoneFontSize }
    public var BodyMdBoldNoneFontWeight: String { Self.BodyMdBoldNoneFontWeight }
    public var BodyMdBoldNoneLetterSpacing: Int { Self.BodyMdBoldNoneLetterSpacing }
    public var BodyMdBoldNoneLineHeight: Int { Self.BodyMdBoldNoneLineHeight }
    public var BodyMdBoldTightFontFamily: String { Self.BodyMdBoldTightFontFamily }
    public var BodyMdBoldTightFontSize: Int { Self.BodyMdBoldTightFontSize }
    public var BodyMdBoldTightFontWeight: String { Self.BodyMdBoldTightFontWeight }
    public var BodyMdBoldTightLetterSpacing: Int { Self.BodyMdBoldTightLetterSpacing }
    public var BodyMdBoldTightLineHeight: Int { Self.BodyMdBoldTightLineHeight }
    public var BodyMdRegularBaseFontFamily: String { Self.BodyMdRegularBaseFontFamily }
    public var BodyMdRegularBaseFontSize: Int { Self.BodyMdRegularBaseFontSize }
    public var BodyMdRegularBaseFontWeight: String { Self.BodyMdRegularBaseFontWeight }
    public var BodyMdRegularBaseLetterSpacing: Int { Self.BodyMdRegularBaseLetterSpacing }
    public var BodyMdRegularBaseLineHeight: Int { Self.BodyMdRegularBaseLineHeight }
    public var BodyMdRegularNoneFontFamily: String { Self.BodyMdRegularNoneFontFamily }
    public var BodyMdRegularNoneFontSize: Int { Self.BodyMdRegularNoneFontSize }
    public var BodyMdRegularNoneFontWeight: String { Self.BodyMdRegularNoneFontWeight }
    public var BodyMdRegularNoneLetterSpacing: Int { Self.BodyMdRegularNoneLetterSpacing }
    public var BodyMdRegularNoneLineHeight: Int { Self.BodyMdRegularNoneLineHeight }
    public var BodyMdRegularTightFontFamily: String { Self.BodyMdRegularTightFontFamily }
    public var BodyMdRegularTightFontSize: Int { Self.BodyMdRegularTightFontSize }
    public var BodyMdRegularTightFontWeight: String { Self.BodyMdRegularTightFontWeight }
    public var BodyMdRegularTightLetterSpacing: Int { Self.BodyMdRegularTightLetterSpacing }
    public var BodyMdRegularTightLineHeight: Int { Self.BodyMdRegularTightLineHeight }
    public var BodyMdSemiboldBaseFontFamily: String { Self.BodyMdSemiboldBaseFontFamily }
    public var BodyMdSemiboldBaseFontSize: Int { Self.BodyMdSemiboldBaseFontSize }
    public var BodyMdSemiboldBaseFontWeight: String { Self.BodyMdSemiboldBaseFontWeight }
    public var BodyMdSemiboldBaseLetterSpacing: Int { Self.BodyMdSemiboldBaseLetterSpacing }
    public var BodyMdSemiboldBaseLineHeight: Int { Self.BodyMdSemiboldBaseLineHeight }
    public var BodyMdSemiboldNoneFontFamily: String { Self.BodyMdSemiboldNoneFontFamily }
    public var BodyMdSemiboldNoneFontSize: Int { Self.BodyMdSemiboldNoneFontSize }
    public var BodyMdSemiboldNoneFontWeight: String { Self.BodyMdSemiboldNoneFontWeight }
    public var BodyMdSemiboldNoneLetterSpacing: Int { Self.BodyMdSemiboldNoneLetterSpacing }
    public var BodyMdSemiboldNoneLineHeight: Int { Self.BodyMdSemiboldNoneLineHeight }
    public var BodyMdSemiboldTightFontFamily: String { Self.BodyMdSemiboldTightFontFamily }
    public var BodyMdSemiboldTightFontSize: Int { Self.BodyMdSemiboldTightFontSize }
    public var BodyMdSemiboldTightFontWeight: String { Self.BodyMdSemiboldTightFontWeight }
    public var BodyMdSemiboldTightLetterSpacing: Int { Self.BodyMdSemiboldTightLetterSpacing }
    public var BodyMdSemiboldTightLineHeight: Int { Self.BodyMdSemiboldTightLineHeight }
    public var BodySmDefaultBoldBaseFontFamily: String { Self.BodySmDefaultBoldBaseFontFamily }
    public var BodySmDefaultBoldBaseFontSize: Int { Self.BodySmDefaultBoldBaseFontSize }
    public var BodySmDefaultBoldBaseFontWeight: String { Self.BodySmDefaultBoldBaseFontWeight }
    public var BodySmDefaultBoldBaseLetterSpacing: Int { Self.BodySmDefaultBoldBaseLetterSpacing }
    public var BodySmDefaultBoldBaseLineHeight: Int { Self.BodySmDefaultBoldBaseLineHeight }
    public var BodySmDefaultBoldNoneFontFamily: String { Self.BodySmDefaultBoldNoneFontFamily }
    public var BodySmDefaultBoldNoneFontSize: Int { Self.BodySmDefaultBoldNoneFontSize }
    public var BodySmDefaultBoldNoneFontWeight: String { Self.BodySmDefaultBoldNoneFontWeight }
    public var BodySmDefaultBoldNoneLetterSpacing: Int { Self.BodySmDefaultBoldNoneLetterSpacing }
    public var BodySmDefaultBoldNoneLineHeight: Int { Self.BodySmDefaultBoldNoneLineHeight }
    public var BodySmDefaultBoldTightFontFamily: String { Self.BodySmDefaultBoldTightFontFamily }
    public var BodySmDefaultBoldTightFontSize: Int { Self.BodySmDefaultBoldTightFontSize }
    public var BodySmDefaultBoldTightFontWeight: String { Self.BodySmDefaultBoldTightFontWeight }
    public var BodySmDefaultBoldTightLetterSpacing: Int { Self.BodySmDefaultBoldTightLetterSpacing }
    public var BodySmDefaultBoldTightLineHeight: Int { Self.BodySmDefaultBoldTightLineHeight }
    public var BodySmDefaultRegularBaseFontFamily: String { Self.BodySmDefaultRegularBaseFontFamily }
    public var BodySmDefaultRegularBaseFontSize: Int { Self.BodySmDefaultRegularBaseFontSize }
    public var BodySmDefaultRegularBaseFontWeight: String { Self.BodySmDefaultRegularBaseFontWeight }
    public var BodySmDefaultRegularBaseLetterSpacing: Int { Self.BodySmDefaultRegularBaseLetterSpacing }
    public var BodySmDefaultRegularBaseLineHeight: Int { Self.BodySmDefaultRegularBaseLineHeight }
    public var BodySmDefaultRegularNoneFontFamily: String { Self.BodySmDefaultRegularNoneFontFamily }
    public var BodySmDefaultRegularNoneFontSize: Int { Self.BodySmDefaultRegularNoneFontSize }
    public var BodySmDefaultRegularNoneFontWeight: String { Self.BodySmDefaultRegularNoneFontWeight }
    public var BodySmDefaultRegularNoneLetterSpacing: Int { Self.BodySmDefaultRegularNoneLetterSpacing }
    public var BodySmDefaultRegularNoneLineHeight: Int { Self.BodySmDefaultRegularNoneLineHeight }
    public var BodySmDefaultRegularTightFontFamily: String { Self.BodySmDefaultRegularTightFontFamily }
    public var BodySmDefaultRegularTightFontSize: Int { Self.BodySmDefaultRegularTightFontSize }
    public var BodySmDefaultRegularTightFontWeight: String { Self.BodySmDefaultRegularTightFontWeight }
    public var BodySmDefaultRegularTightLetterSpacing: Int { Self.BodySmDefaultRegularTightLetterSpacing }
    public var BodySmDefaultRegularTightLineHeight: Int { Self.BodySmDefaultRegularTightLineHeight }
    public var BodySmDefaultSemiboldBaseFontFamily: String { Self.BodySmDefaultSemiboldBaseFontFamily }
    public var BodySmDefaultSemiboldBaseFontSize: Int { Self.BodySmDefaultSemiboldBaseFontSize }
    public var BodySmDefaultSemiboldBaseFontWeight: String { Self.BodySmDefaultSemiboldBaseFontWeight }
    public var BodySmDefaultSemiboldBaseLetterSpacing: Int { Self.BodySmDefaultSemiboldBaseLetterSpacing }
    public var BodySmDefaultSemiboldBaseLineHeight: Int { Self.BodySmDefaultSemiboldBaseLineHeight }
    public var BodySmDefaultSemiboldNoneFontFamily: String { Self.BodySmDefaultSemiboldNoneFontFamily }
    public var BodySmDefaultSemiboldNoneFontSize: Int { Self.BodySmDefaultSemiboldNoneFontSize }
    public var BodySmDefaultSemiboldNoneFontWeight: String { Self.BodySmDefaultSemiboldNoneFontWeight }
    public var BodySmDefaultSemiboldNoneLetterSpacing: Int { Self.BodySmDefaultSemiboldNoneLetterSpacing }
    public var BodySmDefaultSemiboldNoneLineHeight: Int { Self.BodySmDefaultSemiboldNoneLineHeight }
    public var BodySmDefaultSemiboldTightFontFamily: String { Self.BodySmDefaultSemiboldTightFontFamily }
    public var BodySmDefaultSemiboldTightFontSize: Int { Self.BodySmDefaultSemiboldTightFontSize }
    public var BodySmDefaultSemiboldTightFontWeight: String { Self.BodySmDefaultSemiboldTightFontWeight }
    public var BodySmDefaultSemiboldTightLetterSpacing: Int { Self.BodySmDefaultSemiboldTightLetterSpacing }
    public var BodySmDefaultSemiboldTightLineHeight: Int { Self.BodySmDefaultSemiboldTightLineHeight }
    public var BodyXlBoldBaseFontFamily: String { Self.BodyXlBoldBaseFontFamily }
    public var BodyXlBoldBaseFontSize: Int { Self.BodyXlBoldBaseFontSize }
    public var BodyXlBoldBaseFontWeight: String { Self.BodyXlBoldBaseFontWeight }
    public var BodyXlBoldBaseLetterSpacing: Int { Self.BodyXlBoldBaseLetterSpacing }
    public var BodyXlBoldBaseLineHeight: Int { Self.BodyXlBoldBaseLineHeight }
    public var BodyXlBoldNoneFontFamily: String { Self.BodyXlBoldNoneFontFamily }
    public var BodyXlBoldNoneFontSize: Int { Self.BodyXlBoldNoneFontSize }
    public var BodyXlBoldNoneFontWeight: String { Self.BodyXlBoldNoneFontWeight }
    public var BodyXlBoldNoneLetterSpacing: Int { Self.BodyXlBoldNoneLetterSpacing }
    public var BodyXlBoldNoneLineHeight: Int { Self.BodyXlBoldNoneLineHeight }
    public var BodyXlBoldTightFontFamily: String { Self.BodyXlBoldTightFontFamily }
    public var BodyXlBoldTightFontSize: Int { Self.BodyXlBoldTightFontSize }
    public var BodyXlBoldTightFontWeight: String { Self.BodyXlBoldTightFontWeight }
    public var BodyXlBoldTightLetterSpacing: Int { Self.BodyXlBoldTightLetterSpacing }
    public var BodyXlBoldTightLineHeight: Int { Self.BodyXlBoldTightLineHeight }
    public var BodyXlRegularBaseFontFamily: String { Self.BodyXlRegularBaseFontFamily }
    public var BodyXlRegularBaseFontSize: Int { Self.BodyXlRegularBaseFontSize }
    public var BodyXlRegularBaseFontWeight: String { Self.BodyXlRegularBaseFontWeight }
    public var BodyXlRegularBaseLetterSpacing: Int { Self.BodyXlRegularBaseLetterSpacing }
    public var BodyXlRegularBaseLineHeight: Int { Self.BodyXlRegularBaseLineHeight }
    public var BodyXlRegularNoneFontFamily: String { Self.BodyXlRegularNoneFontFamily }
    public var BodyXlRegularNoneFontSize: Int { Self.BodyXlRegularNoneFontSize }
    public var BodyXlRegularNoneFontWeight: String { Self.BodyXlRegularNoneFontWeight }
    public var BodyXlRegularNoneLetterSpacing: Int { Self.BodyXlRegularNoneLetterSpacing }
    public var BodyXlRegularNoneLineHeight: Int { Self.BodyXlRegularNoneLineHeight }
    public var BodyXlRegularTightFontFamily: String { Self.BodyXlRegularTightFontFamily }
    public var BodyXlRegularTightFontSize: Int { Self.BodyXlRegularTightFontSize }
    public var BodyXlRegularTightFontWeight: String { Self.BodyXlRegularTightFontWeight }
    public var BodyXlRegularTightLetterSpacing: Int { Self.BodyXlRegularTightLetterSpacing }
    public var BodyXlRegularTightLineHeight: Int { Self.BodyXlRegularTightLineHeight }
    public var BodyXlSemiboldBaseFontFamily: String { Self.BodyXlSemiboldBaseFontFamily }
    public var BodyXlSemiboldBaseFontSize: Int { Self.BodyXlSemiboldBaseFontSize }
    public var BodyXlSemiboldBaseFontWeight: String { Self.BodyXlSemiboldBaseFontWeight }
    public var BodyXlSemiboldBaseLetterSpacing: Int { Self.BodyXlSemiboldBaseLetterSpacing }
    public var BodyXlSemiboldBaseLineHeight: Int { Self.BodyXlSemiboldBaseLineHeight }
    public var BodyXlSemiboldNoneFontFamily: String { Self.BodyXlSemiboldNoneFontFamily }
    public var BodyXlSemiboldNoneFontSize: Int { Self.BodyXlSemiboldNoneFontSize }
    public var BodyXlSemiboldNoneFontWeight: String { Self.BodyXlSemiboldNoneFontWeight }
    public var BodyXlSemiboldNoneLetterSpacing: Int { Self.BodyXlSemiboldNoneLetterSpacing }
    public var BodyXlSemiboldNoneLineHeight: Int { Self.BodyXlSemiboldNoneLineHeight }
    public var BodyXlSemiboldTightFontFamily: String { Self.BodyXlSemiboldTightFontFamily }
    public var BodyXlSemiboldTightFontSize: Int { Self.BodyXlSemiboldTightFontSize }
    public var BodyXlSemiboldTightFontWeight: String { Self.BodyXlSemiboldTightFontWeight }
    public var BodyXlSemiboldTightLetterSpacing: Int { Self.BodyXlSemiboldTightLetterSpacing }
    public var BodyXlSemiboldTightLineHeight: Int { Self.BodyXlSemiboldTightLineHeight }
    public var BodyXsBoldBaseFontFamily: String { Self.BodyXsBoldBaseFontFamily }
    public var BodyXsBoldBaseFontSize: Int { Self.BodyXsBoldBaseFontSize }
    public var BodyXsBoldBaseFontWeight: String { Self.BodyXsBoldBaseFontWeight }
    public var BodyXsBoldBaseLetterSpacing: Int { Self.BodyXsBoldBaseLetterSpacing }
    public var BodyXsBoldBaseLineHeight: Int { Self.BodyXsBoldBaseLineHeight }
    public var BodyXsBoldNoneFontFamily: String { Self.BodyXsBoldNoneFontFamily }
    public var BodyXsBoldNoneFontSize: Int { Self.BodyXsBoldNoneFontSize }
    public var BodyXsBoldNoneFontWeight: String { Self.BodyXsBoldNoneFontWeight }
    public var BodyXsBoldNoneLetterSpacing: Int { Self.BodyXsBoldNoneLetterSpacing }
    public var BodyXsBoldNoneLineHeight: Int { Self.BodyXsBoldNoneLineHeight }
    public var BodyXsBoldTightFontFamily: String { Self.BodyXsBoldTightFontFamily }
    public var BodyXsBoldTightFontSize: Int { Self.BodyXsBoldTightFontSize }
    public var BodyXsBoldTightFontWeight: String { Self.BodyXsBoldTightFontWeight }
    public var BodyXsBoldTightLetterSpacing: Int { Self.BodyXsBoldTightLetterSpacing }
    public var BodyXsBoldTightLineHeight: Int { Self.BodyXsBoldTightLineHeight }
    public var BodyXsRegularBaseFontFamily: String { Self.BodyXsRegularBaseFontFamily }
    public var BodyXsRegularBaseFontSize: Int { Self.BodyXsRegularBaseFontSize }
    public var BodyXsRegularBaseFontWeight: String { Self.BodyXsRegularBaseFontWeight }
    public var BodyXsRegularBaseLetterSpacing: Int { Self.BodyXsRegularBaseLetterSpacing }
    public var BodyXsRegularBaseLineHeight: Int { Self.BodyXsRegularBaseLineHeight }
    public var BodyXsRegularNoneFontFamily: String { Self.BodyXsRegularNoneFontFamily }
    public var BodyXsRegularNoneFontSize: Int { Self.BodyXsRegularNoneFontSize }
    public var BodyXsRegularNoneFontWeight: String { Self.BodyXsRegularNoneFontWeight }
    public var BodyXsRegularNoneLetterSpacing: Int { Self.BodyXsRegularNoneLetterSpacing }
    public var BodyXsRegularNoneLineHeight: Int { Self.BodyXsRegularNoneLineHeight }
    public var BodyXsRegularTightFontFamily: String { Self.BodyXsRegularTightFontFamily }
    public var BodyXsRegularTightFontSize: Int { Self.BodyXsRegularTightFontSize }
    public var BodyXsRegularTightFontWeight: String { Self.BodyXsRegularTightFontWeight }
    public var BodyXsRegularTightLetterSpacing: Int { Self.BodyXsRegularTightLetterSpacing }
    public var BodyXsRegularTightLineHeight: Int { Self.BodyXsRegularTightLineHeight }
    public var BodyXsSemiboldBaseFontFamily: String { Self.BodyXsSemiboldBaseFontFamily }
    public var BodyXsSemiboldBaseFontSize: Int { Self.BodyXsSemiboldBaseFontSize }
    public var BodyXsSemiboldBaseFontWeight: String { Self.BodyXsSemiboldBaseFontWeight }
    public var BodyXsSemiboldBaseLetterSpacing: Int { Self.BodyXsSemiboldBaseLetterSpacing }
    public var BodyXsSemiboldBaseLineHeight: Int { Self.BodyXsSemiboldBaseLineHeight }
    public var BodyXsSemiboldNoneFontFamily: String { Self.BodyXsSemiboldNoneFontFamily }
    public var BodyXsSemiboldNoneFontSize: Int { Self.BodyXsSemiboldNoneFontSize }
    public var BodyXsSemiboldNoneFontWeight: String { Self.BodyXsSemiboldNoneFontWeight }
    public var BodyXsSemiboldNoneLetterSpacing: Int { Self.BodyXsSemiboldNoneLetterSpacing }
    public var BodyXsSemiboldNoneLineHeight: Int { Self.BodyXsSemiboldNoneLineHeight }
    public var BodyXsSemiboldTightFontFamily: String { Self.BodyXsSemiboldTightFontFamily }
    public var BodyXsSemiboldTightFontSize: Int { Self.BodyXsSemiboldTightFontSize }
    public var BodyXsSemiboldTightFontWeight: String { Self.BodyXsSemiboldTightFontWeight }
    public var BodyXsSemiboldTightLetterSpacing: Int { Self.BodyXsSemiboldTightLetterSpacing }
    public var BodyXsSemiboldTightLineHeight: Int { Self.BodyXsSemiboldTightLineHeight }
    public var ElevationAbove1: DSShadow { Self.ElevationAbove1 }
    public var ElevationAbove2: DSShadow { Self.ElevationAbove2 }
    public var ElevationAbove3: DSShadow { Self.ElevationAbove3 }
    public var ElevationAbove4: DSShadow { Self.ElevationAbove4 }
    public var ElevationAbove5: DSShadow { Self.ElevationAbove5 }
    public var ElevationBelow1: DSShadow { Self.ElevationBelow1 }
    public var ElevationBelow2: DSShadow { Self.ElevationBelow2 }
    public var ElevationBelow3: DSShadow { Self.ElevationBelow3 }
    public var ElevationBelow4: DSShadow { Self.ElevationBelow4 }
    public var ElevationBelow5: DSShadow { Self.ElevationBelow5 }
    public var ElevationBlurRadiusBlur1: CGFloat { Self.ElevationBlurRadiusBlur1 }
    public var ElevationBlurRadiusBlur2: CGFloat { Self.ElevationBlurRadiusBlur2 }
    public var ElevationBlurRadiusBlur3: CGFloat { Self.ElevationBlurRadiusBlur3 }
    public var ElevationBlurRadiusBlur4: CGFloat { Self.ElevationBlurRadiusBlur4 }
    public var ElevationBlurRadiusBlur5: CGFloat { Self.ElevationBlurRadiusBlur5 }
    public var ElevationHigh: Color { Self.ElevationHigh }
    public var ElevationHighest: Color { Self.ElevationHighest }
    public var ElevationLow: Color { Self.ElevationLow }
    public var ElevationLowest: Color { Self.ElevationLowest }
    public var ElevationMed: Color { Self.ElevationMed }
    public var ElevationPositionX1: CGFloat { Self.ElevationPositionX1 }
    public var ElevationPositionX2: CGFloat { Self.ElevationPositionX2 }
    public var ElevationPositionX3: CGFloat { Self.ElevationPositionX3 }
    public var ElevationPositionX4: CGFloat { Self.ElevationPositionX4 }
    public var ElevationPositionX5: CGFloat { Self.ElevationPositionX5 }
    public var ElevationPositionY1: CGFloat { Self.ElevationPositionY1 }
    public var ElevationPositionY2: CGFloat { Self.ElevationPositionY2 }
    public var ElevationPositionY3: CGFloat { Self.ElevationPositionY3 }
    public var ElevationPositionY4: CGFloat { Self.ElevationPositionY4 }
    public var ElevationPositionY5: CGFloat { Self.ElevationPositionY5 }
    public var FontFamilyDisplay: String { Self.FontFamilyDisplay }
    public var FontFamilyInformational: String { Self.FontFamilyInformational }
    public var FontLetterSpacingBase: CGFloat { Self.FontLetterSpacingBase }
    public var FontLetterSpacingNlarge: CGFloat { Self.FontLetterSpacingNlarge }
    public var FontLetterSpacingNsmall: CGFloat { Self.FontLetterSpacingNsmall }
    public var FontLetterSpacingPlarge: CGFloat { Self.FontLetterSpacingPlarge }
    public var FontLetterSpacingPsmall: CGFloat { Self.FontLetterSpacingPsmall }
    public var FontLineHeightBase: CGFloat { Self.FontLineHeightBase }
    public var FontLineHeightNone: CGFloat { Self.FontLineHeightNone }
    public var FontLineHeightTight: CGFloat { Self.FontLineHeightTight }
    public var FontSizeBodyLg: CGFloat { Self.FontSizeBodyLg }
    public var FontSizeBodyMd: CGFloat { Self.FontSizeBodyMd }
    public var FontSizeBodySm: CGFloat { Self.FontSizeBodySm }
    public var FontSizeBodyXl: CGFloat { Self.FontSizeBodyXl }
    public var FontSizeBodyXs: CGFloat { Self.FontSizeBodyXs }
    public var FontSizeCaption: CGFloat { Self.FontSizeCaption }
    public var FontSizeH1: CGFloat { Self.FontSizeH1 }
    public var FontSizeH2: CGFloat { Self.FontSizeH2 }
    public var FontSizeH3: CGFloat { Self.FontSizeH3 }
    public var FontSizeH4: CGFloat { Self.FontSizeH4 }
    public var FontSizeH5: CGFloat { Self.FontSizeH5 }
    public var FontSizeH6: CGFloat { Self.FontSizeH6 }
    public var FontSizeHero1: CGFloat { Self.FontSizeHero1 }
    public var FontSizeHero2: CGFloat { Self.FontSizeHero2 }
    public var FontSizeHero3: CGFloat { Self.FontSizeHero3 }
    public var FontSizeHero4: CGFloat { Self.FontSizeHero4 }
    public var FontSizeHero5: CGFloat { Self.FontSizeHero5 }
    public var FontWeightBodyBold: String { Self.FontWeightBodyBold }
    public var FontWeightBodyLight: String { Self.FontWeightBodyLight }
    public var FontWeightBodyMedium: String { Self.FontWeightBodyMedium }
    public var FontWeightBodyRegular: String { Self.FontWeightBodyRegular }
    public var FontWeightBodySemibold: String { Self.FontWeightBodySemibold }
    public var FontWeightCondensedBold: CGFloat { Self.FontWeightCondensedBold }
    public var FontWeightCondensedRegular: CGFloat { Self.FontWeightCondensedRegular }
    public var FontWeightCondensedSemibold: CGFloat { Self.FontWeightCondensedSemibold }
    public var FontWeightHeadingBold: String { Self.FontWeightHeadingBold }
    public var FontWeightHeadingExtrabold: String { Self.FontWeightHeadingExtrabold }
    public var FontWeightHeadingSemibold: String { Self.FontWeightHeadingSemibold }
    public var GradientBrandPrimary: LinearGradient { Self.GradientBrandPrimary }
    public var GradientBrandSecondary: LinearGradient { Self.GradientBrandSecondary }
    public var GradientSurfaceSubtle: LinearGradient { Self.GradientSurfaceSubtle }
    public var HeadingH1ExtraboldBaseFontFamily: String { Self.HeadingH1ExtraboldBaseFontFamily }
    public var HeadingH1ExtraboldBaseFontSize: Int { Self.HeadingH1ExtraboldBaseFontSize }
    public var HeadingH1ExtraboldBaseFontWeight: String { Self.HeadingH1ExtraboldBaseFontWeight }
    public var HeadingH1ExtraboldBaseLetterSpacing: Int { Self.HeadingH1ExtraboldBaseLetterSpacing }
    public var HeadingH1ExtraboldBaseLineHeight: Int { Self.HeadingH1ExtraboldBaseLineHeight }
    public var HeadingH1ExtraboldNoneFontFamily: String { Self.HeadingH1ExtraboldNoneFontFamily }
    public var HeadingH1ExtraboldNoneFontSize: Int { Self.HeadingH1ExtraboldNoneFontSize }
    public var HeadingH1ExtraboldNoneFontWeight: String { Self.HeadingH1ExtraboldNoneFontWeight }
    public var HeadingH1ExtraboldNoneLetterSpacing: Int { Self.HeadingH1ExtraboldNoneLetterSpacing }
    public var HeadingH1ExtraboldNoneLineHeight: Int { Self.HeadingH1ExtraboldNoneLineHeight }
    public var HeadingH1ExtraboldTightFontFamily: String { Self.HeadingH1ExtraboldTightFontFamily }
    public var HeadingH1ExtraboldTightFontSize: Int { Self.HeadingH1ExtraboldTightFontSize }
    public var HeadingH1ExtraboldTightFontWeight: String { Self.HeadingH1ExtraboldTightFontWeight }
    public var HeadingH1ExtraboldTightLetterSpacing: Int { Self.HeadingH1ExtraboldTightLetterSpacing }
    public var HeadingH1ExtraboldTightLineHeight: Int { Self.HeadingH1ExtraboldTightLineHeight }
    public var HeadingH1SemiboldBaseFontFamily: String { Self.HeadingH1SemiboldBaseFontFamily }
    public var HeadingH1SemiboldBaseFontSize: Int { Self.HeadingH1SemiboldBaseFontSize }
    public var HeadingH1SemiboldBaseFontWeight: String { Self.HeadingH1SemiboldBaseFontWeight }
    public var HeadingH1SemiboldBaseLetterSpacing: Int { Self.HeadingH1SemiboldBaseLetterSpacing }
    public var HeadingH1SemiboldBaseLineHeight: Int { Self.HeadingH1SemiboldBaseLineHeight }
    public var HeadingH1SemiboldNoneFontFamily: String { Self.HeadingH1SemiboldNoneFontFamily }
    public var HeadingH1SemiboldNoneFontSize: Int { Self.HeadingH1SemiboldNoneFontSize }
    public var HeadingH1SemiboldNoneFontWeight: String { Self.HeadingH1SemiboldNoneFontWeight }
    public var HeadingH1SemiboldNoneLetterSpacing: Int { Self.HeadingH1SemiboldNoneLetterSpacing }
    public var HeadingH1SemiboldNoneLineHeight: Int { Self.HeadingH1SemiboldNoneLineHeight }
    public var HeadingH1SemiboldTightFontFamily: String { Self.HeadingH1SemiboldTightFontFamily }
    public var HeadingH1SemiboldTightFontSize: Int { Self.HeadingH1SemiboldTightFontSize }
    public var HeadingH1SemiboldTightFontWeight: String { Self.HeadingH1SemiboldTightFontWeight }
    public var HeadingH1SemiboldTightLetterSpacing: Int { Self.HeadingH1SemiboldTightLetterSpacing }
    public var HeadingH1SemiboldTightLineHeight: Int { Self.HeadingH1SemiboldTightLineHeight }
    public var HeadingH2ExtraboldBaseFontFamily: String { Self.HeadingH2ExtraboldBaseFontFamily }
    public var HeadingH2ExtraboldBaseFontSize: Int { Self.HeadingH2ExtraboldBaseFontSize }
    public var HeadingH2ExtraboldBaseFontWeight: String { Self.HeadingH2ExtraboldBaseFontWeight }
    public var HeadingH2ExtraboldBaseLetterSpacing: Int { Self.HeadingH2ExtraboldBaseLetterSpacing }
    public var HeadingH2ExtraboldBaseLineHeight: Int { Self.HeadingH2ExtraboldBaseLineHeight }
    public var HeadingH2ExtraboldNoneFontFamily: String { Self.HeadingH2ExtraboldNoneFontFamily }
    public var HeadingH2ExtraboldNoneFontSize: Int { Self.HeadingH2ExtraboldNoneFontSize }
    public var HeadingH2ExtraboldNoneFontWeight: String { Self.HeadingH2ExtraboldNoneFontWeight }
    public var HeadingH2ExtraboldNoneLetterSpacing: Int { Self.HeadingH2ExtraboldNoneLetterSpacing }
    public var HeadingH2ExtraboldNoneLineHeight: Int { Self.HeadingH2ExtraboldNoneLineHeight }
    public var HeadingH2ExtraboldTightFontFamily: String { Self.HeadingH2ExtraboldTightFontFamily }
    public var HeadingH2ExtraboldTightFontSize: Int { Self.HeadingH2ExtraboldTightFontSize }
    public var HeadingH2ExtraboldTightFontWeight: String { Self.HeadingH2ExtraboldTightFontWeight }
    public var HeadingH2ExtraboldTightLetterSpacing: Int { Self.HeadingH2ExtraboldTightLetterSpacing }
    public var HeadingH2ExtraboldTightLineHeight: Int { Self.HeadingH2ExtraboldTightLineHeight }
    public var HeadingH2SemiboldBaseFontFamily: String { Self.HeadingH2SemiboldBaseFontFamily }
    public var HeadingH2SemiboldBaseFontSize: Int { Self.HeadingH2SemiboldBaseFontSize }
    public var HeadingH2SemiboldBaseFontWeight: String { Self.HeadingH2SemiboldBaseFontWeight }
    public var HeadingH2SemiboldBaseLetterSpacing: Int { Self.HeadingH2SemiboldBaseLetterSpacing }
    public var HeadingH2SemiboldBaseLineHeight: Int { Self.HeadingH2SemiboldBaseLineHeight }
    public var HeadingH2SemiboldNoneFontFamily: String { Self.HeadingH2SemiboldNoneFontFamily }
    public var HeadingH2SemiboldNoneFontSize: Int { Self.HeadingH2SemiboldNoneFontSize }
    public var HeadingH2SemiboldNoneFontWeight: String { Self.HeadingH2SemiboldNoneFontWeight }
    public var HeadingH2SemiboldNoneLetterSpacing: Int { Self.HeadingH2SemiboldNoneLetterSpacing }
    public var HeadingH2SemiboldNoneLineHeight: Int { Self.HeadingH2SemiboldNoneLineHeight }
    public var HeadingH2SemiboldTightFontFamily: String { Self.HeadingH2SemiboldTightFontFamily }
    public var HeadingH2SemiboldTightFontSize: Int { Self.HeadingH2SemiboldTightFontSize }
    public var HeadingH2SemiboldTightFontWeight: String { Self.HeadingH2SemiboldTightFontWeight }
    public var HeadingH2SemiboldTightLetterSpacing: Int { Self.HeadingH2SemiboldTightLetterSpacing }
    public var HeadingH2SemiboldTightLineHeight: Int { Self.HeadingH2SemiboldTightLineHeight }
    public var HeadingH3ExtraboldBaseFontFamily: String { Self.HeadingH3ExtraboldBaseFontFamily }
    public var HeadingH3ExtraboldBaseFontSize: Int { Self.HeadingH3ExtraboldBaseFontSize }
    public var HeadingH3ExtraboldBaseFontWeight: String { Self.HeadingH3ExtraboldBaseFontWeight }
    public var HeadingH3ExtraboldBaseLetterSpacing: Int { Self.HeadingH3ExtraboldBaseLetterSpacing }
    public var HeadingH3ExtraboldBaseLineHeight: Int { Self.HeadingH3ExtraboldBaseLineHeight }
    public var HeadingH3ExtraboldNoneFontFamily: String { Self.HeadingH3ExtraboldNoneFontFamily }
    public var HeadingH3ExtraboldNoneFontSize: Int { Self.HeadingH3ExtraboldNoneFontSize }
    public var HeadingH3ExtraboldNoneFontWeight: String { Self.HeadingH3ExtraboldNoneFontWeight }
    public var HeadingH3ExtraboldNoneLetterSpacing: Int { Self.HeadingH3ExtraboldNoneLetterSpacing }
    public var HeadingH3ExtraboldNoneLineHeight: Int { Self.HeadingH3ExtraboldNoneLineHeight }
    public var HeadingH3ExtraboldTightFontFamily: String { Self.HeadingH3ExtraboldTightFontFamily }
    public var HeadingH3ExtraboldTightFontSize: Int { Self.HeadingH3ExtraboldTightFontSize }
    public var HeadingH3ExtraboldTightFontWeight: String { Self.HeadingH3ExtraboldTightFontWeight }
    public var HeadingH3ExtraboldTightLetterSpacing: Int { Self.HeadingH3ExtraboldTightLetterSpacing }
    public var HeadingH3ExtraboldTightLineHeight: Int { Self.HeadingH3ExtraboldTightLineHeight }
    public var HeadingH3SemiboldBaseFontFamily: String { Self.HeadingH3SemiboldBaseFontFamily }
    public var HeadingH3SemiboldBaseFontSize: Int { Self.HeadingH3SemiboldBaseFontSize }
    public var HeadingH3SemiboldBaseFontWeight: String { Self.HeadingH3SemiboldBaseFontWeight }
    public var HeadingH3SemiboldBaseLetterSpacing: Int { Self.HeadingH3SemiboldBaseLetterSpacing }
    public var HeadingH3SemiboldBaseLineHeight: Int { Self.HeadingH3SemiboldBaseLineHeight }
    public var HeadingH3SemiboldNoneFontFamily: String { Self.HeadingH3SemiboldNoneFontFamily }
    public var HeadingH3SemiboldNoneFontSize: Int { Self.HeadingH3SemiboldNoneFontSize }
    public var HeadingH3SemiboldNoneFontWeight: String { Self.HeadingH3SemiboldNoneFontWeight }
    public var HeadingH3SemiboldNoneLetterSpacing: Int { Self.HeadingH3SemiboldNoneLetterSpacing }
    public var HeadingH3SemiboldNoneLineHeight: Int { Self.HeadingH3SemiboldNoneLineHeight }
    public var HeadingH3SemiboldTightFontFamily: String { Self.HeadingH3SemiboldTightFontFamily }
    public var HeadingH3SemiboldTightFontSize: Int { Self.HeadingH3SemiboldTightFontSize }
    public var HeadingH3SemiboldTightFontWeight: String { Self.HeadingH3SemiboldTightFontWeight }
    public var HeadingH3SemiboldTightLetterSpacing: Int { Self.HeadingH3SemiboldTightLetterSpacing }
    public var HeadingH3SemiboldTightLineHeight: Int { Self.HeadingH3SemiboldTightLineHeight }
    public var HeadingH4ExtraboldBaseFontFamily: String { Self.HeadingH4ExtraboldBaseFontFamily }
    public var HeadingH4ExtraboldBaseFontSize: Int { Self.HeadingH4ExtraboldBaseFontSize }
    public var HeadingH4ExtraboldBaseFontWeight: String { Self.HeadingH4ExtraboldBaseFontWeight }
    public var HeadingH4ExtraboldBaseLetterSpacing: Int { Self.HeadingH4ExtraboldBaseLetterSpacing }
    public var HeadingH4ExtraboldBaseLineHeight: Int { Self.HeadingH4ExtraboldBaseLineHeight }
    public var HeadingH4ExtraboldNoneFontFamily: String { Self.HeadingH4ExtraboldNoneFontFamily }
    public var HeadingH4ExtraboldNoneFontSize: Int { Self.HeadingH4ExtraboldNoneFontSize }
    public var HeadingH4ExtraboldNoneFontWeight: String { Self.HeadingH4ExtraboldNoneFontWeight }
    public var HeadingH4ExtraboldNoneLetterSpacing: Int { Self.HeadingH4ExtraboldNoneLetterSpacing }
    public var HeadingH4ExtraboldNoneLineHeight: Int { Self.HeadingH4ExtraboldNoneLineHeight }
    public var HeadingH4ExtraboldTightFontFamily: String { Self.HeadingH4ExtraboldTightFontFamily }
    public var HeadingH4ExtraboldTightFontSize: Int { Self.HeadingH4ExtraboldTightFontSize }
    public var HeadingH4ExtraboldTightFontWeight: String { Self.HeadingH4ExtraboldTightFontWeight }
    public var HeadingH4ExtraboldTightLetterSpacing: Int { Self.HeadingH4ExtraboldTightLetterSpacing }
    public var HeadingH4ExtraboldTightLineHeight: Int { Self.HeadingH4ExtraboldTightLineHeight }
    public var HeadingH4SemiboldBaseFontFamily: String { Self.HeadingH4SemiboldBaseFontFamily }
    public var HeadingH4SemiboldBaseFontSize: Int { Self.HeadingH4SemiboldBaseFontSize }
    public var HeadingH4SemiboldBaseFontWeight: String { Self.HeadingH4SemiboldBaseFontWeight }
    public var HeadingH4SemiboldBaseLetterSpacing: Int { Self.HeadingH4SemiboldBaseLetterSpacing }
    public var HeadingH4SemiboldBaseLineHeight: Int { Self.HeadingH4SemiboldBaseLineHeight }
    public var HeadingH4SemiboldNoneFontFamily: String { Self.HeadingH4SemiboldNoneFontFamily }
    public var HeadingH4SemiboldNoneFontSize: Int { Self.HeadingH4SemiboldNoneFontSize }
    public var HeadingH4SemiboldNoneFontWeight: String { Self.HeadingH4SemiboldNoneFontWeight }
    public var HeadingH4SemiboldNoneLetterSpacing: Int { Self.HeadingH4SemiboldNoneLetterSpacing }
    public var HeadingH4SemiboldNoneLineHeight: Int { Self.HeadingH4SemiboldNoneLineHeight }
    public var HeadingH4SemiboldTightFontFamily: String { Self.HeadingH4SemiboldTightFontFamily }
    public var HeadingH4SemiboldTightFontSize: Int { Self.HeadingH4SemiboldTightFontSize }
    public var HeadingH4SemiboldTightFontWeight: String { Self.HeadingH4SemiboldTightFontWeight }
    public var HeadingH4SemiboldTightLetterSpacing: Int { Self.HeadingH4SemiboldTightLetterSpacing }
    public var HeadingH4SemiboldTightLineHeight: Int { Self.HeadingH4SemiboldTightLineHeight }
    public var HeadingH5ExtraboldBaseFontFamily: String { Self.HeadingH5ExtraboldBaseFontFamily }
    public var HeadingH5ExtraboldBaseFontSize: Int { Self.HeadingH5ExtraboldBaseFontSize }
    public var HeadingH5ExtraboldBaseFontWeight: String { Self.HeadingH5ExtraboldBaseFontWeight }
    public var HeadingH5ExtraboldBaseLetterSpacing: Int { Self.HeadingH5ExtraboldBaseLetterSpacing }
    public var HeadingH5ExtraboldBaseLineHeight: Int { Self.HeadingH5ExtraboldBaseLineHeight }
    public var HeadingH5ExtraboldNoneFontFamily: String { Self.HeadingH5ExtraboldNoneFontFamily }
    public var HeadingH5ExtraboldNoneFontSize: Int { Self.HeadingH5ExtraboldNoneFontSize }
    public var HeadingH5ExtraboldNoneFontWeight: String { Self.HeadingH5ExtraboldNoneFontWeight }
    public var HeadingH5ExtraboldNoneLetterSpacing: Int { Self.HeadingH5ExtraboldNoneLetterSpacing }
    public var HeadingH5ExtraboldNoneLineHeight: Int { Self.HeadingH5ExtraboldNoneLineHeight }
    public var HeadingH5ExtraboldTightFontFamily: String { Self.HeadingH5ExtraboldTightFontFamily }
    public var HeadingH5ExtraboldTightFontSize: Int { Self.HeadingH5ExtraboldTightFontSize }
    public var HeadingH5ExtraboldTightFontWeight: String { Self.HeadingH5ExtraboldTightFontWeight }
    public var HeadingH5ExtraboldTightLetterSpacing: Int { Self.HeadingH5ExtraboldTightLetterSpacing }
    public var HeadingH5ExtraboldTightLineHeight: Int { Self.HeadingH5ExtraboldTightLineHeight }
    public var HeadingH5SemiboldBaseFontFamily: String { Self.HeadingH5SemiboldBaseFontFamily }
    public var HeadingH5SemiboldBaseFontSize: Int { Self.HeadingH5SemiboldBaseFontSize }
    public var HeadingH5SemiboldBaseFontWeight: String { Self.HeadingH5SemiboldBaseFontWeight }
    public var HeadingH5SemiboldBaseLetterSpacing: Int { Self.HeadingH5SemiboldBaseLetterSpacing }
    public var HeadingH5SemiboldBaseLineHeight: Int { Self.HeadingH5SemiboldBaseLineHeight }
    public var HeadingH5SemiboldNoneFontFamily: String { Self.HeadingH5SemiboldNoneFontFamily }
    public var HeadingH5SemiboldNoneFontSize: Int { Self.HeadingH5SemiboldNoneFontSize }
    public var HeadingH5SemiboldNoneFontWeight: String { Self.HeadingH5SemiboldNoneFontWeight }
    public var HeadingH5SemiboldNoneLetterSpacing: Int { Self.HeadingH5SemiboldNoneLetterSpacing }
    public var HeadingH5SemiboldNoneLineHeight: Int { Self.HeadingH5SemiboldNoneLineHeight }
    public var HeadingH5SemiboldTightFontFamily: String { Self.HeadingH5SemiboldTightFontFamily }
    public var HeadingH5SemiboldTightFontSize: Int { Self.HeadingH5SemiboldTightFontSize }
    public var HeadingH5SemiboldTightFontWeight: String { Self.HeadingH5SemiboldTightFontWeight }
    public var HeadingH5SemiboldTightLetterSpacing: Int { Self.HeadingH5SemiboldTightLetterSpacing }
    public var HeadingH5SemiboldTightLineHeight: Int { Self.HeadingH5SemiboldTightLineHeight }
    public var HeadingH6ExtraboldBaseFontFamily: String { Self.HeadingH6ExtraboldBaseFontFamily }
    public var HeadingH6ExtraboldBaseFontSize: Int { Self.HeadingH6ExtraboldBaseFontSize }
    public var HeadingH6ExtraboldBaseFontWeight: String { Self.HeadingH6ExtraboldBaseFontWeight }
    public var HeadingH6ExtraboldBaseLetterSpacing: Int { Self.HeadingH6ExtraboldBaseLetterSpacing }
    public var HeadingH6ExtraboldBaseLineHeight: Int { Self.HeadingH6ExtraboldBaseLineHeight }
    public var HeadingH6ExtraboldNoneFontFamily: String { Self.HeadingH6ExtraboldNoneFontFamily }
    public var HeadingH6ExtraboldNoneFontSize: Int { Self.HeadingH6ExtraboldNoneFontSize }
    public var HeadingH6ExtraboldNoneFontWeight: String { Self.HeadingH6ExtraboldNoneFontWeight }
    public var HeadingH6ExtraboldNoneLetterSpacing: Int { Self.HeadingH6ExtraboldNoneLetterSpacing }
    public var HeadingH6ExtraboldNoneLineHeight: Int { Self.HeadingH6ExtraboldNoneLineHeight }
    public var HeadingH6ExtraboldTightFontFamily: String { Self.HeadingH6ExtraboldTightFontFamily }
    public var HeadingH6ExtraboldTightFontSize: Int { Self.HeadingH6ExtraboldTightFontSize }
    public var HeadingH6ExtraboldTightFontWeight: String { Self.HeadingH6ExtraboldTightFontWeight }
    public var HeadingH6ExtraboldTightLetterSpacing: Int { Self.HeadingH6ExtraboldTightLetterSpacing }
    public var HeadingH6ExtraboldTightLineHeight: Int { Self.HeadingH6ExtraboldTightLineHeight }
    public var HeadingH6SemiboldBaseFontFamily: String { Self.HeadingH6SemiboldBaseFontFamily }
    public var HeadingH6SemiboldBaseFontSize: Int { Self.HeadingH6SemiboldBaseFontSize }
    public var HeadingH6SemiboldBaseFontWeight: String { Self.HeadingH6SemiboldBaseFontWeight }
    public var HeadingH6SemiboldBaseLetterSpacing: Int { Self.HeadingH6SemiboldBaseLetterSpacing }
    public var HeadingH6SemiboldBaseLineHeight: Int { Self.HeadingH6SemiboldBaseLineHeight }
    public var HeadingH6SemiboldNoneFontFamily: String { Self.HeadingH6SemiboldNoneFontFamily }
    public var HeadingH6SemiboldNoneFontSize: Int { Self.HeadingH6SemiboldNoneFontSize }
    public var HeadingH6SemiboldNoneFontWeight: String { Self.HeadingH6SemiboldNoneFontWeight }
    public var HeadingH6SemiboldNoneLetterSpacing: Int { Self.HeadingH6SemiboldNoneLetterSpacing }
    public var HeadingH6SemiboldNoneLineHeight: Int { Self.HeadingH6SemiboldNoneLineHeight }
    public var HeadingH6SemiboldTightFontFamily: String { Self.HeadingH6SemiboldTightFontFamily }
    public var HeadingH6SemiboldTightFontSize: Int { Self.HeadingH6SemiboldTightFontSize }
    public var HeadingH6SemiboldTightFontWeight: String { Self.HeadingH6SemiboldTightFontWeight }
    public var HeadingH6SemiboldTightLetterSpacing: Int { Self.HeadingH6SemiboldTightLetterSpacing }
    public var HeadingH6SemiboldTightLineHeight: Int { Self.HeadingH6SemiboldTightLineHeight }
    public var Radius: CGFloat { Self.Radius }
    public var Radius0: CGFloat { Self.Radius0 }
    public var Radius1: CGFloat { Self.Radius1 }
    public var Radius10: CGFloat { Self.Radius10 }
    public var Radius11: CGFloat { Self.Radius11 }
    public var Radius12: CGFloat { Self.Radius12 }
    public var Radius13: CGFloat { Self.Radius13 }
    public var Radius14: CGFloat { Self.Radius14 }
    public var Radius15: CGFloat { Self.Radius15 }
    public var Radius16: CGFloat { Self.Radius16 }
    public var Radius17: CGFloat { Self.Radius17 }
    public var Radius18: CGFloat { Self.Radius18 }
    public var Radius19: CGFloat { Self.Radius19 }
    public var Radius2: CGFloat { Self.Radius2 }
    public var Radius20: CGFloat { Self.Radius20 }
    public var Radius3: CGFloat { Self.Radius3 }
    public var Radius4: CGFloat { Self.Radius4 }
    public var Radius5: CGFloat { Self.Radius5 }
    public var Radius6: CGFloat { Self.Radius6 }
    public var Radius7: CGFloat { Self.Radius7 }
    public var Radius8: CGFloat { Self.Radius8 }
    public var Radius9: CGFloat { Self.Radius9 }
    public var Radius999: CGFloat { Self.Radius999 }
    public var Spacing0: CGFloat { Self.Spacing0 }
    public var Spacing1: CGFloat { Self.Spacing1 }
    public var Spacing10: CGFloat { Self.Spacing10 }
    public var Spacing11: CGFloat { Self.Spacing11 }
    public var Spacing12: CGFloat { Self.Spacing12 }
    public var Spacing13: CGFloat { Self.Spacing13 }
    public var Spacing14: CGFloat { Self.Spacing14 }
    public var Spacing15: CGFloat { Self.Spacing15 }
    public var Spacing16: CGFloat { Self.Spacing16 }
    public var Spacing17: CGFloat { Self.Spacing17 }
    public var Spacing18: CGFloat { Self.Spacing18 }
    public var Spacing19: CGFloat { Self.Spacing19 }
    public var Spacing1px: CGFloat { Self.Spacing1px }
    public var Spacing2: CGFloat { Self.Spacing2 }
    public var Spacing20: CGFloat { Self.Spacing20 }
    public var Spacing21: CGFloat { Self.Spacing21 }
    public var Spacing22: CGFloat { Self.Spacing22 }
    public var Spacing23: CGFloat { Self.Spacing23 }
    public var Spacing24: CGFloat { Self.Spacing24 }
    public var Spacing25: CGFloat { Self.Spacing25 }
    public var Spacing26: CGFloat { Self.Spacing26 }
    public var Spacing27: CGFloat { Self.Spacing27 }
    public var Spacing28: CGFloat { Self.Spacing28 }
    public var Spacing29: CGFloat { Self.Spacing29 }
    public var Spacing2Tba: CGFloat { Self.Spacing2Tba }
    public var Spacing2px: CGFloat { Self.Spacing2px }
    public var Spacing3: CGFloat { Self.Spacing3 }
    public var Spacing30: CGFloat { Self.Spacing30 }
    public var Spacing31: CGFloat { Self.Spacing31 }
    public var Spacing32: CGFloat { Self.Spacing32 }
    public var Spacing33: CGFloat { Self.Spacing33 }
    public var Spacing34: CGFloat { Self.Spacing34 }
    public var Spacing35: CGFloat { Self.Spacing35 }
    public var Spacing36: CGFloat { Self.Spacing36 }
    public var Spacing4: CGFloat { Self.Spacing4 }
    public var Spacing5: CGFloat { Self.Spacing5 }
    public var Spacing6: CGFloat { Self.Spacing6 }
    public var Spacing6px: CGFloat { Self.Spacing6px }
    public var Spacing7: CGFloat { Self.Spacing7 }
    public var Spacing8: CGFloat { Self.Spacing8 }
    public var Spacing9: CGFloat { Self.Spacing9 }
}