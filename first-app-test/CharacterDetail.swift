import SwiftUI
import Charts

struct CharacterDetailView: View {
    let character: Character

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Character Header: Image and Name
                HStack(alignment: .top, spacing: 16) {
                    // Character Image
                    Image(character.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .shadow(radius: 5)
                        .frame(width: UIScreen.main.bounds.width / 3) // 1/3 width
                    
                    // Name and Verse
                    VStack(alignment: .leading, spacing: 4) {
                        // Character Name
                        Text(character.name)
                            .font(.title2) // Smaller than .largeTitle
                            .bold()
                            .multilineTextAlignment(.leading)
                        
                        // Character Verse
                        Text(character.verse)
                            .font(.body) // Regular font
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.bottom, 8)

                // Character Description
                Text(character.description)
                    .font(.body)
                    .padding(.bottom, 16)

                // Attributes Sliders
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                    ForEach(character.attributes.sorted(by: >), id: \.key) { attribute, score in
                        VStack(alignment: .leading, spacing: 8) {
                            Text(attribute)
                                .font(.headline)

                            // Slider Bar Only
                            ZStack(alignment: .leading) {
                                Capsule()
                                    .frame(height: 8) // Thicker bar
                                    .foregroundColor(Color.gray.opacity(0.3))

                                Capsule()
                                    .frame(width: CGFloat(score) / 100 * UIScreen.main.bounds.width / 2 - 10, height: 8)
                                    .foregroundColor(.blue)
                            }

                            Text("\(score)/100")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                }

                Spacer()
            }
            .padding()
        }
        .navigationBarTitle("", displayMode: .inline) // Removes the title
        .navigationBarBackButtonHidden(false) // Keeps the back button visible
    }
}
