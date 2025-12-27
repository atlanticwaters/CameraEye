import SwiftUI

// MARK: - DSProgressBar Previews

//
// These previews mirror the snapshot tests exactly.
// Each snapshot test has corresponding Light and Dark previews.

// MARK: - All States (testAllStates)

#Preview("All States - Light") {
    AllStatesPreview()
        .preferredColorScheme(.light)
}

#Preview("All States - Dark") {
    AllStatesPreview()
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

// MARK: - Progress Values (testProgressValues)

#Preview("Progress Values - Light") {
    ProgressValuesPreview()
        .preferredColorScheme(.light)
}

#Preview("Progress Values - Dark") {
    ProgressValuesPreview()
        .preferredColorScheme(.dark)
}

// MARK: - State Size Matrix (testStateSizeMatrix)

#Preview("State Size Matrix - Light") {
    StateSizeMatrixPreview()
        .preferredColorScheme(.light)
}

#Preview("State Size Matrix - Dark") {
    StateSizeMatrixPreview()
        .preferredColorScheme(.dark)
}

// MARK: - Large Text (testLargeText)

#Preview("Large Text - Light") {
    AllStatesPreview()
        .preferredColorScheme(.light)
        .dynamicTypeSize(.accessibility3)
}

#Preview("Large Text - Dark") {
    AllStatesPreview()
        .preferredColorScheme(.dark)
        .dynamicTypeSize(.accessibility3)
}

// MARK: - Narrow Width (testNarrowWidth)

#Preview("Narrow Width - Light") {
    AllStatesPreview()
        .preferredColorScheme(.light)
        .frame(width: 150)
}

#Preview("Narrow Width - Dark") {
    AllStatesPreview()
        .preferredColorScheme(.dark)
        .frame(width: 150)
}

// MARK: - AllStatesPreview

private struct AllStatesPreview: View {
    var body: some View {
        VStack(spacing: 16) {
            ForEach(DSProgressBarState.allCases, id: \.self) { state in
                VStack(alignment: .leading, spacing: 4) {
                    Text(state.displayName)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    DSProgressBar(progress: 0.6, state: state)
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
            ForEach(DSProgressBarSize.allCases, id: \.self) { size in
                VStack(alignment: .leading, spacing: 4) {
                    Text(size.displayName)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    DSProgressBar(progress: 0.6, size: size)
                }
            }
        }
        .padding()
    }
}

// MARK: - ProgressValuesPreview

private struct ProgressValuesPreview: View {
    var body: some View {
        VStack(spacing: 16) {
            ForEach([0.0, 0.25, 0.5, 0.75, 1.0], id: \.self) { progress in
                VStack(alignment: .leading, spacing: 4) {
                    Text("\(Int(progress * 100))%")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    DSProgressBar(progress: progress)
                }
            }
        }
        .padding()
    }
}

// MARK: - StateSizeMatrixPreview

private struct StateSizeMatrixPreview: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                ForEach(DSProgressBarState.allCases, id: \.self) { state in
                    VStack(alignment: .leading, spacing: 8) {
                        Text(state.displayName)
                            .font(.headline)
                        ForEach(DSProgressBarSize.allCases, id: \.self) { size in
                            VStack(alignment: .leading, spacing: 4) {
                                Text(size.displayName)
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                                DSProgressBar(progress: 0.6, state: state, size: size)
                            }
                        }
                    }
                }
            }
            .padding()
        }
    }
}
