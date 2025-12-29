import SwiftUI

// MARK: - DSImageContainer Previews

// All Sizes Preview
#Preview("All Sizes") {
    ScrollView {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(DSImageContainer.Size.allCases, id: \.self) { size in
                VStack(alignment: .leading, spacing: 8) {
                    Text("\(sizeLabel(size)) - \(Int(size.dimension))x\(Int(size.dimension))")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    DSImageContainer(
                        image: Image(systemName: "photo.fill"),
                        size: size
                    )
                    .background(Color.gray.opacity(0.1))
                    .overlay(
                        RoundedRectangle(cornerRadius: 0)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    )
                }
            }
        }
        .padding()
    }
}

// Individual Size Previews
#Preview("XXLarge (320x320)") {
    DSImageContainer.xxLarge(Image(systemName: "photo.fill"))
        .padding()
}

#Preview("XLarge (240x240)") {
    DSImageContainer.xLarge(Image(systemName: "photo.fill"))
        .padding()
}

#Preview("Large (160x160)") {
    DSImageContainer.large(Image(systemName: "photo.fill"))
        .padding()
}

#Preview("Medium (120x120)") {
    DSImageContainer.medium(Image(systemName: "photo.fill"))
        .padding()
}

#Preview("Small (80x80)") {
    DSImageContainer.small(Image(systemName: "photo.fill"))
        .padding()
}

#Preview("XSmall (64x64)") {
    DSImageContainer.xSmall(Image(systemName: "photo.fill"))
        .padding()
}

#Preview("XXSmall (48x48)") {
    DSImageContainer.xxSmall(Image(systemName: "photo.fill"))
        .padding()
}

#Preview("Micro (32x32)") {
    DSImageContainer.micro(Image(systemName: "photo.fill"))
        .padding()
}

// Content Mode Comparison
#Preview("Content Modes") {
    VStack(spacing: 24) {
        VStack(spacing: 8) {
            Text("Fill (default)")
                .font(.headline)
            DSImageContainer(
                image: Image(systemName: "photo.fill"),
                size: .large,
                contentMode: .fill
            )
            .background(Color.gray.opacity(0.1))
        }
        
        VStack(spacing: 8) {
            Text("Fit")
                .font(.headline)
            DSImageContainer(
                image: Image(systemName: "photo.fill"),
                size: .large,
                contentMode: .fit
            )
            .background(Color.gray.opacity(0.1))
        }
    }
    .padding()
}

// Grid Layout Example
#Preview("Grid Layout") {
    ScrollView {
        LazyVGrid(columns: [
            GridItem(.adaptive(minimum: 80))
        ], spacing: 16) {
            ForEach(0..<12, id: \.self) { _ in
                DSImageContainer.small(Image(systemName: "photo.fill"))
                    .background(Color.gray.opacity(0.1))
            }
        }
        .padding()
    }
}

// MARK: - Helper Functions

private func sizeLabel(_ size: DSImageContainer.Size) -> String {
    switch size {
    case .xxLarge: return "XXLarge"
    case .xLarge: return "XLarge"
    case .large: return "Large"
    case .medium: return "Medium"
    case .small: return "Small"
    case .xSmall: return "XSmall"
    case .xxSmall: return "XXSmall"
    case .micro: return "Micro"
    }
}
