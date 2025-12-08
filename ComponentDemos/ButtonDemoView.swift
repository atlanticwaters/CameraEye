import SwiftUI

// MARK: - Button Demo View
/// Comprehensive demo view showcasing all THDButton and THDIconButton variants, states, and sizes.
///
/// This view provides a complete inventory of the button components for design review
/// and development reference.
struct ButtonDemoView: View {
    // MARK: - Body
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing4) {
                // Header Card
                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                    Text("Button")
                        .thdFont(.hero5)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

                    Text("Primary action buttons with multiple style variants, sizes, and states.")
                        .thdFont(.bodyMd)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)
                }
                .padding(DesignSystemGlobal.Spacing4)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusXl)
                        .fill(DesignSystemGlobal.BackgroundContainerColorWhite)
                )

                // Content Card
                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing6) {
                    // MARK: - Orange Filled
                    sectionHeader("Orange Filled", description: "Primary brand action button")

                    VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                    Text("Sizes")
                        .thdFont(.bodySm)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    HStack(spacing: DesignSystemGlobal.Spacing2) {
                        THDButton("Small", style: .orangeFilled, size: .small)
                        THDButton("Medium", style: .orangeFilled, size: .medium)
                        THDButton("Large", style: .orangeFilled, size: .large)
                    }

                    Text("With Icons")
                        .thdFont(.bodySm)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                        THDButton("Leading Icon", style: .orangeFilled, size: .medium, leadingIcon: "plus")
                        THDButton("Trailing Icon", style: .orangeFilled, size: .medium, trailingIcon: "arrow.right")
                        THDButton("Both Icons", style: .orangeFilled, size: .medium, leadingIcon: "cart", trailingIcon: "arrow.right")
                    }

                    Text("States")
                        .thdFont(.bodySm)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    HStack(spacing: DesignSystemGlobal.Spacing2) {
                        THDButton("Default", style: .orangeFilled, size: .small)
                        THDButton("Pressed", style: .orangeFilled, size: .small, state: .pressed)
                        THDButton("Loading", style: .orangeFilled, size: .small, state: .loading)
                        THDButton("Success", style: .orangeFilled, size: .small, state: .success)
                        THDButton("Inactive", style: .orangeFilled, size: .small, state: .inactive)
                    }
                }

                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)

                    // MARK: - Gradient Filled
                    sectionHeader("Gradient Filled", description: "Enhanced brand action with gradient")

                HStack(spacing: DesignSystemGlobal.Spacing2) {
                    THDButton("Small", style: .gradientFilled, size: .small, leadingIcon: "sparkles")
                    THDButton("Medium", style: .gradientFilled, size: .medium, leadingIcon: "sparkles")
                    THDButton("Large", style: .gradientFilled, size: .large, leadingIcon: "sparkles")
                }

                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)

                    // MARK: - Outlined
                    sectionHeader("Outlined", description: "Secondary brand action button")

                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                    HStack(spacing: DesignSystemGlobal.Spacing2) {
                        THDButton("Small", style: .outlined, size: .small)
                        THDButton("Medium", style: .outlined, size: .medium)
                        THDButton("Large", style: .outlined, size: .large)
                    }

                    Text("States")
                        .thdFont(.bodySm)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    HStack(spacing: DesignSystemGlobal.Spacing2) {
                        THDButton("Default", style: .outlined, size: .small)
                        THDButton("Inactive", style: .outlined, size: .small, state: .inactive)
                    }
                }

                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)

                    // MARK: - White Filled
                    sectionHeader("White Filled", description: "For use on dark backgrounds")

                ZStack {
                    RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusXl)
                        .fill(DesignSystemGlobal.GreigeGreige900)
                        .frame(height: 80)

                    HStack(spacing: DesignSystemGlobal.Spacing2) {
                        THDButton("Small", style: .whiteFilled, size: .small)
                        THDButton("Medium", style: .whiteFilled, size: .medium)
                        THDButton("Large", style: .whiteFilled, size: .large)
                    }
                }

                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)

                    // MARK: - Black 5%
                    sectionHeader("Black 5%", description: "Subtle transparent background")

                HStack(spacing: DesignSystemGlobal.Spacing2) {
                    THDButton("Small", style: .black5, size: .small)
                    THDButton("Medium", style: .black5, size: .medium)
                }

                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)

                    // MARK: - Black 10%
                    sectionHeader("Black 10%", description: "More visible transparent background")

                HStack(spacing: DesignSystemGlobal.Spacing2) {
                    THDButton("Small", style: .black10, size: .small)
                    THDButton("Medium", style: .black10, size: .medium)
                }

                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)

                    // MARK: - Ghost
                    sectionHeader("Ghost", description: "No background until pressed")

                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                    HStack(spacing: DesignSystemGlobal.Spacing2) {
                        THDButton("Small", style: .ghost, size: .small)
                        THDButton("Medium", style: .ghost, size: .medium)
                        THDButton("Large", style: .ghost, size: .large)
                    }

                    HStack(spacing: DesignSystemGlobal.Spacing2) {
                        THDButton("Default", style: .ghost, size: .small)
                        THDButton("Pressed", style: .ghost, size: .small, state: .pressed)
                        THDButton("Inactive", style: .ghost, size: .small, state: .inactive)
                    }
                }

                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)

                    // MARK: - Icon Buttons
                    sectionHeader("Icon Buttons", description: "Circular icon-only buttons")

                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                    Text("Orange Filled")
                        .thdFont(.bodySm)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    HStack(spacing: DesignSystemGlobal.Spacing2) {
                        THDIconButton(icon: "plus", style: .orangeFilled, size: .small)
                        THDIconButton(icon: "plus", style: .orangeFilled, size: .medium)
                        THDIconButton(icon: "plus", style: .orangeFilled, size: .large)
                    }

                    Text("Outlined")
                        .thdFont(.bodySm)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    HStack(spacing: DesignSystemGlobal.Spacing2) {
                        THDIconButton(icon: "heart", style: .outlined, size: .small)
                        THDIconButton(icon: "heart", style: .outlined, size: .medium)
                        THDIconButton(icon: "heart", style: .outlined, size: .large)
                    }

                    Text("Various Styles")
                        .thdFont(.bodySm)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    HStack(spacing: DesignSystemGlobal.Spacing2) {
                        THDIconButton(icon: "xmark", style: .black5, size: .medium)
                        THDIconButton(icon: "xmark", style: .black10, size: .medium)
                        THDIconButton(icon: "xmark", style: .ghost, size: .medium)
                    }

                    Text("States")
                        .thdFont(.bodySm)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    HStack(spacing: DesignSystemGlobal.Spacing2) {
                        THDIconButton(icon: "plus", style: .orangeFilled, size: .medium, state: .loading)
                        THDIconButton(icon: "plus", style: .outlined, size: .medium, state: .inactive)
                    }
                }
                }
                .padding(DesignSystemGlobal.Spacing4)
                .background(
                    RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusXl)
                        .fill(DesignSystemGlobal.BackgroundContainerColorWhite)
                )
            }
            .padding(DesignSystemGlobal.Spacing4)
        }
        .applySoftScrollEdges()
        .background(DesignSystemGlobal.BackgroundSurfaceColorGreige)
    }
    
    // MARK: - Helper Views
    
    private func sectionHeader(_ title: String, description: String) -> some View {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing1) {
            Text(title)
                .thdFont(.h6)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

            Text(description)
                .thdFont(.caption)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorTertiary)
        }
    }
}

#Preview("Button Demo") {
    ButtonDemoView()
}
