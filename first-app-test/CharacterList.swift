import SwiftUI

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

