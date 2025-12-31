import SwiftUI

// MARK: - DSProgressBar Showcase View

/// Comprehensive showcase of the DSProgressBar component
///
/// Demonstrates:
/// - All 4 states (default, success, warning, error)
/// - All 3 sizes (small, regular, large)
/// - Animated progress updates
/// - Interactive progress control
/// - Dark mode support
/// - Real-world usage examples

struct DSProgressBarView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing6) {

                // MARK: - Header Card
                VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                    Text("Progress Bar")
                        .thdFont(.hero5)
                        .foregroundStyle(textPrimary)

                    Text("A progress bar component displaying determinate progress. Supports 4 states and 3 sizes with automatic accessibility announcements.")
                        .thdFont(.bodyMd)
                        .foregroundStyle(textSecondary)
                }
                .padding(TokensCoreLight.Spacing4)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: borderRadiusXl)
                        .fill(containerWhite)
                )

                // MARK: - Content Card
                VStack(alignment: .leading, spacing: TokensCoreLight.Spacing6) {

                    // Progress States
                    progressStatesSection

                    Divider().padding(.vertical, TokensCoreLight.Spacing2)

                    // Progress Sizes
                    progressSizesSection

                    Divider().padding(.vertical, TokensCoreLight.Spacing2)

                    // Progress Values
                    progressValuesSection

                    Divider().padding(.vertical, TokensCoreLight.Spacing2)

                    // Interactive Examples
                    interactiveSection

                    Divider().padding(.vertical, TokensCoreLight.Spacing2)

                    // Usage Examples
                    usageExamplesSection

                    Divider().padding(.vertical, TokensCoreLight.Spacing2)

                    // Specifications
                    specificationsSection
                }
                .padding(TokensCoreLight.Spacing4)
                .background(
                    RoundedRectangle(cornerRadius: borderRadiusXl)
                        .fill(containerWhite)
                )
            }
            .padding(TokensCoreLight.Spacing4)
            .padding(.top, TokensCoreLight.Spacing24)
            .padding(.bottom, TokensCoreLight.Spacing20)
        }
        .background(surfaceGreige)
        .applySoftScrollEdges()
    }

    // MARK: - Progress States Section

    private var progressStatesSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader(
                "Progress States",
                description: "4 visual states for different contexts"
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                stateExample(
                    "Default",
                    description: "Standard progress (brand orange)",
                    state: .default
                )

                stateExample(
                    "Success",
                    description: "Completed or successful progress (green)",
                    state: .success
                )

                stateExample(
                    "Warning",
                    description: "Caution or attention needed (yellow)",
                    state: .warning
                )

                stateExample(
                    "Error",
                    description: "Failed or problematic progress (red)",
                    state: .error
                )
            }
        }
    }

    private func stateExample(_ title: String, description: String, state: DSProgressBarState) -> some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
                Text(title)
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)

                Text(description)
                    .thdFont(.caption)
                    .foregroundStyle(textTertiary)
            }

            DSProgressBar(progress: 0.65, state: state, size: .regular)
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }

    // MARK: - Progress Sizes Section

    private var progressSizesSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader(
                "Progress Sizes",
                description: "Small (4pt), Regular (8pt), and Large (12pt)"
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                sizeExample(
                    "Small",
                    description: "4pt height, minimal footprint",
                    size: .small
                )

                sizeExample(
                    "Regular",
                    description: "8pt height, default size",
                    size: .regular
                )

                sizeExample(
                    "Large",
                    description: "12pt height, prominent display",
                    size: .large
                )
            }
        }
    }

    private func sizeExample(_ title: String, description: String, size: DSProgressBarSize) -> some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            HStack {
                Text(title)
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)

                Spacer()

                Text(description)
                    .thdFont(.caption)
                    .foregroundStyle(textTertiary)
            }

            DSProgressBar(progress: 0.5, state: .default, size: size)
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }

    // MARK: - Progress Values Section

    private var progressValuesSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader(
                "Progress Values",
                description: "Various progress percentages"
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                progressValueExample("0%", progress: 0.0)
                progressValueExample("25%", progress: 0.25)
                progressValueExample("50%", progress: 0.5)
                progressValueExample("75%", progress: 0.75)
                progressValueExample("100%", progress: 1.0)
            }
        }
    }

    private func progressValueExample(_ label: String, progress: Double) -> some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            HStack {
                Text(label)
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)
                Spacer()
            }

            DSProgressBar(progress: progress, state: .default, size: .regular)
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerGreige)
        )
    }

    // MARK: - Interactive Section

    private var interactiveSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader("Interactive Examples", description: "Control progress dynamically")

            VStack(spacing: TokensCoreLight.Spacing4) {
                InteractiveProgressSlider()

                InteractiveAnimatedProgress()

                InteractiveStateCycle()
            }
            .padding(TokensCoreLight.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(containerGreige)
            )
        }
    }

    // MARK: - Usage Examples Section

    private var usageExamplesSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader("Usage Examples", description: "Real-world component usage")

            Text("File Upload")
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)

            fileUploadExample

            Text("Profile Completion")
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
                .padding(.top, TokensCoreLight.Spacing2)

            profileCompletionExample

            Text("Download Queue")
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
                .padding(.top, TokensCoreLight.Spacing2)

            downloadQueueExample
        }
    }

    private var fileUploadExample: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            HStack {
                Image(systemName: "doc.fill")
                    .foregroundStyle(textSecondary)
                Text("document.pdf")
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)
                Spacer()
                Text("65%")
                    .thdFont(.caption)
                    .foregroundStyle(textTertiary)
            }
            DSProgressBar(progress: 0.65, state: .default, size: .small)
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerWhite)
        )
    }

    private var profileCompletionExample: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            HStack {
                Text("Profile Completion")
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)
                Spacer()
                Text("80%")
                    .thdFont(.caption)
                    .foregroundStyle(textTertiary)
            }
            DSProgressBar(progress: 0.8, state: .success, size: .regular)
            Text("Add a profile photo to complete your profile")
                .thdFont(.caption)
                .foregroundStyle(textTertiary)
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerWhite)
        )
    }

    private var downloadQueueExample: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                HStack {
                    Text("Item 1")
                        .thdFont(.bodySm)
                    Spacer()
                    Text("Complete")
                        .thdFont(.caption)
                        .foregroundStyle(accentGreen)
                }
                DSProgressBar(progress: 1.0, state: .success, size: .small)
            }

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                HStack {
                    Text("Item 2")
                        .thdFont(.bodySm)
                    Spacer()
                    Text("45%")
                        .thdFont(.caption)
                        .foregroundStyle(textTertiary)
                }
                DSProgressBar(progress: 0.45, state: .default, size: .small)
            }

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                HStack {
                    Text("Item 3")
                        .thdFont(.bodySm)
                    Spacer()
                    Text("Failed")
                        .thdFont(.caption)
                        .foregroundStyle(accentRed)
                }
                DSProgressBar(progress: 0.3, state: .error, size: .small)
            }
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusLg)
                .fill(containerWhite)
        )
    }

    // MARK: - Specifications Section

    private var specificationsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            sectionHeader("Specifications", description: "Component details and dimensions")

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                specRow("Component", value: "DSProgressBar")
                specRow("States", value: "4 (default, success, warning, error)")
                specRow("Sizes", value: "3 (small, regular, large)")
                specRow("Small Height", value: "4pt")
                specRow("Regular Height", value: "8pt")
                specRow("Large Height", value: "12pt")
                specRow("Corner Radius", value: "height / 2 (pill shape)")
                specRow("Progress Range", value: "0.0 to 1.0 (clamped)")
            }
            .padding(TokensCoreLight.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(containerGreige)
            )

            Text("Code Example")
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
                .padding(.top, TokensCoreLight.Spacing2)

            codeExample("""
// Basic usage with 50% progress
DSProgressBar(progress: 0.5)

// With success state
DSProgressBar(progress: 1.0, state: .success)

// Custom size and state
DSProgressBar(
    progress: 0.75,
    state: .warning,
    size: .large
)

// Animated progress update
withAnimation {
    progress = 0.8
}
DSProgressBar(progress: progress)
""")
        }
    }

    private func codeExample(_ code: String) -> some View {
        Text(code)
            .thdFont(.caption)
            .foregroundStyle(textSecondary)
            .font(.system(.caption, design: .monospaced))
            .padding(TokensCoreLight.Spacing3)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: borderRadiusLg)
                    .fill(codeBlockBg)
            )
    }

    private func specRow(_ label: String, value: String) -> some View {
        HStack {
            Text(label)
                .thdFont(.caption)
                .foregroundStyle(textTertiary)

            Spacer()

            Text(value)
                .thdFont(.caption)
                .foregroundStyle(textSecondary)
        }
    }

    // MARK: - Helper Methods

    private func sectionHeader(_ title: String, description: String) -> some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
            Text(title)
                .thdFont(.h3)
                .foregroundStyle(textPrimary)

            Text(description)
                .thdFont(.caption)
                .foregroundStyle(textTertiary)
        }
    }

    // MARK: - Theme-Aware Colors

    private var textPrimary: Color {
        tokens.TextOnContainerColorPrimary
    }

    private var textSecondary: Color {
        tokens.TextOnContainerColorSecondary
    }

    private var textTertiary: Color {
        tokens.TextOnContainerColorTertiary
    }

    private var containerWhite: Color {
        tokens.BackgroundContainerColorWhite
    }

    private var containerGreige: Color {
        tokens.BackgroundContainerColorGreige
    }

    private var surfaceGreige: Color {
        tokens.BackgroundSurfaceColorGreige
    }

    private var borderRadiusLg: CGFloat {
        tokens.BorderRadiusLg
    }

    private var borderRadiusXl: CGFloat {
        tokens.BorderRadiusXl
    }

    private var codeBlockBg: Color {
        tokens.BackgroundContainerColorTransparent05
    }

    private var accentGreen: Color {
        tokens.BackgroundAccentColorGreen
    }

    private var accentRed: Color {
        tokens.BackgroundAccentColorRed
    }

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }
}

