//
//  ContentView.swift
//  CameraEye
//
//  Created by ANDREW WATERS on 12/10/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            TypographyDemoView()
                .navigationTitle("Typography Demo")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
