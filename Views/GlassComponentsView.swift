import SwiftUI

// MARK: - Glass Components View
// Showcases all available glass materials and morphism effects in iOS 18
// ✅ Updated to use design system theme tokens throughout
struct GlassComponentsView: View {

    // MARK: - View Body
    var body: some View {
        // NavigationStack provides the navigation structure for this tab
        NavigationStack {
            ScrollView {
                VStack(spacing: DesignSystemGlobal.Spacing6) {  // Use design system spacing (24pt)

                    // MARK: Header
                    // Creates visual hierarchy and context for the user
                    Text("Materials")
                        .thdFont(.h2)
                        .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)  // Design system text color
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(DesignSystemGlobal.Spacing4)  // Design system spacing (16pt)

                    // MARK: Ultra Thin Material
                    // Demonstrates the most transparent glass option
                    VStack(spacing: DesignSystemGlobal.Spacing3) {  // Design system spacing (12pt)
                        Text("Ultra Thin Material")
                            .thdFont(.h5)
                            .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)  // Design system text color
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, DesignSystemGlobal.Spacing3)

                        // ZStack layers views on top of each other
                        // Background image shows through the glass
                        ZStack {
                            // Background: gradient to simulate depth
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    DesignSystemGlobal.BrandBrand300.opacity(0.4),
                                    DesignSystemGlobal.BrandBrand400.opacity(0.7)
                                ]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )

                            // Foreground: glass overlay
                            // .ultraThinMaterial creates a subtle frosted glass effect
                            VStack {
                                Text("Maximum Transparency")
                                    .thdFont(.bodyMd)
                                    .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 120)
                            .background(.ultraThinMaterial)  // Apply glass effect
                            .cornerRadius(DesignSystemGlobal.BorderRadius2xl)  // Design system corner radius (12pt)
                            .padding(.horizontal, DesignSystemGlobal.Spacing6)
                        }
                        .frame(height: 180)
                        .cornerRadius(DesignSystemGlobal.BorderRadius2xl)  // Design system corner radius (12pt)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, DesignSystemGlobal.Spacing6)  // Design system spacing (24pt)
                    .themedContainer()  // Use themed card background

                    // MARK: Thin Material
                    // Medium transparency glass option
                    VStack(spacing: DesignSystemGlobal.Spacing3) {
                        Text("Thin Material")
                            .thdFont(.h5)
                            .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, DesignSystemGlobal.Spacing3)

                        ZStack {
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    DesignSystemGlobal.BrandBrand300.opacity(0.4),
                                    DesignSystemGlobal.BrandBrand400.opacity(0.7)
                                ]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )

                            VStack {
                                Text("Balanced Blur & Clarity")
                                    .thdFont(.bodyMd)
                                    .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 120)
                            .background(.thinMaterial)
                            .cornerRadius(DesignSystemGlobal.BorderRadius2xl)
                            .padding(.horizontal, DesignSystemGlobal.Spacing6)
                        }
                        .frame(height: 180)
                        .cornerRadius(DesignSystemGlobal.BorderRadius2xl)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, DesignSystemGlobal.Spacing6)
                    .themedContainer()

                    // MARK: Regular Material
                    // Strong glass effect with visible blur
                    VStack(spacing: DesignSystemGlobal.Spacing3) {
                        Text("Regular Material")
                            .thdFont(.h5)
                            .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)
                            .frame(maxWidth: .infinity, alignment: .leading)

                        ZStack {
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    DesignSystemGlobal.BrandBrand300.opacity(0.4),
                                    DesignSystemGlobal.BrandBrand400.opacity(0.7)
                                ]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )

                            VStack {
                                Text("Strong Blur Effect")
                                    .thdFont(.bodyMd)
                                    .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 120)
                            .background(.regularMaterial)
                            .cornerRadius(DesignSystemGlobal.BorderRadius2xl)
                            .padding(.horizontal, DesignSystemGlobal.Spacing6)
                        }
                        .frame(height: 180)
                        .cornerRadius(DesignSystemGlobal.BorderRadius2xl)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, DesignSystemGlobal.Spacing6)
                    .themedContainer()

                    // MARK: Thick Material
                    // Maximum opacity and blur for glass effect
                    VStack(spacing: DesignSystemGlobal.Spacing3) {
                        Text("Thick Material")
                            .thdFont(.h5)
                            .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, DesignSystemGlobal.Spacing6)

                        ZStack {
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    DesignSystemGlobal.BrandBrand300.opacity(0.4),
                                    DesignSystemGlobal.BrandBrand400.opacity(0.7)
                                ]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )

                            VStack {
                                Text("Maximum Opacity")
                                    .thdFont(.bodyMd)
                                    .foregroundStyle(DesignSystemGlobal.TextOnContainerColorPrimary)
                            }
                            .padding(.horizontal, DesignSystemGlobal.Spacing6)
                            .frame(height: 120)
                            .padding(.horizontal, DesignSystemGlobal.Spacing6)
                            .background(.thickMaterial)
                            .cornerRadius(DesignSystemGlobal.BorderRadius2xl)
                        }
                        .frame(height: 180)
                        .cornerRadius(DesignSystemGlobal.BorderRadius2xl)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, DesignSystemGlobal.Spacing6)
                    .themedContainer()

                }
            }
            .navigationTitle("Glass Components")  // Title in navigation bar
            .themedAppBackground()  // Apply design system background (Griege 050)
        }
        .tint(DesignSystemGlobal.BrandBrand300)  // Brand orange for tappable elements
    }
}

// MARK: - Preview
#Preview {
    GlassComponentsView()
}
