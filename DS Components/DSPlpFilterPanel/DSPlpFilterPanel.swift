import SwiftUI

// MARK: - DSStylePillItem

/// Configuration for a style pill with image and text
public struct DSStylePillItem: Identifiable {
    public let id: String
    public let text: String
    public let image: Image?
    public let imageURL: String?  // NEW: Support for remote image URLs
    
    public init(id: String = UUID().uuidString, text: String, image: Image? = nil, imageURL: String? = nil) {
        self.id = id
        self.text = text
        self.image = image
        self.imageURL = imageURL
    }
}

// MARK: - DSFilterPillItem

/// Configuration for a filter pill
public struct DSFilterPillItem: Identifiable {
    public let id: String
    public let text: String
    public let icon: Image?
    
    public init(id: String = UUID().uuidString, text: String, icon: Image? = nil) {
        self.id = id
        self.text = text
        self.icon = icon
    }
}

// MARK: - DSPLPFilterPanelData

/// Data model for the PLP Filter Panel.
public struct DSPLPFilterPanelData: Equatable, Sendable {
    public let categoryTitle: String
    public let categoryPills: [DSStylePillItem]
    public let resultsCount: Int
    public let primaryFilters: [DSFilterPillItem]
    public let secondaryFilters: [DSFilterPillItem]
    
    public init(
        categoryTitle: String,
        categoryPills: [DSStylePillItem] = [],
        resultsCount: Int = 0,
        primaryFilters: [DSFilterPillItem] = [],
        secondaryFilters: [DSFilterPillItem] = []
    ) {
        self.categoryTitle = categoryTitle
        self.categoryPills = categoryPills
        self.resultsCount = resultsCount
        self.primaryFilters = primaryFilters
        self.secondaryFilters = secondaryFilters
    }
}

extension DSStylePillItem: Equatable, Sendable {
    public static func == (lhs: DSStylePillItem, rhs: DSStylePillItem) -> Bool {
        lhs.id == rhs.id &&
        lhs.text == rhs.text &&
        lhs.imageURL == rhs.imageURL
    }
}

extension DSFilterPillItem: Equatable, Sendable {
    public static func == (lhs: DSFilterPillItem, rhs: DSFilterPillItem) -> Bool {
        lhs.id == rhs.id &&
        lhs.text == rhs.text
    }
}

// MARK: - DSPlpFilterPanel

/// A Product Listing Page (PLP) filter panel displaying title, style pills, results count, and filter options.
///
/// DSPlpFilterPanel is a composite component that combines:
/// - Title (category name)
/// - Style Pills (large pills with images for browsing product styles)
/// - Results count
/// - Filter Pills (top-level filter categories)
/// - Sub-Filter Pills (applied filters/quick filters)
///
/// Example usage:
/// ```swift
/// DSPlpFilterPanel(
///     title: "REFRIGERATOR",
///     stylePills: [
///         DSStylePillItem(text: "French Door\nRefrigerators", image: Image("french-door")),
///         DSStylePillItem(text: "Side by Side\nRefrigerators", image: Image("side-by-side"))
///     ],
///     resultsCount: "5,007 RESULTS",
///     filterPills: [
///         DSFilterPillItem(text: "All Filters", icon: Image(systemName: "line.3.horizontal.decrease.circle")),
///         DSFilterPillItem(text: "Category")
///     ],
///     subFilterPills: [
///         DSFilterPillItem(text: "In Stock At Store Today"),
///         DSFilterPillItem(text: "Free 1-2 Day Delivery")
///     ],
///     onStylePillTap: { item in print("Tapped: \(item.text)") },
///     onFilterPillTap: { item in print("Filter: \(item.text)") },
///     onSubFilterPillTap: { item in print("Sub-filter: \(item.text)") }
/// )
/// ```
public struct DSPlpFilterPanel: View {
    // MARK: Lifecycle

