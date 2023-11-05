// SwiftUI Starter App
//
// Made by Ryan McCaffery
// This code is licensed under Creative Commons Zero (CC0) - See LICENSE.txt for details
// ---------------------------------------

import SwiftUI

struct SwiftUIView: View {
    
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
        if let selectedItem {
            NavigationLink(value: selectedItem) {
                Text(verbatim: selectedItem)
                    .navigationTitle(selectedItem)
            }
        } else {
            Text("Choose an item from the content")
        }
    }
  }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
