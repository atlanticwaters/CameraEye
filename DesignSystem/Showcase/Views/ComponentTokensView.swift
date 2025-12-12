import SwiftUI

/// View displaying all Component-level tokens
struct ComponentTokensView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                // Page header
                VStack(alignment: .leading, spacing: 8) {
                    Text("Component Tokens")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(TokensSemanticLight.TextOnSurfaceColorPrimary)
                    
                    Text("Component-specific design tokens for icons and UI elements")
                        .font(.system(size: TokensCoreLight.FontSizeBodyMd))
                        .foregroundColor(TokensSemanticLight.TextOnSurfaceColorSecondary)
                }
                .padding(.bottom, 8)
                
                // Icon Action Colors
                TokenSection(title: "Icon Action Colors", description: "Icons within interactive elements") {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                        ColorSwatch(name: "Ghost Default", color: TokensComponentsLight.IconActionColorGhostFilledDefault)
                        ColorSwatch(name: "Ghost Inactive", color: TokensComponentsLight.IconActionColorGhostFilledInactive)
                        ColorSwatch(name: "Orange Default", color: TokensComponentsLight.IconActionColorOrangeFilledDefault, showBorder: true)
                        ColorSwatch(name: "Orange Inactive", color: TokensComponentsLight.IconActionColorOrangeFilledInactive)
                        ColorSwatch(name: "White Default", color: TokensComponentsLight.IconActionColorWhiteFilledDefault)
                        ColorSwatch(name: "White Inactive", color: TokensComponentsLight.IconActionColorWhiteFilledInactive)
                        ColorSwatch(name: "Transparent 05 Default", color: TokensComponentsLight.IconActionColorTransparent05FilledDefault)
                        ColorSwatch(name: "Transparent 10 Default", color: TokensComponentsLight.IconActionColorTransparent10FilledDefault)
                    }
                }
                
                Divider()
                
                // Icon Input Colors
                TokenSection(title: "Icon Input Colors", description: "Icons within input fields") {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                        ColorSwatch(name: "Default", color: TokensComponentsLight.IconInputColorDefault)
                        ColorSwatch(name: "Active", color: TokensComponentsLight.IconInputColorActive)
                        ColorSwatch(name: "Inactive", color: TokensComponentsLight.IconInputColorInactive)
                    }
                }
                
                Divider()
                
                // Icon on Container Colors
                TokenSection(title: "Icon on Container Colors", description: "Icons on container backgrounds") {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                        ColorSwatch(name: "Primary", color: TokensComponentsLight.IconOnContainerColorPrimary)
                        ColorSwatch(name: "Secondary", color: TokensComponentsLight.IconOnContainerColorSecondary)
                        ColorSwatch(name: "Tertiary", color: TokensComponentsLight.IconOnContainerColorTertiary)
                        ColorSwatch(name: "Accent", color: TokensComponentsLight.IconOnContainerColorAccent)
                        ColorSwatch(name: "Accent 2", color: TokensComponentsLight.IconOnContainerColorAccent2)
                        ColorSwatch(name: "Inverse", color: TokensComponentsLight.IconOnContainerColorInverse, showBorder: true)
                        ColorSwatch(name: "Error", color: TokensComponentsLight.IconOnContainerColorError)
                        ColorSwatch(name: "Success", color: TokensComponentsLight.IconOnContainerColorSuccess)
                        ColorSwatch(name: "Warning", color: TokensComponentsLight.IconOnContainerColorWarning)
                        ColorSwatch(name: "Informational", color: TokensComponentsLight.IconOnContainerColorInformational)
                        ColorSwatch(name: "Inactive", color: TokensComponentsLight.IconOnContainerColorInactive)
                    }
                }
                
                Divider()
                
                // Icon on Surface Colors
                TokenSection(title: "Icon on Surface Colors", description: "Icons on surface backgrounds") {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                        ColorSwatch(name: "Primary", color: TokensComponentsLight.IconOnSurfaceColorPrimary)
                        ColorSwatch(name: "Secondary", color: TokensComponentsLight.IconOnSurfaceColorSecondary)
                        ColorSwatch(name: "Tertiary", color: TokensComponentsLight.IconOnSurfaceColorTertiary)
                        ColorSwatch(name: "Accent", color: TokensComponentsLight.IconOnSurfaceColorAccent)
                        ColorSwatch(name: "Accent 2", color: TokensComponentsLight.IconOnSurfaceColorAccent2)
                        ColorSwatch(name: "Inverse", color: TokensComponentsLight.IconOnSurfaceColorInverse, showBorder: true)
                        ColorSwatch(name: "Error", color: TokensComponentsLight.IconOnSurfaceColorError)
                        ColorSwatch(name: "Success", color: TokensComponentsLight.IconOnSurfaceColorSuccess)
                        ColorSwatch(name: "Warning", color: TokensComponentsLight.IconOnSurfaceColorWarning)
                        ColorSwatch(name: "Informational", color: TokensComponentsLight.IconOnSurfaceColorInformational)
                        ColorSwatch(name: "Inactive", color: TokensComponentsLight.IconOnSurfaceColorInactive)
                    }
                }
                
                Divider()
                
                // Icon Selector Colors
                TokenSection(title: "Icon Selector Colors", description: "Icons within selector components") {
                    VStack(spacing: 16) {
                        Text("Filled Selectors")
                            .font(.system(size: TokensCoreLight.FontSizeBodyMd, weight: .semibold))
                            .foregroundColor(TokensSemanticLight.TextOnSurfaceColorPrimary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                            ColorSwatch(name: "Default", color: TokensComponentsLight.IconSelectorColorFilledDefault)
                            ColorSwatch(name: "Active", color: TokensComponentsLight.IconSelectorColorFilledActive)
                            ColorSwatch(name: "Inactive", color: TokensComponentsLight.IconSelectorColorFilledInactive)
                            ColorSwatch(name: "Selected", color: TokensComponentsLight.IconSelectorColorFilledSelected, showBorder: true)
                        }
                        
                        Text("Outline Selectors")
                            .font(.system(size: TokensCoreLight.FontSizeBodyMd, weight: .semibold))
                            .foregroundColor(TokensSemanticLight.TextOnSurfaceColorPrimary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 16)
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                            ColorSwatch(name: "Default", color: TokensComponentsLight.IconSelectorColorOutlineDefault)
                            ColorSwatch(name: "Active", color: TokensComponentsLight.IconSelectorColorOutlineActive)
                            ColorSwatch(name: "Inactive", color: TokensComponentsLight.IconSelectorColorOutlineInactive)
                            ColorSwatch(name: "Selected", color: TokensComponentsLight.IconSelectorColorOutlineSelected, showBorder: true)
                        }
                    }
                }
                
                Divider()
                
                // Badge Example
                TokenSection(title: "Badge Component", description: "Badge-specific tokens") {
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Text("Label:")
                                .font(.system(size: TokensCoreLight.FontSizeBodySm))
                                .foregroundColor(TokensSemanticLight.TextOnSurfaceColorSecondary)
                            
                            Text(TokensComponentsLight.BadgeLabel)
                                .font(.system(size: TokensCoreLight.FontSizeBodySm, weight: .semibold))
                                .foregroundColor(TokensSemanticLight.TextOnSurfaceColorPrimary)
                        }
                        
                        // Visual example
                        HStack {
                            Text(TokensComponentsLight.BadgeLabel)
                                .font(.system(size: TokensCoreLight.FontSizeBodyXs, weight: .bold))
                                .foregroundColor(.white)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(TokensSemanticLight.BackgroundAccentColorRed)
                                .cornerRadius(4)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(TokensSemanticLight.BackgroundContainerColorGreige)
                        .cornerRadius(8)
                    }
                }
            }
            .padding()
        }
        .background(TokensSemanticLight.BackgroundSurfaceColorGreige.ignoresSafeArea())
    }
}

#Preview("Light Mode") {
    ComponentTokensView()
        .preferredColorScheme(.light)
}

#Preview("Dark Mode") {
    ComponentTokensView()
        .preferredColorScheme(.dark)
}
