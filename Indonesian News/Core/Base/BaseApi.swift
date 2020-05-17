//
//  BaseApi.swift
//  Indonesian News
//
//  Created by yoviekaputra on 03/05/20.
//  Copyright © 2020 multipolar. All rights reserved.
//

import Foundation
import Moya

protocol BaseApi : TargetType {}

extension BaseApi {
    var API_KEY: String {
        return BuildConfig.get(key: .APIKey)
    }
    
    var BASE_URL: String {
        return BuildConfig.get(key: .BaseURL)
    }
    
    var baseURL: URL {
        return URL(string: BASE_URL)!
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String : String]? {
        return baseHeaders
    }
}

/* HEADER OR PARAM GLOBAL */
extension BaseApi {
    var baseParam: [String: Any] {
        return ["apiKey": API_KEY]
    }
    
    var baseHeaders: [String : String]? {
        return nil
    }
}
