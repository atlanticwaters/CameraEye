import SwiftUI

// MARK: - Alert Variants

#Preview("Alert Variants") {
    ScrollView {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing4) {
            Text("Alert Variants")
                .font(.custom("THD SmVar Beta", size: 20))
                .fontWeight(.heavy)
                .padding(.horizontal, DesignSystemGlobal.Spacing4)
                .padding(.top, DesignSystemGlobal.Spacing4)
            
            VStack(spacing: DesignSystemGlobal.Spacing4) {
                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                    Text("Informational")
                        .font(.custom("THD SmVar Beta", size: 14))
                        .fontWeight(.semibold)
                    
                    DSAlert.informational(
                        title: "Alert title (optional)",
                        message: "This is helpful information you should know."
                    )
                }
                
                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                    Text("Success")
                        .font(.custom("THD SmVar Beta", size: 14))
                        .fontWeight(.semibold)
                    
                    DSAlert.success(
                        title: "Alert title (optional)",
                        message: "Success! Whatever you did worked."
                    )
                }
                
                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                    Text("Warning")
                        .font(.custom("THD SmVar Beta", size: 14))
                        .fontWeight(.semibold)
                    
                    DSAlert.warning(
                        title: "Alert title (optional)",
                        message: "There's an issue that you should know about."
                    )
                }
                
                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                    Text("Error")
                        .font(.custom("THD SmVar Beta", size: 14))
                        .fontWeight(.semibold)
                    
                    DSAlert.error(
                        title: "Alert title (optional)",
                        message: "You cannot proceed until you resolve this issue."
                    )
                }
            }
            .padding(DesignSystemGlobal.Spacing4)
        }
    }
}

// MARK: - Without Title

#Preview("Alert Without Title") {
    ScrollView {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing4) {
            Text("Without Title")
                .font(.custom("THD SmVar Beta", size: 20))
                .fontWeight(.heavy)
                .padding(.horizontal, DesignSystemGlobal.Spacing4)
                .padding(.top, DesignSystemGlobal.Spacing4)
            
            VStack(spacing: DesignSystemGlobal.Spacing4) {
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
            .padding(DesignSystemGlobal.Spacing4)
        }
    }
}

// MARK: - With Dismiss

#Preview("Alert With Dismiss") {
    ScrollView {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing4) {
            Text("With Dismiss Action")
                .font(.custom("THD SmVar Beta", size: 20))
                .fontWeight(.heavy)
                .padding(.horizontal, DesignSystemGlobal.Spacing4)
                .padding(.top, DesignSystemGlobal.Spacing4)
            
            VStack(spacing: DesignSystemGlobal.Spacing4) {
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
            .padding(DesignSystemGlobal.Spacing4)
        }
    }
}

// MARK: - Floating Alerts

#Preview("Floating Alerts") {
    ScrollView {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing4) {
            Text("Floating Style")
                .font(.custom("THD SmVar Beta", size: 20))
                .fontWeight(.heavy)
                .padding(.horizontal, DesignSystemGlobal.Spacing4)
                .padding(.top, DesignSystemGlobal.Spacing4)
            
            VStack(spacing: DesignSystemGlobal.Spacing4) {
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
            .padding(DesignSystemGlobal.Spacing4)
        }
        .background(Color(red: 0.973, green: 0.961, blue: 0.949))
    }
}

// MARK: - Comparison View

#Preview("Side by Side Comparison") {
    ScrollView {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing4) {
            Text("Comparison: Standard vs Floating")
                .font(.custom("THD SmVar Beta", size: 20))
                .fontWeight(.heavy)
                .padding(.horizontal, DesignSystemGlobal.Spacing4)
                .padding(.top, DesignSystemGlobal.Spacing4)
            
            VStack(spacing: DesignSystemGlobal.Spacing6) {
                // Standard
                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                    Text("Standard (No Shadow)")
                        .font(.custom("THD SmVar Beta", size: 16))
                        .fontWeight(.semibold)
                    
                    VStack(spacing: DesignSystemGlobal.Spacing3) {
                        DSAlert.informational(
                            title: "Informational",
                            message: "Standard alert without shadow."
                        )
                        
                        DSAlert.success(
                            title: "Success",
                            message: "Standard alert without shadow."
                        )
                    }
                }
                
                Divider()
                
                // Floating
                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                    Text("Floating (With Shadow)")
                        .font(.custom("THD SmVar Beta", size: 16))
                        .fontWeight(.semibold)
                    
                    VStack(spacing: DesignSystemGlobal.Spacing3) {
                        DSAlert.informational(
                            title: "Informational",
                            message: "Floating alert with shadow.",
                            isFloating: true
                        )
                        
                        DSAlert.success(
                            title: "Success",
                            message: "Floating alert with shadow.",
                            isFloating: true
                        )
                    }
                }
            }
            .padding(DesignSystemGlobal.Spacing4)
        }
        .background(Color(red: 0.973, green: 0.961, blue: 0.949))
    }
}

// MARK: - Interactive Example

