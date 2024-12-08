import SwiftUI

struct ProfileView: View {
    @Binding var currentStep: FormStep
    @Binding var gender: String
    @Binding var weight: String
    @Binding var height: String

    @State private var showConfirmation = false // State to handle the confirmation dialog

    var body: some View {
        VStack {
            Text("Profile")
                .font(.largeTitle)
                .padding()

            Spacer()

            Button(action: {
                showConfirmation = true // Show the confirmation dialog
            }) {
                Text("Remove Account")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
            .alert("Are you sure?", isPresented: $showConfirmation) {
                Button("Cancel", role: .cancel) { }
                Button("Yes, Remove", role: .destructive) {
                    resetFormData()
                }
            } message: {
                Text("This will erase your form data and reset the form view.")
            }

            Spacer()
        }
        .padding()
    }

    /// Function to reset form data and navigate back to the first step
    private func resetFormData() {
        gender = ""
        weight = ""
        height = ""
        currentStep = .gender // Reset to the first step
    }
}
