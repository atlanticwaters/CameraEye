import SwiftUI
import UIKit

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

    // MARK: - Font Verification State
    @State private var fontVerificationResults: [String: Bool] = [:]
    @State private var showFontDebugInfo = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing6) {

                // MARK: - Header Card
                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                    Text("Typography")
                        .thdFont(.hero5)
                        .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)

                    Text(
                        "The THD App Design System uses two custom font families for a distinct, modern typographic voice."
                    )
                    .thdFont(.bodyMd)
                    .foregroundStyle(DesignSystemGlobal.TextOnContainerColorSecondary)
                }
                .padding(DesignSystemGlobal.Spacing4)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusXl)
                        .fill(DesignSystemGlobal.BackgroundContainerColorWhite)
                )

                // MARK: - Font Verification Section (Debug)
                if showFontDebugInfo {
                    fontVerificationSection
                    Divider().padding(.vertical, DesignSystemGlobal.Spacing2)
                }

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
            .padding(.top, 96)  // Extra padding for top navigation
            .padding(.bottom, 80)  // Extra padding for bottom navigation
        }
        .background(DesignSystemGlobal.BackgroundSurfaceColorGreige)
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
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
            Text("Font Families")
                .thdFont(.h3)
                .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)

            VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                // Display Font
                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                    HStack {
                        Text("Display")
                            .thdFont(.h5)
                            .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)

                        Spacer()

                        Text("THD LgVar Beta")
                            .thdFont(.bodySm)
                            .foregroundStyle(DesignSystemGlobal.TextOnContainerColorTertiary)
                            .padding(.horizontal, DesignSystemGlobal.Spacing2)
                            .padding(.vertical, DesignSystemGlobal.Spacing1)
                            .background(
                                RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusSm)
                                    .fill(DesignSystemGlobal.BackgroundContainerColorGreige)
                            )
                    }

                    Text(
                        "Used for large, attention-grabbing text like heroes, headlines, and section headers. This font family brings personality and prominence to key messaging."
                    )
                    .thdFont(.bodyMd)
                    .foregroundStyle(DesignSystemGlobal.TextOnContainerColorSecondary)
                    Spacer()
                    Text("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
                        .thdFont(.h4)
                        .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)

                    Text("abcdefghijklmnopqrstuvwxyz")
                        .thdFont(.h4)
                        .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)

                    Text("0123456789")
                        .thdFont(.h4)
                        .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)
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
                            .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)

                        Spacer()

                        Text("THD SmVar Beta")
                            .thdFont(.bodySm)
                            .foregroundStyle(DesignSystemGlobal.TextOnContainerColorTertiary)
                            .padding(.horizontal, DesignSystemGlobal.Spacing2)
                            .padding(.vertical, DesignSystemGlobal.Spacing1)
                            .background(
                                RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusSm)
                                    .fill(DesignSystemGlobal.BackgroundContainerColorGreige)
                            )
                    }

                    Text(
                        "Used for body text, captions, and informational content. This font family prioritizes readability and clarity for extended reading."
                    )
                    .thdFont(.bodyMd)
                    .foregroundStyle(DesignSystemGlobal.TextOnContainerColorSecondary)
                    Spacer()
                    Text("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
                        .thdFont(.bodyLg)
                        .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)

                    Text("abcdefghijklmnopqrstuvwxyz")
                        .thdFont(.bodyLg)
                        .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)

                    Text("0123456789")
                        .thdFont(.bodyLg)
                        .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)
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
                    .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)

                Text("THD LgVar Beta - Heroes & Headings")
                    .thdFont(.bodyMd)
                    .foregroundStyle(DesignSystemGlobal.TextOnContainerColorSecondary)
            }

            // Hero Sizes
            VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                Text("Hero Sizes")
                    .thdFont(.h6)
                    .foregroundStyle(DesignSystemGlobal.TextOnContainerColorSecondary)

                typeSpecRow(
                    name: "Hero 1",
                    size: DesignSystemGlobal.FontSizeHero1,
                    fontStyle: .hero1,
                    usage: "Marketing hero banners"
                )

                typeSpecRow(
                    name: "Hero 2",
                    size: DesignSystemGlobal.FontSizeHero2,
                    fontStyle: .hero2,
                    usage: "Product spotlights"
                )

                typeSpecRow(
                    name: "Hero 3",
                    size: DesignSystemGlobal.FontSizeHero3,
                    fontStyle: .hero3,
                    usage: "Category headers"
                )

                typeSpecRow(
                    name: "Hero 4",
                    size: DesignSystemGlobal.FontSizeHero4,
                    fontStyle: .hero4,
                    usage: "Feature callouts"
                )

                typeSpecRow(
                    name: "Hero 5",
                    size: DesignSystemGlobal.FontSizeHero5,
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
                    .foregroundStyle(DesignSystemGlobal.TextOnContainerColorSecondary)

                typeSpecRow(
                    name: "H1",
                    size: DesignSystemGlobal.FontSizeH1,
                    fontStyle: .h1,
                    usage: "Page titles"
                )

                typeSpecRow(
                    name: "H2",
                    size: DesignSystemGlobal.FontSizeH2,
                    fontStyle: .h2,
                    usage: "Section titles"
                )

                typeSpecRow(
                    name: "H3",
                    size: DesignSystemGlobal.FontSizeH3,
                    fontStyle: .h3,
                    usage: "Subsection titles"
                )

                typeSpecRow(
                    name: "H4",
                    size: DesignSystemGlobal.FontSizeH4,
                    fontStyle: .h4,
                    usage: "Card headers"
                )

                typeSpecRow(
                    name: "H5",
                    size: DesignSystemGlobal.FontSizeH5,
                    fontStyle: .h5,
                    usage: "List group headers"
                )

                typeSpecRow(
                    name: "H6",
                    size: DesignSystemGlobal.FontSizeH6,
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
                    .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)

                Text("THD SmVar Beta - Body Text & Captions")
                    .thdFont(.bodyMd)
                    .foregroundStyle(DesignSystemGlobal.TextOnContainerColorSecondary)
            }

            VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                typeSpecRow(
                    name: "Body XL",
                    size: DesignSystemGlobal.FontSizeBodyXl,
                    fontStyle: .bodyXL,
                    usage: "Intro paragraphs, emphasized content"
                )

                typeSpecRow(
                    name: "Body LG",
                    size: DesignSystemGlobal.FontSizeBodyLg,
                    fontStyle: .bodyLg,
                    usage: "Feature descriptions"
                )

                typeSpecRow(
                    name: "Body MD",
                    size: DesignSystemGlobal.FontSizeBodyMd,
                    fontStyle: .bodyMd,
                    usage: "Standard body text (default)"
                )

                typeSpecRow(
                    name: "Body SM",
                    size: DesignSystemGlobal.FontSizeBodySm,
                    fontStyle: .bodySm,
                    usage: "Secondary text, labels"
                )

                typeSpecRow(
                    name: "Body XS",
                    size: DesignSystemGlobal.FontSizeBodyXs,
                    fontStyle: .bodyXs,
                    usage: "Tertiary text, metadata"
                )

                typeSpecRow(
                    name: "Caption",
                    size: DesignSystemGlobal.FontSizeCaption,
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
                    .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)

                Text("Consistent vertical rhythm for readable text blocks")
                    .thdFont(.bodyMd)
                    .foregroundStyle(DesignSystemGlobal.TextOnContainerColorSecondary)
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
                    .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)

                Text("Using scale and weight to establish visual hierarchy")
                    .thdFont(.bodyMd)
                    .foregroundStyle(DesignSystemGlobal.TextOnContainerColorSecondary)
            }

            VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing4) {
                // Primary Content
                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                    Text("Genesis E-315 3-Burner Gas Grill")
                        .thdFont(.h2)
                        .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)

                    Text("Liquid Propane | Black Finish")
                        .thdFont(.bodyLg)
                        .foregroundStyle(DesignSystemGlobal.TextOnContainerColorSecondary)

                    Text(
                        "Experience professional grilling results with 39,000 BTUs of cooking power across three stainless steel burners. The porcelain-enameled lid retains heat efficiently while the Flavorizer bars add that signature smoky taste."
                    )
                    .thdFont(.bodyMd)
                    .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)
                    .lineSpacing(
                        DesignSystemGlobal.FontSizeBodyMd
                            * (DesignSystemGlobal.FontLineHeightBase - 1))

                    HStack(spacing: DesignSystemGlobal.Spacing2) {
                        Text("SKU: 314615926")
                            .thdFont(.bodyXs)
                            .foregroundStyle(DesignSystemGlobal.TextOnContainerColorTertiary)

                        Text("•")
                            .thdFont(.bodyXs)
                            .foregroundStyle(DesignSystemGlobal.TextOnContainerColorTertiary)

                        Text("In Stock")
                            .thdFont(.bodyXs)
                            .foregroundStyle(DesignSystemGlobal.TextOnSurfaceColorSuccess)
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
                    .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)

                Text("Typography in context with real UI patterns")
                    .thdFont(.bodyMd)
                    .foregroundStyle(DesignSystemGlobal.TextOnContainerColorSecondary)
            }

            // Product Card Example
            VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                Text("Product Card")
                    .thdFont(.h6)
                    .foregroundStyle(DesignSystemGlobal.TextOnContainerColorSecondary)

                productCardExample
            }

            // Alert Example
            VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                Text("Alert Message")
                    .thdFont(.h6)
                    .foregroundStyle(DesignSystemGlobal.TextOnContainerColorSecondary)

                alertExample
            }

            // Form Example
            VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                Text("Form Field")
                    .thdFont(.h6)
                    .foregroundStyle(DesignSystemGlobal.TextOnContainerColorSecondary)

                formExample
            }
        }
    }

    // MARK: - Helper Views

    private func typeSpecRow(
        name: String, size: CGFloat, fontStyle: CustomFontModifier.TextStyle, usage: String
    ) -> some View {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing1) {
            HStack(alignment: .top, spacing: DesignSystemGlobal.Spacing2) {
                Text("Aa")
                    .thdFont(fontStyle)
                    .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)

                Spacer()

                VStack(alignment: .trailing, spacing: 2) {
                    Text(name)
                        .thdFont(.bodySm)
                        .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)

                    Text("\(Int(size))pt")
                        .thdFont(.bodyXs)
                        .foregroundStyle(DesignSystemGlobal.TextOnContainerColorTertiary)
                }
            }

            Text(usage)
                .thdFont(.caption)
                .foregroundStyle(DesignSystemGlobal.TextOnContainerColorSecondary)
        }
        .padding(DesignSystemGlobal.Spacing2)
        .background(
            RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusLg)
                .fill(DesignSystemGlobal.BackgroundContainerColorGreige)
        )
    }

    private func lineHeightCard(name: String, multiplier: CGFloat, description: String) -> some View
    {
        VStack(spacing: DesignSystemGlobal.Spacing2) {
            Text("Aa\nBb\nCc")
                .thdFont(.bodyLg)
                .lineSpacing(DesignSystemGlobal.FontSizeBodyLg * (multiplier - 1))
                .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)

            VStack(spacing: 4) {
                Text(name)
                    .thdFont(.bodySm)
                    .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)

                Text(description)
                    .thdFont(.caption)
                    .foregroundStyle(DesignSystemGlobal.TextOnContainerColorTertiary)
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
                .fill(DesignSystemGlobal.Greige200)
                .frame(height: 120)
                .cornerRadius(DesignSystemGlobal.BorderRadiusLg)

            DSBadge("Sale", size: .small, variant: .filledStrong, color: .danger)

            Text("Premium Outdoor Grill Cover")
                .thdFont(.h6)
                .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)

            HStack(spacing: DesignSystemGlobal.Spacing1) {
                Image(systemName: "star.fill")
                    .font(.system(size: 12))
                    .foregroundStyle(DesignSystemGlobal.Lemon500)
                Text("4.8")
                    .thdFont(.bodySm)
                    .foregroundStyle(DesignSystemGlobal.TextOnContainerColorSecondary)
                Text("(247)")
                    .thdFont(.bodyXs)
                    .foregroundStyle(DesignSystemGlobal.TextOnContainerColorTertiary)
            }

            HStack(alignment: .firstTextBaseline, spacing: DesignSystemGlobal.Spacing1) {
                Text("$89.99")
                    .thdFont(.h5)
                    .foregroundStyle(DesignSystemGlobal.TextOnContainerColorAccent)

                Text("$129.99")
                    .thdFont(.bodySm)
                    .foregroundStyle(DesignSystemGlobal.TextOnContainerColorTertiary)
                    .strikethrough()
            }

            Text("Ships within 2-3 business days")
                .thdFont(.caption)
                .foregroundStyle(DesignSystemGlobal.TextOnSurfaceColorSuccess)
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
                .foregroundStyle(DesignSystemGlobal.IconOnContainerColorSuccess)

            VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing1) {
                Text("Order Confirmed")
                    .thdFont(.h6)
                    .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)

                Text(
                    "Your order #12345 has been placed successfully. You'll receive a confirmation email shortly."
                )
                .thdFont(.bodySm)
                .foregroundStyle(DesignSystemGlobal.TextOnContainerColorSecondary)
                .lineSpacing(
                    DesignSystemGlobal.FontSizeBodySm * (DesignSystemGlobal.FontLineHeightBase - 1))
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
                .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)

            RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusLg)
                .stroke(DesignSystemGlobal.BorderInputColorDefault, lineWidth: 1)
                .frame(height: 44)
                .overlay(
                    HStack {
                        Text("john.doe@example.com")
                            .thdFont(.bodyMd)
                            .foregroundStyle(DesignSystemGlobal.TextOnContainerColorSecondary)
                        Spacer()
                    }
                    .padding(.horizontal, DesignSystemGlobal.Spacing3)
                )

            Text("We'll never share your email with anyone else.")
                .thdFont(.caption)
                .foregroundStyle(DesignSystemGlobal.TextOnContainerColorTertiary)
        }
        .padding(DesignSystemGlobal.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusXl)
                .fill(DesignSystemGlobal.BackgroundContainerColorWhite)
        )
    }

    // MARK: - Font Verification Section

    private var fontVerificationSection: some View {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing4) {
            fontVerificationHeader
            fontVerificationContent
        }
    }

    private var fontVerificationHeader: some View {
        Text("Font Loading Status (Debug)")
            .thdFont(.h5)
            .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)
    }

    private var fontVerificationContent: some View {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
            fontStatusList
            fontDisplayTest
        }
        .padding(DesignSystemGlobal.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusXl)
                .fill(DesignSystemGlobal.BackgroundContainerColorWhite)
        )
    }

    private var fontStatusList: some View {
        ForEach(Array(fontVerificationResults.keys.sorted()), id: \.self) { fontName in
            fontStatusRow(for: fontName)
        }
    }

    private func fontStatusRow(for fontName: String) -> some View {
        let isLoaded = fontVerificationResults[fontName] == true

        return HStack {
            Image(systemName: isLoaded ? "checkmark.circle.fill" : "xmark.circle.fill")
                .foregroundStyle(
                    isLoaded
                        ? DesignSystemGlobal.IconOnContainerColorSuccess
                        : DesignSystemGlobal.IconOnContainerColorError)

            Text(fontName)
                .thdFont(.bodySm)
                .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)

            Spacer()

            Text(isLoaded ? "Loaded" : "Missing")
                .thdFont(.caption)
                .foregroundStyle(
                    isLoaded
                        ? DesignSystemGlobal.TextOnSurfaceColorSuccess
                        : DesignSystemGlobal.TextOnSurfaceColorError)
        }
    }

    private var fontDisplayTest: some View {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
            Text("Font Display Test:")
                .thdFont(.bodySm)
                .foregroundStyle(DesignSystemGlobal.TextOnContainerColorSecondary)

            displayFontTest
            informationalFontTest
        }
    }

    private var displayFontTest: some View {
        Text("Display Font: The Quick Brown Fox")
            .font(.custom(DesignSystemGlobal.FontFamilyDisplay, size: 20))
            .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)
    }

    private var informationalFontTest: some View {
        Text("Informational Font: The Quick Brown Fox Jumps Over")
            .font(.custom(DesignSystemGlobal.FontFamilyInformational, size: 16))
            .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)
    }

    // MARK: - Font Verification Function

    private func verifyCustomFonts() {
        let customFontNames = [
            DesignSystemGlobal.FontFamilyDisplay,  // "THD LgVar Beta"
            DesignSystemGlobal.FontFamilyInformational,  // "THD SmVar Beta"
        ]

        fontVerificationResults.removeAll()

        for fontName in customFontNames {
            // Check if the font is available by trying to create it
            let testFont = UIFont(name: fontName, size: 16)
            fontVerificationResults[fontName] = testFont != nil

            // Print debug information
            print(
                "\(testFont != nil ? "✅" : "❌") Font '\(fontName)' is \(testFont != nil ? "available" : "missing")"
            )
        }
    }
}

// MARK: - Preview

#Preview("Typography Demo") {
    NavigationStack {
        TypographyDemoView()
    }
}
