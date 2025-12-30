// Generated file - DO NOT EDIT
// Run `npm run tokens:build` to regenerate
// swiftlint:disable file_length

#if canImport(UIKit)
import UIKit
#endif
import SwiftUI

// MARK: - DSColor

/// A theme-aware color wrapper that automatically resolves to light or dark mode.
///
/// `DSColor` eliminates the need to manually check `colorScheme` and select tokens.
/// Colors resolve automatically based on the current environment.
///
/// ## Usage
/// ```swift
/// struct MyView: View {
///     var body: some View {
///         Text("Hello")
///             .foregroundColor(DSColor.buttonBackgroundBrandFilledDefault.resolve)
///     }
/// }
/// ```
public struct DSColor: Sendable {
    private let light: Color
    private let dark: Color

    private typealias Light = TokensSemanticLight
    private typealias Dark = TokensSemanticDark
    private typealias ComponentLight = TokensComponentsLight
    private typealias ComponentDark = TokensComponentsDark

    /// Creates a theme-aware color with light and dark variants.
    public init(light: Color, dark: Color) {
        self.light = light
        self.dark = dark
    }

    /// Resolves the color based on current color scheme.
    /// Use this in view modifiers: `.foregroundColor(dsColor.resolve)`
    public var resolve: Color {
        #if canImport(UIKit)
        Color(UIColor { traits in
            traits.userInterfaceStyle == .dark ? UIColor(dark) : UIColor(light)
        })
        #else
        // macOS fallback - would need NSColor equivalent
        light
        #endif
    }

    /// Resolves to the light variant.
    public var lightColor: Color { light }

    /// Resolves to the dark variant.
    public var darkColor: Color { dark }
}

// MARK: - Button Background Colors

extension DSColor {
    /// Theme-aware button background color
    public static var buttonBackgroundBrandFilledDefault: DSColor {
        DSColor(light: Light.BackgroundButtonColorBrandFilledDefault, dark: Dark.BackgroundButtonColorBrandFilledDefault)
    }

    /// Theme-aware button background color
    public static var buttonBackgroundBrandFilledInactive: DSColor {
        DSColor(light: Light.BackgroundButtonColorBrandFilledInactive, dark: Dark.BackgroundButtonColorBrandFilledInactive)
    }

    /// Theme-aware button background color
    public static var buttonBackgroundBrandGradientFilledDefault: DSColor {
        DSColor(light: Light.BackgroundButtonColorBrandGradientFilledDefault, dark: Dark.BackgroundButtonColorBrandGradientFilledDefault)
    }

    /// Theme-aware button background color
    public static var buttonBackgroundBrandGradientFilledInactive: DSColor {
        DSColor(light: Light.BackgroundButtonColorBrandGradientFilledInactive, dark: Dark.BackgroundButtonColorBrandGradientFilledInactive)
    }

    /// Theme-aware button background color
    public static var buttonBackgroundGhostFilledDefault: DSColor {
        DSColor(light: Light.BackgroundButtonColorGhostFilledDefault, dark: Dark.BackgroundButtonColorGhostFilledDefault)
    }

    /// Theme-aware button background color
    public static var buttonBackgroundGhostFilledInactive: DSColor {
        DSColor(light: Light.BackgroundButtonColorGhostFilledInactive, dark: Dark.BackgroundButtonColorGhostFilledInactive)
    }

    /// Theme-aware button background color
    public static var buttonBackgroundGhostFilledPressed: DSColor {
        DSColor(light: Light.BackgroundButtonColorGhostFilledPressed, dark: Dark.BackgroundButtonColorGhostFilledPressed)
    }

    /// Theme-aware button background color
    public static var buttonBackgroundTransparent05Active: DSColor {
        DSColor(light: Light.BackgroundButtonColorTransparent05Active, dark: Dark.BackgroundButtonColorTransparent05Active)
    }

    /// Theme-aware button background color
    public static var buttonBackgroundTransparent05Default: DSColor {
        DSColor(light: Light.BackgroundButtonColorTransparent05Default, dark: Dark.BackgroundButtonColorTransparent05Default)
    }

    /// Theme-aware button background color
    public static var buttonBackgroundTransparent05Inactive: DSColor {
        DSColor(light: Light.BackgroundButtonColorTransparent05Inactive, dark: Dark.BackgroundButtonColorTransparent05Inactive)
    }

    /// Theme-aware button background color
    public static var buttonBackgroundTransparent05Pressed: DSColor {
        DSColor(light: Light.BackgroundButtonColorTransparent05Pressed, dark: Dark.BackgroundButtonColorTransparent05Pressed)
    }

    /// Theme-aware button background color
    public static var buttonBackgroundTransparent10Active: DSColor {
        DSColor(light: Light.BackgroundButtonColorTransparent10Active, dark: Dark.BackgroundButtonColorTransparent10Active)
    }

    /// Theme-aware button background color
    public static var buttonBackgroundTransparent10Default: DSColor {
        DSColor(light: Light.BackgroundButtonColorTransparent10Default, dark: Dark.BackgroundButtonColorTransparent10Default)
    }

    /// Theme-aware button background color
    public static var buttonBackgroundTransparent10Inactive: DSColor {
        DSColor(light: Light.BackgroundButtonColorTransparent10Inactive, dark: Dark.BackgroundButtonColorTransparent10Inactive)
    }

    /// Theme-aware button background color
    public static var buttonBackgroundTransparent10Pressed: DSColor {
        DSColor(light: Light.BackgroundButtonColorTransparent10Pressed, dark: Dark.BackgroundButtonColorTransparent10Pressed)
    }

    /// Theme-aware button background color
    public static var buttonBackgroundWhiteFilledDefault: DSColor {
        DSColor(light: Light.BackgroundButtonColorWhiteFilledDefault, dark: Dark.BackgroundButtonColorWhiteFilledDefault)
    }

    /// Theme-aware button background color
    public static var buttonBackgroundWhiteFilledInactive: DSColor {
        DSColor(light: Light.BackgroundButtonColorWhiteFilledInactive, dark: Dark.BackgroundButtonColorWhiteFilledInactive)
    }
}

// MARK: - Button Text Colors

extension DSColor {
    /// Theme-aware button text color
    public static var buttonTextGhostFilledDefault: DSColor {
        DSColor(light: Light.TextButtonColorGhostFilledDefault, dark: Dark.TextButtonColorGhostFilledDefault)
    }

    /// Theme-aware button text color
    public static var buttonTextGhostFilledInactive: DSColor {
        DSColor(light: Light.TextButtonColorGhostFilledInactive, dark: Dark.TextButtonColorGhostFilledInactive)
    }

    /// Theme-aware button text color
    public static var buttonTextGradientFilledDefault: DSColor {
        DSColor(light: Light.TextButtonColorGradientFilledDefault, dark: Dark.TextButtonColorGradientFilledDefault)
    }

    /// Theme-aware button text color
    public static var buttonTextGradientFilledInactive: DSColor {
        DSColor(light: Light.TextButtonColorGradientFilledInactive, dark: Dark.TextButtonColorGradientFilledInactive)
    }

