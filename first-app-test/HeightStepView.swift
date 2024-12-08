import SwiftUI

struct HeightStepView: View {
    @Binding var currentStep: FormStep
    @Binding var height: String

    // Height options in inches (convert to cm for display)
    let heightOptions = Array(57...95) // Example: 4'9" (57 inches) to 7'11" (95 inches)

    var body: some View {
        VStack {
            Text("Select Your Height")
                .font(.title2)
                .padding()

            // Dropdown Picker for height
            Picker("Height", selection: $height) {
                ForEach(heightOptions, id: \.self) { totalInches in
                    let feet = totalInches / 12
                    let inches = totalInches % 12
                    let cm = Int(Double(totalInches) * 2.54)
                    Text("\(feet)'\(inches)\" (\(cm) cm)").tag("\(feet)'\(inches)\"")
                }
            }
            .pickerStyle(MenuPickerStyle()) // Native dropdown style
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)

            Button(action: {
                currentStep = .referral // Move to the referral page
            }) {
                Text("Next")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()

            // Skip Button
            Button(action: {
                currentStep = .referral // Skip to referral page
            }) {
                Text("Skip")
                    .font(.body)
                    .foregroundColor(.gray)
                    .padding(.top, 10)
            }
        }
        .onAppear {
            // Set default height to 5'7" if not already selected
            if height.isEmpty {
                height = "5'7\""
            }
        }
    }
}
