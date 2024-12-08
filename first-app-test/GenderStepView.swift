import SwiftUI

struct GenderStepView: View {
    @Binding var currentStep: FormStep
    @Binding var gender: String

    var body: some View {
        VStack {
            Text("Select Gender")
                .font(.title2)
                .padding()

            HStack {
                Button(action: {
                    gender = "Male"
                    currentStep = .weight
                }) {
                    Text("Male")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                Button(action: {
                    gender = "Female"
                    currentStep = .weight
                }) {
                    Text("Female")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.pink)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
            // Skip Button with Larger Text
            Button(action: {
                currentStep = .weight
            }) {
                Text("Skip")
                    .font(.body) // Larger font for better visibility
                    .foregroundColor(.gray)
                    .padding(.top, 10)
            }
        }
    }
}
