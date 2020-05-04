//
//  AlertUtil.swift
//  Indonesian News
//
//  Created by yoviekaputra on 02/05/20.
//  Copyright © 2020 multipolar. All rights reserved.
//

import UIKit

class AlertBuilder {
    
    private static let alertBuilder: AlertBuilder = { return AlertBuilder() }()
    
    class func shared() -> AlertBuilder { return alertBuilder }
    
    private init() {}
    
    func show(
        _ viewController: UIViewController,
        title: String?,
        message: String?,
        
        label_agree: String = "OK",
        label_disagree: String? = nil,
        label_close: String? = nil,
        
        agree: @escaping () -> Void = {},
        disagree: @escaping () -> Void = {},
        close: @escaping () -> Void = {}
    ) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: label_agree, style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            agree()
        }))
        
        if let label_disagree = label_disagree {
            alert.addAction(UIAlertAction(title: label_disagree, style: .default, handler: { (action) in
                alert.dismiss(animated: true, completion: nil)
                disagree()
            }))
        }
        
        if let label_close = label_close {
            alert.addAction(UIAlertAction(title: label_close, style: .default, handler: { (action) in
                alert.dismiss(animated: true, completion: nil)
                close()
            }))
        }
        viewController.present(alert, animated: true, completion: nil)
    }
}
