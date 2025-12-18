import SwiftUI

// MARK: - Design System Demo View
/// Comprehensive showcase of all design tokens from DesignSystemGlobal.
/// Organized by category: Colors, Typography, Spacing, Border Radius, Border Width, and Elevation.

struct DesignSystemDemoView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing6) {

                // MARK: - Header Card
                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                    Text("Design System")
                        .thdFont(.hero5)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

                    Text("Complete showcase of all design tokens including colors, typography, spacing, and borders.")
                        .thdFont(.bodyMd)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)
                }
                .padding(DesignSystemGlobal.Spacing4)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusXl)
                        .fill(DesignSystemGlobal.BackgroundContainerColorWhite)
                )

                // MARK: - Brand Colors
                ColorPaletteSection(
                    title: "Brand Colors",
                    subtitle: "Primary brand orange palette",
                    colors: [
                        ("Brand025", DesignSystemGlobal.BrandBrand025),
                        ("Brand050", DesignSystemGlobal.BrandBrand050),
                        ("Brand100", DesignSystemGlobal.BrandBrand100),
                        ("Brand200", DesignSystemGlobal.BrandBrand200),
                        ("Brand300", DesignSystemGlobal.BrandBrand300),
                        ("Brand400", DesignSystemGlobal.BrandBrand400),
                        ("Brand500", DesignSystemGlobal.BrandBrand500),
                        ("Brand600", DesignSystemGlobal.BrandBrand600),
                        ("Brand700", DesignSystemGlobal.BrandBrand700),
                        ("Brand800", DesignSystemGlobal.BrandBrand800),
                        ("Brand900", DesignSystemGlobal.BrandBrand900),
                        ("Brand950", DesignSystemGlobal.BrandBrand950)
                    ]
                )

                // MARK: - Greige Colors
                ColorPaletteSection(
                    title: "Greige Colors",
                    subtitle: "Neutral gray-beige palette",
                    colors: [
                        ("Greige025", DesignSystemGlobal.GreigeGreige025),
                        ("Greige050", DesignSystemGlobal.GreigeGreige050),
                        ("Greige100", DesignSystemGlobal.GreigeGreige100),
                        ("Greige200", DesignSystemGlobal.GreigeGreige200),
                        ("Greige300", DesignSystemGlobal.GreigeGreige300),
                        ("Greige400", DesignSystemGlobal.GreigeGreige400),
                        ("Greige500", DesignSystemGlobal.GreigeGreige500),
                        ("Greige600", DesignSystemGlobal.GreigeGreige600),
                        ("Greige700", DesignSystemGlobal.GreigeGreige700),
                        ("Greige800", DesignSystemGlobal.GreigeGreige800),
                        ("Greige900", DesignSystemGlobal.GreigeGreige900),
                        ("Greige950", DesignSystemGlobal.GreigeGreige950)
                    ]
                )

                // MARK: - Moonlight Colors (Blue)
                ColorPaletteSection(
                    title: "Moonlight Colors",
                    subtitle: "Informational blue palette",
                    colors: [
                        ("Moonlight025", DesignSystemGlobal.MoonlightMoonlight025),
                        ("Moonlight050", DesignSystemGlobal.MoonlightMoonlight050),
                        ("Moonlight100", DesignSystemGlobal.MoonlightMoonlight100),
                        ("Moonlight200", DesignSystemGlobal.MoonlightMoonlight200),
                        ("Moonlight300", DesignSystemGlobal.MoonlightMoonlight300),
                        ("Moonlight400", DesignSystemGlobal.MoonlightMoonlight400),
                        ("Moonlight500", DesignSystemGlobal.MoonlightMoonlight500),
                        ("Moonlight600", DesignSystemGlobal.MoonlightMoonlight600),
                        ("Moonlight700", DesignSystemGlobal.MoonlightMoonlight700),
                        ("Moonlight800", DesignSystemGlobal.MoonlightMoonlight800),
                        ("Moonlight900", DesignSystemGlobal.MoonlightMoonlight900),
                        ("Moonlight950", DesignSystemGlobal.MoonlightMoonlight950)
                    ]
                )

                // MARK: - Bottle Green Colors
                ColorPaletteSection(
                    title: "Bottle Green Colors",
                    subtitle: "Success green palette",
                    colors: [
                        ("BottleGreen025", DesignSystemGlobal.BottleGreenBottleGreen025),
                        ("BottleGreen050", DesignSystemGlobal.BottleGreenBottleGreen050),
                        ("BottleGreen100", DesignSystemGlobal.BottleGreenBottleGreen100),
                        ("BottleGreen200", DesignSystemGlobal.BottleGreenBottleGreen200),
                        ("BottleGreen300", DesignSystemGlobal.BottleGreenBottleGreen300),
                        ("BottleGreen400", DesignSystemGlobal.BottleGreenBottleGreen400),
                        ("BottleGreen500", DesignSystemGlobal.BottleGreenBottleGreen500),
                        ("BottleGreen600", DesignSystemGlobal.BottleGreenBottleGreen600),
                        ("BottleGreen700", DesignSystemGlobal.BottleGreenBottleGreen700),
                        ("BottleGreen800", DesignSystemGlobal.BottleGreenBottleGreen800),
                        ("BottleGreen900", DesignSystemGlobal.BottleGreenBottleGreen900),
                        ("BottleGreen950", DesignSystemGlobal.BottleGreenBottleGreen950)
                    ]
                )

                // MARK: - Lemon Colors (Yellow)
                ColorPaletteSection(
                    title: "Lemon Colors",
                    subtitle: "Warning yellow palette",
                    colors: [
                        ("Lemon025", DesignSystemGlobal.LemonLemon025),
                        ("Lemon050", DesignSystemGlobal.LemonLemon050),
                        ("Lemon100", DesignSystemGlobal.LemonLemon100),
                        ("Lemon200", DesignSystemGlobal.LemonLemon200),
                        ("Lemon300", DesignSystemGlobal.LemonLemon300),
                        ("Lemon400", DesignSystemGlobal.LemonLemon400),
                        ("Lemon500", DesignSystemGlobal.LemonLemon500),
                        ("Lemon600", DesignSystemGlobal.LemonLemon600),
                        ("Lemon700", DesignSystemGlobal.LemonLemon700),
                        ("Lemon800", DesignSystemGlobal.LemonLemon800),
                        ("Lemon900", DesignSystemGlobal.LemonLemon900),
                        ("Lemon950", DesignSystemGlobal.LemonLemon950)
                    ]
                )

                // MARK: - Cinnabar Colors (Red)
                ColorPaletteSection(
                    title: "Cinnabar Colors",
                    subtitle: "Error red palette",
                    colors: [
                        ("Cinnabar025", DesignSystemGlobal.CinnabarCinnabar025),
                        ("Cinnabar050", DesignSystemGlobal.CinnabarCinnabar050),
                        ("Cinnabar100", DesignSystemGlobal.CinnabarCinnabar100),
                        ("Cinnabar200", DesignSystemGlobal.CinnabarCinnabar200),
                        ("Cinnabar300", DesignSystemGlobal.CinnabarCinnabar300),
                        ("Cinnabar400", DesignSystemGlobal.CinnabarCinnabar400),
                        ("Cinnabar500", DesignSystemGlobal.CinnabarCinnabar500),
                        ("Cinnabar600", DesignSystemGlobal.CinnabarCinnabar600),
                        ("Cinnabar700", DesignSystemGlobal.CinnabarCinnabar700),
                        ("Cinnabar800", DesignSystemGlobal.CinnabarCinnabar800),
                        ("Cinnabar900", DesignSystemGlobal.CinnabarCinnabar900),
                        ("Cinnabar950", DesignSystemGlobal.CinnabarCinnabar950)
                    ]
                )

                // MARK: - Chamoisee Colors (Brown)
                ColorPaletteSection(
                    title: "Chamoisee Colors",
                    subtitle: "Brown accent palette",
                    colors: [
                        ("Chamoisee025", DesignSystemGlobal.ChamoiseeChamoisee025),
                        ("Chamoisee050", DesignSystemGlobal.ChamoiseeChamoisee050),
                        ("Chamoisee100", DesignSystemGlobal.ChamoiseeChamoisee100),
                        ("Chamoisee200", DesignSystemGlobal.ChamoiseeChamoisee200),
                        ("Chamoisee300", DesignSystemGlobal.ChamoiseeChamoisee300),
                        ("Chamoisee400", DesignSystemGlobal.ChamoiseeChamoisee400),
                        ("Chamoisee500", DesignSystemGlobal.ChamoiseeChamoisee500),
                        ("Chamoisee600", DesignSystemGlobal.ChamoiseeChamoisee600),
                        ("Chamoisee700", DesignSystemGlobal.ChamoiseeChamoisee700),
                        ("Chamoisee800", DesignSystemGlobal.ChamoiseeChamoisee800),
                        ("Chamoisee900", DesignSystemGlobal.ChamoiseeChamoisee900),
                        ("Chamoisee950", DesignSystemGlobal.ChamoiseeChamoisee950)
                    ]
                )

                // MARK: - Transparent Black
                ColorPaletteSection(
                    title: "Transparent Black",
                    subtitle: "Black with varying opacity",
                    colors: [
                        ("025 (2%)", DesignSystemGlobal.TransparentBlackTransparentBlack025),
                        ("050 (5%)", DesignSystemGlobal.TransparentBlackTransparentBlack050),
                        ("075 (7%)", DesignSystemGlobal.TransparentBlackTransparentBlack075),
                        ("100 (10%)", DesignSystemGlobal.TransparentBlackTransparentBlack100),
                        ("200 (15%)", DesignSystemGlobal.TransparentBlackTransparentBlack200),
                        ("300 (20%)", DesignSystemGlobal.TransparentBlackTransparentBlack300),
                        ("400 (24%)", DesignSystemGlobal.TransparentBlackTransparentBlack400),
                        ("500 (32%)", DesignSystemGlobal.TransparentBlackTransparentBlack500),
                        ("600 (50%)", DesignSystemGlobal.TransparentBlackTransparentBlack600),
                        ("700 (60%)", DesignSystemGlobal.TransparentBlackTransparentBlack700),
                        ("800 (70%)", DesignSystemGlobal.TransparentBlackTransparentBlack800),
                        ("900 (88%)", DesignSystemGlobal.TransparentBlackTransparentBlack900),
                        ("950 (96%)", DesignSystemGlobal.TransparentBlackTransparentBlack950)
                    ],
                    showCheckerboard: true
                )

                // MARK: - Transparent White
                ColorPaletteSection(
                    title: "Transparent White",
                    subtitle: "White with varying opacity",
                    colors: [
                        ("025 (2%)", DesignSystemGlobal.TransparentWhiteTransparentWhite025),
                        ("050 (5%)", DesignSystemGlobal.TransparentWhiteTransparentWhite050),
                        ("075 (7%)", DesignSystemGlobal.TransparentWhiteTransparentWhite075),
                        ("100 (10%)", DesignSystemGlobal.TransparentWhiteTransparentWhite100),
                        ("200 (15%)", DesignSystemGlobal.TransparentWhiteTransparentWhite200),
                        ("300 (20%)", DesignSystemGlobal.TransparentWhiteTransparentWhite300),
                        ("400 (24%)", DesignSystemGlobal.TransparentWhiteTransparentWhite400),
                        ("500 (32%)", DesignSystemGlobal.TransparentWhiteTransparentWhite500),
                        ("600 (50%)", DesignSystemGlobal.TransparentWhiteTransparentWhite600),
                        ("700 (60%)", DesignSystemGlobal.TransparentWhiteTransparentWhite700),
                        ("800 (70%)", DesignSystemGlobal.TransparentWhiteTransparentWhite800),
                        ("900 (88%)", DesignSystemGlobal.TransparentWhiteTransparentWhite900),
                        ("950 (96%)", DesignSystemGlobal.TransparentWhiteTransparentWhite950)
                    ],
                    showCheckerboard: true,
                    darkBackground: true
                )

                // MARK: - Neutrals
                SemanticColorsSection(
                    title: "Neutrals",
                    colors: [
                        ("Black", DesignSystemGlobal.NeutralsBlack),
                        ("White", DesignSystemGlobal.NeutralsWhite),
                        ("Transparent", DesignSystemGlobal.NeutralsTransparent)
                    ]
                )

                // MARK: - Background Colors
                SemanticColorsSection(
                    title: "Background - Container",
                    colors: [
                        ("White", DesignSystemGlobal.BackgroundContainerColorWhite),
                        ("Greige", DesignSystemGlobal.BackgroundContainerColorGreige),
                        ("Brand", DesignSystemGlobal.BackgroundContainerColorBrand),
                        ("Brand Accent", DesignSystemGlobal.BackgroundContainerColorBrandAccent),
                        ("Inverse", DesignSystemGlobal.BackgroundContainerColorInverse),
                        ("Transparent 05", DesignSystemGlobal.BackgroundContainerColorTransparent05),
                        ("Transparent 10", DesignSystemGlobal.BackgroundContainerColorTransparent10),
                        ("Transparent 20", DesignSystemGlobal.BackgroundContainerColorTransparent20)
                    ]
                )

                SemanticColorsSection(
                    title: "Background - Surface",
                    colors: [
                        ("Greige", DesignSystemGlobal.BackgroundSurfaceColorGreige),
                        ("Inverse", DesignSystemGlobal.BackgroundSurfaceColorInverse)
                    ]
                )

                SemanticColorsSection(
                    title: "Background - Feedback",
                    colors: [
                        ("Info Accent 1", DesignSystemGlobal.BackgroundFeedbackColorInformationalAccent1),
                        ("Info Accent 2", DesignSystemGlobal.BackgroundFeedbackColorInformationalAccent2),
                        ("Success Accent 1", DesignSystemGlobal.BackgroundFeedbackColorSuccessAccent1),
                        ("Success Accent 2", DesignSystemGlobal.BackgroundFeedbackColorSuccessAccent2),
                        ("Warning Accent 1", DesignSystemGlobal.BackgroundFeedbackColorWarningAccent1),
                        ("Warning Accent 2", DesignSystemGlobal.BackgroundFeedbackColorWarningAccent2),
                        ("Error Accent 1", DesignSystemGlobal.BackgroundFeedbackColorErrorAccent1),
                        ("Error Accent 2", DesignSystemGlobal.BackgroundFeedbackColorErrorAccent2)
                    ]
                )

                SemanticColorsSection(
                    title: "Background - Accent",
                    colors: [
                        ("Blue", DesignSystemGlobal.BackgroundAccentColorBlue),
                        ("Green", DesignSystemGlobal.BackgroundAccentColorGreen),
                        ("Yellow", DesignSystemGlobal.BackgroundAccentColorYellow),
                        ("Red", DesignSystemGlobal.BackgroundAccentColorRed),
                        ("Brown", DesignSystemGlobal.BackgroundAccentColorBrown)
                    ]
                )

                // MARK: - Text Colors
                SemanticColorsSection(
                    title: "Text - On Container",
                    colors: [
                        ("Primary", DesignSystemGlobal.TextOnContainerColorPrimary),
                        ("Secondary", DesignSystemGlobal.TextOnContainerColorSecondary),
                        ("Tertiary", DesignSystemGlobal.TextOnContainerColorTertiary),
                        ("Quaternary", DesignSystemGlobal.TextOnContainerColorQuatrenary),
                        ("Inactive", DesignSystemGlobal.TextOnContainerColorInactive),
                        ("Inverse", DesignSystemGlobal.TextOnContainerColorInverse),
                        ("Accent", DesignSystemGlobal.TextOnContainerColorAccent),
                        ("Accent 2", DesignSystemGlobal.TextOnContainerColorAccent2),
                        ("Success", DesignSystemGlobal.TextOnContainerColorSuccess),
                        ("Warning", DesignSystemGlobal.TextOnContainerColorWarning),
                        ("Error", DesignSystemGlobal.TextOnContainerColorError),
                        ("Informational", DesignSystemGlobal.TextOnContainerColorInformational)
                    ]
                )

                SemanticColorsSection(
                    title: "Text - On Surface",
                    colors: [
                        ("Primary", DesignSystemGlobal.TextOnSurfaceColorPrimary),
                        ("Secondary", DesignSystemGlobal.TextOnSurfaceColorSecondary),
                        ("Tertiary", DesignSystemGlobal.TextOnSurfaceColorTertiary),
                        ("Quaternary", DesignSystemGlobal.TextOnSurfaceColorQuatrenary),
                        ("Inactive", DesignSystemGlobal.TextOnSurfaceColorInactive),
                        ("Inverse", DesignSystemGlobal.TextOnSurfaceColorInverse),
                        ("Accent", DesignSystemGlobal.TextOnSurfaceColorAccent),
                        ("Success", DesignSystemGlobal.TextOnSurfaceColorSuccess),
                        ("Warning", DesignSystemGlobal.TextOnSurfaceColorWarning),
                        ("Error", DesignSystemGlobal.TextOnSurfaceColorError),
                        ("Informational", DesignSystemGlobal.TextOnSurfaceColorInformational)
                    ]
                )

                // MARK: - Icon Colors
                SemanticColorsSection(
                    title: "Icon - On Container",
                    colors: [
                        ("Primary", DesignSystemGlobal.IconOnContainerColorPrimary),
                        ("Secondary", DesignSystemGlobal.IconOnContainerColorSecondary),
                        ("Tertiary", DesignSystemGlobal.IconOnContainerColorTertiary),
                        ("Inactive", DesignSystemGlobal.IconOnContainerColorInactive),
                        ("Inverse", DesignSystemGlobal.IconOnContainerColorInverse),
                        ("Accent", DesignSystemGlobal.IconOnContainerColorAccent),
                        ("Accent 2", DesignSystemGlobal.IconOnContainerColorAccent2),
                        ("Success", DesignSystemGlobal.IconOnContainerColorSuccess),
                        ("Warning", DesignSystemGlobal.IconOnContainerColorWarning),
                        ("Error", DesignSystemGlobal.IconOnContainerColorError),
                        ("Informational", DesignSystemGlobal.IconOnContainerColorInformational)
                    ]
                )

                // MARK: - Border Colors
                SemanticColorsSection(
                    title: "Border - On Container",
                    colors: [
                        ("Default", DesignSystemGlobal.BorderOnContainerDefault),
                        ("Active", DesignSystemGlobal.BorderOnContainerActive),
                        ("Pressed", DesignSystemGlobal.BorderOnContainerPressed),
                        ("Inactive", DesignSystemGlobal.BorderOnContainerInactive),
                        ("Inverse", DesignSystemGlobal.BorderOnContainerInverse)
                    ]
                )

                SemanticColorsSection(
                    title: "Border - Input",
                    colors: [
                        ("Default", DesignSystemGlobal.BorderInputColorDefault),
                        ("Active", DesignSystemGlobal.BorderInputColorActive),
                        ("Focus", DesignSystemGlobal.BorderInputColorFocus),
                        ("Pressed", DesignSystemGlobal.BorderInputColorPressed),
                        ("Inactive", DesignSystemGlobal.BorderInputColorInactive),
                        ("Accent", DesignSystemGlobal.BorderInputColorAccent),
                        ("Accent 2", DesignSystemGlobal.BorderInputColorAccent2),
                        ("Success", DesignSystemGlobal.BorderInputColorSuccess),
                        ("Warning", DesignSystemGlobal.BorderInputColorWarning),
                        ("Error", DesignSystemGlobal.BorderInputColorError)
                    ]
                )

                SemanticColorsSection(
                    title: "Border - Button",
                    colors: [
                        ("Default", DesignSystemGlobal.BorderButtonColorDefault),
                        ("Focus", DesignSystemGlobal.BorderButtonColorFocus),
                        ("Pressed", DesignSystemGlobal.BorderButtonColorPressed),
                        ("Inactive", DesignSystemGlobal.BorderButtonColorInactive),
                        ("Accent", DesignSystemGlobal.BorderButtonColorAccent),
                        ("Accent 2", DesignSystemGlobal.BorderButtonColorAccent2),
                        ("Orange Outline Default", DesignSystemGlobal.BorderButtonColorOrangeOutlineDefault),
                        ("Orange Outline Inactive", DesignSystemGlobal.BorderButtonColorOrangeOutlineInactive)
                    ]
                )

                // MARK: - Elevation / Shadows
                ElevationSection()

                Divider().padding(.vertical, DesignSystemGlobal.Spacing3)

                // MARK: - Typography
                TypographySection()

                Divider().padding(.vertical, DesignSystemGlobal.Spacing3)

                // MARK: - Spacing
                SpacingSection()

                Divider().padding(.vertical, DesignSystemGlobal.Spacing3)

                // MARK: - Border Radius
                BorderRadiusSection()

                Divider().padding(.vertical, DesignSystemGlobal.Spacing3)

                // MARK: - Border Width
                BorderWidthSection()

            }
            .padding(DesignSystemGlobal.Spacing4)
            .padding(.top, 60) // Padding for top navigation
            .padding(.bottom, 80) // Padding for bottom navigation
        }
        .background(DesignSystemGlobal.BackgroundSurfaceColorGreige)
    }
}

