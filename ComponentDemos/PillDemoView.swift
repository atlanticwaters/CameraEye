import SwiftUI

// MARK: - Pill Demo View
/// Comprehensive demo view showcasing all Pill component variants, states, and sizes.
///
/// This view provides a complete inventory of the pill/chip component for design review
/// and development reference.
struct PillDemoView: View {
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
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing4) {
                // Header Card
                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
    
                    Text("Pill")
                        .font(.system(size: 32, weight: .bold))
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

                    Text("Selectable chips for filters, tags, and selection options.")
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
                    // MARK: - Outlined Style
                    sectionHeader("Outlined Style", description: "Pills with visible border")

                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                    Text("Sizes")
                        .thdFont(.bodySm)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                        Pill("Small", style: .outlined, size: .small)
                        Pill("Medium", style: .outlined, size: .medium)
                        Pill("Large", style: .outlined, size: .large)
                    }

                    Text("With Icons")
                        .thdFont(.bodySm)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                        Pill("Location", style: .outlined, size: .medium, leadingIcon: "mappin")
                        Pill("Store", style: .outlined, size: .medium, leadingIcon: "storefront")
                        Pill("Category", style: .outlined, size: .medium, hasChevron: true)
                        Pill("Cumberland", style: .outlined, size: .medium, leadingIcon: "storefront", hasChevron: true)
                    }

                    Text("States")
                        .thdFont(.bodySm)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    HStack(spacing: DesignSystemGlobal.Spacing2) {
                        Pill("Default", style: .outlined, size: .medium, interaction: .default)
                        Pill("Pressed", style: .outlined, size: .medium, interaction: .pressed)
                        Pill("Selected", style: .outlined, size: .medium, interaction: .selected)
                        Pill("Disabled", style: .outlined, size: .medium, interaction: .disabled)
                    }
                }

                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)

                    // MARK: - Filled Style
                    sectionHeader("Filled Style", description: "Pills without visible border")

                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                    Text("Sizes")
                        .thdFont(.bodySm)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                        Pill("Small", style: .filled, size: .small)
                        Pill("Medium", style: .filled, size: .medium)
                        Pill("Large", style: .filled, size: .large)
                    }

                    Text("With Icons")
                        .thdFont(.bodySm)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                        Pill("Filter", style: .filled, size: .medium, leadingIcon: "line.3.horizontal.decrease")
                        Pill("Sort", style: .filled, size: .medium, hasChevron: true)
                    }

                    Text("States")
                        .thdFont(.bodySm)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    HStack(spacing: DesignSystemGlobal.Spacing2) {
                        Pill("Default", style: .filled, size: .medium, interaction: .default)
                        Pill("Pressed", style: .filled, size: .medium, interaction: .pressed)
                        Pill("Selected", style: .filled, size: .medium, interaction: .selected)
                        Pill("Disabled", style: .filled, size: .medium, interaction: .disabled)
                    }
                }

                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)

                    // MARK: - Background Options
                    sectionHeader("Background Options", description: "With or without subtle background")

                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                    Text("With Background")
                        .thdFont(.bodySm)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    HStack(spacing: DesignSystemGlobal.Spacing2) {
                        Pill("Has Background", style: .outlined, size: .medium, hasBackground: true)
                    }

                    Text("Without Background")
                        .thdFont(.bodySm)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    HStack(spacing: DesignSystemGlobal.Spacing2) {
                        Pill("No Background", style: .outlined, size: .medium, hasBackground: false)
                    }
                }

                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)

                    // MARK: - Size Comparison
                    sectionHeader("Size Comparison", description: "All sizes side by side")

                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                    Text("Outlined")
                        .thdFont(.bodySm)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    HStack(alignment: .center, spacing: DesignSystemGlobal.Spacing2) {
                        Pill("Small (28pt)", style: .outlined, size: .small, leadingIcon: "tag")
                        Pill("Medium (36pt)", style: .outlined, size: .medium, leadingIcon: "tag")
                        Pill("Large (44pt)", style: .outlined, size: .large, leadingIcon: "tag")
                    }

                    Text("Filled")
                        .thdFont(.bodySm)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    HStack(alignment: .center, spacing: DesignSystemGlobal.Spacing2) {
                        Pill("Small", style: .filled, size: .small, leadingIcon: "tag")
                        Pill("Medium", style: .filled, size: .medium, leadingIcon: "tag")
                        Pill("Large", style: .filled, size: .large, leadingIcon: "tag")
                    }
                }

                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)

                    // MARK: - Use Cases
                    sectionHeader("Common Use Cases", description: "Real-world pill applications")

                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                    Text("Filter Bar")
                        .thdFont(.bodySm)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: DesignSystemGlobal.Spacing2) {
                            Pill("All", style: .outlined, size: .small, interaction: .selected)
                            Pill("In Stock", style: .outlined, size: .small)
                            Pill("On Sale", style: .outlined, size: .small)
                            Pill("Top Rated", style: .outlined, size: .small)
                            Pill("New Arrivals", style: .outlined, size: .small)
                        }
                    }

                    Text("Location Selector")
                        .thdFont(.bodySm)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    Pill("Cumberland Mall", style: .outlined, size: .medium, leadingIcon: "storefront", hasChevron: true)

                    Text("Category Tags")
                        .thdFont(.bodySm)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: DesignSystemGlobal.Spacing2) {
                            Pill("Power Tools", style: .filled, size: .small, interaction: .selected)
                            Pill("Hand Tools", style: .filled, size: .small)
                            Pill("Hardware", style: .filled, size: .small)
                            Pill("Plumbing", style: .filled, size: .small)
                            Pill("Electrical", style: .filled, size: .small)
                        }
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
        .background(DesignSystemGlobal.BackgroundSurfaceColorGreige)
    }
}

#Preview("Pill Demo") {
    PillDemoView()
}
