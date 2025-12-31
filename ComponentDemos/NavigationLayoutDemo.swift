import SwiftUI

// MARK: - Navigation Layout Demo View
/// A demo view that clearly shows how top and bottom navigation works together.
/// This is based on ComponentCatalogView but simplified to demonstrate the layout structure.
///
/// KEY ARCHITECTURE POINTS:
/// 1. Bottom navigation is controlled by the TabView (BottomTabBar_iOS)
/// 2. Top navigation is an overlay using .safeAreaBar() modifier
/// 3. Content scrolls underneath the top navigation
/// 4. The back button state is managed by NavigationPath depth
struct NavigationLayoutDemo: View {
    // MARK: - State Management
    /// Controls whether the back button shows in the top nav
    /// - When `true`: Back button is visible (we're in a detail view)
    /// - When `false`: Back button is hidden (we're at the root)
    @State private var showBackButton: Bool = false
    
    /// SwiftUI navigation path for managing navigation stack
    /// - Empty path = root view (no back button)
    /// - Items in path = detail views (show back button)
    @State private var navigationPath = NavigationPath()

    // MARK: - Body
    var body: some View {
        ZStack {
            // MARK: Main Content Area
            // This NavigationStack handles the navigation between views
            NavigationStack(path: $navigationPath) {
                ScrollableContentArea(
                    showBackButton: $showBackButton,
                    navigationPath: $navigationPath
                )
                .navigationDestination(for: String.self) { destination in
                    // Detail view - could be any component demo
                    DetailView(title: destination)
                }
                .navigationBarHidden(true) // Hide default nav bar
            }
            .onAppear {
                // Reset back button when returning to root
                if navigationPath.isEmpty {
                    showBackButton = false
                }
            }
            .onChange(of: navigationPath.count) { oldValue, newValue in
                // Update back button state based on navigation depth
                // This is where the back button visibility is controlled!
                withAnimation {
                    showBackButton = newValue > 0
                }
            }
        }
        // MARK: Top Navigation Overlay
        // This modifier adds the top navigation bar as an overlay
        // The content scrolls underneath it
        .safeAreaBar(edge: .top, spacing: 48) {
            MorphingNavHeader(
                showBackButton: showBackButton,
                onBackTapped: {
                    // Custom back action that pops the navigation
                    if !navigationPath.isEmpty {
                        navigationPath.removeLast()
                    }
                }
            )
        }
    }
}

// MARK: - Scrollable Content Area
/// The main scrollable content that appears between the top and bottom navigation
struct ScrollableContentArea: View {
    @Binding var showBackButton: Bool
    @Binding var navigationPath: NavigationPath

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing4) {
                // MARK: Header Section
                HeaderCard()
                
                // MARK: Demo Items Section
                DemoSection(navigationPath: $navigationPath)
            }
            .padding(DesignSystemGlobal.Spacing4)
            .padding(.top, 48)      // ⬆️ Extra padding to clear top nav
            .padding(.bottom, 16)   // ⬇️ Extra padding to clear bottom tab bar
        }
        .scrollEdgeEffectStyle(.soft, for: .top)    // Soft fade at top
        .scrollEdgeEffectStyle(.soft, for: .bottom) // Soft fade at bottom
        .background(DesignSystemGlobal.BackgroundSurfaceColorGreige)
        .navigationBarHidden(true)
    }
}

// MARK: - Header Card
/// A simple header card to demonstrate content
struct HeaderCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
            Text("Navigation Layout Demo")
                .thdFont(.hero5)
                .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)

            Text("This view demonstrates how top and bottom navigation work together. The top nav is an overlay, and content scrolls underneath.")
                .thdFont(.bodyMd)
                .foregroundStyle(DesignSystemGlobal.TextOnContainerColorSecondary)
            
            // Navigation Control Annotations
            VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                Text("How Navigation is Controlled:")
                    .thdFont(.h3)
                    .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)
                    .padding(.top, DesignSystemGlobal.Spacing2)
                
                AnnotationRow(
                    icon: "arrow.up.circle.fill",
                    color: .blue,
                    title: "Top Navigation",
                    description: "Added via .safeAreaBar() modifier as an overlay"
                )
                
                AnnotationRow(
                    icon: "arrow.left.circle.fill",
                    color: .green,
                    title: "Back Button",
                    description: "Controlled by navigationPath.count in .onChange()"
                )
                
                AnnotationRow(
                    icon: "arrow.down.circle.fill",
                    color: .purple,
                    title: "Bottom Navigation",
                    description: "Controlled by TabView in BottomTabBar_iOS"
                )
                
                AnnotationRow(
                    icon: "scroll.fill",
                    color: .orange,
                    title: "Content Scrolling",
                    description: "ScrollView with soft edge effects at top/bottom"
                )
            }
            .padding(DesignSystemGlobal.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusMd)
                    .fill(DesignSystemGlobal.Greige100)
            )
        }
        .padding(DesignSystemGlobal.Spacing4)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusXl)
                .fill(DesignSystemGlobal.BackgroundContainerColorWhite)
        )
    }
}

