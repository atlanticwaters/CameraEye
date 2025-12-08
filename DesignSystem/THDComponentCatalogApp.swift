import SwiftUI

@main
struct THDComponentCatalogApp: App {
    
    init() {
        // Register custom fonts on app launch
        CustomFontRegistration.registerFonts()
        
        // Enable font debugging during development
        CustomFontRegistration.listAvailableFonts()
    }
    
    var body: some Scene {
        WindowGroup {
            ComponentCatalogView()
        }
    }
}
