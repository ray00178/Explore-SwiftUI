//
//  ParallaxImageScreen.swift
//  Explore-SwiftUI
//
//  Created by Ray on 2025/3/9.
//

import SwiftUI

struct ParallaxImageScreen: View {
  
  @State private var resources: [ImageResource] = [
    .image1, .image2, .image3,
  ]

  @State private var position: CGPoint = .zero
  
  var body: some View {
    VStack {
      Text("Parallax")
        .foregroundStyle(.black.secondary)
        .font(.custom("MapleMono-Bold", size: 26, relativeTo: .largeTitle))
      
      ScrollView(.horizontal) {
        LazyHStack(spacing: 16) {
          ForEach(resources, id: \.self) { resource in
            ZStack {
              Image(resource)
                .resizable()
                .scaledToFill()
                .scrollTransition(axis: .horizontal) { content, phaes in
                  content.offset(x: phaes.value * -250)
                }
            }
            .containerRelativeFrame([.horizontal, .vertical])
            .clipShape(RoundedRectangle(cornerRadius: 20))
          }
        }
      }
      .frame(height: 200)
      .contentMargins(.horizontal, 20)
      .scrollIndicators(.hidden)
      
      Spacer()
    }
    .navigationTitle("Parallax Image")
    .navigationBarTitleDisplayMode(.inline)
    .navigationBarBackButtonHidden(true)
    .toolbar(.hidden, for: .tabBar)
    .toolbar {
      ToolbarItem(placement: .topBarLeading) {
        Button(action: {
          //path.removeLast()
        }, label: {
          Image(systemName: "arrow.left")
            .tint(.black.opacity(0.8))
        })
      }
    }
  }
}

#Preview {
  NavigationStack {
    ParallaxImageScreen()
  }
}
