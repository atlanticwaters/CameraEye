import SwiftUI

// MARK: - DSImageContainerResolvedStyle

/// Resolved style information for DSImageContainer testing.
///
/// This struct captures computed styles as concrete values using token names,
/// enabling unit tests without view rendering or environment dependencies.
public struct DSImageContainerResolvedStyle: Equatable, Sendable {
    /// The background color token name
    public let backgroundColorTokenName: String

    /// The border color token name
    public let borderColorTokenName: String

    /// The placeholder icon color token name
    public let placeholderIconColorTokenName: String

    /// The container size
    public let size: DSImageContainerSize

    /// The computed dimension for the size
    public let dimension: CGFloat

    /// The computed corner radius for the size
    public let cornerRadius: CGFloat

    /// Creates a resolved style for the given configuration.
    public init(size: DSImageContainerSize) {
        self.backgroundColorTokenName = DSImageContainerColorHelper.backgroundColorTokenName()
        self.borderColorTokenName = DSImageContainerColorHelper.borderColorTokenName()
        self.placeholderIconColorTokenName = DSImageContainerColorHelper.placeholderIconColorTokenName()
        self.size = size
        self.dimension = size.dimension
        self.cornerRadius = size.cornerRadius
    }
}
