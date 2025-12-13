import SwiftUI

#if DEBUG
struct DSCardPreviews: PreviewProvider {
    static var previews: some View {
        Group {
            // Content Cards
            contentCardPreviews
            
            // Mini Product Cards
            miniProductCardPreviews
        }
    }
    
    // MARK: - Content Card Previews
    
    static var contentCardPreviews: some View {
        Group {
            // Basic content card
            DSContentCard(
                title: "Title",
                subtitle: "Subtitle",
                buttonText: "Button Text",
                onButtonTap: {}
            ) {
                AnyView(placeholderBody)
            }
            .previewLayout(.sizeThatFits)
            .padding()
            .previewDisplayName("Content Card - Basic")
            
            // Content card without subtitle
            DSContentCard(
                title: "Title",
                buttonText: "Button Text",
                onButtonTap: {}
            ) {
                AnyView(placeholderBody)
            }
            .previewLayout(.sizeThatFits)
            .padding()
            .previewDisplayName("Content Card - No Subtitle")
            
            // Content card with action
            DSContentCard(
                title: "Title",
                subtitle: "Subtitle",
                buttonText: "Button Text",
                onTitleAction: {},
                onButtonTap: {}
            ) {
                AnyView(placeholderBody)
            }
            .previewLayout(.sizeThatFits)
            .padding()
            .previewDisplayName("Content Card - With Action")
            
            // Content card - first with padding
            DSContentCard(
                title: "Title",
                subtitle: "Subtitle",
                bodyPlacement: .firstWithPadding,
                buttonText: "Button Text",
                onButtonTap: {}
            ) {
                AnyView(placeholderBody)
            }
            .previewLayout(.sizeThatFits)
            .padding()
            .previewDisplayName("Content Card - First w/ Padding")
            
            // Content card - first full bleed
            DSContentCard(
                title: "Title",
                subtitle: "Subtitle",
                bodyPlacement: .firstFullBleed,
                buttonText: "Button Text",
                onButtonTap: {}
            ) {
                AnyView(placeholderFullBleedBody)
            }
            .previewLayout(.sizeThatFits)
            .padding()
            .previewDisplayName("Content Card - First Full Bleed")
            
            // Content card - second full bleed
            DSContentCard(
                title: "Title",
                subtitle: "Subtitle",
                bodyPlacement: .secondFullBleed,
                buttonText: "Button Text",
                onButtonTap: {}
            ) {
                AnyView(placeholderFullBleedBody)
            }
            .previewLayout(.sizeThatFits)
            .padding()
            .previewDisplayName("Content Card - Second Full Bleed")
            
            // Dark mode
            DSContentCard(
                title: "Title",
                subtitle: "Subtitle",
                buttonText: "Button Text",
                onButtonTap: {}
            ) {
                AnyView(placeholderBody)
            }
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.black)
            .preferredColorScheme(.dark)
            .previewDisplayName("Content Card - Dark Mode")
        }
    }
    
    // MARK: - Mini Product Card Previews
    
    static var miniProductCardPreviews: some View {
        Group {
            // Horizontal basic
            DSMiniProductCard.horizontal(
                productName: "#9 x 3 in. Tan Star Flat-Head Wood Deck Screw (1 lb. / 73-Piece)",
                price: "$10.97",
                brandName: "BrandName",
                sku: "SKU #1003274867",
                onButtonTap: {}
            )
            .frame(width: 382)
            .previewLayout(.sizeThatFits)
            .padding()
            .previewDisplayName("Mini Product - Horizontal Basic")
            
            // Horizontal with rating
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
            .previewLayout(.sizeThatFits)
            .padding()
            .previewDisplayName("Mini Product - Horizontal with Rating")
            
            // Horizontal with fulfillment
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
            .previewLayout(.sizeThatFits)
            .padding()
            .previewDisplayName("Mini Product - Horizontal Full")
            
            // Horizontal with badge
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
            .previewLayout(.sizeThatFits)
            .padding()
            .previewDisplayName("Mini Product - Horizontal with Badge")
            
            // Vertical basic
            DSMiniProductCard.vertical(
                productName: "#9 x 3 in. Tan Star Flat-Head Wood Deck Screw (1 lb. / 73-Piece)",
                price: "$10.97",
                brandName: "BrandName",
                sku: "SKU #1003274867",
                onButtonTap: {}
            )
            .frame(width: 150)
            .previewLayout(.sizeThatFits)
            .padding()
            .previewDisplayName("Mini Product - Vertical Basic")
            
            // Vertical with all features
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
            .previewLayout(.sizeThatFits)
            .padding()
            .previewDisplayName("Mini Product - Vertical Full")
            
            // Dark mode
            DSMiniProductCard.horizontal(
                productName: "#9 x 3 in. Tan Star Flat-Head Wood Deck Screw (1 lb. / 73-Piece)",
                price: "$10.97",
                brandName: "BrandName",
                sku: "SKU #1003274867",
                onButtonTap: {}
            )
            .frame(width: 382)
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.black)
            .preferredColorScheme(.dark)
            .previewDisplayName("Mini Product - Dark Mode")
        }
    }
    
    // MARK: - Helper Views
    
    static var placeholderBody: some View {
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
    
    static var placeholderFullBleedBody: some View {
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
#endif
