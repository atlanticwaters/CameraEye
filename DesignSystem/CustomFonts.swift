import SwiftUI

// MARK: - Custom Font Extension
// Provides easy access to the custom THD font family from the design system
extension Font {
    
    // MARK: - Display Font Family (THD LgVar Beta)
    // Used for large, attention-grabbing text like heroes and headers
    static func thdDisplay(size: CGFloat, weight: Font.Weight = .regular) -> Font {
        return .custom(DesignSystemGlobal.FontFamilyDisplay, size: size)
    }
    
    // MARK: - Informational Font Family (THD SmVar Beta)
    // Used for body text, captions, and informational content
    static func thdInformational(size: CGFloat, weight: Font.Weight = .regular) -> Font {
        return .custom(DesignSystemGlobal.FontFamilyInformational, size: size)
    }
    
    // MARK: - Design System Typography Scale
    // These match the token sizes from the design system files
    
    // Hero sizes (largest)
    static var thdHero1: Font {
        .thdDisplay(size: DesignSystemGlobal.FontSizeHero1)
    }
    
    static var thdHero2: Font {
        .thdDisplay(size: DesignSystemGlobal.FontSizeHero2)
    }
    
    static var thdHero3: Font {
        .thdDisplay(size: DesignSystemGlobal.FontSizeHero3)
    }
    
    static var thdHero4: Font {
        .thdDisplay(size: DesignSystemGlobal.FontSizeHero4)
    }
    
    static var thdHero5: Font {
        .thdDisplay(size: DesignSystemGlobal.FontSizeHero5)
    }
    
    // Heading sizes
    static var thdH1: Font {
        .thdDisplay(size: DesignSystemGlobal.FontSizeH1)
    }
    
    static var thdH2: Font {
        .thdDisplay(size: DesignSystemGlobal.FontSizeH2)
    }
    
    static var thdH3: Font {
        .thdDisplay(size: DesignSystemGlobal.FontSizeH3)
    }
    
    static var thdH4: Font {
        .thdDisplay(size: DesignSystemGlobal.FontSizeH4)
    }
    
    static var thdH5: Font {
        .thdDisplay(size: DesignSystemGlobal.FontSizeH5)
    }
    
    static var thdH6: Font {
        .thdDisplay(size: DesignSystemGlobal.FontSizeH6)
    }
    
    // Body text sizes
    static var thdBodyXL: Font {
        .thdInformational(size: DesignSystemGlobal.FontSizeBodyXl)
    }
    
    static var thdBodyLg: Font {
        .thdInformational(size: DesignSystemGlobal.FontSizeBodyLg)
    }
    
    static var thdBodyMd: Font {
        .thdInformational(size: DesignSystemGlobal.FontSizeBodyMd)
    }
    
    static var thdBodySm: Font {
        .thdInformational(size: DesignSystemGlobal.FontSizeBodySm)
    }
    
    static var thdBodyXs: Font {
        .thdInformational(size: DesignSystemGlobal.FontSizeBodyXs)
    }
    
    static var thdCaption: Font {
        .thdInformational(size: DesignSystemGlobal.FontSizeCaption)
    }
}

// MARK: - Font Registration Helper
// Call this early in your app lifecycle to register custom fonts
struct CustomFontRegistration {
    
    // MARK: - Font File Configuration
    // Update these to match your actual font file names (without extension)
    // These are the FILENAMES, not the PostScript names
    private static let fontFileMapping: [(fileName: String, postScriptName: String)] = [
        // TODO: Update these filenames to match your actual font files in Xcode
        // Example: ("THDLgVarBeta", "THD LgVar Beta")
        ("THD LgVar Beta", DesignSystemGlobal.FontFamilyDisplay),       // Display font
        ("THD SmVar Beta", DesignSystemGlobal.FontFamilyInformational)  // Informational font
    ]
    
    static func registerFonts() {
        print("\n🔍 Starting font registration...")
        
        // First, list all font files in bundle for debugging
        listFontFilesInBundle()
        
        for (fileName, postScriptName) in fontFileMapping {
            registerFont(fileName: fileName, expectedPostScriptName: postScriptName)
        }
        
        print("✅ Font registration complete\n")
    }
    
