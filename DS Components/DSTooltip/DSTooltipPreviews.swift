import SwiftUI

// MARK: - DSTooltip Previews

//
// These previews mirror the snapshot tests exactly.
// Each snapshot test has corresponding Light and Dark previews.

// MARK: - Placements (testPlacements)

#Preview("Placements - Light") {
    PlacementsPreview()
        .preferredColorScheme(.light)
}

#Preview("Placements - Dark") {
    PlacementsPreview()
        .preferredColorScheme(.dark)
}

// MARK: - Close Button (testCloseButton)

#Preview("Close Button - Light") {
    CloseButtonPreview()
        .preferredColorScheme(.light)
}

#Preview("Close Button - Dark") {
    CloseButtonPreview()
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

// MARK: - PlacementsPreview

private struct PlacementsPreview: View {
    var body: some View {
        VStack(spacing: 32) {
            DSTooltip("Above", placement: .above)
            DSTooltip("Below", placement: .below)
            HStack(spacing: 24) {
                DSTooltip("Leading", placement: .leading)
                DSTooltip("Trailing", placement: .trailing)
            }
        }
        .padding()
    }
}

// MARK: - CloseButtonPreview

private struct CloseButtonPreview: View {
    var body: some View {
        VStack(spacing: 24) {
            DSTooltip(
                "Tooltip with close button",
                placement: .below,
                showsClose: true
            ) {
            }
            DSTooltip(
                "Another with close",
                placement: .above,
                showsClose: true
            ) {
            }
        }
        .padding()
    }
}

// MARK: - StatesPreview

private struct StatesPreview: View {
    var body: some View {
        VStack(spacing: 24) {
            DSTooltip("Default state", placement: .below)
            DSTooltip(
                "With close button",
                placement: .below,
                showsClose: true
            ) {
            }
        }
        .padding()
    }
}
