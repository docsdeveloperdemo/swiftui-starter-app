//
//  SwiftStarterAppApp.swift
//  SwiftStarterApp
//
//  Created by Ryan McCaffery on 04/11/2023.
//

import SwiftUI

@main
struct SwiftStarterAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
          SwiftUIView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
