import SwiftUI

// MARK: - DSNativeTabsView (Showcase)

/// Comprehensive visual showcase of iOS 26 native TabView with Liquid Glass features.
///
/// This showcase demonstrates all iOS 26 tab features with LIVE visual examples,
/// not just code snippets. Each section includes interactive demonstrations
/// that show the actual behavior of the features.

@available(iOS 26.0, *)
struct DSNativeTabsView: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing6) {

                // MARK: - Header Card
                headerCard

                // MARK: - Content Card
                VStack(alignment: .leading, spacing: TokensCoreLight.Spacing6) {

                    // 1. Minimize Behaviors - Visual Demo
                    MinimizeBehaviorDemoSection()

                    Divider().padding(.vertical, TokensCoreLight.Spacing2)

                    // 2. Bottom Accessory - Visual Demo
                    BottomAccessoryDemoSection()

                    Divider().padding(.vertical, TokensCoreLight.Spacing2)

                    // 3. Search Tab Role - Visual Demo
                    SearchTabRoleDemoSection()

                    Divider().padding(.vertical, TokensCoreLight.Spacing2)

                    // 4. Tab Styles - Visual Demo
                    TabStylesDemoSection()

                    Divider().padding(.vertical, TokensCoreLight.Spacing2)

                    // 5. Glass Effect - Visual Demo
                    GlassEffectDemoSection()

                    Divider().padding(.vertical, TokensCoreLight.Spacing2)

                    // 6. Badges - Visual Demo
                    BadgeDemoSection()

                    Divider().padding(.vertical, TokensCoreLight.Spacing2)

                    // 7. Complete App Examples
                    CompleteAppDemoSection()

                    Divider().padding(.vertical, TokensCoreLight.Spacing2)

                    // 8. API Reference
                    APIReferenceSection()
                }
                .padding(TokensCoreLight.Spacing4)
                .background(
                    RoundedRectangle(cornerRadius: borderRadiusXl)
                        .fill(containerWhite)
                )
            }
            .padding(TokensCoreLight.Spacing4)
            .padding(.top, TokensCoreLight.Spacing24)
            .padding(.bottom, TokensCoreLight.Spacing20)
        }
        .background(surfaceGreige)
        .applySoftScrollEdges()
    }

    // MARK: - Header Card

    private var headerCard: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            HStack {
                Image(systemName: "dock.rectangle")
                    .font(.system(size: 32))
                    .foregroundStyle(.linearGradient(
                        colors: [.blue, .purple],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ))

                VStack(alignment: .leading, spacing: 4) {
                    Text("Native Tabs")
                        .thdFont(.hero5)
                        .foregroundStyle(textPrimary)

                    Text("iOS 26 Liquid Glass")
                        .thdFont(.bodySm)
                        .foregroundStyle(textTertiary)
                }
            }

            Text("iOS 26 introduces a revolutionary tab bar with Liquid Glass material. The floating design, minimize behaviors, and bottom accessories create a modern, content-first experience.")
                .thdFont(.bodyMd)
                .foregroundStyle(textSecondary)

            // Key features pills
            ScrollView(.horizontal) {
                HStack(spacing: TokensCoreLight.Spacing2) {
                    FeaturePill(icon: "arrow.up.and.down", text: "Minimize")
                    FeaturePill(icon: "music.note", text: "Accessory")
                    FeaturePill(icon: "magnifyingglass", text: "Search Role")
                    FeaturePill(icon: "sidebar.left", text: "Sidebar")
                    FeaturePill(icon: "sparkles", text: "Glass Effect")
                    FeaturePill(icon: "bell.badge", text: "Badges")
                }
            }
            .scrollIndicators(.hidden)
        }
        .padding(TokensCoreLight.Spacing4)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: borderRadiusXl)
                .fill(containerWhite)
        )
    }

    // MARK: - Theme-Aware Colors

    private var textPrimary: Color { tokens.TextOnContainerColorPrimary }
    private var textSecondary: Color { tokens.TextOnContainerColorSecondary }
    private var textTertiary: Color { tokens.TextOnContainerColorTertiary }
    private var containerWhite: Color { tokens.BackgroundContainerColorWhite }
    private var surfaceGreige: Color { tokens.BackgroundSurfaceColorGreige }
    private var borderRadiusXl: CGFloat { tokens.BorderRadiusXl }

    private var tokens: any DSNativeTabTokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }
}

// MARK: - Feature Pill

@available(iOS 26.0, *)
private struct FeaturePill: View {
    let icon: String
    let text: String

    var body: some View {
        HStack(spacing: 6) {
            Image(systemName: icon)
                .font(.system(size: 12))
            Text(text)
                .font(.system(size: 12, weight: .medium))
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .background(.ultraThinMaterial)
        .clipShape(.capsule)
    }
}

// MARK: - Section 1: Minimize Behavior Demo

@available(iOS 26.0, *)
private struct MinimizeBehaviorDemoSection: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var selectedBehavior: DSNativeTabMinimizeBehavior = .onScrollDown
    @State private var selectedTab = 0

    private var tokens: any DSNativeTabTokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            DSNativeTabSectionHeader(
                title: "Minimize Behaviors",
                description: "Control how the tab bar responds to scrolling. Try scrolling in the demo below."
            )

            // Behavior selector
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                Text("Select Behavior")
                    .thdFont(.caption)
                    .foregroundStyle(tokens.TextOnContainerColorTertiary)

