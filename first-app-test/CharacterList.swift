import SwiftUI

struct CharacterListView: View {
    @Binding var characters: [Character]
    @Binding var currentStep: FormStep
    @Binding var gender: String
    @Binding var weight: String
    @Binding var height: String
    
    @State private var showProfileView = false
    @State private var sortOption: SortOption = .none // State for sorting option
    
    enum SortOption {
        case none, isHearted, highestLevel
    }
    
    var sortedCharacters: [Character] {
        switch sortOption {
        case .isHearted:
            return characters.sorted { $0.isHearted && !$1.isHearted }
        case .highestLevel:
            return characters.sorted { $0.level > $1.level }
        case .none:
            return characters
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // Filter Button
                HStack {
                    Spacer()
                    Menu {
                        Button("Sort by Favorite") {
                            sortOption = .isHearted
                            characters.sort { $0.isHearted && !$1.isHearted }
                        }
                        Button("Sort by Highest Level") {
                            sortOption = .highestLevel
                            characters.sort { $0.level > $1.level }
                        }
                    } label: {
                        HStack {
                            Text("Sort") // Add the text
                            Image(systemName: "line.horizontal.3.decrease.circle") // Icon
                                .font(.title2)
                        }
                    }
                    .id(UUID()) // Force redraw on interaction


                }
                .padding([.horizontal, .top])
                
                // Characters Grid
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(characters.indices, id: \.self) { index in
                            NavigationLink(destination: CharacterDetailView(character: $characters[index], characters: $characters)) {
                                VStack {
                                    ZStack {
                                        Image(characters[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: UIScreen.main.bounds.width / 2.5, height: UIScreen.main.bounds.width / 2.5)
                                            .clipShape(RoundedRectangle(cornerRadius: 12))
                                            .shadow(radius: 5)
                                        
                                        // Level in the top-left corner, deeper into the corner
                                        Text("\(characters[index].level)")
                                            .font(.title2) // Bigger font size
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                            .padding(10)
                                            .background(Color.blue.opacity(0.8))
                                            .clipShape(Circle())
                                            .shadow(radius: 2)
                                            .offset(x: -UIScreen.main.bounds.width / 5.5, y: -UIScreen.main.bounds.width / 5.5) // Adjust offsets to place it closer to the corner

                                        // Heart icon in the top-right corner, deeper into the corner
                                        if characters[index].isHearted {
                                            Image(systemName: "heart.fill")
                                                .resizable() // Make the heart resizable to control its size
                                                .aspectRatio(contentMode: .fit)
                                                .foregroundColor(.red) // Red color for the heart
                                                .frame(width: 30, height: 30) // Adjust size of the heart
                                                .shadow(radius: 2) // Optional shadow for better visibility
                                                .offset(x: UIScreen.main.bounds.width / 5.5, y: -UIScreen.main.bounds.width / 5.5)
                                        }

                                    }
                                    Text(characters[index].name)
                                        .font(.headline)
                                        .foregroundColor(.white) // Set text color to white
                                        .multilineTextAlignment(.center)
                                        .padding(.top, 8)

                                }
                            }
                        }
                    }
                    .padding()
                }




            }
            .toolbar {
                // Title aligned to the left
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Characters")
                        .font(.title)
                        .fontWeight(.bold)
                }

                // Profile button on the trailing side
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