    /// Theme-aware button text color
    public static var buttonTextOrangeFilledDefault: DSColor {
        DSColor(light: Light.TextButtonColorOrangeFilledDefault, dark: Dark.TextButtonColorOrangeFilledDefault)
    }

    /// Theme-aware button text color
    public static var buttonTextOrangeFilledInactive: DSColor {
        DSColor(light: Light.TextButtonColorOrangeFilledInactive, dark: Dark.TextButtonColorOrangeFilledInactive)
    }

    /// Theme-aware button text color
    public static var buttonTextOrangeOutlineDefault: DSColor {
        DSColor(light: Light.TextButtonColorOrangeOutlineDefault, dark: Dark.TextButtonColorOrangeOutlineDefault)
    }

    /// Theme-aware button text color
    public static var buttonTextOrangeOutlineInactive: DSColor {
        DSColor(light: Light.TextButtonColorOrangeOutlineInactive, dark: Dark.TextButtonColorOrangeOutlineInactive)
    }

    /// Theme-aware button text color
    public static var buttonTextTransparent05FilledDefault: DSColor {
        DSColor(light: Light.TextButtonColorTransparent05FilledDefault, dark: Dark.TextButtonColorTransparent05FilledDefault)
    }

    /// Theme-aware button text color
    public static var buttonTextTransparent05FilledInactive: DSColor {
        DSColor(light: Light.TextButtonColorTransparent05FilledInactive, dark: Dark.TextButtonColorTransparent05FilledInactive)
    }

    /// Theme-aware button text color
    public static var buttonTextTransparent10FilledDefault: DSColor {
        DSColor(light: Light.TextButtonColorTransparent10FilledDefault, dark: Dark.TextButtonColorTransparent10FilledDefault)
    }

    /// Theme-aware button text color
    public static var buttonTextTransparent10FilledInactive: DSColor {
        DSColor(light: Light.TextButtonColorTransparent10FilledInactive, dark: Dark.TextButtonColorTransparent10FilledInactive)
    }

    /// Theme-aware button text color
    public static var buttonTextWhiteFilledDefault: DSColor {
        DSColor(light: Light.TextButtonColorWhiteFilledDefault, dark: Dark.TextButtonColorWhiteFilledDefault)
    }

    /// Theme-aware button text color
    public static var buttonTextWhiteFilledInactive: DSColor {
        DSColor(light: Light.TextButtonColorWhiteFilledInactive, dark: Dark.TextButtonColorWhiteFilledInactive)
    }
}

// MARK: - Button Border Colors

extension DSColor {
    /// Theme-aware button border color
    public static var buttonBorderAccent: DSColor {
        DSColor(light: Light.BorderButtonColorAccent, dark: Dark.BorderButtonColorAccent)
    }

    /// Theme-aware button border color
    public static var buttonBorderAccent2: DSColor {
        DSColor(light: Light.BorderButtonColorAccent2, dark: Dark.BorderButtonColorAccent2)
    }

    /// Theme-aware button border color
    public static var buttonBorderDefault: DSColor {
        DSColor(light: Light.BorderButtonColorDefault, dark: Dark.BorderButtonColorDefault)
    }

    /// Theme-aware button border color
    public static var buttonBorderFocus: DSColor {
        DSColor(light: Light.BorderButtonColorFocus, dark: Dark.BorderButtonColorFocus)
    }

    /// Theme-aware button border color
    public static var buttonBorderInactive: DSColor {
        DSColor(light: Light.BorderButtonColorInactive, dark: Dark.BorderButtonColorInactive)
    }

    /// Theme-aware button border color
    public static var buttonBorderOrangeOutlineDefault: DSColor {
        DSColor(light: Light.BorderButtonColorOrangeOutlineDefault, dark: Dark.BorderButtonColorOrangeOutlineDefault)
    }

    /// Theme-aware button border color
    public static var buttonBorderOrangeOutlineInactive: DSColor {
        DSColor(light: Light.BorderButtonColorOrangeOutlineInactive, dark: Dark.BorderButtonColorOrangeOutlineInactive)
    }

    /// Theme-aware button border color
    public static var buttonBorderPressed: DSColor {
        DSColor(light: Light.BorderButtonColorPressed, dark: Dark.BorderButtonColorPressed)
    }
}

// MARK: - Container Background Colors

extension DSColor {
    /// Theme-aware container background color
    public static var containerBackgroundBrand: DSColor {
        DSColor(light: Light.BackgroundContainerColorBrand, dark: Dark.BackgroundContainerColorBrand)
    }

    /// Theme-aware container background color
    public static var containerBackgroundBrandAccent: DSColor {
        DSColor(light: Light.BackgroundContainerColorBrandAccent, dark: Dark.BackgroundContainerColorBrandAccent)
    }

    /// Theme-aware container background color
    public static var containerBackgroundGreige: DSColor {
        DSColor(light: Light.BackgroundContainerColorGreige, dark: Dark.BackgroundContainerColorGreige)
    }

    /// Theme-aware container background color
    public static var containerBackgroundInverse: DSColor {
        DSColor(light: Light.BackgroundContainerColorInverse, dark: Dark.BackgroundContainerColorInverse)
    }

    /// Theme-aware container background color
    public static var containerBackgroundTransparent05: DSColor {
        DSColor(light: Light.BackgroundContainerColorTransparent05, dark: Dark.BackgroundContainerColorTransparent05)
    }

    /// Theme-aware container background color
    public static var containerBackgroundTransparent10: DSColor {
        DSColor(light: Light.BackgroundContainerColorTransparent10, dark: Dark.BackgroundContainerColorTransparent10)
    }

    /// Theme-aware container background color
    public static var containerBackgroundTransparent20: DSColor {
        DSColor(light: Light.BackgroundContainerColorTransparent20, dark: Dark.BackgroundContainerColorTransparent20)
    }

    /// Theme-aware container background color
    public static var containerBackgroundWhite: DSColor {
        DSColor(light: Light.BackgroundContainerColorWhite, dark: Dark.BackgroundContainerColorWhite)
    }

    /// Theme-aware container background color - primary
    public static var containerBackgroundPrimary: DSColor {
        DSColor(light: Light.BackgroundContainerPrimary, dark: Dark.BackgroundContainerPrimary)
    }

    /// Theme-aware container background color - secondary
    public static var containerBackgroundSecondary: DSColor {
        DSColor(light: Light.BackgroundContainerSecondary, dark: Dark.BackgroundContainerSecondary)
    }
}

// MARK: - Input Background Colors

extension DSColor {
    /// Theme-aware input background color
    public static var inputBackgroundBrandFilledDefault: DSColor {
        DSColor(light: Light.BackgroundInputColorBrandFilledDefault, dark: Dark.BackgroundInputColorBrandFilledDefault)
    }

    /// Theme-aware input background color
    public static var inputBackgroundTransparent10Default: DSColor {
        DSColor(light: Light.BackgroundInputColorTransparent10Default, dark: Dark.BackgroundInputColorTransparent10Default)
    }

    /// Theme-aware input background color
    public static var inputBackgroundWhiteOutlinedDefault: DSColor {
        DSColor(light: Light.BackgroundInputColorWhiteOutlinedDefault, dark: Dark.BackgroundInputColorWhiteOutlinedDefault)
    }

