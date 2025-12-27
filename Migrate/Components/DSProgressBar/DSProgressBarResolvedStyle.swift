import SwiftUI

// MARK: - DSProgressBarResolvedSize

/// Resolved sizing values for DSProgressBar, suitable for unit testing.
///
/// This struct captures all computed sizing values for a progress bar size configuration,
/// enabling unit tests to verify layout math without rendering views.
public struct DSProgressBarResolvedSize: Equatable, Sendable {
    /// The track height
    public let height: CGFloat

    /// The corner radius
    public let cornerRadius: CGFloat

    /// The original size enum value
    public let size: DSProgressBarSize

    /// Resolves a DSProgressBarSize to testable values.
    public static func resolve(_ size: DSProgressBarSize) -> Self {
        Self(
            height: size.height,
            cornerRadius: size.cornerRadius,
            size: size
        )
    }
}

// MARK: - DSProgressBarResolvedStyle

/// A fully resolved progress bar style with all visual properties extracted.
///
/// This type serves as a **seam** for testing: it extracts the pure style
/// resolution logic from DSProgressBar, enabling fast unit tests that verify
/// token mappings without rendering views.
///
/// Uses **token names** instead of color values to ensure reliable testing
/// across all environments (Xcode, CI, headless CLI).
public struct DSProgressBarResolvedStyle: Equatable, Sendable {
    /// The token name for the track (background) color
    public let trackTokenName: String

    /// The token name for the progress (fill) color
    public let progressTokenName: String

    /// The original state enum value
    public let state: DSProgressBarState

    /// Resolves a progress bar state to a fully-resolved style with token names.
    ///
    /// - Parameter state: The progress bar state variant
    /// - Returns: A fully resolved style with all token names populated
    public static func resolve(state: DSProgressBarState) -> Self {
        Self(
            trackTokenName: trackToken(state: state),
            progressTokenName: progressToken(state: state),
            state: state
        )
    }

    // MARK: - Private Token Name Resolvers

    private static func trackToken(state: DSProgressBarState) -> String {
        switch state {
        case .default:
            "containerBackgroundBrandAccent"
        case .success:
            "feedbackBackgroundSuccessAccent1"
        case .warning:
            "feedbackBackgroundWarningAccent1"
        case .error:
            "feedbackBackgroundErrorAccent1"
        }
    }

    private static func progressToken(state: DSProgressBarState) -> String {
        switch state {
        case .default:
            "containerBackgroundBrand"
        case .success:
            "feedbackBackgroundSuccessAccent2"
        case .warning:
            "feedbackBackgroundWarningAccent2"
        case .error:
            "feedbackBackgroundErrorAccent2"
        }
    }
}

// MARK: - DSProgressBarResolvedProgress

/// Resolved progress value with clamping applied.
///
/// This struct ensures progress values are always valid (0.0 to 1.0).
public struct DSProgressBarResolvedProgress: Equatable, Sendable {
    /// The clamped progress value (0.0 to 1.0)
    public let value: Double

    /// The percentage representation (0 to 100)
    public var percentage: Int {
        Int(value * 100)
    }

    /// Whether the progress is at minimum (0%)
    public var isAtMinimum: Bool {
        value == 0
    }

    /// Whether the progress is at maximum (100%)
    public var isAtMaximum: Bool {
        value == 1
    }

    /// Creates a resolved progress value from a raw input.
    /// Values are clamped to the valid range 0.0...1.0.
    public static func resolve(_ rawProgress: Double) -> Self {
        let clamped = min(max(rawProgress, 0), 1)
        return Self(value: clamped)
    }
}
