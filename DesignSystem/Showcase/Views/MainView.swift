import SwiftUI

/// Main navigation view for the Token Showcase app
struct MainView: View {
    @State private var selectedTab: Tab = .core
    @State private var preferredColorScheme: ColorScheme? = nil
    
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
    
    @Environment(\.colorScheme) var systemColorScheme
    
    var effectiveColorScheme: ColorScheme {
        preferredColorScheme ?? systemColorScheme
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            tabContent(for: .core, view: CoreTokensView())
            tabContent(for: .semantic, view: SemanticTokensView())
            tabContent(for: .components, view: ComponentTokensView())
            tabContent(for: .surfaces, view: SurfacesView())
        }
        .preferredColorScheme(preferredColorScheme)
    }
    
    @ViewBuilder
    private func tabContent<Content: View>(for tab: Tab, view: Content) -> some View {
        NavigationView {
            view
                .navigationTitle("Design System Tokens")
                .navigationBarTitleDisplayMode(.large)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Menu {
                            Button {
                                preferredColorScheme = nil
                            } label: {
                                Label("Auto", systemImage: "circle.lefthalf.filled")
                            }
                            
                            Button {
                                preferredColorScheme = .light
                            } label: {
                                Label("Light", systemImage: "sun.max.fill")
                            }
                            
                            Button {
                                preferredColorScheme = .dark
                            } label: {
                                Label("Dark", systemImage: "moon.fill")
                            }
                        } label: {
                            Image(systemName: themeIcon)
                                .font(.system(size: 16))
                                .foregroundColor(
                                    effectiveColorScheme == .dark 
                                        ? TokensSemanticDark.TextOnSurfaceColorPrimary 
                                        : TokensSemanticLight.TextOnSurfaceColorPrimary
                                )
                        }
                    }
                }
        }
        .tabItem {
            Label(tab.rawValue, systemImage: tab.icon)
        }
        .tag(tab)
    }
    
    private var themeIcon: String {
        switch preferredColorScheme {
        case .light:
            return "sun.max.fill"
        case .dark:
            return "moon.fill"
        case nil:
            return "circle.lefthalf.filled"
        @unknown default:
            return "circle.lefthalf.filled"
        }
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
