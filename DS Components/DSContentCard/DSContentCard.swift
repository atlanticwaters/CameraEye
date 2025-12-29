import SwiftUI

// MARK: - DSContentCardBodyPlacement

/// Body placement options for DSContentCard matching Figma specs.
public enum DSContentCardBodyPlacement: CaseIterable, Sendable {
    /// Body appears first with padding
    case firstWithPadding
    /// Body appears first with full bleed (no padding)
    case firstFullBleed
    /// Body appears second with padding
    case secondWithPadding
    /// Body appears second with full bleed (no padding)
    case secondFullBleed

    var bodyFirst: Bool {
        switch self {
        case .firstWithPadding, .firstFullBleed:
            return true
        case .secondWithPadding, .secondFullBleed:
            return false
        }
    }

    var isFullBleed: Bool {
        switch self {
        case .firstFullBleed, .secondFullBleed:
            return true
        case .firstWithPadding, .secondWithPadding:
            return false
        }
    }
}

// MARK: - DSContentCard

/// A content card component for displaying rich content with title, body, and actions.
///
/// DSContentCard is used for displaying promotional content, feature highlights,
/// or any content that needs a structured layout with optional header, body, and actions.
///
/// Example usage:
/// ```swift
/// // Simple content card
/// DSContentCard(
///     title: "Featured Product",
///     subtitle: "Limited time offer"
/// ) {
///     Image("promo")
///         .resizable()
///         .aspectRatio(contentMode: .fill)
/// }
///
/// // Content card with actions
/// DSContentCard(
///     title: "New Arrivals",
///     subtitle: "Check out what's new",
///     leadingIcon: Image(systemName: "star.fill"),
///     headerAction: {
///         Button("See All") { }
///     },
///     bottomAction: {
///         Button("Shop Now") { }
///     }
/// ) {
///     Text("Body content here")
/// }
/// ```
public struct DSContentCard<Body: View, HeaderAction: View, BottomAction: View>: View {
    // MARK: - Properties

    private let title: String?
    private let subtitle: String?
    private let leadingIcon: Image?
    private let bodyPlacement: DSContentCardBodyPlacement
    private let showTitle: Bool
    private let showBody: Bool
    private let showBottomAction: Bool
    private let headerAction: HeaderAction?
    private let bottomAction: BottomAction?
    private let body: Body

    // MARK: - Styling

    private var backgroundColor: Color {
        DSContentCardColorHelper.backgroundColor()
    }

    private var titleColor: Color {
        DSContentCardColorHelper.titleColor()
    }

    private var subtitleColor: Color {
        DSContentCardColorHelper.subtitleColor()
    }

    private var iconColor: Color {
        DSContentCardColorHelper.iconColor()
    }

    private let cornerRadius: CGFloat = CGFloat(TokensSemanticLight.BorderRadiusXl)
    private let contentPadding: CGFloat = 16
    private let spacing: CGFloat = 12

    // MARK: - Initializers

    /// Creates a content card with all options.
    /// - Parameters:
    ///   - title: The title text.
    ///   - subtitle: Optional subtitle text.
    ///   - leadingIcon: Optional icon displayed before the title.
    ///   - bodyPlacement: Where to place the body content.
    ///   - showTitle: Whether to show the title section.
    ///   - showBody: Whether to show the body content.
    ///   - showBottomAction: Whether to show bottom action.
    ///   - headerAction: Optional action view in the header.
    ///   - bottomAction: Optional action view at the bottom.
    ///   - body: The body content view.
    public init(
        title: String? = nil,
        subtitle: String? = nil,
        leadingIcon: Image? = nil,
        bodyPlacement: DSContentCardBodyPlacement = .secondWithPadding,
        showTitle: Bool = true,
        showBody: Bool = true,
        showBottomAction: Bool = false,
        @ViewBuilder headerAction: () -> HeaderAction,
        @ViewBuilder bottomAction: () -> BottomAction,
        @ViewBuilder body: () -> Body
    ) {
        self.title = title
        self.subtitle = subtitle
        self.leadingIcon = leadingIcon
        self.bodyPlacement = bodyPlacement
        self.showTitle = showTitle
        self.showBody = showBody
        self.showBottomAction = showBottomAction
        self.headerAction = headerAction()
        self.bottomAction = bottomAction()
        self.body = body()
    }

