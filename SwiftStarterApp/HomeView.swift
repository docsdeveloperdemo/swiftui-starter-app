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
          "Table"
      ]
  ]
  
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
      } content: {
        if let selectedFolder {
          List(selection: $selectedItem) {
            ForEach(folders[selectedFolder, default: []], id: \.self) { item in
              NavigationLink(value: item) {
                Text(verbatim: item)
              }
            }
          }
          .navigationTitle(selectedFolder)
        } else {
          Text("Choose a folder from the sidebar")
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
