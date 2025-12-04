import SwiftUI

// MARK: - Badge Demo View
/// Comprehensive demo view showcasing all Badge, BadgeAlt (Rating), and BadgeIndicator variants.
///
/// This view provides a complete inventory of badge components for design review
/// and development reference.
struct BadgeDemoView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing4) {
                // Header Card
                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                    Text("Badge")
                        .thdFont(.hero5)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

                    Text("Labels for categorization, status indication, and notifications.")
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
                    // MARK: - Badge Indicators
                    sectionHeader("Indicators", description: "Small circular status dots")

                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                    Text("Strong Emphasis")
                        .thdFont(.bodySm)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    HStack(spacing: DesignSystemGlobal.Spacing4) {
                        VStack {
                            BadgeIndicator(color: .info, size: .base, emphasis: .strong)
                            Text("Info").thdFont(.caption)
                        }
                        VStack {
                            BadgeIndicator(color: .success, size: .base, emphasis: .strong)
                            Text("Success").thdFont(.caption)
                        }
                        VStack {
                            BadgeIndicator(color: .warning, size: .base, emphasis: .strong)
                            Text("Warning").thdFont(.caption)
                        }
                        VStack {
                            BadgeIndicator(color: .danger, size: .base, emphasis: .strong)
                            Text("Danger").thdFont(.caption)
                        }
                        VStack {
                            BadgeIndicator(color: .brand, size: .base, emphasis: .strong)
                            Text("Brand").thdFont(.caption)
                        }
                    }

                    Text("Subtle Emphasis")
                        .thdFont(.bodySm)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    HStack(spacing: DesignSystemGlobal.Spacing4) {
                        VStack {
                            BadgeIndicator(color: .info, size: .regular, emphasis: .subtle)
                            Text("Info").thdFont(.caption)
                        }
                        VStack {
                            BadgeIndicator(color: .success, size: .regular, emphasis: .subtle)
                            Text("Success").thdFont(.caption)
                        }
                        VStack {
                            BadgeIndicator(color: .warning, size: .regular, emphasis: .subtle)
                            Text("Warning").thdFont(.caption)
                        }
                        VStack {
                            BadgeIndicator(color: .danger, size: .regular, emphasis: .subtle)
                            Text("Danger").thdFont(.caption)
                        }
                        VStack {
                            BadgeIndicator(color: .brand, size: .regular, emphasis: .subtle)
                            Text("Brand").thdFont(.caption)
                        }
                    }

