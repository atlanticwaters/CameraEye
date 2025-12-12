import UIKit
import SwiftUI

// MARK: - Typography Demo View
/// Comprehensive showcase of the THD typography system using custom fonts
/// and design system tokens.
///
/// Demonstrates:
/// - Display font family (THD LgVar Beta) - for heroes and headers
/// - Informational font family (THD SmVar Beta) - for body text
/// - Complete type scale from Hero to Caption
/// - Line heights and spacing
/// - Practical usage examples

struct TypographyDemoView: View {
    @Environment(\.colorScheme) var colorScheme
    
    // MARK: - Font Verification State
    @State private var fontVerificationResults: [String: Bool] = [:]
    @State private var showFontDebugInfo = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing6) {
                
                // MARK: - Header Card
                VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                    Text("Typography")
                        .thdFont(.hero5)
                        .foregroundColor(textPrimary)

                    Text("The THD App Design System uses two custom font families for a distinct, modern typographic voice.")
                        .thdFont(.bodyMd)
                        .foregroundColor(textSecondary)
                }
                .padding(TokensSpacing.Spacing4)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: borderRadiusXl)
                        .fill(containerWhite)
                )
                
                // MARK: - Font Verification Section (Debug)
                if showFontDebugInfo {
                    fontVerificationSection
                }
                
                // MARK: - Content Card
                VStack(alignment: .leading, spacing: TokensSpacing.Spacing6) {
                    // Font Families
                    fontFamiliesSection
                    
                    Divider().padding(.vertical, TokensSpacing.Spacing2)
                    
                    // Display Font Scale
                    displayFontSection
                    
                    Divider().padding(.vertical, TokensSpacing.Spacing2)
                    
                    // Informational Font Scale
                    informationalFontSection
                    
                    Divider().padding(.vertical, TokensSpacing.Spacing2)
                    
                    // Line Heights
                    lineHeightsSection
                    
                    Divider().padding(.vertical, TokensSpacing.Spacing2)
                    
                    // Typography Hierarchy
                    hierarchySection
                    
                    Divider().padding(.vertical, TokensSpacing.Spacing2)
                    
                    // Practical Examples
                    practicalExamplesSection
                }
                .padding(TokensSpacing.Spacing4)
                .background(
                    RoundedRectangle(cornerRadius: borderRadiusXl)
                        .fill(containerWhite)
                )
            }
            .padding(TokensSpacing.Spacing4)
            .padding(.top, 60) // Extra padding for top navigation
            .padding(.bottom, 80) // Extra padding for bottom navigation
        }
        .background(surfaceGreige)
        .applySoftScrollEdges()
        .onAppear {
            verifyCustomFonts()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(showFontDebugInfo ? "Hide Debug" : "Show Debug") {
                    showFontDebugInfo.toggle()
                }
                .thdFont(.caption)
            }
        }
    }
    
    // MARK: - Font Families Section
    
    private var fontFamiliesSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader("Font Families", description: "Two custom font families for hierarchy")
            
            // Display Font
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                HStack {
                    Text("Display")
                        .thdFont(.h5)
                        .foregroundColor(textPrimary)
                    
                    Spacer()
                    
                    Text("THD LgVar Beta")
                        .thdFont(.bodySm)
                        .foregroundColor(textTertiary)
                        .padding(.horizontal, TokensSpacing.Spacing2)
                        .padding(.vertical, TokensSpacing.Spacing1)
                        .background(
                            RoundedRectangle(cornerRadius: borderRadiusSm)
                                .fill(containerGreige)
                        )
                }
                
                Text("Used for large, attention-grabbing text like heroes, headlines, and section headers.")
                    .thdFont(.bodyMd)
                    .foregroundColor(textSecondary)
                
                Text("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
                    .thdFont(.h4)
                    .foregroundColor(textPrimary)
                
                Text("abcdefghijklmnopqrstuvwxyz")
                    .thdFont(.h4)
                    .foregroundColor(textPrimary)
                
                Text("0123456789")
                    .thdFont(.h4)
                    .foregroundColor(textPrimary)
            }
            .padding(TokensSpacing.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(containerWhite)
            )
            
            // Informational Font
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                HStack {
                    Text("Informational")
                        .thdFont(.h5)
                        .foregroundColor(textPrimary)
                    
                    Spacer()
                    
                    Text("THD SmVar Beta")
                        .thdFont(.bodySm)
                        .foregroundColor(textTertiary)
                        .padding(.horizontal, TokensSpacing.Spacing2)
                        .padding(.vertical, TokensSpacing.Spacing1)
                        .background(
                            RoundedRectangle(cornerRadius: borderRadiusSm)
                                .fill(containerGreige)
                        )
                }
                
                Text("Used for body copy, descriptions, labels, and supporting text. Optimized for readability.")
                    .thdFont(.bodyMd)
                    .foregroundColor(textSecondary)
                
                Text("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
                    .thdFont(.bodyLg)
                    .foregroundColor(textPrimary)
                
                Text("abcdefghijklmnopqrstuvwxyz")
                    .thdFont(.bodyLg)
                    .foregroundColor(textPrimary)
                
                Text("0123456789")
                    .thdFont(.bodyLg)
                    .foregroundColor(textPrimary)
            }
            .padding(TokensSpacing.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(containerWhite)
            )
        }
    }
    
    // MARK: - Display Font Section
    
    private var displayFontSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader("Display Font Scale", description: "Heroes and headings (THD LgVar Beta)")
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                typographyExample("Hero 1", style: .hero1, size: 64)
                typographyExample("Hero 2", style: .hero2, size: 56)
                typographyExample("Hero 3", style: .hero3, size: 48)
                typographyExample("Hero 4", style: .hero4, size: 40)
                typographyExample("Hero 5", style: .hero5, size: 36)
                typographyExample("Heading 1", style: .h1, size: 32)
                typographyExample("Heading 2", style: .h2, size: 28)
                typographyExample("Heading 3", style: .h3, size: 24)
                typographyExample("Heading 4", style: .h4, size: 20)
                typographyExample("Heading 5", style: .h5, size: 18)
                typographyExample("Heading 6", style: .h6, size: 16)
            }
        }
    }
    
    // MARK: - Informational Font Section
    
    private var informationalFontSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader("Informational Font Scale", description: "Body text and labels (THD SmVar Beta)")
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                typographyExample("Body XL", style: .bodyXl, size: 20)
                typographyExample("Body Large", style: .bodyLg, size: 18)
                typographyExample("Body Medium", style: .bodyMd, size: 16)
                typographyExample("Body Small", style: .bodySm, size: 14)
                typographyExample("Body XS", style: .bodyXs, size: 12)
                typographyExample("Caption", style: .caption, size: 11)
            }
        }
    }
    
    // MARK: - Line Heights Section
    
    private var lineHeightsSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader("Line Heights", description: "Line spacing options for different contexts")
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                lineHeightExample("None (1.0x)", lineHeight: 1.0)
                lineHeightExample("Tight (1.25x)", lineHeight: 1.25)
                lineHeightExample("Base (1.5x)", lineHeight: 1.5)
            }
        }
    }
    
    // MARK: - Hierarchy Section
    
    private var hierarchySection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader("Typography Hierarchy", description: "Real-world hierarchy example")
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
                Text("Milwaukee M18 FUEL Drill")
                    .thdFont(.h3)
                    .foregroundColor(textPrimary)
                
                Text("18V Lithium-Ion Brushless Cordless 1/2 in. Hammer Drill")
                    .thdFont(.h5)
                    .foregroundColor(textSecondary)
                
                Text("$199.00")
                    .thdFont(.h4)
                    .foregroundColor(textPrimary)
                
                Text("Description")
                    .thdFont(.h6)
                    .foregroundColor(textPrimary)
                
                Text("The M18 FUEL 1/2\" Hammer Drill delivers the most power in its class while maintaining the size and weight of a compact drill. Powered by a Milwaukee-built brushless motor, the drill produces 1,200 in-lbs of torque and up to 2,000 RPM.")
                    .thdFont(.bodyMd)
                    .foregroundColor(textSecondary)
                    .lineSpacing(1.5)
                
                Text("Specifications")
                    .thdFont(.h6)
                    .foregroundColor(textPrimary)
                
                VStack(alignment: .leading, spacing: TokensSpacing.Spacing1) {
                    Text("• Battery: 18V Lithium-Ion")
                        .thdFont(.bodySm)
                        .foregroundColor(textSecondary)
                    Text("• Chuck Size: 1/2 inch")
                        .thdFont(.bodySm)
                        .foregroundColor(textSecondary)
                    Text("• Weight: 4.6 lbs")
                        .thdFont(.bodySm)
                        .foregroundColor(textSecondary)
                }
                
                Text("* Battery and charger sold separately")
                    .thdFont(.caption)
                    .foregroundColor(textTertiary)
            }
            .padding(TokensSpacing.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(containerWhite)
            )
        }
    }
    
    // MARK: - Practical Examples Section
    
    private var practicalExamplesSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader("Practical Examples", description: "Typography in real components")
            
            Text("Product Card")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
            
            productCardExample
            
            Text("Alert Message")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
            
            alertExample
            
            Text("Form Fields")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
            
            formExample
        }
    }
    
    // MARK: - Helper Views
    
    private func sectionHeader(_ title: String, description: String) -> some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing1) {
            Text(title)
                .thdFont(.h3)
                .foregroundColor(textPrimary)

            Text(description)
                .thdFont(.caption)
                .foregroundColor(textTertiary)
        }
    }
    
    private func typographyExample(_ text: String, style: THDTypographyStyle, size: CGFloat) -> some View {
        HStack(alignment: .top) {
            Text(text)
                .thdFont(style)
                .foregroundColor(textPrimary)
            
            Spacer()
            
            Text("\(Int(size))pt")
                .thdFont(.caption)
                .foregroundColor(textTertiary)
        }
        .padding(TokensSpacing.Spacing2)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusSm)
                .fill(containerGreige)
        )
    }
    
    private func lineHeightExample(_ title: String, lineHeight: CGFloat) -> some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            Text(title)
                .thdFont(.bodySm)
                .foregroundColor(textTertiary)
            
            Text("The quick brown fox jumps over the lazy dog. This sentence demonstrates the line height spacing between multiple lines of text.")
                .thdFont(.bodyMd)
                .lineSpacing(lineHeight)
                .foregroundColor(textPrimary)
        }
        .padding(TokensSpacing.Spacing2)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusSm)
                .fill(containerGreige)
        )
    }
    
    private var productCardExample: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .frame(height: 120)
                .cornerRadius(borderRadiusLg)
            
            Text("Milwaukee M18 Drill")
                .thdFont(.h5)
                .foregroundColor(textPrimary)
            
            Text("18V Brushless Cordless")
                .thdFont(.bodySm)
                .foregroundColor(textSecondary)
            
            HStack {
                Text("$199.00")
                    .thdFont(.h6)
                    .foregroundColor(textPrimary)
                
                Spacer()
                
                Badge("New", variant: .filledStrong, color: .brand, size: .small)
            }
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerWhite)
        )
    }
    
    private var alertExample: some View {
        HStack(spacing: TokensSpacing.Spacing2) {
            Image(systemName: "checkmark.circle")
                .foregroundColor(tokens.IconOnSurfaceColorSuccess)
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing1) {
                Text("Item Added")
                    .thdFont(.h6)
                    .foregroundColor(textPrimary)
                
                Text("Milwaukee M18 Drill has been added to your cart.")
                    .thdFont(.bodySm)
                    .foregroundColor(textSecondary)
            }
            
            Spacer()
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(tokens.BackgroundFeedbackColorSuccessAccent1)
        )
    }
    
    private var formExample: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing1) {
                Text("Email Address")
                    .thdFont(.bodySm)
                    .foregroundColor(textPrimary)
                
                Text("john.doe@example.com")
                    .thdFont(.bodyMd)
                    .foregroundColor(textSecondary)
                    .padding(TokensSpacing.Spacing2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(
                        RoundedRectangle(cornerRadius: borderRadiusSm)
                            .stroke(tokens.BorderInputColorDefault, lineWidth: 1)
                    )
                
                Text("We'll never share your email with anyone else.")
                    .thdFont(.caption)
                    .foregroundColor(textTertiary)
            }
        }
        .padding(TokensSpacing.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }
    
    // MARK: - Font Verification Section
    
    private var fontVerificationSection: some View {
        VStack(alignment: .leading, spacing: TokensSpacing.Spacing3) {
            sectionHeader("Font Verification", description: "Debug information about loaded fonts")
            
            VStack(alignment: .leading, spacing: TokensSpacing.Spacing2) {
                ForEach(Array(fontVerificationResults.keys.sorted()), id: \.self) { fontName in
                    HStack {
                        Image(systemName: fontVerificationResults[fontName] == true ? "checkmark.circle.fill" : "xmark.circle.fill")
                            .foregroundColor(fontVerificationResults[fontName] == true ? .green : .red)
                        
                        Text(fontName)
                            .thdFont(.caption)
                            .foregroundColor(textSecondary)
                        
                        Spacer()
                    }
                }
            }
            .padding(TokensSpacing.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(containerGreige)
            )
        }
        .padding(TokensSpacing.Spacing4)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusXl)
                .fill(containerWhite)
        )
    }
    
    // MARK: - Font Verification Logic
    
    private func verifyCustomFonts() {
        let fontsToCheck = [
            "THD LgVar Beta",
            "THD SmVar Beta"
        ]
        
        for fontName in fontsToCheck {
            let font = UIFont(name: fontName, size: 12)
            fontVerificationResults[fontName] = (font != nil)
        }
    }
    
    // MARK: - Theme-Aware Colors
    
    private var textPrimary: Color {
        tokens.TextOnContainerColorPrimary
    }
    
    private var textSecondary: Color {
        tokens.TextOnContainerColorSecondary
    }
    
    private var textTertiary: Color {
        tokens.TextOnContainerColorTertiary
    }
    
    private var containerWhite: Color {
        tokens.BackgroundContainerColorWhite
    }
    
    private var containerGreige: Color {
        tokens.BackgroundContainerColorGreige
    }
    
    private var surfaceGreige: Color {
        tokens.BackgroundSurfaceColorGreige
    }
    
    private var borderRadiusSm: CGFloat {
        tokens.BorderRadiusSm
    }
    
    private var borderRadiusLg: CGFloat {
        tokens.BorderRadiusLg
    }
    
    private var borderRadiusXl: CGFloat {
        tokens.BorderRadiusXl
    }
    
    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }
}

// MARK: - Token Protocol Helper
private protocol TokenSemanticProtocol {
    static var TextOnContainerColorPrimary: Color { get }
    static var TextOnContainerColorSecondary: Color { get }
    static var TextOnContainerColorTertiary: Color { get }
    static var BackgroundContainerColorWhite: Color { get }
    static var BackgroundContainerColorGreige: Color { get }
    static var BackgroundSurfaceColorGreige: Color { get }
    static var BackgroundFeedbackColorSuccessAccent1: Color { get }
    static var BorderRadiusSm: CGFloat { get }
    static var BorderRadiusLg: CGFloat { get }
    static var BorderRadiusXl: CGFloat { get }
    static var BorderInputColorDefault: Color { get }
    static var IconOnSurfaceColorSuccess: Color { get }
}

extension TokensSemanticLight: TokenSemanticProtocol {}
extension TokensSemanticDark: TokenSemanticProtocol {}

// MARK: - Preview
#Preview {
    TypographyDemoView()
}
