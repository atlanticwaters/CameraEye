import SwiftUI

// MARK: - Design System Type Alias
private typealias DS = DesignSystemGlobal

// MARK: - =============================================
// MARK: - SHOP CATEGORY DEFINITIONS
// MARK: - =============================================

/// Main shop departments based on Home Depot categories
enum ShopDepartment: String, CaseIterable, Identifiable {
    // Major Departments
    case appliances = "Appliances"
    case bath = "Bath"
    case blindsWindowTreatments = "Blinds & Window Treatments"
    case buildingMaterials = "Building Materials"
    case decor = "Home Decor"
    case doors = "Doors & Windows"
    case electrical = "Electrical"
    case flooring = "Flooring"
    case gardenCenter = "Garden Center"
    case hardware = "Hardware"
    case heating = "Heating, Venting & Cooling"
    case kitchen = "Kitchen"
    case lighting = "Lighting"
    case lumber = "Lumber & Composites"
    case outdoors = "Outdoors"
    case paint = "Paint"
    case plumbing = "Plumbing"
    case smartHome = "Smart Home"
    case storage = "Storage & Organization"
    case tools = "Tools"

    var id: String { rawValue }

    /// SF Symbol icon for each department
    var icon: String {
        switch self {
        case .appliances: return "refrigerator"
        case .bath: return "shower"
        case .blindsWindowTreatments: return "blinds.horizontal.closed"
        case .buildingMaterials: return "building.2"
        case .decor: return "photo.artframe"
        case .doors: return "door.left.hand.closed"
        case .electrical: return "bolt"
        case .flooring: return "square.grid.3x3"
        case .gardenCenter: return "leaf"
        case .hardware: return "wrench"
        case .heating: return "thermometer.snowflake"
        case .kitchen: return "cooktop"
        case .lighting: return "lightbulb"
        case .lumber: return "tree"
        case .outdoors: return "sun.max"
        case .paint: return "paintbrush"
        case .plumbing: return "drop"
        case .smartHome: return "house"
        case .storage: return "shippingbox"
        case .tools: return "hammer"
        }
    }

