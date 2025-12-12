import SwiftUI

/// Main navigation view for the Token Showcase app
struct MainView: View {
    @State private var selectedTab: Tab = .core
    @State private var preferredColorScheme: ColorScheme = .light
    
    enum Tab: String, CaseIterable {
        case core = "Core"
        case semantic = "Semantic"
        case components = "Components"
        case surfaces = "Surfaces"
        
        var icon: String {
            switch self {
            case .core: return "cube.fill"
            case .semantic: return "square.stack.3d.up.fill"
            case .components: return "puzzlepiece.fill"
            case .surfaces: return "rectangle.split.3x1.fill"
            }
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                // Background
                TokensSemanticLight.BackgroundSurfaceColorGreige
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    // Content area
                    TabView(selection: $selectedTab) {
                        CoreTokensView()
                            .tag(Tab.core)
                        
                        SemanticTokensView()
                            .tag(Tab.semantic)
                        
                        ComponentTokensView()
                            .tag(Tab.components)
                        
                        SurfacesView()
                            .tag(Tab.surfaces)
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    
                    // Custom tab bar
                    HStack(spacing: 0) {
                        ForEach(Tab.allCases, id: \.self) { tab in
                            Button(action: { 
                                withAnimation(.easeInOut(duration: 0.2)) {
                                    selectedTab = tab
                                }
                            }) {
                                VStack(spacing: 4) {
                                    Image(systemName: tab.icon)
                                        .font(.system(size: 20))
                                        .foregroundColor(
                                            selectedTab == tab 
                                                ? TokensSemanticLight.Brand300 
                                                : TokensSemanticLight.TextOnSurfaceColorTertiary
                                        )
                                    
                                    Text(tab.rawValue)
                                        .font(.system(size: TokensCoreLight.FontSizeBodyXs, weight: .medium))
                                        .foregroundColor(
                                            selectedTab == tab 
                                                ? TokensSemanticLight.Brand300 
                                                : TokensSemanticLight.TextOnSurfaceColorTertiary
                                        )
                                }
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 12)
                            }
                        }
                    }
                    .background(
                        TokensSemanticLight.BackgroundContainerColorWhite
                            .shadow(
                                color: TokensCoreLight.ElevationAbove2.color,
                                radius: TokensCoreLight.ElevationAbove2.blur / 2,
                                x: TokensCoreLight.ElevationAbove2.x,
                                y: TokensCoreLight.ElevationAbove2.y
                            )
                    )
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack(spacing: 2) {
                        Text("Design System")
                            .font(.system(size: TokensCoreLight.FontSizeBodyMd, weight: .bold))
                            .foregroundColor(TokensSemanticLight.TextOnSurfaceColorPrimary)
                        
                        Text("Token Showcase")
                            .font(.system(size: TokensCoreLight.FontSizeBodyXs))
                            .foregroundColor(TokensSemanticLight.TextOnSurfaceColorSecondary)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    ThemeSwitcher(colorScheme: $preferredColorScheme)
                }
            }
        }
        .preferredColorScheme(preferredColorScheme)
    }
}

#Preview("Light Mode") {
    MainView()
        .preferredColorScheme(.light)
}

#Preview("Dark Mode") {
    MainView()
        .preferredColorScheme(.dark)
}
