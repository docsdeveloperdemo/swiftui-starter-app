// SwiftUI Starter App
// By Ryan McCaffery (mccaffers.com)
//
// This code is licensed under Creative Commons Zero (CC0)
// You can copy, modify, distribute and perform the work, even for commercial purposes, all without asking permission.
// See LICENSE.md for more details
// ---------------------------------------

import SwiftUI

struct CoreDataActionsView: View {
  
  @State var showLeaderboard = false
  @StateObject var leaderboardStorage: CoreDataManager_Leaderboard = CoreDataManager_Leaderboard.shared
  
    var body: some View {
      HStack {
        Button {
          CoreDataLoader.LoadData()
        } label: {
          Text("Load Data")
        }
        .frame(maxWidth: .infinity)
        
        Button {
          leaderboardStorage.DeleteAll()
        } label: {
          Text("Delete Data")
        }
        .frame(maxWidth: .infinity)
      }
      .padding(.top, 10)
      
      HStack {
        Button {
          showLeaderboard = true
        } label: {
          Text("View Leaderboard")
        }
        .frame(maxWidth: .infinity)
        
        Button {
          //
        } label: {
          Text("View Users")
        }
        .frame(maxWidth: .infinity)
      }
      .navigationDestination(isPresented: $showLeaderboard, destination: {
        CoreDataList()
      })
    }
}

struct CoreDataActionsView_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataActionsView()
    }
}