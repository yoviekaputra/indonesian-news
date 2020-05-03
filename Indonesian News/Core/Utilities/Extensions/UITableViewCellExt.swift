//
//  UITableViewCellExt.swift
//  Indonesian News
//
//  Created by yoviekaputra on 02/05/20.
//  Copyright © 2020 multipolar. All rights reserved.
//

import UIKit

extension UITableViewCell {
    class var identifier : String {
        return String(describing: type(of: self))
    }
    
    class var nib : UINib {
        return UINib(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    static func registerTo(tableView: UITableView) {
        tableView.register(nib, forCellReuseIdentifier: identifier)
    }
    
    static func dequeue(tableView: UITableView, indexPath: IndexPath) -> Self {
        return tableView.dequeueReusableCell(withIdentifier: self.identifier, for: indexPath) as! Self
    }
}