                ScrollView(.horizontal) {
                    HStack(spacing: TokensCoreLight.Spacing2) {
                        ForEach(DSNativeTabMinimizeBehavior.allCases, id: \.self) { behavior in
                            BehaviorOptionCard(
                                behavior: behavior,
                                isSelected: selectedBehavior == behavior
                            ) {
                                withAnimation(.easeInOut(duration: 0.2)) {
                                    selectedBehavior = behavior
                                }
                            }
                        }
                    }
                }
                .scrollIndicators(.hidden)
            }

            // Live demo
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                HStack {
                    Text("Live Demo")
                        .thdFont(.bodySm)
                        .foregroundStyle(tokens.TextOnContainerColorSecondary)

                    Spacer()

                    Text("Scroll to see behavior")
                        .thdFont(.caption)
                        .foregroundStyle(tokens.TextOnContainerColorTertiary)
                }

                // Embedded TabView demo
                TabView(selection: $selectedTab) {
                    Tab("Home", systemImage: "house", value: 0) {
                        ScrollView {
                            VStack(spacing: 12) {
                                ForEach(0..<15) { index in
                                    DemoListRow(index: index)
                                }
                            }
                            .padding()
                        }
                    }

                    Tab("Favorites", systemImage: "star", value: 1) {
                        ScrollView {
                            VStack(spacing: 12) {
                                ForEach(0..<15) { index in
                                    DemoListRow(index: index, color: .yellow)
                                }
                            }
                            .padding()
                        }
                    }

                    Tab("Profile", systemImage: "person", value: 2) {
                        Text("Profile Content")
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }
                }
                .tabBarMinimizeBehavior(selectedBehavior.systemBehavior)
                .frame(height: 350)
                .clipShape(.rect(cornerRadius: tokens.BorderRadiusLg))
                .overlay(
                    RoundedRectangle(cornerRadius: tokens.BorderRadiusLg)
                        .stroke(tokens.TextOnContainerColorTertiary.opacity(0.2), lineWidth: 1)
                )
            }

            // Selected behavior details
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                HStack {
                    Image(systemName: selectedBehavior.iconName)
                        .font(.system(size: 24))
                        .foregroundStyle(.blue)
                        .frame(width: 40, height: 40)

                    VStack(alignment: .leading, spacing: 2) {
                        Text(".\(selectedBehavior.displayName.lowercased().replacing(" ", with: ""))")
                            .thdFont(.bodySm)
                            .foregroundStyle(tokens.TextOnContainerColorPrimary)
                            .fontDesign(.monospaced)

                        Text(selectedBehavior.description)
                            .thdFont(.caption)
                            .foregroundStyle(tokens.TextOnContainerColorTertiary)
                    }
                }

                Text(selectedBehavior.detailedDescription)
                    .thdFont(.caption)
                    .foregroundStyle(tokens.TextOnContainerColorSecondary)
                    .padding(TokensCoreLight.Spacing2)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(tokens.BackgroundContainerColorGreige)
                    )
            }
            .padding(TokensCoreLight.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: tokens.BorderRadiusLg)
                    .fill(tokens.BackgroundContainerColorGreige)
            )

            // Code example
            CollapsibleCodeExample(
                title: "Implementation",
                code: """
TabView(selection: $selectedTab) {
    Tab("Home", systemImage: "house", value: 0) {
        HomeView()
    }
    Tab("Favorites", systemImage: "star", value: 1) {
        FavoritesView()
    }
}
.tabBarMinimizeBehavior(.\(selectedBehavior.displayName.lowercased().replacing(" ", with: "")))
"""
            )
        }
    }
}

// MARK: - Behavior Option Card

@available(iOS 26.0, *)
private struct BehaviorOptionCard: View {
    @Environment(\.colorScheme) var colorScheme
    let behavior: DSNativeTabMinimizeBehavior
    let isSelected: Bool
    let action: () -> Void

    private var tokens: any DSNativeTabTokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    var body: some View {
        Button(action: action) {
            VStack(spacing: 8) {
                Image(systemName: behavior.iconName)
                    .font(.system(size: 24))
                    .foregroundStyle(isSelected ? .white : tokens.TextOnContainerColorSecondary)

                Text(behavior.displayName)
                    .thdFont(.caption)
                    .foregroundStyle(isSelected ? .white : tokens.TextOnContainerColorPrimary)
            }
            .frame(width: 90, height: 80)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(isSelected ? .blue : tokens.BackgroundContainerColorWhite)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(isSelected ? .clear : tokens.TextOnContainerColorTertiary.opacity(0.2), lineWidth: 1)
            )
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Section 2: Bottom Accessory Demo

@available(iOS 26.0, *)
private struct BottomAccessoryDemoSection: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var showAccessory = true
    @State private var selectedTab = 0
    @State private var isPlaying = true

    private var tokens: any DSNativeTabTokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            DSNativeTabSectionHeader(
                title: "Bottom Accessory",
                description: "Add persistent controls above the tab bar, like a Now Playing bar in music apps."
            )

            // Toggle
            HStack {
                Text("Show Bottom Accessory")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorSecondary)
                Spacer()
                Toggle("", isOn: $showAccessory)
                    .labelsHidden()
            }
            .padding(TokensCoreLight.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: tokens.BorderRadiusLg)
                    .fill(tokens.BackgroundContainerColorGreige)
            )

            // Live demo with accessory
            Group {
                if showAccessory {
                    TabView(selection: $selectedTab) {
                        Tab("Listen Now", systemImage: "play.circle", value: 0) {
                            ScrollView {
                                VStack(spacing: 12) {
                                    ForEach(0..<10) { index in
                                        MusicTrackRow(index: index)
                                    }
                                }
                                .padding()
                            }
                        }

                        Tab("Library", systemImage: "music.note.list", value: 1) {
                            Text("Library Content")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }

                        Tab("Search", systemImage: "magnifyingglass", value: 2, role: .search) {
                            Text("Search Content")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                    }
                    .tabBarMinimizeBehavior(.onScrollDown)
                    .tabViewBottomAccessory {
                        NowPlayingAccessory(isPlaying: $isPlaying)
                    }
                } else {
                    TabView(selection: $selectedTab) {
                        Tab("Listen Now", systemImage: "play.circle", value: 0) {
                            ScrollView {
                                VStack(spacing: 12) {
                                    ForEach(0..<10) { index in
                                        MusicTrackRow(index: index)
                                    }
                                }
                                .padding()
                            }
                        }

                        Tab("Library", systemImage: "music.note.list", value: 1) {
                            Text("Library Content")
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                    }
                    .tabBarMinimizeBehavior(.onScrollDown)
                }
            }
            .frame(height: 380)
            .clipShape(.rect(cornerRadius: tokens.BorderRadiusLg))
            .overlay(
                RoundedRectangle(cornerRadius: tokens.BorderRadiusLg)
                    .stroke(tokens.TextOnContainerColorTertiary.opacity(0.2), lineWidth: 1)
            )

            // Placement options
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                Text("Accessory Placement Options")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorSecondary)

                HStack(spacing: TokensCoreLight.Spacing3) {
                    ForEach(DSBottomAccessoryPlacement.allCases, id: \.self) { placement in
                        PlacementOptionCard(placement: placement)
                    }
                }
            }

            // Code example
            CollapsibleCodeExample(
                title: "Implementation",
                code: """
TabView(selection: $selectedTab) {
    Tab("Listen Now", systemImage: "play.circle", value: 0) {
        ContentView()
    }
    // More tabs...
}
.tabBarMinimizeBehavior(.onScrollDown)
.tabViewBottomAccessory {
    HStack {
        Image(systemName: "music.note")
        VStack(alignment: .leading) {
            Text("Song Title")
            Text("Artist")
        }
        Spacer()
        Button("Pause", systemImage: "pause.fill") { }
    }
    .padding(.horizontal)
}
"""
            )
        }
    }
}

