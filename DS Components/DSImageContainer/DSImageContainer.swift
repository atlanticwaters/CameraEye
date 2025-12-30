import SwiftUI

// MARK: - DSImageContainerSize

/// Size variants for DSImageContainer matching Figma specs.
public enum DSImageContainerSize: CaseIterable, Sendable {
    /// Pico size (22pt)
    case pico
    /// Nano size (32pt)
    case nano
    /// Micro size (60pt)
    case micro
    /// XXSmall size (76pt)
    case xxSmall
    /// XSmall size (106pt)
    case xSmall
    /// Small size (148pt)
    case small
    /// Medium size (186pt)
    case medium
    /// Large size (260pt)
    case large
    /// XLarge size (320pt)
    case xLarge
    /// XXLarge size (398pt)
    case xxLarge

    /// The dimension (width and height) for this size.
    public var dimension: CGFloat {
        switch self {
        case .pico: 22
        case .nano: 32
        case .micro: 60
        case .xxSmall: 76
        case .xSmall: 106
        case .small: 148
        case .medium: 186
        case .large: 260
        case .xLarge: 320
        case .xxLarge: 398
        }
    }

    /// The corner radius for this size.
    public var cornerRadius: CGFloat {
        switch self {
        case .pico, .nano: 4
        case .micro, .xxSmall: 6
        case .xSmall, .small: 8
        case .medium, .large: 10
        case .xLarge, .xxLarge: 12
        }
    }
}

// MARK: - DSImageContainer

/// A standardized image container component for displaying images at consistent sizes.
///
/// DSImageContainer provides a square container with predefined sizes matching the design system.
/// It supports loading images from URLs, SwiftUI Image, or displaying a placeholder.
///
/// Example usage:
/// ```swift
/// // With URL
/// DSImageContainer(url: imageURL, size: .medium)
///
/// // With Image
/// DSImageContainer(image: Image("product"), size: .large)
///
/// // Placeholder only
/// DSImageContainer(size: .small)
/// ```
public struct DSImageContainer: View {
    // MARK: - Properties

    private let size: DSImageContainerSize
    private let image: Image?
    private let url: URL?
    private let contentMode: ContentMode
    private let placeholder: AnyView?

    // MARK: - Styling

    private var backgroundColor: Color {
        DSImageContainerColorHelper.backgroundColor()
    }

    private var borderColor: Color {
        DSImageContainerColorHelper.borderColor()
    }

    // MARK: - Initializers

    /// Creates an image container with a SwiftUI Image.
    /// - Parameters:
    ///   - image: The image to display.
    ///   - size: The size of the container.
    ///   - contentMode: How the image should be scaled. Defaults to `.fill`.
    public init(
        image: Image,
        size: DSImageContainerSize,
        contentMode: ContentMode = .fill
    ) {
        self.image = image
        self.size = size
        self.contentMode = contentMode
        self.url = nil
        self.placeholder = nil
    }

    /// Creates an image container with a URL for async loading.
    /// - Parameters:
    ///   - url: The URL to load the image from.
    ///   - size: The size of the container.
    ///   - contentMode: How the image should be scaled. Defaults to `.fill`.
    public init(
        url: URL?,
        size: DSImageContainerSize,
        contentMode: ContentMode = .fill
    ) {
        self.url = url
        self.size = size
        self.contentMode = contentMode
        self.image = nil
        self.placeholder = nil
    }

    /// Creates an image container with a URL for async loading and a custom placeholder.
    /// - Parameters:
    ///   - url: The URL to load the image from.
    ///   - size: The size of the container.
    ///   - contentMode: How the image should be scaled. Defaults to `.fill`.
    ///   - placeholder: Placeholder view while loading.
    public init<Placeholder: View>(
        url: URL?,
        size: DSImageContainerSize,
        contentMode: ContentMode = .fill,
        @ViewBuilder placeholder: () -> Placeholder
    ) {
        self.url = url
        self.size = size
        self.contentMode = contentMode
        self.image = nil
        self.placeholder = AnyView(placeholder())
    }

    /// Creates an empty image container (placeholder only).
    /// - Parameters:
    ///   - size: The size of the container.
    public init(size: DSImageContainerSize) {
        self.size = size
        self.image = nil
        self.url = nil
        self.contentMode = .fill
        self.placeholder = nil
    }

    /// Creates an empty image container with a custom placeholder.
    /// - Parameters:
    ///   - size: The size of the container.
    ///   - placeholder: Custom placeholder view.
    public init<Placeholder: View>(
        size: DSImageContainerSize,
        @ViewBuilder placeholder: () -> Placeholder
    ) {
        self.size = size
        self.image = nil
        self.url = nil
        self.contentMode = .fill
        self.placeholder = AnyView(placeholder())
    }

    // MARK: - Body

    public var body: some View {
        ZStack {
            // Background
            RoundedRectangle(cornerRadius: size.cornerRadius)
                .fill(backgroundColor)

            // Border
            RoundedRectangle(cornerRadius: size.cornerRadius)
                .stroke(borderColor, lineWidth: 1)

            // Content
            contentView
        }
        .frame(width: size.dimension, height: size.dimension)
        .clipShape(RoundedRectangle(cornerRadius: size.cornerRadius))
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(Text("Image"))
    }

    @ViewBuilder
    private var contentView: some View {
        if let image {
            image
                .resizable()
                .aspectRatio(contentMode: contentMode)
        } else if let url {
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    placeholderView
                case .success(let loadedImage):
                    loadedImage
                        .resizable()
                        .aspectRatio(contentMode: contentMode)
                case .failure:
                    placeholderView
                @unknown default:
                    placeholderView
                }
            }
        } else {
            placeholderView
        }
    }

    @ViewBuilder
    private var placeholderView: some View {
        if let placeholder {
            placeholder
        } else {
            DSImageContainerPlaceholder(size: size)
        }
    }
}

// MARK: - DSImageContainerPlaceholder

/// Default placeholder view for image containers.
struct DSImageContainerPlaceholder: View {
    let size: DSImageContainerSize

    private var iconSize: CGFloat {
        size.dimension * 0.4
    }

    var body: some View {
        Image(systemName: "photo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: iconSize, height: iconSize)
            .foregroundColor(DSImageContainerColorHelper.placeholderIconColor())
    }
}
