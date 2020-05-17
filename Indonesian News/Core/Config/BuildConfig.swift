//
//  BuildConfig.swift
//  Indonesian News
//
//  Created by yoviekaputra on 17/05/20.
//  Copyright © 2020 multipolar. All rights reserved.
//

import Foundation

enum BuildConfig : String {
    case BaseURL = "BASE_URL"
    case APIKey = "API_KEY"
}

extension BuildConfig {
    static func get(key: BuildConfig) -> String {
        return Bundle.main.object(forInfoDictionaryKey: key.rawValue) as! String
    }
    
    static func getBoolean(key: BuildConfig) -> Bool {
        let value = Bundle.main.object(forInfoDictionaryKey: key.rawValue) as! String
        return Bool(value) ?? false
    }
    
    static func getDictionary(key: BuildConfig) -> Dictionary<String, Any> {
        return Bundle.main.object(forInfoDictionaryKey: key.rawValue) as! Dictionary
    }
}