// MARK: - Now Playing Accessory

@available(iOS 26.0, *)
private struct NowPlayingAccessory: View {
    @Binding var isPlaying: Bool

    var body: some View {
        HStack(spacing: 12) {
            RoundedRectangle(cornerRadius: 6)
                .fill(.regularMaterial)
                .frame(width: 44, height: 44)
                .overlay {
                    Image(systemName: "music.note")
                        .foregroundStyle(.secondary)
                }

            VStack(alignment: .leading, spacing: 2) {
                Text("Currently Playing")
                    .font(.subheadline)
                    .bold()
                Text("Artist Name")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Button {
                isPlaying.toggle()
            } label: {
                Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                    .font(.title3)
            }

            Button {} label: {
                Image(systemName: "forward.fill")
                    .font(.title3)
            }
        }
        .padding(.horizontal)
    }
}

// MARK: - Placement Option Card

@available(iOS 26.0, *)
private struct PlacementOptionCard: View {
    @Environment(\.colorScheme) var colorScheme
    let placement: DSBottomAccessoryPlacement

    private var tokens: any DSNativeTabTokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: placement.iconName)
                    .foregroundStyle(.blue)
                Text(placement.displayName)
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorPrimary)
            }

            Text(placement.description)
                .thdFont(.caption)
                .foregroundStyle(tokens.TextOnContainerColorTertiary)
        }
        .padding(TokensCoreLight.Spacing3)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: tokens.BorderRadiusLg)
                .fill(tokens.BackgroundContainerColorGreige)
        )
    }
}

// MARK: - Section 3: Search Tab Role Demo

@available(iOS 26.0, *)
private struct SearchTabRoleDemoSection: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var selectedTab = 0
    @State private var searchText = ""

    private var tokens: any DSNativeTabTokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            DSNativeTabSectionHeader(
                title: "Search Tab Role",
                description: "The search role provides special placement and transforms into a search field when selected."
            )

            // Visual comparison
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                Text("Visual Comparison")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorSecondary)

                HStack(spacing: TokensCoreLight.Spacing3) {
                    // Standard tabs mockup
                    VStack(spacing: 8) {
                        Text("Standard Tabs")
                            .thdFont(.caption)
                            .foregroundStyle(tokens.TextOnContainerColorTertiary)

                        MockTabBar(tabs: [
                            ("house", "Home", false),
                            ("star", "Favs", false),
                            ("magnifyingglass", "Search", false)
                        ], hasSearchRole: false)
                    }
                    .frame(maxWidth: .infinity)

                    // With search role mockup
                    VStack(spacing: 8) {
                        Text("With Search Role")
                            .thdFont(.caption)
                            .foregroundStyle(tokens.TextOnContainerColorTertiary)

                        MockTabBar(tabs: [
                            ("house", "Home", false),
                            ("star", "Favs", false),
                            ("magnifyingglass", "Search", true)
                        ], hasSearchRole: true)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(TokensCoreLight.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: tokens.BorderRadiusLg)
                    .fill(tokens.BackgroundContainerColorGreige)
            )

            // Live demo
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                Text("Live Demo - Tap the Search tab")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorSecondary)

                TabView(selection: $selectedTab) {
                    Tab("Home", systemImage: "house", value: 0) {
                        VStack {
                            Image(systemName: "house.fill")
                                .font(.system(size: 48))
                                .foregroundStyle(.secondary)
                            Text("Home Content")
                                .foregroundStyle(.secondary)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }

                    Tab("Favorites", systemImage: "star", value: 1) {
                        VStack {
                            Image(systemName: "star.fill")
                                .font(.system(size: 48))
                                .foregroundStyle(.yellow)
                            Text("Favorites Content")
                                .foregroundStyle(.secondary)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    }

                    Tab("Search", systemImage: "magnifyingglass", value: 2, role: .search) {
                        NavigationStack {
                            List {
                                if searchText.isEmpty {
                                    Section("Recent Searches") {
                                        Text("SwiftUI")
                                        Text("TabView")
                                        Text("Liquid Glass")
                                    }
                                } else {
                                    ForEach(0..<5) { index in
                                        Text("Result for '\(searchText)' - \(index + 1)")
                                    }
                                }
                            }
                            .navigationTitle("Search")
                        }
                        .searchable(text: $searchText)
                    }
                }
                .frame(height: 320)
                .clipShape(.rect(cornerRadius: tokens.BorderRadiusLg))
                .overlay(
                    RoundedRectangle(cornerRadius: tokens.BorderRadiusLg)
                        .stroke(tokens.TextOnContainerColorTertiary.opacity(0.2), lineWidth: 1)
                )
            }

            // Role options
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                Text("Tab Roles")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorSecondary)

                ForEach(DSNativeTabRole.allCases, id: \.self) { role in
                    RoleOptionRow(role: role)
                }
            }

            // Code example
            CollapsibleCodeExample(
                title: "Implementation",
                code: """
TabView(selection: $selectedTab) {
    Tab("Home", systemImage: "house", value: 0) {
        HomeView()
    }

    // Search tab with special role
    Tab("Search", systemImage: "magnifyingglass", value: 1, role: .search) {
        NavigationStack {
            SearchResultsView()
        }
        .searchable(text: $searchText)
    }
}
"""
            )
        }
    }
}

