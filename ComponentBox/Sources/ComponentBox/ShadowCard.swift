//
//  SwiftUIView.swift
//  ComponentBox
//
//  Created by Ray on 2025/4/7.
//

import SwiftUI

public struct ShadowCard<Content: View>: View {
  
  var content: Content
  
  public init(@ViewBuilder content: () -> Content) {
    self.content = content()
  }
  
  public var body: some View {
    ZStack(alignment: .center) {
      RoundedRectangle(cornerRadius: 20)
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

