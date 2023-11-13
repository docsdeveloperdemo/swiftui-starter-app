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
    List {
      HStack {
        Text("Leaderboard")
        Spacer()
        Text(String(leaderboardStorage.items.count))
      }
      HStack {
        Text("Users")
        Spacer()
        Text(String(usersStorage.items.count))
      }
    }
    .listStyle(.plain)
    
  }
}

struct CoreDataStatsView_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataStatsView()
    }
}
