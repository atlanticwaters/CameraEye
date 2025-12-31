import SwiftUI

// MARK: - DSFeatureCardType

/// Card type variants for DSFeatureCard matching Figma specs.
public enum DSFeatureCardType: CaseIterable, Sendable {
    /// Half width card with icon
    case iconHalf
    /// Two features side by side with icons
    case iconDouble
    /// Full width card with icon
    case iconFull
    /// Two content slots with icons
    case iconDoubleContent
    /// Half width card without icon
    case half
    /// Two half cards side by side
    case double
    /// Full width card without icon
    case full
    /// Two content areas
    case doubleContent
}

// MARK: - DSFeatureItem

/// Represents a single feature item.
public struct DSFeatureItem: Identifiable, Equatable, Sendable {
    public let id: String
    public let title: String
    public let description: String?
    public let icon: Image?

    public init(
        id: String = UUID().uuidString,
        title: String,
        description: String? = nil,
        icon: Image? = nil
    ) {
        self.id = id
        self.title = title
        self.description = description
        self.icon = icon
    }

    public static func == (lhs: DSFeatureItem, rhs: DSFeatureItem) -> Bool {
        lhs.id == rhs.id
    }
}

// MARK: - DSFeatureCard

/// A feature card component for displaying product features and highlights.
///
/// DSFeatureCard displays feature information with optional icons in various layouts.
/// It supports single features, double features, and full-width layouts.
///
/// Example usage:
/// ```swift
/// // Single feature with icon
/// DSFeatureCard(
///     feature: DSFeatureItem(
///         title: "Easy Installation",
///         description: "Mounting hardware included",
///         icon: Image(systemName: "checkmark.circle")
///     ),
///     type: .iconHalf
/// )
///
/// // Double features
/// DSFeatureCard(
///     features: [
///         DSFeatureItem(title: "Feature 1", description: "Description 1"),
///         DSFeatureItem(title: "Feature 2", description: "Description 2")
///     ],
///     type: .iconDouble
/// )
/// ```
public struct DSFeatureCard: View {
    // MARK: - Properties

    private let features: [DSFeatureItem]
    private let type: DSFeatureCardType
    private let customContent: [AnyView]?

    // MARK: - Styling

    private var backgroundColor: Color {
        DSFeatureCardColorHelper.backgroundColor()
    }

    private var borderColor: Color {
        DSFeatureCardColorHelper.borderColor()
    }

    private var titleColor: Color {
        DSFeatureCardColorHelper.titleColor()
    }

    private var descriptionColor: Color {
        DSFeatureCardColorHelper.descriptionColor()
    }

    private var iconColor: Color {
        DSFeatureCardColorHelper.iconColor()
    }

    private var cornerRadius: CGFloat { 8 }
    private var padding: CGFloat { 16 }
    private var iconSize: CGFloat { 20 }
    private var spacing: CGFloat { 8 }

    // MARK: - Initializers

    /// Creates a feature card with a single feature.
    public init(
        feature: DSFeatureItem,
        type: DSFeatureCardType = .iconHalf
    ) {
        self.features = [feature]
        self.type = type
        self.customContent = nil
    }

    /// Creates a feature card with multiple features.
    public init(
        features: [DSFeatureItem],
        type: DSFeatureCardType = .iconDouble
    ) {
        self.features = features
        self.type = type
        self.customContent = nil
    }

    /// Creates a feature card with custom content slots.
    public init(
        type: DSFeatureCardType,
        @ViewBuilder contentA: () -> some View,
        @ViewBuilder contentB: () -> some View
    ) {
        self.features = []
        self.type = type
        self.customContent = [AnyView(contentA()), AnyView(contentB())]
    }

    // MARK: - Body

    public var body: some View {
        cardContainer {
            switch type {
            case .iconHalf:
                iconHalfLayout
            case .iconDouble:
                iconDoubleLayout
            case .iconFull:
                iconFullLayout
            case .iconDoubleContent:
                iconDoubleContentLayout
            case .half:
                halfLayout
            case .double:
                doubleLayout
            case .full:
                fullLayout
            case .doubleContent:
                doubleContentLayout
            }
        }
    }

