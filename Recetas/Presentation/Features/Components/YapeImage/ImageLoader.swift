//
//  ImageLoader.swift
//  Recetas
//
//  Created by Joel Martin Chuco Marrufo on 23/05/24.
//

import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    @Published var image: Image? = nil
    private var cancellable: AnyCancellable?

    func loadImage(from url: String) {
        guard let url = URL(string: url) else {
            return
        }
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { Image(uiImage: UIImage(data: $0.data) ?? UIImage()) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in self?.image = $0 }
    }

    deinit {
        cancellable?.cancel()
    }
}
