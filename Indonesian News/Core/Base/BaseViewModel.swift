//
//  BaseViewModel.swift
//  Indonesian News
//
//  Created by yoviekaputra on 02/05/20.
//  Copyright © 2020 multipolar. All rights reserved.
//

import Foundation
import RxSwift

protocol BaseViewModelDelegate {
    func onError(_ error: Error)
    
    func onError(_ error: String)
}

class BaseViewModel : BaseViewModelDelegate {
    internal var disposable: DisposeBag!
    internal var loadingObserver = ObservableData<LoaderState>()
    internal var errorObserver = ObservableData<String>()
    
    init(disposable: DisposeBag) {
        self.disposable = disposable
    }
    
    func onError(_ error: Error) {
        onError(error.localizedDescription)
    }
    
    func onError(_ error: String) {
        errorObserver.value = error
    }
}
