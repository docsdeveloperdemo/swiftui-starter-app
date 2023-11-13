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
    
    VStack(spacing:20) {
      
      Text("Set of examples using Core Data storage and observing the updates in the SwfitUI")
        .frame(maxWidth: .infinity)

      Text("Core Data Entities")
        .font(.system(size: 20))
        .bold()
        .frame(maxWidth: .infinity, alignment:.leading)
      
      CoreDataStatsView()
      
      Text("Options")
        .bold()
        .frame(maxWidth: .infinity, alignment:.leading)
      
      CoreDataActionsView()
        
      
      Spacer()
    }
    .padding(.horizontal, 20)
    .padding(.top, 10)
    .background(Color("BackgroundColor"))
  }
}

struct CoreDataHomeView_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataHomeView()
    }
}
