// SwiftUI Starter App
// By Ryan McCaffery (mccaffers.com)
//
// This code is licensed under Creative Commons Zero (CC0)
// You can copy, modify, distribute and perform the work, even for commercial purposes, all without asking permission.
// See LICENSE.md for more details
// ---------------------------------------

import SwiftUI

struct CoreDataStatsView: View {
  
  @StateObject var leaderboardStorage: CoreDataManager_Leaderboard = CoreDataManager_Leaderboard.shared
  @StateObject var usersStorage: CoreDataManager_Users = CoreDataManager_Users.shared
  
  var body: some View {
    HStack {
      HStack {
        VStack(spacing:20) {
          Text("Leaderboard Count")
          Text(String(leaderboardStorage.items.count))
        }
      }.frame(maxWidth: .infinity)
      
      HStack {
        VStack(spacing:20) {
          Text("Users Count")
          Text(String(usersStorage.items.count))
        }
      }.frame(maxWidth: .infinity)
    }.padding(.horizontal, 15)
  }
}

struct CoreDataStatsView_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataStatsView()
    }
}
