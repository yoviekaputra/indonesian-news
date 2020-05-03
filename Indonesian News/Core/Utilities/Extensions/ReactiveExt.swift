//
//  ReactiveExt.swift
//  Indonesian News
//
//  Created by yoviekaputra on 03/05/20.
//  Copyright © 2020 multipolar. All rights reserved.
//

import Foundation
import RxSwift
import Moya

extension Reactive where Base : MoyaProviderType {
    func request<MODEL: Decodable>(_ token: Base.Target, _ model: MODEL.Type) -> Single<MODEL> {
        return self.request(token)
            .map { response in
                self.printData(response)
                return response
            }
            .map(model)
    }
    
    func printData(_ response: Response) {
        do {
            let json = try response.mapJSON()
            print(json)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    /**
     provider.rx.requestAne(.getPopularMovies(page), MoviesConfigModel.self)
     .subscribe { [weak self] (event) in
             self?.isLoading.value = false
             switch event {
             case .success(let _): break
                 //self?.movies.value = response
             case .error(let error):
                 self?.handleError(error)
             }
     }.disposed(by: disposeBag)
     */
}
