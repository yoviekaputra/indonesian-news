//
//  MainCoordinator.swift
//  Indonesian News
//
//  Created by yoviekaputra on 25/05/20.
//  Copyright © 2020 multipolar. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator : Coordinator {
    var childCoordinators = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navController: UINavigationController) {
        navigationController = navController
    }
    
    func start() {
        let controller = DashboardViewController.instantiate(storyboard: .Main)
        controller.coordinator = self
        navigationController.pushViewController(controller, animated: true)
    }
    
    func gotoNewsDetail(news: NewsModel) {
        let controller = NewsDetailViewController.instantiate(xib: .default)
        controller.coordinator = self
        controller.news = news
        navigationController.pushViewController(controller, animated: true)
    }
}