// MARK: - Supporting Views

/// Interactive progress slider
private struct InteractiveProgressSlider: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var progress: Double = 0.5

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            HStack {
                Text("Adjustable Progress")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorSecondary)

                Spacer()

                Text("\(Int(progress * 100))%")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorPrimary)
            }

            DSProgressBar(progress: progress, state: .default, size: .regular)

            Slider(value: $progress, in: 0...1)
                .tint(tokens.TextOnContainerColorPrimary)
        }
        .padding(TokensCoreLight.Spacing2)
        .background(
            RoundedRectangle(cornerRadius: tokens.BorderRadiusSm)
                .fill(tokens.BackgroundContainerColorWhite)
        )
    }
}

/// Animated progress example
private struct InteractiveAnimatedProgress: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var progress: Double = 0.0
    @State private var isAnimating = false

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            HStack {
                Text("Animated Progress")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorSecondary)

                Spacer()

                Text(isAnimating ? "Animating..." : "Ready")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorPrimary)
            }

            DSProgressBar(progress: progress, state: progress >= 1.0 ? .success : .default, size: .large)

            DSButton(isAnimating ? "Reset" : "Start Animation", style: .outlined, size: .medium) {
                if isAnimating || progress >= 1.0 {
                    progress = 0.0
                    isAnimating = false
                } else {
                    isAnimating = true
                    animateProgress()
                }
            }
        }
        .padding(TokensCoreLight.Spacing2)
        .background(
            RoundedRectangle(cornerRadius: tokens.BorderRadiusSm)
                .fill(tokens.BackgroundContainerColorWhite)
        )
    }

    private func animateProgress() {
        Task {
            while progress < 1.0 && isAnimating {
                try? await Task.sleep(for: .milliseconds(100))
                await MainActor.run {
                    withAnimation(.linear(duration: 0.1)) {
                        progress = min(progress + 0.05, 1.0)
                    }
                }
            }
            await MainActor.run {
                isAnimating = false
            }
        }
    }
}

