//
//  ComingSoonMovieRequest.swift
//  VIPER-Douban
//
//  Created by XueliangZhu on 2/19/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import Foundation

struct ComingSoonMovieRequest: Request {
    var path = "/movie/coming_soon"
    var method = APIMethod.get
    var parameter: Dictionary<String, Any>
    var header: Dictionary<String, String>? = nil
    
    typealias Response = MovieResponse
    
    init(from: Int, count: Int, at city: CityName) {
        parameter = ["city": city.rawValue, "start": from, "count": count]
    }
}