// MARK: - Color Palette Section
/// Displays a horizontal scrolling palette of colors with names
struct ColorPaletteSection: View {
    let title: String
    let subtitle: String
    let colors: [(String, Color)]
    var showCheckerboard: Bool = false
    var darkBackground: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
            VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing1) {
                Text(title)
                    .thdFont(.h6)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)
                Text(subtitle)
                    .thdFont(.bodySm)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)
            }

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: DesignSystemGlobal.Spacing2) {
                    ForEach(colors, id: \.0) { name, color in
                        VStack(spacing: DesignSystemGlobal.Spacing1) {
                            ZStack {
                                if showCheckerboard {
                                    CheckerboardPattern()
                                        .frame(width: 56, height: 56)
                                        .clipShape(RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusLg))
                                }

                                RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusLg)
                                    .fill(color)
                                    .frame(width: 56, height: 56)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusLg)
                                            .stroke(DesignSystemGlobal.BorderOnContainerDefault, lineWidth: 1)
                                    )
                            }

                            Text(name)
                                .thdFont(.caption)
                                .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)
                                .lineLimit(1)
                                .frame(width: 56)
                        }
                    }
                }
                .padding(.vertical, DesignSystemGlobal.Spacing1)
            }
            .padding(DesignSystemGlobal.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusXl)
                    .fill(darkBackground ? DesignSystemGlobal.GreigeGreige900 : DesignSystemGlobal.BackgroundContainerColorWhite)
            )
        }
    }
}

