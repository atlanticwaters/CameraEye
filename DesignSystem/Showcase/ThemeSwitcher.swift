import SwiftUI

/// A reusable theme switcher component for toggling between light and dark modes
struct ThemeSwitcher: View {
    @Binding var colorScheme: ColorScheme?
    @Environment(\.colorScheme) var systemColorScheme
    
    var body: some View {
        GlassEffectContainer(spacing: 10) {
            HStack(spacing: 8) {
                // Light mode button
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        colorScheme = .light
                    }
                }) {
                    Image(systemName: "sun.max.fill")
                        .font(.system(size: 18))
                        .foregroundStyle(colorScheme == .light ? .primary : .secondary)
                        .frame(width: 32, height: 32)
                }
                .buttonStyle(.glass)
                
                // System default button
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        colorScheme = nil
                    }
                }) {
                    Image(systemName: "circle.lefthalf.filled")
                        .font(.system(size: 18))
                        .foregroundStyle(colorScheme == nil ? .primary : .secondary)
                        .frame(width: 32, height: 32)
                }
                .buttonStyle(.glass)
                
                // Dark mode button
                Button(action: {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        colorScheme = .dark
                    }
                }) {
                    Image(systemName: "moon.fill")
                        .font(.system(size: 18))
                        .foregroundStyle(colorScheme == .dark ? .primary : .secondary)
                        .frame(width: 32, height: 32)
                }
                .buttonStyle(.glass)
            }
            .padding(4)
        }
    }
}

#Preview("Light Mode") {
    ThemeSwitcher(colorScheme: .constant(.light))
        .padding()
        .background(TokensSemanticLight.BackgroundSurfaceColorGreige)
}

#Preview("Dark Mode") {
    ThemeSwitcher(colorScheme: .constant(.dark))
        .padding()
        .background(TokensSemanticDark.BackgroundSurfaceColorGreige)
        .preferredColorScheme(.dark)
}

#Preview("System Default") {
    ThemeSwitcher(colorScheme: .constant(nil))
        .padding()
        .background(TokensSemanticLight.BackgroundSurfaceColorGreige)
}
