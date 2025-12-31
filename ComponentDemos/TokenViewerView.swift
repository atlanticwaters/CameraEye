//
// TokenViewerView.swift
//
// Comprehensive Design Token Viewer
// Displays all design tokens organized by category with light/dark mode toggle
//

import SwiftUI

// MARK: - Token Category Enum
enum TokenCategory: String, CaseIterable, Identifiable {
    case backgrounds = "Backgrounds"
    case borders = "Borders"
    case text = "Text"
    case icons = "Icons"
    case brand = "Brand Colors"
    case semantic = "Semantic Colors"
    case spacing = "Spacing"
    case elevation = "Elevation"
    case typography = "Typography"
    
    var id: String { rawValue }
    
    var icon: String {
        switch self {
        case .backgrounds: return "square.fill"
        case .borders: return "square.dashed"
        case .text: return "textformat"
        case .icons: return "star.fill"
        case .brand: return "paintpalette.fill"
        case .semantic: return "circle.hexagongrid.fill"
        case .spacing: return "arrow.left.and.right"
        case .elevation: return "square.stack.3d.up.fill"
        case .typography: return "character"
        }
    }
}

// MARK: - Token Item Model
struct TokenItem: Identifiable {
    let id = UUID()
    let name: String
    let lightValue: Any
    let darkValue: Any
    let semanticUse: String
    
    var isColor: Bool {
        lightValue is Color || darkValue is Color
    }
    
    var isCGFloat: Bool {
        lightValue is CGFloat || darkValue is CGFloat
    }
    
    var isString: Bool {
        lightValue is String || darkValue is String
    }
}

// MARK: - Main Token Viewer View
struct TokenViewerView: View {
    @State private var isDarkMode: Bool = false
    @State private var selectedCategory: TokenCategory = .backgrounds
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Mode Toggle Header
                modeToggleHeader
                
                // Category Picker
                categoryPicker
                
                // Search Bar
                searchBar
                
                // Token List
                tokenList
            }
            .background(isDarkMode ? Color(red: 0.051, green: 0.051, blue: 0.051) : Color(red: 0.973, green: 0.961, blue: 0.949))
            .navigationTitle("Design Tokens")
            .navigationBarTitleDisplayMode(.inline)
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
    
    // MARK: - Mode Toggle Header
    private var modeToggleHeader: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(isDarkMode ? "Dark Mode" : "Light Mode")
                    .font(.headline)
                    .foregroundStyle(isDarkMode ? .white : .black)
                Text("Toggle to compare token values")
                    .font(.caption)
                    .foregroundStyle(isDarkMode ? Color(red: 0.592, green: 0.58, blue: 0.573) : Color(red: 0.416, green: 0.408, blue: 0.404))
            }
            
            Spacer()
            
            // Toggle Button
            Button(action: {
                withAnimation(.easeInOut(duration: 0.3)) {
                    isDarkMode.toggle()
                }
            }) {
                HStack(spacing: 8) {
                    Image(systemName: isDarkMode ? "moon.fill" : "sun.max.fill")
                        .font(.system(size: 16, weight: .medium))
                    Text(isDarkMode ? "Dark" : "Light")
                        .font(.system(size: 14, weight: .semibold))
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 10)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(isDarkMode ? Color(red: 0.976, green: 0.388, blue: 0.008) : Color(red: 0.145, green: 0.145, blue: 0.141))
                )
                .foregroundStyle(.white)
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 16)
        .background(isDarkMode ? Color(red: 0.145, green: 0.145, blue: 0.141) : Color.white)
    }
    
    // MARK: - Category Picker
    private var categoryPicker: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(TokenCategory.allCases) { category in
                    CategoryPill(
                        category: category,
                        isSelected: selectedCategory == category,
                        isDarkMode: isDarkMode
                    ) {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            selectedCategory = category
                        }
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
        }
        .background(isDarkMode ? Color(red: 0.1, green: 0.1, blue: 0.1) : Color(red: 0.984, green: 0.98, blue: 0.976))
    }
    
    // MARK: - Search Bar
    private var searchBar: some View {
        HStack(spacing: 12) {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(isDarkMode ? Color(red: 0.592, green: 0.58, blue: 0.573) : Color(red: 0.416, green: 0.408, blue: 0.404))
            
            TextField("Search tokens...", text: $searchText)
                .foregroundStyle(isDarkMode ? .white : .black)
            
            if !searchText.isEmpty {
                Button(action: { searchText = "" }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(isDarkMode ? Color(red: 0.592, green: 0.58, blue: 0.573) : Color(red: 0.416, green: 0.408, blue: 0.404))
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(isDarkMode ? Color(red: 0.2, green: 0.2, blue: 0.2) : Color.white)
        .cornerRadius(12)
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
    }
    
    // MARK: - Token List
    private var tokenList: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                ForEach(filteredTokens) { token in
                    TokenRowView(token: token, isDarkMode: isDarkMode)
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 12)
        }
    }
    
    // MARK: - Filtered Tokens
    private var filteredTokens: [TokenItem] {
        let tokens = getTokensForCategory(selectedCategory)
        if searchText.isEmpty {
            return tokens
        }
        return tokens.filter { $0.name.localizedCaseInsensitiveContains(searchText) || $0.semanticUse.localizedCaseInsensitiveContains(searchText) }
    }
    
    // MARK: - Get Tokens for Category
    private func getTokensForCategory(_ category: TokenCategory) -> [TokenItem] {
        switch category {
        case .backgrounds:
            return getBackgroundTokens()
        case .borders:
            return getBorderTokens()
        case .text:
            return getTextTokens()
        case .icons:
            return getIconTokens()
        case .brand:
            return getBrandTokens()
        case .semantic:
            return getSemanticColorTokens()
        case .spacing:
            return getSpacingTokens()
        case .elevation:
            return getElevationTokens()
        case .typography:
            return getTypographyTokens()
        }
    }
}

