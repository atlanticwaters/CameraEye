import SwiftUI

// MARK: - Size Previews

#Preview("All Sizes") {
    ScrollView {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 16) {
            ForEach(DSImageContainerSize.allCases, id: \.self) { size in
                VStack(spacing: 8) {
                    DSImageContainer(size: size, placeholder: nil as (() -> EmptyView)?)

                    Text(sizeName(size))
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .padding()
    }
}

#Preview("Pico - 22pt") {
    DSImageContainer(size: .pico, placeholder: nil as (() -> EmptyView)?)
        .padding()
}

#Preview("Nano - 32pt") {
    DSImageContainer(size: .nano, placeholder: nil as (() -> EmptyView)?)
        .padding()
}

#Preview("Micro - 60pt") {
    DSImageContainer(size: .micro, placeholder: nil as (() -> EmptyView)?)
        .padding()
}

#Preview("XXSmall - 76pt") {
    DSImageContainer(size: .xxSmall, placeholder: nil as (() -> EmptyView)?)
        .padding()
}

#Preview("XSmall - 106pt") {
    DSImageContainer(size: .xSmall, placeholder: nil as (() -> EmptyView)?)
        .padding()
}

#Preview("Small - 148pt") {
    DSImageContainer(size: .small, placeholder: nil as (() -> EmptyView)?)
        .padding()
}

#Preview("Medium - 186pt") {
    DSImageContainer(size: .medium, placeholder: nil as (() -> EmptyView)?)
        .padding()
}

#Preview("Large - 260pt") {
    DSImageContainer(size: .large, placeholder: nil as (() -> EmptyView)?)
        .padding()
}

#Preview("XLarge - 320pt") {
    DSImageContainer(size: .xLarge, placeholder: nil as (() -> EmptyView)?)
        .padding()
}

#Preview("XXLarge - 398pt") {
    ScrollView {
        DSImageContainer(size: .xxLarge, placeholder: nil as (() -> EmptyView)?)
            .padding()
    }
}

// MARK: - With Image

#Preview("With System Image") {
    DSImageContainer(
        image: Image(systemName: "star.fill"),
        size: .medium
    )
    .padding()
}

// MARK: - Content Modes

#Preview("Content Mode - Fill") {
    DSImageContainer(
        image: Image(systemName: "photo.artframe"),
        size: .large,
        contentMode: .fill
    )
    .padding()
}

#Preview("Content Mode - Fit") {
    DSImageContainer(
        image: Image(systemName: "photo.artframe"),
        size: .large,
        contentMode: .fit
    )
    .padding()
}

// MARK: - Dark Mode

#Preview("Dark Mode") {
    VStack(spacing: 16) {
        DSImageContainer(size: .medium, placeholder: nil as (() -> EmptyView)?)
        DSImageContainer(size: .large, placeholder: nil as (() -> EmptyView)?)
    }
    .padding()
    .preferredColorScheme(.dark)
}

// MARK: - Custom Placeholder

#Preview("Custom Placeholder") {
    DSImageContainer(size: .large) {
        ProgressView()
    }
    .padding()
}

// MARK: - Helpers

private func sizeName(_ size: DSImageContainerSize) -> String {
    switch size {
    case .pico: "Pico (22)"
    case .nano: "Nano (32)"
    case .micro: "Micro (60)"
    case .xxSmall: "XXSmall (76)"
    case .xSmall: "XSmall (106)"
    case .small: "Small (148)"
    case .medium: "Medium (186)"
    case .large: "Large (260)"
    case .xLarge: "XLarge (320)"
    case .xxLarge: "XXLarge (398)"
    }
}
