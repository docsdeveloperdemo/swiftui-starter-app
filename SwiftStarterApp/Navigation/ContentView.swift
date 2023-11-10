//
//  ContentView.swift
//  SwiftStarterApp
//
//  Created by Ryan McCaffery on 10/11/2023.
//

import SwiftUI

struct ContentView: View {
  
  // Different column widths depending on the device type
  private var columnSize : CGFloat {
    switch DeviceUtilities.deviceType() {
    case .ipad:
      return CGFloat(300)
    default:
      return CGFloat(200)
    }
  }
  
  // Different frame padding per device
  private var framePadding : CGFloat {
    switch DeviceUtilities.deviceType() {
    case .iphone:
      return CGFloat(-20)
    default:
      return CGFloat(0)
    }
  }
    
  @Binding var selectedItem: String?
  @Binding var selectedFolder: String?
  var folders: [String : [String]]
  
  var body: some View {
    List(selection: $selectedItem) {
      if let selectedFolder = selectedFolder {
        ForEach(folders[selectedFolder, default: []], id: \.self) { item in
          NavigationLink(value: item) {
            Text(verbatim: item)
          }
        }
      }
    }
    .listStyle(.insetGrouped)
    .padding(.top, framePadding)
#if os(iOS)
    .toolbarBackground(.visible, for: .navigationBar)
    .toolbarBackground(.red, for: .navigationBar)
    .navigationBarTitleDisplayMode(.inline)
#endif
    .navigationSplitViewColumnWidth(min: columnSize, ideal: columnSize, max: columnSize)
    .navigationTitle(selectedFolder ?? "")
  }
}