// MARK: - Category Pill
struct CategoryPill: View {
    let category: TokenCategory
    let isSelected: Bool
    let isDarkMode: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 6) {
                Image(systemName: category.icon)
                    .font(.system(size: 12))
                Text(category.rawValue)
                    .font(.system(size: 13, weight: .medium))
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(isSelected 
                          ? (isDarkMode ? Color(red: 0.976, green: 0.388, blue: 0.008) : Color(red: 0.145, green: 0.145, blue: 0.141))
                          : (isDarkMode ? Color(red: 0.2, green: 0.2, blue: 0.2) : Color.white))
            )
            .foregroundStyle(isSelected 
                             ? .white 
                             : (isDarkMode ? Color(red: 0.729, green: 0.718, blue: 0.706) : Color(red: 0.416, green: 0.408, blue: 0.404)))
        }
    }
}

// MARK: - Token Row View
struct TokenRowView: View {
    let token: TokenItem
    let isDarkMode: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Token Name
            Text(token.name)
                .font(.system(size: 14, weight: .semibold, design: .monospaced))
                .foregroundStyle(isDarkMode ? .white : Color(red: 0.145, green: 0.145, blue: 0.141))
            
            // Semantic Use Description
            Text(token.semanticUse)
                .font(.system(size: 12))
                .foregroundStyle(isDarkMode ? Color(red: 0.592, green: 0.58, blue: 0.573) : Color(red: 0.416, green: 0.408, blue: 0.404))
            
            // Value Display
            HStack(spacing: 16) {
                // Light Value
                TokenValueView(
                    label: "Light",
                    value: token.lightValue,
                    isActive: !isDarkMode,
                    isDarkMode: isDarkMode
                )
                
                // Dark Value
                TokenValueView(
                    label: "Dark",
                    value: token.darkValue,
                    isActive: isDarkMode,
                    isDarkMode: isDarkMode
                )
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(isDarkMode ? Color(red: 0.145, green: 0.145, blue: 0.141) : Color.white)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(isDarkMode ? Color(red: 0.278, green: 0.271, blue: 0.271) : Color(red: 0.898, green: 0.882, blue: 0.871), lineWidth: 1)
        )
    }
}

// MARK: - Token Value View
struct TokenValueView: View {
    let label: String
    let value: Any
    let isActive: Bool
    let isDarkMode: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 4) {
                Text(label)
                    .font(.system(size: 10, weight: .medium))
                    .foregroundStyle(isDarkMode ? Color(red: 0.592, green: 0.58, blue: 0.573) : Color(red: 0.545, green: 0.533, blue: 0.529))
                
                if isActive {
                    Circle()
                        .fill(Color(red: 0.29, green: 0.506, blue: 0.396))
                        .frame(width: 6, height: 6)
                }
            }
            
            if let color = value as? Color {
                colorSwatch(color: color)
            } else if let cgFloat = value as? CGFloat {
                numericValue(value: cgFloat)
            } else if let intValue = value as? Int {
                numericValue(value: CGFloat(intValue))
            } else if let stringValue = value as? String {
                stringValueView(value: stringValue)
            } else {
                Text("—")
                    .font(.system(size: 12))
                    .foregroundStyle(isDarkMode ? Color(red: 0.592, green: 0.58, blue: 0.573) : Color(red: 0.416, green: 0.408, blue: 0.404))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .fill(isActive 
                      ? (isDarkMode ? Color(red: 0.2, green: 0.2, blue: 0.2) : Color(red: 0.973, green: 0.961, blue: 0.949))
                      : (isDarkMode ? Color(red: 0.1, green: 0.1, blue: 0.1).opacity(0.5) : Color(red: 0.984, green: 0.98, blue: 0.976).opacity(0.5)))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(isActive ? Color(red: 0.976, green: 0.388, blue: 0.008).opacity(0.5) : Color.clear, lineWidth: 2)
        )
    }
    
    @ViewBuilder
    private func colorSwatch(color: Color) -> some View {
        HStack(spacing: 8) {
            RoundedRectangle(cornerRadius: 6)
                .fill(color)
                .frame(width: 32, height: 32)
                .overlay(
                    RoundedRectangle(cornerRadius: 6)
                        .stroke(isDarkMode ? Color.white.opacity(0.2) : Color.black.opacity(0.1), lineWidth: 1)
                )
            
            Text(colorToHex(color))
                .font(.system(size: 11, weight: .medium, design: .monospaced))
                .foregroundStyle(isDarkMode ? Color(red: 0.729, green: 0.718, blue: 0.706) : Color(red: 0.345, green: 0.341, blue: 0.337))
        }
    }
    
    @ViewBuilder
    private func numericValue(value: CGFloat) -> some View {
        Text("\(Int(value))pt")
            .font(.system(size: 14, weight: .medium, design: .monospaced))
            .foregroundStyle(isDarkMode ? .white : Color(red: 0.145, green: 0.145, blue: 0.141))
    }
    
    @ViewBuilder
    private func stringValueView(value: String) -> some View {
        Text(value)
            .font(.system(size: 12, weight: .medium))
            .foregroundStyle(isDarkMode ? .white : Color(red: 0.145, green: 0.145, blue: 0.141))
    }
    
    private func colorToHex(_ color: Color) -> String {
        let uiColor = UIColor(color)
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        if alpha < 1 {
            return String(format: "#%02X%02X%02X (%.0f%%)", 
                          Int(red * 255), 
                          Int(green * 255), 
                          Int(blue * 255),
                          alpha * 100)
        }
        return String(format: "#%02X%02X%02X", 
                      Int(red * 255), 
                      Int(green * 255), 
                      Int(blue * 255))
    }
}

// MARK: - Token Data Providers
extension TokenViewerView {
    
