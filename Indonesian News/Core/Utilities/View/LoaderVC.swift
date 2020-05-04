//
//  LoaderVC.swift
//  Indonesian News
//
//  Created by yoviekaputra on 02/05/20.
//  Copyright © 2020 multipolar. All rights reserved.
//

import UIKit

class LoaderVC {
    private var loaderView: UIView?
    
    private static let loader: LoaderVC = LoaderVC()
    
    class func shared() -> LoaderVC { return loader }

    private init() {}

    func show() {
        if loaderView == nil {
            guard let topWindow = UIApplication.shared.windows.last else { return }
            /* Create Loader */
            let indicator = UIActivityIndicatorView()
            //indicator.transform = CGAffineTransform(scaleX: 1, y: 1)
            //indicator.tintColor = UIColor.white
            indicator.style = .large
            
            /* create view */
            loaderView = UIView.init(frame: topWindow.bounds)
            loaderView?.backgroundColor = UIColor.black.withAlphaComponent(0.36)
            
            DispatchQueue.main.async {
                if let view = self.loaderView {
                    self.loaderView?.addSubview(indicator)
                    topWindow.addSubview(view)
                    topWindow.bringSubviewToFront(view)
                }
            }
        }
    }
    
    func hide() {
        DispatchQueue.main.async {
            self.loaderView?.removeFromSuperview()
            self.loaderView = nil
        }
    }
}
