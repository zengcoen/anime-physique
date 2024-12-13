//
//  CharacterData.swift
//  first-app-test
//
//  Created by Coen Zeng on 2024-12-12.
//

import SwiftUI

struct Character: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let description: String
    let attributes: [String: Int]
    let verse: String

    var workoutPlanTitle: String
    var warmUp: String
    var mainWorkout: String
    var finisher: String

    var isHearted: Bool = false // New property to track if the character is hearted
    var level: Int = 1
    var progress: Double = 0
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
            verse: "Jujutsu Kaisen",
            workoutPlanTitle: "The Sorcerer Slayer Routine",
            warmUp: """
            - High knees (1 min)
            - Shadow boxing (1 min)
            - Jump squats (30 sec)
            - Dynamic stretches (1 min)
            """,
            mainWorkout: """
            1. Box Jumps: 3 sets of 10 reps
            2. Weighted Lunges: 3 sets of 12 reps per leg
            3. Russian Twists: 3 sets of 15 reps per side
            4. Push-Up Variations: 3 sets of 12 reps (regular, diamond, explosive)
            5. Sprints: 4 rounds of 30 seconds full speed, 30 seconds rest
            """,
            finisher: """
            1. Plank-to-Side-Knee Drive: 3 sets of 10 per side
            2. Burpee to Broad Jump: 3 sets of 8 reps
            """
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
            verse: "One Punch Man",
            workoutPlanTitle: "The Hero Hunter Routine",
            warmUp: """
            - Jumping jacks (1 min)
            - Dynamic punches (1 min)
            - Arm circles (30 sec)
            - Bodyweight squats (1 min)
            """,
            mainWorkout: """
            1. Shadow Boxing: 3 sets of 2 minutes each
            2. Plyometric Push-Ups: 3 sets of 12 reps
            3. Jump Squats: 3 sets of 15 reps
            4. Lateral Lunges: 3 sets of 10 reps per leg
            5. Interval Sprints: 5 rounds of 20 seconds full speed, 40 seconds jog
            """,
            finisher: """
            1. Plank Holds: 3 sets of 1 minute
            2. Dynamic Stretching Cooldown: 5 minutes
            """
        ),
        Character(
            name: "Levi Ackerman",
            image: "levi",
            description: "A master of combat with unparalleled agility and precision.",
            attributes: [
                "Strength": 88,
                "Speed": 96,
                "Endurance": 89,
                "Flexibility": 92,
                "Combat Technique": 99,
                "Durability": 85
            ],
            verse: "Attack on Titan",
            workoutPlanTitle: "The Blade Master’s Routine",
            warmUp: """
            - Jump rope (1 min)
            - Light jogging (2 min)
            - Dynamic stretches (2 min)
            """,
            mainWorkout: """
            1. Pull-Ups: 3 sets of 10 reps
            2. Side Plank Rotations: 3 sets of 12 reps per side
            3. Agility Ladder Drills: 3 rounds
            4. Split Squats: 3 sets of 10 reps per leg
            5. Endurance Run: 10 minutes at a steady pace
            """,
            finisher: """
            1. Stretching: Focus on legs and shoulders (5 min)
            2. Controlled Breathing: Relaxation phase (2 min)
            """
        ),
        Character(
            name: "Roronoa Zoro",
            image: "roronoa",
            description: "A swordsman with relentless determination and immense power.",
            attributes: [
                "Strength": 95,
                "Speed": 85,
                "Endurance": 94,
                "Flexibility": 75,
                "Combat Technique": 90,
                "Durability": 92
            ],
            verse: "One Piece",
            workoutPlanTitle: "",
            warmUp: "",
            mainWorkout: "",
            finisher: ""
        ),
        Character(
            name: "Goku",
            image: "goku",
            description: "A Saiyan warrior who thrives in battle and pushes beyond limits.",
            attributes: [
                "Strength": 100,
                "Speed": 100,
                "Endurance": 95,
                "Flexibility": 90,
                "Combat Technique": 85,
                "Durability": 95
            ],
            verse: "Dragon Ball Z",
            workoutPlanTitle: "",
            warmUp: "",
            mainWorkout: "",
            finisher: ""
        ),
        Character(
            name: "Yujiro Hanma",
            image: "yujiro",
            description: "The strongest creature on Earth with unparalleled combat prowess.",
            attributes: [
                "Strength": 99,
                "Speed": 93,
                "Endurance": 96,
                "Flexibility": 80,
                "Combat Technique": 98,
                "Durability": 95
            ],
            verse: "Baki",
            workoutPlanTitle: "",
            warmUp: "",
            mainWorkout: "",
            finisher: ""
        ),
        Character(
            name: "Baki Hanma",
            image: "baki",
            description: "A young warrior seeking to surpass his legendary father.",
            attributes: [
                "Strength": 90,
                "Speed": 88,
                "Endurance": 89,
                "Flexibility": 85,
                "Combat Technique": 92,
                "Durability": 87
            ],
            verse: "Baki",
            workoutPlanTitle: "",
            warmUp: "",
            mainWorkout: "",
            finisher: ""
        ),
        Character(
            name: "Retsu Kaioh",
            image: "retsu",
            description: "A Chinese martial arts master with a fierce dedication to combat.",
            attributes: [
                "Strength": 86,
                "Speed": 85,
                "Endurance": 84,
                "Flexibility": 88,
                "Combat Technique": 93,
                "Durability": 83
            ],
            verse: "Baki",
            workoutPlanTitle: "",
            warmUp: "",
            mainWorkout: "",
            finisher: ""
        ),
        Character(
            name: "Jack Hanma",
            image: "jack",
            description: "A relentless fighter with a brutal and unstoppable fighting style.",
            attributes: [
                "Strength": 94,
                "Speed": 75,
                "Endurance": 91,
                "Flexibility": 70,
                "Combat Technique": 85,
                "Durability": 92
            ],
            verse: "Baki",
            workoutPlanTitle: "",
            warmUp: "",
            mainWorkout: "",
            finisher: ""
        ),
        Character(
            name: "Doppo Orochi",
            image: "doppo",
            description: "A karate master with unmatched discipline and ferocity.",
            attributes: [
                "Strength": 87,
                "Speed": 80,
                "Endurance": 86,
                "Flexibility": 75,
                "Combat Technique": 94,
                "Durability": 85
            ],
            verse: "Baki",
            workoutPlanTitle: "",
            warmUp: "",
            mainWorkout: "",
            finisher: ""
        )
    ]
}