    /// Subcategories for each department
    var subcategories: [ShopSubcategory] {
        switch self {
        case .appliances:
            return [
                ShopSubcategory(name: "Refrigerators", icon: "refrigerator", plpCategory: .refrigerators),
                ShopSubcategory(name: "Dishwashers", icon: "dishwasher", plpCategory: .dishwashers),
                ShopSubcategory(name: "Washers", icon: "washer", plpCategory: .washingMachines),
                ShopSubcategory(name: "Dryers", icon: "dryer", plpCategory: .dryers),
                ShopSubcategory(name: "Ranges", icon: "stove", plpCategory: .ranges),
                ShopSubcategory(name: "Microwaves", icon: "microwave", plpCategory: nil),
                ShopSubcategory(name: "Freezers", icon: "snowflake", plpCategory: nil),
                ShopSubcategory(name: "Range Hoods", icon: "wind", plpCategory: nil)
            ]
        case .bath:
            return [
                ShopSubcategory(name: "Bathroom Vanities", icon: "cabinet", plpCategory: nil),
                ShopSubcategory(name: "Toilets", icon: "toilet", plpCategory: nil),
                ShopSubcategory(name: "Showers", icon: "shower", plpCategory: nil),
                ShopSubcategory(name: "Bathtubs", icon: "bathtub", plpCategory: nil),
                ShopSubcategory(name: "Bathroom Faucets", icon: "drop", plpCategory: nil),
                ShopSubcategory(name: "Bathroom Storage", icon: "cabinet.fill", plpCategory: nil)
            ]
        case .tools:
            return [
                ShopSubcategory(name: "Power Drills", icon: "screwdriver", plpCategory: .powerDrills),
                ShopSubcategory(name: "Power Saws", icon: "triangle", plpCategory: .powerSaws),
                ShopSubcategory(name: "Sanders", icon: "circle.dotted", plpCategory: .sanders),
                ShopSubcategory(name: "Impact Drivers", icon: "bolt.circle", plpCategory: nil),
                ShopSubcategory(name: "Combo Kits", icon: "cube.box", plpCategory: nil),
                ShopSubcategory(name: "Hand Tools", icon: "hammer", plpCategory: nil),
                ShopSubcategory(name: "Tool Storage", icon: "archivebox", plpCategory: nil),
                ShopSubcategory(name: "Air Tools", icon: "wind", plpCategory: nil)
            ]
        case .kitchen:
            return [
                ShopSubcategory(name: "Kitchen Cabinets", icon: "cabinet", plpCategory: nil),
                ShopSubcategory(name: "Kitchen Countertops", icon: "rectangle", plpCategory: nil),
                ShopSubcategory(name: "Kitchen Faucets", icon: "drop", plpCategory: nil),
                ShopSubcategory(name: "Kitchen Sinks", icon: "sink", plpCategory: nil),
                ShopSubcategory(name: "Kitchen Islands", icon: "square.grid.2x2", plpCategory: nil)
            ]
        case .flooring:
            return [
                ShopSubcategory(name: "Vinyl Flooring", icon: "square.grid.3x3", plpCategory: nil),
                ShopSubcategory(name: "Hardwood Flooring", icon: "rectangle.split.3x3", plpCategory: nil),
                ShopSubcategory(name: "Laminate Flooring", icon: "square.split.diagonal", plpCategory: nil),
                ShopSubcategory(name: "Tile Flooring", icon: "square.grid.3x3.topleft.filled", plpCategory: nil),
                ShopSubcategory(name: "Carpet", icon: "square.dashed", plpCategory: nil)
            ]
        case .lighting:
            return [
                ShopSubcategory(name: "Ceiling Fans", icon: "fan.ceiling", plpCategory: nil),
                ShopSubcategory(name: "Chandeliers", icon: "lightbulb.led", plpCategory: nil),
                ShopSubcategory(name: "Pendant Lights", icon: "light.overhead.left", plpCategory: nil),
                ShopSubcategory(name: "Outdoor Lighting", icon: "sun.max", plpCategory: nil),
                ShopSubcategory(name: "LED Bulbs", icon: "lightbulb", plpCategory: nil)
            ]
        case .outdoors:
            return [
                ShopSubcategory(name: "Patio Furniture", icon: "chair.lounge", plpCategory: nil),
                ShopSubcategory(name: "Grills", icon: "flame", plpCategory: nil),
                ShopSubcategory(name: "Lawn Mowers", icon: "leaf", plpCategory: nil),
                ShopSubcategory(name: "Outdoor Power Equipment", icon: "bolt.batteryblock", plpCategory: nil),
                ShopSubcategory(name: "Outdoor Storage", icon: "shippingbox", plpCategory: nil)
            ]
        case .paint:
            return [
                ShopSubcategory(name: "Interior Paint", icon: "paintbrush", plpCategory: nil),
                ShopSubcategory(name: "Exterior Paint", icon: "paintbrush.fill", plpCategory: nil),
                ShopSubcategory(name: "Paint Sprayers", icon: "humidity", plpCategory: nil),
                ShopSubcategory(name: "Stains & Finishes", icon: "drop.halffull", plpCategory: nil),
                ShopSubcategory(name: "Paint Supplies", icon: "paintpalette", plpCategory: nil)
            ]
        case .electrical:
            return [
                ShopSubcategory(name: "Outlets & Switches", icon: "poweroutlet.type.b", plpCategory: nil),
                ShopSubcategory(name: "Wire & Cable", icon: "cable.connector", plpCategory: nil),
                ShopSubcategory(name: "Circuit Breakers", icon: "switch.2", plpCategory: nil),
                ShopSubcategory(name: "Electrical Boxes", icon: "square.dashed", plpCategory: nil),
                ShopSubcategory(name: "Generators", icon: "bolt.square", plpCategory: nil)
            ]
        case .plumbing:
            return [
                ShopSubcategory(name: "Pipes & Fittings", icon: "pipe.and.drop", plpCategory: nil),
                ShopSubcategory(name: "Water Heaters", icon: "flame", plpCategory: nil),
                ShopSubcategory(name: "Water Filtration", icon: "drop.triangle", plpCategory: nil),
                ShopSubcategory(name: "Sump Pumps", icon: "drop.degreesign", plpCategory: nil)
            ]
        case .smartHome:
            return [
                ShopSubcategory(name: "Smart Thermostats", icon: "thermometer", plpCategory: nil),
                ShopSubcategory(name: "Smart Lighting", icon: "lightbulb", plpCategory: nil),
                ShopSubcategory(name: "Smart Locks", icon: "lock", plpCategory: nil),
                ShopSubcategory(name: "Security Cameras", icon: "video", plpCategory: nil),
                ShopSubcategory(name: "Smart Speakers", icon: "homepodmini", plpCategory: nil)
            ]
        default:
            return []
        }
    }
}