/// Interactive state cycle
private struct InteractiveStateCycle: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var currentStateIndex = 0

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    private let states: [(DSProgressBarState, String)] = [
        (.default, "Default"),
        (.success, "Success"),
        (.warning, "Warning"),
        (.error, "Error")
    ]

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            HStack {
                Text("Cycle States")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorSecondary)

                Spacer()

                Text(states[currentStateIndex].1)
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorPrimary)
            }

            DSProgressBar(progress: 0.7, state: states[currentStateIndex].0, size: .regular)

            DSButton("Next State", style: .outlined, size: .medium) {
                currentStateIndex = (currentStateIndex + 1) % states.count
            }
        }
        .padding(TokensCoreLight.Spacing2)
        .background(
            RoundedRectangle(cornerRadius: tokens.BorderRadiusSm)
                .fill(tokens.BackgroundContainerColorWhite)
        )
    }
}

// MARK: - Token Protocol Helper
private protocol TokenSemanticProtocol {
    static var TextOnContainerColorPrimary: Color { get }
    static var TextOnContainerColorSecondary: Color { get }
    static var TextOnContainerColorTertiary: Color { get }
    static var BackgroundContainerColorWhite: Color { get }
    static var BackgroundContainerColorGreige: Color { get }
    static var BackgroundSurfaceColorGreige: Color { get }
    static var BackgroundContainerColorTransparent05: Color { get }
    static var BackgroundAccentColorGreen: Color { get }
    static var BackgroundAccentColorRed: Color { get }
    static var BorderRadiusSm: CGFloat { get }
    static var BorderRadiusLg: CGFloat { get }
    static var BorderRadiusXl: CGFloat { get }
}

extension TokensSemanticLight: TokenSemanticProtocol {}
extension TokensSemanticDark: TokenSemanticProtocol {}

// MARK: - Preview
#Preview {
    DSProgressBarView()
}