// MARK: - Mock Tab Bar

@available(iOS 26.0, *)
private struct MockTabBar: View {
    let tabs: [(icon: String, label: String, isSearch: Bool)]
    let hasSearchRole: Bool

    var body: some View {
        HStack(spacing: 0) {
            ForEach(tabs.indices, id: \.self) { index in
                let tab = tabs[index]
                if hasSearchRole && tab.isSearch {
                    Spacer()
                    // Search tab separated
                    VStack(spacing: 4) {
                        Image(systemName: tab.icon)
                            .font(.system(size: 20))
                        Text(tab.label)
                            .font(.system(size: 10))
                    }
                    .foregroundStyle(.blue)
                    .padding(.horizontal, 12)
                } else {
                    VStack(spacing: 4) {
                        Image(systemName: tab.icon)
                            .font(.system(size: 20))
                        Text(tab.label)
                            .font(.system(size: 10))
                    }
                    .foregroundStyle(index == 0 ? .blue : .secondary)
                    .frame(maxWidth: .infinity)
                }
            }
        }
        .padding(.vertical, 8)
        .background(.ultraThinMaterial)
        .clipShape(.rect(cornerRadius: 16))
    }
}

// MARK: - Role Option Row

@available(iOS 26.0, *)
private struct RoleOptionRow: View {
    @Environment(\.colorScheme) var colorScheme
    let role: DSNativeTabRole

    private var tokens: any DSNativeTabTokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    var body: some View {
        HStack(spacing: TokensCoreLight.Spacing3) {
            Image(systemName: role.iconName)
                .font(.system(size: 20))
                .foregroundStyle(.blue)
                .frame(width: 32, height: 32)

            VStack(alignment: .leading, spacing: 2) {
                Text(".\(role.displayName.lowercased())")
                    .thdFont(.bodySm)
                    .fontDesign(.monospaced)
                    .foregroundStyle(tokens.TextOnContainerColorPrimary)

                Text(role.detailedDescription)
                    .thdFont(.caption)
                    .foregroundStyle(tokens.TextOnContainerColorTertiary)
            }

            Spacer()
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: tokens.BorderRadiusLg)
                .fill(tokens.BackgroundContainerColorGreige)
        )
    }
}

// MARK: - Section 4: Tab Styles Demo

@available(iOS 26.0, *)
private struct TabStylesDemoSection: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var selectedStyle: DSNativeTabStyle = .automatic

    private var tokens: any DSNativeTabTokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            DSNativeTabSectionHeader(
                title: "Tab View Styles",
                description: "Choose how tabs adapt across platforms. Sidebar adaptable transforms tabs into a sidebar on iPad and Mac."
            )

            // Style comparison
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                Text("Platform Adaptation")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorSecondary)

                HStack(spacing: TokensCoreLight.Spacing3) {
                    // iPhone mockup
                    VStack(spacing: 8) {
                        DeviceMockup(device: .iPhone, style: .automatic)
                        Text("iPhone")
                            .thdFont(.caption)
                            .foregroundStyle(tokens.TextOnContainerColorTertiary)
                    }
                    .frame(maxWidth: .infinity)

                    // iPad with sidebarAdaptable
                    VStack(spacing: 8) {
                        DeviceMockup(device: .iPad, style: .sidebarAdaptable)
                        Text("iPad (sidebarAdaptable)")
                            .thdFont(.caption)
                            .foregroundStyle(tokens.TextOnContainerColorTertiary)
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(TokensCoreLight.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: tokens.BorderRadiusLg)
                    .fill(tokens.BackgroundContainerColorGreige)
            )

            // Style options
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                Text("Available Styles")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorSecondary)

                ForEach(DSNativeTabStyle.allCases, id: \.self) { style in
                    StyleOptionRow(style: style, isSelected: selectedStyle == style) {
                        selectedStyle = style
                    }
                }
            }

            // TabSection info
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                HStack {
                    Image(systemName: "folder")
                        .foregroundStyle(.blue)
                    Text("TabSection")
                        .thdFont(.bodySm)
                        .foregroundStyle(tokens.TextOnContainerColorPrimary)
                }

                Text("Use TabSection to group related tabs together. Groups are visible in the sidebar on iPad/Mac with sidebarAdaptable style.")
                    .thdFont(.caption)
                    .foregroundStyle(tokens.TextOnContainerColorTertiary)

                CollapsibleCodeExample(
                    title: "TabSection Example",
                    code: """
TabView {
    Tab("Home", systemImage: "house", value: .home) {
        HomeView()
    }

    TabSection("Collections") {
        Tab("Favorites", systemImage: "star", value: .favorites) {
            FavoritesView()
        }
        Tab("Recent", systemImage: "clock", value: .recent) {
            RecentView()
        }
    }
}
.tabViewStyle(.sidebarAdaptable)
"""
                )
            }
            .padding(TokensCoreLight.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: tokens.BorderRadiusLg)
                    .fill(tokens.BackgroundContainerColorGreige)
            )
        }
    }
}

// MARK: - Device Mockup

@available(iOS 26.0, *)
private struct DeviceMockup: View {
    enum Device { case iPhone, iPad }

    let device: Device
    let style: DSNativeTabStyle

