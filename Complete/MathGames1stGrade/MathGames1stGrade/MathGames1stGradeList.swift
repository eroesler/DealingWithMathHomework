/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing a list of games.
*/

import SwiftUI

struct MathGames1stGradeList: View {
    @EnvironmentObject private var userData: UserData
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("Show Favorites Only")
                }
                Toggle(isOn: $userData.showCompletedOnly) {
                    Text("Show Completed Only")
                }
                
                ForEach(userData.games) { game in
                    if !self.userData.showFavoritesOnly || game.isFavorite || game.isCompleted {
                        NavigationLink(
                            destination: MathGames1stGradeDetail(game: game)
                                .environmentObject(self.userData)
                        ) {
                            MathGames1stGradeRow(game: game)
                        }
                    }
                    /*if !self.userData.showCompletedOnly || game.isCompleted {
                        NavigationLink(
                            destination: MathGames1stGradeDetail(game: game)
                                .environmentObject(self.userData)
                        ) {
                            MathGames1stGradeRow(game: game)
                        }
                    }*/
                }
                
                /*ForEach(userData.games) { game in
                    if !self.userData.showCompletedOnly || game.isCompleted {
                        NavigationLink(
                            destination: MathGames1stGradeDetail(game: game)
                                .environmentObject(self.userData)
                        ) {
                            MathGames1stGradeRow(game: game)
                        }
                    }
                }*/
            }
            .navigationBarTitle(Text("Math Games 1st Grade"))
        }
    }
}

struct MathGames1stGradeList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            MathGames1stGradeList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
        .environmentObject(UserData())
    }
}
