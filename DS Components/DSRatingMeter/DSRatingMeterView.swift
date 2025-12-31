import SwiftUI

// MARK: - DSRatingMeter Showcase View

/// Comprehensive showcase of the DSRatingMeter component.
///
/// Demonstrates:
/// - 3 size variants (small, medium, large)
/// - Star fill levels (empty, half, full)
/// - Review count labels
/// - Focus state
/// - Factory methods
/// - Usage examples

struct DSRatingMeterView: View {
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
            Text("DSRatingMeter")
                .thdFont(.h3)
                .foregroundStyle(textPrimary)

            Text("A rating meter component that displays star ratings with support for half-star increments. Optionally shows a label with the rating count.")
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
            // Sizes Section
            sizesSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Rating Values Section
            ratingValuesSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Labels Section
            labelsSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Focus State Section
            focusStateSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Factory Methods Section
            factoryMethodsSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Interactive Example Section
            interactiveSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Usage Examples Section
            usageExamplesSection

            Divider().padding(.horizontal, TokensCoreLight.Spacing4)

            // Specifications Section
            specificationsSection
        }
        .background(surfaceWhite)
        .clipShape(.rect(cornerRadius: TokensCoreLight.Spacing3))
    }

    // MARK: - Sizes Section

    private var sizesSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Sizes",
                description: "Three size variants for different contexts."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                HStack {
                    Text(".small")
                        .thdFont(.caption)
                        .foregroundStyle(textSecondary)
                        .frame(width: 80, alignment: .leading)

                    DSRatingMeter(rating: 4.5, reviewCount: 1234, size: .small)
                }

                HStack {
                    Text(".medium")
                        .thdFont(.caption)
                        .foregroundStyle(textSecondary)
                        .frame(width: 80, alignment: .leading)

                    DSRatingMeter(rating: 4.5, reviewCount: 1234, size: .medium)
                }

                HStack {
                    Text(".large")
                        .thdFont(.caption)
                        .foregroundStyle(textSecondary)
                        .frame(width: 80, alignment: .leading)

                    DSRatingMeter(rating: 4.5, reviewCount: 1234, size: .large)
                }
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - Rating Values Section

    private var ratingValuesSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Rating Values",
                description: "Full stars, half stars, and empty stars."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                ratingRow(rating: 5.0, label: "5.0 - Perfect")
                ratingRow(rating: 4.5, label: "4.5 - Half star")
                ratingRow(rating: 4.0, label: "4.0 - Four stars")
                ratingRow(rating: 3.5, label: "3.5 - Half star")
                ratingRow(rating: 3.0, label: "3.0 - Three stars")
                ratingRow(rating: 2.5, label: "2.5 - Half star")
                ratingRow(rating: 2.0, label: "2.0 - Two stars")
                ratingRow(rating: 1.0, label: "1.0 - One star")
                ratingRow(rating: 0.5, label: "0.5 - Half star")
                ratingRow(rating: 0.0, label: "0.0 - Empty")
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    @ViewBuilder
    private func ratingRow(rating: Double, label: String) -> some View {
        HStack {
            DSRatingMeter(rating: rating, size: .small, showLabel: false)

            Spacer()

            Text(label)
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)
        }
    }

    // MARK: - Labels Section

    private var labelsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Review Count Labels",
                description: "Optional review count display with K formatting for large numbers."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                HStack {
                    Text("With count")
                        .thdFont(.caption)
                        .foregroundStyle(textSecondary)
                        .frame(width: 100, alignment: .leading)

                    DSRatingMeter(rating: 4.5, reviewCount: 256, size: .medium)
                }

                HStack {
                    Text("Large count")
                        .thdFont(.caption)
                        .foregroundStyle(textSecondary)
                        .frame(width: 100, alignment: .leading)

                    DSRatingMeter(rating: 4.8, reviewCount: 12500, size: .medium)
                }

                HStack {
                    Text("No label")
                        .thdFont(.caption)
                        .foregroundStyle(textSecondary)
                        .frame(width: 100, alignment: .leading)

                    DSRatingMeter(rating: 4.2, size: .medium, showLabel: false)
                }
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - Focus State Section

    private var focusStateSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Focus State",
                description: "Visual indicator when the component has keyboard focus."
            )

            HStack(spacing: TokensCoreLight.Spacing4) {
                VStack(spacing: TokensCoreLight.Spacing2) {
                    DSRatingMeter(rating: 4.5, reviewCount: 100, size: .medium, isFocused: false)
                    Text("Normal")
                        .thdFont(.caption)
                        .foregroundStyle(textSecondary)
                }

                VStack(spacing: TokensCoreLight.Spacing2) {
                    DSRatingMeter(rating: 4.5, reviewCount: 100, size: .medium, isFocused: true)
                    Text("Focused")
                        .thdFont(.caption)
                        .foregroundStyle(textSecondary)
                }
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - Factory Methods Section

    private var factoryMethodsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Factory Methods",
                description: "Convenience methods for common use cases."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                HStack {
                    Text(".compact()")
                        .thdFont(.caption)
                        .foregroundStyle(textSecondary)
                        .frame(width: 120, alignment: .leading)

                    DSRatingMeter.compact(rating: 4.5)
                }

                HStack {
                    Text(".withReviews()")
                        .thdFont(.caption)
                        .foregroundStyle(textSecondary)
                        .frame(width: 120, alignment: .leading)

                    DSRatingMeter.withReviews(rating: 4.5, reviewCount: 1234)
                }
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - Interactive Section

    private var interactiveSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Interactive Example",
                description: "Adjust the rating value to see star fill updates."
            )

            DSRatingMeterInteractiveExample()
        }
        .padding(TokensCoreLight.Spacing4)
    }

    // MARK: - Usage Examples Section

    private var usageExamplesSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Usage Examples",
                description: "Real-world rating meter implementations."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                Text("Product Card")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                HStack(spacing: 12) {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(surfaceGreige)
                        .frame(width: 80, height: 80)
                        .overlay(
                            Image(systemName: "hammer.fill")
                                .foregroundStyle(textSecondary)
                        )

                    VStack(alignment: .leading, spacing: 4) {
                        Text("DEWALT 20V MAX Drill")
                            .thdFont(.bodySm)
                            .foregroundStyle(textPrimary)

                        DSRatingMeter.withReviews(rating: 4.7, reviewCount: 3456, size: .small)

                        Text("$129.99")
                            .thdFont(.bodySm)
                            .foregroundStyle(textPrimary)
                    }

                    Spacer()
                }
                .padding(12)
                .background(surfaceGreige)
                .clipShape(.rect(cornerRadius: 8))

                Text("Review Summary")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                VStack(alignment: .leading, spacing: 8) {
                    HStack {
                        DSRatingMeter(rating: 4.5, size: .large, showLabel: false)
                        Text("4.5")
                            .thdFont(.h3)
                            .foregroundStyle(textPrimary)
                    }

                    Text("Based on 2,345 reviews")
                        .thdFont(.bodySm)
                        .foregroundStyle(textSecondary)

                    // Rating breakdown
                    ForEach([5, 4, 3, 2, 1], id: \.self) { stars in
                        HStack(spacing: 8) {
                            Text("\(stars)")
                                .thdFont(.caption)
                                .foregroundStyle(textSecondary)
                                .frame(width: 12)

                            Image(systemName: "star.fill")
                                .font(.caption2)
                                .foregroundStyle(starRatingColor)

                            GeometryReader { geometry in
                                RoundedRectangle(cornerRadius: 2)
                                    .fill(surfaceGreige)
                                    .overlay(alignment: .leading) {
                                        RoundedRectangle(cornerRadius: 2)
                                            .fill(starRatingColor)
                                            .frame(width: geometry.size.width * ratingPercentage(for: stars))
                                    }
                            }
                            .frame(height: 8)

                            Text("\(Int(ratingPercentage(for: stars) * 100))%")
                                .thdFont(.caption)
                                .foregroundStyle(textSecondary)
                                .frame(width: 40, alignment: .trailing)
                        }
                    }
                }
                .padding(12)
                .background(surfaceGreige)
                .clipShape(.rect(cornerRadius: 8))

                Text("Compact Inline")
                    .thdFont(.caption)
                    .foregroundStyle(textSecondary)

                HStack {
                    Text("Customer Rating:")
                        .thdFont(.bodyMd)
                        .foregroundStyle(textSecondary)

                    DSRatingMeter.compact(rating: 4.2, size: .small)

                    Text("(4.2)")
                        .thdFont(.bodySm)
                        .foregroundStyle(textSecondary)
                }
            }
        }
        .padding(TokensCoreLight.Spacing4)
    }

    private func ratingPercentage(for stars: Int) -> Double {
        switch stars {
        case 5: return 0.65
        case 4: return 0.22
        case 3: return 0.08
        case 2: return 0.03
        case 1: return 0.02
        default: return 0
        }
    }

    // MARK: - Specifications Section

    private var specificationsSection: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing4) {
            sectionHeader(
                title: "Specifications",
                description: "Technical details and code examples."
            )

            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
                Text("Size Specifications")
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)

                ForEach(DSRatingMeterSize.allCases, id: \.self) { size in
                    specRow(
                        label: sizeName(size),
                        value: "Star: \(Int(size.starSize))pt, Font: \(Int(size.fontSize))pt"
                    )
                }

                Text("Parameters")
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)
                    .padding(.top, TokensCoreLight.Spacing2)

                VStack(alignment: .leading, spacing: 4) {
                    Text("• rating: Double (0.0 to 5.0)")
                    Text("• maxRating: Int (default: 5)")
                    Text("• reviewCount: Int? (optional)")
                    Text("• size: DSRatingMeterSize")
                    Text("• showLabel: Bool (default: true)")
                    Text("• isFocused: Bool (default: false)")
                }
                .thdFont(.bodySm)
                .foregroundStyle(textSecondary)

                Text("Code Example")
                    .thdFont(.bodySm)
                    .foregroundStyle(textPrimary)
                    .padding(.top, TokensCoreLight.Spacing2)

                Text("""
                // Standard rating with reviews
                DSRatingMeter(
                    rating: 4.5,
                    reviewCount: 1234,
                    size: .medium
                )

                // Compact rating (no label)
                DSRatingMeter.compact(rating: 4.5)

                // With reviews factory
                DSRatingMeter.withReviews(
                    rating: 4.5,
                    reviewCount: 1234,
                    size: .small
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

    private func sizeName(_ size: DSRatingMeterSize) -> String {
        switch size {
        case .small: return ".small"
        case .medium: return ".medium"
        case .large: return ".large"
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
    private var starRatingColor: Color { tokens.Lemon100 }
}

// MARK: - Interactive Example

private struct DSRatingMeterInteractiveExample: View {
    @State private var rating: Double = 4.0
    @State private var selectedSize: DSRatingMeterSize = .medium
    @State private var showLabel = true

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            // Preview
            HStack {
                Spacer()
                DSRatingMeter(
                    rating: rating,
                    reviewCount: 1234,
                    size: selectedSize,
                    showLabel: showLabel
                )
                Spacer()
            }
            .padding(.vertical, TokensCoreLight.Spacing3)

            // Rating slider
            VStack(alignment: .leading, spacing: 4) {
                Text("Rating: \(rating, specifier: "%.1f")")
                    .thdFont(.caption)

                Slider(value: $rating, in: 0...5, step: 0.5)
            }

            // Size picker
            HStack {
                Text("Size:")
                    .thdFont(.caption)

                Picker("Size", selection: $selectedSize) {
                    Text("Small").tag(DSRatingMeterSize.small)
                    Text("Medium").tag(DSRatingMeterSize.medium)
                    Text("Large").tag(DSRatingMeterSize.large)
                }
                .pickerStyle(.segmented)
            }

            // Show label toggle
            Toggle("Show Label", isOn: $showLabel)
                .thdFont(.caption)
        }
    }
}

// MARK: - Token Protocol Helper

private protocol TokenSemanticProtocol {
    static var TextOnContainerColorPrimary: Color { get }
    static var TextOnContainerColorSecondary: Color { get }
    static var BackgroundContainerColorWhite: Color { get }
    static var BackgroundSurfaceColorGreige: Color { get }
    static var Lemon100: Color { get }
}

extension TokensSemanticLight: TokenSemanticProtocol {}
extension TokensSemanticDark: TokenSemanticProtocol {}

// MARK: - Preview

#Preview {
    DSRatingMeterView()
}