    var body: some View {
        VStack(spacing: 0) {
            // Content area
            Rectangle()
                .fill(.regularMaterial)
                .frame(height: device == .iPhone ? 100 : 80)
                .overlay {
                    if device == .iPad && style == .sidebarAdaptable {
                        HStack(spacing: 0) {
                            // Sidebar
                            VStack(alignment: .leading, spacing: 8) {
                                ForEach(["house", "star", "gear"], id: \.self) { icon in
                                    HStack {
                                        Image(systemName: icon)
                                        Text(icon.capitalized)
                                            .font(.system(size: 10))
                                    }
                                    .foregroundStyle(.secondary)
                                }
                            }
                            .padding(8)
                            .frame(width: 60)
                            .background(.ultraThinMaterial)

                            // Detail
                            Rectangle()
                                .fill(.clear)
                        }
                    } else {
                        Text("Content")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }

            // Tab bar (only for iPhone or automatic)
            if device == .iPhone || style == .automatic {
                HStack(spacing: 0) {
                    ForEach(["house", "star", "gear"], id: \.self) { icon in
                        Image(systemName: icon)
                            .font(.system(size: 16))
                            .foregroundStyle(icon == "house" ? .blue : .secondary)
                            .frame(maxWidth: .infinity)
                    }
                }
                .padding(.vertical, 6)
                .background(.ultraThinMaterial)
            }
        }
        .frame(width: device == .iPhone ? 80 : 140)
        .clipShape(.rect(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(.secondary.opacity(0.3), lineWidth: 1)
        )
    }
}

// MARK: - Style Option Row

@available(iOS 26.0, *)
private struct StyleOptionRow: View {
    @Environment(\.colorScheme) var colorScheme
    let style: DSNativeTabStyle
    let isSelected: Bool
    let action: () -> Void

    private var tokens: any DSNativeTabTokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    var body: some View {
        Button(action: action) {
            HStack(spacing: TokensCoreLight.Spacing3) {
                Image(systemName: style.iconName)
                    .font(.system(size: 20))
                    .foregroundStyle(isSelected ? .white : .blue)
                    .frame(width: 32, height: 32)

                VStack(alignment: .leading, spacing: 2) {
                    Text(".\(style.displayName.lowercased().replacing(" ", with: ""))")
                        .thdFont(.bodySm)
                        .fontDesign(.monospaced)
                        .foregroundStyle(isSelected ? .white : tokens.TextOnContainerColorPrimary)

                    Text(style.platforms)
                        .thdFont(.caption)
                        .foregroundStyle(isSelected ? .white.opacity(0.8) : tokens.TextOnContainerColorTertiary)
                }

                Spacer()

                if isSelected {
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundStyle(.white)
                }
            }
            .padding(TokensCoreLight.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: tokens.BorderRadiusLg)
                    .fill(isSelected ? .blue : tokens.BackgroundContainerColorGreige)
            )
        }
        .buttonStyle(.plain)
    }
}

// MARK: - Section 5: Glass Effect Demo

@available(iOS 26.0, *)
private struct GlassEffectDemoSection: View {
    @Environment(\.colorScheme) var colorScheme

    private var tokens: any DSNativeTabTokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            DSNativeTabSectionHeader(
                title: "Liquid Glass Effect",
                description: "iOS 26 applies Liquid Glass automatically to TabView. Use .glassEffect() for custom elements."
            )

            // Visual demo
            ZStack {
                // Gradient background
                LinearGradient(
                    colors: [.blue.opacity(0.6), .purple.opacity(0.6), .pink.opacity(0.6)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )

                VStack(spacing: 20) {
                    Text("Liquid Glass Buttons")
                        .font(.headline)
                        .foregroundStyle(.white)

                    HStack(spacing: 16) {
                        // Regular glass
                        Button {} label: {
                            Label("Add", systemImage: "plus")
                                .bold()
                                .padding()
                        }
                        .glassEffect()

                        // Interactive glass
                        Button {} label: {
                            Label("Share", systemImage: "square.and.arrow.up")
                                .bold()
                                .padding()
                        }
                        .glassEffect(.regular.interactive())
                    }

                    // Full width
                    Button {} label: {
                        Label("Continue", systemImage: "arrow.right")
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding()
                    }
                    .glassEffect(.regular.interactive())
                    .padding(.horizontal, 32)

                    // FAB style
                    HStack {
                        Spacer()
                        Button {} label: {
                            Image(systemName: "plus")
                                .font(.title2)
                                .bold()
                                .padding()
                        }
                        .glassEffect(.regular.interactive())
                    }
                    .padding(.trailing, 16)
                }
                .padding(.vertical, 24)
            }
            .frame(height: 280)
            .clipShape(.rect(cornerRadius: tokens.BorderRadiusLg))

            // Glass variants
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                Text("Glass Effect Variants")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorSecondary)

                GlassVariantRow(
                    name: ".glassEffect()",
                    description: "Basic glass effect, non-interactive"
                )

                GlassVariantRow(
                    name: ".glassEffect(.regular)",
                    description: "Regular glass material"
                )

                GlassVariantRow(
                    name: ".glassEffect(.regular.interactive())",
                    description: "Interactive glass for tappable elements"
                )
            }

            // Code example
            CollapsibleCodeExample(
                title: "Implementation",
                code: """
// Floating action button with glass effect
Button {
    // Action
} label: {
    Label("Add", systemImage: "plus")
        .bold()
        .padding()
}
.glassEffect(.regular.interactive())

// Glass container
VStack {
    // Content
}
.padding()
.glassEffect()
"""
            )
        }
    }
}

// MARK: - Glass Variant Row

@available(iOS 26.0, *)
private struct GlassVariantRow: View {
    @Environment(\.colorScheme) var colorScheme
    let name: String
    let description: String

    private var tokens: any DSNativeTabTokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) {
                Text(name)
                    .thdFont(.bodySm)
                    .fontDesign(.monospaced)
                    .foregroundStyle(tokens.TextOnContainerColorPrimary)

                Text(description)
                    .thdFont(.caption)
                    .foregroundStyle(tokens.TextOnContainerColorTertiary)
            }
            Spacer()
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: tokens.BorderRadiusLg)
                .fill(tokens.BackgroundContainerColorGreige)
        )
    }
}

// MARK: - Section 6: Badge Demo

