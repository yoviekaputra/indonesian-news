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
    
    override func layoutSubviews() {
        imgNewsImage.layer.cornerRadius = 4
    }
}

extension GeneralNewsCell {
    func binding(model: NewsModel) {
        lblNewsTitle.text = model.title
        lblNewsDescription.text = "\(model.source?.name ?? "") | by \(model.author ?? "")"
        lblNewsDate.text = model.publishedAt
        
        if let imgUrl = model.urlToImage {
            imgNewsImage.load(fromUrl: imgUrl, mode: .scaleAspectFill)
        }
    }
}
