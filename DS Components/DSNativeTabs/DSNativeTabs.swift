import SwiftUI

// MARK: - DSNativeTabMinimizeBehavior

/// Minimize behavior options for native iOS 26 tab bars.
///
/// iOS 26 introduces the Liquid Glass tab bar that can minimize during scrolling,
/// giving more space to content. These behaviors control when minimization occurs.
public enum DSNativeTabMinimizeBehavior: CaseIterable, Sendable {
    /// System determines based on context (visionOS: look away, macOS: window size)
    case automatic
    /// Tab bar never minimizes automatically
    case never
    /// Tab bar minimizes when scrolling down (iPhone only)
    case onScrollDown
    /// Tab bar minimizes when scrolling up (iPhone only)
    case onScrollUp

    @available(iOS 26.0, *)
    var systemBehavior: TabBarMinimizeBehavior {
        switch self {
        case .automatic: .automatic
        case .never: .never
        case .onScrollDown: .onScrollDown
        case .onScrollUp: .onScrollUp
        }
    }

    var displayName: String {
        switch self {
        case .automatic: "Automatic"
        case .never: "Never"
        case .onScrollDown: "On Scroll Down"
        case .onScrollUp: "On Scroll Up"
        }
    }

    var description: String {
        switch self {
        case .automatic: "System intelligently determines based on platform and context"
        case .never: "Tab bar stays visible at all times"
        case .onScrollDown: "Tab bar minimizes when scrolling content down (iPhone)"
        case .onScrollUp: "Tab bar minimizes when scrolling content up (iPhone)"
        }
    }

    var detailedDescription: String {
        switch self {
        case .automatic:
            "The system decides when to minimize. On visionOS, tabs minimize when you look away. On macOS, they minimize when window space is limited."
        case .never:
            "The tab bar remains fully expanded regardless of user interaction. Best for apps where tab visibility is critical."
        case .onScrollDown:
            "As the user scrolls down through content, the tab bar collapses to show only the current tab icon. Scrolling up restores it."
        case .onScrollUp:
            "The inverse of onScrollDown - tabs minimize when scrolling up. Useful for specific content consumption patterns."
        }
    }

    var iconName: String {
        switch self {
        case .automatic: "wand.and.stars"
        case .never: "rectangle.bottomhalf.filled"
        case .onScrollDown: "arrow.down.to.line"
        case .onScrollUp: "arrow.up.to.line"
        }
    }
}

// MARK: - DSNativeTabStyle

/// Style options for native iOS 26 TabView.
///
/// TabView supports different presentation styles that adapt across platforms.
/// The sidebarAdaptable style is particularly powerful for multi-platform apps.
public enum DSNativeTabStyle: CaseIterable, Sendable {
    /// Default automatic style (Liquid Glass on iOS 26)
    case automatic
    /// Sidebar adaptable style for iPad/Mac
    case sidebarAdaptable

    var displayName: String {
        switch self {
        case .automatic: "Automatic"
        case .sidebarAdaptable: "Sidebar Adaptable"
        }
    }

    var description: String {
        switch self {
        case .automatic: "Default Liquid Glass tab bar on iPhone"
        case .sidebarAdaptable: "Converts to sidebar on iPad and Mac"
        }
    }

    var detailedDescription: String {
        switch self {
        case .automatic:
            "Uses the platform-default tab bar style. On iOS 26, this applies the new Liquid Glass material with floating design."
        case .sidebarAdaptable:
            "On iPad and Mac, tabs transform into a sidebar navigation. On iPhone and Apple Watch, it remains a tab bar. Perfect for universal apps."
        }
    }

    var iconName: String {
        switch self {
        case .automatic: "iphone"
        case .sidebarAdaptable: "sidebar.left"
        }
    }

    var platforms: String {
        switch self {
        case .automatic: "All platforms"
        case .sidebarAdaptable: "iPad, Mac → Sidebar / iPhone, Watch → Tabs"
        }
    }
}

// MARK: - DSNativeTabRole

/// Role options for tabs that affect their placement and behavior.
public enum DSNativeTabRole: CaseIterable, Sendable {
    /// Standard tab with no special role
    case standard
    /// Search tab with special placement and behavior
    case search

    var displayName: String {
        switch self {
        case .standard: "Standard"
        case .search: "Search"
        }
    }

