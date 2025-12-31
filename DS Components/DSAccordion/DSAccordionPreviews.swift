import SwiftUI

// MARK: - DSAccordion Previews

#if DEBUG

struct AccordionPreviewContainer: View {
    @State private var isExpanded = false

    let title: String
    let subtitle: String?
    let type: DSAccordionType
    let isBorderless: Bool
    let showDivider: Bool

    var body: some View {
        DSAccordion(
            title: title,
            subtitle: subtitle,
            type: type,
            isBorderless: isBorderless,
            showDivider: showDivider,
            isExpanded: $isExpanded
        ) {
            Text("This is the accordion content. It can contain any view including text, images, or other components.")
                .font(.system(size: 14))
                .foregroundStyle(.secondary)
        }
    }
}

#Preview("Simple Accordion") {
    VStack(spacing: 16) {
        AccordionPreviewContainer(
            title: "Getting Started",
            subtitle: nil,
            type: .text,
            isBorderless: true,
            showDivider: false
        )

        AccordionPreviewContainer(
            title: "Product Details",
            subtitle: "View more information",
            type: .text,
            isBorderless: true,
            showDivider: false
        )
    }
    .padding()
}

#Preview("With Border") {
    VStack(spacing: 16) {
        AccordionPreviewContainer(
            title: "Shipping Information",
            subtitle: nil,
            type: .text,
            isBorderless: false,
            showDivider: false
        )

        AccordionPreviewContainer(
            title: "Return Policy",
            subtitle: "90 days return window",
            type: .text,
            isBorderless: false,
            showDivider: true
        )
    }
    .padding()
}

#Preview("Question Type (FAQ)") {
    VStack(spacing: 0) {
        AccordionPreviewContainer(
            title: "How do I return an item?",
            subtitle: nil,
            type: .question,
            isBorderless: true,
            showDivider: true
        )

        AccordionPreviewContainer(
            title: "What is the warranty period?",
            subtitle: nil,
            type: .question,
            isBorderless: true,
            showDivider: true
        )

        AccordionPreviewContainer(
            title: "Do you offer price matching?",
            subtitle: nil,
            type: .question,
            isBorderless: true,
            showDivider: true
        )
    }
    .padding()
}

#Preview("Rating Type") {
    VStack(spacing: 16) {
        AccordionPreviewContainer(
            title: "Customer Reviews",
            subtitle: "4.5 out of 5 stars",
            type: .rating,
            isBorderless: false,
            showDivider: true
        )
    }
    .padding()
}

#Preview("Product Specs Type") {
    VStack(spacing: 16) {
        AccordionPreviewContainer(
            title: "Specifications",
            subtitle: "Technical details",
            type: .productSpecs,
            isBorderless: true,
            showDivider: true
        )
    }
    .padding()
}

#Preview("Product Details Type") {
    VStack(spacing: 16) {
        AccordionPreviewContainer(
            title: "About This Product",
            subtitle: "Features and highlights",
            type: .productDetails,
            isBorderless: true,
            showDivider: true
        )
    }
    .padding()
}

#Preview("With Divider") {
    VStack(spacing: 0) {
        AccordionPreviewContainer(
            title: "Section 1",
            subtitle: nil,
            type: .text,
            isBorderless: true,
            showDivider: true
        )

        AccordionPreviewContainer(
            title: "Section 2",
            subtitle: nil,
            type: .text,
            isBorderless: true,
            showDivider: true
        )

        AccordionPreviewContainer(
            title: "Section 3",
            subtitle: nil,
            type: .text,
            isBorderless: true,
            showDivider: true
        )
    }
    .padding()
}

#Preview("Interactive Example") {
    struct InteractivePreview: View {
        @State private var section1Expanded = true
        @State private var section2Expanded = false
        @State private var section3Expanded = false

        var body: some View {
            VStack(spacing: 0) {
                DSAccordion(
                    title: "Product Description",
                    subtitle: "Learn about this product",
                    isExpanded: $section1Expanded
                ) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("This premium power drill features:")
                            .font(.system(size: 14, weight: .medium))
                        Text("• 20V MAX lithium-ion battery")
                        Text("• Variable speed trigger")
                        Text("• LED work light")
                        Text("• Ergonomic grip design")
                    }
                    .font(.system(size: 14))
                    .foregroundStyle(.secondary)
                }

                Divider()

                DSAccordion(
                    title: "Specifications",
                    isExpanded: $section2Expanded
                ) {
                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Text("Voltage:")
                            Spacer()
                            Text("20V MAX")
                        }
                        HStack {
                            Text("Speed:")
                            Spacer()
                            Text("0-1500 RPM")
                        }
                        HStack {
                            Text("Weight:")
                            Spacer()
                            Text("3.5 lbs")
                        }
                    }
                    .font(.system(size: 14))
                    .foregroundStyle(.secondary)
                }

                Divider()

                DSAccordion(
                    title: "Reviews",
                    subtitle: "4.8 stars (2,453 reviews)",
                    isExpanded: $section3Expanded
                ) {
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Text("★★★★★")
                                .foregroundStyle(.orange)
                            Text("Great drill!")
                                .font(.system(size: 14, weight: .medium))
                        }
                        Text("This drill exceeded my expectations. Powerful and lightweight.")
                            .font(.system(size: 14))
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .padding()
        }
    }

    return InteractivePreview()
}

#Preview("All Types") {
    ScrollView {
        VStack(spacing: 24) {
            ForEach(DSAccordionType.allCases, id: \.self) { type in
                VStack(alignment: .leading, spacing: 8) {
                    Text("\(String(describing: type))")
                        .font(.headline)
                        .padding(.horizontal)

                    AccordionPreviewContainer(
                        title: "Accordion Title",
                        subtitle: "Optional subtitle text",
                        type: type,
                        isBorderless: false,
                        showDivider: true
                    )
                    .padding(.horizontal)
                }
            }
        }
        .padding(.vertical)
    }
}

#endif
