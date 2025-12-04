import SwiftUI

@main
struct THDComponentCatalogApp: App {
    
    init() {
        // Register custom fonts on app launch
        CustomFontRegistration.registerFonts()
        
        // Uncomment below to debug font registration issues
        // CustomFontRegistration.listAvailableFonts()
    }
    
    var body: some Scene {
        WindowGroup {
            ComponentCatalogView()
        }
    }
}
