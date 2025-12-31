import SwiftUI

/// A reusable theme switcher component for toggling between light and dark modes
@available(iOS 26.0, *)
struct ThemeSwitcher: View {
    @Binding var colorScheme: ColorScheme?
    @Environment(\.colorScheme) var systemColorScheme

    var body: some View {
        HStack(spacing: 8) {
            // Light mode button
            Button {
                withAnimation(.easeInOut(duration: 0.2)) {
                    colorScheme = .light
                }
            } label: {
                Image(systemName: "sun.max.fill")
                    .font(.system(size: 18))
                    .foregroundStyle(colorScheme == .light ? .primary : .secondary)
                    .frame(width: 32, height: 32)
            }
            .buttonStyle(.borderless)
            .glassEffect(.regular.interactive())

            // System default button
            Button {
                withAnimation(.easeInOut(duration: 0.2)) {
                    colorScheme = nil
                }
            } label: {
                Image(systemName: "circle.lefthalf.filled")
                    .font(.system(size: 18))
                    .foregroundStyle(colorScheme == nil ? .primary : .secondary)
                    .frame(width: 32, height: 32)
            }
            .buttonStyle(.borderless)
            .glassEffect(.regular.interactive())

            // Dark mode button
            Button {
                withAnimation(.easeInOut(duration: 0.2)) {
                    colorScheme = .dark
                }
            } label: {
                Image(systemName: "moon.fill")
                    .font(.system(size: 18))
                    .foregroundStyle(colorScheme == .dark ? .primary : .secondary)
                    .frame(width: 32, height: 32)
            }
            .buttonStyle(.borderless)
            .glassEffect(.regular.interactive())
        }
        .padding(4)
        .glassEffect()
    }
}

@available(iOS 26.0, *)
#Preview("Light Mode") {
    ThemeSwitcher(colorScheme: .constant(.light))
        .padding()
        .background(TokensSemanticLight.BackgroundSurfaceColorGreige)
}

@available(iOS 26.0, *)
#Preview("Dark Mode") {
    ThemeSwitcher(colorScheme: .constant(.dark))
        .padding()
        .background(TokensSemanticDark.BackgroundSurfaceColorGreige)
        .preferredColorScheme(.dark)
}

@available(iOS 26.0, *)
#Preview("System Default") {
    ThemeSwitcher(colorScheme: .constant(nil))
        .padding()
        .background(TokensSemanticLight.BackgroundSurfaceColorGreige)
}
