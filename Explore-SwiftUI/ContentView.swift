//
//  ContentView.swift
//  Explore-SwiftUI
//
//  Created by Ray on 2025/3/8.
//

import SwiftUI
import ComponentBox

struct ContentView: View {
  
  var body: some View {
    ShadowCard {
      VStack {
        Image(systemName: "globe")
          .imageScale(.large)
          .foregroundStyle(.tint)
        Text("Hello, world!")
      }
      .padding()
    }
    .frame(width: 260, height: 200)
  }
}

#Preview {
  ContentView()
}
