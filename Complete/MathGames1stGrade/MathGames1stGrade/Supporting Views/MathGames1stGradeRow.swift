/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A single row to be displayed in a list of games.
*/

import SwiftUI

struct MathGames1stGradeRow: View {
    var game: MathGames1stGrade

    var body: some View {
        HStack {
            game.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(verbatim: game.name)
            Spacer()

            if game.isFavorite {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
            }

            if game.isCompleted {
                Image(systemName: "circle.fill")
                    .imageScale(.medium)
                    .foregroundColor(.green)
            }
        }
    }
}

struct MathGames1stGradeRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MathGames1stGradeRow(game: MathGames1stGradeData[0])
            MathGames1stGradeRow(game: MathGames1stGradeData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
