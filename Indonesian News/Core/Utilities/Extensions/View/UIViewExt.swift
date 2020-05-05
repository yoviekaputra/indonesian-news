//
//  UIViewExt.swift
//  Indonesian News
//
//  Created by yoviekaputra on 04/05/20.
//  Copyright © 2020 multipolar. All rights reserved.
//

import UIKit

extension UIView {
    func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
    
    func tap(_ tapGestureRecognizer: UITapGestureRecognizer) -> Void {
        isUserInteractionEnabled = true
        gestureRecognizers?.removeAll()
        addGestureRecognizer(tapGestureRecognizer)
    }
    
    func tap(target: Any?, action: Selector?) {
        tap(UITapGestureRecognizer(target: target, action: action))
    }
}
