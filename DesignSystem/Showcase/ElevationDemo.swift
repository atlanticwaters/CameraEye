import SwiftUI

/// A component that visualizes elevation/shadow tokens
struct ElevationDemo: View {
    let name: String
    let elevation: DSShadow
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Name and shadow details
            VStack(alignment: .leading, spacing: 4) {
                Text(name)
                    .font(.system(size: TokensCoreLight.FontSizeBodySm, weight: .medium))
                    .foregroundStyle(TokensSemanticLight.TextOnSurfaceColorPrimary)
                
                Text("x:\(Int(elevation.x)) y:\(Int(elevation.y)) blur:\(Int(elevation.blur))")
                    .font(.system(size: TokensCoreLight.FontSizeBodyXs))
                    .foregroundStyle(TokensSemanticLight.TextOnSurfaceColorSecondary)
                    .monospaced()
            }
            
            // Visual representation
            RoundedRectangle(cornerRadius: 8)
                .fill(TokensSemanticLight.BackgroundContainerColorWhite)
                .frame(height: 80)
                .shadow(
                    color: elevation.color,
                    radius: elevation.blur / 2,
                    x: elevation.x,
                    y: elevation.y
                )
                .padding(.vertical, elevation.blur / 2 + 8)
        }
        .padding(.horizontal)
    }
}

#Preview {
    ZStack {
        TokensSemanticLight.BackgroundSurfaceColorGreige
            .ignoresSafeArea()
        
        VStack(spacing: 24) {
            ElevationDemo(name: "Below 1", elevation: TokensCoreLight.ElevationBelow1)
            ElevationDemo(name: "Below 2", elevation: TokensCoreLight.ElevationBelow2)
            ElevationDemo(name: "Below 3", elevation: TokensCoreLight.ElevationBelow3)
        }
        .padding()
    }
}
