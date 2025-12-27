import SwiftUI

// MARK: - DSCallout Previews

#if DEBUG

#Preview("Neutral Variant") {
    VStack(spacing: 20) {
        DSCallout(
            title: "Callout Title",
            subtitle: "Subtitle",
            body: "This is supplementary information."
        )

        DSCallout(
            title: "With Button",
            body: "This callout has an action button.",
            buttonTitle: "Button Text"
        ) {
            print("Button tapped")
        }

        DSCallout(
            body: "Body only callout without title or subtitle."
        )
    }
    .padding()
}

#Preview("Brand Variant") {
    VStack(spacing: 20) {
        DSCallout(
            title: "Brand Callout",
            subtitle: "With accent background",
            body: "This is a brand-styled callout.",
            variant: .brand
        )

        DSCallout(
            title: "Brand with Button",
            body: "Brand callout with action.",
            variant: .brand,
            buttonTitle: "Shop Now"
        ) {
            print("Shop tapped")
        }
    }
    .padding()
}

#Preview("Inverse Variant") {
    VStack(spacing: 20) {
        DSCallout(
            title: "Inverse Callout",
            subtitle: "For dark backgrounds",
            body: "This callout uses inverse colors.",
            variant: .inverse
        )

        DSCallout(
            title: "Inverse with Button",
            body: "Inverse callout with action.",
            variant: .inverse,
            buttonTitle: "Learn More"
        ) {
            print("Learn more tapped")
        }
    }
    .padding()
    .background(Color.white)
}

#Preview("Floating Variants") {
    VStack(spacing: 20) {
        DSCallout(
            title: "Floating Neutral",
            body: "This callout has elevation shadow.",
            isFloating: true
        )

        DSCallout(
            title: "Floating Brand",
            body: "Floating brand callout.",
            variant: .brand,
            isFloating: true
        )

        DSCallout(
            title: "Floating Inverse",
            body: "Floating inverse callout.",
            variant: .inverse,
            isFloating: true
        )
    }
    .padding()
    .background(Color.gray.opacity(0.1))
}

#Preview("All Configurations") {
    ScrollView {
        VStack(spacing: 24) {
            ForEach(DSCalloutVariant.allCases, id: \.self) { variant in
                VStack(alignment: .leading, spacing: 12) {
                    Text("\(String(describing: variant).capitalized) Variant")
                        .font(.headline)

                    // Inline
                    DSCallout(
                        title: "Inline Callout",
                        subtitle: "With subtitle",
                        body: "This is the body text.",
                        variant: variant,
                        isFloating: false,
                        buttonTitle: "Action"
                    ) {}

                    // Floating
                    DSCallout(
                        title: "Floating Callout",
                        body: "With shadow elevation.",
                        variant: variant,
                        isFloating: true
                    )
                }
            }
        }
        .padding()
    }
}

#endif
