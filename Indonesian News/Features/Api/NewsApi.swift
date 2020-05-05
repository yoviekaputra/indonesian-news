//
//  NewsApi.swift
//  Indonesian News
//
//  Created by yoviekaputra on 03/05/20.
//  Copyright © 2020 multipolar. All rights reserved.
//

import Foundation
import Moya

enum NewsApi {
    case getNews(_ country: String, _ category: String, _ page: Int, _ pageSize: Int)
}

extension NewsApi : BaseApi {
    var path: String {
        switch self {
        case .getNews:
            return "/top-headlines"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getNews:
            return .get
        }
    }
    
    var task: Task {
        var param: [String: Any] = baseParam
        switch self {
        case .getNews(let country, let category, let page, let pageSize):
            param["country"] = country
            param["category"] = category
            param["page"] = page
            param["pageSize"] = pageSize
            return .requestParameters(parameters: param, encoding: URLEncoding.queryString)
        }
    }
}
