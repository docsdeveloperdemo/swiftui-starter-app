// SwiftUI Starter App
// By Ryan McCaffery (mccaffers.com)
//
// This code is licensed under Creative Commons Zero (CC0)
// You can copy, modify, distribute and perform the work, even for commercial purposes, all without asking permission.
// See LICENSE.md for more details
// ---------------------------------------

import Foundation
import CoreData

class CoreDataManager_Leaderboard: NSObject, ObservableObject, NSFetchedResultsControllerDelegate {
  
  static let shared = CoreDataManager_Leaderboard()
  
  @Published var items: [Leaderboard] = []
  
  private var controller: NSFetchedResultsController<Leaderboard>
  private let managedObjectContext = PersistenceController.shared.viewContext
  private let request = NSFetchRequest<Leaderboard>(entityName: "Leaderboard")
  
  // Single source of truth via the static shared object
  private override init() {
    
    let requestWithSort = NSFetchRequest<Leaderboard>(entityName: "Leaderboard")
    requestWithSort.sortDescriptors = [NSSortDescriptor(key: "score", ascending: false)]
    
    controller = NSFetchedResultsController(fetchRequest: requestWithSort,
                                             managedObjectContext: managedObjectContext,
                                             sectionNameKeyPath: nil,
                                             cacheName: nil)
    
    // Call the super init once teh controller has been populated
    super.init()
    
    // Set self as the delgate for changes (NSFetchedResultsControllerDelegate)
    // This allows the Observed object to update and show
    // new data in the UI
    controller.delegate = self
    
    Fetch()
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
    guard let leaderboards = controller.fetchedObjects as? [Leaderboard]
      else { return }
    items = leaderboards
  }
}
