import SwiftUI

/// A component that displays a typography sample with font details
struct TypographySample: View {
    let name: String
    let fontSize: CGFloat
    let fontFamily: String?
    let sampleText: String
    
    init(name: String, fontSize: CGFloat, fontFamily: String? = nil, sampleText: String = "The quick brown fox jumps") {
        self.name = name
        self.fontSize = fontSize
        self.fontFamily = fontFamily
        self.sampleText = sampleText
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Typography details
            VStack(alignment: .leading, spacing: 4) {
                Text(name)
                    .font(.system(size: TokensCoreLight.FontSizeBodySm, weight: .semibold))
                    .foregroundColor(TokensSemanticLight.TextOnSurfaceColorPrimary)
                
                HStack(spacing: 12) {
                    Text("\(Int(fontSize))pt")
                        .font(.system(size: TokensCoreLight.FontSizeBodyXs))
                        .foregroundColor(TokensSemanticLight.TextOnSurfaceColorSecondary)
                    
                    if let fontFamily = fontFamily {
                        Text(fontFamily)
                            .font(.system(size: TokensCoreLight.FontSizeBodyXs))
                            .foregroundColor(TokensSemanticLight.TextOnSurfaceColorTertiary)
                    }
                }
            }
            
            // Sample text
            Text(sampleText)
                .font(.custom(fontFamily ?? "", size: fontSize))
                .foregroundColor(TokensSemanticLight.TextOnSurfaceColorPrimary)
            
            Divider()
        }
    }
}

#Preview {
    VStack(spacing: 20) {
        TypographySample(
            name: "Body XL",
            fontSize: TokensCoreLight.FontSizeBodyXl,
            fontFamily: TokensCoreLight.FontFamilyInformational
        )
        TypographySample(
            name: "Body MD",
            fontSize: TokensCoreLight.FontSizeBodyMd,
            fontFamily: TokensCoreLight.FontFamilyInformational
        )
        TypographySample(
            name: "Body XS",
            fontSize: TokensCoreLight.FontSizeBodyXs,
            fontFamily: TokensCoreLight.FontFamilyInformational
        )
    }
    .padding()
}
