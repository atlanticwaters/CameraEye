//
// DSBadge.swift
//

import SwiftUI

/// A badge component for displaying status, categories, or informational labels
///
/// DSBadge supports multiple sizes, visual variants, and semantic colors. It can optionally
/// include a leading icon for added visual context.
///
/// **Note**: This component currently uses core color tokens as semantic badge-specific tokens
/// have not yet been defined in Figma. When badge tokens are added, this implementation should
/// be refactored to use `BadgeColor*` semantic tokens instead of direct core color references.
///
/// ## Usage
/// ```swift
/// // Basic badge
/// DSBadge(label: "New")
///
/// // With custom variant and color
/// DSBadge(label: "Sale", variant: .filledStrong, color: .danger)
///
/// // With icon
/// DSBadge(label: "Top Rated", leadingIcon: Image(systemName: "star.fill"))
///
/// // Different size
/// DSBadge(label: "Featured", size: .base, variant: .filledSubtle, color: .brand)
/// ```
public struct DSBadge: View {
    
    // MARK: - Types
    
    /// Badge size variants
    public enum Size {
        case small
        case base
        
        var fontSize: CGFloat {
            switch self {
            case .small: return TokensCoreLight.FontSizeBodyXs  // 12px
            case .base: return TokensCoreLight.FontSizeBodySm    // 14px
            }
        }
        
        var iconSize: CGFloat {
            switch self {
            case .small: return 9
            case .base: return 12.25
            }
        }
        
        var iconContainerWidth: CGFloat {
            switch self {
            case .small: return 12
            case .base: return 14
            }
        }
        
        var horizontalPadding: CGFloat {
            return 4  // Figma: spacing-1 (no token available)
        }
        
        var topPadding: CGFloat {
            return 4  // 2px base + 2px additional
        }
        
        var bottomPadding: CGFloat {
            return 2  // 2px base
        }
    }
    
    /// Badge visual variant
    public enum Variant {
        case outline
        case filledSubtle
        case filledStrong
    }
    
    /// Badge semantic color
    public enum Color: Hashable {
        case info       // Teal/Moonlight
        case success    // Green
        case warning    // Yellow/Lemon
        case danger     // Red/Cinnabar
        case medium     // Gray/Greige
        case primary    // Black/Greige
        case brand      // Orange
    }
    
    // MARK: - Properties
    
    private let label: String
    private let size: Size
    private let variant: Variant
    private let color: Color
    private let leadingIcon: Image?
    
    @Environment(\.colorScheme) var colorScheme
    
    // MARK: - Initialization
    
    /// Creates a badge with the specified configuration
    ///
    /// - Parameters:
    ///   - label: The text to display in the badge
    ///   - size: The size variant (default: `.small`)
    ///   - variant: The visual variant (default: `.outline`)
    ///   - color: The semantic color (default: `.info`)
    ///   - leadingIcon: Optional icon to display before the label
    public init(
        label: String,
        size: Size = .small,
        variant: Variant = .outline,
        color: Color = .info,
        leadingIcon: Image? = nil
    ) {
        self.label = label
        self.size = size
        self.variant = variant
        self.color = color
        self.leadingIcon = leadingIcon
    }
    
    // MARK: - Body
    
    public var body: some View {
        HStack(spacing: 4) {  // Figma: spacing-1 (no token available)
            if let icon = leadingIcon {
                icon
                    .resizable()
                    .frame(width: size.iconSize, height: size.iconSize)
                    .foregroundColor(textColor)
            }
            
            Text(label)
                .font(.custom(
                    TokensCoreLight.FontFamilyInformational,
                    size: size.fontSize
                ))
                .fontWeight(.bold)
                .foregroundColor(textColor)
                .lineLimit(1)
        }
        .padding(.horizontal, size.horizontalPadding)
        .padding(.top, size.topPadding)
        .padding(.bottom, size.bottomPadding)
        .background(backgroundColor)
        .overlay(
            RoundedRectangle(cornerRadius: 4)  // Figma: border-radius-md (4px, no exact token)
                .stroke(borderColor, lineWidth: borderWidth)
        )
        .cornerRadius(4)  // Figma: border-radius-md (4px)
    }
    
    // MARK: - Computed Colors
    
    private var backgroundColor: SwiftUI.Color {
        let isDark = colorScheme == .dark
        
        switch (variant, color) {
        // Outline variants have transparent backgrounds
        case (.outline, _):
            return .clear
            
        // Filled Subtle variants
        case (.filledSubtle, .info):
            return isDark ? TokensSemanticDark.Moonlight050 : TokensSemanticLight.Moonlight050
        case (.filledSubtle, .success):
            // Note: Using approximate green value - needs proper BottleGreen050 token
            return isDark 
                ? SwiftUI.Color(red: 0.89, green: 0.95, blue: 0.92, opacity: 1)
                : SwiftUI.Color(red: 0.89, green: 0.95, blue: 0.92, opacity: 1)
        case (.filledSubtle, .warning):
            return isDark ? TokensSemanticDark.Lemon050 : TokensSemanticLight.Lemon050
        case (.filledSubtle, .danger):
            return isDark ? TokensSemanticDark.Cinnabar050 : TokensSemanticLight.Cinnabar050
        case (.filledSubtle, .medium):
            return isDark ? TokensSemanticDark.Greige050 : TokensSemanticLight.Greige050
        case (.filledSubtle, .primary):
            return isDark ? TokensSemanticDark.Greige050 : TokensSemanticLight.Greige050
        case (.filledSubtle, .brand):
            return isDark ? TokensSemanticDark.Brand025 : TokensSemanticLight.Brand025
            
        // Filled Strong variants
        case (.filledStrong, .info):
            return isDark ? TokensSemanticDark.Moonlight500 : TokensSemanticLight.Moonlight500
        case (.filledStrong, .success):
            // Note: Using BackgroundAccentColorGreen - needs proper BottleGreen500 token
            return isDark ? TokensSemanticDark.BackgroundAccentColorGreen : TokensSemanticLight.BackgroundAccentColorGreen
        case (.filledStrong, .warning):
            return isDark ? TokensSemanticDark.Lemon100 : TokensSemanticLight.Lemon100
        case (.filledStrong, .danger):
            return isDark ? TokensSemanticDark.Cinnabar500 : TokensSemanticLight.Cinnabar500
        case (.filledStrong, .medium):
            return isDark ? TokensSemanticDark.Greige600 : TokensSemanticLight.Greige600
        case (.filledStrong, .primary):
            return isDark ? TokensSemanticDark.Greige900 : TokensSemanticLight.Greige900
        case (.filledStrong, .brand):
            return isDark ? TokensSemanticDark.Brand300 : TokensSemanticLight.Brand300
        }
    }
    
