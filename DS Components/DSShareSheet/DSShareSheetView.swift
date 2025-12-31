import SwiftUI

// MARK: - DSShareSheet Showcase View

/// Comprehensive showcase of the DSShareSheet component.
///
/// Demonstrates:
/// - Share actions (horizontal scroll row)
/// - Action rows (vertical list)
/// - Factory methods for common actions
/// - Header with title and subtitle
/// - Destructive action styling
/// - Usage examples

struct DSShareSheetView: View {
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
            Text("DSShareSheet")
                .thdFont(.h3)
                .foregroundStyle(textPrimary)

            Text("A bottom sheet component for sharing content and performing actions. Features a drag handle, optional header, horizontal share actions row, and vertical action rows.")
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
            // Share Actions Section
            shareActionsSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Action Rows Section
            actionRowsSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Full Sheet Example Section
            fullSheetExampleSection

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

    // MARK: - Share Actions Section

    private var shareActionsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Share Actions",
                description: "Horizontal scroll row of sharing options (iOS-style)."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                Text("Factory Methods")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        shareActionPreview(.copyLink())
                        shareActionPreview(.messages())
                        shareActionPreview(.mail())
                        shareActionPreview(.airdrop())
                        shareActionPreview(.notes())
                        shareActionPreview(.reminders())
                        shareActionPreview(.more())
                    }
                }

                Text("With Custom Background Colors")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        shareActionPreview(DSShareAction(
                            icon: Image(systemName: "paperplane.fill"),
                            label: "Send",
                            iconBackgroundColor: .purple
                        ))
                        shareActionPreview(DSShareAction(
                            icon: Image(systemName: "photo"),
                            label: "Photos",
                            iconBackgroundColor: .pink
                        ))
                        shareActionPreview(DSShareAction(
                            icon: Image(systemName: "doc.text"),
                            label: "Files",
                            iconBackgroundColor: .indigo
                        ))
                    }
                }
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    @ViewBuilder
    private func shareActionPreview(_ action: DSShareAction) -> some View {
        VStack(spacing: 6) {
            ZStack {
                Circle()
                    .fill(action.iconBackgroundColor ?? containerTransparent20)
                    .frame(width: 60, height: 60)

                action.icon
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 28, height: 28)
                    .foregroundStyle(action.iconBackgroundColor != nil ? .white : textPrimary)
            }

            Text(action.label)
                .font(.caption2)
                .foregroundStyle(textSecondary)
                .lineLimit(1)
        }
        .frame(width: 60)
    }

    // MARK: - Action Rows Section

    private var actionRowsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Action Rows",
                description: "Vertical list of actions with icons."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                Text("Factory Methods")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                VStack(spacing: 0) {
                    actionRowPreview(.save())
                    Divider().padding(.leading, 56)
                    actionRowPreview(.addToList())
                    Divider().padding(.leading, 56)
                    actionRowPreview(.compare())
                    Divider().padding(.leading, 56)
                    actionRowPreview(.print())
                    Divider().padding(.leading, 56)
                    actionRowPreview(.shareFeedback())
                }
                .background(surfaceGreige)
                .clipShape(.rect(cornerRadius: 8))

                Text("Destructive Action")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                VStack(spacing: 0) {
                    actionRowPreview(.report())
                }
                .background(surfaceGreige)
                .clipShape(.rect(cornerRadius: 8))
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    @ViewBuilder
    private func actionRowPreview(_ action: DSShareSheetAction) -> some View {
        HStack(spacing: 16) {
            action.icon
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
                .foregroundStyle(action.isDestructive ? Color.red : textPrimary)

            Text(action.label)
                .thdFont(.bodyMd)
                .foregroundStyle(action.isDestructive ? Color.red : textPrimary)

            Spacer()
        }
        .frame(height: 52)
        .padding(.horizontal, 16)
    }

    // MARK: - Full Sheet Example Section

    private var fullSheetExampleSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Full Sheet Example",
                description: "Complete share sheet with all components."
            )

            DSShareSheet(
                data: DSShareSheetData(
                    title: "Share Product",
                    subtitle: "DEWALT 20V MAX XR Brushless Drill/Driver Kit",
                    shareActions: [
                        .copyLink(),
                        .messages(),
                        .mail(),
                        .airdrop(),
                        .notes(),
                        .more()
                    ],
                    actionRows: [
                        .save(),
                        .addToList(),
                        .compare(),
                        .print()
                    ]
                )
            )
            .clipShape(.rect(cornerRadius: 16))
            .shadow(color: containerTransparent10, radius: 8, x: 0, y: -2)
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - Interactive Section

    private var interactiveSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Interactive Example",
                description: "Tap actions to see callbacks."
            )

            DSShareSheetInteractiveExample()
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - Usage Examples Section

    private var usageExamplesSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Usage Examples",
                description: "Real-world share sheet implementations."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                Text("Product Share Sheet")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSShareSheet(
                    data: DSShareSheetData(
                        title: "Share",
                        subtitle: "Milwaukee M18 FUEL Impact Driver",
                        shareActions: [
                            .copyLink(),
                            .messages(),
                            .mail(),
                            .more()
                        ],
                        actionRows: [
                            .save(),
                            .addToList(),
                            .compare()
                        ]
                    )
                )
                .clipShape(.rect(cornerRadius: 16))

                Text("Minimal Share Sheet")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSShareSheet(
                    data: DSShareSheetData(
                        shareActions: [
                            .copyLink(),
                            .messages(),
                            .mail()
                        ],
                        actionRows: []
                    )
                )
                .clipShape(.rect(cornerRadius: 16))

                Text("Actions Only")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSShareSheet(
                    data: DSShareSheetData(
                        title: "More Options",
                        shareActions: [],
                        actionRows: [
                            .save(),
                            .addToList(),
                            .shareFeedback(),
                            .report()
                        ]
                    )
                )
                .clipShape(.rect(cornerRadius: 16))
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
                specRow(label: "Corner Radius", value: "16pt (top only)")
                specRow(label: "Handle Size", value: "36pt × 4pt")
                specRow(label: "Share Action Size", value: "60pt circle")
                specRow(label: "Share Action Icon", value: "28pt")
                specRow(label: "Action Row Height", value: "52pt")
                specRow(label: "Action Row Icon", value: "24pt")

                Text("DSShareAction Factory Methods")
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)
                    .padding(.top, TokensCoreLight.Spacing2)

                VStack(alignment: .leading, spacing: 4) {
                    Text("• .copyLink()")
                    Text("• .messages()")
                    Text("• .mail()")
                    Text("• .airdrop()")
                    Text("• .notes()")
                    Text("• .reminders()")
                    Text("• .more()")
                }
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)

                Text("DSShareSheetAction Factory Methods")
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)
                    .padding(.top, TokensCoreLight.Spacing2)

                VStack(alignment: .leading, spacing: 4) {
                    Text("• .save()")
                    Text("• .addToList()")
                    Text("• .compare()")
                    Text("• .print()")
                    Text("• .shareFeedback()")
                    Text("• .report() - Destructive")
                }
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)

                Text("Code Example")
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)
                    .padding(.top, TokensCoreLight.Spacing2)

                Text("""
                DSShareSheet(
                    data: DSShareSheetData(
                        title: "Share Product",
                        subtitle: "Product name here",
                        shareActions: [
                            .copyLink(),
                            .messages(),
                            .mail(),
                            .more()
                        ],
                        actionRows: [
                            .save(),
                            .addToList(),
                            .compare(),
                            .report()
                        ]
                    ),
                    onShareAction: { action in
                        print("Share: \\(action.label)")
                    },
                    onAction: { action in
                        print("Action: \\(action.label)")
                    },
                    onDismiss: {
                        print("Dismissed")
                    }
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

    // MARK: - Theme-Aware Colors

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    private var surfaceWhite: Color { tokens.BackgroundContainerColorWhite }
    private var surfaceGreige: Color { tokens.BackgroundSurfaceColorGreige }
    private var textPrimary: Color { tokens.TextOnContainerColorPrimary }
    private var textSecondary: Color { tokens.TextOnContainerColorSecondary }
    private var containerTransparent10: Color { tokens.BackgroundContainerColorTransparent10 }
    private var containerTransparent20: Color { tokens.BackgroundContainerColorTransparent20 }
}

// MARK: - Interactive Example

private struct DSShareSheetInteractiveExample: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var lastAction: String = "Tap an action..."

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            Text("Last Action: \(lastAction)")
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
                .padding(TokensCoreLight.Spacing2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(surfaceGreige)
                .clipShape(.rect(cornerRadius: 8))

            DSShareSheet(
                data: DSShareSheetData(
                    title: "Interactive Demo",
                    shareActions: [
                        .copyLink(),
                        .messages(),
                        .mail()
                    ],
                    actionRows: [
                        .save(),
                        .addToList()
                    ]
                ),
                onShareAction: { action in
                    lastAction = "Share: \(action.label)"
                },
                onAction: { action in
                    lastAction = "Action: \(action.label)"
                }
            )
            .clipShape(.rect(cornerRadius: 16))
        }
    }

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    private var surfaceGreige: Color { tokens.BackgroundSurfaceColorGreige }
    private var textSecondary: Color { tokens.TextOnContainerColorSecondary }
}

// MARK: - Token Protocol Helper

private protocol TokenSemanticProtocol {
    static var TextOnContainerColorPrimary: Color { get }
    static var TextOnContainerColorSecondary: Color { get }
    static var BackgroundContainerColorWhite: Color { get }
    static var BackgroundSurfaceColorGreige: Color { get }
    static var BackgroundContainerColorTransparent10: Color { get }
    static var BackgroundContainerColorTransparent20: Color { get }
}

extension TokensSemanticLight: TokenSemanticProtocol {}
extension TokensSemanticDark: TokenSemanticProtocol {}

// MARK: - Preview

#Preview {
    DSShareSheetView()
}