    // MARK: - Background Tokens
    func getBackgroundTokens() -> [TokenItem] {
        return [
            // Accent Backgrounds
            TokenItem(name: "BackgroundAccentColorBlue", lightValue: TokensSemanticLight.BackgroundAccentColorBlue, darkValue: TokensSemanticDark.BackgroundAccentColorBlue, semanticUse: "Informational accent backgrounds"),
            TokenItem(name: "BackgroundAccentColorGreen", lightValue: TokensSemanticLight.BackgroundAccentColorGreen, darkValue: TokensSemanticDark.BackgroundAccentColorGreen, semanticUse: "Success accent backgrounds"),
            TokenItem(name: "BackgroundAccentColorRed", lightValue: TokensSemanticLight.BackgroundAccentColorRed, darkValue: TokensSemanticDark.BackgroundAccentColorRed, semanticUse: "Error/danger accent backgrounds"),
            TokenItem(name: "BackgroundAccentColorYellow", lightValue: TokensSemanticLight.BackgroundAccentColorYellow, darkValue: TokensSemanticDark.BackgroundAccentColorYellow, semanticUse: "Warning accent backgrounds"),
            
            // Button Backgrounds
            TokenItem(name: "BackgroundButtonColorBrandFilledDefault", lightValue: TokensSemanticLight.BackgroundButtonColorBrandFilledDefault, darkValue: TokensSemanticDark.BackgroundButtonColorBrandFilledDefault, semanticUse: "Primary brand button default state"),
            TokenItem(name: "BackgroundButtonColorBrandFilledInactive", lightValue: TokensSemanticLight.BackgroundButtonColorBrandFilledInactive, darkValue: TokensSemanticDark.BackgroundButtonColorBrandFilledInactive, semanticUse: "Primary brand button inactive/disabled state"),
            TokenItem(name: "BackgroundButtonColorGhostFilledDefault", lightValue: TokensSemanticLight.BackgroundButtonColorGhostFilledDefault, darkValue: TokensSemanticDark.BackgroundButtonColorGhostFilledDefault, semanticUse: "Ghost button default state"),
            TokenItem(name: "BackgroundButtonColorWhiteFilledDefault", lightValue: TokensSemanticLight.BackgroundButtonColorWhiteFilledDefault, darkValue: TokensSemanticDark.BackgroundButtonColorWhiteFilledDefault, semanticUse: "White filled button default state"),
            
            // Container Backgrounds
            TokenItem(name: "BackgroundContainerColorBrand", lightValue: TokensSemanticLight.BackgroundContainerColorBrand, darkValue: TokensSemanticDark.BackgroundContainerColorBrand, semanticUse: "Brand-colored container backgrounds"),
            TokenItem(name: "BackgroundContainerColorBrandAccent", lightValue: TokensSemanticLight.BackgroundContainerColorBrandAccent, darkValue: TokensSemanticDark.BackgroundContainerColorBrandAccent, semanticUse: "Light brand accent container backgrounds"),
            TokenItem(name: "BackgroundContainerColorGreige", lightValue: TokensSemanticLight.BackgroundContainerColorGreige, darkValue: TokensSemanticDark.BackgroundContainerColorGreige, semanticUse: "Neutral greige container backgrounds"),
            TokenItem(name: "BackgroundContainerColorInverse", lightValue: TokensSemanticLight.BackgroundContainerColorInverse, darkValue: TokensSemanticDark.BackgroundContainerColorInverse, semanticUse: "Inverse/dark container backgrounds"),
            TokenItem(name: "BackgroundContainerColorWhite", lightValue: TokensSemanticLight.BackgroundContainerColorWhite, darkValue: TokensSemanticDark.BackgroundContainerColorWhite, semanticUse: "White container backgrounds"),
            
            // Feedback Backgrounds
            TokenItem(name: "BackgroundFeedbackColorErrorAccent1", lightValue: TokensSemanticLight.BackgroundFeedbackColorErrorAccent1, darkValue: TokensSemanticDark.BackgroundFeedbackColorErrorAccent1, semanticUse: "Light error feedback backgrounds"),
            TokenItem(name: "BackgroundFeedbackColorErrorAccent2", lightValue: TokensSemanticLight.BackgroundFeedbackColorErrorAccent2, darkValue: TokensSemanticDark.BackgroundFeedbackColorErrorAccent2, semanticUse: "Strong error feedback backgrounds"),
            TokenItem(name: "BackgroundFeedbackColorSuccessAccent1", lightValue: TokensSemanticLight.BackgroundFeedbackColorSuccessAccent1, darkValue: TokensSemanticDark.BackgroundFeedbackColorSuccessAccent1, semanticUse: "Light success feedback backgrounds"),
            TokenItem(name: "BackgroundFeedbackColorSuccessAccent2", lightValue: TokensSemanticLight.BackgroundFeedbackColorSuccessAccent2, darkValue: TokensSemanticDark.BackgroundFeedbackColorSuccessAccent2, semanticUse: "Strong success feedback backgrounds"),
            TokenItem(name: "BackgroundFeedbackColorWarningAccent1", lightValue: TokensSemanticLight.BackgroundFeedbackColorWarningAccent1, darkValue: TokensSemanticDark.BackgroundFeedbackColorWarningAccent1, semanticUse: "Light warning feedback backgrounds"),
            TokenItem(name: "BackgroundFeedbackColorWarningAccent2", lightValue: TokensSemanticLight.BackgroundFeedbackColorWarningAccent2, darkValue: TokensSemanticDark.BackgroundFeedbackColorWarningAccent2, semanticUse: "Strong warning feedback backgrounds"),
            TokenItem(name: "BackgroundFeedbackColorInformationalAccent1", lightValue: TokensSemanticLight.BackgroundFeedbackColorInformationalAccent1, darkValue: TokensSemanticDark.BackgroundFeedbackColorInformationalAccent1, semanticUse: "Light info feedback backgrounds"),
            TokenItem(name: "BackgroundFeedbackColorInformationalAccent2", lightValue: TokensSemanticLight.BackgroundFeedbackColorInformationalAccent2, darkValue: TokensSemanticDark.BackgroundFeedbackColorInformationalAccent2, semanticUse: "Strong info feedback backgrounds"),
            
            // Surface Backgrounds
            TokenItem(name: "BackgroundSurfaceColorGreige", lightValue: TokensSemanticLight.BackgroundSurfaceColorGreige, darkValue: TokensSemanticDark.BackgroundSurfaceColorGreige, semanticUse: "Main surface greige background"),
            TokenItem(name: "BackgroundSurfaceColorInverse", lightValue: TokensSemanticLight.BackgroundSurfaceColorInverse, darkValue: TokensSemanticDark.BackgroundSurfaceColorInverse, semanticUse: "Inverse surface background"),
        ]
    }
    
