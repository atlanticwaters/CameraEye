//
// TokensSizing.swift
//

// Icon and component sizing tokens for the design system

import SwiftUI

/// Sizing tokens for icons, components, and touch targets
/// These values are theme-independent and remain constant across light/dark modes
public struct TokensSizing {

    // MARK: - Icon Sizes

    /// 12pt icon - Extra small indicators
    public static let IconSizeXs = CGFloat(12)

    /// 14pt icon - Small icons (DSPlpPodDetails)
    public static let IconSizeSm = CGFloat(14)

    /// 16pt icon - Medium icons (DSAlert, DSCallout)
    public static let IconSizeMd = CGFloat(16)

    /// 20pt icon - Standard icons
    public static let IconSizeLg = CGFloat(20)

    /// 24pt icon - Large icons (DSMenuItem)
    public static let IconSizeXl = CGFloat(24)

    /// 28pt icon - Extra large icons
    public static let IconSize2xl = CGFloat(28)

    /// 32pt icon - Jumbo icons
    public static let IconSize3xl = CGFloat(32)

    /// 36pt icon - Display icons
    public static let IconSize4xl = CGFloat(36)

    /// 40pt icon - Hero icons
    public static let IconSize5xl = CGFloat(40)

    // MARK: - Touch Targets

    /// 44pt - Minimum touch target (Apple HIG)
    public static let TouchTargetMin = CGFloat(44)

    /// 48pt - Comfortable touch target
    public static let TouchTargetMd = CGFloat(48)

    /// 56pt - Large touch target
    public static let TouchTargetLg = CGFloat(56)

    // MARK: - Avatar Sizes

    /// 24pt avatar - Extra small
    public static let AvatarSizeXs = CGFloat(24)

    /// 32pt avatar - Small
    public static let AvatarSizeSm = CGFloat(32)

    /// 40pt avatar - Medium
    public static let AvatarSizeMd = CGFloat(40)

    /// 48pt avatar - Large
    public static let AvatarSizeLg = CGFloat(48)

    /// 64pt avatar - Extra large
    public static let AvatarSizeXl = CGFloat(64)

    /// 80pt avatar - Jumbo
    public static let AvatarSize2xl = CGFloat(80)

    // MARK: - Button Heights

    /// 32pt button - Small
    public static let ButtonHeightSm = CGFloat(32)

    /// 40pt button - Medium
    public static let ButtonHeightMd = CGFloat(40)

    /// 48pt button - Large
    public static let ButtonHeightLg = CGFloat(48)

    /// 56pt button - Extra large
    public static let ButtonHeightXl = CGFloat(56)

    // MARK: - Input Heights

    /// 36pt input - Small
    public static let InputHeightSm = CGFloat(36)

    /// 44pt input - Medium
    public static let InputHeightMd = CGFloat(44)

    /// 52pt input - Large
    public static let InputHeightLg = CGFloat(52)

    // MARK: - Container Sizes

    /// 100pt container - Small media/image container
    public static let ContainerSizeSm = CGFloat(100)

    /// 150pt container - Medium media/image container
    public static let ContainerSizeMd = CGFloat(150)

    /// 200pt container - Large media/image container
    public static let ContainerSizeLg = CGFloat(200)

    /// 280pt container - Extra large media/image container
    public static let ContainerSizeXl = CGFloat(280)

    // MARK: - Dismiss/Action Circle Sizes

    /// 24pt circle - Small dismiss button
    public static let CircleSizeSm = CGFloat(24)

    /// 32pt circle - Medium dismiss button
    public static let CircleSizeMd = CGFloat(32)

    /// 36pt circle - Standard dismiss button (DSAlert)
    public static let CircleSizeLg = CGFloat(36)

    /// 44pt circle - Large dismiss button with touch target
    public static let CircleSizeXl = CGFloat(44)
}
