import SwiftUI

// MARK: - DSGallery Showcase View

/// Comprehensive showcase of the DSGallery component.
///
/// Demonstrates:
/// - Tab navigation (Images, Videos, 360°, AR, Reviews)
/// - Image carousel with page indicators
/// - Thumbnail strip navigation
/// - Video thumbnails with play buttons
/// - 360° and AR view placeholders
/// - Customer review images
/// - Interactive tab switching

struct DSGalleryView: View {
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
            Text("DSGallery")
                .thdFont(.h3)
                .foregroundStyle(textPrimary)

            Text("A product image gallery component with multiple view modes. Displays product images, videos, 360° views, AR previews, and customer images using a tabbed interface.")
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
            // Gallery Tabs Section
            galleryTabsSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Images Tab Section
            imagesTabSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Videos Tab Section
            videosTabSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // 360° and AR Section
            specialViewsSection

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

    // MARK: - Gallery Tabs Section

    private var galleryTabsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Gallery Tabs",
                description: "Available tab types for different content."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                ForEach(DSGalleryTab.allCases) { tab in
                    HStack(spacing: TokensCoreLight.Spacing3) {
                        Image(systemName: tab.icon)
                            .frame(width: TokensCoreLight.Spacing6, height: TokensCoreLight.Spacing6)
                            .foregroundStyle(textSecondary)

                        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2px) {
                            Text(tab.rawValue)
                                .thdFont(.bodySm)
                                .foregroundStyle(textPrimary)

                            Text(tabDescription(tab))
                                .thdFont(.bodySm)
                                .foregroundStyle(textSecondary)
                        }
                    }
                }
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    private func tabDescription(_ tab: DSGalleryTab) -> String {
        switch tab {
        case .images: return "Product images tab"
        case .videos: return "Product videos with play overlay"
        case .view360: return "360-degree interactive view"
        case .ar: return "Augmented reality preview"
        case .customerImages: return "Customer-submitted review images"
        }
    }

    // MARK: - Images Tab Section

    private var imagesTabSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Images Tab",
                description: "Main product images with thumbnail strip and page indicators."
            )

            DSGalleryImagesDemo()
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - Videos Tab Section

    private var videosTabSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Videos Tab",
                description: "Video thumbnails with play buttons and duration badges."
            )

            DSGalleryVideosDemo()
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - Special Views Section

    private var specialViewsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "360° and AR Views",
                description: "Special interactive view modes for immersive product exploration."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                Text("360° View")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                RoundedRectangle(cornerRadius: TokensCoreLight.Spacing2)
                    .fill(surfaceGreige)
                    .frame(height: TokensCoreLight.Spacing35 + TokensCoreLight.Spacing3)
                    .overlay(
                        VStack(spacing: TokensCoreLight.Spacing2) {
                            Image(systemName: "arrow.triangle.2.circlepath")
                                .thdFont(.hero3)
                            Text("360° View")
                                .thdFont(.bodySm)
                            Text("Drag to rotate")
                                .thdFont(.bodySm)
                                .foregroundStyle(textSecondary)
                        }
                        .foregroundStyle(textPrimary)
                    )

                Text("AR View")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                RoundedRectangle(cornerRadius: TokensCoreLight.Spacing2)
                    .fill(surfaceGreige)
                    .frame(height: TokensCoreLight.Spacing35 + TokensCoreLight.Spacing3)
                    .overlay(
                        VStack(spacing: TokensCoreLight.Spacing2) {
                            Image(systemName: "arkit")
                                .thdFont(.hero3)
                            Text("View in Your Space")
                                .thdFont(.bodySm)
                            Text("See how it looks in your room")
                                .thdFont(.bodySm)
                                .foregroundStyle(textSecondary)
                        }
                        .foregroundStyle(textPrimary)
                    )
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - Interactive Section

    private var interactiveSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Interactive Example",
                description: "Full gallery component with tab navigation."
            )

            DSGalleryInteractiveExample()
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - Usage Examples Section

    private var usageExamplesSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Usage Examples",
                description: "Real-world gallery implementations."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                Text("Product Detail Page")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                Text("The gallery component is typically placed at the top of a product detail page, showing all available media types (images, videos, 360°, AR) for the product.")
                    .thdFont(.bodySm)
                    .foregroundStyle(textSecondary)

                Text("Key Features:")
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)
                    .padding(.top, TokensCoreLight.Spacing2)

                VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                    featureRow(icon: "hand.draw", text: "Swipe between images")
                    featureRow(icon: "hand.tap", text: "Tap thumbnails to jump")
                    featureRow(icon: "play.circle", text: "Tap videos to play")
                    featureRow(icon: "arrow.triangle.2.circlepath", text: "Drag to rotate 360° view")
                    featureRow(icon: "arkit", text: "Launch AR experience")
                }
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    @ViewBuilder
    private func featureRow(icon: String, text: String) -> some View {
        HStack(spacing: TokensCoreLight.Spacing2) {
            Image(systemName: icon)
                .frame(width: TokensCoreLight.Spacing5)
                .foregroundStyle(textSecondary)
            Text(text)
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
        }
    }

    // MARK: - Specifications Section

    private var specificationsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Specifications",
                description: "Technical details and code examples."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                specRow(label: "Main Content Height", value: "300pt")
                specRow(label: "Thumbnail Size", value: "60pt × 60pt")
                specRow(label: "Video Thumbnail", value: "200pt × 150pt")
                specRow(label: "Customer Image", value: "120pt × 120pt")

                Text("DSGalleryImage Properties")
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)
                    .padding(.top, TokensCoreLight.Spacing2)

                VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                    Text("• id: String")
                    Text("• url: URL?")
                    Text("• image: Image?")
                    Text("• thumbnail: Image?")
                    Text("• isVideo: Bool")
                    Text("• videoDuration: String?")
                }
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)

                Text("Code Example")
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)
                    .padding(.top, TokensCoreLight.Spacing2)

                Text("""
                @State private var selectedTab: DSGalleryTab = .images

                let images = [
                    DSGalleryImage(image: Image("product1")),
                    DSGalleryImage(image: Image("product2")),
                ]

                let videos = [
                    DSGalleryImage(
                        image: Image("video-thumb"),
                        isVideo: true,
                        videoDuration: "2:30"
                    )
                ]

                DSGallery(
                    images: images,
                    videos: videos,
                    has360View: true,
                    hasARView: true,
                    selectedTab: $selectedTab,
                    onImageTap: { image in },
                    onVideoPlay: { video in },
                    on360ViewTap: { },
                    onARTap: { }
                )
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

    // MARK: - Theme-Aware Colors

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    private var surfaceWhite: Color { tokens.BackgroundContainerColorWhite }
    private var surfaceGreige: Color { tokens.BackgroundSurfaceColorGreige }
    private var textPrimary: Color { tokens.TextOnContainerColorPrimary }
    private var textSecondary: Color { tokens.TextOnContainerColorSecondary }
}

// MARK: - Images Demo

private struct DSGalleryImagesDemo: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var selectedIndex = 0

    private var sampleImages: [Color] {
        [
            tokens.BackgroundAccentColorBlue.opacity(0.5),
            tokens.BackgroundAccentColorGreen.opacity(0.5),
            tokens.Brand400.opacity(0.5),
            tokens.Greige300.opacity(0.5)
        ]
    }

    var body: some View {
        VStack(spacing: TokensCoreLight.Spacing3) {
            // Main image area
            TabView(selection: $selectedIndex) {
                ForEach(sampleImages.indices, id: \.self) { index in
                    RoundedRectangle(cornerRadius: TokensCoreLight.Spacing2)
                        .fill(sampleImages[index])
                        .overlay(
                            Text("Image \(index + 1)")
                                .thdFont(.h5)
                        )
                        .tag(index)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .automatic))
            .containerRelativeFrame(.vertical) { size, _ in
                size * 0.25
            }

            // Thumbnail strip
            HStack(spacing: TokensCoreLight.Spacing2) {
                ForEach(sampleImages.indices, id: \.self) { index in
                    Button {
                        withAnimation {
                            selectedIndex = index
                        }
                    } label: {
                        RoundedRectangle(cornerRadius: TokensCoreLight.Spacing1)
                            .fill(sampleImages[index])
                            .frame(width: TokensCoreLight.Spacing12 + TokensCoreLight.Spacing2px, height: TokensCoreLight.Spacing12 + TokensCoreLight.Spacing2px)
                            .overlay(
                                RoundedRectangle(cornerRadius: TokensCoreLight.Spacing1)
                                    .stroke(selectedIndex == index ? tokens.Brand400 : Color.clear, lineWidth: 2)
                            )
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }
}

// MARK: - Videos Demo

private struct DSGalleryVideosDemo: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: TokensCoreLight.Spacing3) {
                ForEach(0..<3, id: \.self) { index in
                    ZStack {
                        RoundedRectangle(cornerRadius: TokensCoreLight.Spacing2)
                            .fill(tokens.BackgroundContainerColorTransparent20)
                            .containerRelativeFrame(.horizontal) { size, _ in
                                size * 0.4
                            }
                            .aspectRatio(4/3, contentMode: .fit)

                        // Play button
                        Circle()
                            .fill(tokens.BackgroundSurfaceColorInverse)
                            .frame(width: TokensCoreLight.Spacing10, height: TokensCoreLight.Spacing10)
                            .overlay(
                                Image(systemName: "play.fill")
                                    .foregroundStyle(tokens.NeutralsWhite)
                            )

                        // Duration badge
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                Text("\(index + 1):30")
                                    .thdFont(.caption)
                                    .foregroundStyle(tokens.NeutralsWhite)
                                    .padding(.horizontal, TokensCoreLight.Spacing2)
                                    .padding(.vertical, TokensCoreLight.Spacing2px)
                                    .background(tokens.BackgroundSurfaceColorInverse)
                                    .clipShape(.rect(cornerRadius: TokensCoreLight.Spacing1))
                                    .padding(TokensCoreLight.Spacing2)
                            }
                        }
                    }
                }
            }
        }
        .scrollIndicators(.hidden)
    }

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }
}

// MARK: - Interactive Example

private struct DSGalleryInteractiveExample: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var selectedTab: DSGalleryTab = .images

    private var sampleImages: [DSGalleryImage] {
        [
            DSGalleryImage(id: "1", image: Image(systemName: "wrench.and.screwdriver")),
            DSGalleryImage(id: "2", image: Image(systemName: "hammer")),
            DSGalleryImage(id: "3", image: Image(systemName: "screwdriver"))
        ]
    }

    private var sampleVideos: [DSGalleryImage] {
        [
            DSGalleryImage(id: "v1", image: Image(systemName: "play.rectangle"), isVideo: true, videoDuration: "2:30"),
            DSGalleryImage(id: "v2", image: Image(systemName: "play.rectangle"), isVideo: true, videoDuration: "1:45")
        ]
    }

    var body: some View {
        VStack(spacing: 0) {
            DSGallery(
                images: sampleImages,
                videos: sampleVideos,
                has360View: true,
                hasARView: true,
                selectedTab: $selectedTab,
                onImageTap: { _ in },
                onVideoPlay: { _ in },
                on360ViewTap: { },
                onARTap: { }
            )
            .containerRelativeFrame(.vertical) { size, _ in
                size * 0.5
            }
            .clipShape(.rect(cornerRadius: TokensCoreLight.Spacing2))
        }
    }
}

// MARK: - Token Protocol Helper

private protocol TokenSemanticProtocol {
    static var TextOnContainerColorPrimary: Color { get }
    static var TextOnContainerColorSecondary: Color { get }
    static var BackgroundContainerColorWhite: Color { get }
    static var BackgroundSurfaceColorGreige: Color { get }
    static var BackgroundContainerColorTransparent20: Color { get }
    static var BackgroundSurfaceColorInverse: Color { get }
    static var BackgroundAccentColorBlue: Color { get }
    static var BackgroundAccentColorGreen: Color { get }
    static var Brand400: Color { get }
    static var NeutralsWhite: Color { get }
    static var Greige300: Color { get }
}

extension TokensSemanticLight: TokenSemanticProtocol {}
extension TokensSemanticDark: TokenSemanticProtocol {}

// MARK: - Preview

#Preview {
    DSGalleryView()
}
