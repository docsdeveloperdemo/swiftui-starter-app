//
//  ContentView.swift
//  SwiftStarterApp
//
//  Created by Ryan McCaffery on 04/11/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
  @Environment(\.managedObjectContext) private var viewContext
  
  @FetchRequest(
    sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
    animation: .default)
  private var items: FetchedResults<Item>
  
  var body: some View {
    NavigationView {
      List {
        ForEach(items) { item in
          if item.timestamp != nil {
            NavigationLink {
              
              Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                .onAppear {
                  
                  CoreDataManager().edit(item)
                }
              
            } label: {
              Text(item.timestamp!, formatter: itemFormatter)
            }
          }
        }
        .onDelete(perform: deleteItems)
      }
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
      CoreDataManager().addNew()
    }
  }
  
  private func deleteItems(offsets: IndexSet) {
    withAnimation {
      offsets.map { items[$0] }.forEach(CoreDataManager().remove)
    }
  }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