/// Subcategory within a department, optionally linked to a PLP category
struct ShopSubcategory: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    let plpCategory: PLPCategory?
}

// MARK: - =============================================
// MARK: - SHOP MENU STATE
// MARK: - =============================================

/// State machine for shop menu transitions
enum ShopMenuState: Equatable {
    case collapsed           // Menu button only
    case departments         // Full department list visible
    case subcategories(ShopDepartment)  // Subcategories for selected department
    case plp(PLPCategory)    // Full PLP view

    static func == (lhs: ShopMenuState, rhs: ShopMenuState) -> Bool {
        switch (lhs, rhs) {
        case (.collapsed, .collapsed): return true
        case (.departments, .departments): return true
        case let (.subcategories(l), .subcategories(r)): return l == r
        case let (.plp(l), .plp(r)): return l.title == r.title
        default: return false
        }
    }
}

// MARK: - =============================================
// MARK: - MORPHING SHOP MENU (iOS 26 Style)
// MARK: - =============================================

/// Shop menu with iOS 26 toolbar morphing transitions
struct MorphingShopMenu: View {

    // MARK: - State
    @Binding var menuState: ShopMenuState
    @State private var selectedDepartment: ShopDepartment? = nil
    @Namespace private var morphNamespace

    // MARK: - Sizing from Design System
    private let buttonSize = DS.Spacing11          // 44pt
    private let iconSize = DS.FontSizeBodyXl       // 20pt
    private let menuItemHeight = DS.Spacing11      // 44pt
    private let containerSpacing = DS.Spacing2     // 8pt
    private let horizontalPadding = DS.Spacing4    // 16pt
    private let verticalPadding = DS.Spacing3      // 12pt

    // MARK: - Colors
    private let primaryColor = DS.TextOnSurfaceColorPrimary
    private let secondaryColor = DS.TextOnSurfaceColorSecondary
    private let accentColor = DS.Brand300

    var body: some View {
        VStack(spacing: 0) {
            // Top morphing toolbar
            morphingToolbar

            // Expanded content based on state
            expandedContent
        }
        .animation(.spring(response: 0.5, dampingFraction: 0.85), value: menuState)
    }

    // MARK: - Morphing Toolbar
    @ViewBuilder
    private var morphingToolbar: some View {
        Group {
            switch menuState {
            case .collapsed:
                collapsedToolbar

            case .departments:
                departmentsToolbar

            case .subcategories(let department):
                subcategoriesToolbar(department: department)

            case .plp:
                plpToolbar
            }
        }
        .padding(.horizontal, horizontalPadding)
        .padding(.vertical, verticalPadding)
    }