    // MARK: - Body

    public var body: some View {
        VStack(spacing: 0) {
            if bodyPlacement.bodyFirst {
                bodySection
                titleSection
            } else {
                titleSection
                bodySection
            }

            bottomActionSection
        }
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 2)
    }

    // MARK: - Sections

    @ViewBuilder
    private var titleSection: some View {
        if showTitle, title != nil || subtitle != nil {
            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 8) {
                    // Leading icon and title
                    HStack(spacing: 8) {
                        if let leadingIcon {
                            leadingIcon
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                                .foregroundColor(iconColor)
                        }

                        if let title {
                            Text(title)
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(titleColor)
                        }
                    }

                    Spacer()

                    // Header action
                    if let headerAction {
                        headerAction
                    }
                }

                // Subtitle
                if let subtitle {
                    Text(subtitle)
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(subtitleColor)
                }
            }
            .padding(contentPadding)
        }
    }

    @ViewBuilder
    private var bodySection: some View {
        if showBody {
            if bodyPlacement.isFullBleed {
                self.body
            } else {
                self.body
                    .padding(.horizontal, contentPadding)
                    .padding(.vertical, spacing)
            }
        }
    }

    @ViewBuilder
    private var bottomActionSection: some View {
        if showBottomAction, let bottomAction {
            bottomAction
                .padding(contentPadding)
        }
    }
}

// MARK: - Convenience Initializers

extension DSContentCard where HeaderAction == EmptyView {
    /// Creates a content card without header action.
    public init(
        title: String? = nil,
        subtitle: String? = nil,
        leadingIcon: Image? = nil,
        bodyPlacement: DSContentCardBodyPlacement = .secondWithPadding,
        showTitle: Bool = true,
        showBody: Bool = true,
        showBottomAction: Bool = false,
        @ViewBuilder bottomAction: () -> BottomAction,
        @ViewBuilder body: () -> Body
    ) {
        self.title = title
        self.subtitle = subtitle
        self.leadingIcon = leadingIcon
        self.bodyPlacement = bodyPlacement
        self.showTitle = showTitle
        self.showBody = showBody
        self.showBottomAction = showBottomAction
        self.headerAction = nil
        self.bottomAction = bottomAction()
        self.body = body()
    }
}

extension DSContentCard where BottomAction == EmptyView {
    /// Creates a content card without bottom action.
    public init(
        title: String? = nil,
        subtitle: String? = nil,
        leadingIcon: Image? = nil,
        bodyPlacement: DSContentCardBodyPlacement = .secondWithPadding,
        showTitle: Bool = true,
        showBody: Bool = true,
        @ViewBuilder headerAction: () -> HeaderAction,
        @ViewBuilder body: () -> Body
    ) {
        self.title = title
        self.subtitle = subtitle
        self.leadingIcon = leadingIcon
        self.bodyPlacement = bodyPlacement
        self.showTitle = showTitle
        self.showBody = showBody
        self.showBottomAction = false
        self.headerAction = headerAction()
        self.bottomAction = nil
        self.body = body()
    }
}

extension DSContentCard where HeaderAction == EmptyView, BottomAction == EmptyView {
    /// Creates a simple content card without actions.
    public init(
        title: String? = nil,
        subtitle: String? = nil,
        leadingIcon: Image? = nil,
        bodyPlacement: DSContentCardBodyPlacement = .secondWithPadding,
        showTitle: Bool = true,
        showBody: Bool = true,
        @ViewBuilder body: () -> Body
    ) {
        self.title = title
        self.subtitle = subtitle
        self.leadingIcon = leadingIcon
        self.bodyPlacement = bodyPlacement
        self.showTitle = showTitle
        self.showBody = showBody
        self.showBottomAction = false
        self.headerAction = nil
        self.bottomAction = nil
        self.body = body()
    }
}
