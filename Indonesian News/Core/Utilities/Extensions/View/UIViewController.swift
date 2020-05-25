//
//  UIViewController.swift
//  Indonesian News
//
//  Created by yoviekaputra on 25/05/20.
//  Copyright © 2020 multipolar. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    static func instantiate(
        storyboard: AppStorybards,
        presentationStyle: UIModalPresentationStyle = .automatic
    ) -> Self {
        return storyboard.viewController(vcClass: self, presentationStyle: presentationStyle)
    }
    
    static func instantiate(
        xib: AppXIBs,
        presentationStyle: UIModalPresentationStyle = .automatic
    ) -> Self {
        return xib.viewController(vcClass: self, presentationStyle: presentationStyle)
    }
}
