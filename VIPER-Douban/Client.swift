//
//  Client.swift
//  VIPER-Douban
//
//  Created by XueliangZhu on 2/19/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import Foundation
import RxSwift

protocol Client {
    func send<T: Request>(_ r: T) -> Observable<T.Response?>
    var host: String { get }
}
