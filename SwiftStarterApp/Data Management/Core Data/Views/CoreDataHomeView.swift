// SwiftUI Starter App
// By Ryan McCaffery (mccaffers.com)
//
// This code is licensed under Creative Commons Zero (CC0)
// You can copy, modify, distribute and perform the work, even for commercial purposes, all without asking permission.
// See LICENSE.md for more details
// ---------------------------------------

import SwiftUI

struct CoreDataHomeView: View {
  
  var body: some View {
    
    VStack(spacing:0) {
      Text("Entries")
        .bold()
        .frame(maxWidth: .infinity, alignment:.leading)
        .padding(.horizontal, 20)
      
      // List View nested within the VStack
      CoreDataStatsView()
        .frame(maxHeight: 100) // without setting a maxHeight the list view will expand to fill the page
      
      Text("Options")
        .bold()
        .frame(maxWidth: .infinity, alignment:.leading)
        .padding(.horizontal, 20)
        .padding(.bottom, 10)
      
      CoreDataActionsView()
        .padding(.horizontal, 20)
      
      Spacer()
    }
    .padding(.top, 10)
  }
}

struct CoreDataHomeView_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataHomeView()
    }
}
