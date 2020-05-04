//
//  SectionHeaderView.swift
//  Indonesian News
//
//  Created by yoviekaputra on 04/05/20.
//  Copyright © 2020 multipolar. All rights reserved.
//

import UIKit

class SectionHeaderView : XIBView {
    @IBOutlet weak var lblHeader: UILabel!
    
    override func setupView() {
        lblHeader.setTextBig()
        lblHeader.setBold()
    }
    
    func binding(header: String) {
        lblHeader.text = header
    }
}
