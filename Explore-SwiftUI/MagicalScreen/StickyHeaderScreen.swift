//
//  StickyHeaderScreen.swift
//  Explore-SwiftUI
//
//  Created by Ray on 2025/3/9.
//

import SwiftUI

// Reference = https://youtu.be/q42qK5fmYN0?si=dsnxs1g-1hXQbFHo
struct StickyHeaderScreen: View {
  var body: some View {
    ScrollView {
      VStack {
        imageView()
        grid()
      }
    }
    .ignoresSafeArea(edges: .top)
    .toolbarRole(.editor)
  }
  
  @ViewBuilder
  private func imageView() -> some View {
    GeometryReader { proxy in
      let minY = proxy.frame(in: .global).minY
      let isScrolling = minY > 0
      VStack {
        Image(.image1)
          .resizable()
          .scaledToFill()
          .frame(height: isScrolling ? 200 + minY : 200)
          .clipped()
          .offset(y: isScrolling ? -minY : 0)
          .blur(radius: isScrolling ? minY / 80 : 0)
          .scaleEffect(isScrolling ? 1 + minY / 1000 : 1)
          .overlay(alignment: .bottom) {
            ZStack {
              Image(.image1)
                .resizable()
                .scaledToFill()
              
              Circle()
                .stroke(style: StrokeStyle(lineWidth: 6))
                .foregroundStyle(.white)
                
            }
            .frame(width: 100, height: 100)
            .clipShape(Circle())
            .offset(y: 50)
            .offset(y: isScrolling ? -minY : 0)
          }
        
        Group {
          VStack(spacing: 6) {
            Text("Ray")
              .bold()
              .font(.title)
            Text("USAID employees around the world will be placed on leave Friday and ordered to return to US")
              .font(.callout)
              .multilineTextAlignment(.center)
              .frame(width: proxy.size.width - 30)
              .lineLimit(3)
              .fixedSize()
          }
          .offset(y: isScrolling ? -minY : 0)
        }
        .padding(.vertical, 50)
      }
    }
    .frame(height: 350)
  }
  
  @ViewBuilder
  private func grid() -> some View {
    LazyVGrid(columns: Array(repeating: GridItem(), count: 2)) {
      ForEach(1..<25) { index in
        if index.isMultiple(of: 2) {
          RoundedRectangle(cornerRadius: 12)
            .frame(width: 180, height: 200)
            .foregroundStyle(.ultraThinMaterial)
        } else {
          Color.purple
            .brightness(Double(index) * -0.02)
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
      }
    }
    .padding(.horizontal, 10)
  }
}

#Preview {
  StickyHeaderScreen()
}
