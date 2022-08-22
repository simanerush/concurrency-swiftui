//
//  AncestorsView.swift
//  ConcurrencyDemo
//
//  Created by Sima Nerush on 8/21/22.
//

import SwiftUI

struct AncestorsView: View {
  private let photosData = PhotosData()

  @State var photos: [Photo] = []

  var body: some View {
    NavigationView {
      ZStack {
        ScrollView(.horizontal) {
          HStack(spacing: 0) {
            ForEach(photos) { photo in
              Image(uiImage: photo.image)
                .resizable()
                .scaledToFit()
                .padding(.horizontal, 20)
                .padding(.vertical, 8)
            }
          }.task {
            photos = []
            do {
              // First approach
//              let photo1 = try await photosData.fetchPhoto(id: 0)
//              let photo2 = try await photosData.fetchPhoto(id: 1)
//              let photo3 = try await photosData.fetchPhoto(id: 2)
//              let photo4 = try await photosData.fetchPhoto(id: 3)
//
//              photos = [
//                photo1,
//                photo2,
//                photo3,
//                photo4
//              ]
              // Second approach
              async let photo1 = photosData.fetchPhoto(id: 0)
              async let photo2 = photosData.fetchPhoto(id: 1)
              async let photo3 = photosData.fetchPhoto(id: 2)
              async let photo4 = photosData.fetchPhoto(id: 3)

              photos = try await [
                photo1,
                photo2,
                photo3,
                photo4
              ]

            } catch {
              print(error.localizedDescription)
            }
          }
        }
        if photos.isEmpty {
          ProgressView()
        }
      }
      .navigationTitle("Recently added")
    }
  }
}
