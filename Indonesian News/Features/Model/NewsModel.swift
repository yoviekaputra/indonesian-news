//
//  ArticleModel.swift
//  Indonesian News
//
//  Created by yoviekaputra on 03/05/20.
//  Copyright © 2020 multipolar. All rights reserved.
//

import Foundation

class NewsResponse : Decodable {
    var status: String?
    var totalResults: Int?
    var articles: [NewsModel]?
}

class NewsModel : Decodable {
    var source: Source?
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
}

class Source : Decodable {
    var id: String?
    var name: String?
}
