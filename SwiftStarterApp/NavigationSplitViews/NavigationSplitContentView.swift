// SwiftUI Starter App
// By Ryan McCaffery (mccaffers.com)
//
// This code is licensed under Creative Commons Zero (CC0)
// You can copy, modify, distribute and perform the work, even for commercial purposes, all without asking permission.
// See LICENSE.md for more details
// ---------------------------------------

import SwiftUI

struct NavigationSplitContentView: View {
  
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
  
  @Binding var route : NavigationSplitRoute?
  @Binding var selectedItem: String?

  var body: some View {
    List(selection: $selectedItem) {
      if let route = route {
        ForEach(route.array, id: \.self) { item in
          NavigationLink(value: item) {
            Text(verbatim: item)
          }
        }
      }
      
    }
    .navigationTitle(route?.title ?? "")
#if os(iOS)
    .listStyle(.insetGrouped)
#endif
    .padding(.top, framePadding)
#if os(iOS)
    .toolbarBackground(.visible, for: .navigationBar)
    .toolbarBackground(Color("NavigationBar"), for: .navigationBar)
    .navigationBarTitleDisplayMode(.inline)
#endif
    .navigationSplitViewColumnWidth(min: columnSize, ideal: columnSize, max: columnSize)
    
  }
}
