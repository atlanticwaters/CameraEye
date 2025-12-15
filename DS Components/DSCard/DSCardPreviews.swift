import SwiftUI

// MARK: - DSContentCard Previews

#Preview("Content Card - Basic") {
    DSContentCard(
        title: "Title",
        subtitle: "Subtitle",
        buttonText: "Button Text",
        onButtonTap: {}
    ) {
        AnyView(PlaceholderBody())
    }
    .padding()
}

#Preview("Content Card - No Subtitle") {
    DSContentCard(
        title: "Title",
        buttonText: "Button Text",
        onButtonTap: {}
    ) {
        AnyView(PlaceholderBody())
    }
    .padding()
}

#Preview("Content Card - With Action") {
    DSContentCard(
        title: "Title",
        subtitle: "Subtitle",
        buttonText: "Button Text",
        onTitleAction: {},
        onButtonTap: {}
    ) {
        AnyView(PlaceholderBody())
    }
    .padding()
}

#Preview("Content Card - First w/ Padding") {
    DSContentCard(
        title: "Title",
        subtitle: "Subtitle",
        bodyPlacement: .firstWithPadding,
        buttonText: "Button Text",
        onButtonTap: {}
    ) {
        AnyView(PlaceholderBody())
    }
    .padding()
}

#Preview("Content Card - First Full Bleed") {
    DSContentCard(
        title: "Title",
        subtitle: "Subtitle",
        bodyPlacement: .firstFullBleed,
        buttonText: "Button Text",
        onButtonTap: {}
    ) {
        AnyView(PlaceholderFullBleedBody())
    }
    .padding()
}

#Preview("Content Card - Second Full Bleed") {
    DSContentCard(
        title: "Title",
        subtitle: "Subtitle",
        bodyPlacement: .secondFullBleed,
        buttonText: "Button Text",
        onButtonTap: {}
    ) {
        AnyView(PlaceholderFullBleedBody())
    }
    .padding()
}

#Preview("Content Card - Dark Mode") {
    DSContentCard(
        title: "Title",
        subtitle: "Subtitle",
        buttonText: "Button Text",
        onButtonTap: {}
    ) {
        AnyView(PlaceholderBody())
    }
    .padding()
    .background(Color.black)
    .preferredColorScheme(.dark)
}

// MARK: - DSMiniProductCard Previews

#Preview("Mini Product - Horizontal Basic") {
    DSMiniProductCard.horizontal(
        productName: "#9 x 3 in. Tan Star Flat-Head Wood Deck Screw (1 lb. / 73-Piece)",
        price: "$10.97",
        brandName: "BrandName",
        sku: "SKU #1003274867",
        onButtonTap: {}
    )
    .frame(width: 382)
    .padding()
}

#Preview("Mini Product - Horizontal with Rating") {
    DSMiniProductCard(
        orientation: .horizontal,
        sku: "SKU #1003274867",
        brandName: "BrandName",
        productName: "#9 x 3 in. Tan Star Flat-Head Wood Deck Screw (1 lb. / 73-Piece)",
        showRating: true,
        rating: 4.5,
        price: "$10.97",
        buttonText: "Add to Cart",
        onButtonTap: {}
    )
    .frame(width: 382)
    .padding()
}

#Preview("Mini Product - Horizontal Full") {
    DSMiniProductCard(
        orientation: .horizontal,
        sku: "SKU #1003274867",
        brandName: "BrandName",
        productName: "#9 x 3 in. Tan Star Flat-Head Wood Deck Screw (1 lb. / 73-Piece)",
        showRating: true,
        rating: 5.0,
        showFulfillment: true,
        pickupInfo: "Pickup: 2,243 in stock at Midtown",
        deliveryInfo: "Delivery: Free Tomorrow",
        price: "$10.97",
        onButtonTap: {}
    )
    .frame(width: 382)
    .padding()
}

#Preview("Mini Product - Horizontal with Badge") {
    DSMiniProductCard(
        orientation: .horizontal,
        sku: "SKU #1003274867",
        brandName: "BrandName",
        productName: "#9 x 3 in. Tan Star Flat-Head Wood Deck Screw (1 lb. / 73-Piece)",
        price: "$10.97",
        showBadge: true,
        badgeText: "Banjo",
        onButtonTap: {},
        onMoreAction: {}
    )
    .frame(width: 382)
    .padding()
}

#Preview("Mini Product - Vertical Basic") {
    DSMiniProductCard.vertical(
        productName: "#9 x 3 in. Tan Star Flat-Head Wood Deck Screw (1 lb. / 73-Piece)",
        price: "$10.97",
        brandName: "BrandName",
        sku: "SKU #1003274867",
        onButtonTap: {}
    )
    .frame(width: 150)
    .padding()
}

#Preview("Mini Product - Vertical Full") {
    DSMiniProductCard(
        orientation: .vertical,
        sku: "SKU #1003274867",
        brandName: "BrandName",
        productName: "#9 x 3 in. Tan Star Flat-Head Wood Deck Screw",
        showRating: true,
        rating: 5.0,
        price: "$10.97",
        showBadge: true,
        badgeText: "Banjo",
        onButtonTap: {},
        onMoreAction: {}
    )
    .frame(width: 150)
    .padding()
}

