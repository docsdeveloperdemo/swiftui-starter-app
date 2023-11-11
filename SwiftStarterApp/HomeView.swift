// SwiftUI Starter App
// By Ryan McCaffery (mccaffers.com)
//
// This code is licensed under Creative Commons Zero (CC0)
// You can copy, modify, distribute and perform the work, even for commercial purposes, all without asking permission.
// See LICENSE.md for more details
// ---------------------------------------

import SwiftUI

struct HomeView: View {
  
  @State private var selectedFolder: String?
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
    default:
      return CGFloat(200)
    }
  }

  // Different frame padding per device
  private var framePadding : CGFloat {
    switch DeviceUtilities.deviceType() {
    case .iphone:
      return CGFloat(-20)
    default:
      return CGFloat(0)
    }
  }
  
  @State private var columnVisibility = NavigationSplitViewVisibility.all
  @State private var navigationTitle = "Swift Starter App"
  
  var body: some View {
    NavigationSplitView(columnVisibility: $columnVisibility) {
      VStack {
        List(selection: $selectedFolder) {
          ForEach(Array(folders.keys.sorted()), id: \.self) { folder in
            NavigationLink(value: folder) {
              Text(verbatim: folder)
            }
          }
        }
        Text("By Ryan (mccaffers.com)")
      }
      .toolbar {
          ToolbarItem(placement: .principal) {
              VStack {
                  Text(navigationTitle)
                      .foregroundColor(.white)
              }
          }
      }
      .padding(.top, framePadding)
#if os(iOS)
      .toolbarBackground(.visible, for: .navigationBar)
      .toolbarBackground(.red, for: .navigationBar)
      .navigationBarTitleDisplayMode(.inline)
#endif
      .navigationSplitViewColumnWidth(min: columnSize, ideal: columnSize, max: columnSize)
      .accentColor(.white)
    } content: {
      ContentView(selectedItem: $selectedItem,
                  selectedFolder: $selectedFolder,
                  folders: folders)
    } detail: {
      NavigationStack {
        switch selectedItem {
        case "Core Data":
          CoreDataHomeView()
        default:
          DetailView(selectedItem: selectedItem)
        }
      }
      
#if os(iOS)
      .toolbarBackground(.visible, for: .navigationBar)
      .toolbarBackground(.red, for: .navigationBar)
      .navigationBarTitleDisplayMode(.inline)
      
#endif
    }
    .accentColor(.white)
  }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
      HomeView()
    }
}