    /// Creates a DSPlpFilterPanel with the specified configuration.
    public init(
        title: String,
        stylePills: [DSStylePillItem] = [],
        resultsCount: String? = nil,
        filterPills: [DSFilterPillItem] = [],
        subFilterPills: [DSFilterPillItem] = [],
        onStylePillTap: ((DSStylePillItem) -> Void)? = nil,
        onFilterPillTap: ((DSFilterPillItem) -> Void)? = nil,
        onSubFilterPillTap: ((DSFilterPillItem) -> Void)? = nil
    ) {
        self.title = title
        self.stylePills = stylePills
        self.resultsCount = resultsCount
        self.filterPills = filterPills
        self.subFilterPills = subFilterPills
        self.onStylePillTap = onStylePillTap
        self.onFilterPillTap = onFilterPillTap
        self.onSubFilterPillTap = onSubFilterPillTap
    }

    // MARK: Public

    public var body: some View {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing6) {
            // Title - Using Display font family for headings
            Text(title)
                .font(.custom(DesignSystemGlobal.FontFamilyDisplay, size: DesignSystemGlobal.FontSizeH1))
                .fontWeight(.bold)
                .tracking(0.32)
                .lineLimit(1)
                .foregroundStyle(titleColor)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            // Style Pills Container
            if !stylePills.isEmpty {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: DesignSystemGlobal.Spacing3) {
                        ForEach(stylePills) { item in
                            stylePillView(item)
                        }
                    }
                }
                .frame(height: 68)
            }
            
            // Results Count - Using Display font family for prominent text
            if let resultsCount = resultsCount {
                Text(resultsCount)
                    .font(.custom(DesignSystemGlobal.FontFamilyDisplay, size: DesignSystemGlobal.FontSizeH3))
                    .fontWeight(.semibold)
                    .tracking(0.24)
                    .lineLimit(1)
                    .foregroundStyle(resultsColor)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            // Filter Items Container
            if !filterPills.isEmpty || !subFilterPills.isEmpty {
                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing1) {
                    // Filter Top Pills
                    if !filterPills.isEmpty {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: DesignSystemGlobal.Spacing2) {
                                ForEach(filterPills) { item in
                                    filterPillView(item)
                                }
                            }
                        }
                    }
                    
                    // Filter Sub Pills
                    if !subFilterPills.isEmpty {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: DesignSystemGlobal.Spacing2) {
                                ForEach(subFilterPills) { item in
                                    subFilterPillView(item)
                                }
                            }
                        }
                    }
                }
            }
        }
        .padding(.vertical, DesignSystemGlobal.Spacing4)
    }

    // MARK: Internal
    
    let title: String
    let stylePills: [DSStylePillItem]
    let resultsCount: String?
    let filterPills: [DSFilterPillItem]
    let subFilterPills: [DSFilterPillItem]
    let onStylePillTap: ((DSStylePillItem) -> Void)?
    let onFilterPillTap: ((DSFilterPillItem) -> Void)?
    let onSubFilterPillTap: ((DSFilterPillItem) -> Void)?

    @Environment(\.colorScheme) private var colorScheme

    // MARK: Private
    
    // MARK: - Style Pill View
    
    @ViewBuilder
    private func stylePillView(_ item: DSStylePillItem) -> some View {
        Button(action: {
            onStylePillTap?(item)
        }) {
            HStack(spacing: DesignSystemGlobal.Spacing1) {
                // Image container - supports both local file paths and remote URLs
                if let imageURL = item.imageURL {
                    if imageURL.hasPrefix("http://") || imageURL.hasPrefix("https://") {
                        // Remote URL - use AsyncImage
                        let _ = print("   → Using AsyncImage for remote URL: \(imageURL)")
                        AsyncImage(url: URL(string: imageURL)) { phase in
                            switch phase {
                            case .empty:
                                ZStack {
                                    Circle()
                                        .fill(Color.gray.opacity(0.2))
                                        .frame(width: 48, height: 48)
                                    ProgressView()
                                }
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 48, height: 48)
                                    .clipShape(Circle())
                            case .failure(let error):
                                ZStack {
                                    Circle()
                                        .fill(Color.red.opacity(0.2))
                                        .frame(width: 48, height: 48)

                                    if let fallbackImage = item.image {
                                        fallbackImage
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 24, height: 24)
                                            .foregroundStyle(.gray)
                                    } else {
                                        Image(systemName: "exclamationmark.triangle")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 24, height: 24)
                                            .foregroundStyle(.red)
                                    }
                                }
                                .onAppear {
                                    print("❌ Failed to load remote image: \(imageURL)")
                                    print("   Error: \(error)")
                                }
                            @unknown default:
                                EmptyView()
                            }
                        }
                    } else {
                        // Local file path - load from bundle or file system
                        let _ = print("   → Attempting to load LOCAL file: \(imageURL)")
                        if let loadedImage = loadLocalImage(from: imageURL) {
                            let _ = print("   ✅ Successfully loaded local image!")
                            loadedImage
                                .resizable()
                                .scaledToFill()
                                .frame(width: 48, height: 48)
                                .clipShape(Circle())
                        } else {
                            let _ = print("   ❌ Local image load failed, showing fallback")
                            // Failed to load local image - show fallback
                            ZStack {
                                Circle()
                                    .fill(Color.orange.opacity(0.2))
                                    .frame(width: 48, height: 48)

                                if let fallbackImage = item.image {
                                    fallbackImage
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 24, height: 24)
                                        .foregroundStyle(.blue)
                                } else {
                                    Image(systemName: "photo")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 24, height: 24)
                                        .foregroundStyle(.orange)
                                }
                            }
                            .onAppear {
                                print("⚠️ Failed to load local image: \(imageURL)")
                            }
                        }
                    }
                } else if let image = item.image {
                    // Local image asset or SF Symbol
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48, height: 48)
                        .foregroundStyle(stylePillTextColor)
                }
                
                // Text - Using Informational font family for UI elements
                Text(item.text)
                    .font(.custom(DesignSystemGlobal.FontFamilyInformational, size: DesignSystemGlobal.FontSizeBodySm))
                    .fontWeight(.regular)
                    .lineLimit(2)
                    .foregroundStyle(stylePillTextColor)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding(.horizontal, DesignSystemGlobal.Spacing4)
            .padding(.vertical, DesignSystemGlobal.Spacing3)
            .frame(height: 68)
            .background(.blue)
            .clipShape(Capsule())
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    // MARK: - Filter Pill View
    
    @ViewBuilder
    private func filterPillView(_ item: DSFilterPillItem) -> some View {
        Button(action: {
            onFilterPillTap?(item)
        }) {
            HStack(spacing: DesignSystemGlobal.Spacing1) {
                if let icon = item.icon {
                    icon
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16, height: 14)
                        .foregroundStyle(filterPillFilledTextColor)
                }
                
                Text(item.text)
                    .font(.custom(DesignSystemGlobal.FontFamilyInformational, size: DesignSystemGlobal.FontSizeBodySm))
                    .fontWeight(.regular)
                    .lineLimit(1)
                    .foregroundStyle(filterPillFilledTextColor)
            }
            .padding(.horizontal, item.icon != nil ? 0 : DesignSystemGlobal.Spacing3)
            .padding(.leading, item.icon != nil ? 0 : 0)
            .padding(.trailing, item.icon != nil ? DesignSystemGlobal.Spacing4 : 0)
            .padding(.vertical, DesignSystemGlobal.Spacing3)
            .frame(height: 44)
            .background(Color.clear)
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    // MARK: - Sub Filter Pill View
    
    @ViewBuilder
    private func subFilterPillView(_ item: DSFilterPillItem) -> some View {
        Button(action: {
            onSubFilterPillTap?(item)
        }) {
            Text(item.text)
                .font(.custom(DesignSystemGlobal.FontFamilyInformational, size: DesignSystemGlobal.FontSizeBodySm))
                .fontWeight(.regular)
                .lineLimit(1)
                .foregroundStyle(subFilterPillFilledTextColor)
                .padding(.horizontal, DesignSystemGlobal.Spacing4)
                .padding(.vertical, DesignSystemGlobal.Spacing2 - 2)
                .frame(minHeight: 36)
                .background(.white)
                .clipShape(Capsule())
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    // MARK: - Image Loading Helpers

    /// Load a local image from a file path
    /// Supports paths like "french-door-images/imgi_39_...jpg" or just "imgi_39_...jpg"
    /// Tries both asset catalog and bundle folders (images, french-door-images)
    private func loadLocalImage(from path: String) -> Image? {
        // Extract just the filename without extension
        let filename = (path as NSString).lastPathComponent
        let nameWithoutExt = filename
            .replacingOccurrences(of: ".jpg", with: "")
            .replacingOccurrences(of: ".png", with: "")
            .replacingOccurrences(of: ".jpeg", with: "")
        
        print("      🔧 Looking for asset: \(nameWithoutExt)")
        
        // Strategy 1: Try as asset catalog image
        #if canImport(UIKit)
        if UIImage(named: nameWithoutExt) != nil {
            print("      ✅ Found in asset catalog!")
            return Image(nameWithoutExt)
        }
        #elseif canImport(AppKit)
        if NSImage(named: nameWithoutExt) != nil {
            print("      ✅ Found in asset catalog!")
            return Image(nameWithoutExt)
        }
        #endif
        
        // Strategy 2: Try to load from bundle folders
        let ext = filename.hasSuffix(".png") ? "png" : (filename.hasSuffix(".jpeg") ? "jpeg" : "jpg")
        let possibleFolders = ["images", "french-door-images", ""]
        
        for folder in possibleFolders {
            if folder.isEmpty {
                // Try root level
                if let url = Bundle.main.url(forResource: nameWithoutExt, withExtension: ext) {
                    print("      ✅ Found in bundle root!")
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
                if let url = Bundle.main.url(forResource: nameWithoutExt, withExtension: ext, subdirectory: folder) {
                    print("      ✅ Found in \(folder) folder!")
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
        
        // Strategy 3: Try direct file path
        if let resourcePath = Bundle.main.resourcePath {
            for folder in possibleFolders {
                let filePath = folder.isEmpty ? 
                    "\(resourcePath)/\(filename)" : 
                    "\(resourcePath)/\(folder)/\(filename)"
                
                #if canImport(UIKit)
                if let uiImage = UIImage(contentsOfFile: filePath) {
                    print("      ✅ Found at direct path: \(folder.isEmpty ? "root" : folder)")
                    return Image(uiImage: uiImage)
                }
                #elseif canImport(AppKit)
                if let nsImage = NSImage(contentsOfFile: filePath) {
                    print("      ✅ Found at direct path: \(folder.isEmpty ? "root" : folder)")
                    return Image(nsImage: nsImage)
                }
                #endif
            }
        }
        
        print("      ❌ Not found in asset catalog or folders: images, french-door-images")
        return nil
    }

    // MARK: - Color Helpers

    private var titleColor: Color {
        colorScheme == .dark ? TokensSemanticDark.TextOnSurfaceColorPrimary : TokensSemanticLight.TextOnSurfaceColorPrimary
    }
    
    private var resultsColor: Color {
        colorScheme == .dark ? TokensSemanticDark.Greige900 : TokensSemanticLight.Greige900
    }
    
    private var stylePillBackgroundColor: Color {
        colorScheme == .dark 
            ? TokensSemanticDark.BackgroundButtonColorTransparent10Default 
            : TokensSemanticLight.BackgroundButtonColorTransparent10Default
    }
    
    private var stylePillTextColor: Color {
        colorScheme == .dark ? TokensSemanticDark.TextSelectorColorDefault : TokensSemanticLight.TextSelectorColorDefault
    }
    
    // Filter Pills - Filled State with Transparent Background
    private var filterPillFilledBackgroundColor: Color {
        colorScheme == .dark 
            ? TokensSemanticDark.BackgroundButtonColorTransparent10Default 
            : TokensSemanticLight.BackgroundButtonColorTransparent10Default
    }
    
    private var filterPillFilledTextColor: Color {
        colorScheme == .dark 
            ? TokensSemanticDark.TextOnSurfaceColorPrimary 
            : TokensSemanticLight.TextOnSurfaceColorPrimary
    }
    
    // Sub Filter Pills - Filled State with Transparent Background
    private var subFilterPillFilledBackgroundColor: Color {
        colorScheme == .dark 
            ? TokensSemanticDark.BackgroundButtonColorTransparent10Default 
            : TokensSemanticLight.BackgroundButtonColorTransparent10Default
    }
    
    private var subFilterPillFilledTextColor: Color {
        colorScheme == .dark 
            ? TokensSemanticDark.TextOnSurfaceColorPrimary 
            : TokensSemanticLight.TextOnSurfaceColorPrimary
    }
}
