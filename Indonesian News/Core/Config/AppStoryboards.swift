//
//  AppStoryboards.swift
//  Indonesian News
//
//  Created by yoviekaputra on 25/05/20.
//  Copyright © 2020 multipolar. All rights reserved.
//

import Foundation
import UIKit

/*
    ~~~~ PLEASE README ~~~~
    1. Your view controller must have the same name as the storyboardID in the storyboard (view controller -> identifier -> StoryboardID)
    2. If your storyboard name and viewcontroller name are the same, you can simply call .default when instantiating.
    3. If your storyboard has a different name than your display controller, you must register in the case

    example in case 3 ->
        a. viewcontroller: ProductViewController.swift
        b. storyboard: Product.storyboard
        c. init and storyboardID class = ProductViewController
        d. Register in your case storyboard:
            + Product case
        e.call using:
        f. ProductViewController.instantiate (storyboard: .Product)
 */

enum AppStorybards : String {
    case Main

    /* Name get from view controller */
    case `default`
}

extension AppStorybards {
    func getStoryboard(vc: UIViewController.Type) -> UIStoryboard {
        let storyboardID = self == .default ? "\(vc.self)" : self.rawValue
        return UIStoryboard(name: storyboardID, bundle: nil)
    }
    
    func viewController<T: UIViewController>(
        vcClass: T.Type,
        presentationStyle: UIModalPresentationStyle
    ) -> T {
        let vc = vcClass as UIViewController.Type
        let storyboard = getStoryboard(vc: vc)
        let controller = storyboard.instantiateViewController(identifier: "\(vc.self)") as T
        controller.modalPresentationStyle = presentationStyle
        return controller
    }
}
