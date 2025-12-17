import SwiftUI

// MARK: - Design System Type Alias
/// Using a typealias for cleaner access to design tokens
private typealias DS = DesignSystemGlobal

// MARK: - Main Header View
/// A navigation header that morphs between action buttons and a search bar.
/// Uses matchedGeometryEffect to create smooth transitions between states.
/// Includes integrated Shop Menu that appears as an overlay.
struct MorphingNavHeader: View {

    // MARK: - Configuration
    let showBackButton: Bool
    private let externalShopMenuBinding: Binding<Bool>?

    // MARK: - State
    @State private var isSearching = false
    @State private var searchText = ""
    @State private var isStoreExpanded = true
    @State private var storeHasCollapsed = false
    @State private var storeName = "Encinitas"
    @State private var internalShopMenuOpen = false

    // Computed binding that uses external if provided, otherwise internal
    private var isShopMenuOpen: Binding<Bool> {
        externalShopMenuBinding ?? $internalShopMenuOpen
    }

    // Namespace for matched geometry effect
    @Namespace private var morphNamespace

    // MARK: - Initializer
    init(showBackButton: Bool = true, isShopMenuOpen: Binding<Bool>? = nil) {
        self.showBackButton = showBackButton
        self.externalShopMenuBinding = isShopMenuOpen
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
            // Back button - standalone button with glass effect
            backButton

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
        .animation(.spring(response: 0.4, dampingFraction: 0.8), value: isShopMenuOpen.wrappedValue)
        .onAppear {
            // Auto-collapse after 1 second delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                withAnimation {
                    isStoreExpanded = false
                    storeHasCollapsed = true
                }
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

            // Action buttons: Search + Shop Menu
            searchButton
            shopMenuButton
                .padding(.trailing, innerButtonSpacing)
        }
        .frame(height: buttonSize)
    }

    // MARK: - Back Button (Standalone)
    private var backButton: some View {
        Button(action: {
            print("Back tapped")
        }) {
            Image(systemName: "chevron.left")
                .font(.system(size: iconSize, weight: .medium))
                .foregroundStyle(iconColor)
                .frame(width: buttonSize, height: buttonSize)
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

    // MARK: - Shop Menu Button
    private var shopMenuButton: some View {
        Button(action: {
            withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                isShopMenuOpen.wrappedValue.toggle()
            }
        }) {
            HStack(spacing: DS.Spacing1) {
                Image(systemName: "square.grid.2x2")
                    .font(.system(size: searchIconSize, weight: .medium))
                    .foregroundStyle(isShopMenuOpen.wrappedValue ? DS.Brand300 : iconColor)

                Text("Shop")
                    .font(.system(size: DS.FontSizeBodySm, weight: .medium))
                    .foregroundStyle(isShopMenuOpen.wrappedValue ? DS.Brand300 : iconColor)

                Image(systemName: isShopMenuOpen.wrappedValue ? "chevron.up" : "chevron.down")
                    .font(.system(size: 10, weight: .medium))
                    .foregroundStyle(isShopMenuOpen.wrappedValue ? DS.Brand300 : iconColorSecondary)
            }
            .padding(.horizontal, DS.Spacing3)
            .frame(height: buttonSize)
            .background(
                Capsule()
                    .fill(.clear)
                    .glassEffect(.regular.interactive(), in: .capsule)
            )
            .matchedGeometryEffect(id: "shopMenuIcon", in: morphNamespace)
        }
        .buttonStyle(.plain)
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

// MARK: - =============================================
// MARK: - SHOP MENU OVERLAY
// MARK: - =============================================

/// Overlay shop menu with condensed typography that appears below the nav header
struct ShopMenuOverlay: View {
    @Binding var isOpen: Bool
    @State private var selectedDepartment: ShopDepartment? = nil

    // MARK: - Design System
    private let horizontalPadding = DS.Spacing4
    private let verticalPadding = DS.Spacing3
    private let itemSpacing = DS.Spacing1
    private let sectionSpacing = DS.Spacing4
    private let menuWidth: CGFloat = 280

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Departments list
            ScrollView {
                VStack(alignment: .leading, spacing: itemSpacing) {
                    if let department = selectedDepartment {
                        // Subcategories view
                        subcategoriesSection(for: department)
                    } else {
                        // Main departments view
                        departmentsSection
                    }
                }
                .padding(.horizontal, horizontalPadding)
                .padding(.vertical, verticalPadding)
            }
            .scrollEdgeEffectStyle(.soft, for: .vertical)
            .frame(maxHeight: 420)
        }
        .frame(width: menuWidth)
        .background(
            RoundedRectangle(cornerRadius: DS.BorderRadiusXl)
                .fill(.clear)
                .glassEffect(.regular, in: .rect(cornerRadius: DS.BorderRadiusXl))
        )
    }

    // MARK: - Departments Section
    private var departmentsSection: some View {
        VStack(alignment: .leading, spacing: itemSpacing) {
            // Section header
            Text("Shop by Department")
                .font(.thdBodySm)
                .foregroundStyle(DS.TextOnSurfaceColorTertiary)
                .padding(.bottom, DS.Spacing2)

            ForEach(ShopDepartment.allCases) { department in
                departmentRow(department)
            }
        }
    }

    private func departmentRow(_ department: ShopDepartment) -> some View {
        Button {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                selectedDepartment = department
            }
        } label: {
            HStack(spacing: DS.Spacing3) {
                Image(systemName: department.icon)
                    .font(.system(size: 16, weight: .regular))
                    .foregroundStyle(DS.Brand300)
                    .frame(width: 24, height: 24)

                Text(department.rawValue)
                    .font(.thdBodySm)
                    .foregroundStyle(DS.TextOnSurfaceColorPrimary)

                Spacer()

                if !department.subcategories.isEmpty {
                    Image(systemName: "chevron.right")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundStyle(DS.TextOnSurfaceColorTertiary)
                }
            }
            .padding(.vertical, DS.Spacing2)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }

    // MARK: - Subcategories Section
    private func subcategoriesSection(for department: ShopDepartment) -> some View {
        VStack(alignment: .leading, spacing: itemSpacing) {
            // Back button header
            Button {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                    selectedDepartment = nil
                }
            } label: {
                HStack(spacing: DS.Spacing2) {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundStyle(DS.TextOnSurfaceColorSecondary)

                    Text("All Departments")
                        .font(.thdBodySm)
                        .foregroundStyle(DS.TextOnSurfaceColorSecondary)
                }
                .padding(.vertical, DS.Spacing2)
            }
            .buttonStyle(.plain)

            // Department title
            HStack(spacing: DS.Spacing2) {
                Image(systemName: department.icon)
                    .font(.system(size: 18, weight: .regular))
                    .foregroundStyle(DS.Brand300)

                Text(department.rawValue)
                    .font(.thdBodyMd)
                    .foregroundStyle(DS.TextOnSurfaceColorPrimary)
            }
            .padding(.vertical, DS.Spacing2)

            Divider()
                .padding(.vertical, DS.Spacing1)

            // Shop All option
            Button {
                print("Shop all \(department.rawValue)")
                withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                    isOpen = false
                }
            } label: {
                HStack(spacing: DS.Spacing3) {
                    Text("Shop All \(department.rawValue)")
                        .font(.thdBodySm)
                        .fontWeight(.medium)
                        .foregroundStyle(DS.Brand300)

                    Spacer()

                    Image(systemName: "arrow.right")
                        .font(.system(size: 12, weight: .regular))
                        .foregroundStyle(DS.Brand300)
                }
                .padding(.vertical, DS.Spacing2)
                .contentShape(Rectangle())
            }
            .buttonStyle(.plain)

            // Subcategories
            ForEach(department.subcategories) { subcategory in
                subcategoryRow(subcategory)
            }
        }
    }

    private func subcategoryRow(_ subcategory: ShopSubcategory) -> some View {
        Button {
            if subcategory.plpCategory != nil {
                print("Navigate to \(subcategory.name)")
                withAnimation(.spring(response: 0.3, dampingFraction: 0.8)) {
                    isOpen = false
                }
            }
        } label: {
            HStack(spacing: DS.Spacing3) {
                Image(systemName: subcategory.icon)
                    .font(.system(size: 14, weight: .regular))
                    .foregroundStyle(subcategory.plpCategory != nil ? DS.TextOnSurfaceColorSecondary : DS.TextOnSurfaceColorTertiary)
                    .frame(width: 20, height: 20)

                Text(subcategory.name)
                    .font(.thdBodySm)
                    .foregroundStyle(subcategory.plpCategory != nil ? DS.TextOnSurfaceColorPrimary : DS.TextOnSurfaceColorTertiary)

                Spacer()

                if subcategory.plpCategory != nil {
                    Image(systemName: "chevron.right")
                        .font(.system(size: 10, weight: .regular))
                        .foregroundStyle(DS.TextOnSurfaceColorTertiary)
                } else {
                    Text("Soon")
                        .font(.thdCaption)
                        .foregroundStyle(DS.TextOnSurfaceColorTertiary)
                }
            }
            .padding(.vertical, DS.Spacing2)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .disabled(subcategory.plpCategory == nil)
        .opacity(subcategory.plpCategory != nil ? 1.0 : 0.5)
    }
}

