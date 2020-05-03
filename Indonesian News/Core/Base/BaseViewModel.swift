//
//  BaseViewModel.swift
//  Indonesian News
//
//  Created by yoviekaputra on 02/05/20.
//  Copyright © 2020 multipolar. All rights reserved.
//

import Foundation
import RxSwift

class BaseViewModel {
    internal var disposable: DisposeBag?
    
    init(disposable: DisposeBag) {
        self.disposable = disposable
    }
}
