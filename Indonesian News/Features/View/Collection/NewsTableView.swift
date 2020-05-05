//
//  TopHeadlinesTableView.swift
//  Indonesian News
//
//  Created by yoviekaputra on 04/05/20.
//  Copyright © 2020 multipolar. All rights reserved.
//

import UIKit

class NewsTableView : UITableView {
    var itemSelected = ObservableData<NewsModel>()
    var loadMore = ObservableData<Int>()
    var currentPage = 1
    
    private var newsSection: [SectionData] = [
        SectionData(cell: [NewsModel](), header: NewsType.TopHeadlines),
        SectionData(cell: [NewsModel](), header: NewsType.General)
    ]
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
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
}

extension NewsTableView {
    func addTopHidelinesItem(news: [NewsModel]?) {
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
            if section.header.rawValue == type.rawValue {
                newsSection[index].cell.append(contentsOf: news)
                reloadSections(IndexSet(integer: index), with: RowAnimation.none)
                return
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
        switch newsSection[section].header {
        case .TopHeadlines: return 1
        default: return newsSection[section].cell.count
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = SectionHeaderView()
        let section = newsSection[section]
        headerView.binding(header: section.header.rawValue)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = newsSection[indexPath.section]
        let header = section.header
        switch header {
        case .TopHeadlines:
            return TopHeadlinesCell.dequeue(tableView: tableView, indexPath: indexPath)
        default:
            let news = section.cell[indexPath.row]
            let cell = GeneralNewsCell.dequeue(tableView: tableView, indexPath: indexPath)
            cell.binding(news: news)
            loadMoreChecking(cellEndIndex: section.cell.endIndex, row: indexPath.row)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        itemSelected.value = newsSection[indexPath.section].cell[indexPath.row]
    }
}
