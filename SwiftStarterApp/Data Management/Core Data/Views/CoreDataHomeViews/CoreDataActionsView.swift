//
//  CoreDataActionsView.swift
//  SwiftStarterApp
//
//  Created by Ryan McCaffery on 09/11/2023.
//

import SwiftUI

struct CoreDataActionsView: View {
  
  @State var showLeaderboard = false
  
    var body: some View {
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
      .navigationDestination(isPresented: $showLeaderboard, destination: {
        CoreDataList()
      })
    }
}

struct CoreDataActionsView_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataActionsView()
    }
}