    // MARK: - Border Tokens
    func getBorderTokens() -> [TokenItem] {
        return [
            // Border Values
            TokenItem(name: "BorderRadiusNone", lightValue: TokensSemanticLight.BorderRadiusNone, darkValue: TokensSemanticDark.BorderRadiusNone, semanticUse: "No border radius (sharp corners)"),
            TokenItem(name: "BorderRadiusXs", lightValue: TokensSemanticLight.BorderRadiusXs, darkValue: TokensSemanticDark.BorderRadiusXs, semanticUse: "Extra small border radius"),
            TokenItem(name: "BorderRadiusSm", lightValue: TokensSemanticLight.BorderRadiusSm, darkValue: TokensSemanticDark.BorderRadiusSm, semanticUse: "Small border radius"),
            TokenItem(name: "BorderRadiusMd", lightValue: TokensSemanticLight.BorderRadiusMd, darkValue: TokensSemanticDark.BorderRadiusMd, semanticUse: "Medium border radius"),
            TokenItem(name: "BorderRadiusLg", lightValue: TokensSemanticLight.BorderRadiusLg, darkValue: TokensSemanticDark.BorderRadiusLg, semanticUse: "Large border radius"),
            TokenItem(name: "BorderRadiusXl", lightValue: TokensSemanticLight.BorderRadiusXl, darkValue: TokensSemanticDark.BorderRadiusXl, semanticUse: "Extra large border radius"),
            TokenItem(name: "BorderRadius2xl", lightValue: TokensSemanticLight.BorderRadius2xl, darkValue: TokensSemanticDark.BorderRadius2xl, semanticUse: "2X large border radius"),
            TokenItem(name: "BorderRadius3xl", lightValue: TokensSemanticLight.BorderRadius3xl, darkValue: TokensSemanticDark.BorderRadius3xl, semanticUse: "3X large border radius"),
            TokenItem(name: "BorderRadiusFull", lightValue: TokensSemanticLight.BorderRadiusFull, darkValue: TokensSemanticDark.BorderRadiusFull, semanticUse: "Full/pill border radius"),
            
            // Border Widths
            TokenItem(name: "BorderWidthNone", lightValue: TokensSemanticLight.BorderWidthNone, darkValue: TokensSemanticDark.BorderWidthNone, semanticUse: "No border width"),
            TokenItem(name: "BorderWidthXs", lightValue: TokensSemanticLight.BorderWidthXs, darkValue: TokensSemanticDark.BorderWidthXs, semanticUse: "Extra small border width (1pt)"),
            TokenItem(name: "BorderWidthSm", lightValue: TokensSemanticLight.BorderWidthSm, darkValue: TokensSemanticDark.BorderWidthSm, semanticUse: "Small border width (2pt)"),
            TokenItem(name: "BorderWidthMd", lightValue: TokensSemanticLight.BorderWidthMd, darkValue: TokensSemanticDark.BorderWidthMd, semanticUse: "Medium border width (4pt)"),
            TokenItem(name: "BorderWidthLg", lightValue: TokensSemanticLight.BorderWidthLg, darkValue: TokensSemanticDark.BorderWidthLg, semanticUse: "Large border width (8pt)"),
            
            // Border Colors - Button
            TokenItem(name: "BorderButtonColorAccent", lightValue: TokensSemanticLight.BorderButtonColorAccent, darkValue: TokensSemanticDark.BorderButtonColorAccent, semanticUse: "Accent border for buttons"),
            TokenItem(name: "BorderButtonColorDefault", lightValue: TokensSemanticLight.BorderButtonColorDefault, darkValue: TokensSemanticDark.BorderButtonColorDefault, semanticUse: "Default border for buttons"),
            TokenItem(name: "BorderButtonColorFocus", lightValue: TokensSemanticLight.BorderButtonColorFocus, darkValue: TokensSemanticDark.BorderButtonColorFocus, semanticUse: "Focus state border for buttons"),
            TokenItem(name: "BorderButtonColorInactive", lightValue: TokensSemanticLight.BorderButtonColorInactive, darkValue: TokensSemanticDark.BorderButtonColorInactive, semanticUse: "Inactive/disabled border for buttons"),
            TokenItem(name: "BorderButtonColorPressed", lightValue: TokensSemanticLight.BorderButtonColorPressed, darkValue: TokensSemanticDark.BorderButtonColorPressed, semanticUse: "Pressed state border for buttons"),
            
            // Border Colors - Input
            TokenItem(name: "BorderInputColorAccent", lightValue: TokensSemanticLight.BorderInputColorAccent, darkValue: TokensSemanticDark.BorderInputColorAccent, semanticUse: "Accent border for inputs"),
            TokenItem(name: "BorderInputColorActive", lightValue: TokensSemanticLight.BorderInputColorActive, darkValue: TokensSemanticDark.BorderInputColorActive, semanticUse: "Active state border for inputs"),
            TokenItem(name: "BorderInputColorDefault", lightValue: TokensSemanticLight.BorderInputColorDefault, darkValue: TokensSemanticDark.BorderInputColorDefault, semanticUse: "Default border for inputs"),
            TokenItem(name: "BorderInputColorError", lightValue: TokensSemanticLight.BorderInputColorError, darkValue: TokensSemanticDark.BorderInputColorError, semanticUse: "Error state border for inputs"),
            TokenItem(name: "BorderInputColorSuccess", lightValue: TokensSemanticLight.BorderInputColorSuccess, darkValue: TokensSemanticDark.BorderInputColorSuccess, semanticUse: "Success state border for inputs"),
            TokenItem(name: "BorderInputColorWarning", lightValue: TokensSemanticLight.BorderInputColorWarning, darkValue: TokensSemanticDark.BorderInputColorWarning, semanticUse: "Warning state border for inputs"),
            
            // Border Colors - Container
            TokenItem(name: "BorderOnContainerActive", lightValue: TokensSemanticLight.BorderOnContainerActive, darkValue: TokensSemanticDark.BorderOnContainerActive, semanticUse: "Active state border on containers"),
            TokenItem(name: "BorderOnContainerDefault", lightValue: TokensSemanticLight.BorderOnContainerDefault, darkValue: TokensSemanticDark.BorderOnContainerDefault, semanticUse: "Default border on containers"),
            TokenItem(name: "BorderOnContainerInactive", lightValue: TokensSemanticLight.BorderOnContainerInactive, darkValue: TokensSemanticDark.BorderOnContainerInactive, semanticUse: "Inactive border on containers"),
        ]
    }
    
