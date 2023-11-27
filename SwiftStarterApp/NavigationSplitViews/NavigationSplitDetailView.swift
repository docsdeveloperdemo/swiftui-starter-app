// SwiftUI Starter App
// By Ryan McCaffery (mccaffers.com)
//
// This code is licensed under Creative Commons Zero (CC0)
// You can copy, modify, distribute and perform the work, even for commercial purposes, all without asking permission.
// See LICENSE.md for more details
// ---------------------------------------

import SwiftUI

struct NavigationSplitDetailView: View {
  var selectedItem : String?
  
    var body: some View {
      if let selectedItem {
        if selectedItem == "Core Data" {
          CoreDataHomeView()
    
        } else if selectedItem == "Progress View" {
          LoadingView()
    
        } else {
        NavigationLink(value: selectedItem) {
        
            Text(verbatim: selectedItem)
              .navigationTitle(selectedItem)
              .background(.red)
          }
        }
      } else {
        Text("Choose an item from the content")
      }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
      NavigationSplitDetailView()
    }
}