// MARK: - Semantic Colors Section
/// Displays semantic colors in a grid layout
struct SemanticColorsSection: View {
    let title: String
    let colors: [(String, Color)]

    var body: some View {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
            Text(title)
                .thdFont(.h6)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: DesignSystemGlobal.Spacing2) {
                ForEach(colors, id: \.0) { name, color in
                    HStack(spacing: DesignSystemGlobal.Spacing2) {
                        RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusMd)
                            .fill(color)
                            .frame(width: 32, height: 32)
                            .overlay(
                                RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusMd)
                                    .stroke(DesignSystemGlobal.BorderOnContainerDefault, lineWidth: 1)
                            )

                        Text(name)
                            .thdFont(.bodyXs)
                            .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)
                            .lineLimit(2)
                            .minimumScaleFactor(0.8)

                        Spacer()
                    }
                    .padding(DesignSystemGlobal.Spacing2)
                    .background(
                        RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusLg)
                            .fill(DesignSystemGlobal.BackgroundContainerColorWhite)
                    )
                }
            }
        }
    }
}

// MARK: - Elevation Section
struct ElevationSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
            Text("Elevation / Shadows")
                .thdFont(.h5)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

            Text("Shadow colors with blur radius and position offsets")
                .thdFont(.bodySm)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: DesignSystemGlobal.Spacing5) {
                    ElevationCard(
                        title: "Lowest",
                        shadowColor: DesignSystemGlobal.ElevationLowest,
                        blur: DesignSystemGlobal.ElevationBlurRadiusBlur1,
                        x: DesignSystemGlobal.ElevationPositionX1,
                        y: DesignSystemGlobal.ElevationPositionY1
                    )

                    ElevationCard(
                        title: "Low",
                        shadowColor: DesignSystemGlobal.ElevationLow,
                        blur: DesignSystemGlobal.ElevationBlurRadiusBlur2,
                        x: DesignSystemGlobal.ElevationPositionX2,
                        y: DesignSystemGlobal.ElevationPositionY2
                    )

                    ElevationCard(
                        title: "Medium",
                        shadowColor: DesignSystemGlobal.ElevationMed,
                        blur: DesignSystemGlobal.ElevationBlurRadiusBlur3,
                        x: DesignSystemGlobal.ElevationPositionX3,
                        y: DesignSystemGlobal.ElevationPositionY3
                    )

                    ElevationCard(
                        title: "High",
                        shadowColor: DesignSystemGlobal.ElevationHigh,
                        blur: DesignSystemGlobal.ElevationBlurRadiusBlur4,
                        x: DesignSystemGlobal.ElevationPositionX4,
                        y: DesignSystemGlobal.ElevationPositionY4
                    )

                    ElevationCard(
                        title: "Highest",
                        shadowColor: DesignSystemGlobal.ElevationHighest,
                        blur: DesignSystemGlobal.ElevationBlurRadiusBlur5,
                        x: DesignSystemGlobal.ElevationPositionX5,
                        y: DesignSystemGlobal.ElevationPositionY5
                    )
                }
                .padding(DesignSystemGlobal.Spacing4)
            }
            .background(
                RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusXl)
                    .fill(DesignSystemGlobal.BackgroundContainerColorGreige)
            )
        }
    }
}

