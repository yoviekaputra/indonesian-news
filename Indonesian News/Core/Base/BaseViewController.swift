//
//  BaseViewController.swift
//  Indonesian News
//
//  Created by yoviekaputra on 02/05/20.
//  Copyright © 2020 multipolar. All rights reserved.
//
import UIKit

class BaseViewController : UIViewController {
    private let loader = LoaderVC.shared()
    let alertBuilder = AlertBuilder.shared()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension BaseViewController {
    func showLoader(_ state: LoaderState?) {
        switch state {
        case .show: loader.show(); break
        default: loader.hide()
        }
    }
    
    func showAlertError(_ error: String?) {
        alertBuilder.show(self, title: "Error", message: error)
    }
}