                    Text("Sizes")
                        .thdFont(.bodySm)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    HStack(spacing: DesignSystemGlobal.Spacing4) {
                        VStack {
                            BadgeIndicator(color: .brand, size: .base, emphasis: .strong)
                            Text("Base (8pt)").thdFont(.caption)
                        }
                        VStack {
                            BadgeIndicator(color: .brand, size: .regular, emphasis: .strong)
                            Text("Regular (12pt)").thdFont(.caption)
                        }
                    }
                }

                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)

                // MARK: - Rating Badge
                sectionHeader("Rating Badge", description: "Top Rated style badge with star")

                BadgeAlt()
                BadgeAlt(label: "Best Seller", rating: "4.9")

                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)

                // MARK: - Outline Badges
                sectionHeader("Outline Badges", description: "Transparent background with colored border")

                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                    Text("Colors - Small")
                        .thdFont(.bodySm)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    HStack(spacing: DesignSystemGlobal.Spacing2) {
                        Badge("Info", variant: .outline, color: .info, size: .small)
                        Badge("Success", variant: .outline, color: .success, size: .small)
                        Badge("Warning", variant: .outline, color: .warning, size: .small)
                        Badge("Danger", variant: .outline, color: .danger, size: .small)
                        Badge("Brand", variant: .outline, color: .brand, size: .small)
                    }

                    Text("Colors - Base")
                        .thdFont(.bodySm)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    HStack(spacing: DesignSystemGlobal.Spacing2) {
                        Badge("Info", variant: .outline, color: .info, size: .base)
                        Badge("Success", variant: .outline, color: .success, size: .base)
                        Badge("Warning", variant: .outline, color: .warning, size: .base)
                        Badge("Danger", variant: .outline, color: .danger, size: .base)
                        Badge("Brand", variant: .outline, color: .brand, size: .base)
                    }

                    Text("Neutral Colors")
                        .thdFont(.bodySm)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    HStack(spacing: DesignSystemGlobal.Spacing2) {
                        Badge("Medium", variant: .outline, color: .medium, size: .base)
                        Badge("Primary", variant: .outline, color: .primary, size: .base)
                    }
                }

                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)

                // MARK: - Filled Subtle Badges
                sectionHeader("Filled Subtle", description: "Light background with dark text")

                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                    Text("Colors - Small")
                        .thdFont(.bodySm)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    HStack(spacing: DesignSystemGlobal.Spacing2) {
                        Badge("Info", variant: .filledSubtle, color: .info, size: .small)
                        Badge("Success", variant: .filledSubtle, color: .success, size: .small)
                        Badge("Warning", variant: .filledSubtle, color: .warning, size: .small)
                        Badge("Danger", variant: .filledSubtle, color: .danger, size: .small)
                        Badge("Brand", variant: .filledSubtle, color: .brand, size: .small)
                    }

                    Text("Colors - Base")
                        .thdFont(.bodySm)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    HStack(spacing: DesignSystemGlobal.Spacing2) {
                        Badge("Info", variant: .filledSubtle, color: .info, size: .base)
                        Badge("Success", variant: .filledSubtle, color: .success, size: .base)
                        Badge("Warning", variant: .filledSubtle, color: .warning, size: .base)
                        Badge("Danger", variant: .filledSubtle, color: .danger, size: .base)
                        Badge("Brand", variant: .filledSubtle, color: .brand, size: .base)
                    }
                }

                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)

                // MARK: - Filled Strong Badges
                sectionHeader("Filled Strong", description: "Vibrant background with inverse text")

                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                    Text("Colors - Small")
                        .thdFont(.bodySm)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    HStack(spacing: DesignSystemGlobal.Spacing2) {
                        Badge("Info", variant: .filledStrong, color: .info, size: .small)
                        Badge("Success", variant: .filledStrong, color: .success, size: .small)
                        Badge("Warning", variant: .filledStrong, color: .warning, size: .small)
                        Badge("Danger", variant: .filledStrong, color: .danger, size: .small)
                        Badge("Brand", variant: .filledStrong, color: .brand, size: .small)
                    }

                    Text("Colors - Base")
                        .thdFont(.bodySm)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    HStack(spacing: DesignSystemGlobal.Spacing2) {
                        Badge("Info", variant: .filledStrong, color: .info, size: .base)
                        Badge("Success", variant: .filledStrong, color: .success, size: .base)
                        Badge("Warning", variant: .filledStrong, color: .warning, size: .base)
                        Badge("Danger", variant: .filledStrong, color: .danger, size: .base)
                        Badge("Brand", variant: .filledStrong, color: .brand, size: .base)
                    }

                    Text("Neutral Colors")
                        .thdFont(.bodySm)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    HStack(spacing: DesignSystemGlobal.Spacing2) {
                        Badge("Medium", variant: .filledStrong, color: .medium, size: .base)
                        Badge("Primary", variant: .filledStrong, color: .primary, size: .base)
                    }
                }

                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)

                // MARK: - Use Cases
                sectionHeader("Common Use Cases", description: "Real-world badge applications")

                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                    HStack(spacing: DesignSystemGlobal.Spacing2) {
                        Badge("New", variant: .filledStrong, color: .brand, size: .small)
                        Badge("Sale", variant: .filledStrong, color: .danger, size: .small)
                        Badge("Popular", variant: .filledSubtle, color: .info, size: .small)
                    }

                    HStack(spacing: DesignSystemGlobal.Spacing2) {
                        Badge("In Stock", variant: .outline, color: .success, size: .small)
                        Badge("Low Stock", variant: .outline, color: .warning, size: .small)
                        Badge("Out of Stock", variant: .outline, color: .danger, size: .small)
                    }

                    HStack(spacing: DesignSystemGlobal.Spacing2) {
                        Badge("PRO", variant: .filledStrong, color: .primary, size: .small)
                        Badge("Beta", variant: .outline, color: .info, size: .small)
                        Badge("Updated", variant: .filledSubtle, color: .success, size: .small)
                    }
                }
                .padding(DesignSystemGlobal.Spacing4)
                .background(
                    RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusXl)
                        .fill(DesignSystemGlobal.BackgroundContainerColorWhite)
                )
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

#Preview("Badge Demo") {
    BadgeDemoView()
}