struct ElevationCard: View {
    let title: String
    let shadowColor: Color
    let blur: CGFloat
    let x: CGFloat
    let y: CGFloat

    var body: some View {
        VStack(spacing: DesignSystemGlobal.Spacing2) {
            RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusXl)
                .fill(DesignSystemGlobal.BackgroundContainerColorWhite)
                .frame(width: 80, height: 80)
                .shadow(color: shadowColor, radius: blur, x: x, y: y)

            Text(title)
                .thdFont(.bodySm)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

            Text("Blur: \(Int(blur))")
                .thdFont(.caption)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorTertiary)
        }
    }
}

// MARK: - Typography Section
struct TypographySection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing4) {
            Text("Typography")
                .thdFont(.h5)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

            // Hero Sizes
            VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                Text("Hero Sizes")
                    .thdFont(.bodySm)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                TypographyRow(name: "Hero 1", size: DesignSystemGlobal.FontFontSizeHero1)
                TypographyRow(name: "Hero 2", size: DesignSystemGlobal.FontFontSizeHero2)
                TypographyRow(name: "Hero 3", size: DesignSystemGlobal.FontFontSizeHero3)
                TypographyRow(name: "Hero 4", size: DesignSystemGlobal.FontFontSizeHero4)
                TypographyRow(name: "Hero 5", size: DesignSystemGlobal.FontFontSizeHero5)
            }
            .padding(DesignSystemGlobal.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusXl)
                    .fill(DesignSystemGlobal.BackgroundContainerColorWhite)
            )

            // Heading Sizes
            VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                Text("Heading Sizes")
                    .thdFont(.bodySm)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                TypographyRow(name: "H1", size: DesignSystemGlobal.FontFontSizeH1)
                TypographyRow(name: "H2", size: DesignSystemGlobal.FontFontSizeH2)
                TypographyRow(name: "H3", size: DesignSystemGlobal.FontFontSizeH3)
                TypographyRow(name: "H4", size: DesignSystemGlobal.FontFontSizeH4)
                TypographyRow(name: "H5", size: DesignSystemGlobal.FontFontSizeH5)
                TypographyRow(name: "H6", size: DesignSystemGlobal.FontFontSizeH6)
            }
            .padding(DesignSystemGlobal.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusXl)
                    .fill(DesignSystemGlobal.BackgroundContainerColorWhite)
            )

            // Body Sizes
            VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                Text("Body Sizes")
                    .thdFont(.bodySm)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                TypographyRow(name: "Body XL", size: DesignSystemGlobal.FontFontSizeBodyXl)
                TypographyRow(name: "Body LG", size: DesignSystemGlobal.FontFontSizeBodyLg)
                TypographyRow(name: "Body MD", size: DesignSystemGlobal.FontFontSizeBodyMd)
                TypographyRow(name: "Body SM", size: DesignSystemGlobal.FontFontSizeBodySm)
                TypographyRow(name: "Body XS", size: DesignSystemGlobal.FontFontSizeBodyXs)
                TypographyRow(name: "Caption", size: DesignSystemGlobal.FontFontSizeCaption)
            }
            .padding(DesignSystemGlobal.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusXl)
                    .fill(DesignSystemGlobal.BackgroundContainerColorWhite)
            )

            // Line Height
            VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                Text("Line Heights")
                    .thdFont(.bodySm)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                HStack(spacing: DesignSystemGlobal.Spacing4) {
                    LineHeightDemo(name: "None", multiplier: DesignSystemGlobal.FontLineHeightNone)
                    LineHeightDemo(name: "Tight", multiplier: DesignSystemGlobal.FontLineHeightTight)
                    LineHeightDemo(name: "Base", multiplier: DesignSystemGlobal.FontLineHeightBase)
                }
            }
            .padding(DesignSystemGlobal.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusXl)
                    .fill(DesignSystemGlobal.BackgroundContainerColorWhite)
            )
        }
    }
}

