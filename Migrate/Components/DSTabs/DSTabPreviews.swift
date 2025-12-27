import SwiftUI

// MARK: - Size Previews

#Preview("Small Size") {
    TabPreviewContainer { selectedId in
        DSTabGroup(
            tabs: sampleTabs,
            selectedTabId: selectedId,
            size: .small
        )
    }
}

#Preview("Medium Size") {
    TabPreviewContainer { selectedId in
        DSTabGroup(
            tabs: sampleTabs,
            selectedTabId: selectedId,
            size: .medium
        )
    }
}

#Preview("Large Size") {
    TabPreviewContainer { selectedId in
        DSTabGroup(
            tabs: sampleTabs,
            selectedTabId: selectedId,
            size: .large
        )
    }
}

// MARK: - Style Previews

#Preview("Ghost Style") {
    TabPreviewContainer { selectedId in
        DSTabGroup(
            tabs: sampleTabs,
            selectedTabId: selectedId,
            size: .medium,
            style: .ghost
        )
    }
}

#Preview("Black 5% Style") {
    TabPreviewContainer { selectedId in
        DSTabGroup(
            tabs: sampleTabs,
            selectedTabId: selectedId,
            size: .medium,
            style: .black5
        )
    }
}

// MARK: - With Icons

#Preview("With Leading Icons") {
    TabPreviewContainer { selectedId in
        DSTabGroup(
            tabs: sampleTabsWithIcons,
            selectedTabId: selectedId,
            size: .medium
        )
    }
}

// MARK: - Scrollable

#Preview("Scrollable Tabs") {
    TabPreviewContainer { selectedId in
        DSTabGroup(
            tabs: manyTabs,
            selectedTabId: selectedId,
            size: .medium,
            isScrollable: true
        )
    }
}

// MARK: - All Sizes Comparison

#Preview("All Sizes") {
    VStack(spacing: 24) {
        ForEach(DSTabSize.allCases, id: \.self) { size in
            VStack(alignment: .leading, spacing: 8) {
                Text(sizeName(size))
                    .font(.caption)
                    .foregroundStyle(.secondary)

                TabPreviewContainer { selectedId in
                    DSTabGroup(
                        tabs: sampleTabs,
                        selectedTabId: selectedId,
                        size: size
                    )
                }
            }
        }
    }
    .padding()
}

// MARK: - Dark Mode

#Preview("Dark Mode") {
    TabPreviewContainer { selectedId in
        DSTabGroup(
            tabs: sampleTabs,
            selectedTabId: selectedId,
            size: .medium
        )
    }
    .preferredColorScheme(.dark)
}

// MARK: - Helper Views

private struct TabPreviewContainer<Content: View>: View {
    @State private var selectedTabId: String = "tab1"
    let content: (Binding<String>) -> Content

    init(@ViewBuilder content: @escaping (Binding<String>) -> Content) {
        self.content = content
    }

    var body: some View {
        content($selectedTabId)
            .padding()
    }
}

// MARK: - Sample Data

private let sampleTabs: [DSTabItem] = [
    DSTabItem(id: "tab1", label: "Products"),
    DSTabItem(id: "tab2", label: "Reviews"),
    DSTabItem(id: "tab3", label: "Details")
]

private let sampleTabsWithIcons: [DSTabItem] = [
    DSTabItem(id: "tab1", label: "Home", icon: Image(systemName: "house")),
    DSTabItem(id: "tab2", label: "Search", icon: Image(systemName: "magnifyingglass")),
    DSTabItem(id: "tab3", label: "Cart", icon: Image(systemName: "cart"))
]

private let manyTabs: [DSTabItem] = [
    DSTabItem(id: "tab1", label: "Overview"),
    DSTabItem(id: "tab2", label: "Features"),
    DSTabItem(id: "tab3", label: "Specs"),
    DSTabItem(id: "tab4", label: "Reviews"),
    DSTabItem(id: "tab5", label: "Q&A"),
    DSTabItem(id: "tab6", label: "Accessories"),
    DSTabItem(id: "tab7", label: "Related")
]

private func sizeName(_ size: DSTabSize) -> String {
    switch size {
    case .small: return "Small"
    case .medium: return "Medium"
    case .large: return "Large"
    }
}
