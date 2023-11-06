//
//  Leaderboard+CoreDataProperties.swift
//  SwiftStarterApp
//
//  Created by Ryan McCaffery on 06/11/2023.
//
//

import Foundation
import CoreData


extension Leaderboard {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Leaderboard> {
        return NSFetchRequest<Leaderboard>(entityName: "Leaderboard")
    }

    @NSManaged public var userID: UUID
    @NSManaged public var score: Int64

}