@available(iOS 26.0, *)
private struct BadgeDemoSection: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var inboxCount = 5
    @State private var cartCount = 3
    @State private var selectedTab = 0

    private var tokens: any DSNativeTabTokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            DSNativeTabSectionHeader(
                title: "Tab Badges",
                description: "Display notification counts or status indicators on tabs."
            )

            // Badge controls
            VStack(spacing: TokensCoreLight.Spacing2) {
                HStack {
                    Text("Inbox Badge")
                        .thdFont(.bodySm)
                        .foregroundStyle(tokens.TextOnContainerColorSecondary)
                    Spacer()
                    Stepper("\(inboxCount)", value: $inboxCount, in: 0...99)
                        .labelsHidden()
                    Text("\(inboxCount)")
                        .thdFont(.bodySm)
                        .foregroundStyle(tokens.TextOnContainerColorPrimary)
                        .frame(width: 30)
                }

                HStack {
                    Text("Cart Badge")
                        .thdFont(.bodySm)
                        .foregroundStyle(tokens.TextOnContainerColorSecondary)
                    Spacer()
                    Stepper("\(cartCount)", value: $cartCount, in: 0...99)
                        .labelsHidden()
                    Text("\(cartCount)")
                        .thdFont(.bodySm)
                        .foregroundStyle(tokens.TextOnContainerColorPrimary)
                        .frame(width: 30)
                }
            }
            .padding(TokensCoreLight.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: tokens.BorderRadiusLg)
                    .fill(tokens.BackgroundContainerColorGreige)
            )

            // Live demo
            TabView(selection: $selectedTab) {
                Tab("Home", systemImage: "house", value: 0) {
                    VStack {
                        Image(systemName: "house.fill")
                            .font(.system(size: 48))
                            .foregroundStyle(.secondary)
                        Text("Home")
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }

                Tab("Inbox", systemImage: "envelope", value: 1) {
                    VStack {
                        Image(systemName: "envelope.fill")
                            .font(.system(size: 48))
                            .foregroundStyle(.blue)
                        Text("Inbox")
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .badge(inboxCount)

                Tab("Cart", systemImage: "cart", value: 2) {
                    VStack {
                        Image(systemName: "cart.fill")
                            .font(.system(size: 48))
                            .foregroundStyle(.orange)
                        Text("Cart")
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .badge(cartCount)

                Tab("Alerts", systemImage: "bell", value: 3) {
                    VStack {
                        Image(systemName: "bell.fill")
                            .font(.system(size: 48))
                            .foregroundStyle(.red)
                        Text("Alerts")
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .badge("New")
            }
            .frame(height: 280)
            .clipShape(.rect(cornerRadius: tokens.BorderRadiusLg))
            .overlay(
                RoundedRectangle(cornerRadius: tokens.BorderRadiusLg)
                    .stroke(tokens.TextOnContainerColorTertiary.opacity(0.2), lineWidth: 1)
            )

            // Badge types
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                Text("Badge Types")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorSecondary)

                HStack(spacing: TokensCoreLight.Spacing3) {
                    BadgeTypeCard(type: "Integer", example: ".badge(5)", icon: "number")
                    BadgeTypeCard(type: "String", example: ".badge(\"New\")", icon: "textformat")
                }
            }

            // Code example
            CollapsibleCodeExample(
                title: "Implementation",
                code: """
TabView(selection: $selectedTab) {
    Tab("Inbox", systemImage: "envelope", value: 0) {
        InboxView()
    }
    .badge(unreadCount)  // Integer badge

    Tab("Alerts", systemImage: "bell", value: 1) {
        AlertsView()
    }
    .badge("New")  // String badge
}
"""
            )
        }
    }
}

// MARK: - Badge Type Card

@available(iOS 26.0, *)
private struct BadgeTypeCard: View {
    @Environment(\.colorScheme) var colorScheme
    let type: String
    let example: String
    let icon: String

    private var tokens: any DSNativeTabTokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: icon)
                    .foregroundStyle(.blue)
                Text(type)
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorPrimary)
            }

            Text(example)
                .thdFont(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(tokens.TextOnContainerColorTertiary)
        }
        .padding(TokensCoreLight.Spacing3)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: tokens.BorderRadiusLg)
                .fill(tokens.BackgroundContainerColorGreige)
        )
    }
}

// MARK: - Section 7: Complete App Demo

@available(iOS 26.0, *)
private struct CompleteAppDemoSection: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var selectedDemo = 0

    private var tokens: any DSNativeTabTokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            DSNativeTabSectionHeader(
                title: "Complete App Examples",
                description: "See how all features combine in real-world app patterns."
            )

            // Demo selector
            Picker("Demo", selection: $selectedDemo) {
                Text("Music App").tag(0)
                Text("E-Commerce").tag(1)
                Text("Social").tag(2)
            }
            .pickerStyle(.segmented)

            // Demo view
            Group {
                switch selectedDemo {
                case 0:
                    MusicAppDemo()
                case 1:
                    ECommerceAppDemo()
                default:
                    SocialAppDemo()
                }
            }
            .frame(height: 400)
            .clipShape(.rect(cornerRadius: tokens.BorderRadiusLg))
            .overlay(
                RoundedRectangle(cornerRadius: tokens.BorderRadiusLg)
                    .stroke(tokens.TextOnContainerColorTertiary.opacity(0.2), lineWidth: 1)
            )
        }
    }
}

// MARK: - Music App Demo

@available(iOS 26.0, *)
private struct MusicAppDemo: View {
    @State private var selectedTab = 0
    @State private var isPlaying = true

    var body: some View {
        TabView(selection: $selectedTab) {
            Tab("Listen Now", systemImage: "play.circle", value: 0) {
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(0..<8) { index in
                            MusicTrackRow(index: index)
                        }
                    }
                    .padding()
                }
            }

            Tab("Browse", systemImage: "square.grid.2x2", value: 1) {
                Text("Browse Content")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }

            Tab("Library", systemImage: "music.note.list", value: 2) {
                Text("Library Content")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }

            Tab("Search", systemImage: "magnifyingglass", value: 3, role: .search) {
                Text("Search Content")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .tabBarMinimizeBehavior(.onScrollDown)
        .tabViewBottomAccessory {
            NowPlayingAccessory(isPlaying: $isPlaying)
        }
    }
}

