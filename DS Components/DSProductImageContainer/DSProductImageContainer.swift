import SwiftUI

// MARK: - DSProductImageContainer

/// A product image container component for product listing pages.
///
/// Displays a product image with optional badges, sponsored tag, color swatches,
/// and swatch count indicator. Designed for use in product cards and listing pages.
///
/// Example usage:
/// ```swift
/// DSProductImageContainer(
///     imageURL: URL(string: "https://..."),
///     showExclusiveBadge: true,
///     showDeliveryBadge: true,
///     showSponsoredTag: true,
///     swatches: [.black, .gray, .brown],
///     additionalSwatchCount: 99
/// )
/// ```
public struct DSProductImageContainer: View {
    // MARK: Lifecycle

    /// Creates a product image container with the specified configuration.
    ///
    /// - Parameters:
    ///   - imageURL: Optional URL for the product image
    ///   - placeholderImage: Optional placeholder image (e.g., Image("Fridge"))
    ///   - showExclusiveBadge: Whether to display the "Exclusive" badge
    ///   - showDeliveryBadge: Whether to display the "Get it by Christmas" badge
    ///   - showSponsoredTag: Whether to display the "Sponsored" tag
    ///   - swatches: Array of colors to display as swatches (max 3 visible)
    ///   - selectedSwatchIndex: Index of the selected swatch (0-based)
    ///   - additionalSwatchCount: Number of additional swatches not shown (e.g., "+99")
    public init(
        imageURL: URL? = nil,
        placeholderImage: Image? = nil,
        showExclusiveBadge: Bool = false,
        showDeliveryBadge: Bool = false,
        showSponsoredTag: Bool = false,
        swatches: [Color] = [],
        selectedSwatchIndex: Int = 0,
        additionalSwatchCount: Int? = nil
    ) {
        self.imageURL = imageURL
        self.placeholderImage = placeholderImage
        self.showExclusiveBadge = showExclusiveBadge
        self.showDeliveryBadge = showDeliveryBadge
        self.showSponsoredTag = showSponsoredTag
        self.swatches = swatches
        self.selectedSwatchIndex = selectedSwatchIndex
        self.additionalSwatchCount = additionalSwatchCount
    }

    // MARK: Public

    public var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Wrapping badges
            if showExclusiveBadge || showDeliveryBadge {
                VStack(alignment: .leading, spacing: 4) {
                    if showExclusiveBadge {
                        badgeView(
                            text: "Exclusive",
                            backgroundColor: moonlightBackgroundColor,
                            textColor: moonlightTextColor
                        )
                    }
                    
                    if showDeliveryBadge {
                        badgeView(
                            text: "Get it by Christmas",
                            backgroundColor: deliveryBackgroundColor,
                            textColor: deliveryTextColor
                        )
                    }
                }
            }
            
            Spacer(minLength: 4)
            
            // Product image
            VStack(alignment: .leading, spacing: 4) {
                productImageView
                    .frame(width: 137, height: 137)
                    .cornerRadius(2)
                
                if showSponsoredTag {
                    Text("Sponsored")
                        .font(.system(size: 12))
                        .foregroundColor(sponsoredTextColor)
                }
            }
            
            Spacer(minLength: 4)
            