    /// Theme-aware input background color
    public static var inputBackgroundWhiteOutlinedInactive: DSColor {
        DSColor(light: Light.BackgroundInputColorWhiteOutlinedInactive, dark: Dark.BackgroundInputColorWhiteOutlinedInactive)
    }

    /// Theme-aware input background color
    public static var inputBackgroundWhiteOutlinedPressed: DSColor {
        DSColor(light: Light.BackgroundInputColorWhiteOutlinedPressed, dark: Dark.BackgroundInputColorWhiteOutlinedPressed)
    }
}

// MARK: - Input Text Colors

extension DSColor {
    /// Theme-aware input text color
    public static var inputTextBrandFilledDefault: DSColor {
        DSColor(light: Light.TextInputColorBrandFilledDefault, dark: Dark.TextInputColorBrandFilledDefault)
    }

    /// Theme-aware input text color
    public static var inputTextTransparent10Active: DSColor {
        DSColor(light: Light.TextInputColorTransparent10Active, dark: Dark.TextInputColorTransparent10Active)
    }

    /// Theme-aware input text color
    public static var inputTextTransparent10Default: DSColor {
        DSColor(light: Light.TextInputColorTransparent10Default, dark: Dark.TextInputColorTransparent10Default)
    }

    /// Theme-aware input text color
    public static var inputTextTransparent10Inactive: DSColor {
        DSColor(light: Light.TextInputColorTransparent10Inactive, dark: Dark.TextInputColorTransparent10Inactive)
    }

    /// Theme-aware input text color
    public static var inputTextWhiteOutlinedDefault: DSColor {
        DSColor(light: Light.TextInputColorWhiteOutlinedDefault, dark: Dark.TextInputColorWhiteOutlinedDefault)
    }
}

// MARK: - Input Border Colors

extension DSColor {
    /// Theme-aware input border color
    public static var inputBorderAccent: DSColor {
        DSColor(light: Light.BorderInputColorAccent, dark: Dark.BorderInputColorAccent)
    }

    /// Theme-aware input border color
    public static var inputBorderAccent2: DSColor {
        DSColor(light: Light.BorderInputColorAccent2, dark: Dark.BorderInputColorAccent2)
    }

    /// Theme-aware input border color
    public static var inputBorderActive: DSColor {
        DSColor(light: Light.BorderInputColorActive, dark: Dark.BorderInputColorActive)
    }

    /// Theme-aware input border color
    public static var inputBorderDefault: DSColor {
        DSColor(light: Light.BorderInputColorDefault, dark: Dark.BorderInputColorDefault)
    }

    /// Theme-aware input border color
    public static var inputBorderError: DSColor {
        DSColor(light: Light.BorderInputColorError, dark: Dark.BorderInputColorError)
    }

    /// Theme-aware input border color
    public static var inputBorderFocus: DSColor {
        DSColor(light: Light.BorderInputColorFocus, dark: Dark.BorderInputColorFocus)
    }

    /// Theme-aware input border color
    public static var inputBorderInactive: DSColor {
        DSColor(light: Light.BorderInputColorInactive, dark: Dark.BorderInputColorInactive)
    }

    /// Theme-aware input border color
    public static var inputBorderPressed: DSColor {
        DSColor(light: Light.BorderInputColorPressed, dark: Dark.BorderInputColorPressed)
    }

    /// Theme-aware input border color
    public static var inputBorderSuccess: DSColor {
        DSColor(light: Light.BorderInputColorSuccess, dark: Dark.BorderInputColorSuccess)
    }

    /// Theme-aware input border color
    public static var inputBorderWarning: DSColor {
        DSColor(light: Light.BorderInputColorWarning, dark: Dark.BorderInputColorWarning)
    }
}

// MARK: - Feedback Background Colors

extension DSColor {
    /// Theme-aware feedback background color
    public static var feedbackBackgroundErrorAccent1: DSColor {
        DSColor(light: Light.BackgroundFeedbackColorErrorAccent1, dark: Dark.BackgroundFeedbackColorErrorAccent1)
    }

    /// Theme-aware feedback background color
    public static var feedbackBackgroundErrorAccent2: DSColor {
        DSColor(light: Light.BackgroundFeedbackColorErrorAccent2, dark: Dark.BackgroundFeedbackColorErrorAccent2)
    }

    /// Theme-aware feedback background color
    public static var feedbackBackgroundInformationalAccent1: DSColor {
        DSColor(light: Light.BackgroundFeedbackColorInformationalAccent1, dark: Dark.BackgroundFeedbackColorInformationalAccent1)
    }

    /// Theme-aware feedback background color
    public static var feedbackBackgroundInformationalAccent2: DSColor {
        DSColor(light: Light.BackgroundFeedbackColorInformationalAccent2, dark: Dark.BackgroundFeedbackColorInformationalAccent2)
    }

    /// Theme-aware feedback background color
    public static var feedbackBackgroundSuccessAccent1: DSColor {
        DSColor(light: Light.BackgroundFeedbackColorSuccessAccent1, dark: Dark.BackgroundFeedbackColorSuccessAccent1)
    }

    /// Theme-aware feedback background color
    public static var feedbackBackgroundSuccessAccent2: DSColor {
        DSColor(light: Light.BackgroundFeedbackColorSuccessAccent2, dark: Dark.BackgroundFeedbackColorSuccessAccent2)
    }

    /// Theme-aware feedback background color
    public static var feedbackBackgroundWarningAccent1: DSColor {
        DSColor(light: Light.BackgroundFeedbackColorWarningAccent1, dark: Dark.BackgroundFeedbackColorWarningAccent1)
    }

    /// Theme-aware feedback background color
    public static var feedbackBackgroundWarningAccent2: DSColor {
        DSColor(light: Light.BackgroundFeedbackColorWarningAccent2, dark: Dark.BackgroundFeedbackColorWarningAccent2)
    }
}

// MARK: - Selector Background Colors

extension DSColor {
    /// Theme-aware selector background color
    public static var selectorBackgroundFilledDefault: DSColor {
        DSColor(light: Light.BackgroundSelectorColorFilledDefault, dark: Dark.BackgroundSelectorColorFilledDefault)
    }

    /// Theme-aware selector background color
    public static var selectorBackgroundFilledInactive: DSColor {
        DSColor(light: Light.BackgroundSelectorColorFilledInactive, dark: Dark.BackgroundSelectorColorFilledInactive)
    }

    /// Theme-aware selector background color
    public static var selectorBackgroundFilledPressed: DSColor {
        DSColor(light: Light.BackgroundSelectorColorFilledPressed, dark: Dark.BackgroundSelectorColorFilledPressed)
    }

    /// Theme-aware selector background color
    public static var selectorBackgroundFilledSelected: DSColor {
        DSColor(light: Light.BackgroundSelectorColorFilledSelected, dark: Dark.BackgroundSelectorColorFilledSelected)
    }

    /// Theme-aware selector background color
    public static var selectorBackgroundFilledSwitchHandleDefault: DSColor {
        DSColor(light: Light.BackgroundSelectorColorFilledSwitchHandleDefault, dark: Dark.BackgroundSelectorColorFilledSwitchHandleDefault)
    }

