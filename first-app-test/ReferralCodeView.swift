import SwiftUI

struct ReferralCodeView: View {
    @Binding var currentStep: FormStep
    @Binding var referralCode: String

    var body: some View {
        VStack {
            Text("Do you have a referral code?")
                .font(.title2)
                .padding()

            TextField("Enter referral code", text: $referralCode)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                currentStep = .signIn
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
                referralCode = "" // Clear referral code
                currentStep = .signIn
            }) {
                Text("Skip")
                    .font(.body)
                    .foregroundColor(.gray)
                    .padding(.top, 10)
            }
        }
    }
}