// MARK: - E-Commerce App Demo

@available(iOS 26.0, *)
private struct ECommerceAppDemo: View {
    @State private var selectedTab = 0
    @State private var searchText = ""

    var body: some View {
        TabView(selection: $selectedTab) {
            Tab("Shop", systemImage: "storefront", value: 0) {
                ScrollView {
                    LazyVGrid(columns: [.init(.flexible()), .init(.flexible())], spacing: 12) {
                        ForEach(0..<6) { index in
                            DSNativeTabProductCard(index: index)
                        }
                    }
                    .padding()
                }
            }

            Tab("Categories", systemImage: "square.grid.2x2", value: 1) {
                Text("Categories")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }

            Tab("Cart", systemImage: "cart", value: 2) {
                Text("Cart")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .badge(3)

            Tab("Account", systemImage: "person", value: 3) {
                Text("Account")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }

            Tab("Search", systemImage: "magnifyingglass", value: 4, role: .search) {
                Text("Search Products")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .searchable(text: $searchText)
        .tabBarMinimizeBehavior(.onScrollDown)
    }
}

// MARK: - Social App Demo

@available(iOS 26.0, *)
private struct SocialAppDemo: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            Tab("Feed", systemImage: "house", value: 0) {
                ScrollView {
                    VStack(spacing: 16) {
                        ForEach(0..<5) { index in
                            SocialPostCard(index: index)
                        }
                    }
                    .padding()
                }
            }

            Tab("Explore", systemImage: "magnifyingglass", value: 1) {
                Text("Explore")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }

            Tab("Notifications", systemImage: "bell", value: 2) {
                Text("Notifications")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .badge(12)

            Tab("Messages", systemImage: "bubble.left.and.bubble.right", value: 3) {
                Text("Messages")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .badge(5)

            Tab("Profile", systemImage: "person.circle", value: 4) {
                Text("Profile")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .tabBarMinimizeBehavior(.onScrollDown)
    }
}

// MARK: - Section 8: API Reference

@available(iOS 26.0, *)
private struct APIReferenceSection: View {
    @Environment(\.colorScheme) var colorScheme

    private var tokens: any DSNativeTabTokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing3) {
            DSNativeTabSectionHeader(
                title: "API Reference",
                description: "Complete list of iOS 26 tab APIs"
            )

            // Specifications
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                SpecRow(label: "Minimum iOS", value: "iOS 26.0")
                SpecRow(label: "Tab Type", value: "Tab (iOS 18+)")
                SpecRow(label: "Material", value: "Liquid Glass (automatic)")
                SpecRow(label: "Minimize Behaviors", value: "automatic, never, onScrollDown, onScrollUp")
                SpecRow(label: "Tab Styles", value: "automatic, sidebarAdaptable")
                SpecRow(label: "Tab Roles", value: "search")
                SpecRow(label: "Accessory", value: "tabViewBottomAccessory")
                SpecRow(label: "Badges", value: ".badge(Int), .badge(String)")
                SpecRow(label: "Glass Effect", value: ".glassEffect(), .glassEffect(.regular.interactive())")
            }
            .padding(TokensCoreLight.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: tokens.BorderRadiusLg)
                    .fill(tokens.BackgroundContainerColorGreige)
            )

            // Migration notes
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                Text("Migration from tabItem()")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorSecondary)

                MigrationRow(
                    before: ".tabItem { Label(\"Home\", systemImage: \"house\") }",
                    after: "Tab(\"Home\", systemImage: \"house\", value: .home) { }"
                )
            }

            // Best practices
            VStack(alignment: .leading, spacing: TokensCoreLight.Spacing2) {
                Text("Best Practices")
                    .thdFont(.bodySm)
                    .foregroundStyle(tokens.TextOnContainerColorSecondary)

                BestPracticeRow(icon: "5.circle", text: "Limit to 5 tabs for discoverability")
                BestPracticeRow(icon: "magnifyingglass", text: "Use search role for search tabs")
                BestPracticeRow(icon: "arrow.down", text: "Enable minimize on scroll for content-heavy apps")
                BestPracticeRow(icon: "star.square", text: "Use SF Symbols for consistent iconography")
                BestPracticeRow(icon: "rectangle.and.hand.point.up.left", text: "Use glass effect for floating controls")
            }
        }
    }
}

// MARK: - Supporting Views

@available(iOS 26.0, *)
private struct DSNativeTabSectionHeader: View {
    @Environment(\.colorScheme) var colorScheme
    let title: String
    let description: String

    private var tokens: any DSNativeTabTokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    var body: some View {
        VStack(alignment: .leading, spacing: TokensCoreLight.Spacing1) {
            Text(title)
                .thdFont(.h3)
                .foregroundStyle(tokens.TextOnContainerColorPrimary)

            Text(description)
                .thdFont(.caption)
                .foregroundStyle(tokens.TextOnContainerColorTertiary)
        }
    }
}

@available(iOS 26.0, *)
private struct DemoListRow: View {
    let index: Int
    var color: Color = .blue

    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(color.opacity(0.2))
                .frame(width: 50, height: 50)
                .overlay {
                    Image(systemName: "photo")
                        .foregroundStyle(color)
                }

            VStack(alignment: .leading) {
                Text("Item \(index + 1)")
                    .font(.subheadline)
                    .bold()
                Text("Scroll to see tab minimize")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()
        }
        .padding()
        .background(.regularMaterial)
        .clipShape(.rect(cornerRadius: 12))
    }
}

@available(iOS 26.0, *)
private struct MusicTrackRow: View {
    let index: Int

    var body: some View {
        HStack(spacing: 12) {
            RoundedRectangle(cornerRadius: 8)
                .fill(.regularMaterial)
                .frame(width: 50, height: 50)
                .overlay {
                    Image(systemName: "music.note")
                        .foregroundStyle(.secondary)
                }

            VStack(alignment: .leading) {
                Text("Track \(index + 1)")
                    .font(.subheadline)
                    .bold()
                Text("Artist Name")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Image(systemName: "play.fill")
                .foregroundStyle(.secondary)
        }
        .padding()
        .background(.regularMaterial)
        .clipShape(.rect(cornerRadius: 12))
    }
}

@available(iOS 26.0, *)
private struct DSNativeTabProductCard: View {
    let index: Int

    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(.regularMaterial)
                .aspectRatio(1, contentMode: .fit)
                .overlay {
                    Image(systemName: "bag")
                        .font(.title)
                        .foregroundStyle(.secondary)
                }

