//
//  File.swift
//  ComponentBox
//
//  Created by Ray on 2025/4/12.
//

import SwiftUI

public extension View {
  
  /// 元件點擊 Scale 動畫
  /// - Parameters:
  ///   - duration: 動畫整體時間, default = 0.15
  ///   - scale: 縮放比例, default = 0.8
  ///   - debounce: 防抖開關, default = true
  ///   - completion: 動畫完成後回調
  /// - Returns: View
  func animatedTapEffect(
      duration: TimeInterval = 0.15,
      scale: CGFloat = 0.8,
      debounce: Bool = true,
      completion: (() -> Void)? = nil
    ) -> some View {
      modifier(
        AnimatedTapModifier(duration: duration, scale: scale, debounce: debounce, completion: completion)
      )
    }
}

/// 元件點擊 Scale 動畫
public struct AnimatedTapModifier: ViewModifier {
  
  let duration: TimeInterval
  let scale: CGFloat
  let debounce: Bool
  let completion: (() -> Void)?

  /// 點擊行為變數, default = false
  @State private var isTapped = false
  
  /// 防抖控制變數, default = false
  @State private var isLocked = false
  
  public func body(content: Content) -> some View {
    content
      .scaleEffect(isTapped ? scale : 1)
      .animation(.smooth(duration: duration), value: isTapped)
      .onTapGesture {
        guard isLocked == false else { return }
        
        if debounce {
          isLocked = true
        }
        
        isTapped = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
          isTapped = false
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + duration * 2) {
          completion?()
          
          if debounce { isLocked = false }
        }
      }
  }
}
