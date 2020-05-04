//
//  UIImageViewExt.swift
//  Indonesian News
//
//  Created by yoviekaputra on 04/05/20.
//  Copyright © 2020 multipolar. All rights reserved.
//

import UIKit

fileprivate let imageCache = NSCache<NSString,UIImage>()

extension UIImageView {
    func load(fromUrl: String, placeholder: UIImage? = nil, mode: UIView.ContentMode = .scaleAspectFit) {
        let url = URL(string: fromUrl)
        self.backgroundColor = UIColor.clear
        self.contentMode = mode
        self.image = placeholder
        
        if let cache = imageCache.object(forKey: (url?.absoluteString ?? "") as NSString) {
            self.image = cache
            return
        }
        
        DispatchQueue.global(qos: .background).async {
            URLSession.shared.dataTask(with: url!) { data, response, error in
                guard let httpResponse = response as? HTTPURLResponse,
                    httpResponse.statusCode == 200,
                    let data = data, error == nil,
                    let image = UIImage(data: data)
                    else {
                        return
                }
                
                imageCache.setObject(image, forKey: (url?.absoluteString ?? "") as NSString)
                DispatchQueue.main.async {
                    self.image = image
                }
            }.resume()
        }
    }
}
