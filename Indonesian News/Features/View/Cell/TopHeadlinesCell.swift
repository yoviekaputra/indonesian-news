//
//  TopHeadlinesCell.swift
//  Indonesian News
//
//  Created by yoviekaputra on 04/05/20.
//  Copyright © 2020 multipolar. All rights reserved.
//

import UIKit

class TopHeadlinesCell : UITableViewCell {
    @IBOutlet weak var collectionTopHeadlines: UICollectionView!
    var itemSelected = ObservableData<NewsModel>()
    private var topHeadlinesItem: [NewsModel] = []
    private var paddingSize: CGFloat = 8
    
    override func awakeFromNib() {
        collectionTopHeadlines.delegate = self
        collectionTopHeadlines.dataSource = self
        collectionTopHeadlines.register(TopHeadLinesCollectionViewCell.self,
                                        forCellWithReuseIdentifier: TopHeadLinesCollectionViewCell.identifier)
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
        itemSelected.value = topHeadlinesItem[indexPath.row]
    }
}

extension TopHeadlinesCell : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return getSize()
    }
    
    private func getSize() -> CGSize {
        let width = collectionTopHeadlines.frame.width - 42
        let height = collectionTopHeadlines.frame.width / 2
        return CGSize(width: width, height: height)
    }
}
