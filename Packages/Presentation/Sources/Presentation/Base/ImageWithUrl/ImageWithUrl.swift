//
//  ImageWithUrl.swift
//
//
//  Created by Leonardo Mendez on 14/06/24.
//

import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    
    @Published var image: UIImage?
    private var cancellable: AnyCancellable?

    func loadImage(from urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
    }
    
    deinit {
        cancellable?.cancel()
    }
    
}

struct ImageWithUrl: View {
    @StateObject private var loader = ImageLoader()
    let urlString: String
    let placeholder: Image
    
    init(urlString: String, placeholder: Image = Image(systemName: "photo")) {
        self.urlString = urlString
        self.placeholder = placeholder
    }
    
    var body: some View {
        image
            .onAppear {
                loader.loadImage(from: urlString)
            }
    }

    private var image: some View {
        Group {
            if let uiImage = loader.image {
                Image(uiImage: uiImage)
                    .resizable()
            } else {
                placeholder
                    .resizable()
            }
        }
    }
    
}
