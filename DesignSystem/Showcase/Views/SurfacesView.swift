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
                        .font(.system(size: 22, weight: .bold))
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
                    VStack(alignment: .leading, spacing: 24) {
                        // List example
                        VStack(alignment: .leading, spacing: 8) {
                            Text("List Items")
                                .font(.system(size: TokensCoreLight.FontSizeBodyMd, weight: .semibold))
                                .foregroundColor(TokensSemanticLight.TextOnSurfaceColorPrimary)
                            
                            VStack(spacing: 0) {
                                HStack {
                                    Image(systemName: "list.bullet")
                                        .foregroundColor(TokensComponentsLight.IconOnContainerColorPrimary)
                                    Text("List Item with Icon")
                                        .font(.system(size: TokensCoreLight.FontSizeBodyMd))
                                        .foregroundColor(TokensSemanticLight.TextOnContainerColorPrimary)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .font(.system(size: 14))
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
                                        .font(.system(size: 14))
                                        .foregroundColor(TokensComponentsLight.IconOnContainerColorTertiary)
                                }
                                .padding()
                                .background(TokensSemanticLight.BackgroundContainerColorWhite)
                                
                                Divider()
                                    .padding(.leading)
                                
                                HStack {
                                    Image(systemName: "bell")
                                        .foregroundColor(TokensComponentsLight.IconOnContainerColorAccent)
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text("Notifications")
                                            .font(.system(size: TokensCoreLight.FontSizeBodyMd))
                                            .foregroundColor(TokensSemanticLight.TextOnContainerColorPrimary)
                                        Text("3 new alerts")
                                            .font(.system(size: TokensCoreLight.FontSizeBodySm))
                                            .foregroundColor(TokensSemanticLight.TextOnContainerColorSecondary)
                                    }
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .font(.system(size: 14))
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
                        
                        // Buttons
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Buttons")
                                .font(.system(size: TokensCoreLight.FontSizeBodyMd, weight: .semibold))
                                .foregroundColor(TokensSemanticLight.TextOnSurfaceColorPrimary)
                            
                            VStack(spacing: 12) {
                                // Brand button
                                Button {} label: {
                                    HStack {
                                        Image(systemName: "cart.fill")
                                            .foregroundColor(TokensComponentsLight.IconActionColorOrangeFilledDefault)
                                        Text("Add to Cart")
                                            .font(.system(size: TokensCoreLight.FontSizeBodyMd, weight: .semibold))
                                            .foregroundColor(TokensSemanticLight.TextButtonColorOrangeFilledDefault)
                                    }
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 12)
                                    .background(TokensSemanticLight.BackgroundButtonColorBrandFilledDefault)
                                    .cornerRadius(TokensSemanticLight.BorderRadiusLg)
                                }
                                
                                // Ghost button
                                Button {} label: {
                                    HStack {
                                        Image(systemName: "heart")
                                            .foregroundColor(TokensComponentsLight.IconActionColorGhostFilledDefault)
                                        Text("Add to Wishlist")
                                            .font(.system(size: TokensCoreLight.FontSizeBodyMd, weight: .semibold))
                                            .foregroundColor(TokensSemanticLight.TextButtonColorGhostFilledDefault)
                                    }
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 12)
                                    .background(TokensSemanticLight.BackgroundButtonColorGhostFilledDefault)
                                    .cornerRadius(TokensSemanticLight.BorderRadiusLg)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: TokensSemanticLight.BorderRadiusLg)
                                            .stroke(TokensSemanticLight.BorderButtonColorDefault, lineWidth: TokensSemanticLight.BorderWidthXs)
                                    )
                                }
                                
                                // White button
                                Button {} label: {
                                    HStack {
                                        Image(systemName: "info.circle")
                                            .foregroundColor(TokensComponentsLight.IconActionColorWhiteFilledDefault)
                                        Text("Learn More")
                                            .font(.system(size: TokensCoreLight.FontSizeBodyMd, weight: .semibold))
                                            .foregroundColor(TokensSemanticLight.TextButtonColorWhiteFilledDefault)
                                    }
                                    .frame(maxWidth: .infinity)
                                    .padding(.vertical, 12)
                                    .background(TokensSemanticLight.BackgroundButtonColorWhiteFilledDefault)
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
                        
                        // Input Fields
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Input Fields")
                                .font(.system(size: TokensCoreLight.FontSizeBodyMd, weight: .semibold))
                                .foregroundColor(TokensSemanticLight.TextOnSurfaceColorPrimary)
                            
                            VStack(spacing: 12) {
                                // Text field
                                HStack {
                                    Image(systemName: "magnifyingglass")
                                        .foregroundColor(TokensComponentsLight.IconInputColorDefault)
                                    Text("Search...")
                                        .font(.system(size: TokensCoreLight.FontSizeBodyMd))
                                        .foregroundColor(TokensSemanticLight.TextInputColorWhiteOutlinedDefault)
                                    Spacer()
                                }
                                .padding()
                                .background(TokensSemanticLight.BackgroundInputColorWhiteOutlinedDefault)
                                .cornerRadius(TokensSemanticLight.BorderRadiusLg)
                                .overlay(
                                    RoundedRectangle(cornerRadius: TokensSemanticLight.BorderRadiusLg)
                                        .stroke(TokensSemanticLight.BorderInputColorDefault, lineWidth: TokensSemanticLight.BorderWidthXs)
                                )
                                
                                // Email field
                                HStack {
                                    Image(systemName: "envelope")
                                        .foregroundColor(TokensComponentsLight.IconInputColorDefault)
                                    Text("Email address")
                                        .font(.system(size: TokensCoreLight.FontSizeBodyMd))
                                        .foregroundColor(TokensSemanticLight.TextInputColorWhiteOutlinedDefault)
                                    Spacer()
                                }
                                .padding()
                                .background(TokensSemanticLight.BackgroundInputColorWhiteOutlinedDefault)
                                .cornerRadius(TokensSemanticLight.BorderRadiusLg)
                                .overlay(
                                    RoundedRectangle(cornerRadius: TokensSemanticLight.BorderRadiusLg)
                                        .stroke(TokensSemanticLight.BorderInputColorDefault, lineWidth: TokensSemanticLight.BorderWidthXs)
                                )
                            }
                        }
                        
                        // Toggles and Selectors
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Toggles & Selectors")
                                .font(.system(size: TokensCoreLight.FontSizeBodyMd, weight: .semibold))
                                .foregroundColor(TokensSemanticLight.TextOnSurfaceColorPrimary)
                            
                            VStack(spacing: 0) {
                                // Toggle item
                                HStack {
                                    Image(systemName: "bell.fill")
                                        .foregroundColor(TokensComponentsLight.IconOnContainerColorPrimary)
                                    Text("Push Notifications")
                                        .font(.system(size: TokensCoreLight.FontSizeBodyMd))
                                        .foregroundColor(TokensSemanticLight.TextOnContainerColorPrimary)
                                    Spacer()
                                    // Simulated toggle
                                    ZStack(alignment: .trailing) {
                                        RoundedRectangle(cornerRadius: 16)
                                            .fill(TokensSemanticLight.BackgroundSelectorColorFilledSelected)
                                            .frame(width: 51, height: 31)
                                        Circle()
                                            .fill(TokensSemanticLight.BackgroundSelectorColorFilledSwitchHandleSelected)
                                            .frame(width: 27, height: 27)
                                            .padding(2)
                                    }
                                }
                                .padding()
                                .background(TokensSemanticLight.BackgroundContainerColorWhite)
                                
                                Divider()
                                    .padding(.leading)
                                
                                // Checkbox item
                                HStack {
                                    Image(systemName: "envelope.badge")
                                        .foregroundColor(TokensComponentsLight.IconOnContainerColorPrimary)
                                    Text("Email Updates")
                                        .font(.system(size: TokensCoreLight.FontSizeBodyMd))
                                        .foregroundColor(TokensSemanticLight.TextOnContainerColorPrimary)
                                    Spacer()
                                    Image(systemName: "checkmark.square.fill")
                                        .font(.system(size: 24))
                                        .foregroundColor(TokensSemanticLight.BackgroundSelectorColorFilledSelected)
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
                        
                        // Cards
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Cards")
                                .font(.system(size: TokensCoreLight.FontSizeBodyMd, weight: .semibold))
                                .foregroundColor(TokensSemanticLight.TextOnSurfaceColorPrimary)
                            
                            // Product card example
                            VStack(alignment: .leading, spacing: 12) {
                                // Image placeholder
                                RoundedRectangle(cornerRadius: TokensSemanticLight.BorderRadiusLg)
                                    .fill(TokensSemanticLight.BackgroundContainerColorGreige)
                                    .frame(height: 120)
                                    .overlay(
                                        Image(systemName: "photo")
                                            .font(.system(size: 32))
                                            .foregroundColor(TokensComponentsLight.IconOnContainerColorTertiary)
                                    )
                                
                                VStack(alignment: .leading, spacing: 8) {
                                    Text("Product Name")
                                        .font(.system(size: TokensCoreLight.FontSizeBodyLg, weight: .semibold))
                                        .foregroundColor(TokensSemanticLight.TextOnContainerColorPrimary)
                                    
                                    Text("Brief description of the product using semantic tokens")
                                        .font(.system(size: TokensCoreLight.FontSizeBodySm))
                                        .foregroundColor(TokensSemanticLight.TextOnContainerColorSecondary)
                                        .lineLimit(2)
                                    
                                    HStack {
                                        Text("$99.99")
                                            .font(.system(size: TokensCoreLight.FontSizeBodyLg, weight: .bold))
                                            .foregroundColor(TokensSemanticLight.TextOnContainerColorAccent)
                                        
                                        Spacer()
                                        
                                        HStack(spacing: 4) {
                                            Image(systemName: "star.fill")
                                                .font(.system(size: 12))
                                                .foregroundColor(TokensComponentsLight.IconOnContainerColorWarning)
                                            Text("4.8")
                                                .font(.system(size: TokensCoreLight.FontSizeBodySm, weight: .medium))
                                                .foregroundColor(TokensSemanticLight.TextOnContainerColorPrimary)
                                        }
                                    }
                                }
                                .padding([.horizontal, .bottom], 12)
                            }
                            .background(TokensSemanticLight.BackgroundContainerColorWhite)
                            .cornerRadius(TokensSemanticLight.BorderRadiusLg)
                            .shadow(
                                color: TokensCoreLight.ElevationBelow1.color,
                                radius: TokensCoreLight.ElevationBelow1.blur / 2,
                                x: TokensCoreLight.ElevationBelow1.x,
                                y: TokensCoreLight.ElevationBelow1.y
                            )
                        }
                        
                        // Alerts & Feedback
                        VStack(alignment: .leading, spacing: 12) {
                            Text("Alerts & Feedback")
                                .font(.system(size: TokensCoreLight.FontSizeBodyMd, weight: .semibold))
                                .foregroundColor(TokensSemanticLight.TextOnSurfaceColorPrimary)
                            
                            VStack(spacing: 12) {
                                // Success alert
                                HStack(spacing: 12) {
                                    Image(systemName: "checkmark.circle.fill")
                                        .font(.system(size: 24))
                                        .foregroundColor(TokensComponentsLight.IconOnContainerColorSuccess)
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text("Success")
                                            .font(.system(size: TokensCoreLight.FontSizeBodySm, weight: .semibold))
                                            .foregroundColor(TokensSemanticLight.TextOnContainerColorSuccess)
                                        Text("Your changes have been saved")
                                            .font(.system(size: TokensCoreLight.FontSizeBodySm))
                                            .foregroundColor(TokensSemanticLight.TextOnContainerColorSecondary)
                                    }
                                    Spacer()
                                }
                                .padding()
                                .background(TokensSemanticLight.BackgroundFeedbackColorSuccessAccent1)
                                .cornerRadius(TokensSemanticLight.BorderRadiusLg)
                                .overlay(
                                    RoundedRectangle(cornerRadius: TokensSemanticLight.BorderRadiusLg)
                                        .stroke(TokensSemanticLight.BackgroundFeedbackColorSuccessAccent2.opacity(0.3), lineWidth: 1)
                                )
                                
                                // Error alert
                                HStack(spacing: 12) {
                                    Image(systemName: "exclamationmark.circle.fill")
                                        .font(.system(size: 24))
                                        .foregroundColor(TokensComponentsLight.IconOnContainerColorError)
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text("Error")
                                            .font(.system(size: TokensCoreLight.FontSizeBodySm, weight: .semibold))
                                            .foregroundColor(TokensSemanticLight.TextOnContainerColorError)
                                        Text("Please check your input")
                                            .font(.system(size: TokensCoreLight.FontSizeBodySm))
                                            .foregroundColor(TokensSemanticLight.TextOnContainerColorSecondary)
                                    }
                                    Spacer()
                                }
                                .padding()
                                .background(TokensSemanticLight.BackgroundFeedbackColorErrorAccent1)
                                .cornerRadius(TokensSemanticLight.BorderRadiusLg)
                                .overlay(
                                    RoundedRectangle(cornerRadius: TokensSemanticLight.BorderRadiusLg)
                                        .stroke(TokensSemanticLight.BackgroundFeedbackColorErrorAccent2.opacity(0.3), lineWidth: 1)
                                )
                                
                                // Warning alert
                                HStack(spacing: 12) {
                                    Image(systemName: "exclamationmark.triangle.fill")
                                        .font(.system(size: 24))
                                        .foregroundColor(TokensComponentsLight.IconOnContainerColorWarning)
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text("Warning")
                                            .font(.system(size: TokensCoreLight.FontSizeBodySm, weight: .semibold))
                                            .foregroundColor(TokensSemanticLight.TextOnContainerColorWarning)
                                        Text("This action cannot be undone")
                                            .font(.system(size: TokensCoreLight.FontSizeBodySm))
                                            .foregroundColor(TokensSemanticLight.TextOnContainerColorSecondary)
                                    }
                                    Spacer()
                                }
                                .padding()
                                .background(TokensSemanticLight.BackgroundFeedbackColorWarningAccent1)
                                .cornerRadius(TokensSemanticLight.BorderRadiusLg)
                                .overlay(
                                    RoundedRectangle(cornerRadius: TokensSemanticLight.BorderRadiusLg)
                                        .stroke(TokensSemanticLight.BackgroundFeedbackColorWarningAccent2.opacity(0.3), lineWidth: 1)
                                )
                                
                                // Info alert
                                HStack(spacing: 12) {
                                    Image(systemName: "info.circle.fill")
                                        .font(.system(size: 24))
                                        .foregroundColor(TokensComponentsLight.IconOnContainerColorInformational)
                                    VStack(alignment: .leading, spacing: 2) {
                                        Text("Information")
                                            .font(.system(size: TokensCoreLight.FontSizeBodySm, weight: .semibold))
                                            .foregroundColor(TokensSemanticLight.TextOnContainerColorInformational)
                                        Text("New features are available")
                                            .font(.system(size: TokensCoreLight.FontSizeBodySm))
                                            .foregroundColor(TokensSemanticLight.TextOnContainerColorSecondary)
                                    }
                                    Spacer()
                                }
                                .padding()
                                .background(TokensSemanticLight.BackgroundFeedbackColorInformationalAccent1)
                                .cornerRadius(TokensSemanticLight.BorderRadiusLg)
                                .overlay(
                                    RoundedRectangle(cornerRadius: TokensSemanticLight.BorderRadiusLg)
                                        .stroke(TokensSemanticLight.BackgroundFeedbackColorInformationalAccent2.opacity(0.3), lineWidth: 1)
                                )
                            }
                        }
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
