import SwiftUI

// MARK: - List Item Previews

#Preview("Search Item") {
    DSListItem(
        type: .search,
        text: "What you searched for"
    )
    .background(Color.black)
}

#Preview("Trending Item") {
    DSListItem(
        type: .trending,
        text: "Trending items"
    )
    .background(Color.black)
}

#Preview("Recently Purchased") {
    DSListItem(
        type: .recentlyPurchased,
        text: "Recently purchased"
    )
    .background(Color.black)
}

#Preview("See All Results") {
    DSListItem(
        type: .seeAll,
        text: "See all results"
    )
    .background(Color.black)
}

#Preview("List Item Types") {
    VStack(spacing: 0) {
        DSListItem.search("Power drill")
        DSListItem.search("Cordless drill 20V")
        DSListItem.trending("Trending items")
        DSListItem.recentlyPurchased("Recently purchased")
        DSListItem.seeAll()
    }
    .background(Color.black)
}

#Preview("Factory Methods") {
    VStack(spacing: 0) {
        DSListItem.search("Hammer")
        DSListItem.trending("Top picks")
        DSListItem.recentlyPurchased("Buy again")
        DSListItem.seeAll("View all 42 results")
    }
    .background(Color.black)
}

// MARK: - Menu Item Previews

#Preview("Basic Menu Item") {
    DSMenuItem(
        title: "Profile",
        leadingIcon: Image(systemName: "person")
    )
    .padding()
}

#Preview("Menu Item with Subtitle") {
    DSMenuItem(
        title: "Account Settings",
        subtitle: "Manage your account preferences",
        leadingIcon: Image(systemName: "gearshape")
    )
    .padding()
}

#Preview("Selected Menu Item") {
    DSMenuItem(
        title: "Home",
        leadingIcon: Image(systemName: "house"),
        isSelected: true
    )
    .padding()
}

#Preview("Ghost Style Menu Item") {
    DSMenuItem(
        title: "Notifications",
        subtitle: "3 new notifications",
        leadingIcon: Image(systemName: "bell"),
        style: .ghost
    )
    .padding()
}

#Preview("Menu Item with Trailing Icon") {
    DSMenuItem(
        title: "Settings",
        leadingIcon: Image(systemName: "gearshape"),
        trailingIcon: Image(systemName: "chevron.right")
    )
    .padding()
}

#Preview("Menu Item without Media") {
    DSMenuItem(
        title: "Privacy Policy",
        trailingIcon: Image(systemName: "chevron.right"),
        showMedia: false
    )
    .padding()
}

#Preview("Menu Item List") {
    VStack(spacing: 8) {
        DSMenuItem(
            title: "My Account",
            subtitle: "View and edit your profile",
            leadingIcon: Image(systemName: "person.circle"),
            trailingIcon: Image(systemName: "chevron.right")
        )

        DSMenuItem(
            title: "Orders",
            subtitle: "Track and manage orders",
            leadingIcon: Image(systemName: "shippingbox"),
            trailingIcon: Image(systemName: "chevron.right")
        )

        DSMenuItem(
            title: "Lists",
            subtitle: "Shopping and project lists",
            leadingIcon: Image(systemName: "list.bullet"),
            trailingIcon: Image(systemName: "chevron.right")
        )

        DSMenuItem(
            title: "Settings",
            leadingIcon: Image(systemName: "gearshape"),
            trailingIcon: Image(systemName: "chevron.right")
        )
    }
    .padding()
}

#Preview("Selected vs Unselected") {
    VStack(spacing: 8) {
        DSMenuItem(
            title: "Unselected Item",
            leadingIcon: Image(systemName: "circle"),
            isSelected: false
        )

        DSMenuItem(
            title: "Selected Item",
            leadingIcon: Image(systemName: "checkmark.circle.fill"),
            isSelected: true
        )
    }
    .padding()
}
