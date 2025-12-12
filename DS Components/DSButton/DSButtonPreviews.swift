import SwiftUI

// MARK: - DSButton Previews

// Individual Style Previews - Light Mode
#Preview("Orange Filled") {
    DSButton("Button", style: .orangeFilled) {
    }
    .padding()
}

#Preview("Gradient Filled") {
    DSButton("Button", style: .gradientFilled) {
    }
    .padding()
}

#Preview("Outlined") {
    DSButton("Button", style: .outlined) {
    }
    .padding()
}

#Preview("White Filled") {
    DSButton("Button", style: .whiteFilled) {
    }
    .padding()
    .background(Color.gray)
}

#Preview("Black 5%") {
    DSButton("Button", style: .black5) {
    }
    .padding()
}

#Preview("Black 10%") {
    DSButton("Button", style: .black10) {
    }
    .padding()
}

#Preview("Ghost") {
    DSButton("Button", style: .ghost) {
    }
    .padding()
}

// Size Previews
#Preview("Sizes") {
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

// State Previews
#Preview("States") {
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

// With Icons
// TODO: Placeholder icons - not from Figma
#Preview("With Icons") {
    VStack(spacing: 12) {
        DSButton("Leading", leadingIcon: Image(systemName: "cart")) {
        }
        DSButton("Trailing", trailingIcon: Image(systemName: "arrow.right")) {
        }
    }
    .padding()
}

// Factory Methods
#Preview("Factory Methods") {
    VStack(spacing: 12) {
        DSButton.primary("Primary") {
        }
        DSButton.secondary("Secondary") {
        }
        DSButton.tertiary("Tertiary") {
        }
    }
    .padding()
}

// Dark Mode
#Preview("Dark Mode") {
    VStack(spacing: 12) {
        DSButton("Orange Filled", style: .orangeFilled) {
        }
        DSButton("Outlined", style: .outlined) {
        }
        DSButton("Ghost", style: .ghost) {
        }
    }
    .padding()
    .preferredColorScheme(.dark)
}

// All Styles Light
#Preview("All Styles - Light") {
    AllStylesPreview()
        .preferredColorScheme(.light)
}

// All Styles Dark
#Preview("All Styles - Dark") {
    AllStylesPreview()
        .preferredColorScheme(.dark)
}

// MARK: - AllStylesPreview

private struct AllStylesPreview: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                ForEach(DSButton.Style.allCases, id: \.self) { style in
                    StylePreviewRow(style: style)
                }
            }
            .padding()
        }
    }
}

// MARK: - StylePreviewRow

private struct StylePreviewRow: View {
    // MARK: Internal

    let style: DSButton.Style

    var body: some View {
        DSButton(styleName, style: style) {
        }
        .background(needsBackground ? Color.gray.opacity(0.3) : Color.clear)
    }

    // MARK: Private

    private var styleName: String {
        switch style {
        case .orangeFilled: "Orange Filled"
        case .gradientFilled: "Gradient Filled"
        case .outlined: "Outlined"
        case .whiteFilled: "White Filled"
        case .black5: "Black 5%"
        case .black10: "Black 10%"
        case .ghost: "Ghost"
        }
    }

    private var needsBackground: Bool {
        style == .whiteFilled
    }
}
