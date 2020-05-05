//
//  TopHeadlinesCell.swift
//  Indonesian News
//
//  Created by yoviekaputra on 04/05/20.
//  Copyright © 2020 multipolar. All rights reserved.
//

import UIKit
import RxSwift

class TopHeadlinesCell : UITableViewCell {
    @IBOutlet weak var collectionTopHeadlines: UICollectionView!
    private var itemSelected: ObservableData<NewsModel>?
    private var topHeadlinesItem: [NewsModel] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupView()
    }
    
    private func setupView() {
        collectionTopHeadlines.delegate = self
        collectionTopHeadlines.dataSource = self
        collectionTopHeadlines.register(
            TopHeadLinesCollectionViewCell.nib,
            forCellWithReuseIdentifier: TopHeadLinesCollectionViewCell.identifier
        )
    }
    
    func binding(news: [NewsModel], itemSelected: ObservableData<NewsModel>?) {
        self.topHeadlinesItem = news
        self.itemSelected = itemSelected
        collectionTopHeadlines.reloadData()
    }
}

extension TopHeadlinesCell : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topHeadlinesItem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = TopHeadLinesCollectionViewCell
            .dequeue(collectionView: collectionView, indexPath: indexPath)
        cell.binding(model: topHeadlinesItem[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        itemSelected?.value = topHeadlinesItem[indexPath.row]
    }
}

extension TopHeadlinesCell : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return getSize()
    }
    
    private func getSize() -> CGSize {
        let width = self.frame.width - 42
        let height = (width * (1/2))
        return CGSize(width: width, height: height)
    }
}
