//
//  HorizontalSectionPresenterProtocol.swift
//  VIPER-Douban
//
//  Created by XueliangZhu on 2/24/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import RxSwift

enum MovieType {
    case inTheatre
    case comingSoon
}

protocol HorizontalSectionPresenterProtocol {
    mutating func shouldChangeCurrent(type: MovieType) -> Bool
    mutating func configInTheatreAndComingSoonMovies(movies: InTheatreAndComingSoonMovies?)
    var currentMovies: Array<Any>? { get }
}
