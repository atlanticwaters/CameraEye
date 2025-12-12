import SwiftUI

/// View displaying all Semantic-level tokens organized by category
struct SemanticTokensView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var selectedCategory: Category = .colorPalettes
    
    enum Category: String, CaseIterable {
        case colorPalettes = "Color Palettes"
        case backgrounds = "Backgrounds"
        case borders = "Borders"
        case text = "Text Colors"
        
        var icon: String {
            switch self {
            case .colorPalettes: return "paintpalette.fill"
            case .backgrounds: return "square.fill"
            case .borders: return "rectangle.on.rectangle"
            case .text: return "textformat"
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            // Page header
            VStack(alignment: .leading, spacing: 8) {
                Text("Semantic Tokens")
                    .font(.system(size: 22, weight: .bold))
                    .foregroundColor(
                        colorScheme == .dark 
                            ? TokensSemanticDark.TextOnSurfaceColorPrimary
                            : TokensSemanticLight.TextOnSurfaceColorPrimary
                    )
                
                Text("Context-specific tokens derived from core primitives")
                    .font(.system(size: TokensCoreLight.FontSizeBodyMd))
                    .foregroundColor(
                        colorScheme == .dark
                            ? TokensSemanticDark.TextOnSurfaceColorSecondary
                            : TokensSemanticLight.TextOnSurfaceColorSecondary
                    )
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
            // Category selector
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(Category.allCases, id: \.self) { category in
                        Button(action: { selectedCategory = category }) {
                            HStack(spacing: 8) {
                                Image(systemName: category.icon)
                                    .font(.system(size: 14))
                                Text(category.rawValue)
                                    .font(.system(size: TokensCoreLight.FontSizeBodySm, weight: .medium))
                            }
                            .padding(.horizontal, 16)
                            .padding(.vertical, 10)
                            .background(
                                selectedCategory == category
                                    ? (colorScheme == .dark 
                                        ? TokensSemanticDark.BackgroundContainerColorBrand
                                        : TokensSemanticLight.BackgroundContainerColorBrand)
                                    : (colorScheme == .dark
                                        ? TokensSemanticDark.BackgroundContainerColorGreige
                                        : TokensSemanticLight.BackgroundContainerColorGreige)
                            )
                            .foregroundColor(
                                selectedCategory == category
                                    ? .white
                                    : (colorScheme == .dark
                                        ? TokensSemanticDark.TextOnSurfaceColorPrimary
                                        : TokensSemanticLight.TextOnSurfaceColorPrimary)
                            )
                            .cornerRadius(8)
                        }
                    }
                }
                .padding(.horizontal)
            }
            .padding(.bottom, 8)
            
            // Category content
            ScrollView {
                Group {
                    switch selectedCategory {
                    case .colorPalettes:
                        ColorPalettesContent()
                    case .backgrounds:
                        BackgroundsContent()
                    case .borders:
                        BordersContent()
                    case .text:
                        TextColorsContent()
                    }
                }
                .padding()
            }
        }
        .background(
            (colorScheme == .dark 
                ? TokensSemanticDark.BackgroundSurfaceColorGreige
                : TokensSemanticLight.BackgroundSurfaceColorGreige)
            .ignoresSafeArea()
        )
    }
}

// MARK: - Color Palettes Content
struct ColorPalettesContent: View {
    var body: some View {
        VStack(spacing: 32) {
            BrandPaletteSection()
            Divider()
            GreigePaletteSection()
            Divider()
            CinnabarPaletteSection()
            Divider()
            LemonPaletteSection()
            Divider()
            MoonlightPaletteSection()
        }
    }
}

