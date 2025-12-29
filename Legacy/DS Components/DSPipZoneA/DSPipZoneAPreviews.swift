//
// DSPipZoneAPreviews.swift
//

import SwiftUI

// MARK: - Previews

struct DSPipZoneAPreviews: View {
    var body: some View {
        Group {
            // Full example with all sections
            ScrollView {
                DSPipZoneA.sample()
            }
            .previewLayout(.sizeThatFits)
            .previewDisplayName("Full - Light Mode")
            
            ScrollView {
                DSPipZoneA.sample()
            }
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .previewDisplayName("Full - Dark Mode")
            
            // Minimal example
            ScrollView {
                DSPipZoneA(
                    breadcrumbs: ["Home", "Tools"],
                    brand: "Husky",
                    title: "16 oz. Fiberglass Claw Hammer",
                    productImages: [Image(systemName: "hammer.fill")],
                    price: "$14.97",
                    onAddToCart: {}
                )
            }
            .previewLayout(.sizeThatFits)
            .previewDisplayName("Minimal Configuration")
            
            // With badge, no rating
            ScrollView {
                DSPipZoneA(
                    breadcrumbs: ["Home", "Outdoor", "Power Equipment"],
                    badge: DSBadge(label: "New", variant: .filledStrong, color: .info),
                    brand: "Ryobi",
                    title: "18V ONE+ Cordless Drill/Driver Kit",
                    productImages: [Image(systemName: "screwdriver.fill")],
                    price: "$99.00",
                    onAddToCart: {}
                )
            }
            .previewLayout(.sizeThatFits)
            .previewDisplayName("With Badge, No Rating")
            
            // With rating, no badge
            ScrollView {
                DSPipZoneA(
                    breadcrumbs: ["Home", "Paint", "Brushes"],
                    brand: "Purdy",
                    title: "2 in. Angular Sash Paint Brush",
                    rating: 5.0,
                    ratingCount: 120,
                    productImages: [Image(systemName: "paintbrush.fill")],
                    price: "$12.47",
                    onAddToCart: {}
                )
            }
            .previewLayout(.sizeThatFits)
            .previewDisplayName("With Rating, No Badge")
            
            // With store info only
            ScrollView {
                DSPipZoneA(
                    breadcrumbs: ["Home", "Building Materials", "Lumber"],
                    brand: "WeatherShield",
                    title: "2 in. x 4 in. x 8 ft. Premium Kiln-Dried Whitewood Stud",
                    productImages: [Image(systemName: "rectangle.fill")],
                    price: "$5.97",
                    storeInfo: DSPipZoneA.StoreInfo(
                        stockCount: 243,
                        storeName: "Atlanta Store",
                        aisle: "15",
                        bay: "003"
                    ),
                    onAddToCart: {},
                    onStoreMapTap: {}
                )
            }
            .previewLayout(.sizeThatFits)
            .previewDisplayName("With Store Info")
            
            // With fulfillment options
            ScrollView {
                DSPipZoneA(
                    breadcrumbs: ["Home", "Appliances", "Washers"],
                    brand: "Samsung",
                    title: "5.0 cu. ft. High-Efficiency Top Load Washer",
                    rating: 4.3,
                    ratingCount: 856,
                    productImages: [Image(systemName: "washer.fill")],
                    price: "$598.00",
                    pickupOption: DSPipZoneA.FulfillmentOption(
                        eta: "Today",
                        stock: "2 in stock",
                        isFree: true,
                        isSelected: false
                    ),
                    deliveryOption: DSPipZoneA.FulfillmentOption(
                        eta: "3-5 Business Days",
                        stock: "Available",
                        isFree: false,
                        isSelected: true
                    ),
                    onAddToCart: {}
                )
            }
            .previewLayout(.sizeThatFits)
            .previewDisplayName("With Fulfillment Options")
            
            // With delivery messages
            ScrollView {
                DSPipZoneA(
                    breadcrumbs: ["Home", "Flooring", "Tile"],
                    brand: "TrafficMaster",
                    title: "Ceramica 12 in. x 12 in. Coastal Grey Ceramic Floor Tile",
                    productImages: [Image(systemName: "square.grid.3x3.fill")],
                    price: "$1.29 /sq. ft.",
                    deliveryMessages: [
                        DSPipZoneA.DeliveryMessage(type: .orderTiming, text: "Order within 4 hrs for delivery tomorrow"),
                        DSPipZoneA.DeliveryMessage(type: .scheduledDelivery, text: "Schedule your delivery in checkout")
                    ],
                    onAddToCart: {}
                )
            }
            .previewLayout(.sizeThatFits)
            .previewDisplayName("With Delivery Messages")
            
            // With all action buttons
            ScrollView {
                DSPipZoneA(
                    breadcrumbs: ["Home", "Lighting", "LED Bulbs"],
                    brand: "EcoSmart",
                    title: "60-Watt Equivalent A19 Dimmable LED Light Bulb Soft White (8-Pack)",
                    rating: 4.7,
                    ratingCount: 2341,
                    qaCount: 15,
                    productImages: [Image(systemName: "lightbulb.fill")],
                    price: "$15.97",
                    onAddToCart: {},
                    onAddToList: {},
                    onAddToQuote: {},
                    onAddToProject: {}
                )
            }
            .previewLayout(.sizeThatFits)
            .previewDisplayName("All Action Buttons")
            
            // Multi-image carousel
            ScrollView {
                DSPipZoneA(
                    breadcrumbs: ["Home", "Tools", "Power Tools", "Drills"],
                    badge: DSBadge(label: "Best Seller", variant: .filledStrong, color: .brand),
                    brand: "Milwaukee",
                    title: "M18 18V Lithium-Ion Brushless Cordless 1/2 in. Drill/Driver Kit",
                    rating: 4.9,
                    ratingCount: 1523,
                    qaCount: 42,
                    productImages: [
                        Image(systemName: "wrench.and.screwdriver.fill"),
                        Image(systemName: "battery.100.bolt"),
                        Image(systemName: "case.fill"),
                        Image(systemName: "text.magnifyingglass")
                    ],
                    currentImageIndex: 0,
                    price: "$179.00",
                    storeInfo: DSPipZoneA.StoreInfo(
                        stockCount: 15,
                        storeName: "Phoenix Store",
                        aisle: "22",
                        bay: "007"
                    ),
                    pickupOption: DSPipZoneA.FulfillmentOption(
                        eta: "Today",
                        stock: "15 in stock",
                        isFree: true,
                        isSelected: true
                    ),
                    deliveryOption: DSPipZoneA.FulfillmentOption(
                        eta: "Tomorrow",
                        stock: "Available",
                        isFree: true,
                        isSelected: false
                    ),
                    deliveryMessages: [
                        DSPipZoneA.DeliveryMessage(type: .orderTiming, text: "Order within 2 hrs 15 mins"),
                        DSPipZoneA.DeliveryMessage(type: .scheduledDelivery, text: "Schedule your delivery in checkout")
                    ],
                    onAddToCart: {},
                    onAddToList: {},
                    onAddToQuote: {},
                    onAddToProject: {},
                    onStoreMapTap: {}
                )
            }
            .previewLayout(.sizeThatFits)
            .previewDisplayName("Multi-Image Carousel")
            
            // Low rating example
            ScrollView {
                DSPipZoneA(
                    breadcrumbs: ["Home", "Hardware", "Fasteners"],
                    brand: "Generic",
                    title: "Assorted Nails and Screws Variety Pack",
                    rating: 2.5,
                    ratingCount: 42,
                    qaCount: 3,
                    productImages: [Image(systemName: "square.and.pencil")],
                    price: "$8.99",
                    deliveryMessages: [
                        DSPipZoneA.DeliveryMessage(type: .warning, text: "This item may be on backorder")
                    ],
                    onAddToCart: {}
                )
            }
            .previewLayout(.sizeThatFits)
            .previewDisplayName("Low Rating with Warning")
        }
    }
}

#Preview("Full - Light Mode") {
    ScrollView {
        DSPipZoneA.sample()
    }
}

#Preview("Full - Dark Mode") {
    ScrollView {
        DSPipZoneA.sample()
    }
    .preferredColorScheme(.dark)
}

#Preview("Minimal Configuration") {
    ScrollView {
        DSPipZoneA(
            breadcrumbs: ["Home", "Tools"],
            brand: "Husky",
            title: "16 oz. Fiberglass Claw Hammer",
            productImages: [Image(systemName: "hammer.fill")],
            price: "$14.97",
            onAddToCart: {}
        )
    }
}