// MARK: - =============================================
// MARK: - NAV HEADER WITH SHOP MENU CONTAINER
// MARK: - =============================================

/// Container view that combines MorphingNavHeader with the Shop Menu overlay
/// Use this view when you want the full shop menu experience
struct MorphingNavHeaderWithShopMenu<Content: View>: View {
    let showBackButton: Bool
    let content: Content
    @State private var isShopMenuOpen = false

    init(showBackButton: Bool = true, @ViewBuilder content: () -> Content) {
        self.showBackButton = showBackButton
        self.content = content()
    }

    var body: some View {
        ZStack(alignment: .top) {
            // Main content
            VStack(spacing: 0) {
                MorphingNavHeader(showBackButton: showBackButton, isShopMenuOpen: $isShopMenuOpen)
                content
            }

            // Shop Menu Overlay - full screen
            if isShopMenuOpen {
                // Dimmed background
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                            isShopMenuOpen = false
                        }
                    }
                    .transition(.opacity)

                // Menu positioned at top right
                VStack {
                    HStack {
                        Spacer()
                        ShopMenuOverlay(isOpen: $isShopMenuOpen)
                            .padding(.top, DS.Spacing11 + DS.Spacing3 + DS.Spacing2) // buttonSize + verticalPadding + spacing
                            .padding(.trailing, DS.Spacing4)
                    }
                    Spacer()
                }
                .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
        .animation(.spring(response: 0.4, dampingFraction: 0.8), value: isShopMenuOpen)
    }
}

// MARK: - Preview
#Preview("Nav Header with Shop Menu") {
    MorphingNavHeaderWithShopMenu {
        ScrollView {
            VStack(spacing: 20) {
                ForEach(0..<10) { i in
                    RoundedRectangle(cornerRadius: 12)
                        .fill(DS.BackgroundContainerColorWhite)
                        .frame(height: 120)
                        .padding(.horizontal, 16)
                }
            }
            .padding(.top, 20)
        }
    }
    .background(DS.BackgroundSurfaceColorGreige)
}

#Preview("Shop Menu Overlay Only") {
    ZStack {
        DS.BackgroundSurfaceColorGreige
            .ignoresSafeArea()

        VStack {
            ShopMenuOverlay(isOpen: .constant(true))
            Spacer()
        }
        .padding(.top, 60)
        .padding(.horizontal, 16)
    }
}
