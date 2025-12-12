import SwiftUI

/// A reusable section container for grouping related tokens
struct TokenSection<Content: View>: View {
    let title: String
    let description: String?
    let content: Content
    
    @Environment(\.colorScheme) var colorScheme
    
    init(title: String, description: String? = nil, @ViewBuilder content: () -> Content) {
        self.title = title
        self.description = description
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Section header
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: TokensCoreLight.FontSizeBodyLg, weight: .bold))
                    .foregroundColor(
                        colorScheme == .dark
                            ? TokensSemanticDark.TextOnSurfaceColorPrimary
                            : TokensSemanticLight.TextOnSurfaceColorPrimary
                    )
                
                if let description = description {
                    Text(description)
                        .font(.system(size: TokensCoreLight.FontSizeBodySm))
                        .foregroundColor(
                            colorScheme == .dark
                                ? TokensSemanticDark.TextOnSurfaceColorSecondary
                                : TokensSemanticLight.TextOnSurfaceColorSecondary
                        )
                }
            }
            
            // Section content
            content
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    ScrollView {
        VStack(spacing: 24) {
            TokenSection(title: "Brand Colors", description: "Primary brand color palette") {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                    ColorSwatch(name: "Brand 300", color: TokensSemanticLight.Brand300)
                    ColorSwatch(name: "Brand 400", color: TokensSemanticLight.Brand400)
                }
            }
            
            TokenSection(title: "Typography") {
                TypographySample(name: "Body MD", fontSize: TokensCoreLight.FontSizeBodyMd)
            }
        }
        .padding()
    }
}