            Text("Product \(index + 1)")
                .font(.caption)

            Text("$\((index + 1) * 29)")
                .font(.caption)
                .bold()
        }
    }
}

@available(iOS 26.0, *)
private struct SocialPostCard: View {
    let index: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Circle()
                    .fill(.regularMaterial)
                    .frame(width: 40, height: 40)
                    .overlay {
                        Image(systemName: "person.fill")
                            .foregroundStyle(.secondary)
                    }

                VStack(alignment: .leading) {
                    Text("User \(index + 1)")
                        .font(.subheadline)
                        .bold()
                    Text("2h ago")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }

                Spacer()
            }

            Text("This is a sample post content for the social feed demo.")
                .font(.subheadline)

            HStack(spacing: 24) {
                Label("24", systemImage: "heart")
                Label("5", systemImage: "bubble.right")
                Label("Share", systemImage: "square.and.arrow.up")
            }
            .font(.caption)
            .foregroundStyle(.secondary)
        }
        .padding()
        .background(.regularMaterial)
        .clipShape(.rect(cornerRadius: 12))
    }
}

@available(iOS 26.0, *)
private struct CollapsibleCodeExample: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var isExpanded = false
    let title: String
    let code: String

    private var tokens: any DSNativeTabTokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Button {
                withAnimation(.easeInOut(duration: 0.2)) {
                    isExpanded.toggle()
                }
            } label: {
                HStack {
                    Image(systemName: "chevron.right")
                        .rotationEffect(.degrees(isExpanded ? 90 : 0))
                        .foregroundStyle(tokens.TextOnContainerColorTertiary)

                    Text(title)
                        .thdFont(.caption)
                        .foregroundStyle(tokens.TextOnContainerColorSecondary)

                    Spacer()

                    Image(systemName: "doc.on.doc")
                        .foregroundStyle(tokens.TextOnContainerColorTertiary)
                }
                .padding(TokensCoreLight.Spacing2)
            }
            .buttonStyle(.plain)

            if isExpanded {
                Text(code)
                    .thdFont(.caption)
                    .foregroundStyle(tokens.TextOnContainerColorSecondary)
                    .fontDesign(.monospaced)
                    .padding(TokensCoreLight.Spacing3)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .background(
            RoundedRectangle(cornerRadius: tokens.BorderRadiusLg)
                .fill(tokens.BackgroundContainerColorTransparent05)
        )
    }
}

@available(iOS 26.0, *)
private struct SpecRow: View {
    @Environment(\.colorScheme) var colorScheme
    let label: String
    let value: String

    private var tokens: any DSNativeTabTokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    var body: some View {
        HStack {
            Text(label)
                .thdFont(.caption)
                .foregroundStyle(tokens.TextOnContainerColorTertiary)

            Spacer()

            Text(value)
                .thdFont(.caption)
                .foregroundStyle(tokens.TextOnContainerColorSecondary)
        }
    }
}

@available(iOS 26.0, *)
private struct MigrationRow: View {
    @Environment(\.colorScheme) var colorScheme
    let before: String
    let after: String

    private var tokens: any DSNativeTabTokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "xmark.circle.fill")
                    .foregroundStyle(.red)
                Text("Before")
                    .thdFont(.caption)
                    .foregroundStyle(tokens.TextOnContainerColorTertiary)
            }

            Text(before)
                .thdFont(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(tokens.TextOnContainerColorSecondary)

            HStack {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundStyle(.green)
                Text("After (iOS 18+)")
                    .thdFont(.caption)
                    .foregroundStyle(tokens.TextOnContainerColorTertiary)
            }

            Text(after)
                .thdFont(.caption)
                .fontDesign(.monospaced)
                .foregroundStyle(tokens.TextOnContainerColorSecondary)
        }
        .padding(TokensCoreLight.Spacing3)
        .background(
            RoundedRectangle(cornerRadius: tokens.BorderRadiusLg)
                .fill(tokens.BackgroundContainerColorGreige)
        )
    }
}

@available(iOS 26.0, *)
private struct BestPracticeRow: View {
    @Environment(\.colorScheme) var colorScheme
    let icon: String
    let text: String

    private var tokens: any DSNativeTabTokenSemanticProtocol.Type {
        colorScheme == .dark ? TokensSemanticDark.self : TokensSemanticLight.self
    }

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: icon)
                .foregroundStyle(.blue)
                .frame(width: 24)

            Text(text)
                .thdFont(.caption)
                .foregroundStyle(tokens.TextOnContainerColorSecondary)

            Spacer()
        }
        .padding(TokensCoreLight.Spacing2)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(tokens.BackgroundContainerColorGreige)
        )
    }
}

// MARK: - Token Protocol Helper

private protocol DSNativeTabTokenSemanticProtocol {
    static var TextOnContainerColorPrimary: Color { get }
    static var TextOnContainerColorSecondary: Color { get }
    static var TextOnContainerColorTertiary: Color { get }
    static var BackgroundContainerColorWhite: Color { get }
    static var BackgroundContainerColorGreige: Color { get }
    static var BackgroundSurfaceColorGreige: Color { get }
    static var BackgroundContainerColorTransparent05: Color { get }
    static var BorderRadiusSm: CGFloat { get }
    static var BorderRadiusLg: CGFloat { get }
    static var BorderRadiusXl: CGFloat { get }
}

extension TokensSemanticLight: DSNativeTabTokenSemanticProtocol {}
extension TokensSemanticDark: DSNativeTabTokenSemanticProtocol {}

// MARK: - Preview

@available(iOS 26.0, *)
#Preview {
    DSNativeTabsView()
}
