//
//  Top250Request.swift
//  VIPER-Douban
//
//  Created by XueliangZhu on 3/1/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import Foundation

struct Top250Request: Request {
    var path = "/movie/top250"
    var method = APIMethod.get
    var parameter: Dictionary<String, Any>
    var header: Dictionary<String, String>? = nil
    
    typealias Response = MovieResponse
    
    init(from: Int, count: Int) {
        parameter = ["start": from, "count": count]
    }
}
