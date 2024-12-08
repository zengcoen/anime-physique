import SwiftUI

struct SummaryView: View {
    let gender: String
    let weight: String
    let height: String

    var body: some View {
        VStack {
            Text("Summary")
                .font(.largeTitle)
                .padding()

            Text("Gender: \(gender)")
            Text("Weight: \(weight)")
            Text("Height: \(height)")

            Spacer()
        }
        .padding()
    }
}
