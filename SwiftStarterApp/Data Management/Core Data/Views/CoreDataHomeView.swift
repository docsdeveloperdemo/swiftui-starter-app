//
//  CoreDataHomeView.swift
//  SwiftStarterApp
//
//  Created by Ryan McCaffery on 06/11/2023.
//

import SwiftUI

struct CoreDataHomeView: View {
  @State var loading = true
  @State var showLeaderboard = false
  
  var body: some View {
    NavigationStack {
      VStack(spacing:20) {
        HStack {
          Button {
            CoreDataLoader.LoadData()
          } label: {
            Text("Load Data")
          }
          .frame(maxWidth: .infinity)
          
          Button {
            //
          } label: {
            Text("Delete Data")
          }
          .frame(maxWidth: .infinity)
        }
        .padding(.top, 10)
        
        HStack {
          Button {
            showLeaderboard = true
          } label: {
            Text("View Leaderboard")
          }
          .frame(maxWidth: .infinity)
          
          Button {
            //
          } label: {
            Text("View Users")
          }
          .frame(maxWidth: .infinity)
        }
        Spacer()
        
      }
      .navigationDestination(isPresented: $showLeaderboard, destination: {
        CoreDataList()
      })
      .navigationTitle("Core Data")
      
    }
  }

}

struct CoreDataHomeView_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataHomeView()
    }
}
