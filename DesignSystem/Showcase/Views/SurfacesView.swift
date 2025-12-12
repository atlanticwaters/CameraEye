import SwiftUI

/// View demonstrating surface tokens with practical examples
struct SurfacesView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                // Page header
                VStack(alignment: .leading, spacing: 8) {
                    Text("Surfaces")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(TokensSemanticLight.TextOnSurfaceColorPrimary)
                    
                    Text("Surface backgrounds and how they inform content presentation")
                        .font(.system(size: TokensCoreLight.FontSizeBodyMd))
                        .foregroundColor(TokensSemanticLight.TextOnSurfaceColorSecondary)
                }
                .padding(.bottom, 8)
                
                // Greige Surface
                TokenSection(
                    title: "Greige Surface",
                    description: "Primary surface for content and components"
                ) {
                    VStack(spacing: 16) {
                        // Surface info
                        ColorSwatch(
                            name: "Surface Color Greige",
                            color: TokensSemanticLight.BackgroundSurfaceColorGreige,
                            showBorder: true
                        )
                        
                        // Visual demonstration
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Surface with Content")
                                .font(.system(size: TokensCoreLight.FontSizeBodyMd, weight: .semibold))
                                .foregroundColor(TokensSemanticLight.TextOnSurfaceColorPrimary)
                            
                            // Example content on Greige surface
                            VStack(alignment: .leading, spacing: 20) {
                                // Typography hierarchy
                                VStack(alignment: .leading, spacing: 8) {
                                    HStack(spacing: 8) {
                                        Image(systemName: "textformat")
                                            .foregroundColor(TokensComponentsLight.IconOnSurfaceColorPrimary)
                                        Text("Typography Hierarchy")
                                            .font(.system(size: TokensCoreLight.FontSizeBodyLg, weight: .bold))
                                            .foregroundColor(TokensSemanticLight.TextOnSurfaceColorPrimary)
                                    }
                                    
                                    Text("Primary text uses TextOnSurfaceColorPrimary")
                                        .font(.system(size: TokensCoreLight.FontSizeBodyMd))
                                        .foregroundColor(TokensSemanticLight.TextOnSurfaceColorPrimary)
                                    
                                    Text("Secondary text uses TextOnSurfaceColorSecondary")
                                        .font(.system(size: TokensCoreLight.FontSizeBodySm))
                                        .foregroundColor(TokensSemanticLight.TextOnSurfaceColorSecondary)
                                    
                                    Text("Tertiary text uses TextOnSurfaceColorTertiary")
                                        .font(.system(size: TokensCoreLight.FontSizeBodySm))
                                        .foregroundColor(TokensSemanticLight.TextOnSurfaceColorTertiary)
                                }
                                
                                Divider()
                                
                                // Icon colors
                                VStack(alignment: .leading, spacing: 12) {
                                    HStack(spacing: 8) {
                                        Image(systemName: "circle.grid.3x3.fill")
                                            .foregroundColor(TokensComponentsLight.IconOnSurfaceColorPrimary)
                                        Text("Icon Colors on Surface")
                                            .font(.system(size: TokensCoreLight.FontSizeBodyMd, weight: .semibold))
                                            .foregroundColor(TokensSemanticLight.TextOnSurfaceColorPrimary)
                                    }
                                    
                                    HStack(spacing: 16) {
                                        VStack(spacing: 4) {
                                            Image(systemName: "star.fill")
                                                .font(.system(size: 24))
                                                .foregroundColor(TokensComponentsLight.IconOnSurfaceColorPrimary)
                                            Text("Primary")
                                                .font(.system(size: TokensCoreLight.FontSizeBodyXs))
                                                .foregroundColor(TokensSemanticLight.TextOnSurfaceColorSecondary)
                                        }
                                        
                                        VStack(spacing: 4) {
                                            Image(systemName: "heart.fill")
                                                .font(.system(size: 24))
                                                .foregroundColor(TokensComponentsLight.IconOnSurfaceColorAccent)
                                            Text("Accent")
                                                .font(.system(size: TokensCoreLight.FontSizeBodyXs))
                                                .foregroundColor(TokensSemanticLight.TextOnSurfaceColorSecondary)
                                        }
                                        
                                        VStack(spacing: 4) {
                                            Image(systemName: "checkmark.circle.fill")
                                                .font(.system(size: 24))
                                                .foregroundColor(TokensComponentsLight.IconOnSurfaceColorSuccess)
                                            Text("Success")
                                                .font(.system(size: TokensCoreLight.FontSizeBodyXs))
                                                .foregroundColor(TokensSemanticLight.TextOnSurfaceColorSecondary)
                                        }
                                        
                                        VStack(spacing: 4) {
                                            Image(systemName: "exclamationmark.triangle.fill")
                                                .font(.system(size: 24))
                                                .foregroundColor(TokensComponentsLight.IconOnSurfaceColorError)
                                            Text("Error")
                                                .font(.system(size: TokensCoreLight.FontSizeBodyXs))
                                                .foregroundColor(TokensSemanticLight.TextOnSurfaceColorSecondary)
                                        }
                                    }
                                }
                                
                                Divider()
                                
                                // Container on surface
                                VStack(alignment: .leading, spacing: 12) {
                                    HStack(spacing: 8) {
                                        Image(systemName: "square.on.square")
                                            .foregroundColor(TokensComponentsLight.IconOnSurfaceColorPrimary)
                                        Text("Containers on Surface")
                                            .font(.system(size: TokensCoreLight.FontSizeBodyMd, weight: .semibold))
                                            .foregroundColor(TokensSemanticLight.TextOnSurfaceColorPrimary)
                                    }
                                    
                                    // White container
                                    VStack(alignment: .leading, spacing: 8) {
                                        HStack(spacing: 8) {
                                            Image(systemName: "cube.fill")
                                                .foregroundColor(TokensComponentsLight.IconOnContainerColorPrimary)
                                            Text("White Container Content")
                                                .font(.system(size: TokensCoreLight.FontSizeBodyMd, weight: .semibold))
                                                .foregroundColor(TokensSemanticLight.TextOnContainerColorPrimary)
                                        }
                                        
                                        Text("Containers use TextOnContainerColor tokens for proper contrast")
                                            .font(.system(size: TokensCoreLight.FontSizeBodySm))
                                            .foregroundColor(TokensSemanticLight.TextOnContainerColorSecondary)
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(TokensSemanticLight.BackgroundContainerColorWhite)
                                    .cornerRadius(TokensSemanticLight.BorderRadiusLg)
                                    .shadow(
                                        color: TokensCoreLight.ElevationBelow1.color,
                                        radius: TokensCoreLight.ElevationBelow1.blur / 2,
                                        x: TokensCoreLight.ElevationBelow1.x,
                                        y: TokensCoreLight.ElevationBelow1.y
                                    )
                                    
                                    // Brand container
                                    VStack(alignment: .leading, spacing: 8) {
                                        HStack(spacing: 8) {
                                            Image(systemName: "sparkles")
                                                .foregroundColor(.white)
                                            Text("Brand Container")
                                                .font(.system(size: TokensCoreLight.FontSizeBodyMd, weight: .semibold))
                                                .foregroundColor(.white)
                                        }
                                        
                                        Text("Featured content on brand background")
                                            .font(.system(size: TokensCoreLight.FontSizeBodySm))
                                            .foregroundColor(.white.opacity(0.9))
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(TokensSemanticLight.BackgroundContainerColorBrand)
                                    .cornerRadius(TokensSemanticLight.BorderRadiusLg)
                                }
                            }
                            .padding(20)
                            .background(TokensSemanticLight.BackgroundSurfaceColorGreige)
                            .cornerRadius(12)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .strokeBorder(TokensSemanticLight.BorderOnContainerDefault, lineWidth: 1)
                            )
                        }
                    }
                }
                
                Divider()
                
                // Inverse Surface
                TokenSection(
                    title: "Inverse Surface",
                    description: "Dark surface for contrast and emphasis"
                ) {
                    VStack(spacing: 16) {
                        // Surface info
                        ColorSwatch(
                            name: "Surface Color Inverse",
                            color: TokensSemanticLight.BackgroundSurfaceColorInverse
                        )
                        
                        // Visual demonstration
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Surface with Content")
                                .font(.system(size: TokensCoreLight.FontSizeBodyMd, weight: .semibold))
                                .foregroundColor(TokensSemanticLight.TextOnSurfaceColorPrimary)
                            
                            // Example content on Inverse surface
                            VStack(alignment: .leading, spacing: 20) {
                                // Header
                                HStack(spacing: 8) {
                                    Image(systemName: "moon.stars.fill")
                                        .foregroundColor(TokensComponentsLight.IconOnSurfaceColorInverse)
                                    Text("Dark Mode Surface")
                                        .font(.system(size: TokensCoreLight.FontSizeBodyLg, weight: .bold))
                                        .foregroundColor(TokensComponentsLight.IconOnSurfaceColorInverse)
                                }
                                
                                Text("This surface provides high contrast and is ideal for modals, overlays, or emphasis areas.")
                                    .font(.system(size: TokensCoreLight.FontSizeBodyMd))
                                    .foregroundColor(TokensComponentsLight.IconOnSurfaceColorInverse.opacity(0.9))
                                
                                Divider()
                                    .background(Color.white.opacity(0.2))
                                
                                // Icons on inverse
                                HStack(spacing: 16) {
                                    VStack(spacing: 4) {
                                        Image(systemName: "star.fill")
                                            .font(.system(size: 24))
                                            .foregroundColor(TokensComponentsLight.IconOnSurfaceColorInverse)
                                        Text("Icon")
                                            .font(.system(size: TokensCoreLight.FontSizeBodyXs))
                                            .foregroundColor(TokensComponentsLight.IconOnSurfaceColorInverse.opacity(0.7))
                                    }
                                    
                                    VStack(spacing: 4) {
                                        Image(systemName: "heart.fill")
                                            .font(.system(size: 24))
                                            .foregroundColor(TokensSemanticLight.Brand300)
                                        Text("Accent")
                                            .font(.system(size: TokensCoreLight.FontSizeBodyXs))
                                            .foregroundColor(TokensComponentsLight.IconOnSurfaceColorInverse.opacity(0.7))
                                    }
                                    
                                    VStack(spacing: 4) {
                                        Image(systemName: "checkmark.circle.fill")
                                            .font(.system(size: 24))
                                            .foregroundColor(TokensComponentsLight.IconOnSurfaceColorSuccess)
                                        Text("Success")
                                            .font(.system(size: TokensCoreLight.FontSizeBodyXs))
                                            .foregroundColor(TokensComponentsLight.IconOnSurfaceColorInverse.opacity(0.7))
                                    }
                                }
                            }
                            .padding(20)
                            .background(TokensSemanticLight.BackgroundSurfaceColorInverse)
                            .cornerRadius(12)
                        }
                    }
                }
                
                Divider()
                
                // iOS Native Components Example
                TokenSection(
                    title: "Native iOS Components",
                    description: "How tokens inform standard iOS UI elements"
                ) {
                    VStack(alignment: .leading, spacing: 16) {
                        // List example
                        VStack(spacing: 0) {
                            HStack {
                                Image(systemName: "list.bullet")
                                    .foregroundColor(TokensComponentsLight.IconOnContainerColorPrimary)
                                Text("List Item with Icon")
                                    .font(.system(size: TokensCoreLight.FontSizeBodyMd))
                                    .foregroundColor(TokensSemanticLight.TextOnContainerColorPrimary)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(TokensComponentsLight.IconOnContainerColorTertiary)
                            }
                            .padding()
                            .background(TokensSemanticLight.BackgroundContainerColorWhite)
                            
                            Divider()
                                .padding(.leading)
                            
                            HStack {
                                Image(systemName: "gear")
                                    .foregroundColor(TokensComponentsLight.IconOnContainerColorPrimary)
                                Text("Settings")
                                    .font(.system(size: TokensCoreLight.FontSizeBodyMd))
                                    .foregroundColor(TokensSemanticLight.TextOnContainerColorPrimary)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(TokensComponentsLight.IconOnContainerColorTertiary)
                            }
                            .padding()
                            .background(TokensSemanticLight.BackgroundContainerColorWhite)
                        }
                        .cornerRadius(TokensSemanticLight.BorderRadiusLg)
                        .shadow(
                            color: TokensCoreLight.ElevationBelow1.color,
                            radius: TokensCoreLight.ElevationBelow1.blur / 2,
                            x: TokensCoreLight.ElevationBelow1.x,
                            y: TokensCoreLight.ElevationBelow1.y
                        )
                    }
                }
            }
            .padding()
        }
        .background(TokensSemanticLight.BackgroundSurfaceColorGreige.ignoresSafeArea())
    }
}

#Preview("Light Mode") {
    SurfacesView()
        .preferredColorScheme(.light)
}

#Preview("Dark Mode") {
    SurfacesView()
        .preferredColorScheme(.dark)
}
