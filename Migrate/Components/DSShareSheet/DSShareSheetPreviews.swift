import SwiftUI

// MARK: - Previews

#Preview("Full Share Sheet") {
    VStack {
        Spacer()
        DSShareSheet(
            data: DSShareSheetData(
                title: "Share Product",
                subtitle: "DEWALT 20V MAX Cordless Drill/Driver Kit",
                shareActions: [
                    .copyLink(),
                    .messages(),
                    .mail(),
                    .airdrop(),
                    .notes(),
                    .more(),
                ],
                actionRows: [
                    .save(),
                    .addToList(),
                    .compare(),
                    .print(),
                    .shareFeedback(),
                ]
            )
        )
    }
    .background(Color.black.opacity(0.3))
}

#Preview("Share Actions Only") {
    VStack {
        Spacer()
        DSShareSheet(
            data: DSShareSheetData(
                title: "Share",
                shareActions: [
                    .copyLink(),
                    .messages(),
                    .mail(),
                    .more(),
                ]
            )
        )
    }
    .background(Color.black.opacity(0.3))
}

#Preview("Action Rows Only") {
    VStack {
        Spacer()
        DSShareSheet(
            data: DSShareSheetData(
                title: "Product Options",
                actionRows: [
                    .save(),
                    .addToList(),
                    .compare(),
                    .report(),
                ]
            )
        )
    }
    .background(Color.black.opacity(0.3))
}

#Preview("Minimal Sheet") {
    VStack {
        Spacer()
        DSShareSheet(
            data: DSShareSheetData(
                shareActions: [
                    .copyLink(),
                    .messages(),
                ]
            )
        )
    }
    .background(Color.black.opacity(0.3))
}

#Preview("With Destructive Action") {
    VStack {
        Spacer()
        DSShareSheet(
            data: DSShareSheetData(
                title: "Options",
                subtitle: "Choose an action",
                actionRows: [
                    .save(),
                    .addToList(),
                    DSShareSheetAction(
                        id: "delete",
                        icon: Image(systemName: "trash"),
                        label: "Delete",
                        isDestructive: true
                    ),
                ]
            )
        )
    }
    .background(Color.black.opacity(0.3))
}

#Preview("Many Share Actions") {
    VStack {
        Spacer()
        DSShareSheet(
            data: DSShareSheetData(
                title: "Share With",
                shareActions: [
                    .copyLink(),
                    .messages(),
                    .mail(),
                    .airdrop(),
                    .notes(),
                    .reminders(),
                    DSShareAction(
                        id: "twitter",
                        icon: Image(systemName: "bird"),
                        label: "Twitter",
                        iconBackgroundColor: .blue
                    ),
                    DSShareAction(
                        id: "facebook",
                        icon: Image(systemName: "hand.thumbsup.fill"),
                        label: "Facebook",
                        iconBackgroundColor: .indigo
                    ),
                    .more(),
                ]
            )
        )
    }
    .background(Color.black.opacity(0.3))
}

#Preview("Custom Actions") {
    VStack {
        Spacer()
        DSShareSheet(
            data: DSShareSheetData(
                title: "Project Actions",
                subtitle: "Kitchen Remodel Project",
                shareActions: [
                    DSShareAction(
                        id: "addPhoto",
                        icon: Image(systemName: "camera.fill"),
                        label: "Add Photo"
                    ),
                    DSShareAction(
                        id: "scan",
                        icon: Image(systemName: "barcode.viewfinder"),
                        label: "Scan Item"
                    ),
                    .copyLink(),
                ],
                actionRows: [
                    DSShareSheetAction(
                        id: "editProject",
                        icon: Image(systemName: "pencil"),
                        label: "Edit Project"
                    ),
                    DSShareSheetAction(
                        id: "duplicate",
                        icon: Image(systemName: "doc.on.doc"),
                        label: "Duplicate"
                    ),
                    DSShareSheetAction(
                        id: "archive",
                        icon: Image(systemName: "archivebox"),
                        label: "Archive"
                    ),
                ]
            )
        )
    }
    .background(Color.black.opacity(0.3))
}

#Preview("Title Only") {
    VStack {
        Spacer()
        DSShareSheet(
            data: DSShareSheetData(
                title: "Share This Item",
                shareActions: [
                    .copyLink(),
                    .messages(),
                    .mail(),
                ]
            )
        )
    }
    .background(Color.black.opacity(0.3))
}
