import SwiftUI

// MARK: - Quantity Picker Demo View
/// Comprehensive demo view showcasing all QuantityPicker and StandaloneQuantityButton variants.
///
/// This view provides a complete inventory of quantity picker components for design review
/// and development reference.
struct QuantityDemoView: View {
    @State private var quantity1 = 1
    @State private var quantity2 = 3
    @State private var quantity3 = 5

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing6) {
                // Header
                Text("Quantity Picker")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

                Text("Expandable quantity selectors with +/- controls.")
                    .font(.system(size: DesignSystemGlobal.FontFontSizeBodyMd, weight: .regular))
                    .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)

                // MARK: - Orange Variant
                sectionHeader("Orange Variant", description: "Primary brand quantity picker")

                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                    Text("Sizes - Expands Right")
                        .font(.subheadline)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                        HStack {
                            Text("Small (28pt)").frame(width: 100, alignment: .leading)
                            QuantityPicker(
                                quantity: $quantity1,
                                color: .orange,
                                size: .small,
                                expansion: .right
                            )
                        }

                        HStack {
                            Text("Medium (36pt)").frame(width: 100, alignment: .leading)
                            QuantityPicker(
                                quantity: $quantity2,
                                color: .orange,
                                size: .medium,
                                expansion: .right
                            )
                        }

                        HStack {
                            Text("Large (44pt)").frame(width: 100, alignment: .leading)
                            QuantityPicker(
                                quantity: $quantity3,
                                color: .orange,
                                size: .large,
                                expansion: .right
                            )
                        }
                    }

                    Text("Expands Left")
                        .font(.subheadline)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    HStack {
                        Spacer()
                        VStack(alignment: .trailing, spacing: DesignSystemGlobal.Spacing2) {
                            QuantityPicker(
                                quantity: .constant(2),
                                color: .orange,
                                size: .small,
                                expansion: .left
                            )

                            QuantityPicker(
                                quantity: .constant(4),
                                color: .orange,
                                size: .medium,
                                expansion: .left
                            )

                            QuantityPicker(
                                quantity: .constant(6),
                                color: .orange,
                                size: .large,
                                expansion: .left
                            )
                        }
                    }

                    Text("Expands from Center")
                        .font(.subheadline)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                        HStack {
                            Text("Small").frame(width: 100, alignment: .leading)
                            QuantityPicker(
                                quantity: .constant(1),
                                color: .orange,
                                size: .small,
                                expansion: .center
                            )
                        }

                        HStack {
                            Text("Medium").frame(width: 100, alignment: .leading)
                            QuantityPicker(
                                quantity: .constant(3),
                                color: .orange,
                                size: .medium,
                                expansion: .center
                            )
                        }

                        HStack {
                            Text("Large").frame(width: 100, alignment: .leading)
                            QuantityPicker(
                                quantity: .constant(5),
                                color: .orange,
                                size: .large,
                                expansion: .center
                            )
                        }
                    }
                }

                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)

                // MARK: - Grey Variant
                sectionHeader("Grey Variant", description: "Neutral quantity picker")

                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                    Text("Sizes - Expands Right")
                        .font(.subheadline)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                        HStack {
                            Text("Small").frame(width: 100, alignment: .leading)
                            QuantityPicker(
                                quantity: .constant(1),
                                color: .grey,
                                size: .small,
                                expansion: .right
                            )
                        }

                        HStack {
                            Text("Medium").frame(width: 100, alignment: .leading)
                            QuantityPicker(
                                quantity: .constant(3),
                                color: .grey,
                                size: .medium,
                                expansion: .right
                            )
                        }

                        HStack {
                            Text("Large").frame(width: 100, alignment: .leading)
                            QuantityPicker(
                                quantity: .constant(5),
                                color: .grey,
                                size: .large,
                                expansion: .right
                            )
                        }
                    }

                    Text("Expands Left")
                        .font(.subheadline)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    HStack {
                        Spacer()
                        VStack(alignment: .trailing, spacing: DesignSystemGlobal.Spacing2) {
                            QuantityPicker(
                                quantity: .constant(2),
                                color: .grey,
                                size: .small,
                                expansion: .left
                            )

                            QuantityPicker(
                                quantity: .constant(4),
                                color: .grey,
                                size: .medium,
                                expansion: .left
                            )
                        }
                    }

                    Text("Expands from Center")
                        .font(.subheadline)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                        HStack {
                            Text("Small").frame(width: 100, alignment: .leading)
                            QuantityPicker(
                                quantity: .constant(1),
                                color: .grey,
                                size: .small,
                                expansion: .center
                            )
                        }

                        HStack {
                            Text("Medium").frame(width: 100, alignment: .leading)
                            QuantityPicker(
                                quantity: .constant(3),
                                color: .grey,
                                size: .medium,
                                expansion: .center
                            )
                        }

                        HStack {
                            Text("Large").frame(width: 100, alignment: .leading)
                            QuantityPicker(
                                quantity: .constant(5),
                                color: .grey,
                                size: .large,
                                expansion: .center
                            )
                        }
                    }
                }

                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)

                // MARK: - Orange Gradient Variants
                sectionHeader("Orange Gradient Variants", description: "Brand gradient quantity pickers")

                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                    Text("Light to Dark")
                        .font(.subheadline)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                        HStack {
                            Text("Small").frame(width: 100, alignment: .leading)
                            QuantityPicker(
                                quantity: .constant(1),
                                color: .orangeGradientLightToDark,
                                size: .small,
                                expansion: .right
                            )
                        }

                        HStack {
                            Text("Medium").frame(width: 100, alignment: .leading)
                            QuantityPicker(
                                quantity: .constant(3),
                                color: .orangeGradientLightToDark,
                                size: .medium,
                                expansion: .right
                            )
                        }

                        HStack {
                            Text("Large").frame(width: 100, alignment: .leading)
                            QuantityPicker(
                                quantity: .constant(5),
                                color: .orangeGradientLightToDark,
                                size: .large,
                                expansion: .right
                            )
                        }
                    }

                    Text("Dark to Light")
                        .font(.subheadline)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                        HStack {
                            Text("Small").frame(width: 100, alignment: .leading)
                            QuantityPicker(
                                quantity: .constant(1),
                                color: .orangeGradientDarkToLight,
                                size: .small,
                                expansion: .right
                            )
                        }

                        HStack {
                            Text("Medium").frame(width: 100, alignment: .leading)
                            QuantityPicker(
                                quantity: .constant(3),
                                color: .orangeGradientDarkToLight,
                                size: .medium,
                                expansion: .right
                            )
                        }

                        HStack {
                            Text("Large").frame(width: 100, alignment: .leading)
                            QuantityPicker(
                                quantity: .constant(5),
                                color: .orangeGradientDarkToLight,
                                size: .large,
                                expansion: .right
                            )
                        }
                    }
                }

                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)

                // MARK: - Grey Gradient Variants
                sectionHeader("Grey Gradient Variants", description: "Neutral gradient quantity pickers")

                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                    Text("Light to Dark")
                        .font(.subheadline)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                        HStack {
                            Text("Small").frame(width: 100, alignment: .leading)
                            QuantityPicker(
                                quantity: .constant(1),
                                color: .greyGradientLightToDark,
                                size: .small,
                                expansion: .right
                            )
                        }

                        HStack {
                            Text("Medium").frame(width: 100, alignment: .leading)
                            QuantityPicker(
                                quantity: .constant(3),
                                color: .greyGradientLightToDark,
                                size: .medium,
                                expansion: .right
                            )
                        }

                        HStack {
                            Text("Large").frame(width: 100, alignment: .leading)
                            QuantityPicker(
                                quantity: .constant(5),
                                color: .greyGradientLightToDark,
                                size: .large,
                                expansion: .right
                            )
                        }
                    }

                    Text("Dark to Light")
                        .font(.subheadline)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                        HStack {
                            Text("Small").frame(width: 100, alignment: .leading)
                            QuantityPicker(
                                quantity: .constant(1),
                                color: .greyGradientDarkToLight,
                                size: .small,
                                expansion: .right
                            )
                        }

                        HStack {
                            Text("Medium").frame(width: 100, alignment: .leading)
                            QuantityPicker(
                                quantity: .constant(3),
                                color: .greyGradientDarkToLight,
                                size: .medium,
                                expansion: .right
                            )
                        }

                        HStack {
                            Text("Large").frame(width: 100, alignment: .leading)
                            QuantityPicker(
                                quantity: .constant(5),
                                color: .greyGradientDarkToLight,
                                size: .large,
                                expansion: .right
                            )
                        }
                    }
                }

                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)

                // MARK: - Standalone Buttons
                sectionHeader("Standalone Buttons", description: "Individual +/-/delete buttons")

                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                    Text("Small Size")
                        .font(.subheadline)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    HStack(spacing: DesignSystemGlobal.Spacing3) {
                        VStack {
                            StandaloneQuantityButton(useCase: .add, size: .small)
                            Text("Add").font(.caption2)
                        }

                        VStack {
                            StandaloneQuantityButton(useCase: .subtract, size: .small)
                            Text("Subtract").font(.caption2)
                        }

                        VStack {
                            StandaloneQuantityButton(useCase: .delete, size: .small)
                            Text("Delete").font(.caption2)
                        }
                    }

                    Text("Large Size")
                        .font(.subheadline)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    HStack(spacing: DesignSystemGlobal.Spacing3) {
                        VStack {
                            StandaloneQuantityButton(useCase: .add, size: .large)
                            Text("Add").font(.caption2)
                        }

                        VStack {
                            StandaloneQuantityButton(useCase: .subtract, size: .large)
                            Text("Subtract").font(.caption2)
                        }

                        VStack {
                            StandaloneQuantityButton(useCase: .delete, size: .large)
                            Text("Delete").font(.caption2)
                        }
                    }

                    Text("Disabled State")
                        .font(.subheadline)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    HStack(spacing: DesignSystemGlobal.Spacing3) {
                        VStack {
                            StandaloneQuantityButton(useCase: .add, size: .small, isDisabled: true)
                            Text("Disabled").font(.caption2)
                        }

                        VStack {
                            StandaloneQuantityButton(useCase: .subtract, size: .small, isDisabled: true)
                            Text("Disabled").font(.caption2)
                        }

                        VStack {
                            StandaloneQuantityButton(useCase: .delete, size: .small, isDisabled: true)
                            Text("Disabled").font(.caption2)
                        }
                    }
                }

                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)

                // MARK: - Size Comparison
                sectionHeader("Size Comparison", description: "All sizes side by side")

                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                    Text("Orange")
                        .font(.subheadline)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    HStack(alignment: .center, spacing: DesignSystemGlobal.Spacing4) {
                        VStack {
                            QuantityPicker(quantity: .constant(1), color: .orange, size: .small)
                            Text("Small").font(.caption2)
                        }

                        VStack {
                            QuantityPicker(quantity: .constant(2), color: .orange, size: .medium)
                            Text("Medium").font(.caption2)
                        }

                        VStack {
                            QuantityPicker(quantity: .constant(3), color: .orange, size: .large)
                            Text("Large").font(.caption2)
                        }
                    }

                    Text("Grey")
                        .font(.subheadline)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    HStack(alignment: .center, spacing: DesignSystemGlobal.Spacing4) {
                        VStack {
                            QuantityPicker(quantity: .constant(1), color: .grey, size: .small)
                            Text("Small").font(.caption2)
                        }

                        VStack {
                            QuantityPicker(quantity: .constant(2), color: .grey, size: .medium)
                            Text("Medium").font(.caption2)
                        }

                        VStack {
                            QuantityPicker(quantity: .constant(3), color: .grey, size: .large)
                            Text("Large").font(.caption2)
                        }
                    }
                }

                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)

                // MARK: - Interactive Demo
                sectionHeader("Interactive Demo", description: "Try tapping to expand")

                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                    Text("Tap the quantity to expand and use +/- buttons")
                        .font(.caption)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorTertiary)

                    HStack(spacing: DesignSystemGlobal.Spacing4) {
                        VStack {
                            QuantityPicker(
                                quantity: $quantity1,
                                color: .orange,
                                size: .medium,
                                expansion: .right,
                                onDelete: { quantity1 = 0 }
                            )
                            Text("Qty: \(quantity1)").font(.caption)
                        }

                        VStack {
                            QuantityPicker(
                                quantity: $quantity2,
                                color: .grey,
                                size: .medium,
                                expansion: .right,
                                onDelete: { quantity2 = 0 }
                            )
                            Text("Qty: \(quantity2)").font(.caption)
                        }
                    }
                }

                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)

                // MARK: - Use Cases
                sectionHeader("Common Use Cases", description: "Real-world quantity picker applications")

                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                    Text("Product Card")
                        .font(.subheadline)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    HStack {
                        VStack(alignment: .leading) {
                            Text("Milwaukee M18 Drill")
                                .font(.system(size: DesignSystemGlobal.FontFontSizeBodyMd, weight: .semibold))
                            Text("$199.00")
                                .font(.system(size: DesignSystemGlobal.FontFontSizeBodySm))
                                .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)
                        }
                        Spacer()
                        QuantityPicker(
                            quantity: .constant(1),
                            color: .orange,
                            size: .small,
                            expansion: .left
                        )
                    }
                    .padding(DesignSystemGlobal.Spacing3)
                    .background(DesignSystemGlobal.GreigeGreige050)
                    .cornerRadius(DesignSystemGlobal.BorderRadiusXl)

                    Text("Cart Item")
                        .font(.subheadline)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    HStack {
                        QuantityPicker(
                            quantity: .constant(2),
                            color: .grey,
                            size: .medium,
                            expansion: .right
                        )
                        VStack(alignment: .leading) {
                            Text("2x DeWalt Circular Saw")
                                .font(.system(size: DesignSystemGlobal.FontFontSizeBodyMd))
                            Text("$358.00")
                                .font(.system(size: DesignSystemGlobal.FontFontSizeBodySm, weight: .semibold))
                        }
                        Spacer()
                    }
                    .padding(DesignSystemGlobal.Spacing3)
                    .background(DesignSystemGlobal.GreigeGreige050)
                    .cornerRadius(DesignSystemGlobal.BorderRadiusXl)
                }
            }
            .padding(DesignSystemGlobal.Spacing4)
        }
        .background(DesignSystemGlobal.BackgroundContainerColorWhite)
    }

    // MARK: - Helper Views

    private func sectionHeader(_ title: String, description: String) -> some View {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing1) {
            Text(title)
                .font(.headline)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

            Text(description)
                .font(.caption)
                .foregroundColor(DesignSystemGlobal.TextOnContainerColorTertiary)
        }
    }
}

#Preview("Quantity Picker Demo") {
    QuantityDemoView()
}
