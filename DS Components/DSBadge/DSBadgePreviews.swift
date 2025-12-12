//
// DSBadgePreviews.swift
//

import SwiftUI

// MARK: - Size Variants - Outline

#Preview("Sizes - Outline") {
    VStack(alignment: .leading, spacing: 16) {
        Text("Small").font(.caption).foregroundColor(.secondary)
        HStack(spacing: 12) {
            DSBadge(label: "Badge", size: .small, variant: .outline, color: .info)
            DSBadge(label: "Badge", size: .small, variant: .outline, color: .success)
            DSBadge(label: "Badge", size: .small, variant: .outline, color: .warning)
            DSBadge(label: "Badge", size: .small, variant: .outline, color: .danger)
        }
        
        Text("Base").font(.caption).foregroundColor(.secondary)
        HStack(spacing: 12) {
            DSBadge(label: "Badge", size: .base, variant: .outline, color: .info)
            DSBadge(label: "Badge", size: .base, variant: .outline, color: .success)
            DSBadge(label: "Badge", size: .base, variant: .outline, color: .warning)
            DSBadge(label: "Badge", size: .base, variant: .outline, color: .danger)
        }
    }
    .padding()
}

// MARK: - Size Variants - Filled Subtle

#Preview("Sizes - Filled Subtle") {
    VStack(alignment: .leading, spacing: 16) {
        Text("Small").font(.caption).foregroundColor(.secondary)
        HStack(spacing: 12) {
            DSBadge(label: "Badge", size: .small, variant: .filledSubtle, color: .info)
            DSBadge(label: "Badge", size: .small, variant: .filledSubtle, color: .success)
            DSBadge(label: "Badge", size: .small, variant: .filledSubtle, color: .warning)
            DSBadge(label: "Badge", size: .small, variant: .filledSubtle, color: .danger)
        }
        
        Text("Base").font(.caption).foregroundColor(.secondary)
        HStack(spacing: 12) {
            DSBadge(label: "Badge", size: .base, variant: .filledSubtle, color: .info)
            DSBadge(label: "Badge", size: .base, variant: .filledSubtle, color: .success)
            DSBadge(label: "Badge", size: .base, variant: .filledSubtle, color: .warning)
            DSBadge(label: "Badge", size: .base, variant: .filledSubtle, color: .danger)
        }
    }
    .padding()
}

// MARK: - Size Variants - Filled Strong

#Preview("Sizes - Filled Strong") {
    VStack(alignment: .leading, spacing: 16) {
        Text("Small").font(.caption).foregroundColor(.secondary)
        HStack(spacing: 12) {
            DSBadge(label: "Badge", size: .small, variant: .filledStrong, color: .info)
            DSBadge(label: "Badge", size: .small, variant: .filledStrong, color: .success)
            DSBadge(label: "Badge", size: .small, variant: .filledStrong, color: .warning)
            DSBadge(label: "Badge", size: .small, variant: .filledStrong, color: .danger)
        }
        
        Text("Base").font(.caption).foregroundColor(.secondary)
        HStack(spacing: 12) {
            DSBadge(label: "Badge", size: .base, variant: .filledStrong, color: .info)
            DSBadge(label: "Badge", size: .base, variant: .filledStrong, color: .success)
            DSBadge(label: "Badge", size: .base, variant: .filledStrong, color: .warning)
            DSBadge(label: "Badge", size: .base, variant: .filledStrong, color: .danger)
        }
    }
    .padding()
}

// MARK: - All Colors - Outline Small

#Preview("All Colors - Outline Small") {
    VStack(alignment: .leading, spacing: 12) {
        HStack(spacing: 12) {
            DSBadge(label: "Info", size: .small, variant: .outline, color: .info)
            DSBadge(label: "Success", size: .small, variant: .outline, color: .success)
        }
        HStack(spacing: 12) {
            DSBadge(label: "Warning", size: .small, variant: .outline, color: .warning)
            DSBadge(label: "Danger", size: .small, variant: .outline, color: .danger)
        }
        HStack(spacing: 12) {
            DSBadge(label: "Medium", size: .small, variant: .outline, color: .medium)
            DSBadge(label: "Primary", size: .small, variant: .outline, color: .primary)
        }
        HStack(spacing: 12) {
            DSBadge(label: "Brand", size: .small, variant: .outline, color: .brand)
        }
    }
    .padding()
}

