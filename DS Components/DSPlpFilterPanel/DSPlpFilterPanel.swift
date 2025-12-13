import SwiftUI

// MARK: - DSStylePillItem

/// Configuration for a style pill with image and text
public struct DSStylePillItem: Identifiable {
    public let id: String
    public let text: String
    public let image: Image?
    
    public init(id: String = UUID().uuidString, text: String, image: Image? = nil) {
        self.id = id
        self.text = text
        self.image = image
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
        VStack(alignment: .leading, spacing: 24) {
            // Title
            Text(title)
                .font(.system(size: 32, weight: .bold))
                .tracking(0.32)
                .lineLimit(1)
                .foregroundColor(titleColor)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            // Style Pills Container
            if !stylePills.isEmpty {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(stylePills) { item in
                            stylePillView(item)
                        }
                    }
                }
                .frame(height: 68)
            }
            
            // Results Count
            if let resultsCount = resultsCount {
                Text(resultsCount)
                    .font(.system(size: 24, weight: .semibold))
                    .tracking(0.24)
                    .lineLimit(1)
                    .foregroundColor(resultsColor)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            // Filter Items Container
            if !filterPills.isEmpty || !subFilterPills.isEmpty {
                VStack(alignment: .leading, spacing: 4) {
                    // Filter Top Pills
                    if !filterPills.isEmpty {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 8) {
                                ForEach(filterPills) { item in
                                    filterPillView(item)
                                }
                            }
                        }
                    }
                    
                    // Filter Sub Pills
                    if !subFilterPills.isEmpty {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 8) {
                                ForEach(subFilterPills) { item in
                                    subFilterPillView(item)
                                }
                            }
                        }
                    }
                }
            }
        }
        .padding(.vertical, 16)
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
            HStack(spacing: 4) {
                // Image container
                if let image = item.image {
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 48, height: 48)
                        .clipShape(Circle())
                }
                
                // Text
                Text(item.text)
                    .font(.system(size: 14, weight: .regular))
                    .lineLimit(2)
                    .foregroundColor(stylePillTextColor)
                    .multilineTextAlignment(.leading)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
            .frame(height: 68)
            .background(stylePillBackgroundColor)
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
            HStack(spacing: 4) {
                if let icon = item.icon {
                    icon
                        .resizable()
                        .scaledToFit()
                        .frame(width: 16, height: 14)
                        .foregroundColor(filterPillTextColor)
                }
                
                Text(item.text)
                    .font(.system(size: 14, weight: .regular))
                    .lineLimit(1)
                    .foregroundColor(filterPillTextColor)
            }
            .padding(.horizontal, item.icon != nil ? 0 : 12)
            .padding(.leading, item.icon != nil ? 0 : 0)
            .padding(.trailing, item.icon != nil ? 16 : 0)
            .padding(.vertical, 12)
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
                .font(.system(size: 14, weight: .regular))
                .lineLimit(1)
                .foregroundColor(subFilterPillTextColor)
                .padding(.horizontal, 16)
                .padding(.vertical, 6)
                .frame(minHeight: 36)
                .background(subFilterPillBackgroundColor)
                .clipShape(Capsule())
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    // MARK: - Color Helpers
    
    private var titleColor: Color {
        colorScheme == .dark ? TokensSemanticDark.TextOnSurfaceColorPrimary : TokensSemanticLight.TextOnSurfaceColorPrimary
    }
    
    private var resultsColor: Color {
        colorScheme == .dark ? TokensSemanticDark.Greige900 : TokensSemanticLight.Greige900
    }
    
    private var stylePillBackgroundColor: Color {
        colorScheme == .dark ? TokensSemanticDark.BackgroundButtonColorTransparent05Default : TokensSemanticLight.BackgroundButtonColorTransparent05Default
    }
    
    private var stylePillTextColor: Color {
        colorScheme == .dark ? TokensSemanticDark.TextSelectorColorDefault : TokensSemanticLight.TextSelectorColorDefault
    }
    
    private var filterPillTextColor: Color {
        colorScheme == .dark ? TokensSemanticDark.TextSelectorColorDefault : TokensSemanticLight.TextSelectorColorDefault
    }
    
    private var subFilterPillBackgroundColor: Color {
        colorScheme == .dark ? TokensSemanticDark.BackgroundButtonColorTransparent05Default : TokensSemanticLight.BackgroundButtonColorTransparent05Default
    }
    
    private var subFilterPillTextColor: Color {
        colorScheme == .dark ? TokensSemanticDark.TextSelectorColorDefault : TokensSemanticLight.TextSelectorColorDefault
    }
}
