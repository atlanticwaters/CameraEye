import SwiftUI

// MARK: - DSShareAction

/// A share action displayed in the horizontal scroll row.
public struct DSShareAction: Identifiable, Equatable, Sendable {
    public let id: String
    public let icon: Image
    public let label: String
    public let iconBackgroundColor: Color?

    public init(
        id: String = UUID().uuidString,
        icon: Image,
        label: String,
        iconBackgroundColor: Color? = nil
    ) {
        self.id = id
        self.icon = icon
        self.label = label
        self.iconBackgroundColor = iconBackgroundColor
    }

    // MARK: - Factory Methods

    /// Creates a Copy Link action.
    public static func copyLink() -> DSShareAction {
        DSShareAction(
            id: "copyLink",
            icon: Image(systemName: "link"),
            label: "Copy Link"
        )
    }

    /// Creates a Messages action.
    public static func messages() -> DSShareAction {
        DSShareAction(
            id: "messages",
            icon: Image(systemName: "message.fill"),
            label: "Messages",
            iconBackgroundColor: Color.green
        )
    }

    /// Creates a Mail action.
    public static func mail() -> DSShareAction {
        DSShareAction(
            id: "mail",
            icon: Image(systemName: "envelope.fill"),
            label: "Mail",
            iconBackgroundColor: Color.blue
        )
    }

    /// Creates an AirDrop action.
    public static func airdrop() -> DSShareAction {
        DSShareAction(
            id: "airdrop",
            icon: Image(systemName: "airplayaudio"),
            label: "AirDrop",
            iconBackgroundColor: Color.blue
        )
    }

    /// Creates a More action.
    public static func more() -> DSShareAction {
        DSShareAction(
            id: "more",
            icon: Image(systemName: "ellipsis"),
            label: "More"
        )
    }

    /// Creates a Notes action.
    public static func notes() -> DSShareAction {
        DSShareAction(
            id: "notes",
            icon: Image(systemName: "note.text"),
            label: "Notes",
            iconBackgroundColor: Color.yellow
        )
    }

    /// Creates a Reminders action.
    public static func reminders() -> DSShareAction {
        DSShareAction(
            id: "reminders",
            icon: Image(systemName: "checklist"),
            label: "Reminders",
            iconBackgroundColor: Color.orange
        )
    }
}

// MARK: - DSShareSheetAction

/// An action row displayed in the vertical action list.
public struct DSShareSheetAction: Identifiable, Equatable, Sendable {
    public let id: String
    public let icon: Image
    public let label: String
    public let isDestructive: Bool

    public init(
        id: String = UUID().uuidString,
        icon: Image,
        label: String,
        isDestructive: Bool = false
    ) {
        self.id = id
        self.icon = icon
        self.label = label
        self.isDestructive = isDestructive
    }

    // MARK: - Factory Methods

    /// Creates a Save action.
    public static func save() -> DSShareSheetAction {
        DSShareSheetAction(
            id: "save",
            icon: Image(systemName: "bookmark"),
            label: "Save"
        )
    }

    /// Creates an Add to List action.
    public static func addToList() -> DSShareSheetAction {
        DSShareSheetAction(
            id: "addToList",
            icon: Image(systemName: "list.bullet"),
            label: "Add to List"
        )
    }

    /// Creates a Compare action.
    public static func compare() -> DSShareSheetAction {
        DSShareSheetAction(
            id: "compare",
            icon: Image(systemName: "arrow.left.arrow.right"),
            label: "Compare"
        )
    }

    /// Creates a Print action.
    public static func print() -> DSShareSheetAction {
        DSShareSheetAction(
            id: "print",
            icon: Image(systemName: "printer"),
            label: "Print"
        )
    }

    /// Creates a Report action.
    public static func report() -> DSShareSheetAction {
        DSShareSheetAction(
            id: "report",
            icon: Image(systemName: "exclamationmark.triangle"),
            label: "Report Issue",
            isDestructive: true
        )
    }