    // MARK: - Text Tokens
    func getTextTokens() -> [TokenItem] {
        return [
            // Button Text Colors
            TokenItem(name: "TextButtonColorGhostFilledDefault", lightValue: TokensSemanticLight.TextButtonColorGhostFilledDefault, darkValue: TokensSemanticDark.TextButtonColorGhostFilledDefault, semanticUse: "Ghost button text default state"),
            TokenItem(name: "TextButtonColorOrangeFilledDefault", lightValue: TokensSemanticLight.TextButtonColorOrangeFilledDefault, darkValue: TokensSemanticDark.TextButtonColorOrangeFilledDefault, semanticUse: "Orange/brand button text default state"),
            TokenItem(name: "TextButtonColorOrangeOutlineDefault", lightValue: TokensSemanticLight.TextButtonColorOrangeOutlineDefault, darkValue: TokensSemanticDark.TextButtonColorOrangeOutlineDefault, semanticUse: "Orange outline button text default state"),
            TokenItem(name: "TextButtonColorWhiteFilledDefault", lightValue: TokensSemanticLight.TextButtonColorWhiteFilledDefault, darkValue: TokensSemanticDark.TextButtonColorWhiteFilledDefault, semanticUse: "White button text default state"),
            
            // Container Text Colors
            TokenItem(name: "TextOnContainerColorPrimary", lightValue: TokensSemanticLight.TextOnContainerColorPrimary, darkValue: TokensSemanticDark.TextOnContainerColorPrimary, semanticUse: "Primary text on containers"),
            TokenItem(name: "TextOnContainerColorSecondary", lightValue: TokensSemanticLight.TextOnContainerColorSecondary, darkValue: TokensSemanticDark.TextOnContainerColorSecondary, semanticUse: "Secondary text on containers"),
            TokenItem(name: "TextOnContainerColorTertiary", lightValue: TokensSemanticLight.TextOnContainerColorTertiary, darkValue: TokensSemanticDark.TextOnContainerColorTertiary, semanticUse: "Tertiary text on containers"),
            TokenItem(name: "TextOnContainerColorAccent", lightValue: TokensSemanticLight.TextOnContainerColorAccent, darkValue: TokensSemanticDark.TextOnContainerColorAccent, semanticUse: "Accent text on containers"),
            TokenItem(name: "TextOnContainerColorAccent2", lightValue: TokensSemanticLight.TextOnContainerColorAccent2, darkValue: TokensSemanticDark.TextOnContainerColorAccent2, semanticUse: "Secondary accent text on containers"),
            TokenItem(name: "TextOnContainerColorError", lightValue: TokensSemanticLight.TextOnContainerColorError, darkValue: TokensSemanticDark.TextOnContainerColorError, semanticUse: "Error text on containers"),
            TokenItem(name: "TextOnContainerColorSuccess", lightValue: TokensSemanticLight.TextOnContainerColorSuccess, darkValue: TokensSemanticDark.TextOnContainerColorSuccess, semanticUse: "Success text on containers"),
            TokenItem(name: "TextOnContainerColorWarning", lightValue: TokensSemanticLight.TextOnContainerColorWarning, darkValue: TokensSemanticDark.TextOnContainerColorWarning, semanticUse: "Warning text on containers"),
            TokenItem(name: "TextOnContainerColorInformational", lightValue: TokensSemanticLight.TextOnContainerColorInformational, darkValue: TokensSemanticDark.TextOnContainerColorInformational, semanticUse: "Informational text on containers"),
            TokenItem(name: "TextOnContainerColorInverse", lightValue: TokensSemanticLight.TextOnContainerColorInverse, darkValue: TokensSemanticDark.TextOnContainerColorInverse, semanticUse: "Inverse text on containers"),
            
            // Surface Text Colors
            TokenItem(name: "TextOnSurfaceColorPrimary", lightValue: TokensSemanticLight.TextOnSurfaceColorPrimary, darkValue: TokensSemanticDark.TextOnSurfaceColorPrimary, semanticUse: "Primary text on surfaces"),
            TokenItem(name: "TextOnSurfaceColorSecondary", lightValue: TokensSemanticLight.TextOnSurfaceColorSecondary, darkValue: TokensSemanticDark.TextOnSurfaceColorSecondary, semanticUse: "Secondary text on surfaces"),
            TokenItem(name: "TextOnSurfaceColorTertiary", lightValue: TokensSemanticLight.TextOnSurfaceColorTertiary, darkValue: TokensSemanticDark.TextOnSurfaceColorTertiary, semanticUse: "Tertiary text on surfaces"),
            
            // Selector Text Colors
            TokenItem(name: "TextSelectorColorActive", lightValue: TokensSemanticLight.TextSelectorColorActive, darkValue: TokensSemanticDark.TextSelectorColorActive, semanticUse: "Active selector text"),
            TokenItem(name: "TextSelectorColorDefault", lightValue: TokensSemanticLight.TextSelectorColorDefault, darkValue: TokensSemanticDark.TextSelectorColorDefault, semanticUse: "Default selector text"),
        ]
    }
    
