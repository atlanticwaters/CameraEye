import SwiftUI

// MARK: - Typography Demo View
/// Comprehensive showcase of the THD typography system using custom fonts
/// and design system tokens.
///
/// This view demonstrates:
/// - Display font family (THD LgVar Beta) - for heroes and headers
/// - Informational font family (THD SmVar Beta) - for body text
/// - Complete type scale from Hero to Caption
/// - Line heights and spacing
/// - Practical usage examples

struct TypographyDemoView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing6) {
                
                // MARK: - Header
                Text("Typography")
                    .thdFont(.h1)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)
                
                Text("The THD App Design System uses two custom font families for a distinct, modern typographic voice.")
                    .thdFont(.bodyMd)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)
                
                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)
                
                // MARK: - Font Families
                fontFamiliesSection
                
                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)
                
                // MARK: - Display Font Scale (Heroes & Headings)
                displayFontSection
                
                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)
                
                // MARK: - Informational Font Scale (Body Text)
                informationalFontSection
                
                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)
                
                // MARK: - Line Heights
                lineHeightsSection
                
                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)
                
                // MARK: - Typography Hierarchy
                hierarchySection
                
                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)
                
                // MARK: - Practical Examples
                practicalExamplesSection
                
            }
            .padding(DesignSystemGlobal.Spacing4)
            .padding(.top, 60) // Extra padding for top navigation
            .padding(.bottom, 80) // Extra padding for bottom navigation
        }
    }
    
    // MARK: - Font Families Section
    
    private var fontFamiliesSection: some View {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing4) {
            Text("Font Families")
                .thdFont(.h3)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)
            
            VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                // Display Font
                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                    HStack {
                        Text("Display")
                            .thdFont(.h5)
                            .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)
                        
                        Spacer()
                        
                        Text("THD LgVar Beta")
                            .thdFont(.bodySm)
                            .foregroundColor(DesignSystemGlobal.TextOnContainerColorTertiary)
                            .padding(.horizontal, DesignSystemGlobal.Spacing2)
                            .padding(.vertical, DesignSystemGlobal.Spacing1)
                            .background(
                                RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusSm)
                                    .fill(DesignSystemGlobal.BackgroundContainerColorGreige)
                            )
                    }
                    
                    Text("Used for large, attention-grabbing text like heroes, headlines, and section headers. This font family brings personality and prominence to key messaging.")
                        .thdFont(.bodyMd)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)
                    
                    Text("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
                        .thdFont(.h4)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)
                    
                    Text("abcdefghijklmnopqrstuvwxyz")
                        .thdFont(.h4)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)
                    
                    Text("0123456789")
                        .thdFont(.h4)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)
                }
                .padding(DesignSystemGlobal.Spacing3)
                .background(
                    RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusXl)
                        .fill(DesignSystemGlobal.BackgroundContainerColorWhite)
                )
                
                // Informational Font
                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                    HStack {
                        Text("Informational")
                            .thdFont(.h5)
                            .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)
                        
                        Spacer()
                        
                        Text("THD SmVar Beta")
                            .thdFont(.bodySm)
                            .foregroundColor(DesignSystemGlobal.TextOnContainerColorTertiary)
                            .padding(.horizontal, DesignSystemGlobal.Spacing2)
                            .padding(.vertical, DesignSystemGlobal.Spacing1)
                            .background(
                                RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusSm)
                                    .fill(DesignSystemGlobal.BackgroundContainerColorGreige)
                            )
                    }
                    
                    Text("Used for body text, captions, and informational content. This font family prioritizes readability and clarity for extended reading.")
                        .thdFont(.bodyMd)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)
                    
                    Text("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
                        .thdFont(.bodyLg)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)
                    
                    Text("abcdefghijklmnopqrstuvwxyz")
                        .thdFont(.bodyLg)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)
                    
                    Text("0123456789")
                        .thdFont(.bodyLg)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)
                }
                .padding(DesignSystemGlobal.Spacing3)
                .background(
                    RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusXl)
                        .fill(DesignSystemGlobal.BackgroundContainerColorWhite)
                )
            }
        }
    }
    
    // MARK: - Display Font Section
    
    private var displayFontSection: some View {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing4) {
            VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing1) {
                Text("Display Font Scale")
                    .thdFont(.h3)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)
                
                Text("THD LgVar Beta - Heroes & Headings")
                    .thdFont(.bodyMd)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)
            }
            
            // Hero Sizes
            VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                Text("Hero Sizes")
                    .thdFont(.h6)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)
                
                typeSpecRow(
                    name: "Hero 1",
                    size: DesignSystemGlobal.FontFontSizeHero1,
                    fontStyle: .hero1,
                    usage: "Marketing hero banners"
                )
                
                typeSpecRow(
                    name: "Hero 2",
                    size: DesignSystemGlobal.FontFontSizeHero2,
                    fontStyle: .hero2,
                    usage: "Product spotlights"
                )
                
                typeSpecRow(
                    name: "Hero 3",
                    size: DesignSystemGlobal.FontFontSizeHero3,
                    fontStyle: .hero3,
                    usage: "Category headers"
                )
                
                typeSpecRow(
                    name: "Hero 4",
                    size: DesignSystemGlobal.FontFontSizeHero4,
                    fontStyle: .hero4,
                    usage: "Feature callouts"
                )
                
                typeSpecRow(
                    name: "Hero 5",
                    size: DesignSystemGlobal.FontFontSizeHero5,
                    fontStyle: .hero5,
                    usage: "Subsection emphasis"
                )
            }
            .padding(DesignSystemGlobal.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusXl)
                    .fill(DesignSystemGlobal.BackgroundContainerColorWhite)
            )
            
            // Heading Sizes
            VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                Text("Heading Sizes")
                    .thdFont(.h6)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)
                
                typeSpecRow(
                    name: "H1",
                    size: DesignSystemGlobal.FontFontSizeH1,
                    fontStyle: .h1,
                    usage: "Page titles"
                )
                
                typeSpecRow(
                    name: "H2",
                    size: DesignSystemGlobal.FontFontSizeH2,
                    fontStyle: .h2,
                    usage: "Section titles"
                )
                
                typeSpecRow(
                    name: "H3",
                    size: DesignSystemGlobal.FontFontSizeH3,
                    fontStyle: .h3,
                    usage: "Subsection titles"
                )
                
                typeSpecRow(
                    name: "H4",
                    size: DesignSystemGlobal.FontFontSizeH4,
                    fontStyle: .h4,
                    usage: "Card headers"
                )
                
                typeSpecRow(
                    name: "H5",
                    size: DesignSystemGlobal.FontFontSizeH5,
                    fontStyle: .h5,
                    usage: "List group headers"
                )
                
                typeSpecRow(
                    name: "H6",
                    size: DesignSystemGlobal.FontFontSizeH6,
                    fontStyle: .h6,
                    usage: "Component labels"
                )
            }
            .padding(DesignSystemGlobal.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusXl)
                    .fill(DesignSystemGlobal.BackgroundContainerColorWhite)
            )
        }
    }
    
    // MARK: - Informational Font Section
    
    private var informationalFontSection: some View {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing4) {
            VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing1) {
                Text("Informational Font Scale")
                    .thdFont(.h3)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)
                
                Text("THD SmVar Beta - Body Text & Captions")
                    .thdFont(.bodyMd)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)
            }
            
            VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                typeSpecRow(
                    name: "Body XL",
                    size: DesignSystemGlobal.FontFontSizeBodyXl,
                    fontStyle: .bodyXL,
                    usage: "Intro paragraphs, emphasized content"
                )
                
                typeSpecRow(
                    name: "Body LG",
                    size: DesignSystemGlobal.FontFontSizeBodyLg,
                    fontStyle: .bodyLg,
                    usage: "Feature descriptions"
                )
                
                typeSpecRow(
                    name: "Body MD",
                    size: DesignSystemGlobal.FontFontSizeBodyMd,
                    fontStyle: .bodyMd,
                    usage: "Standard body text (default)"
                )
                
                typeSpecRow(
                    name: "Body SM",
                    size: DesignSystemGlobal.FontFontSizeBodySm,
                    fontStyle: .bodySm,
                    usage: "Secondary text, labels"
                )
                
                typeSpecRow(
                    name: "Body XS",
                    size: DesignSystemGlobal.FontFontSizeBodyXs,
                    fontStyle: .bodyXs,
                    usage: "Tertiary text, metadata"
                )
                
                typeSpecRow(
                    name: "Caption",
                    size: DesignSystemGlobal.FontFontSizeCaption,
                    fontStyle: .caption,
                    usage: "Image captions, legal text"
                )
            }
            .padding(DesignSystemGlobal.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusXl)
                    .fill(DesignSystemGlobal.BackgroundContainerColorWhite)
            )
        }
    }
    
    // MARK: - Line Heights Section
    
    private var lineHeightsSection: some View {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing4) {
            VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing1) {
                Text("Line Heights")
                    .thdFont(.h3)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)
                
                Text("Consistent vertical rhythm for readable text blocks")
                    .thdFont(.bodyMd)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)
            }
            
            HStack(spacing: DesignSystemGlobal.Spacing3) {
                lineHeightCard(
                    name: "None",
                    multiplier: DesignSystemGlobal.FontLineHeightNone,
                    description: "1.0× (compact)"
                )
                
                lineHeightCard(
                    name: "Tight",
                    multiplier: DesignSystemGlobal.FontLineHeightTight,
                    description: "1.25× (headings)"
                )
                
                lineHeightCard(
                    name: "Base",
                    multiplier: DesignSystemGlobal.FontLineHeightBase,
                    description: "1.5× (body text)"
                )
            }
        }
    }
    
    // MARK: - Hierarchy Section
    
    private var hierarchySection: some View {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing4) {
            VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing1) {
                Text("Typography Hierarchy")
                    .thdFont(.h3)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)
                
                Text("Using scale and weight to establish visual hierarchy")
                    .thdFont(.bodyMd)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)
            }
            
            VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing4) {
                // Primary Content
                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                    Text("Genesis E-315 3-Burner Gas Grill")
                        .thdFont(.h2)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)
                    
                    Text("Liquid Propane | Black Finish")
                        .thdFont(.bodyLg)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)
                    
                    Text("Experience professional grilling results with 39,000 BTUs of cooking power across three stainless steel burners. The porcelain-enameled lid retains heat efficiently while the Flavorizer bars add that signature smoky taste.")
                        .thdFont(.bodyMd)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)
                        .lineSpacing(DesignSystemGlobal.FontFontSizeBodyMd * (DesignSystemGlobal.FontLineHeightBase - 1))
                    
                    HStack(spacing: DesignSystemGlobal.Spacing2) {
                        Text("SKU: 314615926")
                            .thdFont(.bodyXs)
                            .foregroundColor(DesignSystemGlobal.TextOnContainerColorTertiary)
                        
                        Text("•")
                            .thdFont(.bodyXs)
                            .foregroundColor(DesignSystemGlobal.TextOnContainerColorTertiary)
                        
                        Text("In Stock")
                            .thdFont(.bodyXs)
                            .foregroundColor(DesignSystemGlobal.TextOnContainerColorSuccess)
                    }
                }
                .padding(DesignSystemGlobal.Spacing3)
                .background(
                    RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusXl)
                        .fill(DesignSystemGlobal.BackgroundContainerColorWhite)
                )
            }
        }
    }
    
    // MARK: - Practical Examples Section
    
    private var practicalExamplesSection: some View {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing4) {
            VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing1) {
                Text("Practical Examples")
                    .thdFont(.h3)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)
                
                Text("Typography in context with real UI patterns")
                    .thdFont(.bodyMd)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)
            }
            
            // Product Card Example
            VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                Text("Product Card")
                    .thdFont(.h6)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)
                
                productCardExample
            }
            
            // Alert Example
            VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                Text("Alert Message")
                    .thdFont(.h6)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)
                
                alertExample
            }
            
            // Form Example
            VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                Text("Form Field")
                    .thdFont(.h6)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)
                
                formExample
            }
        }
    }
    
    // MARK: - Helper Views
    
    private func typeSpecRow(name: String, size: CGFloat, fontStyle: CustomFontModifier.TextStyle, usage: String) -> some View {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing1) {
            HStack(alignment: .top, spacing: DesignSystemGlobal.Spacing2) {
                Text("Aa")
                    .thdFont(fontStyle)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 2) {
                    Text(name)
                        .thdFont(.bodySm)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)
                    
                    Text("\(Int(size))pt")
                        .thdFont(.bodyXs)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorTertiary)
                }
            }
            
            Text(usage)
                .thdFont(.caption)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)
        }
        .padding(DesignSystemGlobal.Spacing2)
        .background(
            RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusLg)
                .fill(DesignSystemGlobal.BackgroundContainerColorGreige)
        )
    }
    
    private func lineHeightCard(name: String, multiplier: CGFloat, description: String) -> some View {
        VStack(spacing: DesignSystemGlobal.Spacing2) {
            Text("Aa\nBb\nCc")
                .thdFont(.bodyLg)
                .lineSpacing(DesignSystemGlobal.FontFontSizeBodyLg * (multiplier - 1))
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
            
            VStack(spacing: 4) {
                Text(name)
                    .thdFont(.bodySm)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)
                
                Text(description)
                    .thdFont(.caption)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorTertiary)
                    .multilineTextAlignment(.center)
            }
        }
        .padding(DesignSystemGlobal.Spacing3)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusXl)
                .fill(DesignSystemGlobal.BackgroundContainerColorWhite)
        )
    }
    
    private var productCardExample: some View {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
            Rectangle()
                .fill(DesignSystemGlobal.GreigeGreige200)
                .frame(height: 120)
                .cornerRadius(DesignSystemGlobal.BorderRadiusLg)
            
            Badge("Sale", variant: .filledStrong, color: .danger, size: .small)
            
            Text("Premium Outdoor Grill Cover")
                .thdFont(.h6)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)
            
            HStack(spacing: DesignSystemGlobal.Spacing1) {
                Image(systemName: "star.fill")
                    .font(.system(size: 12))
                    .foregroundColor(DesignSystemGlobal.LemonLemon500)
                Text("4.8")
                    .thdFont(.bodySm)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)
                Text("(247)")
                    .thdFont(.bodyXs)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorTertiary)
            }
            
            HStack(alignment: .firstTextBaseline, spacing: DesignSystemGlobal.Spacing1) {
                Text("$89.99")
                    .thdFont(.h5)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorAccent)
                
                Text("$129.99")
                    .thdFont(.bodySm)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorTertiary)
                    .strikethrough()
            }
            
            Text("Ships within 2-3 business days")
                .thdFont(.caption)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorSuccess)
        }
        .padding(DesignSystemGlobal.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusXl)
                .fill(DesignSystemGlobal.BackgroundContainerColorWhite)
        )
    }
    
    private var alertExample: some View {
        HStack(alignment: .top, spacing: DesignSystemGlobal.Spacing2) {
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 20))
                .foregroundColor(DesignSystemGlobal.IconOnContainerColorSuccess)
            
            VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing1) {
                Text("Order Confirmed")
                    .thdFont(.h6)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)
                
                Text("Your order #12345 has been placed successfully. You'll receive a confirmation email shortly.")
                    .thdFont(.bodySm)
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)
                    .lineSpacing(DesignSystemGlobal.FontFontSizeBodySm * (DesignSystemGlobal.FontLineHeightBase - 1))
            }
            
            Spacer()
        }
        .padding(DesignSystemGlobal.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusXl)
                .fill(DesignSystemGlobal.BackgroundFeedbackColorSuccessAccent1)
        )
    }
    
    private var formExample: some View {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing1) {
            Text("Email Address")
                .thdFont(.bodySm)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)
            
            RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusLg)
                .stroke(DesignSystemGlobal.BorderInputColorDefault, lineWidth: 1)
                .frame(height: 44)
                .overlay(
                    HStack {
                        Text("john.doe@example.com")
                            .thdFont(.bodyMd)
                            .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)
                        Spacer()
                    }
                    .padding(.horizontal, DesignSystemGlobal.Spacing3)
                )
            
            Text("We'll never share your email with anyone else.")
                .thdFont(.caption)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorTertiary)
        }
        .padding(DesignSystemGlobal.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusXl)
                .fill(DesignSystemGlobal.BackgroundContainerColorWhite)
        )
    }
}

// MARK: - Preview

#Preview("Typography Demo") {
    NavigationStack {
        TypographyDemoView()
    }
}
