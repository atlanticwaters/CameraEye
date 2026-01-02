import SwiftUI

// MARK: - Design System Alias

private typealias DS = DesignSystemGlobal

// MARK: - CatalogProductDetailView

/// Full product detail view with images, specs, and features.
struct CatalogProductDetailView: View {
    let productId: String
    let product: OrangeCatalogProduct?

    @State private var viewModel = ProductDetailViewModel()

    init(productId: String, product: OrangeCatalogProduct? = nil) {
        self.productId = productId
        self.product = product
    }

    var body: some View {
        ScrollView {
            if viewModel.isLoading {
                loadingView
            } else if let error = viewModel.errorMessage {
                errorView(message: error)
            } else if let detail = viewModel.productDetail {
                productContent(detail: detail)
            }
        }
        .scrollEdgeEffectStyle(.soft, for: .top)
        .scrollEdgeEffectStyle(.soft, for: .bottom)
        .background(DS.BackgroundSurfaceColorGreige)
        .navigationTitle(viewModel.productDetail?.name ?? "Product")
        .navigationBarTitleDisplayMode(.inline)
        .task {
            await viewModel.loadProductDetail(id: productId)
        }
    }

    // MARK: - Product Content

    @ViewBuilder
    private func productContent(detail: OrangeCatalogProductDetail) -> some View {
        LazyVStack(alignment: .leading, spacing: DS.Spacing4) {
            // Image Gallery
            imageGallery(detail: detail)

            // Product Info Card
            productInfoCard(detail: detail)

            // Description
            if let description = detail.description, !description.isEmpty {
                descriptionSection(description: description)
            }

            // Specifications
            if !detail.specificationsList.isEmpty {
                specificationsSection(specs: detail.specificationsList)
            }

            // Features
            if let features = detail.features, !features.isEmpty {
                featuresSection(features: features)
            }
        }
        .padding(.bottom, 100)
    }

    // MARK: - Image Gallery

    /// Gallery URLs from product (13 images at 600px)
    private var galleryImageURLs: [URL] {
        product?.galleryURLs ?? []
    }

    /// Whether we have multiple gallery images to show
    private var hasGalleryImages: Bool {
        galleryImageURLs.count > 1
    }

    @ViewBuilder
    private func imageGallery(detail: OrangeCatalogProductDetail) -> some View {
        VStack(spacing: DS.Spacing3) {
            // Swipeable Image Gallery
            if hasGalleryImages {
                TabView(selection: Binding(
                    get: { viewModel.selectedImageIndex },
                    set: { viewModel.selectImage(at: $0) }
                )) {
                    ForEach(galleryImageURLs.enumerated().map { $0 }, id: \.element) { index, url in
                        AsyncImage(url: url) { phase in
                            switch phase {
                            case .success(let image):
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            case .failure:
                                Image(systemName: "photo")
                                    .font(.system(size: 60))
                                    .foregroundStyle(DS.IconOnContainerColorInactive)
                            default:
                                ProgressView()
                                    .scaleEffect(1.5)
                            }
                        }
                        .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .automatic))
                .frame(height: 300)
                .frame(maxWidth: .infinity)
                .background(DS.BackgroundContainerColorWhite)
            } else {
                // Single Image or fallback to medium resolution
                AsyncImage(url: product?.mediumImageURL ?? detail.primaryImageURL) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    case .failure:
                        Image(systemName: "photo")
                            .font(.system(size: 60))
                            .foregroundStyle(DS.IconOnContainerColorInactive)
                    default:
                        ProgressView()
                            .scaleEffect(1.5)
                    }
                }
                .frame(height: 300)
                .frame(maxWidth: .infinity)
                .background(DS.BackgroundContainerColorWhite)
            }

