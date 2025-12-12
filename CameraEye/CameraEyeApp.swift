//
//  CameraEyeApp.swift
//  CameraEye
//
//  Created by ANDREW WATERS on 12/10/25.
//

import SwiftUI

@main
struct CameraEyeApp: App {
    
    init() {
        // Register custom fonts at app launch
        CustomFontRegistration.registerFonts()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
