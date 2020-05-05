//
//  SectionData.swift
//  Indonesian News
//
//  Created by yoviekaputra on 04/05/20.
//  Copyright © 2020 multipolar. All rights reserved.
//

import Foundation

struct SectionData {
    var cell: [NewsModel]
    var header: NewsType
}

enum NewsType: String {
    case TopHeadlines = "Top Headlines"
    case General = "News"
}
