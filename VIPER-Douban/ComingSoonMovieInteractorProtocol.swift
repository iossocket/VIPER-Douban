//
//  ComingSoonMovieInteractorProtocol.swift
//  VIPER-Douban
//
//  Created by XueliangZhu on 2/19/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import RxSwift

protocol ComingSoonMovieInteractorProtocol {
    func fetchMovies(from: Int, count: Int, at: CityName) -> Observable<Array<Movie>>
}
