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
    case getTopHiglight(_ country: String, _ page: Int, _ pageSize: Int)
}

extension NewsApi : BaseApi {
    var path: String {
        switch self {
        case .getTopHiglight(_, _, _):
            return "/top-headlines"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getTopHiglight(_, _, _):
            return .get
        }
    }
    
    var task: Task {
        var param: [String: Any] = baseParam
        switch self {
        case .getTopHiglight(let country, let page, let pageSize):
            param["country"] = country
            param["page"] = page
            param["pageSize"] = pageSize
            return .requestParameters(parameters: param, encoding: URLEncoding.queryString)
        }
    }
}
