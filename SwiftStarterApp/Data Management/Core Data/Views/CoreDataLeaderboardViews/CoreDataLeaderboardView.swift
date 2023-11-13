// SwiftUI Starter App
// By Ryan McCaffery (mccaffers.com)
//
// This code is licensed under Creative Commons Zero (CC0)
// You can copy, modify, distribute and perform the work, even for commercial purposes, all without asking permission.
// See LICENSE.md for more details
// ---------------------------------------

import SwiftUI
import CoreData

struct CoreDataLeaderboardView: View {
  
  @Environment(\.managedObjectContext) private var viewContext

  @StateObject var leaderboardStorage: CoreDataManager_Leaderboard = CoreDataManager_Leaderboard.shared
  @StateObject var usersStorage: CoreDataManager_Users = CoreDataManager_Users.shared
  
  @State private var selectedItem: Leaderboard?
  @State private var showSelectedItem: Bool = false
  
  var body: some View {
      List {
        ForEach(leaderboardStorage.items, id:\.userID) { item in
          Button {
            selectedItem = item
            showSelectedItem = true
          } label: {
            VStack(alignment: .leading){
              Text(usersStorage.GetUserByID(item.userID)?.username ?? "")
              Text(String(item.score))
            }
            
          }
          .listRowBackground(Color("BackgroundColor"))
        }
        .onDelete(perform: deleteItems)
      }
      .listStyle(.plain)
      .scrollContentBackground(.hidden)
      .background(Color("BackgroundColor"))
      .navigationTitle("Leaderboard")
      .toolbarBackground(.visible, for: .navigationBar)
      .toolbarBackground(Color("NavigationBar"), for: .navigationBar)
      .navigationBarTitleDisplayMode(.inline)
      .navigationDestination(isPresented: $showSelectedItem) {
        if let selectedItem = selectedItem {
          // pre-load the user information
          let userObject = usersStorage.GetUserByID(selectedItem.userID)
          CoreDataLeaderboardDetailView(item: selectedItem, userObject: userObject)
        }
      }
#if os(iOS)
      .navigationBarTitleDisplayMode(.inline)
#endif
  }
  
  private func addItem() {
    CoreDataManager.Commit()
  }
  
  private func deleteItems(offsets: IndexSet) {
    offsets.map { leaderboardStorage.items[$0] }.forEach(CoreDataManager.Remove)
  }
}

struct CoreDataLeaderboardView_Previews: PreviewProvider {
  static var previews: some View {
    CoreDataLeaderboardView()
      .environment(\.managedObjectContext, PersistenceController.shared.viewContext)
  }
}
