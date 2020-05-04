//
//  UICollectionViewCellExt.swift
//  Indonesian News
//
//  Created by yoviekaputra on 04/05/20.
//  Copyright © 2020 multipolar. All rights reserved.
//

import UIKit

extension UICollectionViewCell {
    static var identifier : String {
        return "\(self)"
    }
    
    class var nib : UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static func registerTo(tableView: UICollectionView) {
        tableView.register(nib, forCellWithReuseIdentifier: identifier)
    }
    
    static func dequeue(collectionView: UICollectionView, indexPath: IndexPath) -> Self {
        return collectionView.dequeueReusableCell(withReuseIdentifier: identifier,
                                                  for: indexPath) as! Self
    }
}
