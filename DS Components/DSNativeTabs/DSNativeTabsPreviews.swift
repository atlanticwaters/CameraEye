import SwiftUI

// MARK: - DSNativeTabs Previews

/// Preview collection for iOS 26 native tab components and patterns.

// MARK: - Basic Tab Bar Preview

@available(iOS 26.0, *)
#Preview("Basic Tab Bar") {
    struct PreviewWrapper: View {
        @State private var selectedTab = 0

        var body: some View {
            TabView(selection: $selectedTab) {
                Tab("Home", systemImage: "house", value: 0) {
                    NavigationStack {
                        ScrollView {
                            VStack(spacing: 16) {
                                ForEach(0..<30) { index in
                                    RoundedRectangle(cornerRadius: 12)
                                        .fill(.regularMaterial)
                                        .frame(height: 80)
                                        .overlay {
                                            Text("Item \(index)")
                                        }
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

                Tab("Profile", systemImage: "person", value: 2) {
                    NavigationStack {
                        Text("Profile Content")
                            .navigationTitle("Profile")
                    }
                }
            }
            .tabBarMinimizeBehavior(.onScrollDown)
        }
    }

    return PreviewWrapper()
}

// MARK: - Search Tab Role Preview

@available(iOS 26.0, *)
#Preview("Search Tab Role") {
    struct PreviewWrapper: View {
        @State private var selectedTab = 0
        @State private var searchText = ""

        var body: some View {
            TabView(selection: $selectedTab) {
                Tab("Home", systemImage: "house", value: 0) {
                    NavigationStack {
                        List {
                            ForEach(0..<20) { index in
                                Text("Home Item \(index)")
                            }
                        }
                        .navigationTitle("Home")
                    }
                }

                Tab("Library", systemImage: "books.vertical", value: 1) {
                    NavigationStack {
                        Text("Library Content")
                            .navigationTitle("Library")
                    }
                }

                Tab("Search", systemImage: "magnifyingglass", value: 2, role: .search) {
                    NavigationStack {
                        List {
                            if searchText.isEmpty {
                                Text("Start typing to search...")
                                    .foregroundStyle(.secondary)
                            } else {
                                ForEach(0..<10) { index in
                                    Text("Result for '\(searchText)' - \(index)")
                                }
                            }
                        }
                        .navigationTitle("Search")
                    }
                }
            }
            .searchable(text: $searchText)
            .tabBarMinimizeBehavior(.onScrollDown)
        }
    }

    return PreviewWrapper()
}

// MARK: - Bottom Accessory Preview

@available(iOS 26.0, *)
#Preview("Bottom Accessory") {
    struct PreviewWrapper: View {
        @State private var selectedTab = 0
        @State private var isPlaying = true

        var body: some View {
            TabView(selection: $selectedTab) {
                Tab("Listen Now", systemImage: "play.circle", value: 0) {
                    NavigationStack {
                        ScrollView {
                            VStack(spacing: 16) {
                                ForEach(0..<20) { index in
                                    HStack {
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(.regularMaterial)
                                            .frame(width: 60, height: 60)

                                        VStack(alignment: .leading) {
                                            Text("Track \(index)")
                                                .bold()
                                            Text("Artist Name")
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
                            .padding()
                        }
                        .navigationTitle("Listen Now")
                    }
                }

                Tab("Library", systemImage: "music.note.list", value: 1) {
                    NavigationStack {
                        Text("Library Content")
                            .navigationTitle("Library")
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
            .tabViewBottomAccessory {
                HStack(spacing: 12) {
                    RoundedRectangle(cornerRadius: 6)
                        .fill(.regularMaterial)
                        .frame(width: 40, height: 40)
                        .overlay {
                            Image(systemName: "music.note")
                        }

                    VStack(alignment: .leading, spacing: 2) {
                        Text("Current Song")
                            .font(.caption)
                            .bold()
                        Text("Artist Name")
                            .font(.caption2)
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
    }

    return PreviewWrapper()
}

// MARK: - Sidebar Adaptable Preview

@available(iOS 26.0, *)
#Preview("Sidebar Adaptable") {
    struct PreviewWrapper: View {
        @State private var selectedTab = 0

        var body: some View {
            TabView(selection: $selectedTab) {
                Tab("Home", systemImage: "house", value: 0) {
                    NavigationStack {
                        Text("Home Content")
                            .navigationTitle("Home")
                    }
                }

                Tab("Browse", systemImage: "square.grid.2x2", value: 1) {
                    NavigationStack {
                        Text("Browse Content")
                            .navigationTitle("Browse")
                    }
                }

                Tab("Library", systemImage: "books.vertical", value: 2) {
                    NavigationStack {
                        Text("Library Content")
                            .navigationTitle("Library")
                    }
                }

                Tab("Settings", systemImage: "gear", value: 3) {
                    NavigationStack {
                        Text("Settings Content")
                            .navigationTitle("Settings")
                    }
                }
            }
            .tabViewStyle(.sidebarAdaptable)
        }
    }

    return PreviewWrapper()
}

// MARK: - With Badges Preview

@available(iOS 26.0, *)
#Preview("Tab Badges") {
    struct PreviewWrapper: View {
        @State private var selectedTab = 0

        var body: some View {
            TabView(selection: $selectedTab) {
                Tab("Inbox", systemImage: "envelope", value: 0) {
                    NavigationStack {
                        Text("Inbox Content")
                            .navigationTitle("Inbox")
                    }
                }
                .badge(5)

                Tab("Cart", systemImage: "cart", value: 1) {
                    NavigationStack {
                        Text("Cart Content")
                            .navigationTitle("Cart")
                    }
                }
                .badge(3)

                Tab("Notifications", systemImage: "bell", value: 2) {
                    NavigationStack {
                        Text("Notifications Content")
                            .navigationTitle("Notifications")
                    }
                }
                .badge("New")

                Tab("Profile", systemImage: "person", value: 3) {
                    NavigationStack {
                        Text("Profile Content")
                            .navigationTitle("Profile")
                    }
                }
            }
            .tabBarMinimizeBehavior(.onScrollDown)
        }
    }

    return PreviewWrapper()
}

// MARK: - Glass Effect Button Preview

@available(iOS 26.0, *)
#Preview("Glass Effect Button") {
    struct PreviewWrapper: View {
        var body: some View {
            ZStack {
                LinearGradient(
                    colors: [.blue, .purple],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()

                VStack(spacing: 20) {
                    Text("Liquid Glass Buttons")
                        .font(.title2)
                        .bold()
                        .foregroundStyle(.white)

                    HStack(spacing: 16) {
                        Button {} label: {
                            Label("Add", systemImage: "plus")
                                .bold()
                                .padding()
                        }
                        .glassEffect(.regular.interactive())

                        Button {} label: {
                            Label("Share", systemImage: "square.and.arrow.up")
                                .bold()
                                .padding()
                        }
                        .glassEffect(.regular.interactive())
                    }

                    Button {} label: {
                        Label("Full Width Action", systemImage: "arrow.right")
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding()
                    }
                    .glassEffect(.regular.interactive())
                    .padding(.horizontal)
                }
            }
        }
    }

    return PreviewWrapper()
}

// MARK: - Minimize Behaviors Comparison Preview

@available(iOS 26.0, *)
#Preview("Minimize Behaviors") {
    struct PreviewWrapper: View {
        @State private var selectedTab = 0
        @State private var behavior: TabBarMinimizeBehavior = .onScrollDown

        var body: some View {
            VStack(spacing: 0) {
                Picker("Behavior", selection: $behavior) {
                    Text("Never").tag(TabBarMinimizeBehavior.never)
                    Text("On Scroll").tag(TabBarMinimizeBehavior.onScrollDown)
                }
                .pickerStyle(.segmented)
                .padding()

                TabView(selection: $selectedTab) {
                    Tab("Home", systemImage: "house", value: 0) {
                        NavigationStack {
                            ScrollView {
                                VStack(spacing: 12) {
                                    Text("Scroll to see tab bar behavior")
                                        .foregroundStyle(.secondary)
                                        .padding()

                                    ForEach(0..<40) { index in
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(.regularMaterial)
                                            .frame(height: 60)
                                            .overlay {
                                                Text("Item \(index)")
                                            }
                                    }
                                }
                                .padding()
                            }
                            .navigationTitle("Home")
                        }
                    }

                    Tab("Settings", systemImage: "gear", value: 1) {
                        NavigationStack {
                            Text("Settings Content")
                                .navigationTitle("Settings")
                        }
                    }
                }
                .tabBarMinimizeBehavior(behavior)
            }
        }
    }

    return PreviewWrapper()
}

// MARK: - E-Commerce App Preview

@available(iOS 26.0, *)
#Preview("E-Commerce App") {
    struct PreviewWrapper: View {
        @State private var selectedTab = 0
        @State private var searchText = ""

        var body: some View {
            TabView(selection: $selectedTab) {
                Tab("Shop", systemImage: "storefront", value: 0) {
                    NavigationStack {
                        ScrollView {
                            LazyVGrid(columns: [.init(.flexible()), .init(.flexible())], spacing: 16) {
                                ForEach(0..<20) { index in
                                    VStack {
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(.regularMaterial)
                                            .aspectRatio(1, contentMode: .fit)

                                        Text("Product \(index)")
                                            .font(.caption)

                                        Text("$\(index * 10 + 99)")
                                            .font(.caption)
                                            .bold()
                                    }
                                }
                            }
                            .padding()
                        }
                        .navigationTitle("Shop")
                    }
                }

                Tab("Categories", systemImage: "square.grid.2x2", value: 1) {
                    NavigationStack {
                        List {
                            ForEach(["Electronics", "Clothing", "Home", "Sports", "Books"], id: \.self) { category in
                                Text(category)
                            }
                        }
                        .navigationTitle("Categories")
                    }
                }

                Tab("Cart", systemImage: "cart", value: 2) {
                    NavigationStack {
                        Text("Your cart is empty")
                            .foregroundStyle(.secondary)
                            .navigationTitle("Cart")
                    }
                }
                .badge(3)

                Tab("Account", systemImage: "person", value: 3) {
                    NavigationStack {
                        List {
                            Text("Orders")
                            Text("Wishlist")
                            Text("Settings")
                            Text("Help")
                        }
                        .navigationTitle("Account")
                    }
                }

                Tab("Search", systemImage: "magnifyingglass", value: 4, role: .search) {
                    NavigationStack {
                        List {
                            if searchText.isEmpty {
                                Section("Recent Searches") {
                                    Text("iPhone case")
                                    Text("Headphones")
                                    Text("Charger")
                                }
                            } else {
                                ForEach(0..<10) { index in
                                    Text("Result: \(searchText) - \(index)")
                                }
                            }
                        }
                        .navigationTitle("Search")
                    }
                }
            }
            .searchable(text: $searchText)
            .tabBarMinimizeBehavior(.onScrollDown)
        }
    }

    return PreviewWrapper()
}

// MARK: - Full App Example Preview

@available(iOS 26.0, *)
#Preview("Full App Example") {
    struct PreviewWrapper: View {
        @State private var selectedTab = 0
        @State private var searchText = ""
        @State private var isPlaying = false

        var body: some View {
            TabView(selection: $selectedTab) {
                Tab("Home", systemImage: "house", value: 0) {
                    NavigationStack {
                        ScrollView {
                            VStack(alignment: .leading, spacing: 24) {
                                // Featured section
                                VStack(alignment: .leading, spacing: 12) {
                                    Text("Featured")
                                        .font(.title2)
                                        .bold()

                                    ScrollView(.horizontal) {
                                        HStack(spacing: 16) {
                                            ForEach(0..<5) { index in
                                                RoundedRectangle(cornerRadius: 16)
                                                    .fill(.regularMaterial)
                                                    .frame(width: 280, height: 160)
                                                    .overlay {
                                                        Text("Featured \(index)")
                                                    }
                                            }
                                        }
                                    }
                                    .scrollIndicators(.hidden)
                                }

                                // Recent section
                                VStack(alignment: .leading, spacing: 12) {
                                    Text("Recent")
                                        .font(.title2)
                                        .bold()

                                    ForEach(0..<10) { index in
                                        HStack {
                                            RoundedRectangle(cornerRadius: 8)
                                                .fill(.regularMaterial)
                                                .frame(width: 60, height: 60)

                                            VStack(alignment: .leading) {
                                                Text("Item \(index)")
                                                    .bold()
                                                Text("Subtitle")
                                                    .foregroundStyle(.secondary)
                                            }

                                            Spacer()
                                        }
                                    }
                                }
                            }
                            .padding()
                        }
                        .navigationTitle("Home")
                    }
                }

                Tab("Browse", systemImage: "square.grid.2x2", value: 1) {
                    NavigationStack {
                        List {
                            ForEach(0..<20) { index in
                                Text("Category \(index)")
                            }
                        }
                        .navigationTitle("Browse")
                    }
                }

                Tab("Library", systemImage: "books.vertical", value: 2) {
                    NavigationStack {
                        List {
                            ForEach(0..<15) { index in
                                Text("Saved Item \(index)")
                            }
                        }
                        .navigationTitle("Library")
                    }
                }

                Tab("Search", systemImage: "magnifyingglass", value: 3, role: .search) {
                    NavigationStack {
                        List {
                            if searchText.isEmpty {
                                Text("Search for content...")
                                    .foregroundStyle(.secondary)
                            } else {
                                ForEach(0..<10) { index in
                                    Text("'\(searchText)' result \(index)")
                                }
                            }
                        }
                        .navigationTitle("Search")
                    }
                }
            }
            .searchable(text: $searchText)
            .tabBarMinimizeBehavior(.onScrollDown)
            .tabViewBottomAccessory {
                HStack(spacing: 12) {
                    RoundedRectangle(cornerRadius: 6)
                        .fill(.regularMaterial)
                        .frame(width: 36, height: 36)
                        .overlay {
                            Image(systemName: "play.circle.fill")
                        }

                    VStack(alignment: .leading, spacing: 2) {
                        Text("Now Playing")
                            .font(.caption)
                            .bold()
                        Text("Tap to expand")
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                    }

                    Spacer()

                    Button {
                        isPlaying.toggle()
                    } label: {
                        Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                    }
                }
                .padding(.horizontal)
            }
        }
    }

    return PreviewWrapper()
}
