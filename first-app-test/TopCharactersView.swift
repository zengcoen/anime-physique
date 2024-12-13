import SwiftUI

struct TopCharactersView: View {
    @State private var characters: [Character] = CharacterData.allCharacters.map { character in
        var mutableCharacter = character
        mutableCharacter.isHearted = false // Initialize as not hearted
        return mutableCharacter
    }
    
    // Fixed ratings for each character
    @State private var characterRatings: [(Character, Int)] = {
        let allRatings = CharacterData.allCharacters.map { character in
            (character, Int.random(in: 50...99))
        }
        return allRatings.sorted { $0.1 > $1.1 }
    }()

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Top Anime Physique Matches")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 10)
                
                ScrollView {
                    ForEach(Array(characterRatings.prefix(10)), id: \.0.id) { character, rating in
                        if let index = characters.firstIndex(where: { $0.id == character.id }) {
                            NavigationLink(
                                destination: CharacterDetailView(character: Binding(
                                    get: { characters[index] },
                                    set: { characters[index] = $0 }
                                ))
                            ) {
                                HStack(spacing: 15) {
                                    // Circular Slider with Image
                                    ZStack {
                                        Circle()
                                            .stroke(Color.gray.opacity(0.3), lineWidth: 6) // Background of the circular slider
                                            .frame(width: 86, height: 86) // Slider diameter
                                        
                                        Circle()
                                            .trim(from: 0.0, to: CGFloat(rating) / 100)
                                            .stroke(Color.blue, lineWidth: 6) // Progress of the circular slider
                                            .rotationEffect(.degrees(-90)) // Start at top
                                            .frame(width: 86, height: 86) // Slider diameter
                                        
                                        Image(character.image)
                                            .resizable()
                                            .frame(width: 80, height: 80) // Slightly increased image size
                                            .clipShape(Circle()) // Ensures the image is circular
                                    }
                                    
                                    // Name
                                    Text(character.name)
                                        .font(.title3) // Larger name
                                        .fontWeight(.semibold)
                                        .lineLimit(2) // Allows wrapping
                                        .multilineTextAlignment(.leading) // Align text to the leading edge
                                        .foregroundColor(.white) // Set the text color to white
                                    
                                    Spacer()
                                    
                                    // Percentage
                                    Text("\(rating)%")
                                        .font(.title) // Larger percentage font
                                        .fontWeight(.bold)
                                        .foregroundColor(.blue) // Set the text color to blue
                                }
                                .padding()
                                .background(Color(.secondarySystemBackground)) // Default background
                                .cornerRadius(10)
                                .shadow(radius: 3)
                            }
                        }
                    }
                }
            }
            .padding()
            .navigationTitle("Top Characters") // Adds a navigation title
        }
    }
}