            // Thumbnail Strip
            if hasGalleryImages {
                thumbnailStrip
            }
        }
    }

    private var thumbnailStrip: some View {
        ScrollView(.horizontal) {
            HStack(spacing: DS.Spacing2) {
                ForEach(galleryImageURLs.enumerated().map { $0 }, id: \.element) { index, url in
                    Button {
                        viewModel.selectImage(at: index)
                    } label: {
                        AsyncImage(url: url) { phase in
                            if case .success(let image) = phase {
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                            } else {
                                Color.gray.opacity(0.2)
                            }
                        }
                        .frame(width: 60, height: 60)
                        .clipShape(.rect(cornerRadius: 6))
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(
                                    viewModel.selectedImageIndex == index
                                        ? DS.Brand300
                                        : Color.clear,
                                    lineWidth: 2
                                )
                        )
                    }
                }
            }
            .padding(.horizontal)
        }
        .scrollIndicators(.hidden)
    }

    // MARK: - Product Info Card

    @ViewBuilder
    private func productInfoCard(detail: OrangeCatalogProductDetail) -> some View {
        VStack(alignment: .leading, spacing: DS.Spacing3) {
            // Brand
            Text(detail.brandName)
                .thdFont(.bodySm)
                .foregroundStyle(DS.TextOnContainerColorSecondary)

            // Name
            Text(detail.name)
                .thdFont(.h4)
                .foregroundStyle(DS.TextOnContainerColorPrimary)

            // Rating
            DSRatingMeter(
                rating: detail.ratingAverage,
                reviewCount: detail.reviewCount,
                size: .medium
            )

            // Price
            priceRow(detail: detail)

            // Stock Status
            stockStatus(inStock: detail.inStock)

            // Add to Cart Button
            DSButton("Add to Cart", style: .orangeFilled, size: .large) {
                // Cart action would go here
            }
        }
        .padding()
        .background(DS.BackgroundContainerColorWhite)
        .clipShape(.rect(cornerRadius: DS.BorderRadiusLg))
        .padding(.horizontal)
    }

    @ViewBuilder
    private func priceRow(detail: OrangeCatalogProductDetail) -> some View {
        HStack(alignment: .firstTextBaseline, spacing: DS.Spacing2) {
            if let price = detail.currentPrice {
                Text(price, format: .currency(code: "USD"))
                    .thdFont(.h3)
                    .foregroundStyle(DS.TextOnContainerColorPrimary)

                if let original = detail.originalPrice {
                    Text(original, format: .currency(code: "USD"))
                        .thdFont(.bodyMd)
                        .foregroundStyle(DS.TextOnContainerColorTertiary)
                        .strikethrough()
                }
            } else {
                Text("Price unavailable")
                    .thdFont(.h4)
                    .foregroundStyle(DS.TextOnContainerColorTertiary)
            }
        }
    }

    @ViewBuilder
    private func stockStatus(inStock: Bool) -> some View {
        HStack(spacing: DS.Spacing2) {
            Image(systemName: inStock ? "checkmark.circle.fill" : "xmark.circle.fill")
                .foregroundStyle(inStock ? DS.IconOnContainerColorSuccess : DS.IconOnContainerColorError)
            Text(inStock ? "In Stock" : "Out of Stock")
                .thdFont(.bodySm)
                .foregroundStyle(inStock ? DS.IconOnContainerColorSuccess : DS.IconOnContainerColorError)
        }
    }

    // MARK: - Description Section

    @ViewBuilder
    private func descriptionSection(description: String) -> some View {
        VStack(alignment: .leading, spacing: DS.Spacing2) {
            Text("Description")
                .thdFont(.h5)
                .foregroundStyle(DS.TextOnContainerColorPrimary)

            Text(description)
                .thdFont(.bodyMd)
                .foregroundStyle(DS.TextOnContainerColorSecondary)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(DS.BackgroundContainerColorWhite)
        .clipShape(.rect(cornerRadius: DS.BorderRadiusLg))
        .padding(.horizontal)
    }

    // MARK: - Specifications Section

    @ViewBuilder
    private func specificationsSection(specs: [(name: String, value: String)]) -> some View {
        VStack(alignment: .leading, spacing: DS.Spacing2) {
            Text("Specifications")
                .thdFont(.h5)
                .foregroundStyle(DS.TextOnContainerColorPrimary)

            ForEach(specs, id: \.name) { spec in
                HStack {
                    Text(spec.name)
                        .thdFont(.bodySm)
                        .foregroundStyle(DS.TextOnContainerColorSecondary)
                    Spacer()
                    Text(spec.value)
                        .thdFont(.bodySm)
                        .foregroundStyle(DS.TextOnContainerColorPrimary)
                }
                if spec.name != specs.last?.name {
                    Divider()
                }
            }
        }
        .padding()
        .background(DS.BackgroundContainerColorWhite)
        .clipShape(.rect(cornerRadius: DS.BorderRadiusLg))
        .padding(.horizontal)
    }

    // MARK: - Features Section

    @ViewBuilder
    private func featuresSection(features: [String]) -> some View {
        VStack(alignment: .leading, spacing: DS.Spacing2) {
            Text("Key Features")
                .thdFont(.h5)
                .foregroundStyle(DS.TextOnContainerColorPrimary)

            ForEach(features, id: \.self) { feature in
                HStack(alignment: .top, spacing: DS.Spacing2) {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundStyle(DS.IconOnContainerColorSuccess)
                        .font(.system(size: 16))
                    Text(feature)
                        .thdFont(.bodyMd)
                        .foregroundStyle(DS.TextOnContainerColorSecondary)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(DS.BackgroundContainerColorWhite)
        .clipShape(.rect(cornerRadius: DS.BorderRadiusLg))
        .padding(.horizontal)
    }

    // MARK: - Loading View

    private var loadingView: some View {
        VStack(spacing: DS.Spacing4) {
            ProgressView()
                .scaleEffect(1.5)
            Text("Loading product...")
                .thdFont(.bodyMd)
                .foregroundStyle(DS.TextOnSurfaceColorSecondary)
        }
        .frame(maxWidth: .infinity, minHeight: 400)
    }

    // MARK: - Error View

    private func errorView(message: String) -> some View {
        VStack(spacing: DS.Spacing4) {
            Image(systemName: "exclamationmark.triangle")
                .font(.system(size: 48))
                .foregroundStyle(DS.IconOnContainerColorError)

            Text(message)
                .thdFont(.bodyMd)
                .foregroundStyle(DS.TextOnSurfaceColorSecondary)
                .multilineTextAlignment(.center)

            DSButton("Retry", style: .outlined, size: .medium) {
                Task {
                    await viewModel.loadProductDetail(id: productId)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 400)
    }
}

// MARK: - Preview

#Preview("Product Detail") {
    NavigationStack {
        CatalogProductDetailView(productId: "sample-product-id")
    }
}