#Preview("Mini Product - Dark Mode") {
    DSMiniProductCard.horizontal(
        productName: "#9 x 3 in. Tan Star Flat-Head Wood Deck Screw (1 lb. / 73-Piece)",
        price: "$10.97",
        brandName: "BrandName",
        sku: "SKU #1003274867",
        onButtonTap: {}
    )
    .frame(width: 382)
    .padding()
    .background(Color.black)
    .preferredColorScheme(.dark)
}

// MARK: - All Content Cards Preview

#Preview("All Content Cards") {
    AllContentCardsPreview()
}

#Preview("All Content Cards - Dark") {
    AllContentCardsPreview()
        .preferredColorScheme(.dark)
}

// MARK: - All Mini Product Cards Preview

#Preview("All Mini Product Cards") {
    AllMiniProductCardsPreview()
}

#Preview("All Mini Product Cards - Dark") {
    AllMiniProductCardsPreview()
        .preferredColorScheme(.dark)
}

// MARK: - Supporting Views

private struct AllContentCardsPreview: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                DSContentCard(
                    title: "Basic",
                    subtitle: "With subtitle",
                    buttonText: "Button",
                    onButtonTap: {}
                ) {
                    AnyView(PlaceholderBody())
                }
                
                DSContentCard(
                    title: "With Action",
                    subtitle: "Tappable title",
                    buttonText: "Button",
                    onTitleAction: {},
                    onButtonTap: {}
                ) {
                    AnyView(PlaceholderBody())
                }
                
                DSContentCard(
                    title: "First with Padding",
                    subtitle: "Body placement variation",
                    bodyPlacement: .firstWithPadding,
                    buttonText: "Button",
                    onButtonTap: {}
                ) {
                    AnyView(PlaceholderBody())
                }
                
                DSContentCard(
                    title: "First Full Bleed",
                    subtitle: "Body placement variation",
                    bodyPlacement: .firstFullBleed,
                    buttonText: "Button",
                    onButtonTap: {}
                ) {
                    AnyView(PlaceholderFullBleedBody())
                }
            }
            .padding()
        }
    }
}

private struct AllMiniProductCardsPreview: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                Text("Horizontal Cards")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                DSMiniProductCard.horizontal(
                    productName: "#9 x 3 in. Tan Star Flat-Head Wood Deck Screw (1 lb. / 73-Piece)",
                    price: "$10.97",
                    brandName: "BrandName",
                    sku: "SKU #1003274867",
                    onButtonTap: {}
                )
                
                DSMiniProductCard(
                    orientation: .horizontal,
                    sku: "SKU #1003274867",
                    brandName: "BrandName",
                    productName: "#9 x 3 in. Tan Star Flat-Head Wood Deck Screw (1 lb. / 73-Piece)",
                    showRating: true,
                    rating: 4.5,
                    price: "$10.97",
                    buttonText: "Add to Cart",
                    onButtonTap: {}
                )
                
                Text("Vertical Cards")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top)
                
                HStack(spacing: 16) {
                    DSMiniProductCard.vertical(
                        productName: "#9 x 3 in. Tan Star Flat-Head Wood Deck Screw",
                        price: "$10.97",
                        brandName: "BrandName",
                        sku: "SKU #1003274867",
                        onButtonTap: {}
                    )
                    .frame(width: 150)
                    
                    DSMiniProductCard(
                        orientation: .vertical,
                        sku: "SKU #1003274867",
                        brandName: "BrandName",
                        productName: "#9 x 3 in. Tan Star Flat-Head Wood Deck Screw",
                        showRating: true,
                        rating: 5.0,
                        price: "$10.97",
                        showBadge: true,
                        badgeText: "Banjo",
                        onButtonTap: {},
                        onMoreAction: {}
                    )
                    .frame(width: 150)
                }
            }
            .padding()
        }
    }
}

private struct PlaceholderBody: View {
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: "photo")
                .font(.system(size: 24))
                .foregroundColor(.gray)
            
            Text("Use the Instance--Swap property to place a component in this slot.")
                .font(.system(size: 16))
                .foregroundColor(Color(red: 0.416, green: 0.408, blue: 0.404))
                .lineLimit(nil)
        }
        .padding(12)
        .frame(maxWidth: .infinity)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(red: 0.729, green: 0.718, blue: 0.706), style: StrokeStyle(lineWidth: 1, dash: [5]))
        )
    }
}

private struct PlaceholderFullBleedBody: View {
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: "photo")
                .font(.system(size: 24))
                .foregroundColor(.gray)
            
            Text("Use the Instance--Swap property to place a component in this slot.")
                .font(.system(size: 16))
                .foregroundColor(Color(red: 0.416, green: 0.408, blue: 0.404))
                .lineLimit(nil)
        }
        .padding(12)
        .frame(maxWidth: .infinity, minHeight: 64)
        .overlay(
            Rectangle()
                .stroke(Color(red: 0.729, green: 0.718, blue: 0.706), style: StrokeStyle(lineWidth: 1, dash: [5]))
        )
    }
}
