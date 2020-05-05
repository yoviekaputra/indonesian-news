//
//  DashboardViewModel.swift
//  Indonesian News
//
//  Created by yoviekaputra on 02/05/20.
//  Copyright © 2020 multipolar. All rights reserved.
//

import RxSwift

class DashboardViewModel : BaseViewModel {
    private var service: NewsService!
    var topHeadlinesObserver = ObservableData<NewsResponse>()
    var newsObserver = ObservableData<NewsResponse>()
    
    init(disposable: DisposeBag, service: NewsService) {
        super.init(disposable: disposable)
        self.service = service
    }
    
    func getTopHeadlines() {
        self.loadingObserver.value = .show
        self.service.getTopHeadlines()
            .subscribe { event in
                self.loadingObserver.value = .hide
                switch event {
                case .success(let data):
                    self.handleTopHeadlinesResponse(data)
                case .error(let error):
                    self.onError(error)
                }
            }
            .disposed(by: disposable)
    }
    
    func getNews(page: Int) {
        self.loadingObserver.value = .show
        self.service.getNews(page: page)
            .subscribe { event in
                self.loadingObserver.value = .hide
                switch event {
                case .success(let data):
                    self.handleNewsResponse(data)
                case .error(let error):
                    self.onError(error)
                }
            }
            .disposed(by: disposable)
    }
}

extension DashboardViewModel {
    private func isValidateResponse(response: NewsResponse) -> Bool {
        if response.status?.lowercased() == "ok" {
            return true
        }
        self.onError(response.message ?? "")
        return false
    }
    
    private func handleTopHeadlinesResponse(_ data: NewsResponse) {
        if isValidateResponse(response: data) {
            self.topHeadlinesObserver.value = data
        }
    }
    
    private func handleNewsResponse(_ data: NewsResponse) {
        if isValidateResponse(response: data) {
            self.newsObserver.value = data
        }
    }
}
