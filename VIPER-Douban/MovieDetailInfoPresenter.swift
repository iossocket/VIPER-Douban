//
//  MovieDetailInfoPresenter.swift
//  VIPER-Douban
//
//  Created by XueliangZhu on 20/03/2017.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import Foundation

protocol MovieDetailInfoPresenterProtocol {
    func fetchCurrentMovie(by id: String) -> Movie?
}

struct MovieDetailInfoPresenter: MovieDetailInfoPresenterProtocol {
    let movieInteractor = container.resolve(MovieRLMInteractorProtocol.self)
    
    func fetchCurrentMovie(by id: String) -> Movie? {
        return movieInteractor?.fetchMovieBy(id)
    }
}
