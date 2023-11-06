//
//  Users+CoreDataProperties.swift
//  SwiftStarterApp
//
//  Created by Ryan McCaffery on 06/11/2023.
//
//

import Foundation
import CoreData


extension Users {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Users> {
        return NSFetchRequest<Users>(entityName: "Users")
    }

    @NSManaged public var username: String?
    @NSManaged public var password: String?
    @NSManaged public var userID: UUID?

}
