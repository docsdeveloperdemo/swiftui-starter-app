//
//  CoreDataManager-Leaderboard.swift
//  SwiftStarterApp
//
//  Created by Ryan McCaffery on 09/11/2023.
//

import Foundation
import CoreData

public class CoreDataManager_Leaderboard: CoreDataManager {
  
  // Reuse the static view context
  // Note - Make sure you always read from the static `PersistenceController.shared.container` object, not `PersistenceController().container`
  private static var viewContext : NSManagedObjectContext = PersistenceController.shared.viewContext
  
  public static func Count() -> Int {
    let count = try! viewContext.count(for: NSFetchRequest(entityName: "Leaderboard"))
    return count
  }
  
  public static func DeleteAll() {
    let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Leaderboard")
    let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
    
    do {
      try PersistenceController.shared.viewContext.persistentStoreCoordinator?.execute(deleteRequest, with: viewContext)
    } catch let error as NSError {
      // TODO: handle the error
    }
  }
}
