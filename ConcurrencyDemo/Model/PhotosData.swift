//
//  PhotosData.swift
//  ConcurrencyDemo
//
//  Created by Sima Nerush on 8/21/22.
//

import Foundation
import UIKit

class PhotosData {
  let photosApi = PhotosAPI()

  var session = URLSession.shared

  func getAncestryLogoUrl() -> String {
    return photosApi.link + photosApi.ancestryLogoId
  }

  func fetchPhoto(id: Int) async throws -> Photo {
    let url = photosApi.link + photosApi.fourPhotosIds[id]
    let (data, _) = try await session.data(from: URL(string: url)!)
    return Photo(id: UUID().hashValue, image: UIImage(data: data) ?? UIImage())
  }

  func fetchAllPhotos() async -> [Photo] {
    await withTaskGroup(of: Photo?.self) { group in
      for id in 0..<16 {
        group.addTask {
          let photo = try? await self.fetchPhoto(id: id % 4)
          return photo
        }
      }

      var photos: [Photo] = []
      for await result in group {
        if let photo = result {
          photos.append(photo)
        }
      }
      return photos
    }
  }
}
