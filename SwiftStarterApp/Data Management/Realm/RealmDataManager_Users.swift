// SwiftUI Starter App
// By Ryan McCaffery (mccaffers.com)
//
// This code is licensed under Creative Commons Zero (CC0)
// You can copy, modify, distribute and perform the work, even for commercial purposes, all without asking permission.
// See LICENSE.md for more details
// ---------------------------------------

import Foundation
import RealmSwift

public class RealmDataManager_Users: ObservableObject {
  
  @Published
  public var items: [RealmUserObject] = []
  
  public init() {
    self.items = ReadServer()
  }
  
  public func refresh() {
    self.items = ReadServer()
  }
  
  private func ReadServer() -> [RealmUserObject] {
    if let realm = RealmManager.getRealm() {
      let realmArrayObject = realm.objects(RealmUserObject.self)
      return Array(realmArrayObject)
    } else {
      return []
    }
  }
  
  public func addNew(item: RealmUserObject) {
    if let realm = RealmManager.getRealm() {
      try! realm.write {
        realm.add(item, update: Realm.UpdatePolicy.modified)
      }
    }
  }
    
  public func DeleteAll(){
    if let realm = RealmManager.getRealm() {
      try! realm.write {
        let allUploadingObjects = realm.objects(RealmUserObject.self)
        realm.delete(allUploadingObjects)
      }
    }
    refresh()
  }
}


public class RealmUserObject : Object {
  
  @Persisted(primaryKey: true) public var id: UUID = UUID()
  
  // Objects
  @Persisted public var username : String = ""
  @Persisted public var password : String = ""

}
