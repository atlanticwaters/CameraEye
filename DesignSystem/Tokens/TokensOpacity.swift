//
// TokensOpacity.swift
//

// Opacity tokens for the design system

import SwiftUI

/// Opacity tokens for consistent transparency values across the design system
/// These values are theme-independent and remain constant across light/dark modes
public struct TokensOpacity {

    // MARK: - General Opacity Levels

    /// 0% opacity - Fully transparent
    public static let Opacity0 = CGFloat(0)

    /// 5% opacity - Very subtle backgrounds
    public static let Opacity5 = CGFloat(0.05)

    /// 10% opacity - Light overlays, subtle shadows
    public static let Opacity10 = CGFloat(0.1)

    /// 15% opacity - Soft shadows
    public static let Opacity15 = CGFloat(0.15)

    /// 20% opacity - Placeholder backgrounds
    public static let Opacity20 = CGFloat(0.2)

    /// 25% opacity - Light disabled states
    public static let Opacity25 = CGFloat(0.25)

    /// 30% opacity - Inactive states, star ratings
    public static let Opacity30 = CGFloat(0.3)

    /// 40% opacity - Medium overlays
    public static let Opacity40 = CGFloat(0.4)

    /// 50% opacity - Modal scrims, overlays
    public static let Opacity50 = CGFloat(0.5)

    /// 60% opacity - Dark overlays
    public static let Opacity60 = CGFloat(0.6)

    /// 70% opacity - Heavy overlays, strokes
    public static let Opacity70 = CGFloat(0.7)

    /// 80% opacity - Near-solid overlays
    public static let Opacity80 = CGFloat(0.8)

    /// 90% opacity - Almost fully opaque
    public static let Opacity90 = CGFloat(0.9)

    /// 100% opacity - Fully opaque
    public static let Opacity100 = CGFloat(1.0)

    // MARK: - Semantic Opacity Tokens

    /// Shadow light - 5% for subtle card backgrounds
    public static let OpacityShadowLight = CGFloat(0.05)

    /// Shadow medium - 10% for standard shadows (DSAlert, DSCallout)
    public static let OpacityShadowMed = CGFloat(0.1)

    /// Shadow heavy - 15% for prominent shadows
    public static let OpacityShadowHeavy = CGFloat(0.15)

    /// Disabled state opacity - 30% for inactive elements
    public static let OpacityDisabled = CGFloat(0.3)

    /// Overlay light - 50% for modal scrims
    public static let OpacityOverlay = CGFloat(0.5)

    /// Overlay heavy - 70% for dark modal backgrounds
    public static let OpacityOverlayHeavy = CGFloat(0.7)

    /// Stroke light - 70% for subtle strokes (DSTile)
    public static let OpacityStroke = CGFloat(0.7)

    /// Hover state - 8% for hover backgrounds
    public static let OpacityHover = CGFloat(0.08)

    /// Pressed state - 12% for pressed backgrounds
    public static let OpacityPressed = CGFloat(0.12)

    /// Focus ring - 40% for focus indicators
    public static let OpacityFocus = CGFloat(0.4)
}
