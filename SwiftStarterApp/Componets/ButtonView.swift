// SwiftUI Starter App
// By Ryan McCaffery (mccaffers.com)
//
// This code is licensed under Creative Commons Zero (CC0)
// You can copy, modify, distribute and perform the work, even for commercial purposes, all without asking permission.
// See LICENSE.md for more details
// ---------------------------------------

import SwiftUI

struct ButtonView: View {
    var body: some View {
      VStack {
        Button {
          //
        } label: {
          Text("Click me")
            .frame(maxWidth: .infinity)
            .padding(.vertical, 10)
            .background(Color("ButtonColor"))
            .cornerRadius(5)
        }
        
        Spacer()

      }
      .padding(.horizontal, 15)
      .padding(.top, 10)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView()
    }
}
