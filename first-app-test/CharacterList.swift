import SwiftUI

struct Character: Identifiable {
    let id = UUID()
    let name: String
    let image: String // Assume this is the name of an asset in your project
    let description: String
    let attributes: [String: Int] // Attribute name and score
    let verse: String // New property for the character's verse
}


struct CharacterData {
    static let allCharacters: [Character] = [
        Character(
            name: "Toji Fushiguro",
            image: "toji",
            description: "A skilled and powerful fighter with unmatched abilities.",
            attributes: [
                "Strength": 98,
                "Speed": 95,
                "Endurance": 92,
                "Flexibility": 85,
                "Combat Technique": 97,
                "Durability": 90
            ],
            verse: "Jujutsu Kaisen"
        ),
        Character(
            name: "Garou",
            image: "garou",
            description: "A brave warrior known for his heroic deeds.",
            attributes: [
                "Strength": 85,
                "Speed": 80,
                "Endurance": 88,
                "Flexibility": 78,
                "Combat Technique": 84,
                "Durability": 87
            ],
            verse: "One Punch Man"
        )
        // Add more characters as needed
    ]
}



struct CharacterListView: View {
    @Binding var currentStep: FormStep
    @Binding var gender: String
    @Binding var weight: String
    @Binding var height: String

    @State private var searchText: String = "" // State to manage search text
    @State private var showProfileView = false

    var characters = CharacterData.allCharacters

    var filteredCharacters: [Character] {
        if searchText.isEmpty {
            return characters
        } else {
            return characters.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }

    var body: some View {
        NavigationView {
            VStack {
                // Search Bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Search characters...", text: $searchText)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(8)
                        .background(Color(.systemGray6))
                        .cornerRadius(8)
                }
                .padding([.horizontal, .top])

                // Characters Grid
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(filteredCharacters) { character in
                            NavigationLink(destination: CharacterDetailView(character: character)) {
                                VStack {
                                    Image(character.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: UIScreen.main.bounds.width / 2.5, height: UIScreen.main.bounds.width / 2.5)
                                        .clipShape(RoundedRectangle(cornerRadius: 12))
                                        .shadow(radius: 5)
                                    Text(character.name)
                                        .font(.headline)
                                        .multilineTextAlignment(.center)
                                        .padding(.top, 8)
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Characters")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showProfileView = true
                    }) {
                        Image(systemName: "gearshape")
                            .font(.title2)
                    }
                }
            }
            .sheet(isPresented: $showProfileView) {
                ProfileView(
                    currentStep: $currentStep,
                    gender: $gender,
                    weight: $weight,
                    height: $height
                )
            }
        }
    }
}

