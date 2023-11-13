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
  @StateObject var usersStorage: CoreDataManager_Users = CoreDataManager_Users.shared
  
    var body: some View {
      
      VStack(spacing:10) {
        HStack(spacing:20) {
          Button {
            CoreDataLoader.LoadData()
          } label: {
            Text("Load Data")
              .frame(maxWidth: .infinity)
              .frame(height: 40)
              .background(Color("ButtonColor"))
              .foregroundColor(.white)
              .cornerRadius(10)
          }
          .frame(maxWidth: .infinity)
          
          Button {
            leaderboardStorage.DeleteAll()
            usersStorage.DeleteAll()
          } label: {
            Text("Delete Data")
              .frame(maxWidth: .infinity)
              .frame(height: 40)
              .background(Color("ButtonColor"))
              .foregroundColor(.white)
              .cornerRadius(10)
          }
          .frame(maxWidth: .infinity)
        }
        
        HStack(spacing:20) {
          Button {
            showLeaderboard = true
          } label: {
            Text("View Leaderboard")
              .frame(maxWidth: .infinity)
              .frame(height: 40)
              .background(Color("ButtonColor"))
              .foregroundColor(.white)
              .cornerRadius(10)
          }
          .frame(maxWidth: .infinity)
          
          Button {
            //
          } label: {
            Text("View Users")
              .frame(maxWidth: .infinity)
              .frame(height: 40)
              .background(Color("ButtonColor"))
              .foregroundColor(.white)
              .cornerRadius(10)
          }
          .frame(maxWidth: .infinity)
        }
      }
      .navigationDestination(isPresented: $showLeaderboard, destination: {
        CoreDataLeaderboardView()
      })
    }
}

struct CoreDataActionsView_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataActionsView()
    }
}
