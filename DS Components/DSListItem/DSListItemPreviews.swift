import SwiftUI

#Preview("List Item Types") {
    VStack(spacing: 16) {
        DSListItem.search(
            title: "What you searched for",
            onTap: { print("Search tapped") }
        )
        
        DSListItem.trending(
            title: "Trending items",
            onTap: { print("Trending tapped") }
        )
        
        DSListItem.recentlyPurchased(
            title: "Recently purchased",
            onTap: { print("Recently purchased tapped") }
        )
        
        DSListItem.seeAll(
            title: "See all results",
            onTap: { print("See all tapped") }
        )
    }
    .padding()
}

#Preview("List Item - Dark Mode") {
    VStack(spacing: 16) {
        DSListItem.search(title: "What you searched for")
        DSListItem.trending(title: "Trending items")
        DSListItem.recentlyPurchased(title: "Recently purchased")
        DSListItem.seeAll(title: "See all results")
    }
    .padding()
    .preferredColorScheme(.dark)
}
