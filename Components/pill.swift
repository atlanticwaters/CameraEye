import SwiftUI

// MARK: - Pill Component System
// THD App Design System - Pill Components
//
// This file contains the Pill component that uses DesignSystemGlobal tokens
// for consistent styling across the application.
//
// Components:
// - Pill: Selectable chip/pill component with optional icons
//
// Design System Integration:
// - Colors: Uses TextSelectorColor*, BackgroundSelectorColor*, BorderSelectorColor*, IconSelectorColor* tokens
// - Spacing: Uses Spacing* tokens
// - Border: Uses BorderRadiusFull, BorderWidth* tokens
// - Typography: Uses FontFontSize* tokens

// MARK: - Pill Interaction States
/// Pill interaction states affecting appearance and behavior.
enum THDPillInteraction {
    /// Default interactive state
    case `default`

    /// Pressed/active state (visual feedback)
    case pressed

    /// Selected state - filled background
    case selected

    /// Disabled state - reduced interactivity
    case disabled
}

// MARK: - Pill Style Variants
/// Pill style variants affecting border and background treatment.
enum THDPillStyle {
    /// Outlined style - visible border, optional background
    case outlined

    /// Filled style - no border, subtle background changes
    case filled
}

// MARK: - Pill Size Options
/// Pill size options with corresponding height and padding.
///
/// Sizes use DesignSystemGlobal spacing tokens:
/// - Small: 28pt height (Spacing7)
/// - Medium: 36pt height (Spacing9)
/// - Large: 44pt height (Spacing11)
enum THDPillSize {
    case small   // 28pt height
    case medium  // 36pt height
    case large   // 44pt height

    /// Pill height using DesignSystemGlobal spacing tokens
    var height: CGFloat {
        switch self {
        case .small: return DesignSystemGlobal.Spacing7
        case .medium: return DesignSystemGlobal.Spacing9
        case .large: return DesignSystemGlobal.Spacing11
        }
    }

    /// Icon size for this pill size
    var iconSize: CGFloat {
        14 // Consistent icon size
    }

    /// Chevron size
    var chevronSize: CGFloat {
        10.5 // Consistent chevron size
    }
}

// MARK: - Pill Component
/// Selectable pill/chip component using DesignSystemGlobal tokens.
///
/// A versatile selection component that can be used for filters, tags,
/// or any selectable option. Supports optional leading icons and trailing chevrons.
///
/// ## Usage Example:
/// ```swift
/// Pill("Filter", style: .outlined, size: .medium)
/// Pill("Location", style: .outlined, interaction: .selected, leadingIcon: "mappin")
/// Pill("Category", hasChevron: true)
/// ```
///
/// ## Design System Tokens Used:
/// - Text: TextSelectorColorDefault, TextSelectorColorSelected, TextSelectorColorInactive
/// - Background: BackgroundSelectorColor* tokens
/// - Border: BorderSelectorColorOutline* tokens, BorderRadiusFull
/// - Icons: IconSelectorColor* tokens
struct Pill: View {
    let text: String
    let style: THDPillStyle
    let size: THDPillSize
    let interaction: THDPillInteraction
    let hasBackground: Bool
    let leadingIcon: String?
    let hasChevron: Bool

    init(
        _ text: String,
        style: THDPillStyle = .outlined,
        size: THDPillSize = .small,
        interaction: THDPillInteraction = .default,
        hasBackground: Bool = true,
        leadingIcon: String? = nil,
        hasChevron: Bool = false
    ) {
        self.text = text
        self.style = style
        self.size = size
        self.interaction = interaction
        self.hasBackground = hasBackground
        self.leadingIcon = leadingIcon
        self.hasChevron = hasChevron
    }