// MARK: - Palette Sections
private struct BrandPaletteSection: View {
    var body: some View {
        TokenSection(title: "Brand", description: "Primary brand color scale") {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                Group {
                    ColorSwatch(name: "Brand 025", color: TokensSemanticLight.Brand025, showBorder: true)
                    ColorSwatch(name: "Brand 050", color: TokensSemanticLight.Brand050)
                    ColorSwatch(name: "Brand 100", color: TokensSemanticLight.Brand100)
                    ColorSwatch(name: "Brand 200", color: TokensSemanticLight.Brand200)
                    ColorSwatch(name: "Brand 300", color: TokensSemanticLight.Brand300)
                    ColorSwatch(name: "Brand 400", color: TokensSemanticLight.Brand400)
                }
                Group {
                    ColorSwatch(name: "Brand 500", color: TokensSemanticLight.Brand500)
                    ColorSwatch(name: "Brand 600", color: TokensSemanticLight.Brand600)
                    ColorSwatch(name: "Brand 700", color: TokensSemanticLight.Brand700)
                    ColorSwatch(name: "Brand 800", color: TokensSemanticLight.Brand800)
                    ColorSwatch(name: "Brand 900", color: TokensSemanticLight.Brand900)
                    ColorSwatch(name: "Brand 950", color: TokensSemanticLight.Brand950)
                }
            }
        }
    }
}

private struct GreigePaletteSection: View {
    var body: some View {
        TokenSection(title: "Greige", description: "Neutral color scale") {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                Group {
                    ColorSwatch(name: "Greige 025", color: TokensSemanticLight.Greige025, showBorder: true)
                    ColorSwatch(name: "Greige 050", color: TokensSemanticLight.Greige050, showBorder: true)
                    ColorSwatch(name: "Greige 100", color: TokensSemanticLight.Greige100)
                    ColorSwatch(name: "Greige 200", color: TokensSemanticLight.Greige200)
                    ColorSwatch(name: "Greige 300", color: TokensSemanticLight.Greige300)
                    ColorSwatch(name: "Greige 400", color: TokensSemanticLight.Greige400)
                }
                Group {
                    ColorSwatch(name: "Greige 500", color: TokensSemanticLight.Greige500)
                    ColorSwatch(name: "Greige 600", color: TokensSemanticLight.Greige600)
                    ColorSwatch(name: "Greige 700", color: TokensSemanticLight.Greige700)
                    ColorSwatch(name: "Greige 800", color: TokensSemanticLight.Greige800)
                    ColorSwatch(name: "Greige 900", color: TokensSemanticLight.Greige900)
                    ColorSwatch(name: "Greige 950", color: TokensSemanticLight.Greige950)
                }
            }
        }
    }
}

private struct CinnabarPaletteSection: View {
    var body: some View {
        TokenSection(title: "Cinnabar", description: "Error and alert color scale") {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                Group {
                    ColorSwatch(name: "Cinnabar 025", color: TokensSemanticLight.Cinnabar025, showBorder: true)
                    ColorSwatch(name: "Cinnabar 050", color: TokensSemanticLight.Cinnabar050)
                    ColorSwatch(name: "Cinnabar 100", color: TokensSemanticLight.Cinnabar100)
                    ColorSwatch(name: "Cinnabar 200", color: TokensSemanticLight.Cinnabar200)
                    ColorSwatch(name: "Cinnabar 300", color: TokensSemanticLight.Cinnabar300)
                    ColorSwatch(name: "Cinnabar 400", color: TokensSemanticLight.Cinnabar400)
                }
                Group {
                    ColorSwatch(name: "Cinnabar 500", color: TokensSemanticLight.Cinnabar500)
                    ColorSwatch(name: "Cinnabar 600", color: TokensSemanticLight.Cinnabar600)
                    ColorSwatch(name: "Cinnabar 700", color: TokensSemanticLight.Cinnabar700)
                    ColorSwatch(name: "Cinnabar 800", color: TokensSemanticLight.Cinnabar800)
                    ColorSwatch(name: "Cinnabar 900", color: TokensSemanticLight.Cinnabar900)
                    ColorSwatch(name: "Cinnabar 950", color: TokensSemanticLight.Cinnabar950)
                }
            }
        }
    }
}

