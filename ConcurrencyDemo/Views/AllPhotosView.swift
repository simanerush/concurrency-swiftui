//
//  AllPhotosView.swift
//  ConcurrencyDemo
//
//  Created by Sima Nerush on 8/21/22.
//

import SwiftUI

struct AllPhotosView: View {
  private let photosData = PhotosData()

  @State var photos: [Photo] = []

  var body: some View {
    NavigationView {
      ZStack {
        ScrollView(.vertical) {
          VStack(spacing: 0) {
            ForEach(photos) { photo in
              Image(uiImage: photo.image)
                .resizable()
                .scaledToFit()
                .padding(.horizontal, 20)
                .padding(.vertical, 8)
            }
          }.task {
            photos = await photosData.fetchAllPhotos()
          }
        }
        if photos.isEmpty {
          ProgressView()
        }
      }
      .navigationTitle("All Photos")
    }
  }
}
