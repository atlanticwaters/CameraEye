import SwiftUI

#Preview("Callout Variants") {
    VStack(spacing: 16) {
        DSCallout.neutral(
            message: "This is supplementary information.",
            buttonText: "Button Text",
            onButtonTap: { print("Tapped") }
        )
        
        DSCallout.brand(
            title: "Callout Title (Optional)",
            subtitle: "Subtitle",
            message: "This is supplementary information.",
            buttonText: "Button Text",
            onButtonTap: { print("Tapped") }
        )
        
        DSCallout.inverse(
            title: "Callout Title (Optional)",
            subtitle: "Subtitle",
            message: "This is supplementary information.",
            buttonText: "Button Text",
            onButtonTap: { print("Tapped") }
        )
    }
    .padding()
}

#Preview("Callout Without Button") {
    VStack(spacing: 16) {
        DSCallout.neutral(
            title: "Callout Title (Optional)",
            subtitle: "Subtitle",
            message: "This is supplementary information."
        )
        
        DSCallout.brand(
            title: "Callout Title (Optional)",
            subtitle: "Subtitle",
            message: "This is supplementary information."
        )
        
        DSCallout.inverse(
            title: "Callout Title (Optional)",
            subtitle: "Subtitle",
            message: "This is supplementary information."
        )
    }
    .padding()
}

#Preview("Callout With Icon") {
    VStack(spacing: 16) {
        DSCallout.neutral(
            leadingIcon: Image(systemName: "tag.fill"),
            title: "Callout Title (Optional)",
            subtitle: "Subtitle",
            message: "This is supplementary information.",
            buttonText: "Button Text",
            onButtonTap: { print("Tapped") }
        )
        
        DSCallout.brand(
            leadingIcon: Image(systemName: "tag.fill"),
            title: "Callout Title (Optional)",
            subtitle: "Subtitle",
            message: "This is supplementary information.",
            buttonText: "Button Text",
            onButtonTap: { print("Tapped") }
        )
        
        DSCallout.inverse(
            leadingIcon: Image(systemName: "tag.fill"),
            title: "Callout Title (Optional)",
            subtitle: "Subtitle",
            message: "This is supplementary information.",
            buttonText: "Button Text",
            onButtonTap: { print("Tapped") }
        )
    }
    .padding()
}

#Preview("Floating Callouts") {
    VStack(spacing: 16) {
        DSCallout.neutral(
            leadingIcon: Image(systemName: "tag.fill"),
            title: "Callout Title (Optional)",
            subtitle: "Subtitle",
            message: "This is supplementary information.",
            buttonText: "Button Text",
            isFloating: true,
            onButtonTap: { print("Tapped") }
        )
        
        DSCallout.brand(
            leadingIcon: Image(systemName: "tag.fill"),
            title: "Callout Title (Optional)",
            subtitle: "Subtitle",
            message: "This is supplementary information.",
            buttonText: "Button Text",
            isFloating: true,
            onButtonTap: { print("Tapped") }
        )
        
        DSCallout.inverse(
            leadingIcon: Image(systemName: "tag.fill"),
            title: "Callout Title (Optional)",
            subtitle: "Subtitle",
            message: "This is supplementary information.",
            buttonText: "Button Text",
            isFloating: true,
            onButtonTap: { print("Tapped") }
        )
    }
    .padding()
}

#Preview("Message Only") {
    VStack(spacing: 16) {
        DSCallout.neutral(
            message: "This is supplementary information."
        )
        
        DSCallout.brand(
            message: "This is supplementary information."
        )
        
        DSCallout.inverse(
            message: "This is supplementary information."
        )
    }
    .padding()
}

#Preview("Dark Mode") {
    VStack(spacing: 16) {
        DSCallout.neutral(
            leadingIcon: Image(systemName: "tag.fill"),
            title: "Callout Title (Optional)",
            subtitle: "Subtitle",
            message: "This is supplementary information.",
            buttonText: "Button Text",
            onButtonTap: { print("Tapped") }
        )
        
        DSCallout.brand(
            leadingIcon: Image(systemName: "tag.fill"),
            title: "Callout Title (Optional)",
            subtitle: "Subtitle",
            message: "This is supplementary information.",
            buttonText: "Button Text",
            onButtonTap: { print("Tapped") }
        )
        
        DSCallout.inverse(
            leadingIcon: Image(systemName: "tag.fill"),
            title: "Callout Title (Optional)",
            subtitle: "Subtitle",
            message: "This is supplementary information.",
            buttonText: "Button Text",
            onButtonTap: { print("Tapped") }
        )
    }
    .padding()
    .preferredColorScheme(.dark)
}
