import SwiftUI

// MARK: - DSPLPPodButtonSet Showcase View

/// Comprehensive showcase of the DSPLPPodButtonSet component.
///
/// Demonstrates:
/// - B2C variant (Add to Cart only)
/// - B2B variant (Quantity picker + Add to Cart + Add to List)
/// - Disabled states
/// - Interactive quantity controls
/// - Usage examples

struct DSPLPPodButtonSetView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing6) {
                // Header Card
                headerCard

                // Content Card with all sections
                contentCard
            }
            .padding(TokensCoreLight.Spacing4)
            .padding(.top, TokensCoreLight.Spacing24)
            .padding(.bottom, TokensCoreLight.Spacing20)
        }
        .background(surfaceGreige)
        .applySoftScrollEdges()
    }

    // MARK: - Header Card

    private var headerCard: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
            Text("DSPLPPodButtonSet")
                .thdFont(.h3)
                .foregroundStyle(textPrimary)

            Text("A component for displaying action buttons in a PLP pod. Displays either a simple B2C layout with just an Add to Cart button, or a B2B layout with quantity picker, Add to Cart, and Add to List buttons.")
                .thdFont(.bodyMd)
                .foregroundStyle(textSecondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(TokensCoreLight.Spacing4)
        .background(surfaceWhite)
        .clipShape(.rect(cornerRadius: TokensCoreLight.Spacing3))
    }

    // MARK: - Content Card

    private var contentCard: some View {
        VStack(alignment: .leading, spacing: 0) {
            // B2C Variant Section
            b2cVariantSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // B2B Variant Section
            b2bVariantSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Disabled States Section
            disabledStatesSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Interactive Example Section
            interactiveSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Specifications Section
            specificationsSection
        }
        .background(surfaceWhite)
        .clipShape(.rect(cornerRadius: TokensCoreLight.Spacing3))
    }

    // MARK: - B2C Variant Section

    private var b2cVariantSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "B2C Variant",
                description: "Consumer layout with Add to Cart button only."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                DSPLPPodButtonSet(
                    variant: .b2c,
                    onAddToCart: { }
                )
                .frame(width: 200)
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - B2B Variant Section

    private var b2bVariantSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "B2B Variant",
                description: "Business layout with quantity picker, Add to Cart, and Add to List."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                DSPLPPodButtonSet(
                    variant: .b2b,
                    quantity: 1,
                    onQuantityChanged: { _ in },
                    onAddToCart: { },
                    onAddToList: { }
                )
                .frame(width: 200)
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - Disabled States Section

    private var disabledStatesSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Disabled States",
                description: "Buttons can be individually disabled."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                Text("Add to Cart Disabled")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSPLPPodButtonSet(
                    variant: .b2c,
                    isAddToCartEnabled: false
                )
                .frame(width: 200)

                Text("Add to List Disabled")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSPLPPodButtonSet(
                    variant: .b2b,
                    quantity: 1,
                    isAddToCartEnabled: true,
                    isAddToListEnabled: false
                )
                .frame(width: 200)

                Text("Both Disabled")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                DSPLPPodButtonSet(
                    variant: .b2b,
                    quantity: 1,
                    isAddToCartEnabled: false,
                    isAddToListEnabled: false
                )
                .frame(width: 200)
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - Interactive Section

    private var interactiveSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Interactive Example",
                description: "Try the quantity controls."
            )

            DSPLPPodButtonSetInteractiveExample()
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - Specifications Section

    private var specificationsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Specifications",
                description: "Technical details and code examples."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                specRow(label: "Button Height", value: "44pt")
                specRow(label: "Quantity Button Size", value: "44pt circle")
                specRow(label: "Corner Radius", value: "8pt")
                specRow(label: "Button Spacing", value: "8pt")

                Text("Parameters")
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)
                    .padding(.top, TokensCoreLight.Spacing2)

                VStack(alignment: .leading, spacing: 4) {
                    Text("• variant: .b2c or .b2b")
                    Text("• quantity: Int (default: 1)")
                    Text("• minQuantity: Int (default: 1)")
                    Text("• maxQuantity: Int (default: 99)")
                    Text("• addToCartText: String")
                    Text("• addToListText: String")
                    Text("• isAddToCartEnabled: Bool")
                    Text("• isAddToListEnabled: Bool")
                }
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)

                Text("Code Example")
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)
                    .padding(.top, TokensCoreLight.Spacing2)

                Text("""
                // B2C variant
                DSPLPPodButtonSet(
                    variant: .b2c,
                    onAddToCart: { print("Add to cart") }
                )

                // B2B variant
                DSPLPPodButtonSet(
                    variant: .b2b,
                    quantity: 1,
                    minQuantity: 1,
                    maxQuantity: 10,
                    onQuantityChanged: { qty in
                        print("Quantity: \\(qty)")
                    },
                    onAddToCart: { print("Add to cart") },
                    onAddToList: { print("Add to list") }
                )
                """)
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
                .padding(TokensCoreLight.Spacing3)
                .background(surfaceGreige)
                .clipShape(.rect(cornerRadius: 8))
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - Helper Methods

    @ViewBuilder
    private func sectionHeader(title: String, description: String) -> some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
            Text(title)
                .thdFont(.h5)
                .foregroundStyle(textPrimary)

            Text(description)
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
        }
    }

    @ViewBuilder
    private func specRow(label: String, value: String) -> some View {
        HStack {
            Text(label)
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
            Spacer()
            Text(value)
                .thdFont(.bodySm)
                .foregroundStyle(textPrimary)
        }
    }

    // MARK: - Theme-Aware Colors

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    private var surfaceWhite: Color { tokens.BackgroundContainerColorWhite }
    private var surfaceGreige: Color { tokens.BackgroundSurfaceColorGreige }
    private var textPrimary: Color { tokens.TextOnContainerColorPrimary }
    private var textSecondary: Color { tokens.TextOnContainerColorSecondary }
}

// MARK: - Interactive Example

private struct DSPLPPodButtonSetInteractiveExample: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var quantity: Int = 1
    @State private var lastAction: String = "Interact with buttons..."

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            Text("Last Action: \(lastAction)")
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
                .padding(TokensCoreLight.Spacing2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(surfaceGreige)
                .clipShape(.rect(cornerRadius: 8))

            DSPLPPodButtonSet(
                variant: .b2b,
                quantity: quantity,
                minQuantity: 1,
                maxQuantity: 10,
                onQuantityChanged: { newQty in
                    quantity = newQty
                    lastAction = "Quantity changed to \(newQty)"
                },
                onAddToCart: {
                    lastAction = "Add to Cart tapped (qty: \(quantity))"
                },
                onAddToList: {
                    lastAction = "Add to List tapped"
                }
            )
            .frame(width: 220)
        }
    }

    private var tokens: any TokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    private var surfaceGreige: Color { tokens.BackgroundSurfaceColorGreige }
    private var textSecondary: Color { tokens.TextOnContainerColorSecondary }
}

// MARK: - Token Protocol Helper

private protocol TokenSemanticProtocol {
    static var TextOnContainerColorPrimary: Color { get }
    static var TextOnContainerColorSecondary: Color { get }
    static var BackgroundContainerColorWhite: Color { get }
    static var BackgroundSurfaceColorGreige: Color { get }
}

extension TokensSemanticLight: TokenSemanticProtocol {}
extension TokensSemanticDark: TokenSemanticProtocol {}

// MARK: - Preview

#Preview {
    DSPLPPodButtonSetView()
}