    /// Theme-aware selector background color
    public static var selectorBackgroundFilledSwitchHandleSelected: DSColor {
        DSColor(light: Light.BackgroundSelectorColorFilledSwitchHandleSelected, dark: Dark.BackgroundSelectorColorFilledSwitchHandleSelected)
    }

    /// Theme-aware selector background color
    public static var selectorBackgroundFilledTransparent: DSColor {
        DSColor(light: Light.BackgroundSelectorColorFilledTransparent, dark: Dark.BackgroundSelectorColorFilledTransparent)
    }

    /// Theme-aware selector background color
    public static var selectorBackgroundOutlineDefault: DSColor {
        DSColor(light: Light.BackgroundSelectorColorOutlineDefault, dark: Dark.BackgroundSelectorColorOutlineDefault)
    }

    /// Theme-aware selector background color
    public static var selectorBackgroundOutlineInactive: DSColor {
        DSColor(light: Light.BackgroundSelectorColorOutlineInactive, dark: Dark.BackgroundSelectorColorOutlineInactive)
    }

    /// Theme-aware selector background color
    public static var selectorBackgroundOutlinePressed: DSColor {
        DSColor(light: Light.BackgroundSelectorColorOutlinePressed, dark: Dark.BackgroundSelectorColorOutlinePressed)
    }

    /// Theme-aware selector background color
    public static var selectorBackgroundOutlineSelected: DSColor {
        DSColor(light: Light.BackgroundSelectorColorOutlineSelected, dark: Dark.BackgroundSelectorColorOutlineSelected)
    }

    /// Theme-aware selector background color
    public static var selectorBackgroundOutlineSelectedAccent: DSColor {
        DSColor(light: Light.BackgroundSelectorColorOutlineSelectedAccent, dark: Dark.BackgroundSelectorColorOutlineSelectedAccent)
    }
}

// MARK: - Text Colors

extension DSColor {
    /// Theme-aware text color
    public static var textOnContainerColorAccent: DSColor {
        DSColor(light: Light.TextOnContainerColorAccent, dark: Dark.TextOnContainerColorAccent)
    }

    /// Theme-aware text color
    public static var textOnContainerColorAccent2: DSColor {
        DSColor(light: Light.TextOnContainerColorAccent2, dark: Dark.TextOnContainerColorAccent2)
    }

    /// Theme-aware text color
    public static var textOnContainerColorError: DSColor {
        DSColor(light: Light.TextOnContainerColorError, dark: Dark.TextOnContainerColorError)
    }

    /// Theme-aware text color
    public static var textOnContainerColorInactive: DSColor {
        DSColor(light: Light.TextOnContainerColorInactive, dark: Dark.TextOnContainerColorInactive)
    }

    /// Theme-aware text color
    public static var textOnContainerColorInformational: DSColor {
        DSColor(light: Light.TextOnContainerColorInformational, dark: Dark.TextOnContainerColorInformational)
    }

    /// Theme-aware text color
    public static var textOnContainerColorInverse: DSColor {
        DSColor(light: Light.TextOnContainerColorInverse, dark: Dark.TextOnContainerColorInverse)
    }

    /// Theme-aware text color
    public static var textOnContainerColorPrimary: DSColor {
        DSColor(light: Light.TextOnContainerColorPrimary, dark: Dark.TextOnContainerColorPrimary)
    }

    /// Theme-aware text color
    public static var textOnContainerColorQuatrenary: DSColor {
        DSColor(light: Light.TextOnContainerColorQuatrenary, dark: Dark.TextOnContainerColorQuatrenary)
    }

    /// Theme-aware text color
    public static var textOnContainerColorSecondary: DSColor {
        DSColor(light: Light.TextOnContainerColorSecondary, dark: Dark.TextOnContainerColorSecondary)
    }

    /// Theme-aware text color
    public static var textOnContainerColorSuccess: DSColor {
        DSColor(light: Light.TextOnContainerColorSuccess, dark: Dark.TextOnContainerColorSuccess)
    }

    /// Theme-aware text color
    public static var textOnContainerColorTertiary: DSColor {
        DSColor(light: Light.TextOnContainerColorTertiary, dark: Dark.TextOnContainerColorTertiary)
    }

    /// Theme-aware text color
    public static var textOnContainerColorWarning: DSColor {
        DSColor(light: Light.TextOnContainerColorWarning, dark: Dark.TextOnContainerColorWarning)
    }

    /// Theme-aware text color
    public static var textOnSurfaceColorAccent: DSColor {
        DSColor(light: Light.TextOnSurfaceColorAccent, dark: Dark.TextOnSurfaceColorAccent)
    }

    /// Theme-aware text color
    public static var textOnSurfaceColorAccent2: DSColor {
        DSColor(light: Light.TextOnSurfaceColorAccent2, dark: Dark.TextOnSurfaceColorAccent2)
    }

    /// Theme-aware text color
    public static var textOnSurfaceColorError: DSColor {
        DSColor(light: Light.TextOnSurfaceColorError, dark: Dark.TextOnSurfaceColorError)
    }

    /// Theme-aware text color
    public static var textOnSurfaceColorInactive: DSColor {
        DSColor(light: Light.TextOnSurfaceColorInactive, dark: Dark.TextOnSurfaceColorInactive)
    }

    /// Theme-aware text color
    public static var textOnSurfaceColorInformational: DSColor {
        DSColor(light: Light.TextOnSurfaceColorInformational, dark: Dark.TextOnSurfaceColorInformational)
    }

    /// Theme-aware text color
    public static var textOnSurfaceColorInverse: DSColor {
        DSColor(light: Light.TextOnSurfaceColorInverse, dark: Dark.TextOnSurfaceColorInverse)
    }

    /// Theme-aware text color
    public static var textOnSurfaceColorPrimary: DSColor {
        DSColor(light: Light.TextOnSurfaceColorPrimary, dark: Dark.TextOnSurfaceColorPrimary)
    }

    /// Theme-aware text color
    public static var textOnSurfaceColorQuatrenary: DSColor {
        DSColor(light: Light.TextOnSurfaceColorQuatrenary, dark: Dark.TextOnSurfaceColorQuatrenary)
    }

    /// Theme-aware text color
    public static var textOnSurfaceColorSecondary: DSColor {
        DSColor(light: Light.TextOnSurfaceColorSecondary, dark: Dark.TextOnSurfaceColorSecondary)
    }

    /// Theme-aware text color
    public static var textOnSurfaceColorSuccess: DSColor {
        DSColor(light: Light.TextOnSurfaceColorSuccess, dark: Dark.TextOnSurfaceColorSuccess)
    }

    /// Theme-aware text color
    public static var textOnSurfaceColorTertiary: DSColor {
        DSColor(light: Light.TextOnSurfaceColorTertiary, dark: Dark.TextOnSurfaceColorTertiary)
    }

    /// Theme-aware text color
    public static var textOnSurfaceColorWarning: DSColor {
        DSColor(light: Light.TextOnSurfaceColorWarning, dark: Dark.TextOnSurfaceColorWarning)
    }

