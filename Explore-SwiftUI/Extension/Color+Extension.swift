//
//  Color+Extension.swift
//  Explore-SwiftUI
//
//  Created by Ray on 2025/3/22.
//

import UIKit

extension UIColor {
  
  private static var hexColorCache: [String: CGColor] = [:]
  
  /// - [緩存顏色](Documentation/Resources/HexColorCache.jpg)
  /// - Parameters:
  ///   - hex: 色碼
  ///   - alpha: 透明度
  convenience init?(hex: String, alpha: CGFloat = 1.0) {
    let cleanedHex = hex.trimmingCharacters(
      in: CharacterSet.alphanumerics.inverted
    )
    
    if let cachedColor = Self.hexColorCache[cleanedHex] {
      self.init(cgColor: cachedColor)
      return
    }
    
    guard cleanedHex.count == 6 else { return nil }
    
    var rgbValue: UInt64 = 0
    Scanner(string: cleanedHex).scanHexInt64(&rgbValue)
    
    let red = CGFloat((rgbValue >> 16) & 0xFF) / 255.0
    let green = CGFloat((rgbValue >> 8) & 0xFF) / 255.0
    let blue = CGFloat(rgbValue & 0xFF) / 255.0
    
    defer { Self.hexColorCache[cleanedHex] = self.cgColor }
    
    self.init(red: red, green: green, blue: blue, alpha: alpha)
  }
}
