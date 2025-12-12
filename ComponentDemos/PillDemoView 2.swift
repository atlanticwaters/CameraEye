//
// PillDemoView.swift
//

import SwiftUI

struct PillDemoView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                headerSection
                
                actionPillsSection
                
                statusPillsSection
                
                interactivePillsSection
                
                inputPillsSection
            }
            .padding()
        }
        .background(Color(.systemBackground))
    }
    
    // MARK: - Header Section
    
    private var headerSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Pill Components Demo")
                .font(.largeTitle)
                .bold()
                .foregroundColor(TokensComponentsLight.IconOnSurfaceColorPrimary)
            
            Text("Showcasing design tokens in pill-style components")
                .font(.subheadline)
                .foregroundColor(TokensComponentsLight.IconOnSurfaceColorSecondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    // MARK: - Action Pills Section
    
    private var actionPillsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            sectionTitle("Action Pills")
            
            VStack(spacing: 12) {
                // Ghost Filled Pills
                HStack(spacing: 12) {
                    Pill(text: "Default", 
                         backgroundColor: TokensComponentsLight.IconActionColorGhostFilledDefault.opacity(0.1),
                         textColor: TokensComponentsLight.IconActionColorGhostFilledDefault)
                    
                    Pill(text: "Inactive", 
                         backgroundColor: TokensComponentsLight.IconActionColorGhostFilledInactive.opacity(0.1),
                         textColor: TokensComponentsLight.IconActionColorGhostFilledInactive)
                }
                
                // Orange Pills
                HStack(spacing: 12) {
                    Pill(text: "Orange Default", 
                         backgroundColor: TokensComponentsLight.IconActionColorOrangeOutlineDefault,
                         textColor: TokensComponentsLight.IconActionColorOrangeFilledDefault)
                    
                    Pill(text: "Orange Outline", 
                         backgroundColor: Color.clear,
                         textColor: TokensComponentsLight.IconActionColorOrangeOutlineDefault,
                         borderColor: TokensComponentsLight.IconActionColorOrangeOutlineDefault)
                }
                
                // Gradient Pills
                HStack(spacing: 12) {
                    Pill(text: "Gradient", 
                         backgroundColor: LinearGradient(
                            colors: [
                                TokensComponentsLight.IconActionColorOrangeOutlineDefault,
                                TokensComponentsLight.IconActionColorGradientFilledInactive
                            ],
                            startPoint: .leading,
                            endPoint: .trailing
                         ),
                         textColor: TokensComponentsLight.IconActionColorGradientFilledDefault)
                    
                    Pill(text: "White Filled", 
                         backgroundColor: TokensComponentsLight.IconActionColorWhiteFilledDefault.opacity(0.1),
                         textColor: TokensComponentsLight.IconActionColorWhiteFilledDefault)
                }
            }
        }
    }
    
    // MARK: - Status Pills Section
    
    private var statusPillsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            sectionTitle("Status Pills")
            
            VStack(spacing: 12) {
                HStack(spacing: 12) {
                    StatusPill(text: "Success", 
                              icon: "checkmark.circle.fill",
                              color: TokensComponentsLight.IconOnContainerColorSuccess)
                    
                    StatusPill(text: "Error", 
                              icon: "xmark.circle.fill",
                              color: TokensComponentsLight.IconOnContainerColorError)
                }
                
                HStack(spacing: 12) {
                    StatusPill(text: "Warning", 
                              icon: "exclamationmark.triangle.fill",
                              color: TokensComponentsLight.IconOnContainerColorWarning)
                    
                    StatusPill(text: "Info", 
                              icon: "info.circle.fill",
                              color: TokensComponentsLight.IconOnContainerColorInformational)
                }
                
                HStack(spacing: 12) {
                    StatusPill(text: TokensComponentsLight.BadgeLabel, 
                              icon: "star.fill",
                              color: TokensComponentsLight.IconOnContainerColorAccent)
                    
                    StatusPill(text: "Accent 2", 
                              icon: "sparkles",
                              color: TokensComponentsLight.IconOnContainerColorAccent2)
                }
            }
        }
    }
    
    // MARK: - Interactive Pills Section
    
    private var interactivePillsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            sectionTitle("Interactive Selector Pills")
            
            VStack(spacing: 12) {
                Text("Filled Style")
                    .font(.caption)
                    .foregroundColor(TokensComponentsLight.IconOnSurfaceColorSecondary)
                
                HStack(spacing: 12) {
                    SelectorPill(text: "Default",
                                backgroundColor: TokensComponentsLight.IconSelectorColorFilledDefault.opacity(0.1),
                                textColor: TokensComponentsLight.IconSelectorColorFilledDefault)
                    
                    SelectorPill(text: "Active",
                                backgroundColor: TokensComponentsLight.IconSelectorColorFilledActive.opacity(0.15),
                                textColor: TokensComponentsLight.IconSelectorColorFilledActive)
                    
                    SelectorPill(text: "Selected",
                                backgroundColor: TokensComponentsLight.IconSelectorColorFilledActive,
                                textColor: TokensComponentsLight.IconSelectorColorFilledSelected)
                }
                
                Text("Outline Style")
                    .font(.caption)
                    .foregroundColor(TokensComponentsLight.IconOnSurfaceColorSecondary)
                    .padding(.top, 8)
                
                HStack(spacing: 12) {
                    SelectorPill(text: "Default",
                                backgroundColor: Color.clear,
                                textColor: TokensComponentsLight.IconSelectorColorOutlineDefault,
                                borderColor: TokensComponentsLight.IconSelectorColorOutlineDefault)
                    
                    SelectorPill(text: "Active",
                                backgroundColor: Color.clear,
                                textColor: TokensComponentsLight.IconSelectorColorOutlineActive,
                                borderColor: TokensComponentsLight.IconSelectorColorOutlineActive)
                    
                    SelectorPill(text: "Selected",
                                backgroundColor: TokensComponentsLight.IconSelectorColorOutlineActive,
                                textColor: TokensComponentsLight.IconSelectorColorOutlineSelected,
                                borderColor: TokensComponentsLight.IconSelectorColorOutlineActive)
                }
            }
        }
    }
    
    // MARK: - Input Pills Section
    
    private var inputPillsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            sectionTitle("Input State Pills")
            
            HStack(spacing: 12) {
                InputStatePill(text: "Default",
                              color: TokensComponentsLight.IconInputColorDefault)
                
                InputStatePill(text: "Active",
                              color: TokensComponentsLight.IconInputColorActive)
                
                InputStatePill(text: "Inactive",
                              color: TokensComponentsLight.IconInputColorInactive)
            }
        }
    }
    
    // MARK: - Helper Views
    
    private func sectionTitle(_ title: String) -> some View {
        Text(title)
            .font(.title3)
            .bold()
            .foregroundColor(TokensComponentsLight.IconOnSurfaceColorPrimary)
    }
}

