// SwiftUI Starter App
// By Ryan McCaffery (mccaffers.com)
//
// This code is licensed under Creative Commons Zero (CC0)
// You can copy, modify, distribute and perform the work, even for commercial purposes, all without asking permission.
// See LICENSE.md for more details
// ---------------------------------------

import Foundation
import CoreData

// The CoreDataLoader loads several
// Core Data entries if they do not exist
public class CoreDataLoader {
  
  public static func LoadData() {
    if CoreDataManager_Leaderboard.shared.Count() == 0 {
      BuildUsers()
      BuildLeaderboard()
    }
  }
    
  private static func BuildUsers() {
    var userObject = Users(context: PersistenceController.shared.viewContext)
    userObject.userID = UUID()
    userObject.username = "Joe"
    userObject.password = "P@ssword1"
    CoreDataManager.Commit()
    
    userObject = Users(context: PersistenceController.shared.viewContext)
    userObject.userID = UUID()
    userObject.username = "Bob"
    userObject.password = "Bob"
    CoreDataManager.Commit()
  }
  
  private static func BuildLeaderboard() {
    
    if let firstUser = CoreDataManager_Users.shared.Query(),
       let uuidValue = UUID(uuidString: firstUser.userID.uuidString) {
      let leaderboardObject = Leaderboard(context: PersistenceController.shared.viewContext)
      leaderboardObject.score = 10
      leaderboardObject.userID = uuidValue
      CoreDataManager.Commit()
    }
  }
  
}
