import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    @State private var currentStep: FormStep = .gender
    @State private var gender: String = ""
    @State private var weight: String = ""
    @State private var height: String = ""
    
    var body: some View {
        ZStack {
            // Show the corresponding content based on the selected tab
            TabView(selection: $selectedTab) {
                Home()
                    .tag(0)
                FormNavigation(currentStep: $currentStep, gender: $gender, weight: $weight, height: $height)
                    .tag(1)

                CharacterListView(currentStep: $currentStep, gender: $gender, weight: $weight, height: $height)
                    .tag(2)
            }
            .edgesIgnoringSafeArea(.top)

            VStack {
                Spacer() // Push NavBar to the bottom
                NavBar(selectedTab: $selectedTab)
                    .background(Color(.systemBackground))
                    .ignoresSafeArea(.keyboard, edges: .bottom)
            }
        }
    }
}


#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