// MARK: - All Colors - Filled Subtle Base

#Preview("All Colors - Filled Subtle Base") {
    VStack(alignment: .leading, spacing: 12) {
        HStack(spacing: 12) {
            DSBadge(label: "Info", size: .base, variant: .filledSubtle, color: .info)
            DSBadge(label: "Success", size: .base, variant: .filledSubtle, color: .success)
        }
        HStack(spacing: 12) {
            DSBadge(label: "Warning", size: .base, variant: .filledSubtle, color: .warning)
            DSBadge(label: "Danger", size: .base, variant: .filledSubtle, color: .danger)
        }
        HStack(spacing: 12) {
            DSBadge(label: "Medium", size: .base, variant: .filledSubtle, color: .medium)
            DSBadge(label: "Primary", size: .base, variant: .filledSubtle, color: .primary)
        }
        HStack(spacing: 12) {
            DSBadge(label: "Brand", size: .base, variant: .filledSubtle, color: .brand)
        }
    }
    .padding()
}

// MARK: - All Colors - Filled Strong Base

#Preview("All Colors - Filled Strong Base") {
    VStack(alignment: .leading, spacing: 12) {
        HStack(spacing: 12) {
            DSBadge(label: "Info", size: .base, variant: .filledStrong, color: .info)
            DSBadge(label: "Success", size: .base, variant: .filledStrong, color: .success)
        }
        HStack(spacing: 12) {
            DSBadge(label: "Warning", size: .base, variant: .filledStrong, color: .warning)
            DSBadge(label: "Danger", size: .base, variant: .filledStrong, color: .danger)
        }
        HStack(spacing: 12) {
            DSBadge(label: "Medium", size: .base, variant: .filledStrong, color: .medium)
            DSBadge(label: "Primary", size: .base, variant: .filledStrong, color: .primary)
        }
        HStack(spacing: 12) {
            DSBadge(label: "Brand", size: .base, variant: .filledStrong, color: .brand)
        }
    }
    .padding()
}

// MARK: - With Icons - Outline

#Preview("With Icons - Outline") {
    VStack(alignment: .leading, spacing: 12) {
        Text("Small with Icon").font(.caption).foregroundColor(.secondary)
        HStack(spacing: 12) {
            DSBadge(
                label: "New",
                size: .small,
                variant: .outline,
                color: .info,
                leadingIcon: Image(systemName: "star.fill")
            )
            DSBadge(
                label: "Sale",
                size: .small,
                variant: .outline,
                color: .danger,
                leadingIcon: Image(systemName: "tag.fill")
            )
        }
        
        Text("Base with Icon").font(.caption).foregroundColor(.secondary)
        HStack(spacing: 12) {
            DSBadge(
                label: "Featured",
                size: .base,
                variant: .outline,
                color: .brand,
                leadingIcon: Image(systemName: "sparkles")
            )
            DSBadge(
                label: "Verified",
                size: .base,
                variant: .outline,
                color: .success,
                leadingIcon: Image(systemName: "checkmark.seal.fill")
            )
        }
    }
    .padding()
}

// MARK: - With Icons - Filled Subtle

#Preview("With Icons - Filled Subtle") {
    VStack(alignment: .leading, spacing: 12) {
        HStack(spacing: 12) {
            DSBadge(
                label: "Special",
                size: .base,
                variant: .filledSubtle,
                color: .info,
                leadingIcon: Image(systemName: "gift.fill")
            )
            DSBadge(
                label: "Alert",
                size: .base,
                variant: .filledSubtle,
                color: .warning,
                leadingIcon: Image(systemName: "exclamationmark.triangle.fill")
            )
        }
    }
    .padding()
}

// MARK: - With Icons - Filled Strong

