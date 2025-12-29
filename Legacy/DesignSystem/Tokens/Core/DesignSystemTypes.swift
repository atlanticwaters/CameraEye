//
// DesignSystemTypes.swift
//

import SwiftUI

/// A structure representing a shadow with offset, blur, spread, and color properties.
/// Used by design tokens to define elevation and shadow effects.
public struct DSShadow {
    public let x: CGFloat
    public let y: CGFloat
    public let blur: CGFloat
    public let spread: CGFloat
    public let color: Color
    
    public init(x: CGFloat, y: CGFloat, blur: CGFloat, spread: CGFloat, color: Color) {
        self.x = x
        self.y = y
        self.blur = blur
        self.spread = spread
        self.color = color
    }
}
