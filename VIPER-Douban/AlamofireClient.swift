//
//  AlamofireClient.swift
//  VIPER-Douban
//
//  Created by XueliangZhu on 2/19/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift
import RxAlamofire

struct AlamofireClient: Client {
    let host = "https://api.douban.com/v2"
    
    func send<T : Request>(_ request: T) -> Observable<T.Response?> {
        let url = "\(host)\(request.path)"
        let method = mapAPIMethodToHTTPMethod(apiMethod: request.method)
        return RxAlamofire.requestJSON(method, url, parameters: request.parameter, encoding: URLEncoding.default, headers: request.header).map({ (response, data) -> T.Response? in
            T.Response.parse(data: data)
        })
    }
    
    private func mapAPIMethodToHTTPMethod(apiMethod: APIMethod) -> HTTPMethod {
        switch apiMethod {
        case .get:
            return HTTPMethod.get
        case .post:
            return HTTPMethod.post
        }
    }
}
