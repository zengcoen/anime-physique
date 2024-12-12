import SwiftUI

struct TopCharactersView: View {
    // Hypothetical ratings for the characters
    let characterRatings: [(Character, Int)] = CharacterData.allCharacters
        .map { ($0, Int.random(in: 50...99)) } // Assign high ratings between 50 and 99
        .sorted { $0.1 > $1.1 } // Sort by highest rating

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Top Anime physique matches")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 10)

                ScrollView {
                    ForEach(Array(characterRatings.prefix(10)), id: \.0.id) { character, rating in
                        NavigationLink(destination: CharacterDetailView(character: character)) {
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
            .padding()
        }
    }

    // Function to determine the percentage color for the top three ranks
    private func percentageColor(for character: Character) -> Color {
        // Logic for determining color if needed (e.g., based on rating or position)
        return Color.blue
    }
}