private struct LemonPaletteSection: View {
    var body: some View {
        TokenSection(title: "Lemon", description: "Warning and caution color scale") {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                Group {
                    ColorSwatch(name: "Lemon 025", color: TokensSemanticLight.Lemon025, showBorder: true)
                    ColorSwatch(name: "Lemon 050", color: TokensSemanticLight.Lemon050)
                    ColorSwatch(name: "Lemon 100", color: TokensSemanticLight.Lemon100)
                    ColorSwatch(name: "Lemon 200", color: TokensSemanticLight.Lemon200)
                    ColorSwatch(name: "Lemon 300", color: TokensSemanticLight.Lemon300)
                    ColorSwatch(name: "Lemon 400", color: TokensSemanticLight.Lemon400)
                }
                Group {
                    ColorSwatch(name: "Lemon 500", color: TokensSemanticLight.Lemon500)
                    ColorSwatch(name: "Lemon 600", color: TokensSemanticLight.Lemon600)
                    ColorSwatch(name: "Lemon 700", color: TokensSemanticLight.Lemon700)
                    ColorSwatch(name: "Lemon 800", color: TokensSemanticLight.Lemon800)
                    ColorSwatch(name: "Lemon 900", color: TokensSemanticLight.Lemon900)
                    ColorSwatch(name: "Lemon 950", color: TokensSemanticLight.Lemon950)
                }
            }
        }
    }
}

private struct MoonlightPaletteSection: View {
    var body: some View {
        TokenSection(title: "Moonlight", description: "Informational color scale") {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                Group {
                    ColorSwatch(name: "Moonlight 025", color: TokensSemanticLight.Moonlight025, showBorder: true)
                    ColorSwatch(name: "Moonlight 050", color: TokensSemanticLight.Moonlight050)
                    ColorSwatch(name: "Moonlight 100", color: TokensSemanticLight.Moonlight100)
                    ColorSwatch(name: "Moonlight 200", color: TokensSemanticLight.Moonlight200)
                    ColorSwatch(name: "Moonlight 300", color: TokensSemanticLight.Moonlight300)
                    ColorSwatch(name: "Moonlight 400", color: TokensSemanticLight.Moonlight400)
                }
                Group {
                    ColorSwatch(name: "Moonlight 500", color: TokensSemanticLight.Moonlight500)
                    ColorSwatch(name: "Moonlight 600", color: TokensSemanticLight.Moonlight600)
                    ColorSwatch(name: "Moonlight 700", color: TokensSemanticLight.Moonlight700)
                    ColorSwatch(name: "Moonlight 800", color: TokensSemanticLight.Moonlight800)
                    ColorSwatch(name: "Moonlight 900", color: TokensSemanticLight.Moonlight900)
                    ColorSwatch(name: "Moonlight 950", color: TokensSemanticLight.Moonlight950)
                }
            }
        }
    }
}

// MARK: - Backgrounds Content
struct BackgroundsContent: View {
    var body: some View {
        VStack(spacing: 32) {
            BackgroundAccentColorsSection()
            Divider()
            BackgroundButtonSection()
            Divider()
            BackgroundContainerSection()
            Divider()
            BackgroundFeedbackSection()
            Divider()
            BackgroundSurfaceSection()
        }
    }
}

// MARK: - Background Sections
private struct BackgroundAccentColorsSection: View {
    var body: some View {
        TokenSection(title: "Accent Colors") {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                ColorSwatch(name: "Blue", color: TokensSemanticLight.BackgroundAccentColorBlue)
                ColorSwatch(name: "Brown", color: TokensSemanticLight.BackgroundAccentColorBrown, showBorder: true)
                ColorSwatch(name: "Green", color: TokensSemanticLight.BackgroundAccentColorGreen)
                ColorSwatch(name: "Red", color: TokensSemanticLight.BackgroundAccentColorRed)
                ColorSwatch(name: "Yellow", color: TokensSemanticLight.BackgroundAccentColorYellow)
            }
        }
    }
}

