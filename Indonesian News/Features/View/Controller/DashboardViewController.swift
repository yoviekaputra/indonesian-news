//
//  ViewController.swift
//  Indonesian News
//
//  Created by yoviekaputra on 02/05/20.
//  Copyright © 2020 multipolar. All rights reserved.
//

import UIKit
import RxSwift
import Moya

class DashboardViewController : BaseViewController {
    @IBOutlet weak var tableView: NewsTableView!
    
    private var viewModel: NewsViewModel!
    private var disposable = DisposeBag()
    private var service: NewsService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupView()
    }
    
    private func setupData() {
        service = NewsService(provider: MoyaProvider<NewsApi>())
        viewModel = NewsViewModel(disposable: disposable, service: service)
        tableView.setViewModel(viewModel: viewModel, disposable: disposable)
        setupObserver()
        
        viewModel.getTopHeadlines()
        viewModel.getNews(page: tableView.currentPage)
    }
    
    private func setupView() {
        self.navigationItem.title = "Indonesian's News"
    }
}

extension DashboardViewController {
    private func setupObserver() {
        viewModel.loadingObserver.observe(disposable) { data in
            self.showLoader(data)
        }
        
        viewModel.errorObserver.observe(disposable) { message in
            self.showAlertError(message)
        }
        
        viewModel.topHeadlinesObserver.observe(disposable) { response in
            self.tableView.addTopHeadlinesItem(news: response?.articles)
        }
        
        viewModel.newsObserver.observe(disposable) { response in
            self.tableView.addNewsItem(news: response?.articles)
        }
        
        tableView.loadMore.observe(disposable) { page in
            self.viewModel.getNews(page: page ?? 1)
        }
        
        tableView.itemSelected.observe(disposable) { news in
            guard let news = news else { return }
            NewsDetailViewController.call(
                self.navigationController,
                data: news
            )
        }
    }
}
