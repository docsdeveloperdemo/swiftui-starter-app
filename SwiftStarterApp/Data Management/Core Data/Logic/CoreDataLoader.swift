//
//  CoreDataLoader.swift
//  SwiftStarterApp
//
//  Created by Ryan McCaffery on 06/11/2023.
//

import Foundation
import CoreData

// The CoreDataLoader loads a range of
// entities into CoreData
public class CoreDataLoader {
  
  public static func LoadData() {
    if CoreDataManager.Count() == 0 {
      BuildUsers()
      BuildLeaderboard()
    }
  }
  
  private static func BuildLeaderboard() {
    let leaderboardObject = Leaderboard(context: PersistenceController.shared.container.viewContext)
    leaderboardObject.score = 10
    leaderboardObject.userID = UUID()
    CoreDataManager.Commit()
  }
  
  
  private static func BuildUsers() {
    let userObject = Users(context: PersistenceController.shared.container.viewContext)
    userObject.userID = UUID()
    userObject.username = "Joe"
    userObject.password = "P@ssword1"
    CoreDataManager.Commit()
  }
  
  
}
