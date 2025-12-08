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
            VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing4) {
                // Header Card
                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                    Text("Quantity Picker")
                        .thdFont(.hero5)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorPrimary)

                    Text("Expandable quantity selectors with +/- controls.")
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
                    // MARK: - Orange Variant
                    sectionHeader("Orange Variant", description: "Primary brand quantity picker")

                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                    Text("Sizes - Expands Right")
                        .thdFont(.bodySm)
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
                        .thdFont(.bodySm)
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

                    Text("Expands Center")
                        .thdFont(.bodySm)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                        HStack {
                            Text("Small").frame(width: 100, alignment: .leading)
                            QuantityPicker(
                                quantity: .constant(2),
                                color: .orange,
                                size: .small,
                                expansion: .center
                            )
                        }

                        HStack {
                            Text("Medium").frame(width: 100, alignment: .leading)
                            QuantityPicker(
                                quantity: .constant(4),
                                color: .orange,
                                size: .medium,
                                expansion: .center
                            )
                        }

                        HStack {
                            Text("Large").frame(width: 100, alignment: .leading)
                            QuantityPicker(
                                quantity: .constant(6),
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
                        .thdFont(.bodySm)
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
                        .thdFont(.bodySm)
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

                    Text("Expands Center")
                        .thdFont(.bodySm)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                        HStack {
                            Text("Small").frame(width: 100, alignment: .leading)
                            QuantityPicker(
                                quantity: .constant(2),
                                color: .grey,
                                size: .small,
                                expansion: .center
                            )
                        }

                        HStack {
                            Text("Medium").frame(width: 100, alignment: .leading)
                            QuantityPicker(
                                quantity: .constant(4),
                                color: .grey,
                                size: .medium,
                                expansion: .center
                            )
                        }

                        HStack {
                            Text("Large").frame(width: 100, alignment: .leading)
                            QuantityPicker(
                                quantity: .constant(6),
                                color: .grey,
                                size: .large,
                                expansion: .center
                            )
                        }
                    }
                }

                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)

                    // MARK: - Orange Gradient Variants
                    sectionHeader("Orange Gradient Variants", description: "Brand gradients expanding to the right")

                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                    Text("Light to Dark")
                        .thdFont(.bodySm)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                        HStack {
                            Text("Small").frame(width: 100, alignment: .leading)
                            QuantityPicker(quantity: .constant(1), color: .orangeGradientLightToDark, size: .small, expansion: .right)
                        }
                        HStack {
                            Text("Medium").frame(width: 100, alignment: .leading)
                            QuantityPicker(quantity: .constant(3), color: .orangeGradientLightToDark, size: .medium, expansion: .right)
                        }
                        HStack {
                            Text("Large").frame(width: 100, alignment: .leading)
                            QuantityPicker(quantity: .constant(5), color: .orangeGradientLightToDark, size: .large, expansion: .right)
                        }
                    }

                    Text("Dark to Light")
                        .thdFont(.bodySm)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                        HStack {
                            Text("Small").frame(width: 100, alignment: .leading)
                            QuantityPicker(quantity: .constant(1), color: .orangeGradientDarkToLight, size: .small, expansion: .right)
                        }
                        HStack {
                            Text("Medium").frame(width: 100, alignment: .leading)
                            QuantityPicker(quantity: .constant(3), color: .orangeGradientDarkToLight, size: .medium, expansion: .right)
                        }
                        HStack {
                            Text("Large").frame(width: 100, alignment: .leading)
                            QuantityPicker(quantity: .constant(5), color: .orangeGradientDarkToLight, size: .large, expansion: .right)
                        }
                    }
                }

                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)

                    // MARK: - Grey Gradient Variants
                    sectionHeader("Grey Gradient Variants", description: "Neutral gradients expanding to the right")

                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                    Text("Light to Dark")
                        .thdFont(.bodySm)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                        HStack {
                            Text("Small").frame(width: 100, alignment: .leading)
                            QuantityPicker(quantity: .constant(1), color: .greyGradientLightToDark, size: .small, expansion: .right)
                        }
                        HStack {
                            Text("Medium").frame(width: 100, alignment: .leading)
                            QuantityPicker(quantity: .constant(3), color: .greyGradientLightToDark, size: .medium, expansion: .right)
                        }
                        HStack {
                            Text("Large").frame(width: 100, alignment: .leading)
                            QuantityPicker(quantity: .constant(5), color: .greyGradientLightToDark, size: .large, expansion: .right)
                        }
                    }

                    Text("Dark to Light")
                        .thdFont(.bodySm)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                        HStack {
                            Text("Small").frame(width: 100, alignment: .leading)
                            QuantityPicker(quantity: .constant(1), color: .greyGradientDarkToLight, size: .small, expansion: .right)
                        }
                        HStack {
                            Text("Medium").frame(width: 100, alignment: .leading)
                            QuantityPicker(quantity: .constant(3), color: .greyGradientDarkToLight, size: .medium, expansion: .right)
                        }
                        HStack {
                            Text("Large").frame(width: 100, alignment: .leading)
                            QuantityPicker(quantity: .constant(5), color: .greyGradientDarkToLight, size: .large, expansion: .right)
                        }
                    }
                }

                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)

                    // MARK: - Standalone Buttons
                    sectionHeader("Standalone Buttons", description: "Individual +/-/delete buttons")

                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                    Text("Small Size")
                        .thdFont(.bodySm)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    HStack(spacing: DesignSystemGlobal.Spacing3) {
                        VStack {
                            StandaloneQuantityButton(useCase: .add, size: .small)
                            Text("Add").thdFont(.caption)
                        }

                        VStack {
                            StandaloneQuantityButton(useCase: .subtract, size: .small)
                            Text("Subtract").thdFont(.caption)
                        }

                        VStack {
                            StandaloneQuantityButton(useCase: .delete, size: .small)
                            Text("Delete").thdFont(.caption)
                        }
                    }

                    Text("Large Size")
                        .thdFont(.bodySm)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    HStack(spacing: DesignSystemGlobal.Spacing3) {
                        VStack {
                            StandaloneQuantityButton(useCase: .add, size: .large)
                            Text("Add").thdFont(.caption)
                        }

                        VStack {
                            StandaloneQuantityButton(useCase: .subtract, size: .large)
                            Text("Subtract").thdFont(.caption)
                        }

                        VStack {
                            StandaloneQuantityButton(useCase: .delete, size: .large)
                            Text("Delete").thdFont(.caption)
                        }
                    }

                    Text("Disabled State")
                        .thdFont(.bodySm)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    HStack(spacing: DesignSystemGlobal.Spacing3) {
                        VStack {
                            StandaloneQuantityButton(useCase: .add, size: .small, isDisabled: true)
                            Text("Disabled").thdFont(.caption)
                        }

                        VStack {
                            StandaloneQuantityButton(useCase: .subtract, size: .small, isDisabled: true)
                            Text("Disabled").thdFont(.caption)
                        }

                        VStack {
                            StandaloneQuantityButton(useCase: .delete, size: .small, isDisabled: true)
                            Text("Disabled").thdFont(.caption)
                        }
                    }
                }

                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)

                    // MARK: - Size Comparison
                    sectionHeader("Size Comparison", description: "All sizes side by side")

                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                    Text("Orange")
                        .thdFont(.bodySm)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    HStack(alignment: .center, spacing: DesignSystemGlobal.Spacing4) {
                        VStack {
                            QuantityPicker(quantity: .constant(1), color: .orange, size: .small)
                            Text("Small").thdFont(.caption)
                        }

                        VStack {
                            QuantityPicker(quantity: .constant(2), color: .orange, size: .medium)
                            Text("Medium").thdFont(.caption)
                        }

                        VStack {
                            QuantityPicker(quantity: .constant(3), color: .orange, size: .large)
                            Text("Large").thdFont(.caption)
                        }
                    }

                    Text("Grey")
                        .thdFont(.bodySm)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    HStack(alignment: .center, spacing: DesignSystemGlobal.Spacing4) {
                        VStack {
                            QuantityPicker(quantity: .constant(1), color: .grey, size: .small)
                            Text("Small").thdFont(.caption)
                        }

                        VStack {
                            QuantityPicker(quantity: .constant(2), color: .grey, size: .medium)
                            Text("Medium").thdFont(.caption)
                        }

                        VStack {
                            QuantityPicker(quantity: .constant(3), color: .grey, size: .large)
                            Text("Large").thdFont(.caption)
                        }
                    }
                }

                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)

                    // MARK: - Interactive Demo
                    sectionHeader("Interactive Demo", description: "Try tapping to expand")

                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                    Text("Tap the quantity to expand and use +/- buttons")
                        .thdFont(.caption)
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
                            Text("Qty: \(quantity1)").thdFont(.caption)
                        }

                        VStack {
                            QuantityPicker(
                                quantity: $quantity2,
                                color: .grey,
                                size: .medium,
                                expansion: .right,
                                onDelete: { quantity2 = 0 }
                            )
                            Text("Qty: \(quantity2)").thdFont(.caption)
                        }
                    }
                }

                Divider().padding(.vertical, DesignSystemGlobal.Spacing2)

                    // MARK: - Use Cases
                    sectionHeader("Common Use Cases", description: "Real-world quantity picker applications")

                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                    Text("Product Card")
                        .thdFont(.bodySm)
                        .foregroundColor(DesignSystemGlobal.TextOnContainerColorSecondary)

                    HStack {
                        VStack(alignment: .leading) {
                            Text("Milwaukee M18 Drill")
                                .thdFont(.bodyMd)
                            Text("$199.00")
                                .thdFont(.bodySm)
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
                        .thdFont(.bodySm)
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
                                .thdFont(.bodyMd)
                            Text("$358.00")
                                .thdFont(.bodySm)
                        }
                        Spacer()
                    }
                    .padding(DesignSystemGlobal.Spacing3)
                    .background(DesignSystemGlobal.GreigeGreige050)
                    .cornerRadius(DesignSystemGlobal.BorderRadiusXl)
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

#Preview("Quantity Picker Demo") {
    QuantityDemoView()
}