struct TypographyRow: View {
    let name: String
    let size: CGFloat

    var body: some View {
        HStack {
            Text(name)
                .thdFont(.bodySm)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

            Spacer()

            Text("\(Int(size))pt")
                .thdFont(.bodySm)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorTertiary)
                .padding(.horizontal, DesignSystemGlobal.Spacing2)
                .padding(.vertical, DesignSystemGlobal.Spacing1)
                .background(
                    RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusSm)
                        .fill(DesignSystemGlobal.BackgroundContainerColorGreige)
                )
        }
    }
}

struct LineHeightDemo: View {
    let name: String
    let multiplier: CGFloat

    var body: some View {
        VStack(spacing: DesignSystemGlobal.Spacing1) {
            Text("Aa\nBb")
                .thdFont(.bodyMd)
                .lineSpacing(16 * (multiplier - 1))
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)
                .multilineTextAlignment(.center)

            Text(name)
                .thdFont(.caption)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorTertiary)

            Text("\(String(format: "%.2f", multiplier))x")
                .thdFont(.caption)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)
        }
        .frame(maxWidth: .infinity)
        .padding(DesignSystemGlobal.Spacing2)
        .background(
            RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusLg)
                .fill(DesignSystemGlobal.BackgroundContainerColorGreige)
        )
    }
}

