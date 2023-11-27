// SwiftUI Starter App
// By Ryan McCaffery (mccaffers.com)
//
// This code is licensed under Creative Commons Zero (CC0)
// You can copy, modify, distribute and perform the work, even for commercial purposes, all without asking permission.
// See LICENSE.md for more details
// ---------------------------------------

import SwiftUI

struct GaugeView: View {
    var body: some View {
      VStack(spacing:10) {
        Text("Gauge")
        Gauge(value: 0.75) {
        } .gaugeStyle(.accessoryCircular)
      }
    }
}

struct Gauge_Previews: PreviewProvider {
    static var previews: some View {
      GaugeView()
    }
}
