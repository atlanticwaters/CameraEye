import SwiftUI

// MARK: - DSButton Previews

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

// MARK: - Icon Configurations (testIconConfigurations)

#Preview("Icon Configurations - Light") {
    IconConfigurationsPreview()
        .preferredColorScheme(.light)
}

#Preview("Icon Configurations - Dark") {
    IconConfigurationsPreview()
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

// MARK: - Size Style Matrix (testSizeStyleMatrix)

#Preview("Size Style Matrix - Light") {
    SizeStyleMatrixPreview()
        .preferredColorScheme(.light)
}

#Preview("Size Style Matrix - Dark") {
    SizeStyleMatrixPreview()
        .preferredColorScheme(.dark)
}

// MARK: - AllVariantsPreview

private struct AllVariantsPreview: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                ForEach(DSButtonStyle.allCases, id: \.self) { style in
                    DSButton(style.displayName, style: style) {
                    }
                    .background(style == .whiteFilled ? Color.gray.opacity(0.3) : Color.clear)
                }
            }
            .padding()
        }
    }
}

// MARK: - AllSizesPreview

private struct AllSizesPreview: View {
    var body: some View {
        VStack(spacing: 12) {
            DSButton("Small", size: .small) {
            }
            DSButton("Medium", size: .medium) {
            }
            DSButton("Large", size: .large) {
            }
        }
        .padding()
    }
}

// MARK: - StatesPreview

private struct StatesPreview: View {
    var body: some View {
        VStack(spacing: 12) {
            DSButton("Default") {
            }
            DSButton("Disabled", isDisabled: true) {
            }
            DSButton("Loading", isLoading: true) {
            }
        }
        .padding()
    }
}

// MARK: - IconConfigurationsPreview

private struct IconConfigurationsPreview: View {
    var body: some View {
        VStack(spacing: 12) {
            DSButton("Text Only") {
            }
            DSButton("Leading", leadingIcon: DSIcon.add.image) {
            }
            DSButton("Trailing", trailingIcon: DSIcon.arrowForward.image) {
            }
            DSButton(
                "Both Icons",
                leadingIcon: DSIcon.starFilled.image,
                trailingIcon: DSIcon.arrowForward.image
            ) {
            }
        }
        .padding()
    }
}

// MARK: - DisabledVariantsPreview

private struct DisabledVariantsPreview: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                ForEach(DSButtonStyle.allCases, id: \.self) { style in
                    DSButton("\(style.displayName) (disabled)", style: style, isDisabled: true) {
                    }
                    .background(style == .whiteFilled ? Color.gray.opacity(0.3) : Color.clear)
                }
            }
            .padding()
        }
    }
}

// MARK: - LoadingVariantsPreview

private struct LoadingVariantsPreview: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                ForEach(DSButtonStyle.allCases, id: \.self) { style in
                    DSButton("\(style.displayName) (loading)", style: style, isLoading: true) {
                    }
                    .background(style == .whiteFilled ? Color.gray.opacity(0.3) : Color.clear)
                }
            }
            .padding()
        }
    }
}

// MARK: - SizeStyleMatrixPreview

private struct SizeStyleMatrixPreview: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(DSButtonSize.allCases, id: \.self) { size in
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Size: \(size.displayName)")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        VStack(spacing: 8) {
                            ForEach(DSButtonStyle.allCases, id: \.self) { style in
                                HStack {
                                    DSButton("Btn", style: style, size: size) {
                                    }
                                    Spacer()
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

// MARK: - Display Name Extensions

extension DSButtonStyle {
    fileprivate var displayName: String {
        switch self {
        case .orangeFilled: "Orange Filled"
        case .gradientFilled: "Gradient Filled"
        case .outlined: "Outlined"
        case .whiteFilled: "White Filled"
        case .black5: "Black 5%"
        case .black10: "Black 10%"
        case .ghost: "Ghost"
        }
    }
}

extension DSButtonSize {
    fileprivate var displayName: String {
        switch self {
        case .small: "Small"
        case .medium: "Medium"
        case .large: "Large"
        }
    }
}
