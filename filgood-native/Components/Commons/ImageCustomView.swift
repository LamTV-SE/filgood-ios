//
//  ImageCustomView.swift
//  filgood-native
//
//  Created by Van Lam on 24/12/25.
//

import SwiftUI

class ImageCache {
    static let shared = NSCache<NSString, UIImage>()
}

struct ImageCustomView: View {
    let url: String
    let width: CGFloat
    let height: CGFloat
    let cornerRadius: CGFloat
    
    @State private var uiImage: UIImage? = nil
    
    var body: some View {
        Group {
            if let img = uiImage {
                Image(uiImage: img)
                    .resizable()
                    .scaledToFill()
            } else {
                ProgressView()
                    .frame(width: width, height: height)
                    .onAppear {
                        loadImage()
                    }
            }
        }
        .frame(width: width, height: height)
        .cornerRadius(cornerRadius)
    }
    
    private func loadImage() {
        if let cached = ImageCache.shared.object(forKey: url as NSString) {
            uiImage = cached
            return
        }
        
        guard let imageURL = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: imageURL) {data, _, _ in
            if let data = data, let img = UIImage(data: data) {
                ImageCache.shared.setObject(img, forKey: url as NSString)
                DispatchQueue.main.sync {
                    uiImage = img
                }
            }
        }.resume()
    }
}

#Preview {
    ImageCustomView(url: "https://api.ia-arena.ruji.fr//storage//profile_pictures//z3ecLNKDz2m3NsSd3M5X8ejhduF4qyW7A7fMFzb8.jpg", width: 36, height: 36, cornerRadius: 0)
}
