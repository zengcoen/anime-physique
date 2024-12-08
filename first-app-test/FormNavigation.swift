import SwiftUI

struct FormNavigation: View {
    @Binding var currentStep: FormStep
    @Binding var gender: String
    @Binding var weight: String
    @Binding var height: String
    @State private var referralCode: String = ""

    var body: some View {
        NavigationView {
            VStack {
                switch currentStep {
                case .gender:
                    GenderStepView(currentStep: $currentStep, gender: $gender)
                case .weight:
                    WeightStepView(currentStep: $currentStep, weight: $weight)
                case .height:
                    HeightStepView(currentStep: $currentStep, height: $height)
                case .referral:
                    ReferralCodeView(currentStep: $currentStep, referralCode: $referralCode)
                case .signIn:
                    SignInView(currentStep: $currentStep)
                case .summary:
                    SummaryView(gender: gender, weight: weight, height: height)
                }
            }
        }
    }
}

// Updated FormStep Enum to Include New Pages
enum FormStep {
    case gender
    case weight
    case height
    case referral
    case signIn
    case summary
}
