// SwiftUI Starter App
// By Ryan McCaffery (mccaffers.com)
//
// This code is licensed under Creative Commons Zero (CC0)
// You can copy, modify, distribute and perform the work, even for commercial purposes, all without asking permission.
// See LICENSE.md for more details
// ---------------------------------------

import SwiftUI

struct LoadingView: View {
    var body: some View {
      VStack(spacing:20) {
        VStack(spacing:10) {
          Text("Circular")
          ProgressView(value: 80, total: 100)
              .progressViewStyle(.circular)
        }
        Divider()
        VStack(spacing:10) {
          Text("Bar")
          ProgressView(value: 60, total: 100)
        }
        Divider()
        VStack(spacing:10) {
          Text("Bar with text")
          ProgressView(value: 0.75) { Text("75% progress") }
        }
        
        Spacer()
      }
      .padding(.horizontal, 20)
      .padding(.top, 10)
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView()
    }
}
