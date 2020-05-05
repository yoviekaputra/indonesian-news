//
//  TopHeadlinesCell.swift
//  Indonesian News
//
//  Created by yoviekaputra on 04/05/20.
//  Copyright © 2020 multipolar. All rights reserved.
//

import UIKit
import RxSwift
import Moya

class TopHeadlinesCell : UITableViewCell {
    @IBOutlet weak var collectionTopHeadlines: UICollectionView!
    var itemSelected = ObservableData<NewsModel>()
    private var topHeadlinesItem: [NewsModel] = []
    
    private var viewModel: DashboardViewModel!
    private var disposable = DisposeBag()
    private var service: NewsService!
    private var reload: (() -> Void) = {}
    
    override func awakeFromNib() {
        collectionTopHeadlines.delegate = self
        collectionTopHeadlines.dataSource = self
        collectionTopHeadlines.register(TopHeadLinesCollectionViewCell.nib,
                                        forCellWithReuseIdentifier: TopHeadLinesCollectionViewCell.identifier)
        
        service = NewsService(provider: MoyaProvider<NewsApi>())
        viewModel = DashboardViewModel(disposable: disposable, service: service)
        
        viewModel.getTopHeadlines()
        viewModel.topHeadlinesObserver.observe(disposable) { response in
            self.topHeadlinesItem.append(contentsOf: response?.articles ?? [])
            self.collectionTopHeadlines.reloadData()
        }
    }
}

extension TopHeadlinesCell : UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
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
        let height = (width * (1/2))
        return CGSize(width: width, height: height)
    }
}
