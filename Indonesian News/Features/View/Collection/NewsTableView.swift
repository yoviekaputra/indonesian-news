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
    private var newsSection: [SectionData] = [
        SectionData(cell: [NewsModel](), header: NewsType.TopHeadlines),
        SectionData(cell: [NewsModel](), header: NewsType.Generic)
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
        register(GeneralNewsCell.nib, forCellReuseIdentifier: GeneralNewsCell.identifier)
        estimatedRowHeight = 125
        rowHeight = UITableView.automaticDimension
        separatorStyle = .none
    }
}

extension NewsTableView {
    func addTopHidelinesItem(news: [NewsModel]?) {
        if let news = news {
            addItem(type: .TopHeadlines, news: news)
        }
    }
    
    func addItemGenericNews(news: [NewsModel]?) {
        if let news = news {
            addItem(type: .Generic, news: news)
        }
    }
    
    private func addItem(type: NewsType, news: [NewsModel]) {
        for (index, section) in newsSection.enumerated() {
            print("\(index) - \(section.header.rawValue) - \(type.rawValue)")
            if section.header.rawValue == type.rawValue {
                newsSection[index].cell.append(contentsOf: news)
                reloadSections(IndexSet(integer: index), with: RowAnimation.none)
                return
            }
        }
    }
}

extension NewsTableView : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return newsSection.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsSection[section].cell.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = SectionHeaderView()
        let section = newsSection[section]
        headerView.binding(header: section.header.rawValue)
        /*let myLabel = UILabel()
        myLabel.frame = CGRect(x: 8, y: 4, width: tableView.frame.width, height: 20)
        myLabel.setBold()
        myLabel.setTextBig()
        myLabel.text = section.header.rawValue
        print(section.header.rawValue)
        let headerView = UIView()
        headerView.backgroundColor = UIColor.lightText
        headerView.addSubview(myLabel)*/
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch newsSection[indexPath.section].header {
        case .TopHeadlines:
            let cell = GeneralNewsCell.dequeue(tableView: tableView, indexPath: indexPath)
            cell.binding(model: newsSection[indexPath.section].cell[indexPath.row])
            return cell
        default:
            let cell = GeneralNewsCell.dequeue(tableView: tableView, indexPath: indexPath)
            cell.binding(model: newsSection[indexPath.section].cell[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        itemSelected.value = newsSection[indexPath.section].cell[indexPath.row]
    }
}
