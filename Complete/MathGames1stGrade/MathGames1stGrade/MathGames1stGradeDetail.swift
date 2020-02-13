/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing the details for a game.
*/

import SwiftUI

struct MathGames1stGradeDetail: View {
    @EnvironmentObject var userData: UserData
    var game: MathGames1stGrade
    
    var MathGames1stGradeIndex: Int {
        userData.games.firstIndex(where: { $0.id == game.id })!
    }
    
    var body: some View {
        VStack {
            
            CircleImage(image: game.image)
                .offset(x: 0, y: -70)
                .padding(.bottom, -100)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(verbatim: game.name)
                        .font(.title)
                    
                    Button(action: {
                        self.userData.games[self.MathGames1stGradeIndex]
                            .isFavorite.toggle()
                    }) {
                        if self.userData.games[self.MathGames1stGradeIndex]
                            .isFavorite {
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.yellow)
                        } else {
                            Image(systemName: "star")
                                .foregroundColor(Color.gray)
                        }
                    }
                    
                    Button(action: {
                        self.userData.games[self.MathGames1stGradeIndex]
                            .isCompleted.toggle()
                    }) {
                        if self.userData.games[self.MathGames1stGradeIndex]
                            .isCompleted {
                            Image(systemName: "circle.fill")
                                .foregroundColor(Color.green)
                        } else {
                            Image(systemName: "circle")
                                .foregroundColor(Color.gray)
                        }
                    }
                }
                HStack(alignment: .top) {
                    Text(verbatim: game.skill)
                        .font(.subheadline)
                }
                HStack(alignment: .top) {
                    Text(verbatim: game.rules)
                        .font(.subheadline)
                    .padding()
                }
                Spacer()
                HStack(alignment: .top) {
                    Text(verbatim: game.copyright)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                        .padding(.leading)
                }
            }
            .padding()
            
            Spacer()
        }
    }
}

struct MathGames1stGradeDetail_Preview: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return MathGames1stGradeDetail(game: userData.games[0])
            .environmentObject(userData)
    }
}
