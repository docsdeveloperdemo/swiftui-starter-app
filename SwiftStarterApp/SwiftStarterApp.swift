// SwiftUI Starter App
// By Ryan McCaffery (mccaffers.com)
//
// This code is licensed under Creative Commons Zero (CC0)
// You can copy, modify, distribute and perform the work, even for commercial purposes, all without asking permission.
// See LICENSE.md for more details
// ---------------------------------------

import SwiftUI

@main
struct SwiftStarterApp: App {
  let persistenceController = PersistenceController.shared.container

    var body: some Scene {
        WindowGroup {
          HomeView()
            .environment(\.managedObjectContext, persistenceController.viewContext)
        }
    }
}