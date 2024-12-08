import SwiftUI

struct SignInView: View {
    @Binding var currentStep: FormStep

    var body: some View {
        VStack {
            Text("Sign In")
                .font(.title2)
                .padding()

            Spacer()

            // Sign In with Google Button
            Button(action: {
                // Handle Google Sign-In
            }) {
                HStack {
                    Image(systemName: "g.circle") // Replace with Google logo if available
                        .font(.title)
                    Text("Sign in with Google")
                        .fontWeight(.bold)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding()

            // Sign In with Apple Button
            Button(action: {
                // Handle Apple Sign-In
            }) {
                HStack {
                    Image(systemName: "applelogo") // Replace with Apple logo if available
                        .font(.title)
                    Text("Sign in with Apple")
                        .fontWeight(.bold)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding()

            Spacer()
        }
        .padding()
    }
}
