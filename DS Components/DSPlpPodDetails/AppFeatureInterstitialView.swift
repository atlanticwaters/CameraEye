import SwiftUI

// MARK: - Design System Type Alias
private typealias DS = DesignSystemGlobal

// MARK: - App Feature Interstitial View
/// Welcome interstitial that explains app tabs and key features
///
/// Displays on first launch or when requested from the Cart tab.
/// Provides comprehensive overview of:
/// - App navigation tabs (Home, Shop, Catalog, Cart)
/// - Key features and components
/// - Design system capabilities
/// - Interactive dismissal
struct AppFeatureInterstitialView: View {
    @Binding var isPresented: Bool
    @State private var currentPage = 0
    
    var body: some View {
        ZStack {
            // Backdrop
            Color.black.opacity(0.6)
                .ignoresSafeArea()
                .onTapGesture {
                    dismiss()
                }
            
            // Content Card
            VStack(spacing: 0) {
                // Close Button
                HStack {
                    Spacer()
                    Button(action: dismiss) {
                        Image(systemName: "xmark.circle.fill")
                            .font(.system(size: 28))
                            .foregroundStyle(DS.TextOnContainerColorTertiary)
                    }
                    .padding(DS.Spacing3)
                }
                
                // Scrollable Content
                ScrollView {
                    VStack(alignment: .leading, spacing: DS.Spacing5) {
                        // Header
                        headerSection
                        
                        Divider()
                            .background(DS.Greige200)
                        
                        // App Tabs Section
                        tabsSection
                        
                        Divider()
                            .background(DS.Greige200)
                        
                        // Key Features Section
                        keyFeaturesSection
                        
                        Divider()
                            .background(DS.Greige200)
                        
                        // Design System Components
                        componentsSection
                        
                        Divider()
                            .background(DS.Greige200)
                        
                        // Interactive Features
                        interactiveFeaturesSection
                    }
                    .padding(DS.Spacing4)
                }
                .scrollEdgeEffectStyle(.soft, for: .top)
                .scrollEdgeEffectStyle(.soft, for: .bottom)
                
                // Get Started Button
                Button(action: dismiss) {
                    HStack {
                        Text("Get Started")
                            .thdFont(.bodyMd)
                            .foregroundColor(.white)
                        Image(systemName: "arrow.right")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, DS.Spacing3)
                    .background(DS.Brand300)
                    .cornerRadius(DS.BorderRadiusXl)
                }
                .padding(DS.Spacing4)
            }
            .frame(maxWidth: 600)
            .frame(maxHeight: .infinity)
            .background(DS.BackgroundContainerColorWhite)
            .cornerRadius(DS.BorderRadiusXl)
            .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 10)
            .padding(DS.Spacing4)
        }
        .transition(.opacity.combined(with: .scale(scale: 0.9)))
    }
    
    // MARK: - Header Section
    
    private var headerSection: some View {
        VStack(alignment: .leading, spacing: DS.Spacing3) {
            // Icon
            Image("home-logo")
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .foregroundStyle(DS.Brand300)
            
            // Title
            Text("Welcome to the\nTHD Design System App")
                .thdFont(.hero4)
                .foregroundColor(DS.TextOnContainerColorPrimary)
                .fixedSize(horizontal: false, vertical: true)
            
            // Description
            Text("Explore a comprehensive component library, interactive navigation patterns, and a complete design system implementation.")
                .thdFont(.bodyMd)
                .foregroundColor(DS.TextOnContainerColorSecondary)
                .fixedSize(horizontal: false, vertical: true)
        }
    }
    
    // MARK: - Tabs Section
    
    private var tabsSection: some View {
        VStack(alignment: .leading, spacing: DS.Spacing4) {
            sectionHeader(
                title: "App Navigation",
                subtitle: "Four main tabs for exploring the app"
            )
            
            VStack(spacing: DS.Spacing3) {
                tabInfoRow(
                    icon: "home-logo",
                    isCustomIcon: true,
                    title: "Home",
                    description: "Hero sections, promotional content, product carousels, and featured categories with morphing navigation header.",
                    color: DS.Brand300
                )
                
                tabInfoRow(
                    icon: "cart.fill",
                    isCustomIcon: false,
                    title: "Shop",
                    description: "Dynamic morphing menu with 20 departments, subcategories, and seamless navigation to product listings (PLP).",
                    color: DS.Brand400
                )
                
                tabInfoRow(
                    icon: "square.grid.2x2.fill",
                    isCustomIcon: false,
                    title: "Catalog",
                    description: "Browse 9+ interactive component demos including buttons, cards, badges, alerts, and the complete design system.",
                    color: DS.Moonlight500
                )
                
                tabInfoRow(
                    icon: "bag.fill",
                    isCustomIcon: false,
                    title: "Cart",
                    description: "Shopping cart and checkout flow (coming soon). Access this guide anytime from the Cart tab.",
                    color: DS.BottleGreen500
                )
            }
        }
    }
    
    // MARK: - Key Features Section
    
    private var keyFeaturesSection: some View {
        VStack(alignment: .leading, spacing: DS.Spacing4) {
            sectionHeader(
                title: "Key Features",
                subtitle: "What makes this app special"
            )
            
            VStack(spacing: DS.Spacing3) {
                featureRow(
                    icon: "wand.and.stars",
                    title: "Morphing Navigation",
                    description: "iOS 26-inspired transitions with matchedGeometryEffect and glass materials.",
                    color: DS.Lemon500
                )
                
                featureRow(
                    icon: "sparkles",
                    title: "Product List Pages (PLP)",
                    description: "Complete product browsing with filters, sorting, grid/list views, and product details.",
                    color: DS.Brand300
                )
                
                featureRow(
                    icon: "square.stack.3d.up",
                    title: "Dynamic Shop Menu",
                    description: "Drill down through departments and subcategories with smooth animations and state management.",
                    color: DS.Cinnabar500
                )
                
                featureRow(
                    icon: "paintbrush.pointed",
                    title: "Design System Tokens",
                    description: "Comprehensive token system with colors, typography, spacing, borders, and elevation.",
                    color: DS.Moonlight500
                )
                
                featureRow(
                    icon: "moon.stars",
                    title: "Dark Mode Support",
                    description: "Full dark mode implementation with semantic color tokens across all components.",
                    color: DS.Moonlight600
                )
            }
        }
    }
    
    // MARK: - Components Section
    
    private var componentsSection: some View {
        VStack(alignment: .leading, spacing: DS.Spacing4) {
            sectionHeader(
                title: "Design System Components",
                subtitle: "9+ production-ready SwiftUI components"
            )
            
            // Grid of component badges
            VStack(alignment: .leading, spacing: DS.Spacing2) {
                HStack(spacing: DS.Spacing2) {
                    componentBadge("Button", icon: "hand.tap")
                    componentBadge("Card", icon: "rectangle")
                    componentBadge("Product Card", icon: "square.grid.2x2")
                }
                
                HStack(spacing: DS.Spacing2) {
                    componentBadge("Badge", icon: "tag")
                    componentBadge("Alert", icon: "exclamationmark.triangle")
                    componentBadge("Callout", icon: "megaphone")
                }
                
                HStack(spacing: DS.Spacing2) {
                    componentBadge("Pill", icon: "capsule")
                    componentBadge("Tile", icon: "square.grid.2x2")
                    componentBadge("Quantity Picker", icon: "plusminus")
                }
            }
            
            // Additional component details
            VStack(alignment: .leading, spacing: DS.Spacing2) {
                Text("Each component includes:")
                    .thdFont(.bodySm)
                    .foregroundColor(DS.TextOnContainerColorSecondary)
                
                componentFeature("Multiple variants and states")
                componentFeature("Interactive demos and examples")
                componentFeature("Usage guidelines and code samples")
                componentFeature("Real-world implementation patterns")
                componentFeature("Dark mode and accessibility support")
            }
            .padding(DS.Spacing3)
            .background(DS.BackgroundContainerColorGreige)
            .cornerRadius(DS.BorderRadiusLg)
        }
    }
    
    // MARK: - Interactive Features Section
    
    private var interactiveFeaturesSection: some View {
        VStack(alignment: .leading, spacing: DS.Spacing4) {
            sectionHeader(
                title: "Interactive Demos",
                subtitle: "Try these features throughout the app"
            )
            
            VStack(spacing: DS.Spacing3) {
                interactiveFeatureRow(
                    icon: "hand.point.up.left.fill",
                    title: "Product Pods (PLP)",
                    description: "Tap products to view details, swipe for quick actions, view ratings and pricing.",
                    location: "Shop → Any Category"
                )
                
                interactiveFeatureRow(
                    icon: "slider.horizontal.3",
                    title: "Filter & Sort",
                    description: "Refine product searches with multi-select filters and various sorting options.",
                    location: "Product List Pages"
                )
                
                interactiveFeatureRow(
                    icon: "arrow.left.arrow.right",
                    title: "View Toggle",
                    description: "Switch between grid and list views for different browsing experiences.",
                    location: "Product List Pages"
                )
                
                interactiveFeatureRow(
                    icon: "arrow.uturn.backward",
                    title: "Navigation Morphing",
                    description: "Watch smooth transitions as headers morph between states with back navigation.",
                    location: "Home & Shop Tabs"
                )
            }
        }
    }
    
    // MARK: - Helper Views
    
    private func sectionHeader(title: String, subtitle: String) -> some View {
        VStack(alignment: .leading, spacing: DS.Spacing1) {
            Text(title)
                .thdFont(.h2)
                .foregroundColor(DS.TextOnContainerColorPrimary)
            
            Text(subtitle)
                .thdFont(.bodySm)
                .foregroundColor(DS.TextOnContainerColorTertiary)
        }
    }
    
    private func tabInfoRow(icon: String, isCustomIcon: Bool, title: String, description: String, color: Color) -> some View {
        HStack(alignment: .top, spacing: DS.Spacing3) {
            // Icon
            Group {
                if isCustomIcon {
                    Image(icon)
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                } else {
                    Image(systemName: icon)
                        .font(.system(size: 24, weight: .semibold))
                }
            }
            .frame(width: 44, height: 44)
            .foregroundStyle(color)
            .background(color.opacity(0.15))
            .cornerRadius(DS.BorderRadiusLg)
            
            // Content
            VStack(alignment: .leading, spacing: DS.Spacing1) {
                Text(title)
                    .thdFont(.bodyLg)
                    .foregroundColor(DS.TextOnContainerColorPrimary)
                
                Text(description)
                    .thdFont(.bodySm)
                    .foregroundColor(DS.TextOnContainerColorSecondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .padding(DS.Spacing3)
        .background(DS.BackgroundContainerColorGreige)
        .cornerRadius(DS.BorderRadiusLg)
    }
    
    private func featureRow(icon: String, title: String, description: String, color: Color) -> some View {
        HStack(alignment: .top, spacing: DS.Spacing3) {
            // Icon
            Image(systemName: icon)
                .font(.system(size: 20, weight: .semibold))
                .frame(width: 36, height: 36)
                .foregroundStyle(color)
                .background(color.opacity(0.15))
                .cornerRadius(DS.BorderRadiusMd)
            
            // Content
            VStack(alignment: .leading, spacing: DS.Spacing1) {
                Text(title)
                    .thdFont(.bodyMd)
                    .foregroundColor(DS.TextOnContainerColorPrimary)
                
                Text(description)
                    .thdFont(.bodySm)
                    .foregroundColor(DS.TextOnContainerColorSecondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }
    
    private func componentBadge(_ title: String, icon: String) -> some View {
        HStack(spacing: DS.Spacing1) {
            Image(systemName: icon)
                .font(.system(size: 12, weight: .semibold))
            
            Text(title)
                .thdFont(.caption)
        }
        .foregroundColor(DS.TextOnContainerColorPrimary)
        .padding(.horizontal, DS.Spacing2)
        .padding(.vertical, DS.Spacing1)
        .background(DS.Greige100)
        .cornerRadius(DS.BorderRadiusSm)
    }
    
    private func componentFeature(_ text: String) -> some View {
        HStack(alignment: .top, spacing: DS.Spacing2) {
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 14))
                .foregroundStyle(DS.BottleGreen500)
            
            Text(text)
                .thdFont(.bodySm)
                .foregroundColor(DS.TextOnContainerColorSecondary)
        }
    }
    
    private func interactiveFeatureRow(icon: String, title: String, description: String, location: String) -> some View {
        VStack(alignment: .leading, spacing: DS.Spacing2) {
            HStack(alignment: .top, spacing: DS.Spacing2) {
                Image(systemName: icon)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundStyle(DS.Brand300)
                    .frame(width: 32, height: 32)
                    .background(DS.Brand300.opacity(0.15))
                    .cornerRadius(DS.BorderRadiusMd)
                
                VStack(alignment: .leading, spacing: DS.Spacing1) {
                    Text(title)
                        .thdFont(.bodyMd)
                        .foregroundColor(DS.TextOnContainerColorPrimary)
                    
                    Text(description)
                        .thdFont(.bodySm)
                        .foregroundColor(DS.TextOnContainerColorSecondary)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }
            
            // Location badge
            HStack(spacing: DS.Spacing1) {
                Image(systemName: "location.fill")
                    .font(.system(size: 10))
                Text(location)
                    .thdFont(.caption)
            }
            .foregroundColor(DS.TextOnContainerColorTertiary)
            .padding(.horizontal, DS.Spacing2)
            .padding(.vertical, 4)
            .background(DS.Greige100)
            .cornerRadius(DS.BorderRadiusSm)
        }
        .padding(DS.Spacing3)
        .background(DS.BackgroundContainerColorGreige)
        .cornerRadius(DS.BorderRadiusLg)
    }
    
    // MARK: - Actions
    
    private func dismiss() {
        withAnimation(.spring(response: 0.35, dampingFraction: 0.85)) {
            isPresented = false
        }
    }
}

// MARK: - Preview

#Preview("App Feature Interstitial") {
    @Previewable @State var isPresented = true
    
    ZStack {
        // Background content
        DS.BackgroundSurfaceColorGreige
            .ignoresSafeArea()
        
        Text("App Content")
            .font(.title)
        
        // Interstitial overlay
        if isPresented {
            AppFeatureInterstitialView(isPresented: $isPresented)
        }
    }
}

// MARK: - Usage Notes
/*
 APP FEATURE INTERSTITIAL VIEW
 
 A comprehensive welcome screen that explains:
 ✨ All four app tabs (Home, Shop, Catalog, Cart)
 🎨 Key features and capabilities
 📦 Design system components
 🔄 Interactive demo locations
 
 USAGE:
 
 ```swift
 @State private var showInterstitial = true
 
 var body: some View {
     ZStack {
         // Your main app content
         MainAppNavigationView()
         
         // Show interstitial on first launch or from Cart
         if showInterstitial {
             AppFeatureInterstitialView(isPresented: $showInterstitial)
         }
     }
 }
 ```
 
 FEATURES:
 - Scrollable content for comprehensive information
 - Animated presentation/dismissal
 - Tap backdrop to dismiss
 - "Get Started" CTA button
 - Organized sections with visual hierarchy
 - Component badges and feature lists
 - Location hints for interactive features
 
 DESIGN:
 - Uses DesignSystemGlobal tokens
 - Material backdrop blur
 - Rounded card with shadow
 - Icon-driven sections
 - Responsive layout (max width 600pt)
 - Soft scroll edge effects
 */