    /// Theme-aware text color - link
    public static var textOnSurfaceColorLink: DSColor {
        DSColor(light: Light.TextOnSurfaceColorLink, dark: Dark.TextOnSurfaceColorLink)
    }

    /// Theme-aware text color - danger (alias for error)
    public static var textOnSurfaceColorDanger: DSColor {
        DSColor(light: Light.TextOnSurfaceColorError, dark: Dark.TextOnSurfaceColorError)
    }

    /// Theme-aware text color - text on brand primary
    public static var textOnBrandColorPrimary: DSColor {
        DSColor(light: Light.TextOnBrandColorPrimary, dark: Dark.TextOnBrandColorPrimary)
    }

    /// Theme-aware text color
    public static var textSelectorColorActive: DSColor {
        DSColor(light: Light.TextSelectorColorActive, dark: Dark.TextSelectorColorActive)
    }

    /// Theme-aware text color
    public static var textSelectorColorDefault: DSColor {
        DSColor(light: Light.TextSelectorColorDefault, dark: Dark.TextSelectorColorDefault)
    }

    /// Theme-aware text color
    public static var textSelectorColorFilledActive: DSColor {
        DSColor(light: Light.TextSelectorColorFilledActive, dark: Dark.TextSelectorColorFilledActive)
    }

    /// Theme-aware text color
    public static var textSelectorColorFilledDefault: DSColor {
        DSColor(light: Light.TextSelectorColorFilledDefault, dark: Dark.TextSelectorColorFilledDefault)
    }

    /// Theme-aware text color
    public static var textSelectorColorFilledInactive: DSColor {
        DSColor(light: Light.TextSelectorColorFilledInactive, dark: Dark.TextSelectorColorFilledInactive)
    }

    /// Theme-aware text color
    public static var textSelectorColorFilledSelected: DSColor {
        DSColor(light: Light.TextSelectorColorFilledSelected, dark: Dark.TextSelectorColorFilledSelected)
    }

    /// Theme-aware text color
    public static var textSelectorColorInactive: DSColor {
        DSColor(light: Light.TextSelectorColorInactive, dark: Dark.TextSelectorColorInactive)
    }

    /// Theme-aware text color
    public static var textSelectorColorOutlineActive: DSColor {
        DSColor(light: Light.TextSelectorColorOutlineActive, dark: Dark.TextSelectorColorOutlineActive)
    }

    /// Theme-aware text color
    public static var textSelectorColorOutlineDefault: DSColor {
        DSColor(light: Light.TextSelectorColorOutlineDefault, dark: Dark.TextSelectorColorOutlineDefault)
    }

    /// Theme-aware text color
    public static var textSelectorColorOutlineInactive: DSColor {
        DSColor(light: Light.TextSelectorColorOutlineInactive, dark: Dark.TextSelectorColorOutlineInactive)
    }

    /// Theme-aware text color
    public static var textSelectorColorOutlineSelected: DSColor {
        DSColor(light: Light.TextSelectorColorOutlineSelected, dark: Dark.TextSelectorColorOutlineSelected)
    }

    /// Theme-aware text color
    public static var textSelectorColorSelected: DSColor {
        DSColor(light: Light.TextSelectorColorSelected, dark: Dark.TextSelectorColorSelected)
    }

    /// Theme-aware text color
    public static var textureNotebookAlt: DSColor {
        DSColor(light: Light.TextureNotebookAlt, dark: Dark.TextureNotebookAlt)
    }
}

// MARK: - Icon Colors

extension DSColor {
    /// Theme-aware icon color - primary
    public static var iconColorPrimary: DSColor {
        DSColor(light: ComponentLight.IconColorPrimary, dark: ComponentDark.IconColorPrimary)
    }

    /// Theme-aware icon color - secondary
    public static var iconColorSecondary: DSColor {
        DSColor(light: ComponentLight.IconColorSecondary, dark: ComponentDark.IconColorSecondary)
    }

    /// Theme-aware icon color - tertiary
    public static var iconColorTertiary: DSColor {
        DSColor(light: ComponentLight.IconColorTertiary, dark: ComponentDark.IconColorTertiary)
    }

    /// Theme-aware icon color - brand (from selector)
    public static var iconColorBrand: DSColor {
        DSColor(light: ComponentLight.IconSelectorColorFilledIconcolorbrand, dark: ComponentDark.IconSelectorColorFilledIconcolorbrand)
    }

    /// Theme-aware icon color - warning (from selector)
    public static var iconColorWarning: DSColor {
        DSColor(light: ComponentLight.IconSelectorColorFilledIconcolorwarning, dark: ComponentDark.IconSelectorColorFilledIconcolorwarning)
    }

    /// Theme-aware icon color - on brand primary (from selector)
    public static var iconOnBrandColorPrimary: DSColor {
        DSColor(light: ComponentLight.IconSelectorColorFilledIcononbrandcolorprimary, dark: ComponentDark.IconSelectorColorFilledIcononbrandcolorprimary)
    }
}

// MARK: - Shadow Colors

extension DSColor {
    /// Theme-aware shadow color - primary (using transparent black)
    public static var shadowColorPrimary: DSColor {
        DSColor(light: Light.TransparentBlackTransparentBlack200, dark: Dark.TransparentBlackTransparentBlack200)
    }
}

// MARK: - Accent Colors

extension DSColor {
    /// Theme-aware accent color
    public static var accentBackgroundBlue: DSColor {
        DSColor(light: Light.BackgroundAccentColorBlue, dark: Dark.BackgroundAccentColorBlue)
    }

    /// Theme-aware accent color
    public static var accentBackgroundBrown: DSColor {
        DSColor(light: Light.BackgroundAccentColorBrown, dark: Dark.BackgroundAccentColorBrown)
    }

    /// Theme-aware accent color
    public static var accentBackgroundGreen: DSColor {
        DSColor(light: Light.BackgroundAccentColorGreen, dark: Dark.BackgroundAccentColorGreen)
    }

    /// Theme-aware accent color
    public static var accentBackgroundRed: DSColor {
        DSColor(light: Light.BackgroundAccentColorRed, dark: Dark.BackgroundAccentColorRed)
    }

    /// Theme-aware accent color
    public static var accentBackgroundYellow: DSColor {
        DSColor(light: Light.BackgroundAccentColorYellow, dark: Dark.BackgroundAccentColorYellow)
    }
}

// MARK: - Overlay Colors

extension DSColor {
    /// Theme-aware overlay color
    public static var overlayBackgroundPageScrim: DSColor {
        DSColor(light: Light.BackgroundOverlayColorPageScrim, dark: Dark.BackgroundOverlayColorPageScrim)
    }
}

// MARK: - Brand Colors

extension DSColor {
    /// Theme-aware brand color
    public static var brand025: DSColor {
        DSColor(light: Light.Brand025, dark: Dark.Brand025)
    }

    /// Theme-aware brand color
    public static var brand050: DSColor {
        DSColor(light: Light.Brand050, dark: Dark.Brand050)
    }

    /// Theme-aware brand color
    public static var brand100: DSColor {
        DSColor(light: Light.Brand100, dark: Dark.Brand100)
    }

