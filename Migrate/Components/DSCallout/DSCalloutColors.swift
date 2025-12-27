import SwiftUI

// MARK: - DSCalloutColorHelper

/// Helper for computing callout colors based on variant.
public enum DSCalloutColorHelper {
    // MARK: - Background Colors

    /// Returns the background color for the given variant.
    public static func backgroundColor(variant: DSCalloutVariant) -> Color {
        switch variant {
        case .neutral:
            DSColor.containerBackgroundTransparent20.resolve
        case .brand:
            DSColor.containerBackgroundBrandAccent.resolve
        case .inverse:
            DSColor.containerBackgroundInverse.resolve
        }
    }

    /// Returns the background token name for testing.
    public static func backgroundTokenName(variant: DSCalloutVariant) -> String {
        switch variant {
        case .neutral:
            "containerBackgroundTransparent20"
        case .brand:
            "containerBackgroundBrandAccent"
        case .inverse:
            "containerBackgroundInverse"
        }
    }

    // MARK: - Title Colors

    /// Returns the title color for the given variant.
    public static func titleColor(variant: DSCalloutVariant) -> Color {
        switch variant {
        case .neutral,
             .brand:
            DSColor.textOnSurfaceColorPrimary.resolve
        case .inverse:
            DSColor.textOnSurfaceColorInverse.resolve
        }
    }

    /// Returns the title color token name for testing.
    public static func titleColorTokenName(variant: DSCalloutVariant) -> String {
        switch variant {
        case .neutral,
             .brand:
            "textOnSurfaceColorPrimary"
        case .inverse:
            "textOnSurfaceColorInverse"
        }
    }

    // MARK: - Body Colors

    /// Returns the body text color for the given variant.
    public static func bodyColor(variant: DSCalloutVariant) -> Color {
        switch variant {
        case .neutral,
             .brand:
            DSColor.textOnSurfaceColorPrimary.resolve
        case .inverse:
            DSColor.textOnSurfaceColorInverse.resolve
        }
    }

    /// Returns the body color token name for testing.
    public static func bodyColorTokenName(variant: DSCalloutVariant) -> String {
        switch variant {
        case .neutral,
             .brand:
            "textOnSurfaceColorPrimary"
        case .inverse:
            "textOnSurfaceColorInverse"
        }
    }

    // MARK: - Icon Colors

    /// Returns the icon color for the given variant.
    /// Icons use the same color as text per design spec.
    public static func iconColor(variant: DSCalloutVariant) -> Color {
        switch variant {
        case .neutral,
             .brand:
            DSColor.textOnSurfaceColorPrimary.resolve
        case .inverse:
            DSColor.textOnSurfaceColorInverse.resolve
        }
    }

    /// Returns the icon color token name for testing.
    public static func iconColorTokenName(variant: DSCalloutVariant) -> String {
        switch variant {
        case .neutral,
             .brand:
            "textOnSurfaceColorPrimary"
        case .inverse:
            "textOnSurfaceColorInverse"
        }
    }
}
