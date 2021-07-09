//
//  ImageService.swift
//  News
//
//  Created by Petro Starychok on 21.02.2021.
//

import Foundation
import UIKit

class ImageService {
    
    static let cache = NSCache<NSString, UIImage>()
    
    static func downloadImage(withURL url: URL, completion: @escaping (UIImage?, String) -> ()) {
        let dataTask = URLSession.shared.dataTask(with: url) { data, responseURL, error in
            var downloadedImage:UIImage?
            
            if let data = data {
                downloadedImage = UIImage(data: data)
            }
            if downloadedImage != nil {
                cache.setObject(downloadedImage!, forKey: url.absoluteString as NSString)
            }
            DispatchQueue.main.async {
                completion(downloadedImage, url.absoluteString)
            }
        }
        dataTask.resume()
    }
    
    static func getImage(withPath path: String, completion: @escaping (UIImage?, String) -> ()) {
        guard let imageURL = URL(string: path) else {
            completion(nil, path)
            return
        }
        if let image = cache.object(forKey: path as NSString) {
            completion(image, path)
            return
        }
        downloadImage(withURL: imageURL, completion: completion)
    }
}