// MARK: - Annotation Row
/// A row that explains a navigation concept
struct AnnotationRow: View {
    let icon: String
    let color: Color
    let title: String
    let description: String
    
    var body: some View {
        HStack(alignment: .top, spacing: DesignSystemGlobal.Spacing2) {
            Image(systemName: icon)
                .font(.system(size: 20))
                .foregroundStyle(color)
                .frame(width: 24, height: 24)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .thdFont(.bodyMd)
                    .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)
                
                Text(description)
                    .thdFont(.bodySm)
                    .foregroundStyle(DesignSystemGlobal.TextOnContainerColorSecondary)
            }
        }
    }
}

// MARK: - Demo Section
/// A section with demo items that can be tapped to navigate
struct DemoSection: View {
    @Binding var navigationPath: NavigationPath
    
    var body: some View {
        VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing3) {
            Text("Tap to Navigate")
                .thdFont(.h2)
                .textCase(.uppercase)
                .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)
                .padding(.leading, DesignSystemGlobal.Spacing3)
            
            VStack(spacing: DesignSystemGlobal.Spacing2) {
                ForEach(demoItems, id: \.title) { item in
                    NavigationLink(value: item.title) {
                        DemoItemRow(item: item)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding(DesignSystemGlobal.Spacing3)
            .background(
                RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusXl)
                    .fill(DesignSystemGlobal.BackgroundContainerColorWhite)
            )
        }
    }
    
    // Demo items data
    private var demoItems: [DemoItem] {
        [
            DemoItem(
                icon: "1.circle.fill",
                color: .blue,
                title: "First Detail View",
                description: "Tap to see back button appear"
            ),
            DemoItem(
                icon: "2.circle.fill",
                color: .green,
                title: "Second Detail View",
                description: "Navigation stack manages the hierarchy"
            ),
            DemoItem(
                icon: "3.circle.fill",
                color: .purple,
                title: "Third Detail View",
                description: "Back button pops the navigation path"
            )
        ]
    }
}

// MARK: - Demo Item
struct DemoItem {
    let icon: String
    let color: Color
    let title: String
    let description: String
}

// MARK: - Demo Item Row
struct DemoItemRow: View {
    let item: DemoItem
    
    var body: some View {
        HStack(spacing: DesignSystemGlobal.Spacing3) {
            Image(systemName: item.icon)
                .font(.system(size: 24))
                .foregroundStyle(item.color)
                .frame(width: 40, height: 40)
                .background(item.color.opacity(0.15))
                .cornerRadius(DesignSystemGlobal.BorderRadiusMd)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(item.title)
                    .thdFont(.bodyMd)
                    .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)
                
                Text(item.description)
                    .thdFont(.bodySm)
                    .foregroundStyle(DesignSystemGlobal.TextOnContainerColorSecondary)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(DesignSystemGlobal.TextOnContainerColorTertiary)
        }
        .padding(DesignSystemGlobal.Spacing2)
        .background(DesignSystemGlobal.BackgroundContainerColorWhite)
        .cornerRadius(DesignSystemGlobal.BorderRadiusLg)
    }
}

