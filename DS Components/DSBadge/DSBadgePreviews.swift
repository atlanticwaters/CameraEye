import SwiftUI

// MARK: - DSBadge Previews

#if DEBUG

#Preview("All Colors - Outline") {
    VStack(alignment: .leading, spacing: 12) {
        Text("Outline Variant").font(.headline)

        HStack(spacing: 8) {
            DSBadge("Info", color: .info)
            DSBadge("Success", color: .success)
            DSBadge("Warning", color: .warning)
            DSBadge("Danger", color: .danger)
        }

        HStack(spacing: 8) {
            DSBadge("Primary", color: .primary)
            DSBadge("Medium", color: .medium)
            DSBadge("Brand", color: .brand)
        }
    }
    .padding()
}

#Preview("All Colors - Filled Subtle") {
    VStack(alignment: .leading, spacing: 12) {
        Text("Filled Subtle Variant").font(.headline)

        HStack(spacing: 8) {
            DSBadge("Info", variant: .filledSubtle, color: .info)
            DSBadge("Success", variant: .filledSubtle, color: .success)
            DSBadge("Warning", variant: .filledSubtle, color: .warning)
            DSBadge("Danger", variant: .filledSubtle, color: .danger)
        }

        HStack(spacing: 8) {
            DSBadge("Primary", variant: .filledSubtle, color: .primary)
            DSBadge("Medium", variant: .filledSubtle, color: .medium)
            DSBadge("Brand", variant: .filledSubtle, color: .brand)
        }
    }
    .padding()
}

#Preview("All Colors - Filled Strong") {
    VStack(alignment: .leading, spacing: 12) {
        Text("Filled Strong Variant").font(.headline)

        HStack(spacing: 8) {
            DSBadge("Info", variant: .filledStrong, color: .info)
            DSBadge("Success", variant: .filledStrong, color: .success)
            DSBadge("Warning", variant: .filledStrong, color: .warning)
            DSBadge("Danger", variant: .filledStrong, color: .danger)
        }

        HStack(spacing: 8) {
            DSBadge("Primary", variant: .filledStrong, color: .primary)
            DSBadge("Medium", variant: .filledStrong, color: .medium)
            DSBadge("Brand", variant: .filledStrong, color: .brand)
        }
    }
    .padding()
}

#Preview("Sizes") {
    VStack(alignment: .leading, spacing: 16) {
        VStack(alignment: .leading, spacing: 8) {
            Text("Small Size").font(.headline)
            HStack(spacing: 8) {
                DSBadge("Outline", size: .small, variant: .outline, color: .info)
                DSBadge("Subtle", size: .small, variant: .filledSubtle, color: .success)
                DSBadge("Strong", size: .small, variant: .filledStrong, color: .danger)
            }
        }

        VStack(alignment: .leading, spacing: 8) {
            Text("Base Size").font(.headline)
            HStack(spacing: 8) {
                DSBadge("Outline", size: .base, variant: .outline, color: .info)
                DSBadge("Subtle", size: .base, variant: .filledSubtle, color: .success)
                DSBadge("Strong", size: .base, variant: .filledStrong, color: .danger)
            }
        }
    }
    .padding()
}

#Preview("With Icons") {
    VStack(alignment: .leading, spacing: 12) {
        Text("With Leading Icons").font(.headline)

        HStack(spacing: 8) {
            DSBadge(
                "New",
                variant: .filledStrong,
                color: .brand,
                leadingIcon: Image(systemName: "sparkles")
            )

            DSBadge(
                "In Stock",
                variant: .filledSubtle,
                color: .success,
                leadingIcon: Image(systemName: "checkmark")
            )

            DSBadge(
                "Limited",
                variant: .outline,
                color: .warning,
                leadingIcon: Image(systemName: "exclamationmark.triangle")
            )
        }

        HStack(spacing: 8) {
            DSBadge(
                "Sale",
                size: .base,
                variant: .filledStrong,
                color: .danger,
                leadingIcon: Image(systemName: "tag")
            )

            DSBadge(
                "Info",
                size: .base,
                variant: .outline,
                color: .info,
                leadingIcon: Image(systemName: "info.circle")
            )
        }
    }
    .padding()
}

#Preview("Factory Methods") {
    VStack(alignment: .leading, spacing: 12) {
        Text("Factory Methods").font(.headline)

        HStack(spacing: 8) {
            DSBadge.info("Info")
            DSBadge.success("Success")
            DSBadge.warning("Warning")
            DSBadge.danger("Danger")
        }

        HStack(spacing: 8) {
            DSBadge.primary("Primary")
            DSBadge.brand("Brand")
        }
    }
    .padding()
}

#Preview("All Combinations") {
    ScrollView {
        VStack(alignment: .leading, spacing: 24) {
            ForEach(DSBadgeVariant.allCases, id: \.self) { variant in
                VStack(alignment: .leading, spacing: 8) {
                    Text("\(String(describing: variant))")
                        .font(.headline)

                    LazyVGrid(columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible()),
                        GridItem(.flexible()),
                        GridItem(.flexible()),
                    ], spacing: 8) {
                        ForEach(DSBadgeColor.allCases, id: \.self) { color in
                            DSBadge(
                                "\(String(describing: color).prefix(4))",
                                variant: variant,
                                color: color
                            )
                        }
                    }
                }
            }
        }
        .padding()
    }
}

#endif
