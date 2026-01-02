import Foundation

/// Errors that can occur when fetching data from the Orange-Catalog API.
enum CatalogError: Error, LocalizedError, Sendable {
    /// The URL could not be constructed.
    case invalidURL
    /// A network error occurred.
    case networkError(Error)
    /// Failed to decode the response.
    case decodingError(Error)
    /// Server returned an error status code.
    case serverError(statusCode: Int)
    /// No data was returned.
    case noData
    /// The requested resource was not found.
    case notFound

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            "Invalid URL configuration"
        case .networkError(let error):
            "Network error: \(error.localizedDescription)"
        case .decodingError(let error):
            "Data parsing error: \(error.localizedDescription)"
        case .serverError(let statusCode):
            "Server error: \(statusCode)"
        case .noData:
            "No data received"
        case .notFound:
            "Resource not found"
        }
    }
}
