//
//  NewsDetailViewController.swift
//  Indonesian News
//
//  Created by yoviekaputra on 05/05/20.
//  Copyright © 2020 multipolar. All rights reserved.
//

import UIKit

class NewsDetailViewController : BaseViewController {
    @IBOutlet weak var imgNews: UIImageView!
    @IBOutlet weak var lblNewsTitle: UILabel!
    @IBOutlet weak var lblNewsDate: UILabel!
    @IBOutlet weak var lblNewsSource: UILabel!
    @IBOutlet weak var lblNewsDescription: UILabel!
    @IBOutlet weak var lblNewsContent: UILabel!
    @IBOutlet weak var lblNewsOpenLink: UILabel!

    private var news: NewsModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupData()
    }
    
    private func setupView() {
        lblNewsTitle.setTextBig()
        lblNewsTitle.setBold()
        lblNewsDate.setTextSmall()
        lblNewsSource.setTextSmall()
        lblNewsDescription.setTextMedium()
        lblNewsContent.setTextMedium()
        lblNewsOpenLink.setTextMedium()
    }
    
    private func setupData() {
        if let urlImage = news.urlToImage {
            imgNews.load(fromUrl: urlImage, mode: .scaleAspectFill)
        }
        lblNewsTitle.text = news.title
        lblNewsDate.text = news.publishedAt
        lblNewsSource.text = "\(news.source?.name ?? "-") | by \(news.author ?? "-")"
        lblNewsDescription.text = news.description
        lblNewsContent.text = news.content
        lblNewsOpenLink.text = "Open Link >>"
        
        if news.url != nil {
            lblNewsOpenLink.tap(target: self, action: #selector(openLink))
        }
    }
}

extension NewsDetailViewController {
    static func call(_ navigation: UINavigationController?, data: NewsModel) {
        let controller = NewsDetailViewController.init(nibName: "\(NewsDetailViewController.self)", bundle: nil)
        controller.setBundle(news: data)
        navigation?.pushViewController(controller, animated: true)
    }
    
    private func setBundle(news: NewsModel) {
        self.news = news
    }
}

extension NewsDetailViewController {
    @objc private func openLink() {
        if let url = URL(string: news.url!) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:])
            }
        }
    }
}
