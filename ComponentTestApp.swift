import SwiftUI

// MARK: - App Entry Point
/// Main entry point for the THD Component Test application.
///
/// This app showcases the THD Design System components with a comprehensive
/// catalog view for browsing all available components and their variants.
///
/// Navigation structure:
/// - Home tab: Typography Demo (FontTestView)
/// - Deals tab: Product Listing Page
/// - Label tab: Component Catalog View
/// - Other tab: Placeholder
/// - Profile: Placeholder
@main
struct ComponentTestApp: App {
    var body: some Scene {
        WindowGroup {
            AppNavigationView()
        }
    }
}
