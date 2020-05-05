//
//  TopHeadLinesCollectionView.swift
//  Indonesian News
//
//  Created by yoviekaputra on 04/05/20.
//  Copyright © 2020 multipolar. All rights reserved.
//

import UIKit

class TopHeadLinesCollectionViewCell : BaseCollectionViewCell {
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

extension TopHeadLinesCollectionViewCell {
    func binding(model: NewsModel) {
        if let urlImage = model.urlToImage {
            imgView.load(fromUrl: urlImage, mode: .scaleAspectFill)
            imgView.layer.cornerRadius = 4
        }
    }
}
