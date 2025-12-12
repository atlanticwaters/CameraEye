import SwiftUI

/// A component that visualizes spacing/padding values
struct SpacingDemo: View {
    let name: String
    let value: CGFloat
    let orientation: Orientation
    
    enum Orientation {
        case horizontal
        case vertical
    }
    
    init(name: String, value: CGFloat, orientation: Orientation = .horizontal) {
        self.name = name
        self.value = value
        self.orientation = orientation
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Name and value
            HStack {
                Text(name)
                    .font(.system(size: TokensCoreLight.FontSizeBodySm, weight: .medium))
                    .foregroundColor(TokensSemanticLight.TextOnSurfaceColorPrimary)
                
                Spacer()
                
                Text("\(Int(value))pt")
                    .font(.system(size: TokensCoreLight.FontSizeBodyXs, weight: .semibold))
                    .foregroundColor(TokensSemanticLight.TextOnSurfaceColorSecondary)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(TokensSemanticLight.BackgroundContainerColorGreige)
                    .cornerRadius(4)
            }
            
            // Visual representation
            if orientation == .horizontal {
                HStack(spacing: 0) {
                    Rectangle()
                        .fill(TokensSemanticLight.Brand300)
                        .frame(width: 40, height: 40)
                    
                    Rectangle()
                        .fill(TokensSemanticLight.Brand300.opacity(0.3))
                        .frame(width: value, height: 40)
                    
                    Rectangle()
                        .fill(TokensSemanticLight.Brand300)
                        .frame(width: 40, height: 40)
                }
            } else {
                VStack(spacing: 0) {
                    Rectangle()
                        .fill(TokensSemanticLight.Brand300)
                        .frame(width: 40, height: 40)
                    
                    Rectangle()
                        .fill(TokensSemanticLight.Brand300.opacity(0.3))
                        .frame(width: 40, height: value)
                    
                    Rectangle()
                        .fill(TokensSemanticLight.Brand300)
                        .frame(width: 40, height: 40)
                }
            }
        }
    }
}

#Preview {
    VStack(spacing: 24) {
        SpacingDemo(name: "Border 5", value: TokensSemanticLight.Border5)
        SpacingDemo(name: "Border 8", value: TokensSemanticLight.Border8)
        SpacingDemo(name: "Border 12", value: TokensSemanticLight.Border12)
    }
    .padding()
}
