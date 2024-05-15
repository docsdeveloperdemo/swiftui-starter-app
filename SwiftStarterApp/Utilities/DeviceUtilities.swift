// SwiftUI Starter App
// By Ryan McCaffery (mccaffers.com)
//
// This code is licensed under Creative Commons Zero (CC0)
// You can copy, modify, distribute and perform the work, even for commercial purposes, all without asking permission.
// See LICENSE.md for more details
// ---------------------------------------

import Foundation

enum DeviceType : String {
    case ipad
    case iphone
    case mac
  //other stuff
}

class DeviceUtilities {
  //utilities
  public static func deviceType() -> DeviceType {
#if os(iOS)
    if UIDevice.isIPad {
      return DeviceType.ipad
    } else if UIDevice.isIPhone {
      return DeviceType.iphone
    }
#endif
    return DeviceType.mac
  }
  
}

#if os(iOS)
import UIKit
extension UIDevice {
    
  static var isIPad: Bool {
      UIDevice.current.userInterfaceIdiom == .pad
  }

  static var isIPhone: Bool {
      UIDevice.current.userInterfaceIdiom == .phone
  }
}
#endif
