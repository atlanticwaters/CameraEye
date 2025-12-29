import SwiftUI

// MARK: - DSIconButton Previews

//
// These previews mirror the snapshot tests exactly.
// Each snapshot test has corresponding Light and Dark previews.

// MARK: - All Variants (testAllVariants)

#Preview("All Variants - Light") {
    AllVariantsPreview()
        .preferredColorScheme(.light)
}

#Preview("All Variants - Dark") {
    AllVariantsPreview()
        .preferredColorScheme(.dark)
}

// MARK: - All Sizes (testAllSizes)

#Preview("All Sizes - Light") {
    AllSizesPreview()
        .preferredColorScheme(.light)
}

#Preview("All Sizes - Dark") {
    AllSizesPreview()
        .preferredColorScheme(.dark)
}

// MARK: - States (testStates)

#Preview("States - Light") {
    StatesPreview()
        .preferredColorScheme(.light)
}

#Preview("States - Dark") {
    StatesPreview()
        .preferredColorScheme(.dark)
}

// MARK: - Size Style Matrix (testSizeStyleMatrix)

#Preview("Size Style Matrix - Light") {
    SizeStyleMatrixPreview()
        .preferredColorScheme(.light)
}

#Preview("Size Style Matrix - Dark") {
    SizeStyleMatrixPreview()
        .preferredColorScheme(.dark)
}

// MARK: - Disabled Variants (testDisabledVariants)

#Preview("Disabled Variants - Light") {
    DisabledVariantsPreview()
        .preferredColorScheme(.light)
}

#Preview("Disabled Variants - Dark") {
    DisabledVariantsPreview()
        .preferredColorScheme(.dark)
}

// MARK: - Loading Variants (testLoadingVariants)

#Preview("Loading Variants - Light") {
    LoadingVariantsPreview()
        .preferredColorScheme(.light)
}

#Preview("Loading Variants - Dark") {
    LoadingVariantsPreview()
        .preferredColorScheme(.dark)
}

// MARK: - Different Icons (testDifferentIcons)

#Preview("Different Icons - Light") {
    DifferentIconsPreview()
        .preferredColorScheme(.light)
}

#Preview("Different Icons - Dark") {
    DifferentIconsPreview()
        .preferredColorScheme(.dark)
}

// MARK: - AllVariantsPreview

private struct AllVariantsPreview: View {
    var body: some View {
        VStack(spacing: 16) {
            ForEach(DSIconButtonStyle.allCases, id: \.self) { style in
                HStack {
                    Text(String(describing: style))
                        .font(.caption)
                        .frame(width: 100, alignment: .leading)
                    DSIconButton(dsIcon: .heartFilled, style: style) {
                    }
                }
            }
        }
        .padding()
    }
}

// MARK: - AllSizesPreview

private struct AllSizesPreview: View {
    var body: some View {
        VStack(spacing: 16) {
            ForEach(DSIconButtonSize.allCases, id: \.self) { size in
                HStack {
                    Text(String(describing: size))
                        .font(.caption)
                        .frame(width: 100, alignment: .leading)
                    DSIconButton(dsIcon: .heartFilled, size: size) {
                    }
                }
            }
        }
        .padding()
    }
}

// MARK: - StatesPreview

private struct StatesPreview: View {
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text("Default")
                    .font(.caption)
                    .frame(width: 100, alignment: .leading)
                DSIconButton(dsIcon: .heartFilled) {
                }
            }
            HStack {
                Text("Disabled")
                    .font(.caption)
                    .frame(width: 100, alignment: .leading)
                DSIconButton(dsIcon: .heartFilled, isDisabled: true) {
                }
            }
            HStack {
                Text("Loading")
                    .font(.caption)
                    .frame(width: 100, alignment: .leading)
                DSIconButton(dsIcon: .heartFilled, isLoading: true) {
                }
            }
        }
        .padding()
    }
}

// MARK: - SizeStyleMatrixPreview

private struct SizeStyleMatrixPreview: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                ForEach(DSIconButtonSize.allCases, id: \.self) { size in
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Size: \(String(describing: size))")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        HStack(spacing: 8) {
                            ForEach(DSIconButtonStyle.allCases, id: \.self) { style in
                                DSIconButton(dsIcon: .heartFilled, style: style, size: size) {
                                }
                            }
                        }
                    }
                }
            }
            .padding()
        }
    }
}

// MARK: - DisabledVariantsPreview

private struct DisabledVariantsPreview: View {
    var body: some View {
        VStack(spacing: 16) {
            ForEach(DSIconButtonStyle.allCases, id: \.self) { style in
                HStack {
                    Text("\(String(describing: style)) (disabled)")
                        .font(.caption)
                        .frame(width: 150, alignment: .leading)
                    DSIconButton(dsIcon: .heartFilled, style: style, isDisabled: true) {
                    }
                }
            }
        }
        .padding()
    }
}

// MARK: - LoadingVariantsPreview

private struct LoadingVariantsPreview: View {
    var body: some View {
        VStack(spacing: 16) {
            ForEach(DSIconButtonStyle.allCases, id: \.self) { style in
                HStack {
                    Text("\(String(describing: style)) (loading)")
                        .font(.caption)
                        .frame(width: 150, alignment: .leading)
                    DSIconButton(dsIcon: .heartFilled, style: style, isLoading: true) {
                    }
                }
            }
        }
        .padding()
    }
}

// MARK: - DifferentIconsPreview

private struct DifferentIconsPreview: View {
    private let icons: [DSIcon] = [.heartFilled, .starFilled, .add, .close, .arrowForward, .search]

    var body: some View {
        HStack(spacing: 8) {
            ForEach(icons, id: \.self) { icon in
                DSIconButton(dsIcon: icon) {
                }
            }
        }
        .padding()
    }
}
