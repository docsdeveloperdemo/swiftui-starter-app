// SwiftUI Starter App
// By Ryan McCaffery (mccaffers.com)
//
// This code is licensed under Creative Commons Zero (CC0)
// You can copy, modify, distribute and perform the work, even for commercial purposes, all without asking permission.
// See LICENSE.md for more details
// ---------------------------------------

import Foundation
import CoreData

class CoreDataManager_Users: NSObject, ObservableObject, NSFetchedResultsControllerDelegate {
  
  static let shared = CoreDataManager_Users()
  
  @Published var items: [Users] = []
  
  private var controller: NSFetchedResultsController<Users>
  private let managedObjectContext = PersistenceController.shared.viewContext
  private let request = NSFetchRequest<Users>(entityName: "Users")
  
  // Single source of truth via the static shared object
  private override init() {
    
    let requestWithSort = NSFetchRequest<Users>(entityName: "Users")
    requestWithSort.sortDescriptors = []
    
    controller = NSFetchedResultsController(fetchRequest: requestWithSort,
                                             managedObjectContext: managedObjectContext,
                                             sectionNameKeyPath: nil,
                                             cacheName: nil)
    
    // Call the super init once the controller has been populated
    super.init()
    
    // Set self as the delgate for changes (NSFetchedResultsControllerDelegate)
    // This allows the Observed object to update and show
    // new data in the UI
    controller.delegate = self
    
    Fetch()
  }
  
  public func GetUserByID(_ uuid: UUID? = nil) -> Users? {
    if let uuid = uuid {
      let planetPredicate = NSPredicate(
        format: "userID = %@", uuid.uuidString
      )
      let requestWithSort = NSFetchRequest<Users>(entityName: "Users")
      requestWithSort.sortDescriptors = []
      requestWithSort.predicate = planetPredicate
      return try? managedObjectContext.fetch(requestWithSort).first
    }
    return nil
//    else {
//      return try? managedObjectContext.fetch(request).first
//    }
  }
  
  public func Fetch() {
    do {
      try controller.performFetch()
      items = controller.fetchedObjects ?? []
    } catch let error as NSError {
      // TODO: handle the error
      print(error)
    }
  }

  public func Count() -> Int {
    let count = try! managedObjectContext.count(for: request)
    return count
  }
    
  public func DeleteAll() {
    let fetchRequest = request as! NSFetchRequest<NSFetchRequestResult>
    let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
    
    do {
      try controller.managedObjectContext.execute(deleteRequest)
      
    } catch _ as NSError {
      // TODO: handle the error
    }
    
    // Call fetch to refresh the items array
    Fetch()
  }
  
  func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    guard let users = controller.fetchedObjects as? [Users]
      else { return }
    items = users
  }
}


