//
//  InTheatreMovieInteractorProtocol.swift
//  VIPER-Douban
//
//  Created by XueliangZhu on 2/15/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import RxSwift

protocol InTheatreMovieInteractorProtocol {
    func fetchMovies(from: Int, count: Int, at: CityName) -> Observable<Array<Movie>>
}