// MARK: - Detail View
/// A simple detail view to demonstrate navigation
struct DetailView: View {
    let title: String
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing4) {
                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                    Text(title)
                        .thdFont(.hero5)
                        .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)
                    
                    Text("This is a detail view. Notice the back button appeared in the top navigation when you navigated here.")
                        .thdFont(.bodyMd)
                        .foregroundStyle(DesignSystemGlobal.TextOnContainerColorSecondary)
                    
                    Text("The back button state is controlled by monitoring navigationPath.count in the .onChange() modifier.")
                        .thdFont(.bodySm)
                        .foregroundStyle(DesignSystemGlobal.TextOnContainerColorTertiary)
                        .padding(.top, DesignSystemGlobal.Spacing2)
                }
                .padding(DesignSystemGlobal.Spacing4)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusXl)
                        .fill(DesignSystemGlobal.BackgroundContainerColorWhite)
                )
                
                // Show how the back action works
                VStack(alignment: .leading, spacing: DesignSystemGlobal.Spacing2) {
                    Text("Back Button Implementation")
                        .thdFont(.h3)
                        .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)
                    
                    CodeBlock(code: """
                    MorphingNavHeader(
                        showBackButton: showBackButton,
                        onBackTapped: {
                            if !navigationPath.isEmpty {
                                navigationPath.removeLast()
                            }
                        }
                    )
                    """)
                }
                .padding(DesignSystemGlobal.Spacing4)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusXl)
                        .fill(DesignSystemGlobal.BackgroundContainerColorWhite)
                )
            }
            .padding(DesignSystemGlobal.Spacing4)
            .padding(.top, 16)
            .padding(.bottom, 16)
        }
        .scrollEdgeEffectStyle(.soft, for: .top)
        .scrollEdgeEffectStyle(.soft, for: .bottom)
        .background(DesignSystemGlobal.BackgroundSurfaceColorGreige)
        .navigationBarHidden(true)
    }
}

// MARK: - Code Block
/// Displays code in a styled block
struct CodeBlock: View {
    let code: String
    
    var body: some View {
        Text(code)
            .thdFont(.caption)
            .foregroundStyle(DesignSystemGlobal.Brand300)
            .padding(DesignSystemGlobal.Spacing3)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: DesignSystemGlobal.BorderRadiusMd)
                    .fill(DesignSystemGlobal.Greige100)
            )
    }
}

// MARK: - Preview
#Preview("Navigation Layout Demo") {
    NavigationLayoutDemo()
}

// MARK: - How to Use This in Your App
/*
 
 INTEGRATING WITH BOTTOM TAB BAR:
 
 To use this view as one of your tabs in BottomTabBar_iOS, add it to the MainAppNavigationView:
 
 ```swift
 private var demoTabContent: some View {
     NavigationLayoutDemo()
 }
 ```
 
 Then update your AppTab enum to include a .demo case and wire it up in the tabContent(for:) method.
 
 ---
 
 KEY NAVIGATION CONTROL POINTS:
 
 1️⃣ BOTTOM NAVIGATION (Tab Bar):
    - Controlled in: BottomTabBar_iOS.swift
    - Uses: TabView with selectedTab binding
    - Location: Root level of the app
 
 2️⃣ TOP NAVIGATION (Header):
    - Added via: .safeAreaBar(edge: .top) { MorphingNavHeader(...) }
    - Location: Applied to the main content view
    - Back button controlled by: navigationPath.count
 
 3️⃣ BACK BUTTON VISIBILITY:
    - State variable: @State private var showBackButton: Bool
    - Updated in: .onChange(of: navigationPath.count)
    - Logic: showBackButton = (navigationPath.count > 0)
 
 4️⃣ BACK BUTTON ACTION:
    - Defined in: MorphingNavHeader(onBackTapped:)
    - Action: navigationPath.removeLast()
    - Result: Pops the navigation stack, automatically hiding back button when path is empty
 
 5️⃣ CONTENT SCROLLING:
    - Container: ScrollView
    - Edge effects: .scrollEdgeEffectStyle(.soft, for: .top/.bottom)
    - Padding: Extra top/bottom padding to clear nav elements
 
 ---
 
 TROUBLESHOOTING TOP NAV ISSUES:
 
 Problem: Back button not appearing
 Solution: Check that navigationPath.count is being monitored in .onChange()
 
 Problem: Content scrolling under top nav
 Solution: Add .padding(.top, 16) to ScrollView content
 
 Problem: Top nav not staying in place
 Solution: Ensure .safeAreaBar() is applied AFTER the content, not inside ScrollView
 
 Problem: Back button not working
 Solution: Pass onBackTapped closure that calls navigationPath.removeLast()
 
 */
