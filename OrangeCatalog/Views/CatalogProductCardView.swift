import SwiftUI

// MARK: - Design System Alias

private typealias DS = DesignSystemGlobal

// MARK: - CatalogProductCardView

/// Product card component for catalog listings.
/// Displays product image, name, brand, price, and rating.
struct CatalogProductCardView: View {
    let product: OrangeCatalogProduct

    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            productImage
            productDetails
        }
        .background(DS.BackgroundContainerColorWhite)
        .clipShape(.rect(cornerRadius: DS.BorderRadiusMd))
        .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
    }

    // MARK: - Product Image

    private var productImage: some View {
        AsyncImage(url: product.imageURL) { phase in
            switch phase {
            case .empty:
                loadingPlaceholder
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            case .failure:
                errorPlaceholder
            @unknown default:
                loadingPlaceholder
            }
        }
        .frame(width: 100, height: 100)
        .background(DS.BackgroundSurfaceColorGreige)
    }

    private var loadingPlaceholder: some View {
        ProgressView()
            .frame(width: 100, height: 100)
    }

    private var errorPlaceholder: some View {
        Image(systemName: "photo")
            .font(.system(size: 32))
            .foregroundStyle(DS.IconOnContainerColorInactive)
            .frame(width: 100, height: 100)
    }

    // MARK: - Product Details

    private var productDetails: some View {
        VStack(alignment: .leading, spacing: DS.Spacing1) {
            // Product Name
            Text(product.name)
                .thdFont(.bodyMd)
                .foregroundStyle(DS.TextOnContainerColorPrimary)
                .lineLimit(2)
                .multilineTextAlignment(.leading)

            // Brand
            if let brand = product.brand {
                Text(brand)
                    .thdFont(.caption)
                    .foregroundStyle(DS.TextOnContainerColorSecondary)
            }

            Spacer(minLength: DS.Spacing1)

            // Price
            priceView

            // Rating
            if let rating = product.ratingAverage {
                DSRatingMeter(
                    rating: rating,
                    reviewCount: product.reviewCount,
                    size: .small
                )
            }
        }
        .padding(DS.Spacing2)
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    // MARK: - Price View

    @ViewBuilder
    private var priceView: some View {
        HStack(alignment: .firstTextBaseline, spacing: DS.Spacing1) {
            if let price = product.currentPrice {
                Text(price, format: .currency(code: "USD"))
                    .thdFont(.h5)
                    .foregroundStyle(DS.TextOnContainerColorPrimary)

                if let original = product.originalPrice {
                    Text(original, format: .currency(code: "USD"))
                        .thdFont(.bodySm)
                        .foregroundStyle(DS.TextOnContainerColorTertiary)
                        .strikethrough()
                }

                if let savings = product.savingsPercentage {
                    Text("-\(savings)%")
                        .thdFont(.caption)
                        .foregroundStyle(DS.IconOnContainerColorSuccess)
                }
            } else {
                Text("Price unavailable")
                    .thdFont(.bodySm)
                    .foregroundStyle(DS.TextOnContainerColorTertiary)
            }
        }
    }
}

// MARK: - Large Card Variant

/// Larger product card for grid layouts.
struct CatalogProductGridCardView: View {
    let product: OrangeCatalogProduct

    var body: some View {
        VStack(alignment: .leading, spacing: DS.Spacing2) {
            // Product Image
            productImage

            // Product Info
            VStack(alignment: .leading, spacing: DS.Spacing1) {
                // Brand
                if let brand = product.brand {
                    Text(brand)
                        .thdFont(.caption)
                        .foregroundStyle(DS.TextOnContainerColorSecondary)
                }

                // Product Name
                Text(product.name)
                    .thdFont(.bodySm)
                    .foregroundStyle(DS.TextOnContainerColorPrimary)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)

                // Price
                if let price = product.currentPrice {
                    Text(price, format: .currency(code: "USD"))
                        .thdFont(.h6)
                        .foregroundStyle(DS.TextOnContainerColorPrimary)
                }

                // Rating
                if let rating = product.ratingAverage {
                    DSRatingMeter.compact(rating: rating, size: .small)
                }
            }
            .padding(.horizontal, DS.Spacing2)
            .padding(.bottom, DS.Spacing2)
        }
        .background(DS.BackgroundContainerColorWhite)
        .clipShape(.rect(cornerRadius: DS.BorderRadiusMd))
        .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
    }

    private var productImage: some View {
        AsyncImage(url: product.imageURL) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(maxWidth: .infinity)
                    .frame(height: 120)
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .frame(height: 120)
            case .failure:
                Image(systemName: "photo")
                    .font(.system(size: 40))
                    .foregroundStyle(DS.IconOnContainerColorInactive)
                    .frame(maxWidth: .infinity)
                    .frame(height: 120)
            @unknown default:
                EmptyView()
            }
        }
        .background(DS.BackgroundSurfaceColorGreige)
        .clipShape(.rect(topLeadingRadius: DS.BorderRadiusMd, topTrailingRadius: DS.BorderRadiusMd))
    }
}

// MARK: - Preview

#Preview("Product Card") {
    let sampleProduct = OrangeCatalogProduct(
        productId: "12345",
        modelNumber: "ABC-123",
        brand: "Milwaukee",
        title: "M18 FUEL 18V Lithium-Ion Brushless Cordless Hammer Drill",
        subcategory: "Hammer Drills",
        rating: OrangeCatalogProduct.ProductRating(average: 4.7, count: 1234),
        images: OrangeCatalogProduct.ProductImages(primary: "https://images.thdstatic.com/productImages/sample.jpg"),
        badges: nil,
        availability: OrangeCatalogProduct.ProductAvailability(inStock: true),
        price: OrangeCatalogProduct.ProductPrice(
            current: 199.00,
            original: 249.00,
            currency: "USD"
        )
    )

    VStack(spacing: 16) {
        CatalogProductCardView(product: sampleProduct)
            .padding(.horizontal)

        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
            CatalogProductGridCardView(product: sampleProduct)
            CatalogProductGridCardView(product: sampleProduct)
        }
        .padding(.horizontal)
    }
    .padding(.vertical)
    .background(DS.BackgroundSurfaceColorGreige)
}
