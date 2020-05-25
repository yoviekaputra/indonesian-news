//
//  TopHeadlinesTableView.swift
//  Indonesian News
//
//  Created by yoviekaputra on 04/05/20.
//  Copyright © 2020 multipolar. All rights reserved.
//

import UIKit
import RxSwift

class NewsTableView : BaseTableView {
    private var viewModel: NewsViewModel!
    private var disposable: DisposeBag!
    
    var itemSelected = ObservableData<NewsModel>()
    var loadMore = ObservableData<Int>()
    var currentPage = 1
    
    private var newsSection: [NewsType] = [ .TopHeadlines, .General]
    private var topHeadlinesItem: [NewsModel] = []
    private var generalItem: [NewsModel] = []
    
    override func setupView() {
        delegate = self
        dataSource = self
        sectionHeaderHeight = UITableView.automaticDimension
        estimatedSectionHeaderHeight = 36
        estimatedRowHeight = 125
        rowHeight = UITableView.automaticDimension
        separatorStyle = .none
        
        register(GeneralNewsCell.nib, forCellReuseIdentifier: GeneralNewsCell.identifier)
        register(TopHeadlinesCell.nib, forCellReuseIdentifier: TopHeadlinesCell.identifier)
    }
    
    func setViewModel(viewModel: NewsViewModel?, disposable: DisposeBag?) {
        self.viewModel = viewModel
        self.disposable = disposable
    }
}

extension NewsTableView {
    func addTopHeadlinesItem(news: [NewsModel]?) {
        if let news = news {
            addItem(type: .TopHeadlines, news: news)
        }
    }
    
    func addNewsItem(news: [NewsModel]?) {
        if let news = news {
            addItem(type: .General, news: news)
        }
    }
    
    private func addItem(type: NewsType, news: [NewsModel]) {
        for (index, section) in newsSection.enumerated() {
            if type.rawValue == section.rawValue {
                switch type {
                case  .TopHeadlines:
                    topHeadlinesItem = news
                    break
                case .General:
                    generalItem.append(contentsOf: news)
                    break
                }
                reloadSections(IndexSet(integer: index), with: .top)
            }
        }
    }
    
    private func loadMoreChecking(cellEndIndex: Int, row: Int) {
        if cellEndIndex-1 == row {
            currentPage += 1
            loadMore.value = currentPage
        }
    }
}

extension NewsTableView : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return newsSection.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch newsSection[section] {
        case .TopHeadlines: return 1
        default: return generalItem.count
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = SectionHeaderView()
        let section = newsSection[section]
        headerView.binding(header: section.rawValue)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = newsSection[indexPath.section]
        switch section {
        case .TopHeadlines:
            let cell = TopHeadlinesCell.dequeue(tableView: tableView, indexPath: indexPath)
            cell.binding(news: topHeadlinesItem, itemSelected: itemSelected)
            return cell
        default:
            let news = generalItem[indexPath.row]
            let cell = GeneralNewsCell.dequeue(tableView: tableView, indexPath: indexPath)
            cell.binding(news: news)
            loadMoreChecking(cellEndIndex: generalItem.endIndex, row: indexPath.row)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        switch newsSection[indexPath.section] {
        case .General:
            itemSelected.value = generalItem[indexPath.row]
            break
        default:
            print("")
        }
    }
}
