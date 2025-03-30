// The Swift Programming Language
// https://docs.swift.org/swift-book

import Magical
import SwiftUI

struct RamdomView: View {
  
  var body: some View {
    
    ShadowCard {
      Text("Bro")
    }
    .frame(width: 300, height: 300)
  }
}

#Preview {
  RamdomView()
}
