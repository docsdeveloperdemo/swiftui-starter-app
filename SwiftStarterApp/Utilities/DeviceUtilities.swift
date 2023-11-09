//
//  UIDevice.swift
//  SwiftStarterApp
//
//  Created by Ryan McCaffery on 09/11/2023.
//

import Foundation

enum DeviceType : String {
    case ipad
    case iphone
    case mac
  
}

class DeviceUtilities {
  
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
