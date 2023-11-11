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
              Text(item.userID.uuidString)
              Text(String(item.score))
            }
            
          }
        }
        .onDelete(perform: deleteItems)
      }
      .listStyle(.plain)
      .toolbarBackground(.visible, for: .navigationBar)
      .toolbarBackground(.red, for: .navigationBar)
      .navigationBarTitleDisplayMode(.inline)
      .navigationDestination(isPresented: $showSelectedItem) {
        if let selectedItem = selectedItem {
          CoreDataLeaderboardDetailView(item: selectedItem)
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
