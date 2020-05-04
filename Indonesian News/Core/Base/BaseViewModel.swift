//
//  BaseViewModel.swift
//  Indonesian News
//
//  Created by yoviekaputra on 02/05/20.
//  Copyright © 2020 multipolar. All rights reserved.
//

import Foundation
import RxSwift

protocol BaseViewModelDelegate {}

class BaseViewModel {
    internal var disposable: DisposeBag!
    internal var loadingObserver = ObservableData<LoaderState>()
    internal var errorObserver = ObservableData<String>()
    
    init(disposable: DisposeBag) {
        self.disposable = disposable
    }
    
    func onError(_ error: Error) {
        errorObserver.value = error.localizedDescription
    }
}
