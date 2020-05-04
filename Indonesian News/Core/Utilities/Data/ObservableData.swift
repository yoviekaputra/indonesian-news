//
//  ObservableData.swift
//  Indonesian News
//
//  Created by yoviekaputra on 03/05/20.
//  Copyright © 2020 multipolar. All rights reserved.
//

import RxSwift

class ObservableData<DATA> {
    private let observers = PublishSubject<DATA?>()
    
    var value: DATA? = nil {
        didSet {
            observers.onNext(value)
        }
    }
    
    init(_ data: DATA? = nil) {
        self.value = data
    }
    
    func observe(_ disposeBag: DisposeBag, observer:  @escaping (DATA?) -> Void) {
        observers
            .subscribe(onNext: observer, onError: nil, onCompleted: nil, onDisposed: nil)
            .disposed(by: disposeBag)
    }
}