    // MARK: - Icon Tokens
    func getIconTokens() -> [TokenItem] {
        return [
            // Action Icons
            TokenItem(name: "IconActionColorGhostFilledDefault", lightValue: TokensComponentsLight.IconActionColorGhostFilledDefault, darkValue: TokensComponentsDark.IconActionColorGhostFilledDefault, semanticUse: "Ghost action icon default state"),
            TokenItem(name: "IconActionColorGhostFilledInactive", lightValue: TokensComponentsLight.IconActionColorGhostFilledInactive, darkValue: TokensComponentsDark.IconActionColorGhostFilledInactive, semanticUse: "Ghost action icon inactive state"),
            TokenItem(name: "IconActionColorOrangeFilledDefault", lightValue: TokensComponentsLight.IconActionColorOrangeFilledDefault, darkValue: TokensComponentsDark.IconActionColorOrangeFilledDefault, semanticUse: "Orange filled action icon default"),
            TokenItem(name: "IconActionColorOrangeOutlineDefault", lightValue: TokensComponentsLight.IconActionColorOrangeOutlineDefault, darkValue: TokensComponentsDark.IconActionColorOrangeOutlineDefault, semanticUse: "Orange outline action icon default"),
            TokenItem(name: "IconActionColorWhiteFilledDefault", lightValue: TokensComponentsLight.IconActionColorWhiteFilledDefault, darkValue: TokensComponentsDark.IconActionColorWhiteFilledDefault, semanticUse: "White filled action icon default"),
            
            // Container Icons
            TokenItem(name: "IconOnContainerColorPrimary", lightValue: TokensComponentsLight.IconOnContainerColorPrimary, darkValue: TokensComponentsDark.IconOnContainerColorPrimary, semanticUse: "Primary icon on containers"),
            TokenItem(name: "IconOnContainerColorSecondary", lightValue: TokensComponentsLight.IconOnContainerColorSecondary, darkValue: TokensComponentsDark.IconOnContainerColorSecondary, semanticUse: "Secondary icon on containers"),
            TokenItem(name: "IconOnContainerColorTertiary", lightValue: TokensComponentsLight.IconOnContainerColorTertiary, darkValue: TokensComponentsDark.IconOnContainerColorTertiary, semanticUse: "Tertiary icon on containers"),
            TokenItem(name: "IconOnContainerColorAccent", lightValue: TokensComponentsLight.IconOnContainerColorAccent, darkValue: TokensComponentsDark.IconOnContainerColorAccent, semanticUse: "Accent icon on containers"),
            TokenItem(name: "IconOnContainerColorError", lightValue: TokensComponentsLight.IconOnContainerColorError, darkValue: TokensComponentsDark.IconOnContainerColorError, semanticUse: "Error icon on containers"),
            TokenItem(name: "IconOnContainerColorSuccess", lightValue: TokensComponentsLight.IconOnContainerColorSuccess, darkValue: TokensComponentsDark.IconOnContainerColorSuccess, semanticUse: "Success icon on containers"),
            TokenItem(name: "IconOnContainerColorWarning", lightValue: TokensComponentsLight.IconOnContainerColorWarning, darkValue: TokensComponentsDark.IconOnContainerColorWarning, semanticUse: "Warning icon on containers"),
            TokenItem(name: "IconOnContainerColorInformational", lightValue: TokensComponentsLight.IconOnContainerColorInformational, darkValue: TokensComponentsDark.IconOnContainerColorInformational, semanticUse: "Informational icon on containers"),
            TokenItem(name: "IconOnContainerColorInverse", lightValue: TokensComponentsLight.IconOnContainerColorInverse, darkValue: TokensComponentsDark.IconOnContainerColorInverse, semanticUse: "Inverse icon on containers"),
            
            // Surface Icons
            TokenItem(name: "IconOnSurfaceColorPrimary", lightValue: TokensComponentsLight.IconOnSurfaceColorPrimary, darkValue: TokensComponentsDark.IconOnSurfaceColorPrimary, semanticUse: "Primary icon on surfaces"),
            TokenItem(name: "IconOnSurfaceColorSecondary", lightValue: TokensComponentsLight.IconOnSurfaceColorSecondary, darkValue: TokensComponentsDark.IconOnSurfaceColorSecondary, semanticUse: "Secondary icon on surfaces"),
            TokenItem(name: "IconOnSurfaceColorAccent", lightValue: TokensComponentsLight.IconOnSurfaceColorAccent, darkValue: TokensComponentsDark.IconOnSurfaceColorAccent, semanticUse: "Accent icon on surfaces"),
            
            // Input Icons
            TokenItem(name: "IconInputColorActive", lightValue: TokensComponentsLight.IconInputColorActive, darkValue: TokensComponentsDark.IconInputColorActive, semanticUse: "Active state input icon"),
            TokenItem(name: "IconInputColorDefault", lightValue: TokensComponentsLight.IconInputColorDefault, darkValue: TokensComponentsDark.IconInputColorDefault, semanticUse: "Default state input icon"),
            TokenItem(name: "IconInputColorInactive", lightValue: TokensComponentsLight.IconInputColorInactive, darkValue: TokensComponentsDark.IconInputColorInactive, semanticUse: "Inactive state input icon"),
            
            // Selector Icons
            TokenItem(name: "IconSelectorColorFilledDefault", lightValue: TokensComponentsLight.IconSelectorColorFilledDefault, darkValue: TokensComponentsDark.IconSelectorColorFilledDefault, semanticUse: "Filled selector icon default"),
            TokenItem(name: "IconSelectorColorFilledSelected", lightValue: TokensComponentsLight.IconSelectorColorFilledSelected, darkValue: TokensComponentsDark.IconSelectorColorFilledSelected, semanticUse: "Filled selector icon selected"),
            TokenItem(name: "IconSelectorColorOutlineDefault", lightValue: TokensComponentsLight.IconSelectorColorOutlineDefault, darkValue: TokensComponentsDark.IconSelectorColorOutlineDefault, semanticUse: "Outline selector icon default"),
            TokenItem(name: "IconSelectorColorOutlineSelected", lightValue: TokensComponentsLight.IconSelectorColorOutlineSelected, darkValue: TokensComponentsDark.IconSelectorColorOutlineSelected, semanticUse: "Outline selector icon selected"),
        ]
    }
    
