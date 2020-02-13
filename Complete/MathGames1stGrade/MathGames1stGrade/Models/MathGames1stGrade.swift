/*
See LICENSE folder for this sample’s licensing information.

Abstract:
The model for an individual game.
*/

import SwiftUI
import CoreLocation

struct MathGames1stGrade: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    fileprivate var imageName: String
    var copyright: String
    var rules: String
    var skill: String
    var category: Category
    var isFavorite: Bool
    var isCompleted: Bool

    enum Category: String, CaseIterable, Codable, Hashable {
        case completed = "Completed"
        case cards = "Cards"
        case dice = "Dice"
    }
}

extension MathGames1stGrade {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

