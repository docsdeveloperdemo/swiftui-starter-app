// SwiftUI Starter App
// By Ryan McCaffery (mccaffers.com)
//
// This code is licensed under Creative Commons Zero (CC0)
// You can copy, modify, distribute and perform the work, even for commercial purposes, all without asking permission.
// See LICENSE.md for more details
// ---------------------------------------

import SwiftUI

struct CoreDataLeaderboardDetailView: View {
  
  var item : Leaderboard
  
  @StateObject var usersStorage: CoreDataManager_Users = CoreDataManager_Users.shared
  @State var userObject : Users?
  
  var body: some View {
    VStack(alignment: .leading){
      if let userObject = userObject {
        Text(userObject.username)
        Text(String(item.score))
      }
    }
    .navigationTitle(userObject?.username ?? "")
    .toolbarBackground(.visible, for: .navigationBar)
    .toolbarBackground(.red, for: .navigationBar)
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct CoreDataDetailView_Previews: PreviewProvider {
    static var previews: some View {
      CoreDataLeaderboardDetailView(item: Leaderboard())
        
    }
}