    // MARK: - Collapsed Toolbar State
    private var collapsedToolbar: some View {
        HStack(spacing: containerSpacing) {
            // Shop menu button with glass effect
            Button {
                withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                    menuState = .departments
                }
            } label: {
                HStack(spacing: DS.Spacing2) {
                    Image(systemName: "square.grid.2x2")
                        .font(.system(size: iconSize, weight: .medium))
                        .foregroundStyle(primaryColor)

                    Text("Shop")
                        .font(.system(size: DS.FontSizeBodyMd, weight: .semibold))
                        .foregroundStyle(primaryColor)

                    Image(systemName: "chevron.down")
                        .font(.system(size: DS.FontSizeBodySm, weight: .medium))
                        .foregroundStyle(secondaryColor)
                }
                .padding(.horizontal, DS.Spacing4)
                .frame(height: buttonSize)
                .background(
                    Capsule()
                        .fill(.ultraThinMaterial)
                        .glassEffect(.regular.interactive(), in: .capsule)
                )
                .contentShape(Capsule())
            }
            .buttonStyle(.plain)

            Spacer()
        }
    }

    // MARK: - Departments Toolbar State
    private var departmentsToolbar: some View {
        HStack(spacing: containerSpacing) {
            // Shop header with close
            HStack(spacing: DS.Spacing2) {
                Image(systemName: "square.grid.2x2")
                    .font(.system(size: iconSize, weight: .medium))
                    .foregroundStyle(accentColor)
                    .matchedGeometryEffect(id: "menuIcon", in: morphNamespace)

                Text("Shop All Departments")
                    .font(.system(size: DS.FontSizeBodyMd, weight: .semibold))
                    .foregroundStyle(primaryColor)
                    .matchedGeometryEffect(id: "menuTitle", in: morphNamespace)

                Spacer()

                Button {
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                        menuState = .collapsed
                    }
                } label: {
                    Image(systemName: "xmark")
                        .font(.system(size: DS.FontSizeBodyLg, weight: .medium))
                        .foregroundStyle(secondaryColor)
                        .matchedGeometryEffect(id: "chevron", in: morphNamespace)
                        .frame(width: buttonSize, height: buttonSize)
                        .contentShape(Circle())
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal, DS.Spacing4)
            .frame(height: buttonSize)
            .background(
                Capsule()
                    .fill(.clear)
                    .glassEffect(.regular, in: .capsule)
            )
        }
    }

    // MARK: - Subcategories Toolbar State
    private func subcategoriesToolbar(department: ShopDepartment) -> some View {
        HStack(spacing: containerSpacing) {
            // Back button
            Button {
                withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                    menuState = .departments
                }
            } label: {
                Image(systemName: "chevron.left")
                    .font(.system(size: iconSize, weight: .medium))
                    .foregroundStyle(primaryColor)
                    .frame(width: buttonSize, height: buttonSize)
                    .background(
                        Circle()
                            .fill(.clear)
                            .glassEffect(.regular.interactive(), in: .circle)
                    )
            }
            .buttonStyle(.plain)

            // Department title
            HStack(spacing: DS.Spacing2) {
                Image(systemName: department.icon)
                    .font(.system(size: iconSize, weight: .medium))
                    .foregroundStyle(accentColor)

                Text(department.rawValue)
                    .font(.system(size: DS.FontSizeBodyMd, weight: .semibold))
                    .foregroundStyle(primaryColor)

                Spacer()

                Button {
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                        menuState = .collapsed
                    }
                } label: {
                    Image(systemName: "xmark")
                        .font(.system(size: DS.FontSizeBodyLg, weight: .medium))
                        .foregroundStyle(secondaryColor)
                        .frame(width: buttonSize, height: buttonSize)
                        .contentShape(Circle())
                }
                .buttonStyle(.plain)
            }
            .padding(.horizontal, DS.Spacing4)
            .frame(height: buttonSize)
            .background(
                Capsule()
                    .fill(.clear)
                    .glassEffect(.regular, in: .capsule)
            )
        }
    }

    // MARK: - PLP Toolbar State
    private var plpToolbar: some View {
        HStack(spacing: containerSpacing) {
            // Back button
            Button {
                if let department = selectedDepartment {
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                        menuState = .subcategories(department)
                    }
                } else {
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                        menuState = .departments
                    }
                }
            } label: {
                Image(systemName: "chevron.left")
                    .font(.system(size: iconSize, weight: .medium))
                    .foregroundStyle(primaryColor)
                    .frame(width: buttonSize, height: buttonSize)
                    .background(
                        Circle()
                            .fill(.clear)
                            .glassEffect(.regular.interactive(), in: .circle)
                    )
            }
            .buttonStyle(.plain)

            // PLP title (from category)
            if case .plp(let category) = menuState {
                Text(category.title)
                    .font(.system(size: DS.FontSizeBodyMd, weight: .semibold))
                    .foregroundStyle(primaryColor)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, DS.Spacing2)
            }

            // Close button
            Button {
                withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                    menuState = .collapsed
                    selectedDepartment = nil
                }
            } label: {
                Image(systemName: "xmark")
                    .font(.system(size: DS.FontSizeBodyLg, weight: .medium))
                    .foregroundStyle(secondaryColor)
                    .frame(width: buttonSize, height: buttonSize)
                    .background(
                        Circle()
                            .fill(.clear)
                            .glassEffect(.regular.interactive(), in: .circle)
                    )
            }
            .buttonStyle(.plain)
        }
    }

    // MARK: - Expanded Content
    @ViewBuilder
    private var expandedContent: some View {
        switch menuState {
        case .collapsed:
            EmptyView()

        case .departments:
            departmentsList
                .transition(.asymmetric(
                    insertion: .move(edge: .top).combined(with: .opacity),
                    removal: .opacity
                ))

        case .subcategories(let department):
            subcategoriesList(for: department)
                .transition(.asymmetric(
                    insertion: .move(edge: .trailing).combined(with: .opacity),
                    removal: .move(edge: .leading).combined(with: .opacity)
                ))

        case .plp:
            EmptyView() // PLP content is handled externally
        }
    }

    // MARK: - Departments List
    private var departmentsList: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(ShopDepartment.allCases) { department in
                    departmentRow(department)

                    if department != ShopDepartment.allCases.last {
                        Divider()
                            .padding(.leading, DS.Spacing11 + DS.Spacing4)
                    }
                }
            }
            .padding(.horizontal, horizontalPadding)
        }
        .frame(maxHeight: 400)
        .background(
            RoundedRectangle(cornerRadius: DS.BorderRadiusXl)
                .fill(.clear)
                .glassEffect(.regular, in: .rect(cornerRadius: DS.BorderRadiusXl))
        )
        .padding(.horizontal, horizontalPadding)
        .padding(.bottom, verticalPadding)
    }

    private func departmentRow(_ department: ShopDepartment) -> some View {
        DSMenuItem(
            style: .ghost,
            media: .icon(
                Image(systemName: department.icon)
                    .font(.system(size: iconSize, weight: .medium))
                    .foregroundStyle(accentColor)
            ),
            title: department.rawValue,
            showChevron: !department.subcategories.isEmpty
        ) {
            selectedDepartment = department
            withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                menuState = .subcategories(department)
            }
        }
    }

    // MARK: - Subcategories List
    private func subcategoriesList(for department: ShopDepartment) -> some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                // "Shop All" option
                Button {
                    // Navigate to department-level PLP if available
                    print("Shop all \(department.rawValue)")
                } label: {
                    HStack(spacing: DS.Spacing3) {
                        Image(systemName: department.icon)
                            .font(.system(size: iconSize, weight: .medium))
                            .foregroundStyle(accentColor)
                            .frame(width: DS.Spacing8, height: DS.Spacing8)

                        Text("Shop All \(department.rawValue)")
                            .font(.system(size: DS.FontSizeBodyMd, weight: .semibold))
                            .foregroundStyle(primaryColor)

                        Spacer()

                        Image(systemName: "arrow.right")
                            .font(.system(size: DS.FontSizeBodySm, weight: .medium))
                            .foregroundStyle(accentColor)
                    }
                    .padding(.vertical, DS.Spacing3)
                    .contentShape(Rectangle())
                }
                .buttonStyle(.plain)

                Divider()
                    .padding(.leading, DS.Spacing11 + DS.Spacing4)

                // Subcategories
                ForEach(department.subcategories) { subcategory in
                    subcategoryRow(subcategory)

                    if subcategory.id != department.subcategories.last?.id {
                        Divider()
                            .padding(.leading, DS.Spacing11 + DS.Spacing4)
                    }
                }
            }
            .padding(.horizontal, horizontalPadding)
        }
        .frame(maxHeight: 400)
        .background(
            RoundedRectangle(cornerRadius: DS.BorderRadiusXl)
                .fill(.clear)
                .glassEffect(.regular, in: .rect(cornerRadius: DS.BorderRadiusXl))
        )
        .padding(.horizontal, horizontalPadding)
        .padding(.bottom, verticalPadding)
    }

    private func subcategoryRow(_ subcategory: ShopSubcategory) -> some View {
        Group {
            if subcategory.plpCategory != nil {
                DSMenuItem(
                    style: .ghost,
                    media: .icon(
                        Image(systemName: subcategory.icon)
                            .font(.system(size: iconSize, weight: .medium))
                            .foregroundStyle(accentColor)
                    ),
                    title: subcategory.name,
                    showChevron: true
                ) {
                    if let plpCategory = subcategory.plpCategory {
                        withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                            menuState = .plp(plpCategory)
                        }
                    }
                }
            } else {
                // Inactive subcategory - using custom view since DSMenuItem doesn't have inactive state
                HStack(spacing: DS.Spacing3) {
                    Image(systemName: subcategory.icon)
                        .font(.system(size: iconSize, weight: .medium))
                        .foregroundStyle(secondaryColor)
                        .frame(width: 24, height: 24)

                    Text(subcategory.name)
                        .font(.thdBodyMd)
                        .foregroundStyle(secondaryColor)

                    Spacer()

                    Text("Coming Soon")
                        .font(.thdCaption)
                        .foregroundStyle(DS.TextOnSurfaceColorTertiary)
                }
                .padding(.vertical, DS.Spacing3)
                .opacity(0.6)
            }
        }
    }
}

