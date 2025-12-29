import SwiftUI

// MARK: - DSImageContainer

/// A responsive image container component with predefined sizes.
///
/// DSImageContainer provides 8 standardized sizes for displaying images
/// consistently across the app. Images fill their container using aspectRatio(.fill)
/// to maintain proper aspect ratios.
///
/// Example usage:
/// ```swift
/// DSImageContainer(
///     image: Image("product"),
///     size: .large
/// )
/// ```
public struct DSImageContainer: View {
    // MARK: Lifecycle

    /// Creates a DSImageContainer with the specified image and size.
    public init(
        image: Image,
        size: Size = .large,
        contentMode: ContentMode = .fill
    ) {
        self.image = image
        self.size = size
        self.contentMode = contentMode
    }

    // MARK: Public

    /// Image container size variants
    public enum Size: CaseIterable {
        case xxLarge
        case xLarge
        case large
        case medium
        case small
        case xSmall
        case xxSmall
        case micro

        // MARK: Internal

        /// Container dimensions (square containers)
        var dimension: CGFloat {
            switch self {
            case .xxLarge: 320
            case .xLarge: 240
            case .large: 160
            case .medium: 120
            case .small: 80
            case .xSmall: 64
            case .xxSmall: 48
            case .micro: 32
            }
        }
    }

    /// Content mode for image display
    public enum ContentMode {
        case fill
        case fit
    }

    public var body: some View {
        imageView
            .frame(width: size.dimension, height: size.dimension)
            .clipped()
    }

    // MARK: Private

    private let image: Image
    private let size: Size
    private let contentMode: ContentMode

    @ViewBuilder
    private var imageView: some View {
        switch contentMode {
        case .fill:
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
        case .fit:
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

// MARK: - Factory Methods

extension DSImageContainer {
    /// Creates an extra-extra-large image container (320x320).
    public static func xxLarge(_ image: Image) -> DSImageContainer {
        DSImageContainer(image: image, size: .xxLarge)
    }

    /// Creates an extra-large image container (240x240).
    public static func xLarge(_ image: Image) -> DSImageContainer {
        DSImageContainer(image: image, size: .xLarge)
    }

    /// Creates a large image container (160x160).
    public static func large(_ image: Image) -> DSImageContainer {
        DSImageContainer(image: image, size: .large)
    }

    /// Creates a medium image container (120x120).
    public static func medium(_ image: Image) -> DSImageContainer {
        DSImageContainer(image: image, size: .medium)
    }

    /// Creates a small image container (80x80).
    public static func small(_ image: Image) -> DSImageContainer {
        DSImageContainer(image: image, size: .small)
    }

    /// Creates an extra-small image container (64x64).
    public static func xSmall(_ image: Image) -> DSImageContainer {
        DSImageContainer(image: image, size: .xSmall)
    }

    /// Creates an extra-extra-small image container (48x48).
    public static func xxSmall(_ image: Image) -> DSImageContainer {
        DSImageContainer(image: image, size: .xxSmall)
    }

    /// Creates a micro image container (32x32).
    public static func micro(_ image: Image) -> DSImageContainer {
        DSImageContainer(image: image, size: .micro)
    }
}
