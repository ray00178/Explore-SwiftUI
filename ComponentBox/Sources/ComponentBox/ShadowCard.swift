//
//  SwiftUIView.swift
//  ComponentBox
//
//  Created by Ray on 2025/4/7.
//

import SwiftUI
import UIKit

public struct ShadowCard<Content>: View where Content: View {
  
  public var corner: CGFloat = 0
  public var content: Content
  
  public init(corner: CGFloat = 26.0, @ViewBuilder content: () -> Content) {
    self.corner = corner
    self.content = content()
  }
  
  public var body: some View {
    ZStack(alignment: .center) {
      RoundedRectangle(cornerRadius: corner)
        .fill(.white)
        .shadow(color: Color.black.opacity(0.06), radius: 0, x: 0, y: 0)
        .shadow(color: Color.black.opacity(0.06), radius: 1, x: 0, y: 1)
        .shadow(color: Color.black.opacity(0.06), radius: 3, x: 0, y: 3)
        .shadow(color: Color.black.opacity(0.06), radius: 6, x: 0, y: 6)
        .shadow(color: Color.black.opacity(0.06), radius: 12, x: 0, y: 12)
        .shadow(color: Color.black.opacity(0.06), radius: 24, x: 0, y: 24)
      
      content
    }
  }
}

#Preview {
  ShadowCard {
    Text("Outer")
  }
  .frame(width: 200, height: 200)
}