    var body: some View {
        HStack(spacing: DesignSystemGlobal.Spacing1) {
            // Leading icon (optional)
            if let iconName = leadingIcon {
                Image(systemName: iconName)
                    .resizable()
                    .frame(width: size.iconSize, height: size.iconSize)
                    .foregroundStyle(iconColor)
            }

            // Text label
            Text(text)
                .font(.thdBodySm)
                .foregroundStyle(textColor)
                .lineLimit(1)

            // Trailing chevron (optional)
            if hasChevron {
                Image(systemName: "chevron.down")
                    .resizable()
                    .frame(width: size.chevronSize, height: size.chevronSize)
                    .foregroundStyle(iconColor)
            }
        }
        .padding(.horizontal, DesignSystemGlobal.Spacing4)
        .padding(.vertical, 6)
        .frame(height: size.height)
        .background(backgroundColor)
        .overlay(
            RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusFull)
                .stroke(borderColor, lineWidth: style == .outlined ? DesignSystemGlobal.Border1 : 0)
        )
        .cornerRadius(DesignSystemGlobal.BorderRadiusFull)
        .disabled(interaction == .disabled)
    }

    // MARK: - Color Logic

    /// Text color based on interaction state
    /// Uses DesignSystemGlobal TextSelectorColor* tokens
    private var textColor: Color {
        switch interaction {
        case .default, .pressed:
            return DesignSystemGlobal.TextSelectorColorDefault
        case .selected:
            return DesignSystemGlobal.TextSelectorColorFilledSelected
        case .disabled:
            return DesignSystemGlobal.TextSelectorColorInactive
        }
    }

    /// Icon color based on interaction state
    /// Uses DesignSystemGlobal IconSelectorColor* tokens
    private var iconColor: Color {
        switch interaction {
        case .default, .pressed:
            return DesignSystemGlobal.IconSelectorColorOutlineDefault
        case .selected:
            return DesignSystemGlobal.IconSelectorColorOutlineSelected
        case .disabled:
            return DesignSystemGlobal.IconSelectorColorOutlineInactive
        }
    }

    /// Background color based on style and interaction state
    /// Uses DesignSystemGlobal BackgroundSelectorColor* and BackgroundButtonColor* tokens
    private var backgroundColor: Color {
        if style == .outlined {
            switch interaction {
            case .default:
                return hasBackground
                    ? DesignSystemGlobal.BackgroundButtonColorTransparent05Default
                    : .clear
            case .pressed:
                return hasBackground
                    ? DesignSystemGlobal.BackgroundButtonColorTransparent05Pressed
                    : DesignSystemGlobal.BackgroundSelectorColorFilledPressed
            case .selected:
                return DesignSystemGlobal.BackgroundSelectorColorOutlineSelected
            case .disabled:
                return hasBackground
                    ? DesignSystemGlobal.BackgroundSelectorColorFilledInactive
                    : .clear
            }
        } else { // filled
            switch interaction {
            case .default:
                return DesignSystemGlobal.BackgroundSelectorColorFilledTransparent
            case .pressed:
                return DesignSystemGlobal.BackgroundSelectorColorFilledPressed
            case .selected:
                return DesignSystemGlobal.BackgroundSelectorColorFilledSelected
            case .disabled:
                return DesignSystemGlobal.BackgroundSelectorColorFilledInactive
            }
        }
    }

    /// Border color for outlined style
    /// Uses DesignSystemGlobal BorderSelectorColor* tokens
    private var borderColor: Color {
        if style == .outlined {
            switch interaction {
            case .default:
                return DesignSystemGlobal.BorderSelectorColorOutlineDefault
            case .pressed:
                return DesignSystemGlobal.BorderSelectorColorOutlinePressed
            case .selected:
                return DesignSystemGlobal.BorderSelectorColorOutlineSelected
            case .disabled:
                return DesignSystemGlobal.BorderSelectorColorOutlineInactive
            }
        } else {
            return .clear
        }
    }
}

