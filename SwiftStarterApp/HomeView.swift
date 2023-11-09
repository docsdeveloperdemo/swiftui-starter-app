// SwiftUI Starter App
// By Ryan McCaffery (mccaffers.com)
//
// This code is licensed under Creative Commons Zero (CC0)
// You can copy, modify, distribute and perform the work, even for commercial purposes, all without asking permission.
// See LICENSE.md for more details
// ---------------------------------------

import SwiftUI

struct HomeView: View {
    
  @State private var selectedFolder: String? = "Data Management"
  @State private var selectedItem: String?
  
  @State private var folders = [
      "Data Management": [
          "Core Data",
          "Realm"
      ],
      "Components": [
      
      ]
  ]
  
  // Different column widths depending on the device type
  private var columnSize : CGFloat {
    switch DeviceUtilities.deviceType() {
    case .ipad:
      return CGFloat(300)
      
    case .iphone:
      return CGFloat(200)
      
    case .mac:
      return CGFloat(200)
      
    default:
      return CGFloat(200)
    }
  }
  
  var body: some View {
      NavigationSplitView {
        List(selection: $selectedFolder) {
          ForEach(Array(folders.keys.sorted()), id: \.self) { folder in
            NavigationLink(value: folder) {
              Text(verbatim: folder)
            }
          }
        }
        .navigationTitle("Swift Starter App")
        .navigationBarTitleDisplayMode(.inline)
        .navigationSplitViewColumnWidth(min: columnSize, ideal: columnSize, max: columnSize)
      } content: {
        if let selectedFolder {
          List(selection: $selectedItem) {
            ForEach(folders[selectedFolder, default: []], id: \.self) { item in
              NavigationLink(value: item) {
                Text(verbatim: item)
              }
            }
          }
          .navigationSplitViewColumnWidth(min: columnSize, ideal: columnSize, max: columnSize)
          .navigationTitle(selectedFolder)
#if os(iOS)
          .navigationBarTitleDisplayMode(.inline)
#endif
        }
      } detail: {
        DetailView(selectedItem: selectedItem)
      }
    
  }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
      HomeView()
    }
}