    /// Theme-aware brand color
    public static var brand200: DSColor {
        DSColor(light: Light.Brand200, dark: Dark.Brand200)
    }

    /// Theme-aware brand color
    public static var brand300: DSColor {
        DSColor(light: Light.Brand300, dark: Dark.Brand300)
    }

    /// Theme-aware brand color
    public static var brand400: DSColor {
        DSColor(light: Light.Brand400, dark: Dark.Brand400)
    }

    /// Theme-aware brand color
    public static var brand500: DSColor {
        DSColor(light: Light.Brand500, dark: Dark.Brand500)
    }

    /// Theme-aware brand color
    public static var brand600: DSColor {
        DSColor(light: Light.Brand600, dark: Dark.Brand600)
    }

    /// Theme-aware brand color
    public static var brand700: DSColor {
        DSColor(light: Light.Brand700, dark: Dark.Brand700)
    }

    /// Theme-aware brand color
    public static var brand800: DSColor {
        DSColor(light: Light.Brand800, dark: Dark.Brand800)
    }

    /// Theme-aware brand color
    public static var brand900: DSColor {
        DSColor(light: Light.Brand900, dark: Dark.Brand900)
    }

    /// Theme-aware brand color
    public static var brand950: DSColor {
        DSColor(light: Light.Brand950, dark: Dark.Brand950)
    }
}

// MARK: - Other Colors

extension DSColor {
    /// Theme-aware other color
    public static var backgroundActionColorPrimary: DSColor {
        DSColor(light: Light.BackgroundActionColorPrimary, dark: Dark.BackgroundActionColorPrimary)
    }

    /// Theme-aware other color
    public static var backgroundActionColorSecondary: DSColor {
        DSColor(light: Light.BackgroundActionColorSecondary, dark: Dark.BackgroundActionColorSecondary)
    }

    /// Theme-aware other color
    public static var backgroundSurfaceColorGreige: DSColor {
        DSColor(light: Light.BackgroundSurfaceColorGreige, dark: Dark.BackgroundSurfaceColorGreige)
    }

    /// Theme-aware other color
    public static var backgroundSurfaceColorInverse: DSColor {
        DSColor(light: Light.BackgroundSurfaceColorInverse, dark: Dark.BackgroundSurfaceColorInverse)
    }

    /// Theme-aware other color
    public static var backgroundSurfaceColorSecondary: DSColor {
        DSColor(light: Light.BackgroundSurfaceColorSecondary, dark: Dark.BackgroundSurfaceColorSecondary)
    }

    /// Theme-aware other color
    public static var backgroundSurfaceColorTertiary: DSColor {
        DSColor(light: Light.BackgroundSurfaceColorTertiary, dark: Dark.BackgroundSurfaceColorTertiary)
    }

    /// Theme-aware other color
    public static var borderOnContainerActive: DSColor {
        DSColor(light: Light.BorderOnContainerActive, dark: Dark.BorderOnContainerActive)
    }

    /// Theme-aware other color
    public static var borderOnContainerDefault: DSColor {
        DSColor(light: Light.BorderOnContainerDefault, dark: Dark.BorderOnContainerDefault)
    }

    /// Theme-aware other color
    public static var borderOnContainerInactive: DSColor {
        DSColor(light: Light.BorderOnContainerInactive, dark: Dark.BorderOnContainerInactive)
    }

    /// Theme-aware other color
    public static var borderOnContainerInverse: DSColor {
        DSColor(light: Light.BorderOnContainerInverse, dark: Dark.BorderOnContainerInverse)
    }

    /// Theme-aware other color
    public static var borderOnContainerPressed: DSColor {
        DSColor(light: Light.BorderOnContainerPressed, dark: Dark.BorderOnContainerPressed)
    }

    /// Theme-aware border color - primary
    public static var borderColorPrimary: DSColor {
        DSColor(light: Light.BorderColorPrimary, dark: Dark.BorderColorPrimary)
    }

    /// Theme-aware border color - focus state
    public static var borderColorFocus: DSColor {
        DSColor(light: Light.BorderColorFocus, dark: Dark.BorderColorFocus)
    }

    /// Theme-aware border color - secondary (alias for border on container default)
    public static var borderColorSecondary: DSColor {
        DSColor(light: Light.BorderOnContainerDefault, dark: Dark.BorderOnContainerDefault)
    }

    /// Theme-aware border color - transparent 10% (alias for transparent black 100)
    public static var borderColorTransparent10: DSColor {
        DSColor(light: Light.TransparentBlackTransparentBlack100, dark: Dark.TransparentBlackTransparentBlack100)
    }

    /// Theme-aware other color
    public static var borderSelectorColorFilledDefault: DSColor {
        DSColor(light: Light.BorderSelectorColorFilledDefault, dark: Dark.BorderSelectorColorFilledDefault)
    }

    /// Theme-aware other color
    public static var borderSelectorColorFilledInactive: DSColor {
        DSColor(light: Light.BorderSelectorColorFilledInactive, dark: Dark.BorderSelectorColorFilledInactive)
    }

    /// Theme-aware other color
    public static var borderSelectorColorFilledPressed: DSColor {
        DSColor(light: Light.BorderSelectorColorFilledPressed, dark: Dark.BorderSelectorColorFilledPressed)
    }

    /// Theme-aware other color
    public static var borderSelectorColorFilledSelected: DSColor {
        DSColor(light: Light.BorderSelectorColorFilledSelected, dark: Dark.BorderSelectorColorFilledSelected)
    }

    /// Theme-aware other color
    public static var borderSelectorColorOutlineDefault: DSColor {
        DSColor(light: Light.BorderSelectorColorOutlineDefault, dark: Dark.BorderSelectorColorOutlineDefault)
    }

    /// Theme-aware other color
    public static var borderSelectorColorOutlineInactive: DSColor {
        DSColor(light: Light.BorderSelectorColorOutlineInactive, dark: Dark.BorderSelectorColorOutlineInactive)
    }

    /// Theme-aware other color
    public static var borderSelectorColorOutlinePressed: DSColor {
        DSColor(light: Light.BorderSelectorColorOutlinePressed, dark: Dark.BorderSelectorColorOutlinePressed)
    }

    /// Theme-aware other color
    public static var borderSelectorColorOutlineSelected: DSColor {
        DSColor(light: Light.BorderSelectorColorOutlineSelected, dark: Dark.BorderSelectorColorOutlineSelected)
    }

    /// Theme-aware other color
    public static var borderSelectorColorOutlineSelectedAccent: DSColor {
        DSColor(light: Light.BorderSelectorColorOutlineSelectedAccent, dark: Dark.BorderSelectorColorOutlineSelectedAccent)
    }

    /// Theme-aware other color
    public static var cinnabar025: DSColor {
        DSColor(light: Light.Cinnabar025, dark: Dark.Cinnabar025)
    }

    /// Theme-aware other color
    public static var cinnabar050: DSColor {
        DSColor(light: Light.Cinnabar050, dark: Dark.Cinnabar050)
    }

    /// Theme-aware other color
    public static var cinnabar100: DSColor {
        DSColor(light: Light.Cinnabar100, dark: Dark.Cinnabar100)
    }

