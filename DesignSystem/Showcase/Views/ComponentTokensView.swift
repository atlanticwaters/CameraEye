import SwiftUI

/// View displaying all Component-level tokens
struct ComponentTokensView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 32) {
                componentTokensContent
            }
            .padding()
        }
        .background(TokensSemanticLight.BackgroundSurfaceColorGreige.ignoresSafeArea())
    }
    
    @ViewBuilder
    private var componentTokensContent: some View {
                // Page header
                VStack(alignment: .leading, spacing: 8) {
                    Text("Component Tokens")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundStyle(TokensSemanticLight.TextOnSurfaceColorPrimary)
                    
                    Text("Component-specific design tokens for icons and UI elements")
                        .font(.system(size: TokensCoreLight.FontSizeBodyMd))
                        .foregroundStyle(TokensSemanticLight.TextOnSurfaceColorSecondary)
                }
                .padding(.bottom, 8)
                
                // Icon Action Colors
                TokenSection(title: "Icon Action Colors", description: "Icons within interactive elements (on action button backgrounds)") {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Ghost Buttons")
                            .font(.system(size: TokensCoreLight.FontSizeBodyMd, weight: .semibold))
                            .foregroundStyle(TokensSemanticLight.TextOnSurfaceColorPrimary)
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                            IconColorDemo(
                                name: "Ghost Default",
                                iconColor: TokensComponentsLight.IconActionColorGhostFilledDefault,
                                backgroundColor: TokensSemanticLight.BackgroundButtonColorGhostFilledDefault,
                                description: "Icon on Ghost button"
                            )
                            IconColorDemo(
                                name: "Ghost Inactive",
                                iconColor: TokensComponentsLight.IconActionColorGhostFilledInactive,
                                backgroundColor: TokensSemanticLight.BackgroundButtonColorGhostFilledInactive,
                                description: "Icon on inactive Ghost button"
                            )
                        }
                        
                        Text("Orange Buttons")
                            .font(.system(size: TokensCoreLight.FontSizeBodyMd, weight: .semibold))
                            .foregroundStyle(TokensSemanticLight.TextOnSurfaceColorPrimary)
                            .padding(.top, 8)
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                            IconColorDemo(
                                name: "Orange Default",
                                iconColor: TokensComponentsLight.IconActionColorOrangeFilledDefault,
                                backgroundColor: TokensSemanticLight.BackgroundButtonColorBrandFilledDefault,
                                description: "Icon on Orange button"
                            )
                            IconColorDemo(
                                name: "Orange Inactive",
                                iconColor: TokensComponentsLight.IconActionColorOrangeFilledInactive,
                                backgroundColor: TokensSemanticLight.BackgroundButtonColorBrandFilledInactive,
                                description: "Icon on inactive Orange button"
                            )
                        }
                        
                        Text("White & Transparent Buttons")
                            .font(.system(size: TokensCoreLight.FontSizeBodyMd, weight: .semibold))
                            .foregroundStyle(TokensSemanticLight.TextOnSurfaceColorPrimary)
                            .padding(.top, 8)
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                            IconColorDemo(
                                name: "White Default",
                                iconColor: TokensComponentsLight.IconActionColorWhiteFilledDefault,
                                backgroundColor: TokensSemanticLight.BackgroundButtonColorWhiteFilledDefault,
                                description: "Icon on White button"
                            )
                            IconColorDemo(
                                name: "White Inactive",
                                iconColor: TokensComponentsLight.IconActionColorWhiteFilledInactive,
                                backgroundColor: TokensSemanticLight.BackgroundButtonColorWhiteFilledInactive,
                                description: "Icon on inactive White button"
                            )
                            IconColorDemo(
                                name: "Transparent 05 Default",
                                iconColor: TokensComponentsLight.IconActionColorTransparent05FilledDefault,
                                backgroundColor: TokensSemanticLight.BackgroundButtonColorTransparent05Default,
                                description: "Icon on Transparent 05 button"
                            )
                            IconColorDemo(
                                name: "Transparent 10 Default",
                                iconColor: TokensComponentsLight.IconActionColorTransparent10FilledDefault,
                                backgroundColor: TokensSemanticLight.BackgroundButtonColorTransparent10Default,
                                description: "Icon on Transparent 10 button"
                            )
                        }
                    }
                }
                
                Divider()
                
                // Icon Input Colors
                TokenSection(title: "Icon Input Colors", description: "Icons within input fields (on input backgrounds)") {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                        IconColorDemo(
                            name: "Default",
                            iconColor: TokensComponentsLight.IconInputColorDefault,
                            backgroundColor: TokensSemanticLight.BackgroundInputColorWhiteOutlinedDefault,
                            description: "Icon on default input field"
                        )
                        IconColorDemo(
                            name: "Active",
                            iconColor: TokensComponentsLight.IconInputColorActive,
                            backgroundColor: TokensSemanticLight.BackgroundInputColorWhiteOutlinedPressed,
                            description: "Icon on active input field"
                        )
                        IconColorDemo(
                            name: "Inactive",
                            iconColor: TokensComponentsLight.IconInputColorInactive,
                            backgroundColor: TokensSemanticLight.BackgroundInputColorWhiteOutlinedInactive,
                            description: "Icon on inactive input field"
                        )
                    }
                }
                
                Divider()
                
                // Icon on Container Colors
                TokenSection(title: "Icon on Container Colors", description: "Icons on container backgrounds") {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                        IconColorDemo(
                            name: "Primary",
                            iconColor: TokensComponentsLight.IconOnContainerColorPrimary,
                            backgroundColor: TokensSemanticLight.BackgroundContainerColorGreige,
                            description: "Icon on Greige container"
                        )
                        IconColorDemo(
                            name: "Secondary",
                            iconColor: TokensComponentsLight.IconOnContainerColorSecondary,
                            backgroundColor: TokensSemanticLight.BackgroundContainerColorGreige,
                            description: "Icon on Greige container"
                        )
                        IconColorDemo(
                            name: "Tertiary",
                            iconColor: TokensComponentsLight.IconOnContainerColorTertiary,
                            backgroundColor: TokensSemanticLight.BackgroundContainerColorGreige,
                            description: "Icon on Greige container"
                        )
                        IconColorDemo(
                            name: "Accent",
                            iconColor: TokensComponentsLight.IconOnContainerColorAccent,
                            backgroundColor: TokensSemanticLight.BackgroundContainerColorGreige,
                            description: "Icon on Greige container"
                        )
                        IconColorDemo(
                            name: "Accent 2",
                            iconColor: TokensComponentsLight.IconOnContainerColorAccent2,
                            backgroundColor: TokensSemanticLight.BackgroundContainerColorGreige,
                            description: "Icon on Greige container"
                        )
                        IconColorDemo(
                            name: "Inverse",
                            iconColor: TokensComponentsLight.IconOnContainerColorInverse,
                            backgroundColor: TokensSemanticLight.BackgroundContainerColorGreige,
                            description: "Icon on Greige container"
                        )
                        IconColorDemo(
                            name: "Error",
                            iconColor: TokensComponentsLight.IconOnContainerColorError,
                            backgroundColor: TokensSemanticLight.BackgroundContainerColorGreige,
                            description: "Icon on Greige container"
                        )
                        IconColorDemo(
                            name: "Success",
                            iconColor: TokensComponentsLight.IconOnContainerColorSuccess,
                            backgroundColor: TokensSemanticLight.BackgroundContainerColorGreige,
                            description: "Icon on Greige container"
                        )
                        IconColorDemo(
                            name: "Warning",
                            iconColor: TokensComponentsLight.IconOnContainerColorWarning,
                            backgroundColor: TokensSemanticLight.BackgroundContainerColorGreige,
                            description: "Icon on Greige container"
                        )
                        IconColorDemo(
                            name: "Informational",
                            iconColor: TokensComponentsLight.IconOnContainerColorInformational,
                            backgroundColor: TokensSemanticLight.BackgroundContainerColorGreige,
                            description: "Icon on Greige container"
                        )
                        IconColorDemo(
                            name: "Inactive",
                            iconColor: TokensComponentsLight.IconOnContainerColorInactive,
                            backgroundColor: TokensSemanticLight.BackgroundContainerColorGreige,
                            description: "Icon on Greige container"
                        )
                    }
                }
                
                Divider()
                
                // Icon on Surface Colors
                TokenSection(title: "Icon on Surface Colors", description: "Icons on surface backgrounds") {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                        IconColorDemo(
                            name: "Primary",
                            iconColor: TokensComponentsLight.IconOnSurfaceColorPrimary,
                            backgroundColor: TokensSemanticLight.BackgroundSurfaceColorGreige,
                            description: "Icon on Greige surface"
                        )
                        IconColorDemo(
                            name: "Secondary",
                            iconColor: TokensComponentsLight.IconOnSurfaceColorSecondary,
                            backgroundColor: TokensSemanticLight.BackgroundSurfaceColorGreige,
                            description: "Icon on Greige surface"
                        )
                        IconColorDemo(
                            name: "Tertiary",
                            iconColor: TokensComponentsLight.IconOnSurfaceColorTertiary,
                            backgroundColor: TokensSemanticLight.BackgroundSurfaceColorGreige,
                            description: "Icon on Greige surface"
                        )
                        IconColorDemo(
                            name: "Accent",
                            iconColor: TokensComponentsLight.IconOnSurfaceColorAccent,
                            backgroundColor: TokensSemanticLight.BackgroundSurfaceColorGreige,
                            description: "Icon on Greige surface"
                        )
                        IconColorDemo(
                            name: "Accent 2",
                            iconColor: TokensComponentsLight.IconOnSurfaceColorAccent2,
                            backgroundColor: TokensSemanticLight.BackgroundSurfaceColorGreige,
                            description: "Icon on Greige surface"
                        )
                        IconColorDemo(
                            name: "Inverse",
                            iconColor: TokensComponentsLight.IconOnSurfaceColorInverse,
                            backgroundColor: TokensSemanticLight.BackgroundSurfaceColorGreige,
                            description: "Icon on Greige surface"
                        )
                        IconColorDemo(
                            name: "Error",
                            iconColor: TokensComponentsLight.IconOnSurfaceColorError,
                            backgroundColor: TokensSemanticLight.BackgroundSurfaceColorGreige,
                            description: "Icon on Greige surface"
                        )
                        IconColorDemo(
                            name: "Success",
                            iconColor: TokensComponentsLight.IconOnSurfaceColorSuccess,
                            backgroundColor: TokensSemanticLight.BackgroundSurfaceColorGreige,
                            description: "Icon on Greige surface"
                        )
                        IconColorDemo(
                            name: "Warning",
                            iconColor: TokensComponentsLight.IconOnSurfaceColorWarning,
                            backgroundColor: TokensSemanticLight.BackgroundSurfaceColorGreige,
                            description: "Icon on Greige surface"
                        )
                        IconColorDemo(
                            name: "Informational",
                            iconColor: TokensComponentsLight.IconOnSurfaceColorInformational,
                            backgroundColor: TokensSemanticLight.BackgroundSurfaceColorGreige,
                            description: "Icon on Greige surface"
                        )
                        IconColorDemo(
                            name: "Inactive",
                            iconColor: TokensComponentsLight.IconOnSurfaceColorInactive,
                            backgroundColor: TokensSemanticLight.BackgroundSurfaceColorGreige,
                            description: "Icon on Greige surface"
                        )
                    }
                }
                
                Divider()
                
                // Icon Selector Colors
                TokenSection(title: "Icon Selector Colors", description: "Icons within selector components (on selector backgrounds)") {
                    VStack(spacing: 16) {
                        Text("Filled Selectors")
                            .font(.system(size: TokensCoreLight.FontSizeBodyMd, weight: .semibold))
                            .foregroundStyle(TokensSemanticLight.TextOnSurfaceColorPrimary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                            IconColorDemo(
                                name: "Default",
                                iconColor: TokensComponentsLight.IconSelectorColorFilledDefault,
                                backgroundColor: TokensSemanticLight.BackgroundSelectorColorFilledDefault,
                                description: "Icon on filled selector"
                            )
                            IconColorDemo(
                                name: "Active",
                                iconColor: TokensComponentsLight.IconSelectorColorFilledActive,
                                backgroundColor: TokensSemanticLight.BackgroundSelectorColorFilledPressed,
                                description: "Icon on active filled selector"
                            )
                            IconColorDemo(
                                name: "Inactive",
                                iconColor: TokensComponentsLight.IconSelectorColorFilledInactive,
                                backgroundColor: TokensSemanticLight.BackgroundSelectorColorFilledInactive,
                                description: "Icon on inactive filled selector"
                            )
                            IconColorDemo(
                                name: "Selected",
                                iconColor: TokensComponentsLight.IconSelectorColorFilledSelected,
                                backgroundColor: TokensSemanticLight.BackgroundSelectorColorFilledSelected,
                                description: "Icon on selected filled selector"
                            )
                        }
                        
                        Text("Outline Selectors")
                            .font(.system(size: TokensCoreLight.FontSizeBodyMd, weight: .semibold))
                            .foregroundStyle(TokensSemanticLight.TextOnSurfaceColorPrimary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 16)
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                            IconColorDemo(
                                name: "Default",
                                iconColor: TokensComponentsLight.IconSelectorColorOutlineDefault,
                                backgroundColor: TokensSemanticLight.BackgroundSelectorColorOutlineDefault,
                                description: "Icon on outline selector"
                            )
                            IconColorDemo(
                                name: "Active",
                                iconColor: TokensComponentsLight.IconSelectorColorOutlineActive,
                                backgroundColor: TokensSemanticLight.BackgroundSelectorColorOutlinePressed,
                                description: "Icon on active outline selector"
                            )
                            IconColorDemo(
                                name: "Inactive",
                                iconColor: TokensComponentsLight.IconSelectorColorOutlineInactive,
                                backgroundColor: TokensSemanticLight.BackgroundSelectorColorOutlineInactive,
                                description: "Icon on inactive outline selector"
                            )
                            IconColorDemo(
                                name: "Selected",
                                iconColor: TokensComponentsLight.IconSelectorColorOutlineSelected,
                                backgroundColor: TokensSemanticLight.BackgroundSelectorColorOutlineSelected,
                                description: "Icon on selected outline selector"
                            )
                        }
                    }
                }
                
                Divider()
                
                // Badge Example
                TokenSection(title: "Badge Component", description: "Example badge usage with component tokens") {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Note: Badges use semantic color tokens, not component-specific tokens.")
                            .font(.system(size: TokensCoreLight.FontSizeBodySm))
                            .foregroundStyle(TokensSemanticLight.TextOnSurfaceColorSecondary)
                        
                        // Visual example
                        HStack(spacing: 8) {
                            Text("NEW")
                                .font(.system(size: TokensCoreLight.FontSizeBodyXs, weight: .bold))
                                .foregroundStyle(.white)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(TokensSemanticLight.BackgroundAccentColorRed)
                                .cornerRadius(4)
                            
                            Text("SALE")
                                .font(.system(size: TokensCoreLight.FontSizeBodyXs, weight: .bold))
                                .foregroundStyle(.white)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(TokensSemanticLight.BackgroundButtonColorBrandFilledDefault)
                                .cornerRadius(4)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(TokensSemanticLight.BackgroundContainerColorGreige)
                        .cornerRadius(8)
                    }
                }
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