#Preview("Interactive Example") {
    struct InteractiveAlertDemo: View {
        @State private var showAlert = true
        @State private var alertType: DSAlert.Variant = .informational
        
        var body: some View {
            ScrollView {
                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing4) {
                    Text("Interactive Alert Demo")
                        .font(.custom("THD SmVar Beta", size: 20))
                        .fontWeight(.heavy)
                        .padding(.horizontal, DesignSystemGlobal.Spacing4)
                        .padding(.top, DesignSystemGlobal.Spacing4)
                    
                    VStack(spacing: DesignSystemGlobal.Spacing4) {
                        // Controls
                        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
                            Text("Alert Type")
                                .font(.custom("THD SmVar Beta", size: 14))
                                .fontWeight(.semibold)
                            
                            HStack(spacing: DesignSystemGlobal.Spacing2) {
                                Button("Info") {
                                    alertType = .informational
                                    showAlert = true
                                }
                                .buttonStyle(.borderedProminent)
                                
                                Button("Success") {
                                    alertType = .success
                                    showAlert = true
                                }
                                .buttonStyle(.borderedProminent)
                                
                                Button("Warning") {
                                    alertType = .warning
                                    showAlert = true
                                }
                                .buttonStyle(.borderedProminent)
                                
                                Button("Error") {
                                    alertType = .error
                                    showAlert = true
                                }
                                .buttonStyle(.borderedProminent)
                            }
                        }
                        
                        Divider()
                        
                        // Alert Display
                        if showAlert {
                            DSAlert(
                                variant: alertType,
                                title: "Alert Title",
                                message: "This is an interactive alert. Tap the X to dismiss it, or change the type using the buttons above.",
                                isFloating: true,
                                onDismiss: {
                                    showAlert = false
                                }
                            )
                        } else {
                            Text("Alert dismissed. Select a type above to show it again.")
                                .font(.custom("THD Sm Beta", size: 14))
                                .foregroundColor(.secondary)
                                .padding(DesignSystemGlobal.Spacing4)
                                .frame(maxWidth: .infinity)
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(DesignSystemGlobal.BorderRadius2xl)
                        }
                    }
                    .padding(DesignSystemGlobal.Spacing4)
                }
            }
        }
    }
    
    return InteractiveAlertDemo()
}

// MARK: - Dark Mode

#Preview("Dark Mode") {
    ScrollView {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing4) {
            Text("Dark Mode")
                .font(.custom("THD SmVar Beta", size: 20))
                .fontWeight(.heavy)
                .padding(.horizontal, DesignSystemGlobal.Spacing4)
                .padding(.top, DesignSystemGlobal.Spacing4)
            
            VStack(spacing: DesignSystemGlobal.Spacing4) {
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
            .padding(DesignSystemGlobal.Spacing4)
        }
    }
    .preferredColorScheme(.dark)
}

// MARK: - All Configurations

#Preview("All Configurations") {
    ScrollView {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing6) {
            Text("All Alert Configurations")
                .font(.custom("THD SmVar Beta", size: 24))
                .fontWeight(.heavy)
                .padding(.horizontal, DesignSystemGlobal.Spacing4)
                .padding(.top, DesignSystemGlobal.Spacing4)
            
            Group {
                // With Title
                sectionView(
                    title: "With Title",
                    description: "Standard alerts with title and message"
                ) {
                    VStack(spacing: DesignSystemGlobal.Spacing3) {
                        DSAlert.informational(
                            title: "Informational Alert",
                            message: "This is helpful information you should know."
                        )
                        DSAlert.success(
                            title: "Success Alert",
                            message: "Success! Whatever you did worked."
                        )
                        DSAlert.warning(
                            title: "Warning Alert",
                            message: "There's an issue that you should know about."
                        )
                        DSAlert.error(
                            title: "Error Alert",
                            message: "You cannot proceed until you resolve this issue."
                        )
                    }
                }
                
                // Without Title
                sectionView(
                    title: "Without Title",
                    description: "Message-only alerts"
                ) {
                    VStack(spacing: DesignSystemGlobal.Spacing3) {
                        DSAlert.informational(message: "This is helpful information.")
                        DSAlert.success(message: "Success! Whatever you did worked.")
                        DSAlert.warning(message: "There's an issue you should know about.")
                        DSAlert.error(message: "You cannot proceed until you resolve this.")
                    }
                }
                
                // With Dismiss
                sectionView(
                    title: "With Dismiss Button",
                    description: "Dismissible alerts"
                ) {
                    VStack(spacing: DesignSystemGlobal.Spacing3) {
                        DSAlert.informational(
                            title: "Dismissible Alert",
                            message: "Tap X to dismiss.",
                            onDismiss: { print("Dismissed") }
                        )
                        DSAlert.success(
                            title: "Dismissible Alert",
                            message: "Tap X to dismiss.",
                            onDismiss: { print("Dismissed") }
                        )
                    }
                }
                
                // Floating
                sectionView(
                    title: "Floating Style",
                    description: "Alerts with shadow elevation"
                ) {
                    VStack(spacing: DesignSystemGlobal.Spacing3) {
                        DSAlert.informational(
                            title: "Floating Alert",
                            message: "This alert has a subtle shadow.",
                            isFloating: true,
                            onDismiss: { print("Dismissed") }
                        )
                        DSAlert.success(
                            title: "Floating Alert",
                            message: "This alert has a subtle shadow.",
                            isFloating: true,
                            onDismiss: { print("Dismissed") }
                        )
                    }
                }
            }
        }
        .padding(.bottom, DesignSystemGlobal.Spacing6)
    }
    .background(Color(red: 0.973, green: 0.961, blue: 0.949))
}

// MARK: - Helper Views

@ViewBuilder
private func sectionView<Content: View>(
    title: String,
    description: String,
    @ViewBuilder content: () -> Content
) -> some View {
    VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing1) {
            Text(title)
                .font(.custom("THD SmVar Beta", size: 16))
                .fontWeight(.bold)
            
            Text(description)
                .font(.custom("THD Sm Beta", size: 14))
                .foregroundColor(.secondary)
        }
        
        content()
    }
    .padding(DesignSystemGlobal.Spacing4)
    .background(Color.white)
    .cornerRadius(DesignSystemGlobal.BorderRadiusXl)
    .padding(.horizontal, DesignSystemGlobal.Spacing4)
}
