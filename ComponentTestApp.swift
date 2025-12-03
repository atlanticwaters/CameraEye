import SwiftUI

// MARK: - App Entry Point
/// Main entry point for the THD Component Test application.
///
/// This app showcases the THD Design System components with a comprehensive
/// catalog view for browsing all available components and their variants.
@main
struct ComponentTestApp: App {
    var body: some Scene {
        WindowGroup {
            ComponentCatalogView()
        }
    }
}