    /// Theme-aware other color
    public static var cinnabar200: DSColor {
        DSColor(light: Light.Cinnabar200, dark: Dark.Cinnabar200)
    }

    /// Theme-aware other color
    public static var cinnabar300: DSColor {
        DSColor(light: Light.Cinnabar300, dark: Dark.Cinnabar300)
    }

    /// Theme-aware other color
    public static var cinnabar400: DSColor {
        DSColor(light: Light.Cinnabar400, dark: Dark.Cinnabar400)
    }

    /// Theme-aware other color
    public static var cinnabar500: DSColor {
        DSColor(light: Light.Cinnabar500, dark: Dark.Cinnabar500)
    }

    /// Theme-aware other color
    public static var cinnabar600: DSColor {
        DSColor(light: Light.Cinnabar600, dark: Dark.Cinnabar600)
    }

    /// Theme-aware other color
    public static var cinnabar700: DSColor {
        DSColor(light: Light.Cinnabar700, dark: Dark.Cinnabar700)
    }

    /// Theme-aware other color
    public static var cinnabar800: DSColor {
        DSColor(light: Light.Cinnabar800, dark: Dark.Cinnabar800)
    }

    /// Theme-aware other color
    public static var cinnabar900: DSColor {
        DSColor(light: Light.Cinnabar900, dark: Dark.Cinnabar900)
    }

    /// Theme-aware other color
    public static var cinnabar950: DSColor {
        DSColor(light: Light.Cinnabar950, dark: Dark.Cinnabar950)
    }

    /// Theme-aware other color
    public static var greige025: DSColor {
        DSColor(light: Light.Greige025, dark: Dark.Greige025)
    }

    /// Theme-aware other color
    public static var greige050: DSColor {
        DSColor(light: Light.Greige050, dark: Dark.Greige050)
    }

    /// Theme-aware other color
    public static var greige100: DSColor {
        DSColor(light: Light.Greige100, dark: Dark.Greige100)
    }

    /// Theme-aware other color
    public static var greige200: DSColor {
        DSColor(light: Light.Greige200, dark: Dark.Greige200)
    }

    /// Theme-aware other color
    public static var greige300: DSColor {
        DSColor(light: Light.Greige300, dark: Dark.Greige300)
    }

    /// Theme-aware other color
    public static var greige400: DSColor {
        DSColor(light: Light.Greige400, dark: Dark.Greige400)
    }

    /// Theme-aware other color
    public static var greige500: DSColor {
        DSColor(light: Light.Greige500, dark: Dark.Greige500)
    }

    /// Theme-aware other color
    public static var greige600: DSColor {
        DSColor(light: Light.Greige600, dark: Dark.Greige600)
    }

    /// Theme-aware other color
    public static var greige700: DSColor {
        DSColor(light: Light.Greige700, dark: Dark.Greige700)
    }

    /// Theme-aware other color
    public static var greige800: DSColor {
        DSColor(light: Light.Greige800, dark: Dark.Greige800)
    }

    /// Theme-aware other color
    public static var greige900: DSColor {
        DSColor(light: Light.Greige900, dark: Dark.Greige900)
    }

    /// Theme-aware other color
    public static var greige950: DSColor {
        DSColor(light: Light.Greige950, dark: Dark.Greige950)
    }

    /// Theme-aware other color
    public static var lemon025: DSColor {
        DSColor(light: Light.Lemon025, dark: Dark.Lemon025)
    }

    /// Theme-aware other color
    public static var lemon050: DSColor {
        DSColor(light: Light.Lemon050, dark: Dark.Lemon050)
    }

    /// Theme-aware other color
    public static var lemon100: DSColor {
        DSColor(light: Light.Lemon100, dark: Dark.Lemon100)
    }

    /// Theme-aware other color
    public static var lemon200: DSColor {
        DSColor(light: Light.Lemon200, dark: Dark.Lemon200)
    }

    /// Theme-aware other color
    public static var lemon300: DSColor {
        DSColor(light: Light.Lemon300, dark: Dark.Lemon300)
    }

    /// Theme-aware other color
    public static var lemon400: DSColor {
        DSColor(light: Light.Lemon400, dark: Dark.Lemon400)
    }

    /// Theme-aware other color
    public static var lemon500: DSColor {
        DSColor(light: Light.Lemon500, dark: Dark.Lemon500)
    }

    /// Theme-aware other color
    public static var lemon600: DSColor {
        DSColor(light: Light.Lemon600, dark: Dark.Lemon600)
    }

    /// Theme-aware other color
    public static var lemon700: DSColor {
        DSColor(light: Light.Lemon700, dark: Dark.Lemon700)
    }

    /// Theme-aware other color
    public static var lemon800: DSColor {
        DSColor(light: Light.Lemon800, dark: Dark.Lemon800)
    }

    /// Theme-aware other color
    public static var lemon900: DSColor {
        DSColor(light: Light.Lemon900, dark: Dark.Lemon900)
    }

    /// Theme-aware other color
    public static var lemon950: DSColor {
        DSColor(light: Light.Lemon950, dark: Dark.Lemon950)
    }

    /// Theme-aware other color
    public static var moonlight025: DSColor {
        DSColor(light: Light.Moonlight025, dark: Dark.Moonlight025)
    }

    /// Theme-aware other color
    public static var moonlight050: DSColor {
        DSColor(light: Light.Moonlight050, dark: Dark.Moonlight050)
    }

    /// Theme-aware other color
    public static var moonlight100: DSColor {
        DSColor(light: Light.Moonlight100, dark: Dark.Moonlight100)
    }

    /// Theme-aware other color
    public static var moonlight200: DSColor {
        DSColor(light: Light.Moonlight200, dark: Dark.Moonlight200)
    }

    /// Theme-aware other color
    public static var moonlight300: DSColor {
        DSColor(light: Light.Moonlight300, dark: Dark.Moonlight300)
    }

    /// Theme-aware other color
    public static var moonlight400: DSColor {
        DSColor(light: Light.Moonlight400, dark: Dark.Moonlight400)
    }

    /// Theme-aware other color
    public static var moonlight500: DSColor {
        DSColor(light: Light.Moonlight500, dark: Dark.Moonlight500)
    }

    /// Theme-aware other color
    public static var moonlight600: DSColor {
        DSColor(light: Light.Moonlight600, dark: Dark.Moonlight600)
    }

    /// Theme-aware other color
    public static var moonlight700: DSColor {
        DSColor(light: Light.Moonlight700, dark: Dark.Moonlight700)
    }

    /// Theme-aware other color
    public static var moonlight800: DSColor {
        DSColor(light: Light.Moonlight800, dark: Dark.Moonlight800)
    }

    /// Theme-aware other color
    public static var moonlight900: DSColor {
        DSColor(light: Light.Moonlight900, dark: Dark.Moonlight900)
    }

    /// Theme-aware other color
    public static var moonlight950: DSColor {
        DSColor(light: Light.Moonlight950, dark: Dark.Moonlight950)
    }

    /// Theme-aware other color
    public static var neutralsBlack: DSColor {
        DSColor(light: Light.NeutralsBlack, dark: Dark.NeutralsBlack)
    }