// MARK: - Pill Component

struct Pill<Background: ShapeStyle>: View {
    let text: String
    let backgroundColor: Background
    let textColor: Color
    var borderColor: Color?
    
    var body: some View {
        Text(text)
            .font(.subheadline)
            .fontWeight(.medium)
            .foregroundColor(textColor)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .background(backgroundColor)
            .clipShape(Capsule())
            .overlay(
                Capsule()
                    .stroke(borderColor ?? Color.clear, lineWidth: borderColor != nil ? 1.5 : 0)
            )
    }
}

// MARK: - Status Pill Component

struct StatusPill: View {
    let text: String
    let icon: String
    let color: Color
    
    var body: some View {
        HStack(spacing: 6) {
            Image(systemName: icon)
                .font(.caption)
            Text(text)
                .font(.subheadline)
                .fontWeight(.medium)
        }
        .foregroundColor(color)
        .padding(.horizontal, 12)
        .padding(.vertical, 6)
        .background(color.opacity(0.1))
        .clipShape(Capsule())
        .overlay(
            Capsule()
                .stroke(color.opacity(0.3), lineWidth: 1)
        )
    }
}

// MARK: - Selector Pill Component

struct SelectorPill: View {
    let text: String
    let backgroundColor: Color
    let textColor: Color
    var borderColor: Color?
    
    var body: some View {
        Text(text)
            .font(.callout)
            .fontWeight(.semibold)
            .foregroundColor(textColor)
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .background(backgroundColor)
            .clipShape(Capsule())
            .overlay(
                Capsule()
                    .stroke(borderColor ?? Color.clear, lineWidth: borderColor != nil ? 2 : 0)
            )
    }
}

// MARK: - Input State Pill Component

struct InputStatePill: View {
    let text: String
    let color: Color
    
    var body: some View {
        HStack(spacing: 8) {
            Circle()
                .fill(color)
                .frame(width: 8, height: 8)
            
            Text(text)
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(color)
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 8)
        .background(color.opacity(0.08))
        .clipShape(Capsule())
        .overlay(
            Capsule()
                .stroke(color.opacity(0.2), lineWidth: 1)
        )
    }
}

// MARK: - Preview

#Preview {
    PillDemoView()
}