// MARK: - Spacing Section
struct SpacingSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing4) {
            Text("Spacing")
                .thdFont(.h5)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

            Text("Consistent spacing scale for margins, padding, and gaps")
                .thdFont(.bodySm)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

            VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                SpacingRow(name: "Spacing 0", value: DesignSystemGlobal.Spacing0)
                SpacingRow(name: "Spacing 1", value: DesignSystemGlobal.Spacing1)
                SpacingRow(name: "Spacing 1px", value: DesignSystemGlobal.Spacing1px)
                SpacingRow(name: "Spacing 2px", value: DesignSystemGlobal.Spacing2px)
                SpacingRow(name: "Spacing 2", value: DesignSystemGlobal.Spacing2)
                SpacingRow(name: "Spacing 3", value: DesignSystemGlobal.Spacing3)
                SpacingRow(name: "Spacing 4", value: DesignSystemGlobal.Spacing4)
                SpacingRow(name: "Spacing 5", value: DesignSystemGlobal.Spacing5)
                SpacingRow(name: "Spacing 6", value: DesignSystemGlobal.Spacing6)
                SpacingRow(name: "Spacing 7", value: DesignSystemGlobal.Spacing7)
                SpacingRow(name: "Spacing 8", value: DesignSystemGlobal.Spacing8)
                SpacingRow(name: "Spacing 9", value: DesignSystemGlobal.Spacing9)
                SpacingRow(name: "Spacing 10", value: DesignSystemGlobal.Spacing10)
                SpacingRow(name: "Spacing 12", value: DesignSystemGlobal.Spacing12)
                SpacingRow(name: "Spacing 16", value: DesignSystemGlobal.Spacing16)
                SpacingRow(name: "Spacing 20", value: DesignSystemGlobal.Spacing20)
            }
            .padding(DesignSystemGlobal.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusXl)
                    .fill(DesignSystemGlobal.BackgroundContainerColorWhite)
            )
        }
    }
}

