import SwiftUI
import UIKit

// MARK: - Font Verification View
/// Temporary view to verify that custom fonts are loading correctly
/// This view should be used during development to debug font issues

struct FontVerificationView: View {
    @State private var availableFonts: [String] = []
    @State private var customFontsFound: [String: Bool] = [:]
    
    var body: some View {
        NavigationView {
            List {
                Section("Custom Font Status") {
                    ForEach(Array(customFontsFound.keys.sorted()), id: \.self) { fontName in
                        HStack {
                            Image(systemName: customFontsFound[fontName] == true ? "checkmark.circle.fill" : "xmark.circle.fill")
                                .foregroundColor(customFontsFound[fontName] == true ? .green : .red)
                            
                            Text(fontName)
                                .font(.system(size: 16, design: .monospaced))
                        }
                    }
                }
                
                Section("Font Display Test") {
                    // Test Display Font (THD LgVar Beta)
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Display Font Test")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        Text("The Quick Brown Fox")
                            .font(.custom("THD LgVar Beta", size: 24))
                        
                        Text("Fallback: The Quick Brown Fox")
                            .font(.system(size: 24, weight: .bold, design: .default))
                            .foregroundColor(.orange)
                    }
                    
                    // Test Informational Font (THD SmVar Beta)
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Informational Font Test")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        Text("The Quick Brown Fox Jumps Over The Lazy Dog")
                            .font(.custom("THD SmVar Beta", size: 16))
                        
                        Text("Fallback: The Quick Brown Fox Jumps Over The Lazy Dog")
                            .font(.system(size: 16, weight: .regular, design: .default))
                            .foregroundColor(.orange)
                    }
                }
                
                Section("Typography Demo Test") {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Using .thdFont() modifiers:")
                            .font(.caption)
                            .foregroundColor(.secondary)
                        
                        Text("Hero 1 Text")
                            .thdFont(.hero1)
                        
                        Text("H1 Heading")
                            .thdFont(.h1)
                        
                        Text("Body Medium Text")
                            .thdFont(.bodyMd)
                        
                        Text("Caption Text")
                            .thdFont(.caption)
                    }
                }
                
                Section("All Available Fonts") {
                    ForEach(availableFonts, id: \.self) { fontName in
                        Text(fontName)
                            .font(.system(size: 12, design: .monospaced))
                    }
                }
            }
            .navigationTitle("Font Verification")
            .onAppear {
                checkCustomFonts()
                loadAvailableFonts()
            }
            .toolbar {
                Button("Refresh") {
                    checkCustomFonts()
                    loadAvailableFonts()
                }
            }
        }
    }
    
    private func checkCustomFonts() {
        let customFontNames = [
            "THD LgVar Beta",
            "THD SmVar Beta"
        ]
        
        customFontsFound.removeAll()
        
        for fontName in customFontNames {
            // Check if the font is available by trying to create it
            let testFont = UIFont(name: fontName, size: 16)
            customFontsFound[fontName] = testFont != nil
        }
        
        // Print debug information
        print("\n🔍 Font Verification Results:")
        for (fontName, isFound) in customFontsFound {
            print("  \(isFound ? "✅" : "❌") \(fontName)")
        }
        print("")
    }
    
    private func loadAvailableFonts() {
        availableFonts = UIFont.familyNames.flatMap { family in
            UIFont.fontNames(forFamilyName: family)
        }.sorted()
    }
}

// MARK: - Preview
#Preview("Font Verification") {
    FontVerificationView()
}