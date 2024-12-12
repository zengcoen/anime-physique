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
            verse: "Attack on Titan"
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
            verse: "One Piece"
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
            verse: "Dragon Ball Z"
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
            verse: "Baki"
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
            verse: "Baki"
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
            verse: "Baki"
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
            verse: "Baki"
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
            verse: "Baki"
        )
    ]
}
