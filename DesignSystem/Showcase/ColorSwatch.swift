import SwiftUI

/// A component that displays a color swatch with its name and RGB values
struct ColorSwatch: View {
    let name: String
    let color: Color
    let showBorder: Bool
    
    @Environment(\.colorScheme) var colorScheme
    
    init(name: String, color: Color, showBorder: Bool = false) {
        self.name = name
        self.color = color
        self.showBorder = showBorder
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // Color preview
            RoundedRectangle(cornerRadius: 8)
                .fill(color)
                .frame(height: 60)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .strokeBorder(Color.gray.opacity(0.3), lineWidth: showBorder ? 1 : 0)
                )
            
            // Color name
            Text(name)
                .font(.system(size: TokensCoreLight.FontSizeBodySm, weight: .medium))
                .foregroundStyle(
                    colorScheme == .dark
                        ? TokensSemanticDark.TextOnSurfaceColorPrimary
                        : TokensSemanticLight.TextOnSurfaceColorPrimary
                )
            
            // RGB values
            if let rgbString = colorToRGBString(color) {
                Text(rgbString)
                    .font(.system(size: TokensCoreLight.FontSizeBodyXs))
                    .foregroundStyle(
                        colorScheme == .dark
                            ? TokensSemanticDark.TextOnSurfaceColorSecondary
                            : TokensSemanticLight.TextOnSurfaceColorSecondary
                    )
                    .monospaced()
            }
        }
    }
    
    private func colorToRGBString(_ color: Color) -> String? {
        #if os(iOS)
        let uiColor = UIColor(color)
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        if alpha < 1.0 {
            return String(format: "R:%.0f G:%.0f B:%.0f A:%.2f", red * 255, green * 255, blue * 255, alpha)
        } else {
            return String(format: "R:%.0f G:%.0f B:%.0f", red * 255, green * 255, blue * 255)
        }
        #else
        return nil
        #endif
    }
}

#Preview {
    VStack(spacing: 16) {
        ColorSwatch(name: "Brand 300", color: TokensSemanticLight.Brand300)
        ColorSwatch(name: "White", color: TokensSemanticLight.NeutralsWhite, showBorder: true)
        ColorSwatch(name: "Transparent", color: TokensSemanticLight.NeutralsTransparent, showBorder: true)
    }
    .padding()
}
