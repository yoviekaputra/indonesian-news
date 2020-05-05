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
    
    //get from API
    init(provider: MoyaProvider<NewsApi>) {
        self.provider = provider
    }
    
    func getTopHeadlines() -> Single<NewsResponse> {
        return provider.rx.request(.getNews("id", "technology", 1, 5), NewsResponse.self)
    }
    
    func getNews(page: Int) -> Single<NewsResponse> {
        return provider.rx.request(.getNews("id", "", page, 10), NewsResponse.self)
    }
}
