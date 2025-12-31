import SwiftUI

// MARK: - DSGalleryTab

/// Tab types for the gallery component matching Figma specs.
public enum DSGalleryTab: String, CaseIterable, Identifiable, Sendable {
    /// Product images tab
    case images = "Images"
    /// Product videos tab
    case videos = "Videos"
    /// 360-degree view tab
    case view360 = "360°"
    /// Augmented reality tab
    case ar = "AR"
    /// Customer-submitted images tab
    case customerImages = "Reviews"

    public var id: String { rawValue }

    var icon: String {
        switch self {
        case .images: return "photo"
        case .videos: return "play.circle"
        case .view360: return "arrow.triangle.2.circlepath"
        case .ar: return "arkit"
        case .customerImages: return "star"
        }
    }
}

// MARK: - DSGalleryImage

/// Represents an image in the gallery.
public struct DSGalleryImage: Identifiable, Equatable, Sendable {
    public let id: String
    public let url: URL?
    public let image: Image?
    public let thumbnail: Image?
    public let isVideo: Bool
    public let videoDuration: String?

    public init(
        id: String = UUID().uuidString,
        url: URL? = nil,
        image: Image? = nil,
        thumbnail: Image? = nil,
        isVideo: Bool = false,
        videoDuration: String? = nil
    ) {
        self.id = id
        self.url = url
        self.image = image
        self.thumbnail = thumbnail
        self.isVideo = isVideo
        self.videoDuration = videoDuration
    }

    public static func == (lhs: DSGalleryImage, rhs: DSGalleryImage) -> Bool {
        lhs.id == rhs.id
    }
}

// MARK: - DSGallery

/// A product image gallery component with multiple view modes.
///
/// DSGallery displays product images, videos, 360° views, AR previews, and customer images
/// using a tabbed interface. It integrates with DSTabGroup for navigation and DSImageContainer
/// for image display.
///
/// Example usage:
/// ```swift
/// let images = [
///     DSGalleryImage(image: Image("product1")),
///     DSGalleryImage(image: Image("product2")),
///     DSGalleryImage(image: Image("product3"), isVideo: true, videoDuration: "2:30")
/// ]
///
/// DSGallery(
///     images: images,
///     selectedTab: $selectedTab
/// )
/// ```
public struct DSGallery: View {
    // MARK: - Properties

    private let images: [DSGalleryImage]
    private let videos: [DSGalleryImage]
    private let customerImages: [DSGalleryImage]
    private let availableTabs: [DSGalleryTab]
    private let has360View: Bool
    private let hasARView: Bool
    @Binding private var selectedTab: DSGalleryTab
    @State private var selectedImageIndex: Int = 0
    private let onImageTap: ((DSGalleryImage) -> Void)?
    private let onVideoPlay: ((DSGalleryImage) -> Void)?
    private let on360ViewTap: (() -> Void)?
    private let onARTap: (() -> Void)?

    // MARK: - Styling

    private var backgroundColor: Color {
        DSGalleryColorHelper.backgroundColor()
    }

    // MARK: - Initializers

    /// Creates a gallery with the specified content.
    /// - Parameters:
    ///   - images: Product images to display.
    ///   - videos: Product videos to display.
    ///   - customerImages: Customer-submitted images.
    ///   - has360View: Whether 360° view is available.
    ///   - hasARView: Whether AR view is available.
    ///   - selectedTab: Binding to the selected tab.
    ///   - onImageTap: Callback when an image is tapped.
    ///   - onVideoPlay: Callback when a video play button is tapped.
    ///   - on360ViewTap: Callback when 360° view is tapped.
    ///   - onARTap: Callback when AR view is tapped.
    public init(
        images: [DSGalleryImage] = [],
        videos: [DSGalleryImage] = [],
        customerImages: [DSGalleryImage] = [],
        has360View: Bool = false,
        hasARView: Bool = false,
        selectedTab: Binding<DSGalleryTab>,
        onImageTap: ((DSGalleryImage) -> Void)? = nil,
        onVideoPlay: ((DSGalleryImage) -> Void)? = nil,
        on360ViewTap: (() -> Void)? = nil,
        onARTap: (() -> Void)? = nil
    ) {
        self.images = images
        self.videos = videos
        self.customerImages = customerImages
        self.has360View = has360View
        self.hasARView = hasARView
        self._selectedTab = selectedTab
        self.onImageTap = onImageTap
        self.onVideoPlay = onVideoPlay
        self.on360ViewTap = on360ViewTap
        self.onARTap = onARTap

        // Determine available tabs based on content
        var tabs: [DSGalleryTab] = []
        if !images.isEmpty { tabs.append(.images) }
        if !videos.isEmpty { tabs.append(.videos) }
        if has360View { tabs.append(.view360) }
        if hasARView { tabs.append(.ar) }
        if !customerImages.isEmpty { tabs.append(.customerImages) }
        self.availableTabs = tabs.isEmpty ? [.images] : tabs
    }