            // Swatches and count
            if !swatches.isEmpty {
                HStack(spacing: 4) {
                    swatchesView
                    
                    if let count = additionalSwatchCount, count > 0 {
                        Text("+\(count)")
                            .font(.system(size: 12))
                            .underline()
                            .foregroundColor(primaryTextColor)
                    }
                }
            }
        }
        .padding(4)
        .frame(width: 145)
        .background(containerBackgroundColor)
        .cornerRadius(TokensSemanticLight.BorderRadiusXl)
    }

    // MARK: Private

    private let imageURL: URL?
    private let placeholderImage: Image?
    private let showExclusiveBadge: Bool
    private let showDeliveryBadge: Bool
    private let showSponsoredTag: Bool
    private let swatches: [Color]
    private let selectedSwatchIndex: Int
    private let additionalSwatchCount: Int?
    
    @Environment(\.colorScheme)
    private var colorScheme

    // MARK: Colors

    private var containerBackgroundColor: Color {
        // Using transparent black 5% from Figma: rgba(0,0,0,0.05)
        colorScheme == .dark
            ? TokensSemanticDark.TransparentBlackTransparentBlack050
            : TokensSemanticLight.TransparentBlackTransparentBlack050
    }
    
    private var moonlightBackgroundColor: Color {
        // Moonlight 100: #dfe1eb
        colorScheme == .dark
            ? TokensSemanticDark.Moonlight100
            : TokensSemanticLight.Moonlight100
    }
    
    private var moonlightTextColor: Color {
        // Moonlight 800: #3a446d
        colorScheme == .dark
            ? TokensSemanticDark.Moonlight800
            : TokensSemanticLight.Moonlight800
    }
    
    private var deliveryBackgroundColor: Color {
        // Bottle green 100: #d8e4de from Figma
        // Using success accent as closest match
        colorScheme == .dark
            ? TokensSemanticDark.BackgroundFeedbackColorSuccessAccent1
            : TokensSemanticLight.BackgroundFeedbackColorSuccessAccent1
    }
    
    private var deliveryTextColor: Color {
        // Bottle green 700: #226242 from Figma
        // Using success accent as closest match
        colorScheme == .dark
            ? TokensSemanticDark.BackgroundFeedbackColorSuccessAccent2
            : TokensSemanticLight.BackgroundFeedbackColorSuccessAccent2
    }
    
    private var sponsoredTextColor: Color {
        // Quaternary text color from Figma: #787675
        // Using tertiary text as closest match (#6a6867 vs #787675)
        colorScheme == .dark
            ? TokensSemanticDark.TextOnSurfaceColorTertiary
            : TokensSemanticLight.TextOnSurfaceColorTertiary
    }
    
    private var primaryTextColor: Color {
        colorScheme == .dark
            ? TokensSemanticDark.TextOnSurfaceColorPrimary
            : TokensSemanticLight.TextOnSurfaceColorPrimary
    }
    
    private var swatchBorderColorSelected: Color {
        .black
    }
    
    private var swatchBorderColorUnselected: Color {
        // Neutral 300 (#a5a5a5) from Figma - using greige as closest match
        colorScheme == .dark
            ? TokensSemanticDark.Greige300
            : TokensSemanticLight.Greige300
    }

    // MARK: View Builders

    @ViewBuilder
    private func badgeView(text: String, backgroundColor: Color, textColor: Color) -> some View {
        Text(text)
            .font(.system(size: 12, weight: .bold))
            .foregroundColor(textColor)
            .padding(.horizontal, 4)
            .padding(.vertical, 1)
            .background(backgroundColor)
            .cornerRadius(TokensSemanticLight.BorderRadiusLg)
    }
    
    @ViewBuilder
    private var productImageView: some View {
        if let imageURL = imageURL {
            // Check if it's a remote URL or local asset path
            let urlString = imageURL.absoluteString
            if urlString.hasPrefix("http://") || urlString.hasPrefix("https://") {
                // Remote URL - use AsyncImage
                AsyncImage(url: imageURL) { phase in
                    switch phase {
                    case .empty:
                        loadingOrPlaceholderImage
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    case .failure:
                        loadingOrPlaceholderImage
                    @unknown default:
                        loadingOrPlaceholderImage
                    }
                }
            } else {
                // Treat as local asset name - try multiple strategies
                let filename = (urlString as NSString).lastPathComponent
                let assetName = filename
                    .replacingOccurrences(of: ".jpg", with: "")
                    .replacingOccurrences(of: ".png", with: "")
                    .replacingOccurrences(of: ".jpeg", with: "")
                
                // Try to load from asset catalog or bundle
                if let loadedImage = loadLocalProductImage(assetName: assetName, fullPath: urlString) {
                    loadedImage
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } else {
                    // Fallback to placeholder
                    loadingOrPlaceholderImage
                }
            }
        } else if let placeholderImage = placeholderImage {
            placeholderImage
                .resizable()
                .aspectRatio(contentMode: .fit)
        } else {
            defaultPlaceholderImage
        }
    }
    
    @ViewBuilder
    private var loadingOrPlaceholderImage: some View {
        if let placeholderImage = placeholderImage {
            placeholderImage
                .resizable()
                .aspectRatio(contentMode: .fit)
        } else {
            defaultPlaceholderImage
        }
    }
    
    @ViewBuilder
    private var defaultPlaceholderImage: some View {
        Rectangle()
            .fill(Color.gray.opacity(0.2))
    }
    
    @ViewBuilder
    private var swatchesView: some View {
        HStack(spacing: 4) {
            ForEach(Array(swatches.prefix(3).enumerated()), id: \.offset) { index, color in
                swatchView(color: color, isSelected: index == selectedSwatchIndex)
            }
        }
    }
    
    @ViewBuilder
    private func swatchView(color: Color, isSelected: Bool) -> some View {
        ZStack {
            // Outer container with border
            Circle()
                .fill(Color.white)
                .frame(width: 26, height: 26)
                .overlay(
                    Circle()
                        .stroke(
                            isSelected ? swatchBorderColorSelected : swatchBorderColorUnselected,
                            lineWidth: isSelected ? 1.5 : 0.75
                        )
                )
            
            // Inner color circle
            Circle()
                .fill(color)
                .frame(width: 22, height: 22)
        }
    }
    
    // MARK: - Local Image Loading
    
    /// Try to load a local product image using multiple strategies
    private func loadLocalProductImage(assetName: String, fullPath: String) -> Image? {
        // Strategy 1: Try as asset catalog image (just the filename)
        #if canImport(UIKit)
        if UIImage(named: assetName) != nil {
            return Image(assetName)
        }
        #elseif canImport(AppKit)
        if NSImage(named: assetName) != nil {
            return Image(assetName)
        }
        #endif
        
        // Strategy 2: Try to load from bundle with various folder paths
        let possibleFolders = ["images", "french-door-images", ""]
        let filename = (fullPath as NSString).lastPathComponent
        let ext = filename.hasSuffix(".png") ? "png" : (filename.hasSuffix(".jpeg") ? "jpeg" : "jpg")
        
        for folder in possibleFolders {
            if folder.isEmpty {
                // Try root level
                if let url = Bundle.main.url(forResource: assetName, withExtension: ext) {
                    #if canImport(UIKit)
                    if let uiImage = UIImage(contentsOfFile: url.path) {
                        return Image(uiImage: uiImage)
                    }
                    #elseif canImport(AppKit)
                    if let nsImage = NSImage(contentsOf: url) {
                        return Image(nsImage: nsImage)
                    }
                    #endif
                }
            } else {
                // Try subdirectory
                if let url = Bundle.main.url(forResource: assetName, withExtension: ext, subdirectory: folder) {
                    #if canImport(UIKit)
                    if let uiImage = UIImage(contentsOfFile: url.path) {
                        return Image(uiImage: uiImage)
                    }
                    #elseif canImport(AppKit)
                    if let nsImage = NSImage(contentsOf: url) {
                        return Image(nsImage: nsImage)
                    }
                    #endif
                }
            }
        }
        
        // Strategy 3: Try direct file path if it exists
        if let resourcePath = Bundle.main.resourcePath {
            for folder in possibleFolders {
                let filePath = folder.isEmpty ? 
                    "\(resourcePath)/\(filename)" : 
                    "\(resourcePath)/\(folder)/\(filename)"
                
                #if canImport(UIKit)
                if let uiImage = UIImage(contentsOfFile: filePath) {
                    return Image(uiImage: uiImage)
                }
                #elseif canImport(AppKit)
                if let nsImage = NSImage(contentsOfFile: filePath) {
                    return Image(nsImage: nsImage)
                }
                #endif
            }
        }
        
        // All strategies failed
        print("⚠️ Could not load image: \(assetName) (tried asset catalog and folders: images, french-door-images)")
        return nil
    }
}

// MARK: - Preview Helper

#if DEBUG
extension DSProductImageContainer {
    /// Creates a sample product image container for previews
    static func sample(
        showExclusiveBadge: Bool = true,
        showDeliveryBadge: Bool = true,
        showSponsoredTag: Bool = true,
        swatchCount: Int = 3,
        additionalCount: Int? = 99
    ) -> DSProductImageContainer {
        DSProductImageContainer(
            imageURL: nil,
            placeholderImage: Image("Fridge"),
            showExclusiveBadge: showExclusiveBadge,
            showDeliveryBadge: showDeliveryBadge,
            showSponsoredTag: showSponsoredTag,
            swatches: swatchCount > 0 ? [.black, .gray, .brown].prefix(swatchCount).map { $0 } : [],
            selectedSwatchIndex: 0,
            additionalSwatchCount: additionalCount
        )
    }
}
#endif
