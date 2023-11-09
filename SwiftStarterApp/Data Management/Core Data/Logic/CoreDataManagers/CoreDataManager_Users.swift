//
//  CoreDataManager_Users.swift
//  SwiftStarterApp
//
//  Created by Ryan McCaffery on 09/11/2023.
//

import Foundation
import CoreData

public class CoreDataManager_Users: CoreDataManager {

  // Reuse the static view context
  // Note - Make sure you always read from the static `PersistenceController.shared.container` object, not `PersistenceController().container`
  private static var viewContext : NSManagedObjectContext = PersistenceController.shared.viewContext
  
  public static func Query() -> Users? {
    let fetchRequest = NSFetchRequest<Users>(entityName: "Users")
    fetchRequest.resultType = .managedObjectResultType
    let objectToReturn = try? viewContext.fetch(fetchRequest).first
    return objectToReturn
  }
  
  public static func DeleteAll() {
    let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Users")
    let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

    do {
      try PersistenceController.shared.viewContext.persistentStoreCoordinator?.execute(deleteRequest, with: viewContext)
    } catch let error as NSError {
        // TODO: handle the error
    }
  }

}

