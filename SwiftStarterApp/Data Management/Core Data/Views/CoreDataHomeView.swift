//
//  CoreDataHomeView.swift
//  SwiftStarterApp
//
//  Created by Ryan McCaffery on 06/11/2023.
//

import SwiftUI

struct CoreDataHomeView: View {
  @State var loading = true
  
  var body: some View {
    VStack {
      if loading {
        ProgressView()
      } else {
        CoreDataList()
      }
    }
    .onAppear {
      checkAndLoadData()
    }
    
  }
  
  private func checkAndLoadData() {
    if CoreDataManager.Count() == 0 {
      loadDataIntoCoreData()
    } else {
      loading = false
    }
  }
  
  private func loadDataIntoCoreData() {
    var item = Leaderboard(context: PersistenceController.shared.container.viewContext)
    item.score = 10
    item.userID = UUID()
    CoreDataManager.Commit()
    loading = false
  }
}

struct CoreDataHomeView_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataHomeView()
    }
}
