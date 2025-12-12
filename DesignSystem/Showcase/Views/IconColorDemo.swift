import SwiftUI

/// A component that displays an icon in a specific color on a specific background
/// to demonstrate icon/background pairings from the design system
struct IconColorDemo: View {
    let name: String
    let iconColor: Color
    let backgroundColor: Color
    let description: String
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Icon preview on background
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(backgroundColor)
                    .stroke(
                        colorScheme == .dark
                            ? TokensSemanticDark.BorderOnContainerDefault
                            : TokensSemanticLight.BorderOnContainerDefault,
                        lineWidth: 1
                    )
                
                Image(systemName: "star.fill")
                    .font(.system(size: 32))
                    .foregroundStyle(iconColor)
            }
            .frame(height: 80)
            
            // Name
            Text(name)
                .font(.system(size: TokensCoreLight.FontSizeBodySm, weight: .medium))
                .foregroundColor(
                    colorScheme == .dark
                        ? TokensSemanticDark.TextOnSurfaceColorPrimary
                        : TokensSemanticLight.TextOnSurfaceColorPrimary
                )
            
            // Description
            Text(description)
                .font(.system(size: TokensCoreLight.FontSizeBodyXs))
                .foregroundColor(
                    colorScheme == .dark
                        ? TokensSemanticDark.TextOnSurfaceColorSecondary
                        : TokensSemanticLight.TextOnSurfaceColorSecondary
                )
                .lineLimit(2)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
}

#Preview {
    VStack(spacing: 16) {
        IconColorDemo(
            name: "Ghost Default",
            iconColor: TokensComponentsLight.IconActionColorGhostFilledDefault,
            backgroundColor: TokensSemanticLight.BackgroundButtonColorGhostFilledDefault,
            description: "Icon on Ghost button"
        )
        IconColorDemo(
            name: "Orange Default",
            iconColor: TokensComponentsLight.IconActionColorOrangeFilledDefault,
            backgroundColor: TokensSemanticLight.BackgroundButtonColorBrandFilledDefault,
            description: "Icon on Orange button"
        )
    }
    .padding()
    .background(TokensSemanticLight.BackgroundSurfaceColorGreige)
}