#Preview("With Icons - Filled Strong") {
    VStack(alignment: .leading, spacing: 12) {
        HStack(spacing: 12) {
            DSBadge(
                label: "Premium",
                size: .base,
                variant: .filledStrong,
                color: .brand,
                leadingIcon: Image(systemName: "crown.fill")
            )
            DSBadge(
                label: "Error",
                size: .base,
                variant: .filledStrong,
                color: .danger,
                leadingIcon: Image(systemName: "xmark.circle.fill")
            )
        }
    }
    .padding()
}

// MARK: - Dark Mode - Outline

#Preview("Dark Mode - Outline") {
    VStack(alignment: .leading, spacing: 12) {
        HStack(spacing: 12) {
            DSBadge(label: "Info", variant: .outline, color: .info)
            DSBadge(label: "Success", variant: .outline, color: .success)
            DSBadge(label: "Warning", variant: .outline, color: .warning)
        }
        HStack(spacing: 12) {
            DSBadge(label: "Danger", variant: .outline, color: .danger)
            DSBadge(label: "Primary", variant: .outline, color: .primary)
            DSBadge(label: "Brand", variant: .outline, color: .brand)
        }
    }
    .padding()
    .background(Color.black)
    .preferredColorScheme(.dark)
}

// MARK: - Dark Mode - Filled Subtle

#Preview("Dark Mode - Filled Subtle") {
    VStack(alignment: .leading, spacing: 12) {
        HStack(spacing: 12) {
            DSBadge(label: "Info", variant: .filledSubtle, color: .info)
            DSBadge(label: "Success", variant: .filledSubtle, color: .success)
            DSBadge(label: "Warning", variant: .filledSubtle, color: .warning)
        }
        HStack(spacing: 12) {
            DSBadge(label: "Danger", variant: .filledSubtle, color: .danger)
            DSBadge(label: "Primary", variant: .filledSubtle, color: .primary)
            DSBadge(label: "Brand", variant: .filledSubtle, color: .brand)
        }
    }
    .padding()
    .background(Color.black)
    .preferredColorScheme(.dark)
}

// MARK: - Dark Mode - Filled Strong

#Preview("Dark Mode - Filled Strong") {
    VStack(alignment: .leading, spacing: 12) {
        HStack(spacing: 12) {
            DSBadge(label: "Info", variant: .filledStrong, color: .info)
            DSBadge(label: "Success", variant: .filledStrong, color: .success)
            DSBadge(label: "Warning", variant: .filledStrong, color: .warning)
        }
        HStack(spacing: 12) {
            DSBadge(label: "Danger", variant: .filledStrong, color: .danger)
            DSBadge(label: "Primary", variant: .filledStrong, color: .primary)
            DSBadge(label: "Brand", variant: .filledStrong, color: .brand)
        }
    }
    .padding()
    .background(Color.black)
    .preferredColorScheme(.dark)
}

// MARK: - All Variants Comparison

#Preview("All Variants - Comparison") {
    ScrollView {
        VStack(alignment: .leading, spacing: 24) {
            // Outline
            VStack(alignment: .leading, spacing: 8) {
                Text("Outline").font(.headline)
                HStack(spacing: 8) {
                    ForEach([DSBadge.Color.info, .success, .warning, .danger, .medium, .primary, .brand], id: \.self) { color in
                        DSBadge(label: "Badge", size: .base, variant: .outline, color: color)
                    }
                }
            }
            
            // Filled Subtle
            VStack(alignment: .leading, spacing: 8) {
                Text("Filled Subtle").font(.headline)
                HStack(spacing: 8) {
                    ForEach([DSBadge.Color.info, .success, .warning, .danger, .medium, .primary, .brand], id: \.self) { color in
                        DSBadge(label: "Badge", size: .base, variant: .filledSubtle, color: color)
                    }
                }
            }
            
            // Filled Strong
            VStack(alignment: .leading, spacing: 8) {
                Text("Filled Strong").font(.headline)
                HStack(spacing: 8) {
                    ForEach([DSBadge.Color.info, .success, .warning, .danger, .medium, .primary, .brand], id: \.self) { color in
                        DSBadge(label: "Badge", size: .base, variant: .filledStrong, color: color)
                    }
                }
            }
        }
        .padding()
    }
}
