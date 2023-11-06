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
      CoreDataLoader.LoadData()
      loading = false
    }
    
  }

}

struct CoreDataHomeView_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataHomeView()
    }
}
