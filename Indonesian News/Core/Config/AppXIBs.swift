//
//  AppXIBs.swift
//  Indonesian News
//
//  Created by yoviekaputra on 25/05/20.
//  Copyright © 2020 multipolar. All rights reserved.
//

import Foundation
import UIKit

/*
   ~~~~ PLEASE README ~~~~
   1. If your xib name and viewcontroller name are the same, you can simply call .default when instantiating.
   2. If your xib has a different name than your display controller, you must register in the case

   example in case 3 ->
       a. viewcontroller: ProductViewController.swift
       b. storyboard: Product.storyboard
       c. init and storyboardID class = ProductViewController
       d. Register in your case storyboard:
           + Product case
       e.call using:
       f. ProductViewController.instantiate (storyboard: .Product)
*/

enum AppXIBs : String {
    case NewsDetail
    /* Name get from view controller */
    case `default`
}

extension AppXIBs {
    func getViewID(vc: UIViewController.Type) -> String {
        return self == .default ? "\(vc.self)" : self.rawValue
    }
    
    func viewXIB<T: UIViewController> (
        vcClass: T.Type,
        presentationStyle: UIModalPresentationStyle
    ) -> T {
        let viewID = getViewID(vc: vcClass as UIViewController.Type)
        let controller = vcClass.init(nibName: viewID, bundle: nil)
        controller.modalPresentationStyle = presentationStyle
        return controller
    }
}
