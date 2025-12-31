import SwiftUI

/// A component that visualizes border radius values
struct BorderRadiusDemo: View {
    let name: String
    let radius: CGFloat
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Name and value
            HStack {
                Text(name)
                    .font(.system(size: TokensCoreLight.FontSizeBodySm, weight: .medium))
                    .foregroundStyle(
                        colorScheme == .dark
                            ? TokensSemanticDark.TextOnSurfaceColorPrimary
                            : TokensSemanticLight.TextOnSurfaceColorPrimary
                    )
                
                Spacer()
                
                Text(radius == 9999 ? "Full" : "\(Int(radius))pt")
                    .font(.system(size: TokensCoreLight.FontSizeBodyXs, weight: .semibold))
                    .foregroundStyle(
                        colorScheme == .dark
                            ? TokensSemanticDark.TextOnSurfaceColorSecondary
                            : TokensSemanticLight.TextOnSurfaceColorSecondary
                    )
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(
                        colorScheme == .dark
                            ? TokensSemanticDark.BackgroundContainerColorGreige
                            : TokensSemanticLight.BackgroundContainerColorGreige
                    )
                    .cornerRadius(4)
            }
            
            // Visual representation
            RoundedRectangle(cornerRadius: radius)
                .fill(
                    colorScheme == .dark
                        ? TokensSemanticDark.Brand300
                        : TokensSemanticLight.Brand300
                )
                .frame(height: 60)
                .overlay(
                    Text(radius == 9999 ? "Pill Shape" : "")
                        .font(.system(size: TokensCoreLight.FontSizeBodySm, weight: .medium))
                        .foregroundStyle(.white)
                )
        }
    }
}

#Preview {
    VStack(spacing: 16) {
        BorderRadiusDemo(name: "None", radius: TokensSemanticLight.BorderRadiusNone)
        BorderRadiusDemo(name: "SM", radius: TokensSemanticLight.BorderRadiusSm)
        BorderRadiusDemo(name: "MD", radius: TokensSemanticLight.BorderRadiusMd)
        BorderRadiusDemo(name: "LG", radius: TokensSemanticLight.BorderRadiusLg)
        BorderRadiusDemo(name: "Full", radius: TokensSemanticLight.BorderRadiusFull)
    }
    .padding()
}
