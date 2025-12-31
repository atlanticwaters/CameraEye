import SwiftUI

// MARK: - DSContentCard Showcase View

/// Comprehensive showcase of the DSContentCard component.
///
/// Demonstrates:
/// - Body placement options (first/second, padded/full bleed)
/// - Title and subtitle configurations
/// - Leading icons
/// - Header actions
/// - Bottom actions
/// - Show/hide toggles for sections
/// - Usage examples

struct DSContentCardView: View {
    @Environment(\.colorScheme) var colorScheme

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
            Text("DSContentCard")
                .thdFont(.h3)
                .foregroundStyle(textPrimary)

            Text("A content card component for displaying rich content with title, body, and actions. Used for promotional content, feature highlights, or structured layouts.")
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
            // Body Placement Section
            bodyPlacementSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Title Configuration Section
            titleConfigurationSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Actions Section
            actionsSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Interactive Example Section
            interactiveSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Usage Examples Section
            usageExamplesSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Specifications Section
            specificationsSection
        }
        .background(surfaceWhite)
        .clipShape(.rect(cornerRadius: TokensCoreLight.Spacing3))
    }

    // MARK: - Body Placement Section

    private var bodyPlacementSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Body Placement",
                description: "Control where body content appears and whether it has padding."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                placementExample(
                    label: "First with Padding",
                    placement: .firstWithPadding
                )

                placementExample(
                    label: "First Full Bleed",
                    placement: .firstFullBleed
                )

                placementExample(
                    label: "Second with Padding",
                    placement: .secondWithPadding
                )

                placementExample(
                    label: "Second Full Bleed",
                    placement: .secondFullBleed
                )
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    @ViewBuilder
    private func placementExample(label: String, placement: DSContentCardBodyPlacement) -> some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            Text(label)
                .thdFont(.caption)
                .foregroundStyle(textSecondary)

            DSContentCard(
                title: "Card Title",
                subtitle: "Card subtitle text",
                bodyPlacement: placement
            ) {
                sampleBodyContent(isFullBleed: placement.isFullBleed)
            }
        }
    }

    @ViewBuilder
    private func sampleBodyContent(isFullBleed: Bool) -> some View {
        if isFullBleed {
            Rectangle()
                .fill(infoAccent)
                .frame(height: TokensCoreLight.Spacing25)
                .overlay(
                    Text("Full Bleed Content")
                        .thdFont(.bodyMd)
                        .foregroundStyle(textSecondary)
                )
        } else {
            Rectangle()
                .fill(infoAccent)
                .frame(height: TokensCoreLight.Spacing20)
                .clipShape(.rect(cornerRadius: TokensCoreLight.Spacing2))
                .overlay(
                    Text("Padded Content")
                        .thdFont(.bodyMd)
                        .foregroundStyle(textSecondary)
                )
        }
    }

    // MARK: - Title Configuration Section

    private var titleConfigurationSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Title Configuration",
                description: "Cards with different title, subtitle, and icon combinations."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                Text("Title Only")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSContentCard(
                    title: "Featured Products",
                    bodyPlacement: .secondWithPadding
                ) {
                    sampleProductGrid
                }

                Text("Title + Subtitle")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSContentCard(
                    title: "New Arrivals",
                    subtitle: "Check out the latest additions",
                    bodyPlacement: .secondWithPadding
                ) {
                    sampleProductGrid
                }

                Text("Title + Icon")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSContentCard(
                    title: "Top Rated",
                    leadingIcon: Image(systemName: "star.fill"),
                    bodyPlacement: .secondWithPadding
                ) {
                    sampleProductGrid
                }

                Text("Title + Subtitle + Icon")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSContentCard(
                    title: "Special Offers",
                    subtitle: "Limited time deals",
                    leadingIcon: Image(systemName: "tag.fill"),
                    bodyPlacement: .secondWithPadding
                ) {
                    sampleProductGrid
                }
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    private var sampleProductGrid: some View {
        HStack(spacing: TokensCoreLight.Spacing2) {
            ForEach(0..<3, id: \.self) { _ in
                RoundedRectangle(cornerRadius: TokensCoreLight.Spacing2)
                    .fill(containerGreige)
                    .frame(width: TokensCoreLight.Spacing20, height: TokensCoreLight.Spacing20)
            }
        }
    }

    // MARK: - Actions Section

    private var actionsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Actions",
                description: "Cards with header actions and bottom actions."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                Text("Header Action")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSContentCard(
                    title: "Recommended",
                    subtitle: "Based on your interests",
                    bodyPlacement: .secondWithPadding,
                    headerAction: {
                        Button("See All") { }
                            .thdFont(.bodySm)
                    }
                ) {
                    sampleProductGrid
                }

                Text("Bottom Action")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSContentCard(
                    title: "Shop by Category",
                    bodyPlacement: .secondWithPadding,
                    showBottomAction: true,
                    bottomAction: {
                        DSButton("Browse All Categories", style: .outlined, size: .medium) { }
                    }
                ) {
                    sampleProductGrid
                }

                Text("Both Actions")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSContentCard(
                    title: "Flash Sale",
                    subtitle: "Ends in 2 hours",
                    leadingIcon: Image(systemName: "bolt.fill"),
                    bodyPlacement: .secondWithPadding,
                    showBottomAction: true,
                    headerAction: {
                        Button("View All") { }
                            .thdFont(.bodySm)
                    },
                    bottomAction: {
                        DSButton("Shop Now", style: .orangeFilled, size: .medium) { }
                    }
                ) {
                    sampleProductGrid
                }
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - Interactive Section

    private var interactiveSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Interactive Example",
                description: "Toggle different content card options."
            )

            DSContentCardInteractiveExample()
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - Usage Examples Section

    private var usageExamplesSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Usage Examples",
                description: "Real-world content card implementations."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                Text("Promotional Banner")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSContentCard(
                    title: "Summer Sale",
                    subtitle: "Up to 50% off outdoor furniture",
                    leadingIcon: Image(systemName: "sun.max.fill"),
                    bodyPlacement: .firstFullBleed,
                    showBottomAction: true,
                    bottomAction: {
                        DSButton("Shop the Sale", style: .orangeFilled, size: .medium) { }
                    }
                ) {
                    Rectangle()
                        .fill(LinearGradient(
                            colors: [brandLight, lemonLight],
                            startPoint: .leading,
                            endPoint: .trailing
                        ))
                        .frame(height: TokensCoreLight.Spacing30)
                }

                Text("Featured Content")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSContentCard(
                    title: "DIY Project Ideas",
                    subtitle: "Get inspired for your next home project",
                    leadingIcon: Image(systemName: "hammer.fill"),
                    bodyPlacement: .secondWithPadding,
                    headerAction: {
                        Button("See All") { }
                            .thdFont(.bodySm)
                    }
                ) {
                    VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                        ForEach(["Build a Deck", "Install a Ceiling Fan", "Paint Like a Pro"], id: \.self) { item in
                            HStack {
                                Image(systemName: "chevron.right")
                                    .thdFont(.caption)
                                Text(item)
                                    .thdFont(.bodyMd)
                            }
                            .foregroundStyle(textPrimary)
                        }
                    }
                }

                Text("Product Carousel Card")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSContentCard(
                    title: "Recently Viewed",
                    bodyPlacement: .secondWithPadding,
                    headerAction: {
                        Button("Clear") { }
                            .thdFont(.bodySm)
                            .foregroundStyle(textSecondary)
                    }
                ) {
                    ScrollView(.horizontal) {
                        HStack(spacing: TokensCoreLight.Spacing3) {
                            ForEach(0..<5, id: \.self) { index in
                                VStack(spacing: TokensCoreLight.Spacing1) {
                                    RoundedRectangle(cornerRadius: TokensCoreLight.Spacing2)
                                        .fill(containerGreige)
                                        .frame(width: TokensCoreLight.Spacing25, height: TokensCoreLight.Spacing25)
                                    Text("Product \(index + 1)")
                                        .thdFont(.caption)
                                        .foregroundStyle(textSecondary)
                                }
                            }
                        }
                    }
                    .scrollIndicators(.hidden)
                }
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - Specifications Section

    private var specificationsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Specifications",
                description: "Technical details and code examples."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                specRow(label: "Corner Radius", value: "xl (TokensSemanticLight.BorderRadiusXl)")
                specRow(label: "Content Padding", value: "16pt")
                specRow(label: "Internal Spacing", value: "12pt")
                specRow(label: "Shadow", value: "8pt blur, 2pt y-offset")

                Text("Body Placements")
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)
                    .padding(.top, TokensCoreLight.Spacing2)

                ForEach(DSContentCardBodyPlacement.allCases, id: \.self) { placement in
                    HStack {
                        Text("•")
                        Text(placementName(placement))
                            .thdFont(.bodySm)
                    }
                    .foregroundStyle(textSecondary)
                }

                Text("Code Example")
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)
                    .padding(.top, TokensCoreLight.Spacing2)

                Text("""
                DSContentCard(
                    title: "Card Title",
                    subtitle: "Subtitle text",
                    leadingIcon: Image(systemName: "star"),
                    bodyPlacement: .secondWithPadding,
                    showBottomAction: true,
                    headerAction: {
                        Button("Action") { }
                    },
                    bottomAction: {
                        DSButton("CTA", style: .primary) { }
                    }
                ) {
                    // Body content here
                }
                """)
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
                .padding(TokensCoreLight.Spacing3)
                .background(surfaceGreige)
                .clipShape(.rect(cornerRadius: TokensCoreLight.Spacing2))
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

    @ViewBuilder
    private func specRow(label: String, value: String) -> some View {
        HStack {
            Text(label)
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
            Spacer()
            Text(value)
                .thdFont(.bodySm)
                .foregroundStyle(textPrimary)
        }
    }

    private func placementName(_ placement: DSContentCardBodyPlacement) -> String {
        switch placement {
        case .firstWithPadding: return ".firstWithPadding"
        case .firstFullBleed: return ".firstFullBleed"
        case .secondWithPadding: return ".secondWithPadding"
        case .secondFullBleed: return ".secondFullBleed"
        }
    }

    // MARK: - Theme-Aware Colors

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    private var surfaceWhite: Color { tokens.BackgroundContainerColorWhite }
    private var surfaceGreige: Color { tokens.BackgroundSurfaceColorGreige }
    private var textPrimary: Color { tokens.TextOnContainerColorPrimary }
    private var textSecondary: Color { tokens.TextOnContainerColorSecondary }
    private var infoAccent: Color { tokens.BackgroundFeedbackColorInformationalAccent1 }
    private var containerGreige: Color { tokens.BackgroundContainerColorGreige }
    private var brandLight: Color { tokens.Brand100 }
    private var lemonLight: Color { tokens.Lemon100 }
    private var greige200: Color { tokens.Greige200 }
}

