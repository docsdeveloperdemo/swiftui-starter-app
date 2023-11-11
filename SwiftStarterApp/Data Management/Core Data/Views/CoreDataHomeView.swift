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
      Text("Stats")
        .frame(maxWidth: .infinity, alignment:.leading)
      
      CoreDataStatsView()
      
      Divider()
      
      Text("Options")
        .frame(maxWidth: .infinity, alignment:.leading)
      
      CoreDataActionsView()
      
      Spacer()
      
    }
    .padding(.top, 10)
    .padding(.horizontal, 15)
    .toolbarBackground(.visible, for: .navigationBar)
    .toolbarBackground(.red, for: .navigationBar)
    .navigationBarTitleDisplayMode(.inline)
    .toolbar {
        ToolbarItem(placement: .principal) {
            VStack {
                Text("Core Data")
                    .foregroundColor(.white)
            }
        }
    }
  }
  
}

struct CoreDataHomeView_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataHomeView()
    }
}
