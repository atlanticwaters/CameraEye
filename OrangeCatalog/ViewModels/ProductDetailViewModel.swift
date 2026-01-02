import SwiftUI

/// View model for product detail view.
@MainActor
@Observable
final class ProductDetailViewModel {
    // MARK: - State

    var productDetail: OrangeCatalogProductDetail?
    var isLoading: Bool = false
    var errorMessage: String?
    var selectedImageIndex: Int = 0

    // MARK: - Computed

    /// Current image URL based on selection.
    var currentImageURL: URL? {
        guard let detail = productDetail else { return nil }

        let images = detail.imageURLs
        guard selectedImageIndex < images.count else {
            return detail.primaryImageURL
        }
        return images[selectedImageIndex]
    }

    /// All available image URLs.
    var allImageURLs: [URL] {
        productDetail?.imageURLs ?? []
    }

    /// Whether there are multiple images to show.
    var hasMultipleImages: Bool {
        allImageURLs.count > 1
    }

    // MARK: - Actions

    /// Load product detail by ID.
    /// - Parameter id: The product ID to load.
    func loadProductDetail(id: String) async {
        isLoading = true
        errorMessage = nil
        selectedImageIndex = 0

        do {
            productDetail = try await CatalogService.shared.fetchProductDetail(id: id)
        } catch {
            errorMessage = error.localizedDescription
        }

        isLoading = false
    }

    /// Select an image by index.
    /// - Parameter index: The index of the image to select.
    func selectImage(at index: Int) {
        guard index >= 0 && index < allImageURLs.count else { return }
        selectedImageIndex = index
    }

    /// Navigate to the next image.
    func nextImage() {
        let count = allImageURLs.count
        guard count > 1 else { return }
        selectedImageIndex = (selectedImageIndex + 1) % count
    }

    /// Navigate to the previous image.
    func previousImage() {
        let count = allImageURLs.count
        guard count > 1 else { return }
        selectedImageIndex = (selectedImageIndex - 1 + count) % count
    }

    /// Clear the current error message.
    func clearError() {
        errorMessage = nil
    }

    /// Reset the view model state.
    func reset() {
        productDetail = nil
        isLoading = false
        errorMessage = nil
        selectedImageIndex = 0
    }
}
