// SwiftUI Starter App
// By Ryan McCaffery (mccaffers.com)
//
// This code is licensed under Creative Commons Zero (CC0)
// You can copy, modify, distribute and perform the work, even for commercial purposes, all without asking permission.
// See LICENSE.md for more details
// ---------------------------------------

import SwiftUI

struct CoreDataDetailView: View {
  
  var item : Leaderboard
  
    var body: some View {
      VStack(alignment: .leading){
        Text(item.userID.uuidString)
        Text(String(item.score))
      }
        .navigationTitle(item.userID.uuidString)
    }
}

struct CoreDataDetailView_Previews: PreviewProvider {
    static var previews: some View {
      CoreDataDetailView(item: Leaderboard())
        
    }
}
