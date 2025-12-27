import SwiftUI

// MARK: - DSProgressBarColorHelper

/// Helper structure for computing DSProgressBar colors based on state.
///
/// Colors automatically resolve to light/dark mode via `DSColor`.
/// Uses semantic feedback tokens for state-specific colors.
enum DSProgressBarColorHelper {
    // MARK: - Track Background Color

    /// Returns the background track color for the progress bar.
    /// Uses feedback accent1 colors for each state (lighter shade).
    static func trackColor(state: DSProgressBarState) -> DSColor {
        switch state {
        case .default:
            // Use brand accent for default state track
            DSColor.containerBackgroundBrandAccent
        case .success:
            DSColor.feedbackBackgroundSuccessAccent1
        case .warning:
            DSColor.feedbackBackgroundWarningAccent1
        case .error:
            DSColor.feedbackBackgroundErrorAccent1
        }
    }

    // MARK: - Progress Fill Color

    /// Returns the progress fill color for the progress bar.
    /// Uses feedback accent2 colors for each state (darker/primary shade).
    static func progressColor(state: DSProgressBarState) -> DSColor {
        switch state {
        case .default:
            // Use brand color for default state progress
            DSColor.containerBackgroundBrand
        case .success:
            DSColor.feedbackBackgroundSuccessAccent2
        case .warning:
            DSColor.feedbackBackgroundWarningAccent2
        case .error:
            DSColor.feedbackBackgroundErrorAccent2
        }
    }
}
