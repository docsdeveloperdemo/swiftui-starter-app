// SwiftUI Starter App
// By Ryan McCaffery (mccaffers.com)
//
// This code is licensed under Creative Commons Zero (CC0)
// You can copy, modify, distribute and perform the work, even for commercial purposes, all without asking permission.
// See LICENSE.md for more details
// ---------------------------------------

import Foundation

public class CoreDataManager {
  
  public init() {}
  
  public func addNew() {
    let test = Item(context: PersistenceController.shared.container.viewContext)
    PersistenceController.shared.container.viewContext.delete(test)
    
    let newItem = Item(context: PersistenceController.shared.container.viewContext)
    newItem.timestamp = Date()
    try! PersistenceController.shared.container.viewContext.save()
  }
  
  public func remove(_ item: Item) {
    //    let newItem = Item(context: PersistenceController.shared.container.viewContext)
    //    newItem.timestamp = Date()
    try! PersistenceController.shared.container.viewContext.delete(item)
    
    do {
        try PersistenceController.shared.container.viewContext.save()
    } catch {
        // Replace this implementation with code to handle the error appropriately.
        // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        let nsError = error as NSError
        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
    }
  }
  
  public func edit(_ item: Item) {
    
    item.timestamp = item.timestamp?.addingTimeInterval(5 * 60)
//    item.hello = "yup"
    //    let newItem = Item(context: PersistenceController.shared.container.viewContext)
    //    newItem.timestamp = Date()
    try! PersistenceController.shared.container.viewContext.save()
    
  }
  
}

