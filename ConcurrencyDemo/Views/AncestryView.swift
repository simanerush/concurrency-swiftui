//
//  AncestryView.swift
//  ConcurrencyDemo
//
//  Created by Sima Nerush on 8/21/22.
//

import SwiftUI

struct AncestryView: View {
  let data = PhotosData()

    var body: some View {
      AsyncImage(
        url: URL(string: data.getAncestryLogoUrl())
      ) { phase in
        switch phase {
        case .empty:
          ProgressView()
        case .success(let image):
          image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(10)
        case .failure(let error):
          VStack {
            Image(systemName: "exclamationmark.triangle.fill")
              .foregroundColor(.orange)
            Text(error.localizedDescription)
              .font(.caption)
              .multilineTextAlignment(.center)
          }
        @unknown default:
          EmptyView()
        }
      }
//      { image in
//        image
//          .resizable()
//          .aspectRatio(contentMode: .fit)
//          .padding(10)
//        } placeholder: {
//          ProgressView()
//        }

    }
}

