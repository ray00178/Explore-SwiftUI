//
//  ExploreSwiftUIApp.swift
//  Explore-SwiftUI
//
//  Created by Ray on 2025/3/8.
//

import SwiftUI

@main
struct ExploreSwiftUIApp: App {
  
  init() {
    // SQLite 位置
    // https://sqlitebrowser.org
    #if DEBUG
    print("\(URL.applicationSupportDirectory.path(percentEncoded: false))")
    #endif
  }
  
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}
