import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    @State private var currentStep: FormStep = .gender
    @State private var gender: String = ""
    @State private var weight: String = ""
    @State private var height: String = ""
    @State private var characters = CharacterData.allCharacters // Centralized state for characters
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                Home()
                    .tag(0)
                FormNavigation(currentStep: $currentStep, gender: $gender, weight: $weight, height: $height)
                    .tag(1)
                CharacterListView(characters: $characters, currentStep: $currentStep, gender: $gender, weight: $weight, height: $height)
                    .tag(2)
                TopCharactersView(characters: $characters)
                    .tag(3)
            }
            
            .edgesIgnoringSafeArea(.top)

            VStack {
                Spacer()
                NavBar(selectedTab: $selectedTab)
                    .background(Color(.systemBackground))
                    .ignoresSafeArea(.keyboard, edges: .bottom)
            }
        }
        .onAppear {
            AppDelegate.orientationLock = .portrait
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
            UINavigationController.attemptRotationToDeviceOrientation()
        }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
