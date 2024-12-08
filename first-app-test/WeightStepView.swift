import SwiftUI

struct WeightStepView: View {
    @Binding var currentStep: FormStep
    @Binding var weight: String

    // Weight options in lbs (conversion to kg will be shown together)
    let weightOptions = stride(from: 65, through: 300, by: 5).map { $0 } // Example: 66 lbs to 330 lbs in 5 lbs steps

    var body: some View {
        VStack {
            Text("Select Your Weight")
                .font(.title2)
                .padding()

            // Dropdown Picker for weight
            Picker("Weight", selection: $weight) {
                Text("Select").tag("") // Placeholder option

                // Combine lbs and kg in a single option
                ForEach(weightOptions, id: \.self) { lbs in
                    let kg = Double(lbs) / 2.20462 // Convert lbs to kg
                    Text("\(lbs) lbs (\(String(format: "%.1f", kg)) kg)").tag("\(lbs) lbs")
                }
            }
            .pickerStyle(MenuPickerStyle()) // Native dropdown style
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)

            Button(action: {
                currentStep = .height
            }) {
                Text("Next")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()

            // Skip Button
            Button(action: {
                currentStep = .height
            }) {
                Text("Skip")
                    .font(.body)
                    .foregroundColor(.gray)
                    .padding(.top, 10)
            }
        }
        .onAppear {
            // Set default weight to 150 lbs if not already selected
            if weight.isEmpty {
                weight = "150 lbs"
            }
        }
    }
}