private struct BackgroundButtonSection: View {
    var body: some View {
        TokenSection(title: "Button Backgrounds") {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                Group {
                    ColorSwatch(name: "Brand Default", color: TokensSemanticLight.BackgroundButtonColorBrandFilledDefault)
                    ColorSwatch(name: "Brand Inactive", color: TokensSemanticLight.BackgroundButtonColorBrandFilledInactive)
                    ColorSwatch(name: "White Default", color: TokensSemanticLight.BackgroundButtonColorWhiteFilledDefault, showBorder: true)
                }
                Group {
                    ColorSwatch(name: "White Inactive", color: TokensSemanticLight.BackgroundButtonColorWhiteFilledInactive, showBorder: true)
                    ColorSwatch(name: "Ghost Default", color: TokensSemanticLight.BackgroundButtonColorGhostFilledDefault, showBorder: true)
                    ColorSwatch(name: "Ghost Inactive", color: TokensSemanticLight.BackgroundButtonColorGhostFilledInactive)
                }
            }
        }
    }
}

private struct BackgroundContainerSection: View {
    var body: some View {
        TokenSection(title: "Container Backgrounds") {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                Group {
                    ColorSwatch(name: "Brand", color: TokensSemanticLight.BackgroundContainerColorBrand)
                    ColorSwatch(name: "Brand Accent", color: TokensSemanticLight.BackgroundContainerColorBrandAccent)
                    ColorSwatch(name: "Greige", color: TokensSemanticLight.BackgroundContainerColorGreige, showBorder: true)
                }
                Group {
                    ColorSwatch(name: "White", color: TokensSemanticLight.BackgroundContainerColorWhite, showBorder: true)
                    ColorSwatch(name: "Inverse", color: TokensSemanticLight.BackgroundContainerColorInverse)
                    ColorSwatch(name: "Transparent 05", color: TokensSemanticLight.BackgroundContainerColorTransparent05, showBorder: true)
                }
            }
        }
    }
}

private struct BackgroundFeedbackSection: View {
    var body: some View {
        TokenSection(title: "Feedback Backgrounds") {
            VStack(spacing: 16) {
                HStack(spacing: 12) {
                    ColorSwatch(name: "Error Accent 1", color: TokensSemanticLight.BackgroundFeedbackColorErrorAccent1)
                    ColorSwatch(name: "Error Accent 2", color: TokensSemanticLight.BackgroundFeedbackColorErrorAccent2)
                }
                
                HStack(spacing: 12) {
                    ColorSwatch(name: "Success Accent 1", color: TokensSemanticLight.BackgroundFeedbackColorSuccessAccent1)
                    ColorSwatch(name: "Success Accent 2", color: TokensSemanticLight.BackgroundFeedbackColorSuccessAccent2)
                }
                
                HStack(spacing: 12) {
                    ColorSwatch(name: "Warning Accent 1", color: TokensSemanticLight.BackgroundFeedbackColorWarningAccent1)
                    ColorSwatch(name: "Warning Accent 2", color: TokensSemanticLight.BackgroundFeedbackColorWarningAccent2)
                }
                
                HStack(spacing: 12) {
                    ColorSwatch(name: "Info Accent 1", color: TokensSemanticLight.BackgroundFeedbackColorInformationalAccent1)
                    ColorSwatch(name: "Info Accent 2", color: TokensSemanticLight.BackgroundFeedbackColorInformationalAccent2)
                }
            }
        }
    }
}

private struct BackgroundSurfaceSection: View {
    var body: some View {
        TokenSection(title: "Surface Backgrounds") {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                ColorSwatch(name: "Greige", color: TokensSemanticLight.BackgroundSurfaceColorGreige, showBorder: true)
                ColorSwatch(name: "Inverse", color: TokensSemanticLight.BackgroundSurfaceColorInverse)
            }
        }
    }
}

