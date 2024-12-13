import SwiftUI

struct CharacterDetailView: View {
    @Binding var character: Character // Make it binding to allow updates
    @Binding var characters: [Character] // Pass all characters

    @State private var selectedTab: String = "Stats" // Default tab
    @State private var showPopup: Bool = false // State to control popup visibility
    @State private var popupProgress: Double = 0 // Progress shown in the popup
    @State private var popupLevel: Int = 0 // Level shown in the popup

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Character Header: Image, Name, and Details
                HStack(alignment: .top, spacing: 16) {
                    Image(character.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .shadow(radius: 5)
                        .frame(width: UIScreen.main.bounds.width / 3)

                    VStack(alignment: .leading, spacing: 4) {
                        Text(character.name)
                            .font(.title2)
                            .bold()
                            .multilineTextAlignment(.leading)

                        Text(character.verse)
                            .font(.body)
                            .foregroundColor(.secondary)

                        HStack {
                            Text("Lvl \(character.level)")
                                .font(.headline)
                                .foregroundColor(.blue)

                            ProgressView(value: character.progress / 100)
                                .progressViewStyle(LinearProgressViewStyle(tint: .blue))
                                .frame(height: 8)
                                .frame(maxWidth: .infinity)
                        }
                    }

                    Spacer()
                }
                .padding(.bottom, 8)

                Text(character.description)
                    .font(.body)
                    .padding(.bottom, 16)

                Picker("Select Tab", selection: $selectedTab) {
                    Text("Stats").tag("Stats")
                    Text("Workout Plan").tag("Workout Plan")
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.bottom, 16)

                if selectedTab == "Stats" {
                    LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                        ForEach(character.attributes.sorted(by: >), id: \ .key) { attribute, score in
                            VStack(alignment: .leading, spacing: 8) {
                                Text(attribute)
                                    .font(.headline)

                                ZStack(alignment: .leading) {
                                    Capsule()
                                        .frame(height: 8)
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
                } else if selectedTab == "Workout Plan" {
                    VStack(alignment: .leading, spacing: 16) {
                        Text(character.workoutPlanTitle)
                            .font(.headline)
                            .padding(.bottom, 8)

                        VStack(alignment: .leading, spacing: 8) {
                            Text("Warm-Up")
                                .font(.headline)
                            Text(character.warmUp)
                                .font(.body)
                        }

                        VStack(alignment: .leading, spacing: 8) {
                            Text("Main Workout")
                                .font(.headline)
                            Text(character.mainWorkout)
                                .font(.body)
                        }

                        VStack(alignment: .leading, spacing: 8) {
                            Text("Finisher")
                                .font(.headline)
                            Text(character.finisher)
                                .font(.body)
                        }

                        // "Finished Workout" Button
                        Button(action: {
                            showWorkoutPopup()
                        }) {
                            Text("Complete Workout")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .cornerRadius(8)
                        }
                    }
                }

                Spacer()
            }
            .padding()
            .overlay(
                // Popup View
                Group {
                    if showPopup {
                        ZStack {
                            Color.black.opacity(0.8).ignoresSafeArea() // Background overlay

                            VStack(spacing: 16) {
                                ZStack {
                                    Circle()
                                        .stroke(Color.gray.opacity(0.3), lineWidth: 10)
                                        .frame(width: 120, height: 120)

                                    Circle()
                                        .trim(from: 0.0, to: CGFloat(popupProgress / 100))
                                        .stroke(Color.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                                        .rotationEffect(.degrees(-90))
                                        .animation(.easeInOut(duration: 1.0)) // Smooth animation

                                    Text("Lvl \(popupLevel)")
                                        .font(.title)
                                        .foregroundColor(.blue)
                                }
                                .frame(width: 140, height: 140)

                                Text("Completed \(character.workoutPlanTitle)")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .padding(.top, 8)
                            }
                            .padding()
                            .background(Color.black.opacity(0.9))
                            .cornerRadius(16)
                            .shadow(radius: 10)
                        }
                        .transition(.opacity)
                    }
                }
            )

        }
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarBackButtonHidden(false)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    character.isHearted.toggle()
                    if let index = characters.firstIndex(where: { $0.id == character.id }) {
                        characters[index] = character // Update the main list
                    }
                }) {
                    Image(systemName: character.isHearted ? "heart.fill" : "heart")
                        .font(.title3)
                        .foregroundColor(character.isHearted ? .red : .gray)
                        .imageScale(.medium)
                }
            }
        }
    }

    /// Show the workout popup and level up the character
    private func showWorkoutPopup() {
        // Reset popup progress and level for animation
        popupProgress = 0
        popupLevel = character.level

        withAnimation {
            showPopup = true
        }

        // Simulate progress increment and level up
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            levelUpCharacter()

            // Update popup to reflect the new level
            popupLevel = character.level

            // Increment progress animation
            withAnimation(.easeInOut(duration: 1.0)) {
                popupProgress = character.progress
            }

            // Hide popup after delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    showPopup = false
                }
            }
        }
    }

    /// Method to level up the character
    private func levelUpCharacter() {
        let progressIncrement = max(10, 100 - (character.level * 5)) // Slows down as level increases
        character.progress += Double(progressIncrement)

        // Ensure progress doesn't jump to max and resets properly
        if character.progress >= 100 {
            character.progress -= 100
            character.level += 1
        }
    }
}
