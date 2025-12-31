import SwiftUI

// MARK: - DSColorMappingView

/// Comprehensive showcase of the Design System color architecture.
///
/// Demonstrates:
/// - 3-layer token architecture (Raw Tokens → DSColor Facade → Component Helpers)
/// - All 5 color palettes (Brand, Greige, Moonlight, Lemon, Cinnabar)
/// - Semantic color categories (Background, Text, Border)
/// - Component-specific color mappings for all 25 components
/// - Theme resolution (light/dark comparison)

struct DSColorMappingView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var selectedComponent: String? = nil
    @State private var expandedPalette: String? = nil

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing6) {
                // Header Card
                headerCard

                // Content Card with all sections
                contentCard
            }
            .padding(TokensCoreLight.Spacing4)
            .padding(.top, TokensCoreLight.Spacing24)
            .padding(.bottom, TokensCoreLight.Spacing20)
        }
        .background(surfaceGreige)
        .applySoftScrollEdges()
    }

    // MARK: - Header Card

    private var headerCard: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            Text("Design System Color Mapping")
                .thdFont(.h3)
                .foregroundStyle(textPrimary)

            Text("Comprehensive view of how semantic tokens flow through the DSColor facade to component-specific color helpers. Shows the 3-layer abstraction that enables automatic light/dark theme support.")
                .thdFont(.bodyMd)
                .foregroundStyle(textSecondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(TokensCoreLight.Spacing4)
        .background(surfaceWhite)
        .clipShape(.rect(cornerRadius: TokensCoreLight.Spacing3))
    }

    // MARK: - Content Card

    private var contentCard: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Architecture Section
            architectureSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Color Palettes Section
            colorPalettesSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Semantic Categories Section
            semanticCategoriesSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Component Mappings Section
            componentMappingsSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Theme Comparison Section
            themeComparisonSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Specifications Section
            specificationsSection
        }
        .background(surfaceWhite)
        .clipShape(.rect(cornerRadius: TokensCoreLight.Spacing3))
    }

    // MARK: - Architecture Section

    private var architectureSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Token Architecture",
                description: "3-layer system for theme-aware colors."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                architectureLayer(
                    number: "1",
                    title: "Raw Tokens",
                    subtitle: "TokensSemanticLight / TokensSemanticDark",
                    description: "Auto-generated color values (300+ colors)",
                    color: .blue
                )

                Image(systemName: "arrow.down")
                    .font(.system(size: 16))
                    .foregroundStyle(textSecondary)
                    .frame(maxWidth: .infinity)

                architectureLayer(
                    number: "2",
                    title: "DSColor Facade",
                    subtitle: "DSColor.swift",
                    description: "Theme-aware wrapper with .resolve property",
                    color: .orange
                )

                Image(systemName: "arrow.down")
                    .font(.system(size: 16))
                    .foregroundStyle(textSecondary)
                    .frame(maxWidth: .infinity)

                architectureLayer(
                    number: "3",
                    title: "Component Helpers",
                    subtitle: "DS*Colors.swift (25 files)",
                    description: "State/variant logic returning resolved colors",
                    color: .green
                )
            }

            // Resolution Example
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                Text("Resolution Chain Example")
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)

                Text("""
                DSButtonColorHelper.backgroundColor(style: .orangeFilled, isDisabled: false)
                    → DSColor.buttonBackgroundBrandFilledDefault.resolve
                    → TokensSemanticLight.BackgroundButtonColorBrandFilledDefault
                    → Color(red: 0.976, green: 0.388, blue: 0.008)
                """)
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
                .padding(TokensCoreLight.Spacing3)
                .background(surfaceGreige)
                .clipShape(.rect(cornerRadius: 8))
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    @ViewBuilder
    private func architectureLayer(number: String, title: String, subtitle: String, description: String, color: Color) -> some View {
        HStack(spacing: TokensCoreLight.Spacing3) {
            ZStack {
                Circle()
                    .fill(color.opacity(0.2))
                    .frame(width: 32, height: 32)
                Text(number)
                    .thdFont(.bodySm)
                    .foregroundStyle(color)
            }

            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)
                Text(subtitle)
                    .thdFont(.bodySm)
                    .foregroundStyle(color)
                Text(description)
                    .thdFont(.bodySm)
                    .foregroundStyle(textSecondary)
            }

            Spacer()
        }
        .padding(TokensCoreLight.Spacing3)
        .background(surfaceGreige)
        .clipShape(.rect(cornerRadius: 8))
    }

    // MARK: - Color Palettes Section

    private var colorPalettesSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Color Palettes",
                description: "Base color scales used throughout the design system."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                colorPaletteRow(name: "Brand (Orange)", colors: brandColors)
                colorPaletteRow(name: "Greige (Neutral)", colors: greigeColors)
                colorPaletteRow(name: "Moonlight (Blue)", colors: moonlightColors)
                colorPaletteRow(name: "Lemon (Yellow)", colors: lemonColors)
                colorPaletteRow(name: "Cinnabar (Red)", colors: cinnabarColors)
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    @ViewBuilder
    private func colorPaletteRow(name: String, colors: [(String, Color)]) -> some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
            Text(name)
                .thdFont(.caption)
                .foregroundStyle(textSecondary)

            HStack(spacing: 2) {
                ForEach(colors, id: \.0) { label, color in
                    VStack(spacing: 2) {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(color)
                            .frame(height: 32)
                            .overlay(
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(Color.black.opacity(0.1), lineWidth: 0.5)
                            )
                        Text(label)
                            .font(.system(size: 8))
                            .foregroundStyle(textSecondary)
                    }
                }
            }
        }
    }

    // MARK: - Semantic Categories Section

    private var semanticCategoriesSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Semantic Color Categories",
                description: "DSColor properties grouped by purpose."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
                // Background Colors
                semanticCategory(
                    title: "Background Colors",
                    colors: [
                        ("buttonBackgroundBrandFilledDefault", DSColor.buttonBackgroundBrandFilledDefault.resolve),
                        ("containerBackgroundWhite", DSColor.containerBackgroundWhite.resolve),
                        ("containerBackgroundGreige", DSColor.containerBackgroundGreige.resolve),
                        ("feedbackBackgroundSuccessAccent1", DSColor.feedbackBackgroundSuccessAccent1.resolve),
                        ("feedbackBackgroundErrorAccent1", DSColor.feedbackBackgroundErrorAccent1.resolve),
                        ("feedbackBackgroundWarningAccent1", DSColor.feedbackBackgroundWarningAccent1.resolve),
                        ("feedbackBackgroundInformationalAccent1", DSColor.feedbackBackgroundInformationalAccent1.resolve)
                    ]
                )

                // Text Colors
                semanticCategory(
                    title: "Text Colors",
                    colors: [
                        ("textOnSurfaceColorPrimary", DSColor.textOnSurfaceColorPrimary.resolve),
                        ("textOnSurfaceColorSecondary", DSColor.textOnSurfaceColorSecondary.resolve),
                        ("textOnSurfaceColorTertiary", DSColor.textOnSurfaceColorTertiary.resolve),
                        ("textOnSurfaceColorSuccess", DSColor.textOnSurfaceColorSuccess.resolve),
                        ("textOnSurfaceColorError", DSColor.textOnSurfaceColorError.resolve),
                        ("textOnSurfaceColorWarning", DSColor.textOnSurfaceColorWarning.resolve),
                        ("textOnContainerColorPrimary", DSColor.textOnContainerColorPrimary.resolve)
                    ]
                )

                // Border Colors
                semanticCategory(
                    title: "Border Colors",
                    colors: [
                        ("borderOnContainerDefault", DSColor.borderOnContainerDefault.resolve),
                        ("borderOnContainerActive", DSColor.borderOnContainerActive.resolve),
                        ("borderOnContainerInactive", DSColor.borderOnContainerInactive.resolve),
                        ("inputBorderDefault", DSColor.inputBorderDefault.resolve),
                        ("inputBorderError", DSColor.inputBorderError.resolve),
                        ("inputBorderSuccess", DSColor.inputBorderSuccess.resolve),
                        ("buttonBorderOrangeOutlineDefault", DSColor.buttonBorderOrangeOutlineDefault.resolve)
                    ]
                )

                // Selector Colors
                semanticCategory(
                    title: "Selector Colors",
                    colors: [
                        ("selectorBackgroundFilledDefault", DSColor.selectorBackgroundFilledDefault.resolve),
                        ("selectorBackgroundFilledSelected", DSColor.selectorBackgroundFilledSelected.resolve),
                        ("selectorBackgroundFilledInactive", DSColor.selectorBackgroundFilledInactive.resolve),
                        ("selectorBackgroundOutlineDefault", DSColor.selectorBackgroundOutlineDefault.resolve),
                        ("selectorBackgroundOutlineSelected", DSColor.selectorBackgroundOutlineSelected.resolve)
                    ]
                )
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    @ViewBuilder
    private func semanticCategory(title: String, colors: [(String, Color)]) -> some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            Text(title)
                .thdFont(.bodySm)
                .foregroundStyle(textPrimary)

            VStack(spacing: 4) {
                ForEach(colors, id: \.0) { name, color in
                    HStack(spacing: TokensCoreLight.Spacing2) {
                        RoundedRectangle(cornerRadius: 4)
                            .fill(color)
                            .frame(width: 24, height: 24)
                            .overlay(
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(Color.black.opacity(0.1), lineWidth: 0.5)
                            )

                        Text(name)
                            .thdFont(.bodySm)
                            .foregroundStyle(textSecondary)
                            .lineLimit(1)

                        Spacer()
                    }
                }
            }
            .padding(TokensCoreLight.Spacing2)
            .background(surfaceGreige)
            .clipShape(.rect(cornerRadius: 8))
        }
    }

    // MARK: - Component Mappings Section

    private var componentMappingsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Component Color Mappings",
                description: "How each component's color helper maps to DSColor."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                // Group 1: Button & Input Components
                componentGroupHeader("Interactive Components")
                componentColorCard(
                    name: "DSButton",
                    file: "DSButtonColors.swift",
                    mappings: [
                        ("backgroundColor(orangeFilled)", "buttonBackgroundBrandFilledDefault"),
                        ("backgroundColor(whiteFilled)", "buttonBackgroundWhiteFilledDefault"),
                        ("backgroundColor(ghost)", "buttonBackgroundGhostFilledDefault"),
                        ("foregroundColor(orangeFilled)", "buttonTextOrangeFilledDefault"),
                        ("borderColor", "buttonBorderOrangeOutlineDefault")
                    ]
                )
                componentColorCard(
                    name: "DSIconButton",
                    file: "DSIconButtonColors.swift",
                    mappings: [
                        ("backgroundColor", "buttonBackgroundBrandFilledDefault"),
                        ("foregroundColor", "buttonTextOrangeFilledDefault")
                    ]
                )
                componentColorCard(
                    name: "DSTextInputField",
                    file: "DSTextInputFieldColors.swift",
                    mappings: [
                        ("backgroundColor", "inputBackgroundWhiteOutlinedDefault"),
                        ("borderColor(default)", "inputBorderDefault"),
                        ("borderColor(error)", "inputBorderError"),
                        ("borderColor(success)", "inputBorderSuccess"),
                        ("textColor", "textOnSurfaceColorPrimary")
                    ]
                )
                componentColorCard(
                    name: "DSPill",
                    file: "DSPillColors.swift",
                    mappings: [
                        ("backgroundColor(filled)", "selectorBackgroundFilledDefault"),
                        ("backgroundColor(outline)", "selectorBackgroundOutlineDefault"),
                        ("textColor", "textSelectorColorDefault")
                    ]
                )
                componentColorCard(
                    name: "DSTabs",
                    file: "DSTabColors.swift",
                    mappings: [
                        ("selectedColor", "textSelectorColorSelected"),
                        ("unselectedColor", "textSelectorColorDefault"),
                        ("indicatorColor", "buttonBackgroundBrandFilledDefault")
                    ]
                )
                componentColorCard(
                    name: "DSTile",
                    file: "DSTileColors.swift",
                    mappings: [
                        ("backgroundColor", "containerBackgroundWhite"),
                        ("borderColor(selected)", "borderSelectorColorOutlineSelected"),
                        ("borderColor(default)", "borderSelectorColorOutlineDefault")
                    ]
                )

                // Group 2: Feedback Components
                componentGroupHeader("Feedback Components")
                componentColorCard(
                    name: "DSAlert",
                    file: "DSAlertColors.swift",
                    mappings: [
                        ("backgroundColor(success)", "feedbackBackgroundSuccessAccent1"),
                        ("backgroundColor(error)", "feedbackBackgroundErrorAccent1"),
                        ("backgroundColor(warning)", "feedbackBackgroundWarningAccent1"),
                        ("backgroundColor(info)", "feedbackBackgroundInformationalAccent1"),
                        ("iconColor", "textOnContainerColorPrimary")
                    ]
                )
                componentColorCard(
                    name: "DSBadge",
                    file: "DSBadgeColors.swift",
                    mappings: [
                        ("backgroundColor(filledSubtle, success)", "feedbackBackgroundSuccessAccent1"),
                        ("backgroundColor(filledSubtle, error)", "feedbackBackgroundErrorAccent1"),
                        ("backgroundColor(filledSubtle, warning)", "feedbackBackgroundWarningAccent1"),
                        ("backgroundColor(filledSubtle, info)", "feedbackBackgroundInformationalAccent1"),
                        ("foregroundColor", "textOnSurfaceColorPrimary")
                    ]
                )
                componentColorCard(
                    name: "DSCallout",
                    file: "DSCalloutColors.swift",
                    mappings: [
                        ("backgroundColor", "containerBackgroundGreige"),
                        ("textColor", "textOnContainerColorPrimary")
                    ]
                )
                componentColorCard(
                    name: "DSProgressBar",
                    file: "DSProgressBarColors.swift",
                    mappings: [
                        ("trackColor", "containerBackgroundTransparent10"),
                        ("fillColor", "buttonBackgroundBrandFilledDefault")
                    ]
                )

                // Group 3: Container Components
                componentGroupHeader("Container Components")
                componentColorCard(
                    name: "DSAccordion",
                    file: "DSAccordionColors.swift",
                    mappings: [
                        ("backgroundColor", "containerBackgroundWhite"),
                        ("borderColor", "borderOnContainerDefault"),
                        ("textColor", "textOnContainerColorPrimary")
                    ]
                )
                componentColorCard(
                    name: "DSContentCard",
                    file: "DSContentCardColors.swift",
                    mappings: [
                        ("backgroundColor", "containerBackgroundWhite"),
                        ("textColor", "textOnContainerColorPrimary")
                    ]
                )
                componentColorCard(
                    name: "DSFeatureCard",
                    file: "DSFeatureCardColors.swift",
                    mappings: [
                        ("backgroundColor", "containerBackgroundWhite"),
                        ("textColor", "textOnContainerColorPrimary")
                    ]
                )
                componentColorCard(
                    name: "DSMiniProductCard",
                    file: "DSMiniProductCardColors.swift",
                    mappings: [
                        ("backgroundColor", "containerBackgroundWhite"),
                        ("priceColor", "textOnContainerColorPrimary"),
                        ("salePriceColor", "textOnSurfaceColorError")
                    ]
                )

                // Group 4: Media Components
                componentGroupHeader("Media Components")
                componentColorCard(
                    name: "DSGallery",
                    file: "DSGalleryColors.swift",
                    mappings: [
                        ("backgroundColor", "containerBackgroundWhite"),
                        ("thumbnailBorderColor", "borderOnContainerDefault")
                    ]
                )
                componentColorCard(
                    name: "DSImageContainer",
                    file: "DSImageContainerColors.swift",
                    mappings: [
                        ("placeholderColor", "containerBackgroundGreige"),
                        ("borderColor", "borderOnContainerInactive")
                    ]
                )
                componentColorCard(
                    name: "DSRatingMeter",
                    file: "DSRatingMeterColors.swift",
                    mappings: [
                        ("starColor", "lemon500"),
                        ("emptyStarColor", "greige300"),
                        ("textColor", "textOnSurfaceColorSecondary")
                    ]
                )

                // Group 5: List Components
                componentGroupHeader("List Components")
                componentColorCard(
                    name: "DSListItem",
                    file: "DSListItemColors.swift",
                    mappings: [
                        ("backgroundColor", "containerBackgroundWhite"),
                        ("textColor", "textOnContainerColorPrimary"),
                        ("iconColor", "iconColorSecondary")
                    ]
                )
                componentColorCard(
                    name: "DSShareSheet",
                    file: "DSShareSheetColors.swift",
                    mappings: [
                        ("backgroundColor", "containerBackgroundWhite"),
                        ("actionColor", "textOnSurfaceColorPrimary")
                    ]
                )

                // Group 6: PLP Components
                componentGroupHeader("PLP Components")
                componentColorCard(
                    name: "DSPLPPod",
                    file: "DSPLPPodColors.swift",
                    mappings: [
                        ("backgroundColor", "containerBackgroundWhite")
                    ]
                )
                componentColorCard(
                    name: "DSPLPPodButtonSet",
                    file: "DSPLPPodButtonSetColors.swift",
                    mappings: [
                        ("addToCartBackground", "buttonBackgroundBrandFilledDefault"),
                        ("addToListBackground", "buttonBackgroundGhostFilledDefault")
                    ]
                )
                componentColorCard(
                    name: "DSPLPPodImageContainer",
                    file: "DSPLPPodImageContainerColors.swift",
                    mappings: [
                        ("badgeBackgroundColor", "feedbackBackgroundInformationalAccent2")
                    ]
                )
                componentColorCard(
                    name: "DSPlpPodDetails",
                    file: "DSPLPPodDetailsColors.swift",
                    mappings: [
                        ("priceColor", "textOnContainerColorPrimary"),
                        ("savingsColor", "textOnSurfaceColorSuccess"),
                        ("fulfillmentColor", "textOnContainerColorSecondary")
                    ]
                )
                componentColorCard(
                    name: "DSPLPFilterSheet",
                    file: "DSPLPFilterSheetColors.swift",
                    mappings: [
                        ("backgroundColor", "containerBackgroundWhite"),
                        ("categoryTitleColor", "textOnContainerColorPrimary"),
                        ("checkboxSelectedColor", "buttonBackgroundBrandFilledDefault")
                    ]
                )
                componentColorCard(
                    name: "DSPlpFilterPanel",
                    file: "DSPLPFilterPanelColors.swift",
                    mappings: [
                        ("titleColor", "textOnSurfaceColorPrimary"),
                        ("pillBackgroundColor", "selectorBackgroundFilledDefault")
                    ]
                )
                componentColorCard(
                    name: "DSPipZoneA",
                    file: "DSPIPZoneAColors.swift",
                    mappings: [
                        ("backgroundColor", "containerBackgroundWhite"),
                        ("priceColor", "textOnContainerColorPrimary"),
                        ("stockInStockColor", "textOnSurfaceColorSuccess"),
                        ("stockOutOfStockColor", "textOnSurfaceColorError")
                    ]
                )
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    @ViewBuilder
    private func componentGroupHeader(_ title: String) -> some View {
        Text(title)
            .thdFont(.h5)
            .foregroundStyle(textPrimary)
            .padding(.top, TokensCoreLight.Spacing3)
    }

    @ViewBuilder
    private func componentColorCard(name: String, file: String, mappings: [(String, String)]) -> some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            HStack {
                Text(name)
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)
                Spacer()
                Text(file)
                    .thdFont(.bodySm)
                    .foregroundStyle(textSecondary)
            }

            VStack(spacing: 2) {
                ForEach(mappings, id: \.0) { method, token in
                    HStack(spacing: TokensCoreLight.Spacing2) {
                        Text(method)
                            .thdFont(.bodySm)
                            .foregroundStyle(textSecondary)
                            .lineLimit(1)

                        Spacer()

                        Image(systemName: "arrow.right")
                            .font(.system(size: 10))
                            .foregroundStyle(textSecondary)

                        Text(token)
                            .thdFont(.bodySm)
                            .foregroundStyle(Color.blue)
                            .lineLimit(1)
                    }
                }
            }
        }
        .padding(TokensCoreLight.Spacing3)
        .background(surfaceGreige)
        .clipShape(.rect(cornerRadius: 8))
    }

    // MARK: - Theme Comparison Section

    private var themeComparisonSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Theme Comparison",
                description: "Side-by-side light and dark mode colors."
            )

            VStack(spacing: TokensCoreLight.Spacing2) {
                themeComparisonRow(
                    name: "Surface Primary",
                    light: TokensSemanticLight.BackgroundSurfaceColorGreige,
                    dark: TokensSemanticDark.BackgroundSurfaceColorGreige
                )
                themeComparisonRow(
                    name: "Container White",
                    light: TokensSemanticLight.BackgroundContainerColorWhite,
                    dark: TokensSemanticDark.BackgroundContainerColorWhite
                )
                themeComparisonRow(
                    name: "Text Primary",
                    light: TokensSemanticLight.TextOnSurfaceColorPrimary,
                    dark: TokensSemanticDark.TextOnSurfaceColorPrimary
                )
                themeComparisonRow(
                    name: "Text Secondary",
                    light: TokensSemanticLight.TextOnSurfaceColorSecondary,
                    dark: TokensSemanticDark.TextOnSurfaceColorSecondary
                )
                themeComparisonRow(
                    name: "Brand Button",
                    light: TokensSemanticLight.BackgroundButtonColorBrandFilledDefault,
                    dark: TokensSemanticDark.BackgroundButtonColorBrandFilledDefault
                )
                themeComparisonRow(
                    name: "Border Default",
                    light: TokensSemanticLight.BorderOnContainerDefault,
                    dark: TokensSemanticDark.BorderOnContainerDefault
                )
                themeComparisonRow(
                    name: "Success Feedback",
                    light: TokensSemanticLight.BackgroundFeedbackColorSuccessAccent1,
                    dark: TokensSemanticDark.BackgroundFeedbackColorSuccessAccent1
                )
                themeComparisonRow(
                    name: "Error Feedback",
                    light: TokensSemanticLight.BackgroundFeedbackColorErrorAccent1,
                    dark: TokensSemanticDark.BackgroundFeedbackColorErrorAccent1
                )
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    @ViewBuilder
    private func themeComparisonRow(name: String, light: Color, dark: Color) -> some View {
        HStack(spacing: TokensCoreLight.Spacing3) {
            Text(name)
                .thdFont(.bodySm)
                .foregroundStyle(textPrimary)
                .frame(width: 120, alignment: .leading)

            HStack(spacing: TokensCoreLight.Spacing2) {
                VStack(spacing: 2) {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(light)
                        .frame(width: 40, height: 24)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.black.opacity(0.1), lineWidth: 0.5)
                        )
                    Text("Light")
                        .font(.system(size: 8))
                        .foregroundStyle(textSecondary)
                }

                VStack(spacing: 2) {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(dark)
                        .frame(width: 40, height: 24)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.white.opacity(0.2), lineWidth: 0.5)
                        )
                        .background(
                            RoundedRectangle(cornerRadius: 4)
                                .fill(Color.black)
                        )
                    Text("Dark")
                        .font(.system(size: 8))
                        .foregroundStyle(textSecondary)
                }
            }

            Spacer()
        }
        .padding(TokensCoreLight.Spacing2)
        .background(surfaceGreige)
        .clipShape(.rect(cornerRadius: 8))
    }

    // MARK: - Specifications Section

    private var specificationsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Specifications",
                description: "File paths and technical details."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                Text("Token Files")
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)

                VStack(alignment: .leading, spacing: 4) {
                    Text("• DesignSystem/Tokens/Semantic/TokensSemanticLight.swift")
                    Text("• DesignSystem/Tokens/Semantic/TokensSemanticDark.swift")
                    Text("• DesignSystem/Tokens/Core/TokensCoreLight.swift")
                    Text("• DesignSystem/Tokens/Core/TokensCoreDark.swift")
                }
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)

                Text("Facade")
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)
                    .padding(.top, TokensCoreLight.Spacing2)

                Text("• DesignSystem/Facades/DSColor.swift (200+ static properties)")
                    .thdFont(.bodySm)
                    .foregroundStyle(textSecondary)

                Text("Component Color Helpers (25)")
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)
                    .padding(.top, TokensCoreLight.Spacing2)

                Text("• DS Components/[ComponentName]/DS[ComponentName]Colors.swift")
                    .thdFont(.bodySm)
                    .foregroundStyle(textSecondary)

                Text("Usage Example")
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)
                    .padding(.top, TokensCoreLight.Spacing2)

                Text("""
                // Direct DSColor usage (auto-resolves theme)
                Text("Hello")
                    .foregroundStyle(DSColor.textOnSurfaceColorPrimary.resolve)

                // Via component helper (with state logic)
                let bgColor = DSButtonColorHelper.backgroundColor(
                    style: .orangeFilled,
                    isDisabled: false
                )
                """)
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
                .padding(TokensCoreLight.Spacing3)
                .background(surfaceGreige)
                .clipShape(.rect(cornerRadius: 8))
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - Helper Methods

    @ViewBuilder
    private func sectionHeader(title: String, description: String) -> some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
            Text(title)
                .thdFont(.h5)
                .foregroundStyle(textPrimary)

            Text(description)
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
        }
    }

    // MARK: - Color Palette Data

    private var brandColors: [(String, Color)] {
        [
            ("025", DSColor.brand025.resolve),
            ("050", DSColor.brand050.resolve),
            ("100", DSColor.brand100.resolve),
            ("200", DSColor.brand200.resolve),
            ("300", DSColor.brand300.resolve),
            ("400", DSColor.brand400.resolve),
            ("500", DSColor.brand500.resolve),
            ("600", DSColor.brand600.resolve),
            ("700", DSColor.brand700.resolve),
            ("800", DSColor.brand800.resolve),
            ("900", DSColor.brand900.resolve),
            ("950", DSColor.brand950.resolve)
        ]
    }

    private var greigeColors: [(String, Color)] {
        [
            ("025", DSColor.greige025.resolve),
            ("050", DSColor.greige050.resolve),
            ("100", DSColor.greige100.resolve),
            ("200", DSColor.greige200.resolve),
            ("300", DSColor.greige300.resolve),
            ("400", DSColor.greige400.resolve),
            ("500", DSColor.greige500.resolve),
            ("600", DSColor.greige600.resolve),
            ("700", DSColor.greige700.resolve),
            ("800", DSColor.greige800.resolve),
            ("900", DSColor.greige900.resolve),
            ("950", DSColor.greige950.resolve)
        ]
    }

    private var moonlightColors: [(String, Color)] {
        [
            ("025", DSColor.moonlight025.resolve),
            ("050", DSColor.moonlight050.resolve),
            ("100", DSColor.moonlight100.resolve),
            ("200", DSColor.moonlight200.resolve),
            ("300", DSColor.moonlight300.resolve),
            ("400", DSColor.moonlight400.resolve),
            ("500", DSColor.moonlight500.resolve),
            ("600", DSColor.moonlight600.resolve),
            ("700", DSColor.moonlight700.resolve),
            ("800", DSColor.moonlight800.resolve),
            ("900", DSColor.moonlight900.resolve),
            ("950", DSColor.moonlight950.resolve)
        ]
    }

    private var lemonColors: [(String, Color)] {
        [
            ("025", DSColor.lemon025.resolve),
            ("050", DSColor.lemon050.resolve),
            ("100", DSColor.lemon100.resolve),
            ("200", DSColor.lemon200.resolve),
            ("300", DSColor.lemon300.resolve),
            ("400", DSColor.lemon400.resolve),
            ("500", DSColor.lemon500.resolve),
            ("600", DSColor.lemon600.resolve),
            ("700", DSColor.lemon700.resolve),
            ("800", DSColor.lemon800.resolve),
            ("900", DSColor.lemon900.resolve),
            ("950", DSColor.lemon950.resolve)
        ]
    }

    private var cinnabarColors: [(String, Color)] {
        [
            ("025", DSColor.cinnabar025.resolve),
            ("050", DSColor.cinnabar050.resolve),
            ("100", DSColor.cinnabar100.resolve),
            ("200", DSColor.cinnabar200.resolve),
            ("300", DSColor.cinnabar300.resolve),
            ("400", DSColor.cinnabar400.resolve),
            ("500", DSColor.cinnabar500.resolve),
            ("600", DSColor.cinnabar600.resolve),
            ("700", DSColor.cinnabar700.resolve),
            ("800", DSColor.cinnabar800.resolve),
            ("900", DSColor.cinnabar900.resolve),
            ("950", DSColor.cinnabar950.resolve)
        ]
    }

    // MARK: - Theme-Aware Colors

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    private var surfaceWhite: Color { tokens.BackgroundContainerColorWhite }
    private var surfaceGreige: Color { tokens.BackgroundSurfaceColorGreige }
    private var textPrimary: Color { tokens.TextOnContainerColorPrimary }
    private var textSecondary: Color { tokens.TextOnContainerColorSecondary }
}

// MARK: - Token Protocol Helper

private protocol TokenSemanticProtocol {
    static var TextOnContainerColorPrimary: Color { get }
    static var TextOnContainerColorSecondary: Color { get }
    static var BackgroundContainerColorWhite: Color { get }
    static var BackgroundSurfaceColorGreige: Color { get }
}

extension TokensSemanticLight: TokenSemanticProtocol {}
extension TokensSemanticDark: TokenSemanticProtocol {}

// MARK: - Preview

#Preview {
    DSColorMappingView()
}
