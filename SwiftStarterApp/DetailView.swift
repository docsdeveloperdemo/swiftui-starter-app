//
//  DetailView.swift
//  SwiftStarterApp
//
//  Created by Ryan McCaffery on 06/11/2023.
//

import SwiftUI

struct DetailView: View {
  var selectedItem : String?
  
    var body: some View {
      if let selectedItem {
        if selectedItem == "Core Data" {
          CoreDataList()
        }  else {
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
        DetailView()
    }
}