// MARK: - Previews
#Preview("Pill Variants") {
    
    func sectionHeader(_ title: String, description: String) -> some View {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing1) {
            Text(title)
                .thdFont(.h5)
                .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)

            Text(description)
                .thdFont(.caption)
                .foregroundStyle(DesignSystemGlobal.TextOnContainerColorTertiary)
        }
    }

    return ScrollView {
        VStack(alignment: .leading, spacing: 24) {
            // Title
            Text("Pill")
                .thdFont(.hero3)
                .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)
                .padding(.bottom, 20)

            // MARK: - Outlined Pills - Default
            sectionHeader("Outlined - Default", description: "Pills with visible border in default state")

            VStack(alignment: .leading, spacing: 8) {
                Pill("Cumberland", style: .outlined, size: .small, hasBackground: true, leadingIcon: "storefront", hasChevron: true)
                Pill("Cumberland", style: .outlined, size: .medium, hasBackground: true, leadingIcon: "storefront", hasChevron: true)
                Pill("Cumberland", style: .outlined, size: .large, hasBackground: true, leadingIcon: "storefront", hasChevron: true)
            }

            // MARK: - Filled Pills - Default
            sectionHeader("Filled - Default", description: "Pills without visible border in default state")

            VStack(alignment: .leading, spacing: 8) {
                Pill("Cumberland", style: .filled, size: .small, hasBackground: false, leadingIcon: "storefront", hasChevron: true)
                Pill("Cumberland", style: .filled, size: .medium, hasBackground: false, leadingIcon: "storefront", hasChevron: true)
                Pill("Cumberland", style: .filled, size: .large, hasBackground: false, leadingIcon: "storefront", hasChevron: true)
            }

            // MARK: - Outlined Pills - Pressed
            sectionHeader("Outlined - Pressed", description: "Pills with visible border in pressed state")

            VStack(alignment: .leading, spacing: 8) {
                Pill("Cumberland", style: .outlined, size: .small, interaction: .pressed, hasBackground: true, leadingIcon: "storefront", hasChevron: true)
                Pill("Cumberland", style: .outlined, size: .medium, interaction: .pressed, hasBackground: true, leadingIcon: "storefront", hasChevron: true)
                Pill("Cumberland", style: .outlined, size: .large, interaction: .pressed, hasBackground: true, leadingIcon: "storefront", hasChevron: true)
            }

            // MARK: - Filled Pills - Pressed
            sectionHeader("Filled - Pressed", description: "Pills without visible border in pressed state")

            VStack(alignment: .leading, spacing: 8) {
                Pill("Cumberland", style: .filled, size: .small, interaction: .pressed, hasBackground: true, leadingIcon: "storefront", hasChevron: true)
                Pill("Cumberland", style: .filled, size: .medium, interaction: .pressed, hasBackground: true, leadingIcon: "storefront", hasChevron: true)
                Pill("Cumberland", style: .filled, size: .large, interaction: .pressed, hasBackground: true, leadingIcon: "storefront", hasChevron: true)
            }

            // MARK: - Outlined Pills - Selected
            sectionHeader("Outlined - Selected", description: "Pills with visible border in selected state")

            VStack(alignment: .leading, spacing: 8) {
                Pill("Cumberland", style: .outlined, size: .small, interaction: .selected, hasBackground: true, leadingIcon: "storefront", hasChevron: true)
                Pill("Cumberland", style: .outlined, size: .medium, interaction: .selected, hasBackground: true, leadingIcon: "storefront", hasChevron: true)
                Pill("Cumberland", style: .outlined, size: .large, interaction: .selected, hasBackground: true, leadingIcon: "storefront", hasChevron: true)
            }

            // MARK: - Filled Pills - Selected
            sectionHeader("Filled - Selected", description: "Pills without visible border in selected state")

            VStack(alignment: .leading, spacing: 8) {
                Pill("Cumberland", style: .filled, size: .small, interaction: .selected, hasBackground: true, leadingIcon: "storefront", hasChevron: true)
                Pill("Cumberland", style: .filled, size: .medium, interaction: .selected, hasBackground: true, leadingIcon: "storefront", hasChevron: true)
                Pill("Cumberland", style: .filled, size: .large, interaction: .selected, hasBackground: true, leadingIcon: "storefront", hasChevron: true)
            }

            // MARK: - Outlined Pills - Disabled
            sectionHeader("Outlined - Disabled", description: "Pills with visible border in disabled state")

            VStack(alignment: .leading, spacing: 8) {
                Pill("Cumberland", style: .outlined, size: .small, interaction: .disabled, hasBackground: true, leadingIcon: "storefront", hasChevron: true)
                Pill("Cumberland", style: .outlined, size: .medium, interaction: .disabled, hasBackground: true, leadingIcon: "storefront", hasChevron: true)
                Pill("Cumberland", style: .outlined, size: .large, interaction: .disabled, hasBackground: true, leadingIcon: "storefront", hasChevron: true)
            }

            // MARK: - Filled Pills - Disabled
            sectionHeader("Filled - Disabled", description: "Pills without visible border in disabled state")

            VStack(alignment: .leading, spacing: 8) {
                Pill("Cumberland", style: .filled, size: .small, interaction: .disabled, hasBackground: true, leadingIcon: "storefront", hasChevron: true)
                Pill("Cumberland", style: .filled, size: .medium, interaction: .disabled, hasBackground: true, leadingIcon: "storefront", hasChevron: true)
                Pill("Cumberland", style: .filled, size: .large, interaction: .disabled, hasBackground: true, leadingIcon: "storefront", hasChevron: true)
            }

            // MARK: - Simple Pills
            sectionHeader("Simple Pills (no icons)", description: "Pills without leading icons or chevrons")

            HStack(spacing: 8) {
                Pill("Small", style: .outlined, size: .small)
                Pill("Medium", style: .outlined, size: .medium)
                Pill("Large", style: .outlined, size: .large)
            }

            HStack(spacing: 8) {
                Pill("Selected", style: .outlined, size: .medium, interaction: .selected)
                Pill("Disabled", style: .outlined, size: .medium, interaction: .disabled)
            }
        }
        .padding()
    }
    .background(DesignSystemGlobal.BackgroundContainerColorWhite)
}
