import SwiftUI

// MARK: - Design System Alias

private typealias DS = DesignSystemGlobal

// MARK: - CatalogBrowserView

/// Main entry view for the Orange-Catalog browser.
/// Displays category grid with navigation to product lists.
struct CatalogBrowserView: View {
    @State private var viewModel = CatalogViewModel()
    @State private var navigationPath = NavigationPath()

    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        NavigationStack(path: $navigationPath) {
            ScrollView {
                LazyVStack(spacing: 0) {
                    // Header
                    catalogHeader

                    // Content
                    if viewModel.isLoadingCategories && viewModel.categorySummaries.isEmpty {
                        loadingView
                    } else if let error = viewModel.errorMessage {
                        errorView(message: error)
                    } else {
                        categoryGrid
                    }
                }
                .padding(.bottom, 100)
            }
            .scrollEdgeEffectStyle(.soft, for: .top)
            .scrollEdgeEffectStyle(.soft, for: .bottom)
            .background(DS.BackgroundSurfaceColorGreige)
            .navigationDestination(for: CategoriesIndexResponse.CategorySummary.self) { category in
                OrangeCatalogPLPView(
                    category: category,
                    onProductSelected: { product in
                        navigationPath.append(product)
                    }
                )
            }
            .navigationDestination(for: OrangeCatalogProduct.self) { product in
                CatalogProductDetailView(productId: product.productId)
            }
            .refreshable {
                await viewModel.refreshCategories()
            }
        }
        .task {
            await viewModel.loadCategories()
        }
    }

    // MARK: - Catalog Header

    private var catalogHeader: some View {
        VStack(alignment: .leading, spacing: DS.Spacing2) {
            Text("Product Catalog")
                .thdFont(.h3)
                .foregroundStyle(DS.TextOnSurfaceColorPrimary)

            Text("Browse 3,001 products across 76 categories")
                .thdFont(.bodyMd)
                .foregroundStyle(DS.TextOnSurfaceColorSecondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }

    // MARK: - Category Grid

    private var categoryGrid: some View {
        LazyVGrid(columns: columns, spacing: DS.Spacing3) {
            ForEach(viewModel.categorySummaries) { category in
                NavigationLink(value: category) {
                    CategoryCardView(category: category)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.horizontal)
    }

    // MARK: - Loading View

    private var loadingView: some View {
        VStack(spacing: DS.Spacing4) {
            ProgressView()
                .scaleEffect(1.5)
            Text("Loading categories...")
                .thdFont(.bodyMd)
                .foregroundStyle(DS.TextOnSurfaceColorSecondary)
        }
        .frame(maxWidth: .infinity, minHeight: 300)
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

            DSButton("Retry", style: .orangeFilled, size: .medium) {
                Task {
                    await viewModel.loadCategories()
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 300)
    }
}

// MARK: - CategoryCardView

/// Card component for displaying a category in the grid.
struct CategoryCardView: View {
    let category: CategoriesIndexResponse.CategorySummary

    var body: some View {
        VStack(spacing: DS.Spacing2) {
            // Category Icon
            categoryIcon

            // Category Name
            Text(category.name)
                .thdFont(.bodyMd)
                .foregroundStyle(DS.TextOnContainerColorPrimary)
                .lineLimit(2)
                .multilineTextAlignment(.center)

            // Product Count
            Text("\(category.productCount) products")
                .thdFont(.caption)
                .foregroundStyle(DS.TextOnContainerColorSecondary)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(DS.BackgroundContainerColorWhite)
        .clipShape(.rect(cornerRadius: DS.BorderRadiusLg))
        .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
    }

    @ViewBuilder
    private var categoryIcon: some View {
        Image(systemName: iconName(for: category.slug))
            .font(.system(size: 32))
            .foregroundStyle(DS.Brand300)
            .frame(width: 60, height: 60)
            .background(DS.Brand300.opacity(0.1))
            .clipShape(.circle)
    }

    /// Maps category slug to an appropriate SF Symbol.
    private func iconName(for slug: String) -> String {
        switch slug.lowercased() {
        case "tools", "power-tools":
            return "wrench.and.screwdriver.fill"
        case "appliances":
            return "refrigerator.fill"
        case "plumbing":
            return "drop.fill"
        case "electrical":
            return "bolt.fill"
        case "lighting":
            return "lightbulb.fill"
        case "flooring":
            return "square.grid.3x3.fill"
        case "building-materials":
            return "building.2.fill"
        case "home-decor":
            return "house.fill"
        case "kitchen":
            return "fork.knife"
        case "bath", "bathroom":
            return "shower.fill"
        case "outdoor", "garden":
            return "leaf.fill"
        case "paint":
            return "paintbrush.fill"
        case "hardware":
            return "gearshape.fill"
        case "storage":
            return "archivebox.fill"
        case "garage":
            return "car.fill"
        case "automotive":
            return "car.side.fill"
        case "heating-cooling", "hvac":
            return "thermometer.medium"
        case "doors-windows":
            return "door.left.hand.open"
        case "furniture":
            return "chair.lounge.fill"
        default:
            return "square.grid.2x2.fill"
        }
    }
}

// MARK: - Preview

#Preview("Catalog Browser") {
    CatalogBrowserView()
}

#Preview("Category Card") {
    CategoryCardView(
        category: CategoriesIndexResponse.CategorySummary(
            id: "tools",
            name: "Tools",
            slug: "tools",
            productCount: 899,
            path: "/categories/tools",
            imageUrl: nil,
            subcategories: nil
        )
    )
    .padding()
    .background(DS.BackgroundSurfaceColorGreige)
}
