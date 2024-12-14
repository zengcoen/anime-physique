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
                        }
                        Button("Sort by Highest Level") {
                            sortOption = .highestLevel
                        }
                    } label: {
                        HStack {
                            Text("Sort")
                            Image(systemName: "line.horizontal.3.decrease.circle")
                                .font(.title2)
                        }
                    }
                }
                .padding([.horizontal, .top])
                
                // Characters Grid
                ScrollView {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 16) {
                        ForEach(sortedCharacters.indices, id: \.self) { index in
                            NavigationLink(destination: CharacterDetailView(character: $characters[index], characters: $characters)) {
                                ZStack(alignment: .bottom) {
                                    // Character Image
                                    Image(characters[index].image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: UIScreen.main.bounds.width / 3.5, height: UIScreen.main.bounds.width / 3.5)
                                        .clipShape(RoundedRectangle(cornerRadius: 12))
                                        .shadow(radius: 5)

                                    // Level in the top-left corner
                                    Text("\(characters[index].level)")
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .padding(8)
                                        .background(Color.blue.opacity(0.8))
                                        .clipShape(Circle())
                                        .shadow(radius: 2)
                                        .offset(
                                            x: -(UIScreen.main.bounds.width / 3.5) / 2 + 10,
                                            y: -(UIScreen.main.bounds.width / 3.5) / 2 - 32
                                        )

                                    // Heart icon in the top-right corner
                                    if characters[index].isHearted {
                                        Image(systemName: "heart.fill")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .foregroundColor(.red)
                                            .frame(width: 24, height: 24)
                                            .shadow(radius: 2)
                                            .offset(
                                                x: (UIScreen.main.bounds.width / 3.5) / 2 - 10,
                                                y: -(UIScreen.main.bounds.width / 3.5) / 2 - 40
                                            )
                                    }

                                    // Gradient and Name at the bottom
                                    ZStack {
                                        // Gradient
                                        LinearGradient(
                                            gradient: Gradient(colors: [Color.black.opacity(0.8), Color.clear]),
                                            startPoint: .bottom,
                                            endPoint: .top
                                        )
                                        .frame(height: UIScreen.main.bounds.width / 10)
                                        .frame(maxWidth: .infinity) // Full width of the card

                                        // Name on top of the gradient
                                        Text(characters[index].name)
                                            .font(.subheadline)
                                            .fontWeight(.regular)
                                            .foregroundColor(.white)
                                            .padding(.bottom, 0) // Adds padding for better positioning
                                    }
                                    .frame(maxWidth: .infinity, alignment: .bottom) // Align at the bottom of the card
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
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