    // MARK: - Brand Tokens
    func getBrandTokens() -> [TokenItem] {
        return [
            TokenItem(name: "Brand025", lightValue: TokensSemanticLight.Brand025, darkValue: TokensSemanticDark.Brand025, semanticUse: "Lightest brand tint"),
            TokenItem(name: "Brand050", lightValue: TokensSemanticLight.Brand050, darkValue: TokensSemanticDark.Brand050, semanticUse: "Very light brand tint"),
            TokenItem(name: "Brand100", lightValue: TokensSemanticLight.Brand100, darkValue: TokensSemanticDark.Brand100, semanticUse: "Light brand tint"),
            TokenItem(name: "Brand200", lightValue: TokensSemanticLight.Brand200, darkValue: TokensSemanticDark.Brand200, semanticUse: "Light-medium brand"),
            TokenItem(name: "Brand300", lightValue: TokensSemanticLight.Brand300, darkValue: TokensSemanticDark.Brand300, semanticUse: "Primary brand color (The Home Depot Orange)"),
            TokenItem(name: "Brand400", lightValue: TokensSemanticLight.Brand400, darkValue: TokensSemanticDark.Brand400, semanticUse: "Medium-dark brand"),
            TokenItem(name: "Brand500", lightValue: TokensSemanticLight.Brand500, darkValue: TokensSemanticDark.Brand500, semanticUse: "Dark brand"),
            TokenItem(name: "Brand600", lightValue: TokensSemanticLight.Brand600, darkValue: TokensSemanticDark.Brand600, semanticUse: "Darker brand"),
            TokenItem(name: "Brand700", lightValue: TokensSemanticLight.Brand700, darkValue: TokensSemanticDark.Brand700, semanticUse: "Very dark brand"),
            TokenItem(name: "Brand800", lightValue: TokensSemanticLight.Brand800, darkValue: TokensSemanticDark.Brand800, semanticUse: "Extra dark brand"),
            TokenItem(name: "Brand900", lightValue: TokensSemanticLight.Brand900, darkValue: TokensSemanticDark.Brand900, semanticUse: "Near-black brand"),
            TokenItem(name: "Brand950", lightValue: TokensSemanticLight.Brand950, darkValue: TokensSemanticDark.Brand950, semanticUse: "Darkest brand shade"),
        ]
    }
    
    // MARK: - Semantic Color Tokens
    func getSemanticColorTokens() -> [TokenItem] {
        return [
            // Greige Scale
            TokenItem(name: "Greige025", lightValue: TokensSemanticLight.Greige025, darkValue: TokensSemanticDark.Greige025, semanticUse: "Lightest greige neutral"),
            TokenItem(name: "Greige050", lightValue: TokensSemanticLight.Greige050, darkValue: TokensSemanticDark.Greige050, semanticUse: "Very light greige neutral"),
            TokenItem(name: "Greige100", lightValue: TokensSemanticLight.Greige100, darkValue: TokensSemanticDark.Greige100, semanticUse: "Light greige neutral"),
            TokenItem(name: "Greige300", lightValue: TokensSemanticLight.Greige300, darkValue: TokensSemanticDark.Greige300, semanticUse: "Medium greige neutral"),
            TokenItem(name: "Greige500", lightValue: TokensSemanticLight.Greige500, darkValue: TokensSemanticDark.Greige500, semanticUse: "Standard greige neutral"),
            TokenItem(name: "Greige700", lightValue: TokensSemanticLight.Greige700, darkValue: TokensSemanticDark.Greige700, semanticUse: "Dark greige neutral"),
            TokenItem(name: "Greige900", lightValue: TokensSemanticLight.Greige900, darkValue: TokensSemanticDark.Greige900, semanticUse: "Very dark greige neutral"),
            TokenItem(name: "Greige950", lightValue: TokensSemanticLight.Greige950, darkValue: TokensSemanticDark.Greige950, semanticUse: "Darkest greige neutral"),
            
            // Cinnabar (Red/Error)
            TokenItem(name: "Cinnabar050", lightValue: TokensSemanticLight.Cinnabar050, darkValue: TokensSemanticDark.Cinnabar050, semanticUse: "Light error/danger tint"),
            TokenItem(name: "Cinnabar300", lightValue: TokensSemanticLight.Cinnabar300, darkValue: TokensSemanticDark.Cinnabar300, semanticUse: "Medium error/danger"),
            TokenItem(name: "Cinnabar500", lightValue: TokensSemanticLight.Cinnabar500, darkValue: TokensSemanticDark.Cinnabar500, semanticUse: "Primary error/danger color"),
            TokenItem(name: "Cinnabar700", lightValue: TokensSemanticLight.Cinnabar700, darkValue: TokensSemanticDark.Cinnabar700, semanticUse: "Dark error/danger"),
            
            // Lemon (Yellow/Warning)
            TokenItem(name: "Lemon050", lightValue: TokensSemanticLight.Lemon050, darkValue: TokensSemanticDark.Lemon050, semanticUse: "Light warning tint"),
            TokenItem(name: "Lemon100", lightValue: TokensSemanticLight.Lemon100, darkValue: TokensSemanticDark.Lemon100, semanticUse: "Primary warning color"),
            TokenItem(name: "Lemon300", lightValue: TokensSemanticLight.Lemon300, darkValue: TokensSemanticDark.Lemon300, semanticUse: "Medium warning"),
            TokenItem(name: "Lemon500", lightValue: TokensSemanticLight.Lemon500, darkValue: TokensSemanticDark.Lemon500, semanticUse: "Dark warning"),
            
            // Moonlight (Blue/Informational)
            TokenItem(name: "Moonlight050", lightValue: TokensSemanticLight.Moonlight050, darkValue: TokensSemanticDark.Moonlight050, semanticUse: "Light informational tint"),
            TokenItem(name: "Moonlight300", lightValue: TokensSemanticLight.Moonlight300, darkValue: TokensSemanticDark.Moonlight300, semanticUse: "Medium informational"),
            TokenItem(name: "Moonlight500", lightValue: TokensSemanticLight.Moonlight500, darkValue: TokensSemanticDark.Moonlight500, semanticUse: "Primary informational color"),
            TokenItem(name: "Moonlight700", lightValue: TokensSemanticLight.Moonlight700, darkValue: TokensSemanticDark.Moonlight700, semanticUse: "Dark informational"),
            
            // Neutrals
            TokenItem(name: "NeutralsBlack", lightValue: TokensSemanticLight.NeutralsBlack, darkValue: TokensSemanticDark.NeutralsBlack, semanticUse: "Pure black"),
            TokenItem(name: "NeutralsWhite", lightValue: TokensSemanticLight.NeutralsWhite, darkValue: TokensSemanticDark.NeutralsWhite, semanticUse: "Pure white"),
            TokenItem(name: "NeutralsTransparent", lightValue: TokensSemanticLight.NeutralsTransparent, darkValue: TokensSemanticDark.NeutralsTransparent, semanticUse: "Fully transparent"),
        ]
    }
    
