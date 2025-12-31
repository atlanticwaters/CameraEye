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
/// - Masonry layout for size visualization

struct DSImageContainerView: View {
    @Environment(\.colorScheme) var colorScheme

    /// Maximum width threshold for displaying items at actual size
    private let maxActualSizeWidth: CGFloat = 120

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
            // All Sizes Masonry Section
            allSizesMasonrySection

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

    // MARK: - All Sizes Masonry Section

    private var allSizesMasonrySection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "All Sizes",
                description: "10 predefined sizes from xxLarge (398pt) to pico (22pt). Large sizes shown as scaled thumbnails."
            )

            // All sizes listed vertically
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                ForEach(DSImageContainerSize.allCases.reversed(), id: \.self) { size in
                    sizeRow(size)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, TokensCoreLight.Spacing6)
        }
        .padding(TokensCoreLight.Spacing4)
    }

    /// Displays a size row - actual size if it fits, scaled to container width if too large
    private func sizeRow(_ size: DSImageContainerSize) -> some View {
        SizeRowView(size: size, borderColor: borderColor, textPrimary: textPrimary, textSecondary: textSecondary, iconWarning: iconWarning, sizeName: sizeName(size))
    }

    // MARK: - Size Groups Section

    private var sizeGroupsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Size Groups",
                description: "Sizes organized by common use cases."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                // Tiny sizes
                groupHeader("Tiny (Icons & Avatars)")
                HStack(spacing: TokensCoreLight.Spacing2) {
                    compactSizeItem(.pico)
                    compactSizeItem(.nano)
                    compactSizeItem(.micro)
                    Spacer()
                }

                // Small sizes
                groupHeader("Small (List Items)")
                HStack(spacing: TokensCoreLight.Spacing2) {
                    compactSizeItem(.xxSmall)
                    compactSizeItem(.xSmall)
                    Spacer()
                }

                // Medium/Large sizes (shown as list)
                groupHeader("Large (Cards & Featured)")
                VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                    sizeRow(.small)
                    sizeRow(.medium)
                    sizeRow(.large)
                    sizeRow(.xLarge)
                    sizeRow(.xxLarge)
                }
                .padding(.horizontal, TokensCoreLight.Spacing6)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(TokensCoreLight.Spacing4)
    }

    @ViewBuilder
    private func groupHeader(_ title: String) -> some View {
        Text(title)
            .thdFont(.caption)
            .foregroundStyle(textSecondary)
    }

    @ViewBuilder
    private func compactSizeItem(_ size: DSImageContainerSize) -> some View {
        VStack(spacing: 4) {
            DSImageContainer(
                image: Image("Acorn"),
                size: size
            )
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
                        image: Image("Acorn"),
                        size: .xxSmall,
                        contentMode: .fill
                    )
                    Text("Photo (Fill)")
                        .thdFont(.caption)
                        .foregroundStyle(textSecondary)
                }

                VStack(spacing: TokensCoreLight.Spacing2) {
                    DSImageContainer(
                        image: Image("Acorn"),
                        size: .xxSmall,
                        contentMode: .fit
                    )
                    Text("Photo (Fit)")
                        .thdFont(.caption)
                        .foregroundStyle(textSecondary)
                }

                VStack(spacing: TokensCoreLight.Spacing2) {
                    DSImageContainer(
                        image: Image(systemName: "paintbrush.fill"),
                        size: .xxSmall,
                        contentMode: .fit
                    )
                    Text("System Icon")
                        .thdFont(.caption)
                        .foregroundStyle(textSecondary)
                }

                Spacer()
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
                    DSImageContainer(size: .xxSmall)
                    Text("Default")
                        .thdFont(.caption)
                        .foregroundStyle(textSecondary)
                }

                VStack(spacing: TokensCoreLight.Spacing2) {
                    DSImageContainer(size: .xxSmall) {
                        ProgressView()
                    }
                    Text("Loading")
                        .thdFont(.caption)
                        .foregroundStyle(textSecondary)
                }

                VStack(spacing: TokensCoreLight.Spacing2) {
                    DSImageContainer(size: .xxSmall) {
                        Image(systemName: "exclamationmark.triangle")
                            .foregroundStyle(iconWarning)
                    }
                    Text("Error")
                        .thdFont(.caption)
                        .foregroundStyle(textSecondary)
                }

                VStack(spacing: TokensCoreLight.Spacing2) {
                    DSImageContainer(size: .xxSmall) {
                        Image(systemName: "cart")
                            .foregroundStyle(textSecondary)
                    }
                    Text("Custom")
                        .thdFont(.caption)
                        .foregroundStyle(textSecondary)
                }

                Spacer()
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
                        image: Image("Acorn"),
                        size: .xxSmall,
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
                        image: Image("Acorn"),
                        size: .xxSmall,
                        contentMode: .fit
                    )
                    Text(".fit")
                        .thdFont(.caption)
                        .foregroundStyle(textSecondary)
                    Text("Fits within")
                        .thdFont(.bodySm)
                        .foregroundStyle(textSecondary)
                }

                Spacer()
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
                        image: Image("Acorn"),
                        size: .xxSmall,
                        contentMode: .fill
                    )

                    VStack(alignment: .leading, spacing: 2) {
                        Text("Premium Acorn Seeds")
                            .thdFont(.bodySm)
                            .foregroundStyle(textPrimary)
                        Text("$12.99")
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

                Text("Photo Gallery")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                HStack(spacing: TokensCoreLight.Spacing2) {
                    ForEach(0..<4, id: \.self) { _ in
                        DSImageContainer(
                            image: Image("Acorn"),
                            size: .nano
                        )
                    }

                    Text("+8")
                        .thdFont(.caption)
                        .foregroundStyle(textSecondary)
                        .padding(.leading, 4)
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
                .frame(maxWidth: .infinity, alignment: .leading)
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
    private var borderColor: Color { DSImageContainerColorHelper.borderColor() }
}

// MARK: - Size Row View

/// A separate view struct to properly handle GeometryReader sizing
private struct SizeRowView: View {
    let size: DSImageContainerSize
    let borderColor: Color
    let textPrimary: Color
    let textSecondary: Color
    let iconWarning: Color
    let sizeName: String

    /// Maximum display size to prevent blowing out the layout
    private let maxDisplaySize: CGFloat = 200

    private var displaySize: CGFloat {
        min(size.dimension, maxDisplaySize)
    }

    private var isScaled: Bool {
        size.dimension > maxDisplaySize
    }

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            // Info row
            HStack(spacing: TokensCoreLight.Spacing2) {
                Text(sizeName)
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)

                Text("\(Int(size.dimension))pt × \(Int(size.dimension))pt")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                if isScaled {
                    Text("(scaled to \(Int(displaySize))pt)")
                        .thdFont(.caption)
                        .foregroundStyle(iconWarning)
                }

                Spacer()
            }

            // Image at actual size or capped at max display size
            Image("Acorn")
                .resizable()
                .scaledToFill()
                .frame(width: displaySize, height: displaySize)
                .clipShape(.rect(cornerRadius: size.cornerRadius))
                .overlay(
                    RoundedRectangle(cornerRadius: size.cornerRadius)
                        .stroke(borderColor, lineWidth: 1)
                )
                .overlay(alignment: .topTrailing) {
                    if isScaled {
                        Image(systemName: "arrow.down.right.and.arrow.up.left")
                            .font(.system(size: 10))
                            .foregroundStyle(.white)
                            .padding(4)
                            .background(Color.black.opacity(0.6))
                            .clipShape(.rect(cornerRadius: 4))
                            .padding(6)
                    }
                }
        }
    }
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
