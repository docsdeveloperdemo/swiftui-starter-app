// SwiftUI Starter App
// By Ryan McCaffery (mccaffers.com)
//
// This code is licensed under Creative Commons Zero (CC0)
// You can copy, modify, distribute and perform the work, even for commercial purposes, all without asking permission.
// See LICENSE.md for more details
// ---------------------------------------

import Foundation
import CoreData


extension Leaderboard {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Leaderboard> {
        return NSFetchRequest<Leaderboard>(entityName: "Leaderboard")
    }

    @NSManaged public var userID: UUID
    @NSManaged public var score: Int64

}
