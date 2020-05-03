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
    private let alertBuilder = AlertBuilder.shared()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showLoader() { loader.show() }
    
    func hideLoader() { loader.hide() }
}
