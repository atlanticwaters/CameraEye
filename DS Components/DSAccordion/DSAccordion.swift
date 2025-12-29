import SwiftUI

// MARK: - DSAccordionType

/// Type variants for DSAccordion matching Figma specs.
public enum DSAccordionType: CaseIterable, Sendable {
    /// Standard text accordion
    case text
    /// Question-style accordion (FAQ)
    case question
    /// Rating-style accordion
    case rating
    /// Product specifications accordion
    case productSpecs
    /// Product details accordion
    case productDetails
}

// MARK: - DSAccordion

/// An expandable accordion component for displaying collapsible content sections.
///
/// DSAccordion is used for FAQ sections, expandable details, and any content
/// that benefits from a collapsible interface. It supports different types
/// (text, question, rating, productSpecs, productDetails), optional borders, and dividers.
///
/// Example usage:
/// ```swift
/// // Simple accordion
/// DSAccordion(
///     title: "Getting Started",
///     isExpanded: $isExpanded
/// ) {
///     Text("Welcome to the app! Here's how to get started...")
/// }
///
/// // FAQ-style accordion
/// DSAccordion(
///     title: "How do I return an item?",
///     subtitle: "Returns & Refunds",
///     type: .question,
///     isExpanded: $isExpanded
/// ) {
///     Text("You can return items within 90 days...")
/// }
/// ```
public struct DSAccordion<Content: View>: View {
    // MARK: - Properties

    private let title: String
    private let subtitle: String?
    private let type: DSAccordionType
    private let isBorderless: Bool
    private let showDivider: Bool
    @Binding private var isExpanded: Bool
    private let content: Content

    // MARK: - Styling

    private var backgroundColor: Color {
        DSAccordionColorHelper.backgroundColor(isBorderless: isBorderless)
    }

    private var titleColor: Color {
        DSAccordionColorHelper.titleColor()
    }

    private var subtitleColor: Color {
        DSAccordionColorHelper.subtitleColor()
    }

    private var iconColor: Color {
        DSAccordionColorHelper.iconColor()
    }

    private var dividerColor: Color {
        DSAccordionColorHelper.dividerColor()
    }

    private var borderColor: Color {
        DSAccordionColorHelper.borderColor()
    }

    private let cornerRadius: CGFloat = CGFloat(TokensSemanticLight.BorderRadiusLg)
    private let headerPadding: CGFloat = 16
    private let contentPadding: CGFloat = 16

    // MARK: - Initializers

    /// Creates an accordion with a title and expandable content.
    /// - Parameters:
    ///   - title: The header title text.
    ///   - subtitle: Optional subtitle text.
    ///   - type: The accordion type (text, question, rating).
    ///   - isBorderless: Whether the accordion has no border.
    ///   - showDivider: Whether to show a divider between header and content.
    ///   - isExpanded: Binding to control expansion state.
    ///   - content: The expandable content view.
    public init(
        title: String,
        subtitle: String? = nil,
        type: DSAccordionType = .text,
        isBorderless: Bool = true,
        showDivider: Bool = false,
        isExpanded: Binding<Bool>,
        @ViewBuilder content: () -> Content
    ) {
        self.title = title
        self.subtitle = subtitle
        self.type = type
        self.isBorderless = isBorderless
        self.showDivider = showDivider
        self._isExpanded = isExpanded
        self.content = content()
    }

    // MARK: - Body

    public var body: some View {
        VStack(spacing: 0) {
            // Header
            headerView
                .contentShape(Rectangle())
                .onTapGesture {
                    withAnimation(DSAnimation.expand) {
                        isExpanded.toggle()
                    }
                }

            // Divider
            if showDivider && isExpanded {
                Rectangle()
                    .fill(dividerColor)
                    .frame(height: 1)
            }

            // Content
            if isExpanded {
                contentView
                    .transition(.opacity.combined(with: .move(edge: .top)))
            }
        }
        .background(backgroundView)
        .clipShape(RoundedRectangle(cornerRadius: isBorderless ? 0 : cornerRadius))
        .accessibilityElement(children: .contain)
        .accessibilityAddTraits(.isButton)
        .accessibilityHint(isExpanded ? "Double tap to collapse" : "Double tap to expand")
    }

    // MARK: - Subviews

    @ViewBuilder
    private var headerView: some View {
        HStack(spacing: 12) {
            // Leading icon based on type
            if let leadingIcon = leadingIconForType {
                Image(systemName: leadingIcon)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .foregroundColor(iconColor)
            }

            // Title and subtitle
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(titleColor)
                    .lineLimit(nil)
                    .multilineTextAlignment(.leading)

                if let subtitle {
                    Text(subtitle)
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(subtitleColor)
                        .lineLimit(2)
                }
            }

            Spacer()

            // Expand/collapse icon
            Image(systemName: "chevron.down")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 16, height: 9)
                .foregroundColor(iconColor)
                .rotationEffect(.degrees(isExpanded ? 180 : 0))
                .animation(DSAnimation.expand, value: isExpanded)
        }
        .padding(headerPadding)
        .frame(minHeight: 44)
    }

    /// Returns the appropriate leading icon for the accordion type.
    private var leadingIconForType: String? {
        switch type {
        case .text:
            return nil
        case .question:
            return "questionmark.circle"
        case .rating:
            return "star.fill"
        case .productSpecs:
            return "list.bullet.clipboard"
        case .productDetails:
            return "info.circle"
        }
    }

    @ViewBuilder
    private var contentView: some View {
        VStack(alignment: .leading, spacing: 0) {
            content
        }
        .padding(.horizontal, contentPadding)
        .padding(.bottom, contentPadding)
    }

    @ViewBuilder
    private var backgroundView: some View {
        if isBorderless {
            backgroundColor
        } else {
            RoundedRectangle(cornerRadius: cornerRadius)
                .fill(backgroundColor)
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(borderColor, lineWidth: 1)
                )
        }
    }
}

// MARK: - DSAccordionGroup

/// A container for multiple accordions that can optionally allow only one to be expanded at a time.
public struct DSAccordionGroup<Content: View>: View {
    private let content: Content

    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    public var body: some View {
        VStack(spacing: 0) {
            content
        }
    }
}