    private var borderColor: SwiftUI.Color {
        let isDark = colorScheme == .dark
        
        switch (variant, color) {
        // Only outline variant has borders
        case (.outline, .info):
            return isDark ? TokensSemanticDark.Moonlight500 : TokensSemanticLight.Moonlight500
        case (.outline, .success):
            // Note: Using approximate green value - needs proper BottleGreen500 token
            return isDark
                ? SwiftUI.Color(red: 0.29, green: 0.506, blue: 0.396, opacity: 1)
                : SwiftUI.Color(red: 0.29, green: 0.506, blue: 0.396, opacity: 1)
        case (.outline, .warning):
            return isDark ? TokensSemanticDark.Lemon500 : TokensSemanticLight.Lemon500
        case (.outline, .danger):
            return isDark ? TokensSemanticDark.Cinnabar600 : TokensSemanticLight.Cinnabar600
        case (.outline, .medium):
            return isDark ? TokensSemanticDark.Greige600 : TokensSemanticLight.Greige600
        case (.outline, .primary):
            return isDark ? TokensSemanticDark.Greige900 : TokensSemanticLight.Greige900
        case (.outline, .brand):
            return isDark ? TokensSemanticDark.Brand300 : TokensSemanticLight.Brand300
        default:
            return .clear
        }
    }
    
    private var borderWidth: CGFloat {
        variant == .outline ? TokensSemanticLight.BorderWidthXs : 0
    }
    
    private var textColor: SwiftUI.Color {
        let isDark = colorScheme == .dark
        
        switch (variant, color) {
        // Outline text colors
        case (.outline, .info):
            return isDark ? TokensSemanticDark.Moonlight500 : TokensSemanticLight.Moonlight500
        case (.outline, .success):
            // Note: Using approximate green value - needs proper BottleGreen500 token
            return isDark
                ? SwiftUI.Color(red: 0.29, green: 0.506, blue: 0.396, opacity: 1)
                : SwiftUI.Color(red: 0.29, green: 0.506, blue: 0.396, opacity: 1)
        case (.outline, .warning):
            return isDark ? TokensSemanticDark.Lemon500 : TokensSemanticLight.Lemon500
        case (.outline, .danger):
            return isDark ? TokensSemanticDark.Cinnabar600 : TokensSemanticLight.Cinnabar600
        case (.outline, .medium):
            return isDark ? TokensSemanticDark.TextOnSurfaceColorTertiary : TokensSemanticLight.TextOnSurfaceColorTertiary
        case (.outline, .primary):
            return isDark ? TokensSemanticDark.Greige900 : TokensSemanticLight.Greige900
        case (.outline, .brand):
            return isDark ? TokensSemanticDark.Brand300 : TokensSemanticLight.Brand300
            
        // Filled Subtle text colors
        case (.filledSubtle, .info):
            return isDark ? TokensSemanticDark.Moonlight800 : TokensSemanticLight.Moonlight800
        case (.filledSubtle, .success):
            // Note: Using approximate green value - needs proper BottleGreen700 token
            return isDark
                ? SwiftUI.Color(red: 0.133, green: 0.384, blue: 0.259, opacity: 1)
                : SwiftUI.Color(red: 0.133, green: 0.384, blue: 0.259, opacity: 1)
        case (.filledSubtle, .warning):
            return isDark ? TokensSemanticDark.Lemon900 : TokensSemanticLight.Lemon900
        case (.filledSubtle, .danger):
            return isDark ? TokensSemanticDark.Cinnabar700 : TokensSemanticLight.Cinnabar700
        case (.filledSubtle, .medium):
            return isDark ? TokensSemanticDark.TextOnSurfaceColorTertiary : TokensSemanticLight.TextOnSurfaceColorTertiary
        case (.filledSubtle, .primary):
            return isDark ? TokensSemanticDark.TextOnSurfaceColorPrimary : TokensSemanticLight.TextOnSurfaceColorPrimary
        case (.filledSubtle, .brand):
            // Note: Using Brand950 - should be semantic BadgeColorTextSubtleBrand token
            return isDark ? TokensSemanticDark.Brand950 : TokensSemanticLight.Brand950
            
        // Filled Strong text colors - all use inverse/white for contrast
        case (.filledStrong, .warning):
            // Warning filled strong uses primary text (dark on yellow)
            return isDark ? TokensSemanticDark.TextOnSurfaceColorPrimary : TokensSemanticLight.TextOnSurfaceColorPrimary
        case (.filledStrong, _):
            // All other filled strong variants use white text
            return isDark ? TokensSemanticDark.NeutralsWhite : TokensSemanticLight.NeutralsWhite
        }
    }
}
