//
//  ContentView.swift
//  ConcurrencyDemo
//
//  Created by Sima Nerush on 8/20/22.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    TabView {
      AncestryView()
        .tabItem {
          Label("Logo", systemImage: "leaf.fill")
        }
      AncestorsView()
        .tabItem {
          Label("Ancestors", systemImage: "person.crop.artframe")
        }
      AllPhotosView()
        .tabItem {
          Label("All Photos", systemImage: "person.3.sequence.fill")
        }
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
