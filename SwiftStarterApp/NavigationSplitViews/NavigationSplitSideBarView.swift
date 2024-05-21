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
      "Local Documents",
      "iCloud"
    ]
  ]
  
  @State private var dataFolders2 = [
    "Components": [
      "Progress View",
      "Buttons",
      "Gauge"
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
        //add some stuff here
        Section("Data and Storage") {
          ForEach(Array(dataFolders.keys.sorted()), id: \.self) { folder in
            NavigationLink(value: NavigationSplitRoute(title: folder,
                                                       array: dataFolders[folder] ?? [])) {
              Text(verbatim: folder)
            }
          }
        }
        .accentColor(Color("ListArrowColor"))
        .padding(.top, 5)
        
        Section("Views") {
          ForEach(Array(dataFolders2.keys.sorted()), id: \.self) { folder in
            NavigationLink(value: NavigationSplitRoute(title: folder,
                                                       array: dataFolders2[folder] ?? [])) {
              Text(verbatim: folder)
            }
          }
        }
        .accentColor(Color("ListArrowColor"))
      }
      Text("By Ryan (mccaffers.com)")
    }
    .navigationTitle("SwiftUI Starter App")
#if os(iOS)
    .toolbarBackground(.visible, for: .navigationBar)
    .toolbarBackground(Color("NavigationBar"), for: .navigationBar)
    .navigationBarTitleDisplayMode(.large)
#endif
    .navigationSplitViewColumnWidth(min: columnSize, ideal: columnSize, max: columnSize)
  }
}