    var description: String {
        switch self {
        case .standard: "Regular tab in the tab bar"
        case .search: "Separated placement, transforms to search field"
        }
    }

    var detailedDescription: String {
        switch self {
        case .standard:
            "A normal tab that appears in sequence with other tabs."
        case .search:
            "On iOS, the search tab appears visually separated from other tabs. When selected, it transforms into a search field. Works with the .searchable() modifier."
        }
    }

    var iconName: String {
        switch self {
        case .standard: "square"
        case .search: "magnifyingglass"
        }
    }
}

// MARK: - DSBottomAccessoryPlacement

/// Placement options for the tab view bottom accessory.
public enum DSBottomAccessoryPlacement: CaseIterable, Sendable {
    /// Accessory displayed expanded on top of tab bar
    case expanded
    /// Accessory displayed inline with tab bar
    case inline

    var displayName: String {
        switch self {
        case .expanded: "Expanded"
        case .inline: "Inline"
        }
    }

    var description: String {
        switch self {
        case .expanded: "Above the tab bar or at bottom of content"
        case .inline: "Aligned with the tab bar"
        }
    }

    var detailedDescription: String {
        switch self {
        case .expanded:
            "The accessory view appears prominently above the tab bar. When tabs minimize, the accessory moves next to the minimized tab button."
        case .inline:
            "The accessory view appears inline with the tab bar, taking up less vertical space."
        }
    }

    var iconName: String {
        switch self {
        case .expanded: "rectangle.expand.vertical"
        case .inline: "rectangle.compress.vertical"
        }
    }
}

// MARK: - DSNativeTabItem

/// Represents a single native tab item configuration.
public struct DSNativeTabItem<Value: Hashable>: Identifiable, Sendable where Value: Sendable {
    public let id: String
    public let title: String
    public let systemImage: String
    public let value: Value
    public let isSearch: Bool
    public let badge: String?

    public init(
        id: String = UUID().uuidString,
        title: String,
        systemImage: String,
        value: Value,
        isSearch: Bool = false,
        badge: String? = nil
    ) {
        self.id = id
        self.title = title
        self.systemImage = systemImage
        self.value = value
        self.isSearch = isSearch
        self.badge = badge
    }
}

// MARK: - DSNativeTabView

/// A wrapper around iOS 26's native TabView with Liquid Glass styling.
///
/// Provides easy access to iOS 26 tab bar features:
/// - Liquid Glass material
/// - Minimize behavior on scroll
/// - Bottom accessory views
/// - Search tab role
/// - Sidebar adaptable style
///
/// Example usage:
/// ```swift
/// DSNativeTabView(selection: $selectedTab) {
///     Tab("Home", systemImage: "house", value: 0) {
///         HomeView()
///     }
///     Tab("Search", systemImage: "magnifyingglass", value: 1, role: .search) {
///         SearchView()
///     }
/// }
/// .tabBarMinimizeBehavior(.onScrollDown)
/// .tabViewBottomAccessory {
///     NowPlayingView()
/// }
/// ```
@available(iOS 26.0, *)
public struct DSNativeTabView<Content: View, SelectionValue: Hashable>: View {
    @Binding private var selection: SelectionValue
    private let content: Content
    private var minimizeBehavior: DSNativeTabMinimizeBehavior
    private var style: DSNativeTabStyle

    public init(
        selection: Binding<SelectionValue>,
        minimizeBehavior: DSNativeTabMinimizeBehavior = .never,
        style: DSNativeTabStyle = .automatic,
        @ViewBuilder content: () -> Content
    ) {
        self._selection = selection
        self.content = content()
        self.minimizeBehavior = minimizeBehavior
        self.style = style
    }

    public var body: some View {
        Group {
            switch style {
            case .automatic:
                TabView(selection: $selection) {
                    content
                }
                .tabBarMinimizeBehavior(minimizeBehavior.systemBehavior)

            case .sidebarAdaptable:
                TabView(selection: $selection) {
                    content
                }
                .tabViewStyle(.sidebarAdaptable)
                .tabBarMinimizeBehavior(minimizeBehavior.systemBehavior)
            }
        }
    }
}

// MARK: - DSNativeTabView Modifiers

