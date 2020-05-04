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
    var newsObserver = ObservableData<NewsResponse>()
    
    init(disposable: DisposeBag, service: NewsService) {
        super.init(disposable: disposable)
        self.service = service
    }
    
    func getTopHighlight() {
        self.loadingObserver.value = .show
        self.service.getTopHighlight()
            .subscribe { event in
                self.loadingObserver.value = .hide
                switch event {
                case .success(let data):
                    self.newsObserver.value = data
                case .error(let error):
                    self.onError(error)
                }
            }
            .disposed(by: disposable)
    }
}
