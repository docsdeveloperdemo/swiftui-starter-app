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
    sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
    animation: .default)
  private var items: FetchedResults<Item>
  
  @State private var showDetails : Bool = false
  
  var body: some View {
    NavigationStack {
      List {
        ForEach(items) { item in
          if item.timestamp != nil {
            Button {
              showDetails = true
            } label: {
              Text(item.timestamp!, formatter: itemFormatter)
            }
          }
        }
        .onDelete(perform: deleteItems)
      }
      .listStyle(.plain)
      .navigationBarTitleDisplayMode(.inline)
      .navigationDestination(isPresented:$showDetails, destination: {
        CoreDataDetailView()
      })
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
      Text("Select an item")
    }
    
  }
  
  
  private func addItem() {
    withAnimation {
      CoreDataManager.AddNew()
    }
  }
  
  private func deleteItems(offsets: IndexSet) {
    withAnimation {
      offsets.map { items[$0] }.forEach(CoreDataManager.Remove)
    }
  }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct CoreDataList_Previews: PreviewProvider {
    static var previews: some View {
      CoreDataList().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