// MARK: - =============================================
// MARK: - SHOP VIEW (Main Shop Tab Content)
// MARK: - =============================================

/// Main shop view that combines morphing menu with PLP content
struct ShopView: View {

    // MARK: - State
    @State private var menuState: ShopMenuState = .collapsed

    var body: some View {
        ZStack(alignment: .top) {
            // Background
            DS.BackgroundSurfaceColorGreige
                .ignoresSafeArea()

            // Main content
            VStack(spacing: 0) {
                // Morphing shop menu
                MorphingShopMenu(menuState: $menuState)

                // Content based on state
                contentView
            }
        }
    }

    @ViewBuilder
    private var contentView: some View {
        switch menuState {
        case .collapsed, .departments, .subcategories:
            // Show default shop content or featured items
            shopLandingContent

        case .plp(let category):
            // Show full PLP
            PLPView(category: category)
                .transition(.asymmetric(
                    insertion: .move(edge: .bottom).combined(with: .opacity),
                    removal: .opacity
                ))
        }
    }

    private var shopLandingContent: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: DS.Spacing6) {
                // Featured Categories Section using DSContentCard
                DSContentCard(
                    title: "Featured Categories",
                    subtitle: "Shop by department",
                    bodyPlacement: .secondFullBleed,
                    bodyContent: {
                        AnyView(
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: DS.Spacing3) {
                                    ForEach([ShopDepartment.appliances, .tools, .outdoors, .lighting], id: \.self) { dept in
                                        featuredCategoryTile(dept)
                                    }
                                }
                                .padding(.horizontal, DS.Spacing4)
                                .padding(.vertical, DS.Spacing2)
                            }
                        )
                    }
                )
                .padding(.horizontal, DS.Spacing4)

                // Quick Access to Available PLPs using DSMenuItem
                VStack(alignment: .leading, spacing: DS.Spacing3) {
                    Text("Shop Now")
                        .font(.thdH4)
                        .foregroundStyle(DS.TextOnSurfaceColorPrimary)
                        .padding(.horizontal, DS.Spacing4)

                    VStack(spacing: DS.Spacing2) {
                        plpQuickAccessMenuItem(
                            title: "Refrigerators",
                            subtitle: "French Door, Side by Side & More",
                            icon: "refrigerator",
                            category: .refrigerators
                        )
                        plpQuickAccessMenuItem(
                            title: "Power Drills",
                            subtitle: "Cordless, Corded & Impact Drivers",
                            icon: "screwdriver",
                            category: .powerDrills
                        )
                        plpQuickAccessMenuItem(
                            title: "Power Saws",
                            subtitle: "Circular, Miter & Table Saws",
                            icon: "triangle",
                            category: .powerSaws
                        )
                        plpQuickAccessMenuItem(
                            title: "Sanders",
                            subtitle: "Random Orbit, Belt & Detail",
                            icon: "circle.dotted",
                            category: .sanders
                        )
                    }
                    .padding(.horizontal, DS.Spacing4)
                }
            }
            .padding(.top, DS.Spacing4)
            .padding(.bottom, 100)
        }
    }

    // MARK: - Featured Category Tile using DSTile
    private func featuredCategoryTile(_ department: ShopDepartment) -> some View {
        DSTile(
            department.rawValue,
            variant: .filled,
            size: .regular,
            image: Image(systemName: department.icon)
        ) {
            withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                menuState = .subcategories(department)
            }
        }
    }

    // MARK: - PLP Quick Access using DSMenuItem
    private func plpQuickAccessMenuItem(title: String, subtitle: String, icon: String, category: PLPCategory) -> some View {
        DSMenuItem(
            style: .outline,
            media: .icon(
                Image(systemName: icon)
                    .font(.system(size: 20, weight: .medium))
                    .foregroundStyle(DS.Brand300)
            ),
            title: title,
            subtitle: subtitle,
            showChevron: true
        ) {
            withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
                menuState = .plp(category)
            }
        }
    }
}

// MARK: - =============================================
// MARK: - PREVIEWS
// MARK: - =============================================

#Preview("Shop View - Full") {
    ShopView()
}

#Preview("Morphing Menu - Collapsed") {
    struct PreviewWrapper: View {
        @State private var menuState: ShopMenuState = .collapsed
        var body: some View {
            VStack {
                MorphingShopMenu(menuState: $menuState)
                Spacer()
            }
            .background(DS.BackgroundSurfaceColorGreige)
        }
    }
    return PreviewWrapper()
}

#Preview("Morphing Menu - Departments") {
    VStack {
        MorphingShopMenu(menuState: .constant(.departments))
        Spacer()
    }
    .background(DS.BackgroundSurfaceColorGreige)
}

#Preview("Morphing Menu - Subcategories") {
    VStack {
        MorphingShopMenu(menuState: .constant(.subcategories(.appliances)))
        Spacer()
    }
    .background(DS.BackgroundSurfaceColorGreige)
}