    // MARK: - Card Container

    @ViewBuilder
    private func cardContainer<Content: View>(@ViewBuilder content: () -> Content) -> some View {
        content()
            .padding(padding)
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(backgroundColor)
            )
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(borderColor, lineWidth: 1)
            )
    }

    // MARK: - Layouts

    @ViewBuilder
    private var iconHalfLayout: some View {
        if let feature = features.first {
            VStack(alignment: .leading, spacing: spacing) {
                featureHeader(feature)
                if let description = feature.description {
                    descriptionText(description)
                }
            }
        }
    }

    @ViewBuilder
    private var iconDoubleLayout: some View {
        HStack(alignment: .top, spacing: padding) {
            ForEach(features.prefix(2)) { feature in
                VStack(alignment: .leading, spacing: spacing) {
                    featureHeader(feature)
                    if let description = feature.description {
                        descriptionText(description)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }

    @ViewBuilder
    private var iconFullLayout: some View {
        if let feature = features.first {
            VStack(alignment: .leading, spacing: spacing) {
                featureHeader(feature)
                if let description = feature.description {
                    descriptionText(description)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    @ViewBuilder
    private var iconDoubleContentLayout: some View {
        if let customContent, customContent.count >= 2 {
            HStack(alignment: .top, spacing: padding) {
                customContent[0]
                    .frame(maxWidth: .infinity)
                customContent[1]
                    .frame(maxWidth: .infinity)
            }
        } else {
            iconDoubleLayout
        }
    }

    @ViewBuilder
    private var halfLayout: some View {
        if let feature = features.first {
            VStack(alignment: .leading, spacing: spacing) {
                titleText(feature.title)
                if let description = feature.description {
                    descriptionText(description)
                }
            }
        }
    }

    @ViewBuilder
    private var doubleLayout: some View {
        HStack(alignment: .top, spacing: padding) {
            ForEach(features.prefix(2)) { feature in
                VStack(alignment: .leading, spacing: spacing) {
                    titleText(feature.title)
                    if let description = feature.description {
                        descriptionText(description)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }

    @ViewBuilder
    private var fullLayout: some View {
        if let feature = features.first {
            VStack(alignment: .leading, spacing: spacing) {
                titleText(feature.title)
                if let description = feature.description {
                    descriptionText(description)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    @ViewBuilder
    private var doubleContentLayout: some View {
        if let customContent, customContent.count >= 2 {
            HStack(alignment: .top, spacing: padding) {
                customContent[0]
                    .frame(maxWidth: .infinity)
                customContent[1]
                    .frame(maxWidth: .infinity)
            }
        } else {
            doubleLayout
        }
    }

    // MARK: - Components

    @ViewBuilder
    private func featureHeader(_ feature: DSFeatureItem) -> some View {
        HStack(spacing: spacing) {
            if let icon = feature.icon {
                icon
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: iconSize, height: iconSize)
                    .foregroundStyle(iconColor)
            } else {
                Image(systemName: "checkmark.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: iconSize, height: iconSize)
                    .foregroundStyle(iconColor)
            }

            titleText(feature.title)
        }
    }

    @ViewBuilder
    private func titleText(_ text: String) -> some View {
        Text(text)
            .font(.system(size: 14, weight: .semibold))
            .foregroundStyle(titleColor)
    }

    @ViewBuilder
    private func descriptionText(_ text: String) -> some View {
        Text(text)
            .font(.system(size: 12, weight: .regular))
            .foregroundStyle(descriptionColor)
    }
}

// MARK: - Convenience Factory Methods

extension DSFeatureCard {
    /// Creates a simple icon feature card.
    public static func icon(
        title: String,
        description: String? = nil,
        icon: Image? = nil
    ) -> DSFeatureCard {
        DSFeatureCard(
            feature: DSFeatureItem(title: title, description: description, icon: icon),
            type: .iconHalf
        )
    }

    /// Creates a simple feature card without icon.
    public static func simple(
        title: String,
        description: String? = nil
    ) -> DSFeatureCard {
        DSFeatureCard(
            feature: DSFeatureItem(title: title, description: description),
            type: .half
        )
    }
}