// MARK: - Interactive Example

private struct DSContentCardInteractiveExample: View {
    @Environment(\.colorScheme) var colorScheme

    @State private var showTitle = true
    @State private var showBody = true
    @State private var showBottomAction = false
    @State private var selectedPlacement: DSContentCardBodyPlacement = .secondWithPadding

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            // Controls
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                Toggle("Show Title", isOn: $showTitle)
                Toggle("Show Body", isOn: $showBody)
                Toggle("Show Bottom Action", isOn: $showBottomAction)

                HStack {
                    Text("Placement:")
                        .thdFont(.bodySm)
                    Picker("Placement", selection: $selectedPlacement) {
                        Text("First Padded").tag(DSContentCardBodyPlacement.firstWithPadding)
                        Text("First Bleed").tag(DSContentCardBodyPlacement.firstFullBleed)
                        Text("Second Padded").tag(DSContentCardBodyPlacement.secondWithPadding)
                        Text("Second Bleed").tag(DSContentCardBodyPlacement.secondFullBleed)
                    }
                    .pickerStyle(.menu)
                }
            }
            .thdFont(.bodySm)

            // Preview
            DSContentCard(
                title: "Interactive Card",
                subtitle: "Customize with toggles above",
                leadingIcon: Image(systemName: "gearshape.fill"),
                bodyPlacement: selectedPlacement,
                showTitle: showTitle,
                showBody: showBody,
                showBottomAction: showBottomAction,
                headerAction: {
                    Button("Action") { }
                        .thdFont(.bodySm)
                },
                bottomAction: {
                    DSButton("Bottom Action", style: .orangeFilled, size: .medium) { }
                }
            ) {
                if selectedPlacement.isFullBleed {
                    Rectangle()
                        .fill(tokens.BackgroundFeedbackColorInformationalAccent1)
                        .frame(height: TokensCoreLight.Spacing25)
                        .overlay(
                            Text("Body Content")
                                .thdFont(.bodyMd)
                                .foregroundStyle(textSecondary)
                        )
                } else {
                    RoundedRectangle(cornerRadius: TokensCoreLight.Spacing2)
                        .fill(tokens.BackgroundFeedbackColorInformationalAccent1)
                        .frame(height: TokensCoreLight.Spacing20)
                        .overlay(
                            Text("Body Content")
                                .thdFont(.bodyMd)
                                .foregroundStyle(textSecondary)
                        )
                }
            }
        }
    }

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    private var textSecondary: Color { tokens.TextOnContainerColorSecondary }
}

// MARK: - Token Protocol Helper

private protocol TokenSemanticProtocol {
    static var TextOnContainerColorPrimary: Color { get }
    static var TextOnContainerColorSecondary: Color { get }
    static var BackgroundContainerColorWhite: Color { get }
    static var BackgroundSurfaceColorGreige: Color { get }
    static var BackgroundFeedbackColorInformationalAccent1: Color { get }
    static var BackgroundContainerColorGreige: Color { get }
    static var Brand100: Color { get }
    static var Lemon100: Color { get }
    static var Greige200: Color { get }
}

extension TokensSemanticLight: TokenSemanticProtocol {}
extension TokensSemanticDark: TokenSemanticProtocol {}

// MARK: - Preview

#Preview {
    DSContentCardView()
}
