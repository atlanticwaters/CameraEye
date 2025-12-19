import SwiftUI

// MARK: - Design System Type Alias
/// Using a typealias for cleaner access to design tokens
private typealias DS = DesignSystemGlobal

// MARK: - Main Header View
/// A navigation header that morphs between action buttons and a search bar.
/// Uses matchedGeometryEffect to create smooth transitions between states.
struct MorphingNavHeader: View {

    // MARK: - Configuration
    let showBackButton: Bool
    let onBackTapped: (() -> Void)?

    // MARK: - State
    @State private var isSearching = false
    @State private var searchText = ""
    @State private var isStoreExpanded = true
    @State private var storeHasCollapsed = false
    @State private var storeName = "Encinitas"
    
    // Environment for dismiss
    @Environment(\.dismiss) private var dismiss

    // Namespace for matched geometry effect
    @Namespace private var morphNamespace

    // MARK: - Initializer
    init(showBackButton: Bool = true, onBackTapped: (() -> Void)? = nil) {
        self.showBackButton = showBackButton
        self.onBackTapped = onBackTapped
    }

    // MARK: - Sizing from Design System
    private let buttonSize = DS.Spacing11          // 44pt - button dimensions
    private let iconSize = DS.FontSizeBodyXl       // 20pt - icon size
    private let searchIconSize = DS.Spacing4       // 16pt - smaller search bar icons
    private let closeIconSize = DS.FontSizeBodyLg  // 18pt - close button icon

    // MARK: - Spacing from Design System
    private let innerButtonSpacing = DS.Spacing2   // 12pt - spacing between buttons in glass container
    private let containerSpacing = DS.Spacing1     // 12pt - space between back button and content
    private let horizontalPadding = DS.Spacing4    // 16pt - outer horizontal padding
    private let verticalPadding = DS.Spacing3      // 12pt - outer vertical padding

    // MARK: - Colors from Design System
    private let iconColor = DS.TextOnSurfaceColorPrimary
    private let iconColorSecondary = DS.TextOnSurfaceColorTertiary

