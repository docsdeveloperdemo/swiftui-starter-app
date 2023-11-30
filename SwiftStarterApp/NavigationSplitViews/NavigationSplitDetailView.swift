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
      switch selectedItem {
      case "Core Data":
        CoreDataHomeView()
        
      case "Progress View":
        LoadingView()
        
      case "Buttons":
        ButtonView()
        
      case "Gauge":
        GaugeView()
        
      default:
        VStack {
          Text(verbatim: "To be developed")
            .navigationTitle(selectedItem)
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
