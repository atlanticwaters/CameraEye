import SwiftUI

/// View displaying all Core-level tokens (foundational design primitives)
struct CoreTokensView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                // Page header
                VStack(alignment: .leading, spacing: 8) {
                    Text("Core Tokens")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(TokensSemanticLight.TextOnSurfaceColorPrimary)
                    
                    Text("Foundational design primitives that inform semantic tokens")
                        .font(.system(size: TokensCoreLight.FontSizeBodyMd))
                        .foregroundColor(TokensSemanticLight.TextOnSurfaceColorSecondary)
                }
                .padding(.bottom, 8)
                
                // Typography Section
                TokenSection(
                    title: "Typography",
                    description: "Font families and sizes used throughout the system"
                ) {
                    VStack(spacing: 20) {
                        // Font Families
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Font Families")
                                .font(.system(size: TokensCoreLight.FontSizeBodyMd, weight: .semibold))
                                .foregroundColor(TokensSemanticLight.TextOnSurfaceColorPrimary)
                            
                            VStack(alignment: .leading, spacing: 8) {
                                HStack {
                                    Text("Display:")
                                        .font(.system(size: TokensCoreLight.FontSizeBodySm))
                                        .foregroundColor(TokensSemanticLight.TextOnSurfaceColorSecondary)
                                    
                                    Text(TokensCoreLight.FontFamilyDisplay)
                                        .font(.custom(TokensCoreLight.FontFamilyDisplay, size: TokensCoreLight.FontSizeBodyMd))
                                        .foregroundColor(TokensSemanticLight.TextOnSurfaceColorPrimary)
                                }
                                
                                HStack {
                                    Text("Informational:")
                                        .font(.system(size: TokensCoreLight.FontSizeBodySm))
                                        .foregroundColor(TokensSemanticLight.TextOnSurfaceColorSecondary)
                                    
                                    Text(TokensCoreLight.FontFamilyInformational)
                                        .font(.custom(TokensCoreLight.FontFamilyInformational, size: TokensCoreLight.FontSizeBodyMd))
                                        .foregroundColor(TokensSemanticLight.TextOnSurfaceColorPrimary)
                                }
                            }
                            .padding()
                            .background(TokensSemanticLight.BackgroundContainerColorGreige)
                            .cornerRadius(8)
                        }
                        
                        // Font Sizes
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Body Font Sizes")
                                .font(.system(size: TokensCoreLight.FontSizeBodyMd, weight: .semibold))
                                .foregroundColor(TokensSemanticLight.TextOnSurfaceColorPrimary)
                            
                            TypographySample(
                                name: "Body XL",
                                fontSize: TokensCoreLight.FontSizeBodyXl,
                                fontFamily: TokensCoreLight.FontFamilyInformational
                            )
                            
                            TypographySample(
                                name: "Body LG",
                                fontSize: TokensCoreLight.FontSizeBodyLg,
                                fontFamily: TokensCoreLight.FontFamilyInformational
                            )
                            
                            TypographySample(
                                name: "Body MD",
                                fontSize: TokensCoreLight.FontSizeBodyMd,
                                fontFamily: TokensCoreLight.FontFamilyInformational
                            )
                            
                            TypographySample(
                                name: "Body SM",
                                fontSize: TokensCoreLight.FontSizeBodySm,
                                fontFamily: TokensCoreLight.FontFamilyInformational
                            )
                            
                            TypographySample(
                                name: "Body XS",
                                fontSize: TokensCoreLight.FontSizeBodyXs,
                                fontFamily: TokensCoreLight.FontFamilyInformational
                            )
                        }
                    }
                }
                
                Divider()
                
                // Elevation Section
                TokenSection(
                    title: "Elevation",
                    description: "Shadow and elevation tokens for depth hierarchy"
                ) {
                    VStack(spacing: 24) {
                        Text("Below Elevations")
                            .font(.system(size: TokensCoreLight.FontSizeBodyMd, weight: .semibold))
                            .foregroundColor(TokensSemanticLight.TextOnSurfaceColorPrimary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ElevationDemo(name: "Below 1", elevation: TokensCoreLight.ElevationBelow1)
                        ElevationDemo(name: "Below 2", elevation: TokensCoreLight.ElevationBelow2)
                        ElevationDemo(name: "Below 3", elevation: TokensCoreLight.ElevationBelow3)
                        ElevationDemo(name: "Below 4", elevation: TokensCoreLight.ElevationBelow4)
                        ElevationDemo(name: "Below 5", elevation: TokensCoreLight.ElevationBelow5)
                        
                        Text("Above Elevations")
                            .font(.system(size: TokensCoreLight.FontSizeBodyMd, weight: .semibold))
                            .foregroundColor(TokensSemanticLight.TextOnSurfaceColorPrimary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 16)
                        
                        ElevationDemo(name: "Above 1", elevation: TokensCoreLight.ElevationAbove1)
                        ElevationDemo(name: "Above 2", elevation: TokensCoreLight.ElevationAbove2)
                        ElevationDemo(name: "Above 3", elevation: TokensCoreLight.ElevationAbove3)
                        ElevationDemo(name: "Above 4", elevation: TokensCoreLight.ElevationAbove4)
                        ElevationDemo(name: "Above 5", elevation: TokensCoreLight.ElevationAbove5)
                    }
                }
            }
            .padding()
        }
        .background(TokensSemanticLight.BackgroundSurfaceColorGreige.ignoresSafeArea())
    }
}

#Preview("Light Mode") {
    CoreTokensView()
        .preferredColorScheme(.light)
}

#Preview("Dark Mode") {
    CoreTokensView()
        .preferredColorScheme(.dark)
}
