import SwiftUI

// MARK: - Icon Half

#Preview("Icon Half") {
    DSFeatureCard(
        feature: DSFeatureItem(
            title: "Easy Installation",
            description: "Mounting hardware included",
            icon: Image(systemName: "checkmark.circle")
        ),
        type: .iconHalf
    )
    .padding()
}

// MARK: - Icon Double

#Preview("Icon Double") {
    DSFeatureCard(
        features: [
            DSFeatureItem(
                title: "Easy Installation",
                description: "Mounting hardware included",
                icon: Image(systemName: "checkmark.circle")
            ),
            DSFeatureItem(
                title: "Durable Design",
                description: "Weather resistant materials",
                icon: Image(systemName: "checkmark.circle")
            )
        ],
        type: .iconDouble
    )
    .padding()
}

// MARK: - Icon Full

#Preview("Icon Full") {
    DSFeatureCard(
        feature: DSFeatureItem(
            title: "Professional Grade Quality",
            description: "Built to last with premium materials and expert craftsmanship",
            icon: Image(systemName: "checkmark.circle")
        ),
        type: .iconFull
    )
    .padding()
}

// MARK: - Half

#Preview("Half") {
    DSFeatureCard(
        feature: DSFeatureItem(
            title: "Easy Installation",
            description: "Mounting hardware included"
        ),
        type: .half
    )
    .padding()
}

// MARK: - Double

#Preview("Double") {
    DSFeatureCard(
        features: [
            DSFeatureItem(
                title: "Easy Installation",
                description: "Mounting hardware included"
            ),
            DSFeatureItem(
                title: "Durable Design",
                description: "Weather resistant materials"
            )
        ],
        type: .double
    )
    .padding()
}

// MARK: - Full

#Preview("Full") {
    DSFeatureCard(
        feature: DSFeatureItem(
            title: "Professional Grade Quality",
            description: "Built to last with premium materials and expert craftsmanship"
        ),
        type: .full
    )
    .padding()
}

// MARK: - All Types

#Preview("All Card Types") {
    ScrollView {
        VStack(spacing: 16) {
            sectionHeader("Icon Half")
            DSFeatureCard(
                feature: DSFeatureItem(
                    title: "Easy Installation",
                    description: "Mounting hardware included"
                ),
                type: .iconHalf
            )

            sectionHeader("Icon Double")
            DSFeatureCard(
                features: [
                    DSFeatureItem(title: "Feature 1", description: "Description 1"),
                    DSFeatureItem(title: "Feature 2", description: "Description 2")
                ],
                type: .iconDouble
            )

            sectionHeader("Icon Full")
            DSFeatureCard(
                feature: DSFeatureItem(
                    title: "Full Width Feature",
                    description: "This is a full width feature card with icon"
                ),
                type: .iconFull
            )

            sectionHeader("Half")
            DSFeatureCard(
                feature: DSFeatureItem(
                    title: "Half Card",
                    description: "Without icon"
                ),
                type: .half
            )

            sectionHeader("Double")
            DSFeatureCard(
                features: [
                    DSFeatureItem(title: "Left", description: "Left content"),
                    DSFeatureItem(title: "Right", description: "Right content")
                ],
                type: .double
            )

            sectionHeader("Full")
            DSFeatureCard(
                feature: DSFeatureItem(
                    title: "Full Width",
                    description: "Full width without icon"
                ),
                type: .full
            )
        }
        .padding()
    }
}

// MARK: - Dark Mode

#Preview("Dark Mode") {
    VStack(spacing: 16) {
        DSFeatureCard(
            feature: DSFeatureItem(
                title: "Easy Installation",
                description: "Mounting hardware included"
            ),
            type: .iconHalf
        )

        DSFeatureCard(
            features: [
                DSFeatureItem(title: "Feature 1", description: "Description 1"),
                DSFeatureItem(title: "Feature 2", description: "Description 2")
            ],
            type: .iconDouble
        )
    }
    .padding()
    .preferredColorScheme(.dark)
}

// MARK: - Factory Methods

#Preview("Factory Methods") {
    VStack(spacing: 16) {
        DSFeatureCard.icon(
            title: "Icon Card",
            description: "Created with factory method"
        )

        DSFeatureCard.simple(
            title: "Simple Card",
            description: "No icon variant"
        )
    }
    .padding()
}

// MARK: - Helpers

@ViewBuilder
private func sectionHeader(_ title: String) -> some View {
    Text(title)
        .font(.caption)
        .foregroundStyle(.secondary)
        .frame(maxWidth: .infinity, alignment: .leading)
}