    // MARK: - Body

    public var body: some View {
        VStack(spacing: 0) {
            // Main content area
            mainContentView
                .frame(height: 300)

            // Thumbnail strip (for images tab)
            if selectedTab == .images && images.count > 1 {
                thumbnailStrip
            }

            // Tab navigation
            tabNavigation
        }
        .background(backgroundColor)
    }

    // MARK: - Main Content

    @ViewBuilder
    private var mainContentView: some View {
        switch selectedTab {
        case .images:
            imagesView
        case .videos:
            videosView
        case .view360:
            view360Content
        case .ar:
            arContent
        case .customerImages:
            customerImagesView
        }
    }

    @ViewBuilder
    private var imagesView: some View {
        if images.isEmpty {
            emptyStateView(icon: "photo", message: "No images available")
        } else {
            TabView(selection: $selectedImageIndex) {
                ForEach(Array(images.enumerated()), id: \.element.id) { index, image in
                    galleryImageView(image)
                        .tag(index)
                        .onTapGesture {
                            onImageTap?(image)
                        }
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .automatic))
        }
    }

    @ViewBuilder
    private var videosView: some View {
        if videos.isEmpty {
            emptyStateView(icon: "play.circle", message: "No videos available")
        } else {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(videos) { video in
                        videoThumbnailView(video)
                            .onTapGesture {
                                onVideoPlay?(video)
                            }
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }

    @ViewBuilder
    private var view360Content: some View {
        VStack(spacing: 16) {
            Image(systemName: "arrow.triangle.2.circlepath")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .foregroundStyle(DSGalleryColorHelper.iconColor())

            Text("360° View")
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(DSGalleryColorHelper.textColor())

            Text("Drag to rotate")
                .font(.system(size: 14))
                .foregroundStyle(DSGalleryColorHelper.secondaryTextColor())

            DSButton(
                "Launch 360° View",
                style: .orangeFilled,
                size: .medium
            ) {
                on360ViewTap?()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    @ViewBuilder
    private var arContent: some View {
        VStack(spacing: 16) {
            Image(systemName: "arkit")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .foregroundStyle(DSGalleryColorHelper.iconColor())

            Text("View in Your Space")
                .font(.system(size: 16, weight: .semibold))
                .foregroundStyle(DSGalleryColorHelper.textColor())

            Text("See how this product looks in your room")
                .font(.system(size: 14))
                .foregroundStyle(DSGalleryColorHelper.secondaryTextColor())

            DSButton(
                "Launch AR",
                style: .orangeFilled,
                size: .medium
            ) {
                onARTap?()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    @ViewBuilder
    private var customerImagesView: some View {
        if customerImages.isEmpty {
            emptyStateView(icon: "star", message: "No customer images yet")
        } else {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(customerImages) { image in
                        customerImageThumbnail(image)
                            .onTapGesture {
                                onImageTap?(image)
                            }
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }

    // MARK: - Components

    @ViewBuilder
    private func galleryImageView(_ galleryImage: DSGalleryImage) -> some View {
        Group {
            if let image = galleryImage.image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else if let url = galleryImage.url {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .success(let loadedImage):
                        loadedImage
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    case .failure, .empty:
                        placeholderView
                    @unknown default:
                        placeholderView
                    }
                }
            } else {
                placeholderView
            }
        }
    }

    @ViewBuilder
    private func videoThumbnailView(_ video: DSGalleryImage) -> some View {
        ZStack {
            // Thumbnail
            if let thumbnail = video.thumbnail ?? video.image {
                thumbnail
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 200, height: 150)
                    .clipped()
            } else {
                Rectangle()
                    .fill(DSGalleryColorHelper.placeholderColor())
                    .frame(width: 200, height: 150)
            }

            // Play button overlay
            Circle()
                .fill(Color.black.opacity(0.6))
                .frame(width: 50, height: 50)
                .overlay(
                    Image(systemName: "play.fill")
                        .foregroundStyle(.white)
                        .font(.system(size: 20))
                )

            // Duration badge
            if let duration = video.videoDuration {
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Text(duration)
                            .font(.system(size: 12, weight: .medium))
                            .foregroundStyle(.white)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color.black.opacity(0.7))
                            .cornerRadius(4)
                            .padding(8)
                    }
                }
            }
        }
        .cornerRadius(8)
    }

    @ViewBuilder
    private func customerImageThumbnail(_ image: DSGalleryImage) -> some View {
        Group {
            if let img = image.image {
                img
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } else {
                placeholderView
            }
        }
        .frame(width: 120, height: 120)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }

    @ViewBuilder
    private var thumbnailStrip: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(Array(images.enumerated()), id: \.element.id) { index, image in
                    thumbnailItem(image, isSelected: index == selectedImageIndex)
                        .onTapGesture {
                            withAnimation {
                                selectedImageIndex = index
                            }
                        }
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
        }
        .background(DSGalleryColorHelper.thumbnailStripBackground())
    }

    @ViewBuilder
    private func thumbnailItem(_ galleryImage: DSGalleryImage, isSelected: Bool) -> some View {
        Group {
            if let image = galleryImage.image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } else {
                Rectangle()
                    .fill(DSGalleryColorHelper.placeholderColor())
            }
        }
        .frame(width: 60, height: 60)
        .clipShape(RoundedRectangle(cornerRadius: 4))
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .stroke(isSelected ? DSGalleryColorHelper.selectedBorderColor() : Color.clear, lineWidth: 2)
        )
    }

    @ViewBuilder
    private var placeholderView: some View {
        Rectangle()
            .fill(DSGalleryColorHelper.placeholderColor())
            .overlay(
                Image(systemName: "photo")
                    .foregroundStyle(DSGalleryColorHelper.iconColor())
                    .font(.system(size: 40))
            )
    }

    @ViewBuilder
    private func emptyStateView(icon: String, message: String) -> some View {
        VStack(spacing: 12) {
            Image(systemName: icon)
                .font(.system(size: 40))
                .foregroundStyle(DSGalleryColorHelper.iconColor())

            Text(message)
                .font(.system(size: 14))
                .foregroundStyle(DSGalleryColorHelper.secondaryTextColor())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    // MARK: - Tab Navigation

    @ViewBuilder
    private var tabNavigation: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(availableTabs) { tab in
                    tabButton(tab)
                }
            }
            .padding(.horizontal, 16)
        }
        .padding(.vertical, 12)
        .background(DSGalleryColorHelper.tabBarBackground())
    }

    @ViewBuilder
    private func tabButton(_ tab: DSGalleryTab) -> some View {
        let isSelected = selectedTab == tab

        Button(action: {
            withAnimation {
                selectedTab = tab
            }
        }) {
            VStack(spacing: 4) {
                Image(systemName: tab.icon)
                    .font(.system(size: 20))
                    .foregroundStyle(isSelected ? DSGalleryColorHelper.selectedTabColor() : DSGalleryColorHelper.unselectedTabColor())

                Text(tab.rawValue)
                    .font(.system(size: 12, weight: isSelected ? .semibold : .regular))
                    .foregroundStyle(isSelected ? DSGalleryColorHelper.selectedTabColor() : DSGalleryColorHelper.unselectedTabColor())
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
        }
        .buttonStyle(.plain)
    }
}