struct SpacingRow: View {
    let name: String
    let value: CGFloat

    var body: some View {
        HStack(spacing: DesignSystemGlobal.Spacing3) {
            Text(name)
                .thdFont(.bodySm)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)
                .frame(width: 100, alignment: .leading)

            Rectangle()
                .fill(DesignSystemGlobal.BrandBrand300)
                .frame(width: min(value, 200), height: 16)
                .cornerRadius(DesignSystemGlobal.BorderRadiusSm)

            Spacer()

            Text("\(Int(value))pt")
                .thdFont(.bodyXs)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorTertiary)
                .frame(width: 40, alignment: .trailing)
        }
    }
}

// MARK: - Border Radius Section
struct BorderRadiusSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing4) {
            Text("Border Radius")
                .thdFont(.h5)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

            Text("Corner radius values for rounded elements")
                .thdFont(.bodySm)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: DesignSystemGlobal.Spacing4) {
                    BorderRadiusCard(name: "None", value: DesignSystemGlobal.BorderRadiusNone)
                    BorderRadiusCard(name: "XS", value: DesignSystemGlobal.BorderRadiusXs)
                    BorderRadiusCard(name: "SM", value: DesignSystemGlobal.BorderRadiusSm)
                    BorderRadiusCard(name: "MD", value: DesignSystemGlobal.BorderRadiusMd)
                    BorderRadiusCard(name: "LG", value: DesignSystemGlobal.BorderRadiusLg)
                    BorderRadiusCard(name: "XL", value: DesignSystemGlobal.BorderRadiusXl)
                    BorderRadiusCard(name: "2XL", value: DesignSystemGlobal.BorderRadius2xl)
                    BorderRadiusCard(name: "3XL", value: DesignSystemGlobal.BorderRadius3xl)
                    BorderRadiusCard(name: "Full", value: DesignSystemGlobal.BorderRadiusFull)
                }
                .padding(DesignSystemGlobal.Spacing3)
            }
            .background(
                RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusXl)
                    .fill(DesignSystemGlobal.BackgroundContainerColorWhite)
            )
        }
    }
}

