//
//  ContentView.swift
//  Explore-SwiftUI
//
//  Created by Ray on 2025/3/8.
//

import SwiftUI
import ComponentBox

struct ContentView: View {
  
  @State private var show: Bool = false
  
  var body: some View {
    ShadowCard {
      Image(.image1)
        .resizable()
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .padding(8)
        .overlay {
          if show {
            Text("Tap to show")
              .font(.largeTitle)
              .fontWeight(.bold)
              .foregroundColor(.white)
          }
        }
      
    }
    .frame(width: 260, height: 200)
    .animatedTapEffect {
      show.toggle()
    }
  }
}

#Preview {
  ContentView()
}