    private static func registerFont(fileName: String, expectedPostScriptName: String) {
        // Try different font file extensions
        let extensions = ["ttf", "otf"]
        
        for ext in extensions {
            if let fontURL = Bundle.main.url(forResource: fileName, withExtension: ext) {
                var errorRef: Unmanaged<CFError>?
                
                if CTFontManagerRegisterFontsForURL(fontURL as CFURL, .process, &errorRef) {
                    print("✅ Successfully registered font file: \(fileName).\(ext)")
                    
                    // Verify the font is actually available with expected name
                    if let uiFont = UIFont(name: expectedPostScriptName, size: 16) {
                        print("   ✅ Font is accessible as: '\(expectedPostScriptName)'")
                        print("   📝 PostScript name: \(uiFont.fontName)")
                        print("   👨‍👩‍👧‍👦 Family name: \(uiFont.familyName)")
                    } else {
                        print("   ⚠️ Font registered but not accessible with name '\(expectedPostScriptName)'")
                        print("   💡 The PostScript name might be different. Check available fonts:")
                        
                        // Try to find what name it registered under
                        if let descriptor = CTFontManagerCreateFontDescriptorsFromURL(fontURL as CFURL) as? [CTFontDescriptor],
                           let firstDescriptor = descriptor.first {
                            if let actualName = CTFontDescriptorCopyAttribute(firstDescriptor, kCTFontNameAttribute) as? String {
                                print("   📝 Actual PostScript name: '\(actualName)'")
                            }
                            if let familyName = CTFontDescriptorCopyAttribute(firstDescriptor, kCTFontFamilyNameAttribute) as? String {
                                print("   👨‍👩‍👧‍👦 Actual Family name: '\(familyName)'")
                            }
                        }
                    }
                    return
                } else if let error = errorRef?.takeRetainedValue() {
                    print("❌ Failed to register font \(fileName).\(ext): \(error)")
                }
            }
        }
        
        // If we get here, font file wasn't found
        print("⚠️ Font file not found: '\(fileName)' (tried .ttf and .otf)")
        print("   Make sure the font file is added to your Xcode project target.")
        print("   Also ensure it's listed in Info.plist under 'Fonts provided by application' (UIAppFonts).")
    }
    
    /// Lists all font files found in the bundle for debugging
    private static func listFontFilesInBundle() {
        print("\n📦 Font files in bundle:")
        
        let extensions = ["ttf", "otf"]
        var foundFiles: [String] = []
        
        for ext in extensions {
            if let urls = Bundle.main.urls(forResourcesWithExtension: ext, subdirectory: nil) {
                for url in urls {
                    let fileName = url.lastPathComponent
                    foundFiles.append(fileName)
                    print("   • \(fileName)")
                }
            }
        }
        
        if foundFiles.isEmpty {
            print("   ⚠️ No .ttf or .otf files found in bundle!")
            print("   Make sure font files are added to your target's 'Copy Bundle Resources' build phase.")
        }
        print("")
    }
    
    /// Lists all available fonts in the bundle for debugging
    static func listAvailableFonts() {
        print("\n📋 Available Font Families:")
        for family in UIFont.familyNames.sorted() {
            print("  • \(family)")
            for name in UIFont.fontNames(forFamilyName: family) {
                print("    - \(name)")
            }
        }
        print("\n")
    }
}

// MARK: - View Modifier for Custom Fonts
// Applies the appropriate custom font based on text style
struct CustomFontModifier: ViewModifier {
    let textStyle: TextStyle
    
    enum TextStyle {
        case hero1, hero2, hero3, hero4, hero5
        case h1, h2, h3, h4, h5, h6
        case bodyXL, bodyLg, bodyMd, bodySm, bodyXs
        case caption
        
        var font: Font {
            switch self {
            case .hero1: return .thdHero1
            case .hero2: return .thdHero2
            case .hero3: return .thdHero3
            case .hero4: return .thdHero4
            case .hero5: return .thdHero5
            case .h1: return .thdH1
            case .h2: return .thdH2
            case .h3: return .thdH3
            case .h4: return .thdH4
            case .h5: return .thdH5
            case .h6: return .thdH6
            case .bodyXL: return .thdBodyXL
            case .bodyLg: return .thdBodyLg
            case .bodyMd: return .thdBodyMd
            case .bodySm: return .thdBodySm
            case .bodyXs: return .thdBodyXs
            case .caption: return .thdCaption
            }
        }
    }
    
    func body(content: Content) -> some View {
        content.font(textStyle.font)
    }
}

// MARK: - View Extension
extension View {
    func thdFont(_ style: CustomFontModifier.TextStyle) -> some View {
        modifier(CustomFontModifier(textStyle: style))
    }
}
