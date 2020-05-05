//
//  BaseTableView.swift
//  Indonesian News
//
//  Created by yoviekaputra on 05/05/20.
//  Copyright © 2020 multipolar. All rights reserved.
//

import UIKit

class BaseTableView : UITableView {
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() {}
}
