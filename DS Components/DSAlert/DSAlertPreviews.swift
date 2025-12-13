import SwiftUI

#Preview("Alert Variants") {
    VStack(spacing: 16) {
        DSAlert.informational(
            title: "Alert title (optional)",
            message: "This is helpful information you should know."
        )
        
        DSAlert.success(
            title: "Alert title (optional)",
            message: "Success! Whatever you did worked."
        )
        
        DSAlert.warning(
            title: "Alert title (optional)",
            message: "There's an issue that you should know about."
        )
        
        DSAlert.error(
            title: "Alert title (optional)",
            message: "You cannot proceed until you resolve this issue."
        )
    }
    .padding()
}

#Preview("Alert Without Title") {
    VStack(spacing: 16) {
        DSAlert.informational(
            message: "This is helpful information you should know."
        )
        
        DSAlert.success(
            message: "Success! Whatever you did worked."
        )
        
        DSAlert.warning(
            message: "There's an issue that you should know about."
        )
        
        DSAlert.error(
            message: "You cannot proceed until you resolve this issue."
        )
    }
    .padding()
}

#Preview("Alert With Dismiss") {
    VStack(spacing: 16) {
        DSAlert.informational(
            title: "Alert title (optional)",
            message: "This is helpful information you should know.",
            onDismiss: { print("Dismissed") }
        )
        
        DSAlert.success(
            title: "Alert title (optional)",
            message: "Success! Whatever you did worked.",
            onDismiss: { print("Dismissed") }
        )
        
        DSAlert.warning(
            title: "Alert title (optional)",
            message: "There's an issue that you should know about.",
            onDismiss: { print("Dismissed") }
        )
        
        DSAlert.error(
            title: "Alert title (optional)",
            message: "You cannot proceed until you resolve this issue.",
            onDismiss: { print("Dismissed") }
        )
    }
    .padding()
}

#Preview("Floating Alerts") {
    VStack(spacing: 16) {
        DSAlert.informational(
            title: "Alert title (optional)",
            message: "This is helpful information you should know.",
            isFloating: true,
            onDismiss: { print("Dismissed") }
        )
        
        DSAlert.success(
            title: "Alert title (optional)",
            message: "Success! Whatever you did worked.",
            isFloating: true,
            onDismiss: { print("Dismissed") }
        )
        
        DSAlert.warning(
            title: "Alert title (optional)",
            message: "There's an issue that you should know about.",
            isFloating: true,
            onDismiss: { print("Dismissed") }
        )
        
        DSAlert.error(
            title: "Alert title (optional)",
            message: "You cannot proceed until you resolve this issue.",
            isFloating: true,
            onDismiss: { print("Dismissed") }
        )
    }
    .padding()
}

#Preview("Dark Mode") {
    VStack(spacing: 16) {
        DSAlert.informational(
            title: "Alert title (optional)",
            message: "This is helpful information you should know.",
            onDismiss: { print("Dismissed") }
        )
        
        DSAlert.success(
            title: "Alert title (optional)",
            message: "Success! Whatever you did worked.",
            onDismiss: { print("Dismissed") }
        )
        
        DSAlert.warning(
            title: "Alert title (optional)",
            message: "There's an issue that you should know about.",
            onDismiss: { print("Dismissed") }
        )
        
        DSAlert.error(
            title: "Alert title (optional)",
            message: "You cannot proceed until you resolve this issue.",
            onDismiss: { print("Dismissed") }
        )
    }
    .padding()
    .preferredColorScheme(.dark)
}