@available(iOS 26.0, *)
extension DSNativeTabView {
    /// Sets the minimize behavior for the tab bar.
    public func minimizeBehavior(_ behavior: DSNativeTabMinimizeBehavior) -> DSNativeTabView {
        var view = self
        view.minimizeBehavior = behavior
        return view
    }

    /// Sets the tab view style.
    public func tabStyle(_ style: DSNativeTabStyle) -> DSNativeTabView {
        var view = self
        view.style = style
        return view
    }
}

// MARK: - Tab View Bottom Accessory Helper

/// A view modifier that adds a bottom accessory to a TabView.
@available(iOS 26.0, *)
public struct DSTabBottomAccessoryModifier<Accessory: View>: ViewModifier {
    let accessory: Accessory

    public init(@ViewBuilder accessory: () -> Accessory) {
        self.accessory = accessory()
    }

    public func body(content: Content) -> some View {
        content
            .tabViewBottomAccessory {
                accessory
            }
    }
}

@available(iOS 26.0, *)
extension View {
    /// Adds a bottom accessory view to the TabView.
    public func dsTabBottomAccessory<Accessory: View>(
        @ViewBuilder _ accessory: () -> Accessory
    ) -> some View {
        modifier(DSTabBottomAccessoryModifier(accessory: accessory))
    }
}

// MARK: - Glass Effect Button Style

/// A button style that applies the Liquid Glass effect.
@available(iOS 26.0, *)
public struct DSGlassButtonStyle: ButtonStyle {
    public init() {}

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .glassEffect(.regular.interactive())
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}

@available(iOS 26.0, *)
extension ButtonStyle where Self == DSGlassButtonStyle {
    /// A button style with Liquid Glass effect.
    public static var dsGlass: DSGlassButtonStyle { DSGlassButtonStyle() }
}

// MARK: - Preview Helpers

@available(iOS 26.0, *)
enum PreviewTab: Int, CaseIterable {
    case home = 0
    case favorites = 1
    case cart = 2
    case profile = 3
    case search = 4

    var title: String {
        switch self {
        case .home: "Home"
        case .favorites: "Favorites"
        case .cart: "Cart"
        case .profile: "Profile"
        case .search: "Search"
        }
    }

    var systemImage: String {
        switch self {
        case .home: "house"
        case .favorites: "star"
        case .cart: "cart"
        case .profile: "person"
        case .search: "magnifyingglass"
        }
    }
}

// MARK: - Previews

@available(iOS 26.0, *)
#Preview("Basic Native Tabs") {
    struct PreviewWrapper: View {
        @State private var selectedTab = 0

        var body: some View {
            TabView(selection: $selectedTab) {
                Tab("Home", systemImage: "house", value: 0) {
                    NavigationStack {
                        ScrollView {
                            VStack(spacing: 16) {
                                ForEach(0..<20) { index in
                                    Text("Home Item \(index)")
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background(.regularMaterial)
                                        .clipShape(.rect(cornerRadius: 12))
                                }
                            }
                            .padding()
                        }
                        .navigationTitle("Home")
                    }
                }

                Tab("Favorites", systemImage: "star", value: 1) {
                    NavigationStack {
                        Text("Favorites Content")
                            .navigationTitle("Favorites")
                    }
                }

                Tab("Search", systemImage: "magnifyingglass", value: 2, role: .search) {
                    NavigationStack {
                        Text("Search Content")
                            .navigationTitle("Search")
                    }
                }
            }
            .tabBarMinimizeBehavior(.onScrollDown)
        }
    }

    return PreviewWrapper()
}

@available(iOS 26.0, *)
#Preview("With Bottom Accessory") {
    struct PreviewWrapper: View {
        @State private var selectedTab = 0

        var body: some View {
            TabView(selection: $selectedTab) {
                Tab("Home", systemImage: "house", value: 0) {
                    Text("Home Content")
                }

                Tab("Library", systemImage: "books.vertical", value: 1) {
                    Text("Library Content")
                }
            }
            .tabBarMinimizeBehavior(.onScrollDown)
            .tabViewBottomAccessory {
                HStack {
                    Image(systemName: "music.note")
                    Text("Now Playing")
                    Spacer()
                    Button("Pause", systemImage: "pause.fill", action: {})
                        .labelStyle(.iconOnly)
                }
                .padding(.horizontal)
            }
        }
    }

    return PreviewWrapper()
}
