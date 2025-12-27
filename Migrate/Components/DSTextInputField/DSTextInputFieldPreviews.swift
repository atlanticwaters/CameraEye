import SwiftUI

// MARK: - Previews

struct DSTextInputFieldPreviewWrapper: View {
    @State private var text = ""
    @State private var filledText = "Sample text"
    @State private var password = ""
    @State private var isSecure = true

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Default state
                DSTextInputField(
                    text: $text,
                    label: "Username",
                    placeholder: "Enter username",
                    isRequired: true
                )

                // Optional field
                DSTextInputField(
                    text: $text,
                    label: "Middle Name",
                    placeholder: "Enter middle name",
                    isRequired: false
                )

                // With filled text
                DSTextInputField(
                    text: $filledText,
                    label: "Full Name",
                    placeholder: "Enter your name",
                    isRequired: true
                )

                // Error state
                DSTextInputField(
                    text: $text,
                    label: "Email",
                    placeholder: "Enter email",
                    isRequired: true,
                    state: .error(message: "Please enter a valid email address")
                )

                // Success state
                DSTextInputField(
                    text: $filledText,
                    label: "Phone Number",
                    placeholder: "Enter phone",
                    isRequired: false,
                    state: .success
                )

                // Disabled state
                DSTextInputField(
                    text: $filledText,
                    label: "Read Only",
                    placeholder: "Cannot edit",
                    state: .disabled
                )
            }
            .padding()
        }
    }
}

#Preview("Default States") {
    DSTextInputFieldPreviewWrapper()
}

struct DSTextInputFieldAdornmentPreviewWrapper: View {
    @State private var email = ""
    @State private var phone = ""
    @State private var amount = ""
    @State private var search = ""

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                // Email with icon
                DSTextInputField.email(text: $email)

                // Phone with icon
                DSTextInputField.phone(text: $phone)

                // Currency with text adornment
                DSTextInputField.currency(
                    text: $amount,
                    label: "Amount"
                )

                // Search with clear button
                DSTextInputField.search(
                    text: $search,
                    onClear: { search = "" }
                )
            }
            .padding()
        }
    }
}

#Preview("With Adornments") {
    DSTextInputFieldAdornmentPreviewWrapper()
}

struct DSTextInputFieldPasswordPreviewWrapper: View {
    @State private var password = ""
    @State private var isSecure = true

    var body: some View {
        VStack(spacing: 24) {
            DSTextInputField.password(
                text: $password,
                isSecure: isSecure,
                onToggleVisibility: { isSecure.toggle() }
            )
        }
        .padding()
    }
}

#Preview("Password Field") {
    DSTextInputFieldPasswordPreviewWrapper()
}

struct DSTextInputFieldTextAreaPreviewWrapper: View {
    @State private var notes = ""
    @State private var description = "This is a multi-line text that demonstrates how the TextArea variant works with longer content."

    var body: some View {
        VStack(spacing: 24) {
            DSTextInputField.textArea(
                text: $notes,
                label: "Notes",
                placeholder: "Enter your notes...",
                helperText: "Max 500 characters"
            )

            DSTextInputField.textArea(
                text: $description,
                label: "Description",
                isRequired: true
            )
        }
        .padding()
    }
}

#Preview("Text Area") {
    DSTextInputFieldTextAreaPreviewWrapper()
}

struct DSTextInputFieldFormPreviewWrapper: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var phone = ""
    @State private var address = ""

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                HStack(spacing: 12) {
                    DSTextInputField(
                        text: $firstName,
                        label: "First Name",
                        placeholder: "John",
                        isRequired: true
                    )

                    DSTextInputField(
                        text: $lastName,
                        label: "Last Name",
                        placeholder: "Doe",
                        isRequired: true
                    )
                }

                DSTextInputField.email(text: $email)

                DSTextInputField.phone(text: $phone, isRequired: true)

                DSTextInputField.textArea(
                    text: $address,
                    label: "Address",
                    placeholder: "Enter your full address",
                    isRequired: true
                )

                DSButton("Submit", style: .orangeFilled, size: .large) {
                    print("Submit form")
                }
            }
            .padding()
        }
    }
}

#Preview("Form Example") {
    DSTextInputFieldFormPreviewWrapper()
}

struct DSTextInputFieldAllStatesPreviewWrapper: View {
    @State private var text = "Sample text"

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                DSTextInputField(
                    text: $text,
                    label: "Default",
                    placeholder: "Default state",
                    state: .default
                )

                DSTextInputField(
                    text: $text,
                    label: "Focused",
                    placeholder: "Focused state",
                    state: .focused
                )

                DSTextInputField(
                    text: $text,
                    label: "Error",
                    placeholder: "Error state",
                    state: .error(message: "This field has an error")
                )

                DSTextInputField(
                    text: $text,
                    label: "Success",
                    placeholder: "Success state",
                    state: .success
                )

                DSTextInputField(
                    text: $text,
                    label: "Disabled",
                    placeholder: "Disabled state",
                    state: .disabled
                )
            }
            .padding()
        }
    }
}

#Preview("All States") {
    DSTextInputFieldAllStatesPreviewWrapper()
}
