import SwiftUI

// MARK: - DSProgressBarState

/// Visual state variants for DSProgressBar indicating progress status.
public enum DSProgressBarState: CaseIterable, Sendable {
    /// Default progress state (brand orange)
    case `default`
    /// Success state (green) - indicates completed/successful progress
    case success
    /// Warning state (yellow) - indicates caution or attention needed
    case warning
    /// Error state (red) - indicates failed or problematic progress
    case error
}

// MARK: - DSProgressBarSize

/// Size variants for DSProgressBar matching Figma specs.
public enum DSProgressBarSize: CaseIterable, Sendable {
    /// Small height: 4pt
    case small
    /// Regular height: 8pt (default)
    case regular
    /// Large height: 12pt
    case large

    // MARK: Internal

    /// Track height from Figma specs
    var height: CGFloat {
        switch self {
        case .small: 4
        case .regular: 8
        case .large: 12
        }
    }

    /// Corner radius scales with size
    var cornerRadius: CGFloat {
        height / 2
    }
}

// MARK: - DSProgressBar

/// A progress bar component displaying determinate progress.
///
/// DSProgressBar shows progress as a filled track within a background track.
/// It supports different states (default, success, warning, error) and sizes
/// (small, regular, large).
///
/// ## Example Usage
/// ```swift
/// // Basic usage with 50% progress
/// DSProgressBar(progress: 0.5)
///
/// // With success state
/// DSProgressBar(progress: 1.0, state: .success)
///
/// // Custom size and state
/// DSProgressBar(progress: 0.75, state: .warning, size: .large)
/// ```
///
/// ## Accessibility
/// - The progress bar announces its current percentage to VoiceOver
/// - State changes are announced (success, warning, error)
public struct DSProgressBar: View {
    // MARK: - Properties

    /// The current progress value (0.0 to 1.0)
    private let progress: Double
    /// The visual state of the progress bar
    private let state: DSProgressBarState
    /// The size variant of the progress bar
    private let size: DSProgressBarSize

    // MARK: - Initialization

    /// Creates a progress bar with the specified progress, state, and size.
    ///
    /// - Parameters:
    ///   - progress: A value between 0.0 and 1.0 representing the progress.
    ///     Values outside this range are clamped.
    ///   - state: The visual state of the progress bar. Default is `.default`.
    ///   - size: The size variant of the progress bar. Default is `.regular`.
    public init(
        progress: Double,
        state: DSProgressBarState = .default,
        size: DSProgressBarSize = .regular
    ) {
        self.progress = min(max(progress, 0), 1) // Clamp to 0...1
        self.state = state
        self.size = size
    }

    // MARK: - Body

    public var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                // Background track
                RoundedRectangle(cornerRadius: size.cornerRadius)
                    .fill(DSProgressBarColorHelper.trackColor(state: state).resolve)

                // Progress fill
                RoundedRectangle(cornerRadius: size.cornerRadius)
                    .fill(DSProgressBarColorHelper.progressColor(state: state).resolve)
                    .frame(width: geometry.size.width * progress)
            }
        }
        .frame(height: size.height)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(accessibilityLabel)
        .accessibilityValue(accessibilityValue)
    }

    // MARK: - Accessibility

    private var accessibilityLabel: Text {
        switch state {
        case .default:
            Text("Progress")
        case .success:
            Text("Progress, success")
        case .warning:
            Text("Progress, warning")
        case .error:
            Text("Progress, error")
        }
    }

    private var accessibilityValue: Text {
        Text("\(Int(progress * 100)) percent")
    }
}

// MARK: - Preview Support

extension DSProgressBarState {
    /// Display name for previews and debugging
    var displayName: String {
        switch self {
        case .default: "Default"
        case .success: "Success"
        case .warning: "Warning"
        case .error: "Error"
        }
    }
}

extension DSProgressBarSize {
    /// Display name for previews and debugging
    var displayName: String {
        switch self {
        case .small: "Small"
        case .regular: "Regular"
        case .large: "Large"
        }
    }
}
