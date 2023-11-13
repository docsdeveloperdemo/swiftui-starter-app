// SwiftUI Starter App
// By Ryan McCaffery (mccaffers.com)
//
// This code is licensed under Creative Commons Zero (CC0)
// You can copy, modify, distribute and perform the work, even for commercial purposes, all without asking permission.
// See LICENSE.md for more details
// ---------------------------------------

import SwiftUI

struct NavigationSplitRoute : Hashable {
  var title : String
  var array : [String]
}

struct NavigationSplitHomeView: View {
  
  @State private var selectedFolder: [String]?
  @State private var route : NavigationSplitRoute?
  @State private var selectedItem: String?
  
  @State private var columnVisibility = NavigationSplitViewVisibility.all
  
  var body: some View {
    NavigationSplitView(columnVisibility: $columnVisibility) {
      NavigationSplitSideBarView(selectedItem: $selectedItem,
                                 route: $route)
    } content: {
      NavigationSplitContentView(route: $route, selectedItem: $selectedItem)
    } detail: {
      NavigationStack {
        NavigationSplitDetailView(selectedItem: selectedItem)
        }
#if os(iOS)
      .toolbarBackground(.visible, for: .navigationBar)
      .toolbarBackground(Color("NavigationBar"), for: .navigationBar)
      .navigationBarTitleDisplayMode(.inline)
#endif
    }
    .accentColor(.black)
  }
}
  
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
      NavigationSplitHomeView()
    }
}