    /// Theme-aware other color
    public static var neutralsTransparent: DSColor {
        DSColor(light: Light.NeutralsTransparent, dark: Dark.NeutralsTransparent)
    }

    /// Theme-aware other color
    public static var neutralsWhite: DSColor {
        DSColor(light: Light.NeutralsWhite, dark: Dark.NeutralsWhite)
    }

    /// Theme-aware other color
    public static var overlayPressedDarken: DSColor {
        DSColor(light: Light.OverlayPressedDarken, dark: Dark.OverlayPressedDarken)
    }

    /// Theme-aware other color
    public static var overlayPressedDarkenMore: DSColor {
        DSColor(light: Light.OverlayPressedDarkenMore, dark: Dark.OverlayPressedDarkenMore)
    }

    /// Theme-aware other color
    public static var overlayPressedLighten: DSColor {
        DSColor(light: Light.OverlayPressedLighten, dark: Dark.OverlayPressedLighten)
    }

    /// Theme-aware other color
    public static var overlayPressedLightenMore: DSColor {
        DSColor(light: Light.OverlayPressedLightenMore, dark: Dark.OverlayPressedLightenMore)
    }

    /// Theme-aware other color
    public static var transparentBlackTransparentBlack025: DSColor {
        DSColor(light: Light.TransparentBlackTransparentBlack025, dark: Dark.TransparentBlackTransparentBlack025)
    }

    /// Theme-aware other color
    public static var transparentBlackTransparentBlack050: DSColor {
        DSColor(light: Light.TransparentBlackTransparentBlack050, dark: Dark.TransparentBlackTransparentBlack050)
    }

    /// Theme-aware other color
    public static var transparentBlackTransparentBlack075: DSColor {
        DSColor(light: Light.TransparentBlackTransparentBlack075, dark: Dark.TransparentBlackTransparentBlack075)
    }

    /// Theme-aware other color
    public static var transparentBlackTransparentBlack100: DSColor {
        DSColor(light: Light.TransparentBlackTransparentBlack100, dark: Dark.TransparentBlackTransparentBlack100)
    }

    /// Theme-aware other color
    public static var transparentBlackTransparentBlack200: DSColor {
        DSColor(light: Light.TransparentBlackTransparentBlack200, dark: Dark.TransparentBlackTransparentBlack200)
    }

    /// Theme-aware other color
    public static var transparentBlackTransparentBlack300: DSColor {
        DSColor(light: Light.TransparentBlackTransparentBlack300, dark: Dark.TransparentBlackTransparentBlack300)
    }

    /// Theme-aware other color
    public static var transparentBlackTransparentBlack400: DSColor {
        DSColor(light: Light.TransparentBlackTransparentBlack400, dark: Dark.TransparentBlackTransparentBlack400)
    }

    /// Theme-aware other color
    public static var transparentBlackTransparentBlack500: DSColor {
        DSColor(light: Light.TransparentBlackTransparentBlack500, dark: Dark.TransparentBlackTransparentBlack500)
    }

    /// Theme-aware other color
    public static var transparentBlackTransparentBlack600: DSColor {
        DSColor(light: Light.TransparentBlackTransparentBlack600, dark: Dark.TransparentBlackTransparentBlack600)
    }

    /// Theme-aware other color
    public static var transparentBlackTransparentBlack700: DSColor {
        DSColor(light: Light.TransparentBlackTransparentBlack700, dark: Dark.TransparentBlackTransparentBlack700)
    }

    /// Theme-aware other color
    public static var transparentBlackTransparentBlack800: DSColor {
        DSColor(light: Light.TransparentBlackTransparentBlack800, dark: Dark.TransparentBlackTransparentBlack800)
    }

    /// Theme-aware other color
    public static var transparentBlackTransparentBlack900: DSColor {
        DSColor(light: Light.TransparentBlackTransparentBlack900, dark: Dark.TransparentBlackTransparentBlack900)
    }

    /// Theme-aware other color
    public static var transparentBlackTransparentBlack950: DSColor {
        DSColor(light: Light.TransparentBlackTransparentBlack950, dark: Dark.TransparentBlackTransparentBlack950)
    }

    /// Theme-aware other color
    public static var transparentWhiteTransparentWhite025: DSColor {
        DSColor(light: Light.TransparentWhiteTransparentWhite025, dark: Dark.TransparentWhiteTransparentWhite025)
    }

    /// Theme-aware other color
    public static var transparentWhiteTransparentWhite050: DSColor {
        DSColor(light: Light.TransparentWhiteTransparentWhite050, dark: Dark.TransparentWhiteTransparentWhite050)
    }

    /// Theme-aware other color
    public static var transparentWhiteTransparentWhite075: DSColor {
        DSColor(light: Light.TransparentWhiteTransparentWhite075, dark: Dark.TransparentWhiteTransparentWhite075)
    }

    /// Theme-aware other color
    public static var transparentWhiteTransparentWhite100: DSColor {
        DSColor(light: Light.TransparentWhiteTransparentWhite100, dark: Dark.TransparentWhiteTransparentWhite100)
    }

    /// Theme-aware other color
    public static var transparentWhiteTransparentWhite200: DSColor {
        DSColor(light: Light.TransparentWhiteTransparentWhite200, dark: Dark.TransparentWhiteTransparentWhite200)
    }

    /// Theme-aware other color
    public static var transparentWhiteTransparentWhite300: DSColor {
        DSColor(light: Light.TransparentWhiteTransparentWhite300, dark: Dark.TransparentWhiteTransparentWhite300)
    }

    /// Theme-aware other color
    public static var transparentWhiteTransparentWhite400: DSColor {
        DSColor(light: Light.TransparentWhiteTransparentWhite400, dark: Dark.TransparentWhiteTransparentWhite400)
    }

    /// Theme-aware other color
    public static var transparentWhiteTransparentWhite500: DSColor {
        DSColor(light: Light.TransparentWhiteTransparentWhite500, dark: Dark.TransparentWhiteTransparentWhite500)
    }

    /// Theme-aware other color
    public static var transparentWhiteTransparentWhite600: DSColor {
        DSColor(light: Light.TransparentWhiteTransparentWhite600, dark: Dark.TransparentWhiteTransparentWhite600)
    }

    /// Theme-aware other color
    public static var transparentWhiteTransparentWhite700: DSColor {
        DSColor(light: Light.TransparentWhiteTransparentWhite700, dark: Dark.TransparentWhiteTransparentWhite700)
    }

    /// Theme-aware other color
    public static var transparentWhiteTransparentWhite800: DSColor {
        DSColor(light: Light.TransparentWhiteTransparentWhite800, dark: Dark.TransparentWhiteTransparentWhite800)
    }

    /// Theme-aware other color
    public static var transparentWhiteTransparentWhite900: DSColor {
        DSColor(light: Light.TransparentWhiteTransparentWhite900, dark: Dark.TransparentWhiteTransparentWhite900)
    }

    /// Theme-aware other color
    public static var transparentWhiteTransparentWhite950: DSColor {
        DSColor(light: Light.TransparentWhiteTransparentWhite950, dark: Dark.TransparentWhiteTransparentWhite950)
    }
}
