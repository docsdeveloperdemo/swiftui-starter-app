//
//  CoreDataHomeView.swift
//  SwiftStarterApp
//
//  Created by Ryan McCaffery on 06/11/2023.
//

import SwiftUI

struct CoreDataHomeView: View {

  
  
  var body: some View {
    NavigationStack {
      VStack(spacing:10) {
        Text("Stats")
          .bold()
          .frame(maxWidth: .infinity, alignment:.leading)
        
        CoreDataStatsView()
        
        Text("Options")
          .bold()
          .frame(maxWidth: .infinity, alignment:.leading)
        
        CoreDataActionsView()
        
        Spacer()
        
      }
      .padding(.horizontal, 15)
  
      .navigationTitle("Core Data")
      
    }
  }

}

struct CoreDataHomeView_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataHomeView()
    }
}
