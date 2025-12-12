import SwiftUI

// MARK: - DSPodButtonSet Previews

// B2C Variants
#Preview("B2C - Light Mode") {
    DSPodButtonSet.sampleB2C()
        .padding()
        .preferredColorScheme(.light)
}

#Preview("B2C - Dark Mode") {
    DSPodButtonSet.sampleB2C()
        .padding()
        .preferredColorScheme(.dark)
        .background(Color.black)
}

// B2B Variants
#Preview("B2B - Quantity 1") {
    DSPodButtonSet.sampleB2B(
        quantity: .constant(1)
    )
    .padding()
    .preferredColorScheme(.light)
}

#Preview("B2B - Quantity 5") {
    DSPodButtonSet.sampleB2B(
        quantity: .constant(5)
    )
    .padding()
    .preferredColorScheme(.light)
}

#Preview("B2B - Quantity 99") {
    DSPodButtonSet.sampleB2B(
        quantity: .constant(99)
    )
    .padding()
    .preferredColorScheme(.light)
}

#Preview("B2B - Dark Mode") {
    DSPodButtonSet.sampleB2B(
        quantity: .constant(3)
    )
    .padding()
    .preferredColorScheme(.dark)
    .background(Color.black)
}

#Preview("B2B - Without Add to List") {
    DSPodButtonSet(
        variant: .b2b,
        quantity: .constant(1),
        onAddToCart: {},
        onAddToList: nil
    )
    .padding()
    .preferredColorScheme(.light)
}

// Interactive Preview
#Preview("B2B - Interactive") {
    InteractiveB2BPreview()
}

// Comparison Preview
#Preview("B2C vs B2B") {
    VStack(spacing: 32) {
        VStack {
            Text("B2C Variant")
                .font(.headline)
            DSPodButtonSet.sampleB2C()
        }
        
        Divider()
        
        VStack {
            Text("B2B Variant")
                .font(.headline)
            DSPodButtonSet.sampleB2B(quantity: .constant(2))
        }
    }
    .padding()
}

#Preview("All Variants - Light") {
    ScrollView {
        VStack(spacing: 24) {
            SectionPreview(title: "B2C") {
                DSPodButtonSet.sampleB2C()
            }
            
            SectionPreview(title: "B2B - Qty 1") {
                DSPodButtonSet.sampleB2B(quantity: .constant(1))
            }
            
            SectionPreview(title: "B2B - Qty 10") {
                DSPodButtonSet.sampleB2B(quantity: .constant(10))
            }
        }
        .padding()
    }
}

#Preview("All Variants - Dark") {
    ScrollView {
        VStack(spacing: 24) {
            SectionPreview(title: "B2C") {
                DSPodButtonSet.sampleB2C()
            }
            
            SectionPreview(title: "B2B - Qty 1") {
                DSPodButtonSet.sampleB2B(quantity: .constant(1))
            }
            
            SectionPreview(title: "B2B - Qty 10") {
                DSPodButtonSet.sampleB2B(quantity: .constant(10))
            }
        }
        .padding()
    }
    .preferredColorScheme(.dark)
    .background(Color.black)
}

// MARK: - Helper Views

private struct InteractiveB2BPreview: View {
    @State private var quantity = 1
    @State private var message = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Interactive B2B Button Set")
                .font(.headline)
            
            DSPodButtonSet(
                variant: .b2b,
                quantity: $quantity,
                onAddToCart: {
                    message = "Added \(quantity) to cart"
                },
                onAddToList: {
                    message = "Added \(quantity) to list"
                }
            )
            
            if !message.isEmpty {
                Text(message)
                    .font(.caption)
                    .foregroundColor(.green)
                    .padding()
                    .background(Color.green.opacity(0.1))
                    .cornerRadius(8)
            }
            
            Text("Current Quantity: \(quantity)")
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding()
    }
}

private struct SectionPreview<Content: View>: View {
    let title: String
    @ViewBuilder let content: () -> Content
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.headline)
            content()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