    /// Creates a Share Feedback action.
    public static func shareFeedback() -> DSShareSheetAction {
        DSShareSheetAction(
            id: "shareFeedback",
            icon: Image(systemName: "text.bubble"),
            label: "Share Feedback"
        )
    }
}

// MARK: - DSShareSheetData

/// Data model for the share sheet.
public struct DSShareSheetData: Equatable, Sendable {
    public let title: String?
    public let subtitle: String?
    public let shareActions: [DSShareAction]
    public let actionRows: [DSShareSheetAction]

    public init(
        title: String? = nil,
        subtitle: String? = nil,
        shareActions: [DSShareAction] = [],
        actionRows: [DSShareSheetAction] = []
    ) {
        self.title = title
        self.subtitle = subtitle
        self.shareActions = shareActions
        self.actionRows = actionRows
    }
}

// MARK: - Layout Constants

private enum DSShareSheetLayout {
    static let cornerRadius: CGFloat = 16
    static let handleWidth: CGFloat = 36
    static let handleHeight: CGFloat = 4
    static let handleTopPadding: CGFloat = 8
    static let headerPadding: CGFloat = 16
    static let contentPadding: CGFloat = 16
    static let shareActionSize: CGFloat = 60
    static let shareActionIconSize: CGFloat = 28
    static let shareActionSpacing: CGFloat = 16
    static let actionRowHeight: CGFloat = 52
    static let actionRowIconSize: CGFloat = 24
    static let dividerInset: CGFloat = 56
}

// MARK: - DSShareSheet

/// A bottom sheet component for sharing content and performing actions.
///
/// DSShareSheet displays a modal bottom sheet with a drag handle, optional title/subtitle,
/// horizontal scroll row of share actions (like iOS share sheet), and vertical action rows.
///
/// Example usage:
/// ```swift
/// DSShareSheet(
///     data: DSShareSheetData(
///         title: "Share Product",
///         subtitle: "DEWALT 20V MAX Drill",
///         shareActions: [.copyLink(), .messages(), .mail(), .more()],
///         actionRows: [.save(), .addToList(), .compare()]
///     ),
///     onShareAction: { action in
///         print("Share action: \(action.label)")
///     },
///     onAction: { action in
///         print("Action: \(action.label)")
///     },
///     onDismiss: {
///         print("Sheet dismissed")
///     }
/// )
/// ```
public struct DSShareSheet: View {
    // MARK: - Properties

    private let data: DSShareSheetData
    private let onShareAction: ((DSShareAction) -> Void)?
    private let onAction: ((DSShareSheetAction) -> Void)?
    private let onDismiss: (() -> Void)?

    // MARK: - Initializers

    public init(
        data: DSShareSheetData,
        onShareAction: ((DSShareAction) -> Void)? = nil,
        onAction: ((DSShareSheetAction) -> Void)? = nil,
        onDismiss: (() -> Void)? = nil
    ) {
        self.data = data
        self.onShareAction = onShareAction
        self.onAction = onAction
        self.onDismiss = onDismiss
    }

    // MARK: - Body

    public var body: some View {
        VStack(spacing: 0) {
            // Drag Handle
            dragHandle

            // Header (if title or subtitle present)
            if data.title != nil || data.subtitle != nil {
                headerSection
            }

            // Share Actions (horizontal scroll)
            if !data.shareActions.isEmpty {
                shareActionsSection
            }

            // Divider
            if !data.shareActions.isEmpty && !data.actionRows.isEmpty {
                Divider()
                    .padding(.horizontal, DSShareSheetLayout.contentPadding)
            }

            // Action Rows
            if !data.actionRows.isEmpty {
                actionRowsSection
            }

            // Bottom safe area padding
            Spacer()
                .frame(height: 16)
        }
        .background(DSShareSheetColorHelper.backgroundColor())
        .clipShape(
            RoundedCorner(
                radius: DSShareSheetLayout.cornerRadius,
                corners: [.topLeft, .topRight]
            )
        )
    }

    // MARK: - Drag Handle

