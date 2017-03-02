//
//  Top250InteractorProtocol.swift
//  VIPER-Douban
//
//  Created by XueliangZhu on 3/1/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import RxSwift

protocol Top250InteractorProtocol {
    func fetchMovies(from: Int, count: Int) -> Observable<Array<Movie>>
}
