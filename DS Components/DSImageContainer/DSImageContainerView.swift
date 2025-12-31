import SwiftUI

// MARK: - DSImageContainer Showcase View

/// Comprehensive showcase of the DSImageContainer component.
///
/// Demonstrates:
/// - 10 size variants (pico to xxLarge)
/// - Image loading from SwiftUI Image
/// - Async loading from URL
/// - Placeholder states
/// - Custom placeholders
/// - Content mode options
/// - Corner radius variations by size

struct DSImageContainerView: View {
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
            Text("DSImageContainer")
                .thdFont(.h3)
                .foregroundStyle(textPrimary)

            Text("A standardized image container component for displaying images at consistent sizes. Supports loading from URLs, SwiftUI Images, or displaying placeholders.")
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
            // All Sizes Section
            allSizesSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Size Groups Section
            sizeGroupsSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // With Images Section
            withImagesSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Placeholders Section
            placeholdersSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Content Modes Section
            contentModesSection

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

    // MARK: - All Sizes Section

    private var allSizesSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "All Sizes",
                description: "10 predefined sizes from pico (22pt) to xxLarge (398pt)."
            )

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .bottom, spacing: TokensCoreLight.Spacing3) {
                    ForEach(DSImageContainerSize.allCases, id: \.self) { size in
                        VStack(spacing: TokensCoreLight.Spacing2) {
                            DSImageContainer(
                                image: Image(systemName: "photo"),
                                size: size
                            )

                            Text(sizeName(size))
                                .thdFont(.caption)
                                .foregroundStyle(textSecondary)

                            Text("\(Int(size.dimension))pt")
                                .thdFont(.bodySm)
                                .foregroundStyle(textSecondary)
                        }
                    }
                }
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - Size Groups Section

    private var sizeGroupsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Size Groups",
                description: "Sizes organized by common use cases."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                Text("Tiny (Icons & Avatars)")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                HStack(spacing: TokensCoreLight.Spacing3) {
                    sizeWithLabel(.pico)
                    sizeWithLabel(.nano)
                    sizeWithLabel(.micro)
                }

                Text("Small (List Items & Thumbnails)")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                HStack(spacing: TokensCoreLight.Spacing3) {
                    sizeWithLabel(.xxSmall)
                    sizeWithLabel(.xSmall)
                    sizeWithLabel(.small)
                }

                Text("Large (Cards & Featured)")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: TokensCoreLight.Spacing3) {
                        sizeWithLabel(.medium)
                        sizeWithLabel(.large)
                    }
                }
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    @ViewBuilder
    private func sizeWithLabel(_ size: DSImageContainerSize) -> some View {
        VStack(spacing: 4) {
            DSImageContainer(size: size)
            Text(sizeName(size))
                .thdFont(.caption)
                .foregroundStyle(textSecondary)
        }
    }

    // MARK: - With Images Section

    private var withImagesSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "With Images",
                description: "Containers displaying actual images."
            )

            HStack(spacing: TokensCoreLight.Spacing3) {
                VStack(spacing: TokensCoreLight.Spacing2) {
                    DSImageContainer(
                        image: Image(systemName: "hammer.fill"),
                        size: .small,
                        contentMode: .fit
                    )
                    Text("System Image")
                        .thdFont(.caption)
                        .foregroundStyle(textSecondary)
                }

                VStack(spacing: TokensCoreLight.Spacing2) {
                    DSImageContainer(
                        image: Image(systemName: "wrench.and.screwdriver.fill"),
                        size: .small,
                        contentMode: .fit
                    )
                    Text("Tool Icon")
                        .thdFont(.caption)
                        .foregroundStyle(textSecondary)
                }

                VStack(spacing: TokensCoreLight.Spacing2) {
                    DSImageContainer(
                        image: Image(systemName: "paintbrush.fill"),
                        size: .small,
                        contentMode: .fit
                    )
                    Text("Paint Icon")
                        .thdFont(.caption)
                        .foregroundStyle(textSecondary)
                }
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - Placeholders Section

    private var placeholdersSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Placeholders",
                description: "Default and custom placeholder states."
            )

            HStack(spacing: TokensCoreLight.Spacing3) {
                VStack(spacing: TokensCoreLight.Spacing2) {
                    DSImageContainer(size: .small)
                    Text("Default")
                        .thdFont(.caption)
                        .foregroundStyle(textSecondary)
                }

                VStack(spacing: TokensCoreLight.Spacing2) {
                    DSImageContainer(size: .small) {
                        ProgressView()
                    }
                    Text("Loading")
                        .thdFont(.caption)
                        .foregroundStyle(textSecondary)
                }

                VStack(spacing: TokensCoreLight.Spacing2) {
                    DSImageContainer(size: .small) {
                        Image(systemName: "exclamationmark.triangle")
                            .foregroundStyle(iconWarning)
                    }
                    Text("Error")
                        .thdFont(.caption)
                        .foregroundStyle(textSecondary)
                }

                VStack(spacing: TokensCoreLight.Spacing2) {
                    DSImageContainer(size: .small) {
                        VStack(spacing: 4) {
                            Image(systemName: "cart")
                            Text("No Image")
                                .font(.caption2)
                        }
                        .foregroundStyle(textSecondary)
                    }
                    Text("Custom")
                        .thdFont(.caption)
                        .foregroundStyle(textSecondary)
                }
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - Content Modes Section

    private var contentModesSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Content Modes",
                description: "How images are scaled within the container."
            )

            HStack(spacing: TokensCoreLight.Spacing4) {
                VStack(spacing: TokensCoreLight.Spacing2) {
                    DSImageContainer(
                        image: Image(systemName: "photo.artframe"),
                        size: .xSmall,
                        contentMode: .fill
                    )
                    Text(".fill")
                        .thdFont(.caption)
                        .foregroundStyle(textSecondary)
                    Text("Fills container")
                        .thdFont(.bodySm)
                        .foregroundStyle(textSecondary)
                }

                VStack(spacing: TokensCoreLight.Spacing2) {
                    DSImageContainer(
                        image: Image(systemName: "photo.artframe"),
                        size: .xSmall,
                        contentMode: .fit
                    )
                    Text(".fit")
                        .thdFont(.caption)
                        .foregroundStyle(textSecondary)
                    Text("Fits within")
                        .thdFont(.bodySm)
                        .foregroundStyle(textSecondary)
                }
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - Usage Examples Section

    private var usageExamplesSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Usage Examples",
                description: "Common use cases for image containers."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                Text("Product List Item")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                HStack(spacing: 12) {
                    DSImageContainer(
                        image: Image(systemName: "hammer.fill"),
                        size: .xxSmall,
                        contentMode: .fit
                    )

                    VStack(alignment: .leading, spacing: 2) {
                        Text("DEWALT 20V MAX Drill")
                            .thdFont(.bodySm)
                            .foregroundStyle(textPrimary)
                        Text("$129.99")
                            .thdFont(.bodySm)
                            .foregroundStyle(textSecondary)
                    }

                    Spacer()
                }
                .padding(12)
                .background(surfaceGreige)
                .clipShape(.rect(cornerRadius: 8))

                Text("Category Grid")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ], spacing: 12) {
                    ForEach(["hammer", "wrench", "screwdriver", "paintbrush", "scissors", "ruler"], id: \.self) { icon in
                        VStack(spacing: 8) {
                            DSImageContainer(
                                image: Image(systemName: "\(icon).fill"),
                                size: .micro,
                                contentMode: .fit
                            )
                            Text(icon.capitalized)
                                .thdFont(.caption)
                                .foregroundStyle(textSecondary)
                        }
                    }
                }

                Text("Avatar Row")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                HStack(spacing: -8) {
                    ForEach(0..<5, id: \.self) { index in
                        DSImageContainer(
                            image: Image(systemName: "person.circle.fill"),
                            size: .nano,
                            contentMode: .fit
                        )
                        .overlay(
                            Circle()
                                .stroke(surfaceWhite, lineWidth: 2)
                        )
                    }

                    Text("+12")
                        .thdFont(.caption)
                        .foregroundStyle(textSecondary)
                        .padding(.leading, 12)
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
                Text("Size Dimensions")
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)

                ForEach(DSImageContainerSize.allCases, id: \.self) { size in
                    specRow(
                        label: sizeName(size),
                        value: "\(Int(size.dimension))pt × \(Int(size.dimension))pt, r\(Int(size.cornerRadius))"
                    )
                }

                Text("Code Examples")
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)
                    .padding(.top, TokensCoreLight.Spacing2)

                Text("""
                // With SwiftUI Image
                DSImageContainer(
                    image: Image("product"),
                    size: .medium,
                    contentMode: .fill
                )

                // With URL (async loading)
                DSImageContainer(
                    url: imageURL,
                    size: .large
                )

                // With custom placeholder
                DSImageContainer(
                    url: imageURL,
                    size: .small
                ) {
                    ProgressView()
                }

                // Placeholder only
                DSImageContainer(size: .xSmall)
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

    private func sizeName(_ size: DSImageContainerSize) -> String {
        switch size {
        case .pico: return ".pico"
        case .nano: return ".nano"
        case .micro: return ".micro"
        case .xxSmall: return ".xxSmall"
        case .xSmall: return ".xSmall"
        case .small: return ".small"
        case .medium: return ".medium"
        case .large: return ".large"
        case .xLarge: return ".xLarge"
        case .xxLarge: return ".xxLarge"
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
    private var iconWarning: Color { tokens.Brand400 }
}

// MARK: - Token Protocol Helper

private protocol TokenSemanticProtocol {
    static var TextOnContainerColorPrimary: Color { get }
    static var TextOnContainerColorSecondary: Color { get }
    static var BackgroundContainerColorWhite: Color { get }
    static var BackgroundSurfaceColorGreige: Color { get }
    static var Brand400: Color { get }
}

extension TokensSemanticLight: TokenSemanticProtocol {}
extension TokensSemanticDark: TokenSemanticProtocol {}

// MARK: - Preview

#Preview {
    DSImageContainerView()
}
