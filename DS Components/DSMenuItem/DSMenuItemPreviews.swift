import SwiftUI

#Preview("Menu Item Styles") {
    VStack(spacing: 16) {
        DSMenuItem.outline(
            media: .icon(Image(systemName: "person.fill")),
            title: "Bob J.",
            subtitle: "Subtitle"
        )
        
        DSMenuItem.ghost(
            media: .icon(Image(systemName: "person.fill")),
            title: "Bob J.",
            subtitle: "Subtitle"
        )
    }
    .padding()
}

#Preview("Menu Item States") {
    VStack(spacing: 16) {
        Text("Default").font(.headline)
        DSMenuItem.outline(
            media: .icon(Image(systemName: "person.fill")),
            title: "Bob J.",
            subtitle: "Subtitle",
            showChevron: true
        )
        
        Text("Selected").font(.headline)
        DSMenuItem.outline(
            media: .icon(Image(systemName: "person.fill")),
            title: "Bob J.",
            subtitle: "Subtitle",
            isSelected: true,
            showChevron: true
        )
    }
    .padding()
}

#Preview("Menu Item Media Types") {
    VStack(spacing: 16) {
        DSMenuItem.outline(
            media: .icon(Image(systemName: "person.fill")),
            title: "Icon Media",
            subtitle: "With icon"
        )
        
        DSMenuItem.outline(
            media: .image(Image(systemName: "photo.fill")),
            title: "Image Media",
            subtitle: "With image"
        )
        
        DSMenuItem.outline(
            media: .payment,
            title: "Payment Method",
            subtitle: "Apple Pay"
        )
        
        DSMenuItem.outline(
            title: "No Media",
            subtitle: "Without media"
        )
    }
    .padding()
}

#Preview("Menu Item - Ghost Style") {
    VStack(spacing: 16) {
        DSMenuItem.ghost(
            media: .icon(Image(systemName: "person.fill")),
            title: "Bob J.",
            subtitle: "Subtitle"
        )
        
        DSMenuItem.ghost(
            media: .icon(Image(systemName: "person.fill")),
            title: "Bob J.",
            subtitle: "Subtitle",
            isSelected: true
        )
    }
    .padding()
}

#Preview("Menu Item - Custom Content") {
    VStack(spacing: 16) {
        DSMenuItem(
            style: .outline,
            customContent: HStack {
                Image(systemName: "eye.fill")
                Text("Custom component content")
                    .font(.body)
            }
        )
    }
    .padding()
}

#Preview("Dark Mode") {
    VStack(spacing: 16) {
        DSMenuItem.outline(
            media: .icon(Image(systemName: "person.fill")),
            title: "Bob J.",
            subtitle: "Subtitle",
            showChevron: true
        )
        
        DSMenuItem.outline(
            media: .icon(Image(systemName: "person.fill")),
            title: "Bob J.",
            subtitle: "Subtitle",
            isSelected: true,
            showChevron: true
        )
        
        DSMenuItem.ghost(
            media: .icon(Image(systemName: "person.fill")),
            title: "Bob J.",
            subtitle: "Subtitle"
        )
    }
    .padding()
    .preferredColorScheme(.dark)
}
