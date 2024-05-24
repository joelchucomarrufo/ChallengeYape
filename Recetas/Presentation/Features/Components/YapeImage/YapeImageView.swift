//
//  YapeImageView.swift
//  Recetas
//
//  Created by Joel Martin Chuco Marrufo on 23/05/24.
//

import SwiftUI

struct YapeImageView: View {
    @StateObject private var imageLoader = ImageLoader()
    let url: String
    let width: CGFloat
    let height: CGFloat

    var body: some View {
        VStack {
            if let image = imageLoader.image {
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: width, height: height)
                    .cornerRadius(10)
            } else {
                SkeletonView()
                    .frame(width: width, height: height)
            }
        }
        .onAppear {
            imageLoader.loadImage(from: url)
        }
    }
}
