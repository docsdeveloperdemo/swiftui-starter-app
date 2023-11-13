// SwiftUI Starter App
// By Ryan McCaffery (mccaffers.com)
//
// This code is licensed under Creative Commons Zero (CC0)
// You can copy, modify, distribute and perform the work, even for commercial purposes, all without asking permission.
// See LICENSE.md for more details
// ---------------------------------------

import SwiftUI

struct NavigationSplitSideBarView: View {

  @Binding var selectedItem: String?
  @Binding var route : NavigationSplitRoute?
  
  @State private var dataFolders = [
    "Databases": [
      "Core Data",
      "Realm"
    ],
    "File Storage": [
      
    ]
  ]
  
  @State private var dataFolders2 = [
    "Components": [
      "ProgressView"
    ]
  ]
  
  // Different column widths depending on the device type
  private var columnSize : CGFloat {
    switch DeviceUtilities.deviceType() {
    case .ipad:
      return CGFloat(300)
    default:
      return CGFloat(200)
    }
  }
  
  var body: some View {
    VStack {
      List(selection: $route) {
        Section("Data and Storage") {
          ForEach(Array(dataFolders.keys.sorted()), id: \.self) { folder in
            NavigationLink(value: NavigationSplitRoute(title: folder,
                                                       array: dataFolders[folder] ?? [])) {
              Text(verbatim: folder)
            }
          }
        }
        
        Section("Views") {
          ForEach(Array(dataFolders2.keys.sorted()), id: \.self) { folder in
            NavigationLink(value: NavigationSplitRoute(title: folder,
                                                       array: dataFolders2[folder] ?? [])) {
              Text(verbatim: folder)
            }
          }
        }
      }

      .scrollContentBackground(.hidden)
      Text("by Ryan (mccaffers.com)")
    }
    .navigationTitle("SwiftUI Starter App")
    .background(Color("BackgroundColor"))
#if os(iOS)
    .toolbarBackground(.visible, for: .navigationBar)
    .toolbarBackground(Color("NavigationBar"), for: .navigationBar)
    .navigationBarTitleDisplayMode(.large)
#endif
    .navigationSplitViewColumnWidth(min: columnSize, ideal: columnSize, max: columnSize)
  }
}
