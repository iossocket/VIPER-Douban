//
//  Request.swift
//  VIPER-Douban
//
//  Created by XueliangZhu on 2/19/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import Foundation

enum APIMethod: String {
    case get
    case post
}

protocol Request {
    var path: String { get }
    var method: APIMethod { get }
    var parameter: Dictionary<String, Any> { get }
    var header: Dictionary<String, String>? { get }
    
    associatedtype Response: Decodable
}
