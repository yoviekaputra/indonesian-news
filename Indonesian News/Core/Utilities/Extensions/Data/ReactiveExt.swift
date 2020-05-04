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
        self.printRequest(token)
        return self.request(token)
            .map { response in
                self.printResponse(response)
                return response
            }
            .map(model)
    }
    
    func printResponse(_ response: Response) {
        do {
            let json = try response.mapJSON()
            print("\n--> [\(response.statusCode)] RESPONSE")
            print(json)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func printRequest(_ token: Base.Target) {
        print("\n--> [\(token.method.rawValue.uppercased())] \(token.baseURL.absoluteString)\(token.path)")
        if let headers = token.headers {
            print("--> HEADER \n \(headers)")
        }
        print("--> PARAM \\ BODY \n\(token.task)")
    }
}