    @ViewBuilder
    private var dragHandle: some View {
        VStack(spacing: 0) {
            RoundedRectangle(cornerRadius: DSShareSheetLayout.handleHeight / 2)
                .fill(DSShareSheetColorHelper.handleColor())
                .frame(
                    width: DSShareSheetLayout.handleWidth,
                    height: DSShareSheetLayout.handleHeight
                )
                .padding(.top, DSShareSheetLayout.handleTopPadding)
                .padding(.bottom, 8)
        }
    }

    // MARK: - Header Section

    @ViewBuilder
    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            if let title = data.title {
                Text(title)
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundStyle(DSShareSheetColorHelper.titleColor())
            }

            if let subtitle = data.subtitle {
                Text(subtitle)
                    .font(.system(size: 13, weight: .regular))
                    .foregroundStyle(DSShareSheetColorHelper.subtitleColor())
                    .lineLimit(2)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, DSShareSheetLayout.headerPadding)
        .padding(.bottom, DSShareSheetLayout.contentPadding)
    }

    // MARK: - Share Actions Section

    @ViewBuilder
    private var shareActionsSection: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: DSShareSheetLayout.shareActionSpacing) {
                ForEach(data.shareActions) { action in
                    shareActionButton(action: action)
                }
            }
            .padding(.horizontal, DSShareSheetLayout.contentPadding)
        }
        .padding(.bottom, DSShareSheetLayout.contentPadding)
    }

    @ViewBuilder
    private func shareActionButton(action: DSShareAction) -> some View {
        Button {
            onShareAction?(action)
        } label: {
            VStack(spacing: 6) {
                ZStack {
                    Circle()
                        .fill(action.iconBackgroundColor ?? DSShareSheetColorHelper.shareActionBackgroundColor())
                        .frame(
                            width: DSShareSheetLayout.shareActionSize,
                            height: DSShareSheetLayout.shareActionSize
                        )

                    action.icon
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(
                            width: DSShareSheetLayout.shareActionIconSize,
                            height: DSShareSheetLayout.shareActionIconSize
                        )
                        .foregroundStyle(
                            action.iconBackgroundColor != nil
                                ? .white
                                : DSShareSheetColorHelper.shareActionIconColor()
                        )
                }

                Text(action.label)
                    .font(.system(size: 11, weight: .regular))
                    .foregroundStyle(DSShareSheetColorHelper.shareActionLabelColor())
                    .lineLimit(1)
            }
            .frame(width: DSShareSheetLayout.shareActionSize)
        }
        .buttonStyle(.plain)
    }

    // MARK: - Action Rows Section

    @ViewBuilder
    private var actionRowsSection: some View {
        VStack(spacing: 0) {
            ForEach(Array(data.actionRows.enumerated()), id: \.element.id) { index, action in
                actionRow(action: action)

                if index < data.actionRows.count - 1 {
                    Divider()
                        .padding(.leading, DSShareSheetLayout.dividerInset)
                }
            }
        }
    }

    @ViewBuilder
    private func actionRow(action: DSShareSheetAction) -> some View {
        Button {
            onAction?(action)
        } label: {
            HStack(spacing: 16) {
                action.icon
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(
                        width: DSShareSheetLayout.actionRowIconSize,
                        height: DSShareSheetLayout.actionRowIconSize
                    )
                    .foregroundStyle(
                        action.isDestructive
                            ? DSShareSheetColorHelper.destructiveColor()
                            : DSShareSheetColorHelper.actionRowIconColor()
                    )

                Text(action.label)
                    .font(.system(size: 16, weight: .regular))
                    .foregroundStyle(
                        action.isDestructive
                            ? DSShareSheetColorHelper.destructiveColor()
                            : DSShareSheetColorHelper.actionRowLabelColor()
                    )

                Spacer()
            }
            .frame(height: DSShareSheetLayout.actionRowHeight)
            .padding(.horizontal, DSShareSheetLayout.contentPadding)
            .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }
}

// MARK: - RoundedCorner Shape

/// A shape with specific rounded corners.
private struct RoundedCorner: Shape {
    var radius: CGFloat
    var corners: UIRectCorner

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