    var body: some View {
        HStack(spacing: containerSpacing) {
            // Back button - standalone button with glass effect (only shown when showBackButton is true)
            if showBackButton {
                backButton
            }

            // Main content area - morphs between different states
            if isSearching {
                // Full-width search bar
                searchBar
                    .transition(.opacity.combined(with: .scale(scale: 0.98)))
            } else if isStoreExpanded {
                // Full-width store locator (expanded)
                storeLocatorExpanded
                    .transition(.opacity.combined(with: .scale(scale: 0.98)))
            } else {
                // Normal state: location button + action buttons in glass pill container
                normalStateButtons
                    .transition(.opacity.combined(with: .scale(scale: 0.98)))
            }
        }
        .padding(.horizontal, horizontalPadding)
        .padding(.vertical, verticalPadding)
        .animation(.spring(response: 0.4, dampingFraction: 0.8), value: isSearching)
        .animation(.spring(response: 0.4, dampingFraction: 0.8), value: isStoreExpanded)
        .onAppear {
            // Only auto-expand location on first appearance (when back button is not shown)
            // This prevents re-expanding when navigating to component detail views
            if !showBackButton && !storeHasCollapsed {
                // Auto-collapse after 1 second delay
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    withAnimation {
                        isStoreExpanded = false
                        storeHasCollapsed = true
                    }
                }
            } else {
                // For detail views (with back button), start collapsed
                isStoreExpanded = false
            }
        }
    }
    
    // MARK: - Normal State Buttons Container
    private var normalStateButtons: some View {
        HStack(spacing: innerButtonSpacing) {
            // Store location button (collapsed)
            storeLocationButton
                .padding(.leading, innerButtonSpacing)

            Spacer()

            // Action buttons: Search
            searchButton
                .padding(.trailing, innerButtonSpacing)
        }
        .frame(height: buttonSize)
    }

    // MARK: - Back Button (Standalone)
    private var backButton: some View {
        Button(action: {
            if let onBackTapped = onBackTapped {
                onBackTapped()
            } else {
                dismiss()
            }
        }) {
            Image(systemName: "chevron.left")
                .font(.system(size: iconSize, weight: .medium))
                .foregroundStyle(iconColor)
                .frame(width: buttonSize, height: buttonSize)
                .contentShape(Circle())
                .background(
                    Circle()
                        .fill(.clear)
                        .glassEffect(.regular.interactive(), in: .circle)
                )
        }
        .buttonStyle(.plain)
    }

    // MARK: - Store Location Button (Collapsed)
    private var storeLocationButton: some View {
        Button(action: {
            withAnimation {
                isStoreExpanded = true
            }
        }) {
            Image(systemName: "location.fill")
                .font(.system(size: closeIconSize, weight: .medium))
                .foregroundStyle(storeHasCollapsed ? DS.Brand300 : iconColor)
                .frame(width: buttonSize, height: buttonSize)
                .background(
                    Circle()
                        .fill(.clear)
                        .glassEffect(.regular.interactive(), in: .circle)
                )
                .matchedGeometryEffect(id: "locationIcon", in: morphNamespace)
        }
        .buttonStyle(.plain)
    }

    // MARK: - Store Locator Expanded (Full Width)
    private var storeLocatorExpanded: some View {
        HStack(spacing: DS.Spacing2) {
            // Close button (appears where location icon was)
            Button(action: {
                // Close the expanded view and return to collapsed state
                withAnimation {
                    isStoreExpanded = false
                }
            }) {
                Image(systemName: "xmark.circle.fill")
                    .font(.system(size: closeIconSize))
                    .foregroundStyle(iconColorSecondary)
                    .frame(width: buttonSize, height: buttonSize)
                    .contentShape(Circle())
            }
            .buttonStyle(.plain)

            // Store name - tappable to change location
            Button(action: {
                print("Store name tapped - would show location picker")
            }) {
                Text(storeName)
                    .font(.system(size: DS.FontSizeBodyMd, weight: .medium))
                    .foregroundStyle(iconColor)
                    .lineLimit(1)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .buttonStyle(.plain)

            // Location icon - slides from left to right as bar expands
            Image(systemName: "location.fill")
                .font(.system(size: searchIconSize, weight: .medium))
                .foregroundStyle(iconColorSecondary)
                .frame(width: buttonSize, height: buttonSize)
                .matchedGeometryEffect(id: "locationIcon", in: morphNamespace)
        }
        .padding(.horizontal, innerButtonSpacing)
        .frame(height: buttonSize)
        .background(
            Capsule()
                .fill(.clear)
                .glassEffect(.regular, in: .capsule)
        )
    }

    // MARK: - Search Button
    private var searchButton: some View {
        Button(action: {
            withAnimation {
                isSearching = true
            }
        }) {
            Image(systemName: "magnifyingglass")
                .font(.system(size: closeIconSize, weight: .medium))
                .foregroundStyle(iconColor)
                .frame(width: buttonSize, height: buttonSize)
                .background(
                    Circle()
                        .fill(.clear)
                        .glassEffect(.regular.interactive(), in: .circle)
                )
                .matchedGeometryEffect(id: "searchIcon", in: morphNamespace)
        }
        .buttonStyle(.plain)
    }

    // MARK: - Search Bar (Full Width)
    private var searchBar: some View {
        HStack(spacing: DS.Spacing2) {
            // Search icon - non-interactive
            Image(systemName: "magnifyingglass")
                .font(.system(size: searchIconSize, weight: .medium))
                .foregroundStyle(iconColorSecondary)
                .frame(width: buttonSize, height: buttonSize)
                .matchedGeometryEffect(id: "searchIcon", in: morphNamespace)

            // Search text display
            Text(searchText.isEmpty ? "Search" : searchText)
                .font(.body)
                .foregroundStyle(searchText.isEmpty ? iconColorSecondary : iconColor)
                .frame(maxWidth: .infinity, alignment: .leading)

            // Close button
            Button(action: {
                searchText = ""
                isSearching = false
            }) {
                Image(systemName: "xmark.circle.fill")
                    .font(.system(size: closeIconSize))
                    .foregroundStyle(iconColorSecondary)
                    .frame(width: buttonSize, height: buttonSize)
                    .contentShape(Circle())
            }
            .buttonStyle(.plain)
        }
        .padding(.horizontal, innerButtonSpacing)
        .padding(.vertical, innerButtonSpacing)
        .frame(height: buttonSize)
        .background(
            Capsule()
                .fill(.clear)
                .glassEffect(.regular, in: .capsule)
        )
    }
}

// MARK: - Preview
#Preview("Morphing Nav Header") {
    VStack {
        MorphingNavHeader()
        Spacer()
    }
    .background(DS.BackgroundSurfaceColorGreige)
}

#Preview("Morphing Nav Header - No Back Button") {
    VStack {
        MorphingNavHeader(showBackButton: false)
        Spacer()
    }
    .background(DS.BackgroundSurfaceColorGreige)
}
