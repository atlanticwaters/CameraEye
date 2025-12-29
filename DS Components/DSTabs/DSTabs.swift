import SwiftUI

// MARK: - DSTabSize

/// Size variants for DSTabs matching Figma specs.
public enum DSTabSize: CaseIterable, Sendable {
    /// Small size (22dp height)
    case small
    /// Medium size (36dp height)
    case medium
    /// Large size (44dp height)
    case large

    var height: CGFloat {
        switch self {
        case .small: return 22
        case .medium: return 36
        case .large: return 44
        }
    }

    var fontSize: CGFloat {
        switch self {
        case .small: return 12
        case .medium: return 14
        case .large: return 16
        }
    }

    var iconSize: CGFloat {
        switch self {
        case .small: return 12
        case .medium: return 16
        case .large: return 18
        }
    }

    var horizontalPadding: CGFloat {
        switch self {
        case .small: return 8
        case .medium: return 12
        case .large: return 16
        }
    }

    var spacing: CGFloat {
        switch self {
        case .small: return 4
        case .medium: return 6
        case .large: return 8
        }
    }

    var indicatorHeight: CGFloat {
        switch self {
        case .small: return 2
        case .medium: return 2
        case .large: return 3
        }
    }
}

// MARK: - DSTabStyle

/// Style variants for DSTabs matching Figma specs.
public enum DSTabStyle: CaseIterable, Sendable {
    /// Ghost style with transparent background
    case ghost
    /// Black 5% background style
    case black5
}

// MARK: - DSTabItem

/// Represents a single tab item in a tab group.
public struct DSTabItem: Identifiable, Equatable, Sendable {
    public let id: String
    public let label: String
    public let icon: Image?

    public init(id: String = UUID().uuidString, label: String, icon: Image? = nil) {
        self.id = id
        self.label = label
        self.icon = icon
    }

    public static func == (lhs: DSTabItem, rhs: DSTabItem) -> Bool {
        lhs.id == rhs.id
    }
}

// MARK: - DSTab

/// A single tab button component.
///
/// DSTab is typically used within a DSTabGroup, but can also be used standalone.
public struct DSTab: View {
    // MARK: - Properties

    private let item: DSTabItem
    private let size: DSTabSize
    private let style: DSTabStyle
    private let isSelected: Bool
    private let isDisabled: Bool
    private let action: () -> Void

    // MARK: - Styling

    private var backgroundColor: Color {
        DSTabColorHelper.backgroundColor(style: style, isSelected: isSelected, isDisabled: isDisabled)
    }

    private var textColor: Color {
        DSTabColorHelper.textColor(isSelected: isSelected, isDisabled: isDisabled)
    }

    private var indicatorColor: Color {
        DSTabColorHelper.indicatorColor()
    }

    // MARK: - Initializers

    /// Creates a single tab.
    /// - Parameters:
    ///   - item: The tab item data.
    ///   - size: The size of the tab.
    ///   - style: The visual style.
    ///   - isSelected: Whether the tab is selected.
    ///   - isDisabled: Whether the tab is disabled.
    ///   - action: Action to perform when tapped.
    public init(
        item: DSTabItem,
        size: DSTabSize = .medium,
        style: DSTabStyle = .ghost,
        isSelected: Bool = false,
        isDisabled: Bool = false,
        action: @escaping () -> Void
    ) {
        self.item = item
        self.size = size
        self.style = style
        self.isSelected = isSelected
        self.isDisabled = isDisabled
        self.action = action
    }

    // MARK: - Body

    public var body: some View {
        Button(action: action) {
            VStack(spacing: 0) {
                // Tab content
                HStack(spacing: size.spacing) {
                    if let icon = item.icon {
                        icon
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: size.iconSize, height: size.iconSize)
                            .foregroundColor(textColor)
                    }

                    Text(item.label)
                        .font(.system(size: size.fontSize, weight: isSelected ? .semibold : .regular))
                        .foregroundColor(textColor)
                }
                .padding(.horizontal, size.horizontalPadding)
                .frame(height: size.height - size.indicatorHeight)

                // Selection indicator
                Rectangle()
                    .fill(isSelected ? indicatorColor : Color.clear)
                    .frame(height: size.indicatorHeight)
            }
            .background(backgroundColor)
        }
        .buttonStyle(TabButtonStyle())
        .disabled(isDisabled)
        .accessibilityElement(children: .combine)
        .accessibilityLabel(Text(item.label))
        .accessibilityAddTraits(isSelected ? .isSelected : [])
        .accessibilityAddTraits(.isButton)
    }
}

// MARK: - DSTabGroup

/// A horizontal group of tabs for navigation.
///
/// DSTabGroup manages a collection of tabs and handles selection state.
///
/// Example usage:
/// ```swift
/// let tabs = [
///     DSTabItem(label: "Products"),
///     DSTabItem(label: "Reviews"),
///     DSTabItem(label: "Details")
/// ]
///
/// DSTabGroup(
///     tabs: tabs,
///     selectedTabId: $selectedTabId,
///     size: .medium
/// )
/// ```
public struct DSTabGroup: View {
    // MARK: - Properties

    private let tabs: [DSTabItem]
    @Binding private var selectedTabId: String
    private let size: DSTabSize
    private let style: DSTabStyle
    private let isScrollable: Bool

    // MARK: - Initializers

    /// Creates a tab group.
    /// - Parameters:
    ///   - tabs: Array of tab items.
    ///   - selectedTabId: Binding to the selected tab ID.
    ///   - size: The size of the tabs.
    ///   - style: The visual style.
    ///   - isScrollable: Whether the tabs can scroll horizontally.
    public init(
        tabs: [DSTabItem],
        selectedTabId: Binding<String>,
        size: DSTabSize = .medium,
        style: DSTabStyle = .ghost,
        isScrollable: Bool = false
    ) {
        self.tabs = tabs
        self._selectedTabId = selectedTabId
        self.size = size
        self.style = style
        self.isScrollable = isScrollable
    }

    // MARK: - Body

    public var body: some View {
        if isScrollable {
            ScrollView(.horizontal, showsIndicators: false) {
                tabsContent
            }
        } else {
            tabsContent
        }
    }

    @ViewBuilder
    private var tabsContent: some View {
        HStack(spacing: 0) {
            ForEach(tabs) { tab in
                DSTab(
                    item: tab,
                    size: size,
                    style: style,
                    isSelected: tab.id == selectedTabId
                ) {
                    selectedTabId = tab.id
                }
            }
        }
        .background(dividerLine, alignment: .bottom)
    }

    private var dividerLine: some View {
        Rectangle()
            .fill(DSTabColorHelper.dividerColor())
            .frame(height: 1)
    }
}

// MARK: - TabButtonStyle

/// Custom button style for tabs.
private struct TabButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.7 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}
