//
//  NewServices.swift
//  Indonesian News
//
//  Created by yoviekaputra on 03/05/20.
//  Copyright © 2020 multipolar. All rights reserved.
//

import RxSwift
import Moya

class NewsService : BaseService {
    private var provider: MoyaProvider<NewsApi>!
    
    init(provider: MoyaProvider<NewsApi>) {
        self.provider = provider
    }
    
    func getTopHighlight() -> Single<NewsResponse> {
        //get from API
        return provider.rx.request(.getTopHiglight("id", 1, 5), NewsResponse.self)
    }
}
