import SwiftUI

// MARK: - DSContentCard Previews

#if DEBUG

#Preview("Simple Card") {
    DSContentCard(
        title: "Featured Products",
        subtitle: "Check out our latest arrivals"
    ) {
        Rectangle()
            .fill(Color.gray.opacity(0.2))
            .frame(height: 150)
            .overlay(
                Text("Body Content")
                    .foregroundColor(.gray)
            )
    }
    .padding()
}

#Preview("Card with Icon") {
    DSContentCard(
        title: "Store Finder",
        subtitle: "Find a store near you",
        leadingIcon: Image(systemName: "building.2")
    ) {
        Rectangle()
            .fill(Color.orange.opacity(0.1))
            .frame(height: 120)
            .overlay(
                Image(systemName: "map")
                    .font(.largeTitle)
                    .foregroundColor(.orange)
            )
    }
    .padding()
}

#Preview("Card with Header Action") {
    DSContentCard(
        title: "Top Deals",
        subtitle: "Limited time offers",
        leadingIcon: Image(systemName: "tag.fill"),
        headerAction: {
            Button("See All") {}
                .font(.system(size: 14, weight: .medium))
                .foregroundColor(.orange)
        }
    ) {
        HStack(spacing: 12) {
            ForEach(0..<3, id: \.self) { _ in
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 100, height: 100)
            }
        }
    }
    .padding()
}

#Preview("Card with Bottom Action") {
    DSContentCard(
        title: "Pro Xtra Rewards",
        subtitle: "Earn points on every purchase",
        showBottomAction: true,
        bottomAction: {
            Button(action: {}) {
                Text("Join Now")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
                    .background(Color.orange)
                    .cornerRadius(8)
            }
        }
    ) {
        Text("Get exclusive discounts and early access to sales when you join Pro Xtra.")
            .font(.system(size: 14))
            .foregroundColor(.secondary)
    }
    .padding()
}

#Preview("Body First - With Padding") {
    DSContentCard(
        title: "Today's Deals",
        subtitle: "Save big on top brands",
        bodyPlacement: .firstWithPadding
    ) {
        Rectangle()
            .fill(LinearGradient(
                colors: [.orange, .red],
                startPoint: .leading,
                endPoint: .trailing
            ))
            .frame(height: 150)
            .overlay(
                Text("SALE")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
            )
    }
    .padding()
}

#Preview("Body First - Full Bleed") {
    DSContentCard(
        title: "New Collection",
        subtitle: "Spring 2025",
        bodyPlacement: .firstFullBleed
    ) {
        Rectangle()
            .fill(Color.blue.opacity(0.3))
            .frame(height: 180)
            .overlay(
                VStack {
                    Image(systemName: "leaf.fill")
                        .font(.system(size: 40))
                    Text("Fresh Arrivals")
                        .font(.headline)
                }
                .foregroundColor(.blue)
            )
    }
    .padding()
}

#Preview("Body Second - Full Bleed") {
    DSContentCard(
        title: "Featured Category",
        subtitle: "Power Tools",
        leadingIcon: Image(systemName: "wrench.and.screwdriver"),
        bodyPlacement: .secondFullBleed
    ) {
        Rectangle()
            .fill(Color.yellow.opacity(0.2))
            .frame(height: 200)
            .overlay(
                Image(systemName: "hammer.fill")
                    .font(.system(size: 60))
                    .foregroundColor(.orange)
            )
    }
    .padding()
}

#Preview("Full Featured Card") {
    DSContentCard(
        title: "Weekly Ad",
        subtitle: "Valid through Sunday",
        leadingIcon: Image(systemName: "newspaper"),
        bodyPlacement: .secondWithPadding,
        showBottomAction: true,
        headerAction: {
            Button(action: {}) {
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
        },
        bottomAction: {
            HStack(spacing: 12) {
                Button(action: {}) {
                    Text("View Ad")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(Color.orange)
                        .cornerRadius(8)
                }

                Button(action: {}) {
                    Text("Set Store")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.orange)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(Color.orange.opacity(0.1))
                        .cornerRadius(8)
                }
            }
        }
    ) {
        VStack(alignment: .leading, spacing: 8) {
            Text("Save up to 40% on select appliances")
                .font(.system(size: 14))
            Text("Plus free delivery on orders over $45")
                .font(.system(size: 12))
                .foregroundColor(.secondary)
        }
    }
    .padding()
}

#Preview("All Body Placements") {
    ScrollView {
        VStack(spacing: 20) {
            ForEach(DSContentCardBodyPlacement.allCases, id: \.self) { placement in
                DSContentCard(
                    title: "\(String(describing: placement))",
                    subtitle: "Body placement example",
                    bodyPlacement: placement
                ) {
                    Rectangle()
                        .fill(Color.blue.opacity(0.2))
                        .frame(height: 80)
                        .overlay(Text("Body"))
                }
            }
        }
        .padding()
    }
}

#Preview("Promo Card Example") {
    DSContentCard(
        title: "Black Friday",
        subtitle: "Biggest sale of the year",
        leadingIcon: Image(systemName: "tag.fill"),
        bodyPlacement: .firstFullBleed,
        showBottomAction: true,
        bottomAction: {
            Button(action: {}) {
                HStack {
                    Text("Shop Now")
                    Image(systemName: "arrow.right")
                }
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
                .background(Color.black)
                .cornerRadius(8)
            }
        }
    ) {
        ZStack {
            Rectangle()
                .fill(LinearGradient(
                    colors: [.black, .orange],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ))
                .frame(height: 200)

            VStack(spacing: 8) {
                Text("UP TO")
                    .font(.caption)
                Text("50% OFF")
                    .font(.system(size: 48, weight: .black))
                Text("SELECT ITEMS")
                    .font(.caption)
            }
            .foregroundColor(.white)
        }
    }
    .padding()
}

#endif