struct BorderRadiusCard: View {
    let name: String
    let value: CGFloat

    var body: some View {
        VStack(spacing: DesignSystemGlobal.Spacing2) {
            RoundedRectangle(cornerRadius: min(value, 32))
                .fill(DesignSystemGlobal.BrandBrand300)
                .frame(width: 64, height: 64)

            Text(name)
                .thdFont(.bodySm)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

            Text("\(Int(value))pt")
                .thdFont(.caption)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorTertiary)
        }
    }
}

// MARK: - Border Width Section
struct BorderWidthSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing4) {
            Text("Border Width")
                .thdFont(.h5)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

            Text("Stroke widths for borders and outlines")
                .thdFont(.bodySm)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: DesignSystemGlobal.Spacing4) {
                    BorderWidthCard(name: "None", value: DesignSystemGlobal.BorderWidthNone)
                    BorderWidthCard(name: "XS", value: DesignSystemGlobal.BorderWidthXs)
                    BorderWidthCard(name: "SM", value: DesignSystemGlobal.BorderWidthSm)
                    BorderWidthCard(name: "MD", value: DesignSystemGlobal.BorderWidthMd)
                    BorderWidthCard(name: "LG", value: DesignSystemGlobal.BorderWidthLg)
                    BorderWidthCard(name: "XL", value: DesignSystemGlobal.BorderWidthXl)
                    BorderWidthCard(name: "2XL", value: DesignSystemGlobal.BorderWidth2xl)
                }
                .padding(DesignSystemGlobal.Spacing3)
            }
            .background(
                RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusXl)
                    .fill(DesignSystemGlobal.BackgroundContainerColorWhite)
            )
        }
    }
}

struct BorderWidthCard: View {
    let name: String
    let value: CGFloat

    var body: some View {
        VStack(spacing: DesignSystemGlobal.Spacing2) {
            RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusLg)
                .stroke(DesignSystemGlobal.BrandBrand300, lineWidth: value)
                .frame(width: 64, height: 64)
                .background(
                    RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusLg)
                        .fill(DesignSystemGlobal.BackgroundContainerColorGreige)
                )

            Text(name)
                .thdFont(.bodySm)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

            Text("\(Int(value))pt")
                .thdFont(.caption)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorTertiary)
        }
    }
}

// MARK: - Checkerboard Pattern
/// Used to show transparency in color swatches
struct CheckerboardPattern: View {
    var body: some View {
        Canvas { context, size in
            let squareSize: CGFloat = 8
            let rows = Int(size.height / squareSize) + 1
            let cols = Int(size.width / squareSize) + 1

            for row in 0..<rows {
                for col in 0..<cols {
                    let isLight = (row + col) % 2 == 0
                    let rect = CGRect(
                        x: CGFloat(col) * squareSize,
                        y: CGFloat(row) * squareSize,
                        width: squareSize,
                        height: squareSize
                    )
                    context.fill(
                        Path(rect),
                        with: .color(isLight ? .white : Color(white: 0.85))
                    )
                }
            }
        }
    }
}

// MARK: - Preview
#Preview {
    NavigationStack {
        DesignSystemDemoView()
    }
}