// MARK: - Borders Content
struct BordersContent: View {
    var body: some View {
        VStack(spacing: 32) {
            BorderRadiiSection()
            Divider()
            BorderWidthsSection()
            Divider()
            BorderButtonColorsSection()
            Divider()
            BorderInputColorsSection()
        }
    }
}

// MARK: - Border Sections
private struct BorderRadiiSection: View {
    var body: some View {
        TokenSection(title: "Border Radii") {
            VStack(spacing: 12) {
                BorderRadiusDemo(name: "None", radius: TokensSemanticLight.BorderRadiusNone)
                BorderRadiusDemo(name: "XS", radius: TokensSemanticLight.BorderRadiusXs)
                BorderRadiusDemo(name: "SM", radius: TokensSemanticLight.BorderRadiusSm)
                BorderRadiusDemo(name: "MD", radius: TokensSemanticLight.BorderRadiusMd)
                BorderRadiusDemo(name: "LG", radius: TokensSemanticLight.BorderRadiusLg)
                BorderRadiusDemo(name: "XL", radius: TokensSemanticLight.BorderRadiusXl)
                BorderRadiusDemo(name: "2XL", radius: TokensSemanticLight.BorderRadius2xl)
                BorderRadiusDemo(name: "3XL", radius: TokensSemanticLight.BorderRadius3xl)
                BorderRadiusDemo(name: "Full", radius: TokensSemanticLight.BorderRadiusFull)
            }
        }
    }
}

private struct BorderWidthsSection: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        TokenSection(title: "Border Widths") {
            VStack(spacing: 12) {
                ForEach([
                    ("None", TokensSemanticLight.BorderWidthNone),
                    ("XS", TokensSemanticLight.BorderWidthXs),
                    ("SM", TokensSemanticLight.BorderWidthSm),
                    ("MD", TokensSemanticLight.BorderWidthMd),
                    ("LG", TokensSemanticLight.BorderWidthLg),
                    ("XL", TokensSemanticLight.BorderWidthXl),
                    ("2XL", TokensSemanticLight.BorderWidth2xl)
                ], id: \.0) { item in
                    HStack {
                        Text(item.0)
                            .font(.system(size: TokensCoreLight.FontSizeBodySm, weight: .medium))
                            .foregroundColor(
                                colorScheme == .dark
                                    ? TokensSemanticDark.TextOnSurfaceColorPrimary
                                    : TokensSemanticLight.TextOnSurfaceColorPrimary
                            )
                            .frame(width: 60, alignment: .leading)
                        
                        Text("\(Int(item.1))pt")
                            .font(.system(size: TokensCoreLight.FontSizeBodyXs, weight: .semibold))
                            .foregroundColor(
                                colorScheme == .dark
                                    ? TokensSemanticDark.TextOnSurfaceColorSecondary
                                    : TokensSemanticLight.TextOnSurfaceColorSecondary
                            )
                            .frame(width: 40, alignment: .trailing)
                        
                        Rectangle()
                            .fill(
                                colorScheme == .dark
                                    ? TokensSemanticDark.Brand300
                                    : TokensSemanticLight.Brand300
                            )
                            .frame(height: item.1)
                            .cornerRadius(1)
                    }
                }
            }
        }
    }
}

private struct BorderButtonColorsSection: View {
    var body: some View {
        TokenSection(title: "Button Border Colors") {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                ColorSwatch(name: "Accent", color: TokensSemanticLight.BorderButtonColorAccent)
                ColorSwatch(name: "Default", color: TokensSemanticLight.BorderButtonColorDefault)
                ColorSwatch(name: "Focus", color: TokensSemanticLight.BorderButtonColorFocus)
                ColorSwatch(name: "Inactive", color: TokensSemanticLight.BorderButtonColorInactive)
                ColorSwatch(name: "Pressed", color: TokensSemanticLight.BorderButtonColorPressed)
            }
        }
    }
}

