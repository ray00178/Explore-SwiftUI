// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

// // Reference = https://youtu.be/TU6tYZei0EQ?si=AaosqX6D0eLxQ5m0
public struct SwitchAppIconScreenX: View {
  
  @State private var currentIcon: AppIcon = .appicon
  
  public init() {}
  
  public var body: some View {
    List {
      Section("Chooess App Icon from X") {
        ForEach(AppIcon.allCases, id: \.rawValue) { icon in
          HStack {
            Image(icon.previewImage)
              .resizable()
              .aspectRatio(contentMode: .fill)
              .frame(width: 60, height: 60)
              .clipShape(RoundedRectangle(cornerRadius: 16))
            
            Text(icon.rawValue)
              .fontWeight(.semibold)
              .fontDesign(.rounded)
            
            Spacer(minLength: 0)
            
            Image(systemName: currentIcon == icon ? "checkmark.circle.fill" : "circle")
              .font(.title3)
              .foregroundStyle(currentIcon == icon ? .green : Color.primary)
          }
          .contentShape(.rect)
          .onTapGesture {
            currentIcon = icon
            UIApplication.shared.setAlternateIconName(icon.icon)
          }
        }
      }
    }
    .navigationTitle("App Icons")
    .navigationBarTitleDisplayMode(.large)
    .onAppear {
      if let alternativeIcon = UIApplication.shared.alternateIconName,
         let appIcon = AppIcon.allCases.first(where: { $0.rawValue == alternativeIcon }) {
        currentIcon = appIcon
      } else {
        currentIcon = .appicon
      }
    }
  }
}

private enum AppIcon: String, CaseIterable {
  
  case appicon = "AppIcon"
  
  case appicon2 = "AppIcon2"
  
  case appicon3 = "AppIcon3"
  
  var icon: String? {
    self == .appicon ? nil : rawValue
  }
  
  var previewImage: String {
    switch self {
    case .appicon:
      "AppLogo"
    case .appicon2:
      "AppLogo2"
    case .appicon3:
      "AppLogo3"
    }
  }
}

#Preview {
  NavigationStack {
    SwitchAppIconScreenX()
  }
}
