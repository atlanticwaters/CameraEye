import SwiftUI

#if DEBUG

// MARK: - Sample Data

private let sampleImages: [DSGalleryImage] = [
    DSGalleryImage(id: "1", image: Image(systemName: "hammer.fill")),
    DSGalleryImage(id: "2", image: Image(systemName: "wrench.fill")),
    DSGalleryImage(id: "3", image: Image(systemName: "screwdriver.fill")),
    DSGalleryImage(id: "4", image: Image(systemName: "paintbrush.fill")),
]

private let sampleVideos: [DSGalleryImage] = [
    DSGalleryImage(id: "v1", image: Image(systemName: "video.fill"), isVideo: true, videoDuration: "2:30"),
    DSGalleryImage(id: "v2", image: Image(systemName: "video.fill"), isVideo: true, videoDuration: "1:45"),
]

private let sampleCustomerImages: [DSGalleryImage] = [
    DSGalleryImage(id: "c1", image: Image(systemName: "person.crop.square.fill")),
    DSGalleryImage(id: "c2", image: Image(systemName: "person.crop.square.fill")),
    DSGalleryImage(id: "c3", image: Image(systemName: "person.crop.square.fill")),
]

// MARK: - Preview Container

struct GalleryPreviewContainer: View {
    @State private var selectedTab: DSGalleryTab = .images

    let images: [DSGalleryImage]
    let videos: [DSGalleryImage]
    let customerImages: [DSGalleryImage]
    let has360View: Bool
    let hasARView: Bool

    var body: some View {
        DSGallery(
            images: images,
            videos: videos,
            customerImages: customerImages,
            has360View: has360View,
            hasARView: hasARView,
            selectedTab: $selectedTab,
            onImageTap: { image in
                print("Image tapped: \(image.id)")
            },
            onVideoPlay: { video in
                print("Video play: \(video.id)")
            },
            on360ViewTap: {
                print("360 view tapped")
            },
            onARTap: {
                print("AR tapped")
            }
        )
    }
}

// MARK: - Previews

#Preview("Full Gallery") {
    GalleryPreviewContainer(
        images: sampleImages,
        videos: sampleVideos,
        customerImages: sampleCustomerImages,
        has360View: true,
        hasARView: true
    )
}

#Preview("Images Only") {
    GalleryPreviewContainer(
        images: sampleImages,
        videos: [],
        customerImages: [],
        has360View: false,
        hasARView: false
    )
}

#Preview("Images and Videos") {
    GalleryPreviewContainer(
        images: sampleImages,
        videos: sampleVideos,
        customerImages: [],
        has360View: false,
        hasARView: false
    )
}

#Preview("With 360 and AR") {
    GalleryPreviewContainer(
        images: sampleImages,
        videos: [],
        customerImages: [],
        has360View: true,
        hasARView: true
    )
}

#Preview("Customer Images") {
    GalleryPreviewContainer(
        images: sampleImages,
        videos: [],
        customerImages: sampleCustomerImages,
        has360View: false,
        hasARView: false
    )
}

#Preview("Empty Gallery") {
    GalleryPreviewContainer(
        images: [],
        videos: [],
        customerImages: [],
        has360View: false,
        hasARView: false
    )
}

#Preview("Dark Mode") {
    GalleryPreviewContainer(
        images: sampleImages,
        videos: sampleVideos,
        customerImages: sampleCustomerImages,
        has360View: true,
        hasARView: true
    )
    .preferredColorScheme(.dark)
}

#Preview("Single Image") {
    GalleryPreviewContainer(
        images: [DSGalleryImage(id: "1", image: Image(systemName: "hammer.fill"))],
        videos: [],
        customerImages: [],
        has360View: false,
        hasARView: false
    )
}

#endif
