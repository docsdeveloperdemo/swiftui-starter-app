// SwiftUI Starter App
// By Ryan McCaffery (mccaffers.com)
//
// This code is licensed under Creative Commons Zero (CC0)
// You can copy, modify, distribute and perform the work, even for commercial purposes, all without asking permission.
// See LICENSE.md for more details
// ---------------------------------------

import SwiftUI
import CoreData

struct CoreDataList: View {
  
  @Environment(\.managedObjectContext) private var viewContext
  
  @FetchRequest(
    sortDescriptors: [NSSortDescriptor(keyPath: \Leaderboard.score, ascending: true)],
    animation: .default)
  private var items: FetchedResults<Leaderboard>
  
  @State private var showDetails : Bool = false
  
  var body: some View {
    NavigationStack {
      List {
        ForEach(items, id:\.userID) { item in
          Button {
            showDetails = true
          } label: {
            Text(String(item.score))
          }
        }
        .onDelete(perform: deleteItems)
      }
      .listStyle(.plain)
      .navigationDestination(isPresented:$showDetails, destination: {
        CoreDataDetailView()
      })
#if os(iOS)
      .navigationBarTitleDisplayMode(.inline)
#endif
      .toolbar {
#if os(iOS)
        ToolbarItem(placement: .navigationBarTrailing) {
          EditButton()
        }
#endif
        ToolbarItem {
          Button(action: addItem) {
            Label("Add Item", systemImage: "plus")
          }
        }
      }
    }
  }
  
  private func addItem() {
    CoreDataManager.Commit()
  }
  
  private func deleteItems(offsets: IndexSet) {
    offsets.map { items[$0] }.forEach(CoreDataManager.Remove)
  }
}

struct CoreDataList_Previews: PreviewProvider {
  static var previews: some View {
    CoreDataList()
      .environment(\.managedObjectContext, PersistenceController.shared.viewContext)
  }
}