    // MARK: - Spacing Tokens
    func getSpacingTokens() -> [TokenItem] {
        return [
            TokenItem(name: "Spacing1", lightValue: TokensSpacing.Spacing1, darkValue: TokensSpacing.Spacing1, semanticUse: "4pt - Smallest spacing unit"),
            TokenItem(name: "Spacing2", lightValue: TokensSpacing.Spacing2, darkValue: TokensSpacing.Spacing2, semanticUse: "8pt - Tight spacing"),
            TokenItem(name: "Spacing3", lightValue: TokensSpacing.Spacing3, darkValue: TokensSpacing.Spacing3, semanticUse: "12pt - Compact spacing"),
            TokenItem(name: "Spacing4", lightValue: TokensSpacing.Spacing4, darkValue: TokensSpacing.Spacing4, semanticUse: "16pt - Standard spacing"),
            TokenItem(name: "Spacing5", lightValue: TokensSpacing.Spacing5, darkValue: TokensSpacing.Spacing5, semanticUse: "20pt - Medium spacing"),
            TokenItem(name: "Spacing6", lightValue: TokensSpacing.Spacing6, darkValue: TokensSpacing.Spacing6, semanticUse: "24pt - Comfortable spacing"),
            TokenItem(name: "Spacing8", lightValue: TokensSpacing.Spacing8, darkValue: TokensSpacing.Spacing8, semanticUse: "32pt - Large spacing / Button SM height"),
            TokenItem(name: "Spacing10", lightValue: TokensSpacing.Spacing10, darkValue: TokensSpacing.Spacing10, semanticUse: "40pt - Extra large / Button MD height"),
            TokenItem(name: "Spacing12", lightValue: TokensSpacing.Spacing12, darkValue: TokensSpacing.Spacing12, semanticUse: "48pt - XXL spacing / Button LG height"),
            TokenItem(name: "Spacing16", lightValue: TokensSpacing.Spacing16, darkValue: TokensSpacing.Spacing16, semanticUse: "64pt - Section spacing"),
            TokenItem(name: "Spacing20", lightValue: TokensSpacing.Spacing20, darkValue: TokensSpacing.Spacing20, semanticUse: "80pt - Page section spacing"),
        ]
    }
    
    // MARK: - Elevation Tokens
    func getElevationTokens() -> [TokenItem] {
        return [
            TokenItem(name: "ElevationLowest", lightValue: TokensCoreLight.ElevationLowest, darkValue: TokensCoreDark.ElevationLowest, semanticUse: "Lowest elevation shadow color"),
            TokenItem(name: "ElevationLow", lightValue: TokensCoreLight.ElevationLow, darkValue: TokensCoreDark.ElevationLow, semanticUse: "Low elevation shadow color"),
            TokenItem(name: "ElevationMed", lightValue: TokensCoreLight.ElevationMed, darkValue: TokensCoreDark.ElevationMed, semanticUse: "Medium elevation shadow color"),
            TokenItem(name: "ElevationHigh", lightValue: TokensCoreLight.ElevationHigh, darkValue: TokensCoreDark.ElevationHigh, semanticUse: "High elevation shadow color"),
            TokenItem(name: "ElevationHighest", lightValue: TokensCoreLight.ElevationHighest, darkValue: TokensCoreDark.ElevationHighest, semanticUse: "Highest elevation shadow color"),
            
            // Blur Radius
            TokenItem(name: "ElevationBlurRadiusBlur1", lightValue: CGFloat(TokensCoreLight.ElevationBlurRadiusBlur1), darkValue: CGFloat(TokensCoreDark.ElevationBlurRadiusBlur1), semanticUse: "4pt blur radius"),
            TokenItem(name: "ElevationBlurRadiusBlur2", lightValue: CGFloat(TokensCoreLight.ElevationBlurRadiusBlur2), darkValue: CGFloat(TokensCoreDark.ElevationBlurRadiusBlur2), semanticUse: "8pt blur radius"),
            TokenItem(name: "ElevationBlurRadiusBlur3", lightValue: CGFloat(TokensCoreLight.ElevationBlurRadiusBlur3), darkValue: CGFloat(TokensCoreDark.ElevationBlurRadiusBlur3), semanticUse: "12pt blur radius"),
            TokenItem(name: "ElevationBlurRadiusBlur4", lightValue: CGFloat(TokensCoreLight.ElevationBlurRadiusBlur4), darkValue: CGFloat(TokensCoreDark.ElevationBlurRadiusBlur4), semanticUse: "16pt blur radius"),
            TokenItem(name: "ElevationBlurRadiusBlur5", lightValue: CGFloat(TokensCoreLight.ElevationBlurRadiusBlur5), darkValue: CGFloat(TokensCoreDark.ElevationBlurRadiusBlur5), semanticUse: "24pt blur radius"),
        ]
    }
    
    // MARK: - Typography Tokens
    func getTypographyTokens() -> [TokenItem] {
        return [
            TokenItem(name: "FontFamilyDisplay", lightValue: TokensCoreLight.FontFamilyDisplay, darkValue: TokensCoreDark.FontFamilyDisplay, semanticUse: "Display/headline font family"),
            TokenItem(name: "FontFamilyInformational", lightValue: TokensCoreLight.FontFamilyInformational, darkValue: TokensCoreDark.FontFamilyInformational, semanticUse: "Body/informational font family"),
            TokenItem(name: "FontSizeBodyXs", lightValue: TokensCoreLight.FontSizeBodyXs, darkValue: TokensCoreDark.FontSizeBodyXs, semanticUse: "12pt - Extra small body text"),
            TokenItem(name: "FontSizeBodySm", lightValue: TokensCoreLight.FontSizeBodySm, darkValue: TokensCoreDark.FontSizeBodySm, semanticUse: "14pt - Small body text"),
            TokenItem(name: "FontSizeBodyMd", lightValue: TokensCoreLight.FontSizeBodyMd, darkValue: TokensCoreDark.FontSizeBodyMd, semanticUse: "16pt - Medium/standard body text"),
            TokenItem(name: "FontSizeBodyLg", lightValue: TokensCoreLight.FontSizeBodyLg, darkValue: TokensCoreDark.FontSizeBodyLg, semanticUse: "18pt - Large body text"),
            TokenItem(name: "FontSizeBodyXl", lightValue: TokensCoreLight.FontSizeBodyXl, darkValue: TokensCoreDark.FontSizeBodyXl, semanticUse: "20pt - Extra large body text"),
        ]
    }
}

// MARK: - Preview
#Preview {
    TokenViewerView()
}