private struct BorderInputColorsSection: View {
    var body: some View {
        TokenSection(title: "Input Border Colors") {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                ColorSwatch(name: "Default", color: TokensSemanticLight.BorderInputColorDefault)
                ColorSwatch(name: "Active", color: TokensSemanticLight.BorderInputColorActive)
                ColorSwatch(name: "Focus", color: TokensSemanticLight.BorderInputColorFocus)
                ColorSwatch(name: "Error", color: TokensSemanticLight.BorderInputColorError)
                ColorSwatch(name: "Success", color: TokensSemanticLight.BorderInputColorSuccess)
                ColorSwatch(name: "Warning", color: TokensSemanticLight.BorderInputColorWarning)
            }
        }
    }
}

// MARK: - Text Colors Content
struct TextColorsContent: View {
    var body: some View {
        VStack(spacing: 32) {
            TextOnSurfaceSection()
            Divider()
            TextOnContainerSection()
            Divider()
            TextButtonColorsSection()
        }
    }
}

// MARK: - Text Color Sections
private struct TextOnSurfaceSection: View {
    var body: some View {
        TokenSection(title: "Text on Surface") {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                ColorSwatch(name: "Primary", color: TokensSemanticLight.TextOnSurfaceColorPrimary)
                ColorSwatch(name: "Secondary", color: TokensSemanticLight.TextOnSurfaceColorSecondary)
                ColorSwatch(name: "Tertiary", color: TokensSemanticLight.TextOnSurfaceColorTertiary)
                ColorSwatch(name: "Accent", color: TokensSemanticLight.TextOnSurfaceColorAccent)
                ColorSwatch(name: "Error", color: TokensSemanticLight.TextOnSurfaceColorError)
                ColorSwatch(name: "Success", color: TokensSemanticLight.TextOnSurfaceColorSuccess)
            }
        }
    }
}

private struct TextOnContainerSection: View {
    var body: some View {
        TokenSection(title: "Text on Container") {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                ColorSwatch(name: "Primary", color: TokensSemanticLight.TextOnContainerColorPrimary)
                ColorSwatch(name: "Secondary", color: TokensSemanticLight.TextOnContainerColorSecondary)
                ColorSwatch(name: "Tertiary", color: TokensSemanticLight.TextOnContainerColorTertiary)
                ColorSwatch(name: "Accent", color: TokensSemanticLight.TextOnContainerColorAccent)
                ColorSwatch(name: "Error", color: TokensSemanticLight.TextOnContainerColorError)
                ColorSwatch(name: "Success", color: TokensSemanticLight.TextOnContainerColorSuccess)
            }
        }
    }
}

private struct TextButtonColorsSection: View {
    var body: some View {
        TokenSection(title: "Button Text Colors") {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                Group {
                    ColorSwatch(name: "Orange Default", color: TokensSemanticLight.TextButtonColorOrangeFilledDefault, showBorder: true)
                    ColorSwatch(name: "Orange Inactive", color: TokensSemanticLight.TextButtonColorOrangeFilledInactive)
                    ColorSwatch(name: "Ghost Default", color: TokensSemanticLight.TextButtonColorGhostFilledDefault)
                }
                Group {
                    ColorSwatch(name: "Ghost Inactive", color: TokensSemanticLight.TextButtonColorGhostFilledInactive)
                    ColorSwatch(name: "White Default", color: TokensSemanticLight.TextButtonColorWhiteFilledDefault)
                    ColorSwatch(name: "White Inactive", color: TokensSemanticLight.TextButtonColorWhiteFilledInactive)
                }
            }
        }
    }
}

// MARK: - Preview

#Preview("Color Palettes") {
    SemanticTokensView()
}
