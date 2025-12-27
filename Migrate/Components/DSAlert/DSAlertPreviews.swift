import SwiftUI

// MARK: - DSAlert Previews

#if DEBUG

#Preview("Informational") {
    VStack(spacing: 20) {
        DSAlert(
            title: "Alert title (optional)",
            body: "This is helpful information you should know.",
            variant: .informational
        )

        DSAlert(
            body: "Informational alert without title.",
            variant: .informational
        ) {
            print("Dismissed")
        }
    }
    .padding()
}

#Preview("Success") {
    VStack(spacing: 20) {
        DSAlert(
            title: "Success!",
            body: "Your changes have been saved successfully.",
            variant: .success
        )

        DSAlert(
            body: "Operation completed.",
            variant: .success
        ) {
            print("Dismissed")
        }
    }
    .padding()
}

#Preview("Warning") {
    VStack(spacing: 20) {
        DSAlert(
            title: "Warning",
            body: "Your session will expire in 5 minutes.",
            variant: .warning
        )

        DSAlert(
            body: "Please review your information before continuing.",
            variant: .warning
        ) {
            print("Dismissed")
        }
    }
    .padding()
}

#Preview("Error") {
    VStack(spacing: 20) {
        DSAlert(
            title: "Error",
            body: "Unable to complete your request. Please try again.",
            variant: .error
        )

        DSAlert(
            body: "Connection failed.",
            variant: .error
        ) {
            print("Dismissed")
        }
    }
    .padding()
}

#Preview("Floating Variants") {
    VStack(spacing: 20) {
        DSAlert(
            title: "Floating Informational",
            body: "This alert has elevation shadow.",
            variant: .informational,
            isFloating: true
        )

        DSAlert(
            title: "Floating Success",
            body: "Floating success alert.",
            variant: .success,
            isFloating: true
        )

        DSAlert(
            title: "Floating Warning",
            body: "Floating warning alert.",
            variant: .warning,
            isFloating: true
        )

        DSAlert(
            title: "Floating Error",
            body: "Floating error alert.",
            variant: .error,
            isFloating: true
        )
    }
    .padding()
    .background(Color.gray.opacity(0.1))
}

#Preview("All Configurations") {
    ScrollView {
        VStack(spacing: 24) {
            ForEach(DSAlertVariant.allCases, id: \.self) { variant in
                VStack(alignment: .leading, spacing: 12) {
                    Text("\(String(describing: variant).capitalized)")
                        .font(.headline)

                    // With title and dismiss
                    DSAlert(
                        title: "Alert Title",
                        body: "This is the alert body text.",
                        variant: variant,
                        isFloating: false
                    ) {
                        print("Dismissed")
                    }

                    // Floating
                    DSAlert(
                        title: "Floating Alert",
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
