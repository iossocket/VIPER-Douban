//
//  SuggestionInteractorProtocol.swift
//  VIPER-Douban
//
//  Created by XueliangZhu on 2/15/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import Foundation
import RxSwift

enum CityName: String {
    case xian = "西安"
}

protocol SuggestionInteractorProtocol {
    func fetchMovies(from: Int, count: Int, at: CityName) -> Observable<Array<Movie>>
}
