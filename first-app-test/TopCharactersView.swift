import SwiftUI

struct TopCharactersView: View {
    @Binding var characters: [Character]
    @State private var characterRatings: [(Character, Int)]

    init(characters: Binding<[Character]>) {
        // Use the binding to initialize `characters` and generate random ratings
        self._characters = characters
        let allRatings = characters.wrappedValue.map { character in
            (character, Int.random(in: 50...99))
        }
        self._characterRatings = State(initialValue: allRatings.sorted { $0.1 > $1.1 })
    }

    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Top Anime Physique Matches")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.bottom, 10)

                ScrollView {
                    ForEach(characterRatings.indices, id: \.self) { index in
                        let character = characterRatings[index].0
                        let rating = characterRatings[index].1
                        if let charIndex = characters.firstIndex(where: { $0.id == character.id }) {
                            NavigationLink(
                                destination: CharacterDetailView(character: $characters[charIndex], characters: $characters)
                            ) {
                                CharacterRow(character: character, rating: rating)
                            }
                        }
                    }
                }
            }
            .padding()
        }
    }
}


struct CharacterRow: View {
    let character: Character
    let rating: Int

    var body: some View {
        HStack(spacing: 15) {
            // Circular Slider with Image
            ZStack {
                Circle()
                    .stroke(Color.gray.opacity(0.3), lineWidth: 6)
                    .frame(width: 86, height: 86)

                Circle()
                    .trim(from: 0.0, to: CGFloat(rating) / 100)
                    .stroke(Color.blue, lineWidth: 6)
                    .rotationEffect(.degrees(-90))
                    .frame(width: 86, height: 86)

                Image(character.image)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
            }

            // Name
            Text(character.name)
                .font(.title3)
                .fontWeight(.semibold)
                .lineLimit(2)
                .multilineTextAlignment(.leading)

            Spacer()

            // Percentage
            Text("\(rating)%")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.blue)
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(10)
        .shadow(radius: 3)
    }
}
