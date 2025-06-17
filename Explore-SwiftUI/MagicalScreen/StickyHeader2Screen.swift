//
//  StickyHeader2Screen.swift
//  Explore-SwiftUI
//
//  Created by Ray on 2025/6/17.
//

import SwiftUI

// MARK: - StickyHeader2Screen

// Reference = https://nilcoalescing.com/blog/StretchyHeaderInSwiftUI
struct StickyHeader2Screen: View {
  let flower: Flower

  var body: some View {
    ScrollView {
      VStack {
        Image(flower.name)
          .resizable()
          .frame(height: 500)
          .scaledToFill()
          // stretchy() 要放在最後的位置
          .stretchy()
          
      }
    }
    .ignoresSafeArea(edges: .top)
  }
}

#Preview {
  NavigationStack {
    StickyHeader2Screen(flower: Flower.sample)
  }
}

// MARK: - Flower

struct Flower {
  let name: String
  let description: String

  static let sample = Flower(name: "image-1",
                             description: "牡丹，花語...")
}

extension View {
  func stretchy() -> some View {
    visualEffect { content, geometry in
      let currentHeight = geometry.size.height
      let scrollOffset = geometry.frame(in: .scrollView).minY
      let positiveOffset = max(0, scrollOffset)

      let newHeight = currentHeight + positiveOffset
      let scaleFactor = newHeight / currentHeight
      print("scaleFactor = \(scaleFactor) / \(scaleFactor - 1)")
      return content.scaleEffect(
        x: scaleFactor, y: scaleFactor,
        anchor: .bottom
      )
      .blur(radius: (scaleFactor - 1) * 10)
    }
  }
}
