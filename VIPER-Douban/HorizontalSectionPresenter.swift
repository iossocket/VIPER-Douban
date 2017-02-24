//
//  HorizontalSectionPresenter.swift
//  VIPER-Douban
//
//  Created by XueliangZhu on 2/24/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import RxSwift

struct HorizontalSectionPresenter: HorizontalSectionPresenterProtocol {
    private var currentType: MovieType
    private var data: InTheatreAndComingSoonMovies?
    
    var currentMovies: Array<Any>? {
        switch (currentType) {
        case .inTheatre:
            return data?.inTheatre
        case .comingSoon:
            return data?.comingSoon
        }
    }
    
    init(currentType: MovieType) {
        self.currentType = currentType
    }
    
    mutating func shouldChangeCurrent(type: MovieType) -> Bool {
        if type == currentType {
            return false
        }
        currentType = type
        return true
    }
    
    mutating func configInTheatreAndComingSoonMovies(movies: InTheatreAndComingSoonMovies?) {
        self.data = movies
    }
}
