// The Swift Programming Language
// https://docs.swift.org/swift-book

import ComponentBox
import SwiftUI

struct RamdomView: View {
  
  var body: some View {
    
    ShadowCard {
      HStack {
        Text("Bro 🥺")
        Image("ic_snowflake", bundle: .module)
          .renderingMode(.template)
          .foregroundStyle(.green)
      }
    }
    .frame(width: 300, height: 300)
  }
}
#Preview {
  RamdomView()
}
