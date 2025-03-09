//
//  CircleAvtor.swift
//  Explore-SwiftUI
//
//  Created by Ray on 2025/3/9.
//

import SwiftUI

// Reference = https://x.com/sucodeee/status/1818977552188215482
struct CircleAvtor: View {
  
  @State private var spin: Bool = false
  @State private var scale: Bool = false
  
  var body: some View {
    ZStack {
      Circle()
        .stroke(lineWidth: 3)
        .frame(width: 200, height: 200)
        .foregroundStyle(.gray.secondary)
      
      Image(.image1)
        .resizable()
        .scaledToFill()
        .frame(width: 170, height: 170)
        .clipShape(Circle())
        .scaleEffect(scale ? 1.0 : 0.9)
      
      Group {
        Circle()
          .trim(from: 0.0, to: 0.1)
          .stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
          .frame(width: 200, height: 200)
          .foregroundStyle(.pink)
        
        Circle()
          .trim(from: 0.0, to: 0.15)
          .stroke(style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round))
          .frame(width: 200, height: 200)
          .rotationEffect(.degrees(-180))
          .foregroundStyle(.blue)
      }
      .rotationEffect(.degrees(spin ? 360 : 0))
    }
    .navigationTitle("Circle Avtor")
    .navigationBarTitleDisplayMode(.large)
    .toolbarRole(.editor)
    .toolbar(.hidden, for: .tabBar)
    .onAppear {
      withAnimation(.linear(duration: 3).repeatForever(autoreverses: false)) {
        spin = true
      }
      
      withAnimation(.linear(duration: 1).repeatForever(autoreverses: true)) {
        scale.toggle()
      }
    }
  }
}

#Preview {
  NavigationStack {
    CircleAvtor()
  }
}
