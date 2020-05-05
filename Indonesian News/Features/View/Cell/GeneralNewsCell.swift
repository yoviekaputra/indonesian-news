//
//  GeneralNewsCell.swift
//  Indonesian News
//
//  Created by yoviekaputra on 04/05/20.
//  Copyright © 2020 multipolar. All rights reserved.
//

import UIKit

class GeneralNewsCell : UITableViewCell {
    @IBOutlet weak var imgNewsImage: UIImageView!
    @IBOutlet weak var lblNewsTitle: UILabel!
    @IBOutlet weak var lblNewsDescription: UILabel!
    @IBOutlet weak var lblNewsDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    private func setupView() {
        lblNewsTitle.setTextBig()
        lblNewsTitle.setBold()
        lblNewsDescription.setTextMedium()
        lblNewsDate.setTextExtraSmall()
    }
}

extension GeneralNewsCell {
    func binding(news: NewsModel) {
        lblNewsTitle.text = news.title
        lblNewsDescription.text = "\(news.source?.name ?? "") | by \(news.author ?? "")"
        lblNewsDate.text = news.publishedAt
        
        if let imgUrl = news.urlToImage {
            imgNewsImage.load(fromUrl: imgUrl, mode: .scaleAspectFill)
            imgNewsImage.layer.cornerRadius = 4
        }
    }
}
