//
//  SuggestionPresenter.swift
//  VIPER-Douban
//
//  Created by XueliangZhu on 2/15/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import Foundation

class SuggestionPresenter: SuggestionPresenterProtocol {
    
    weak var view: SuggestionViewProtocol?
    var interactor: SuggestionInteractorProtocol?
    
    func fetchMovies() {
        interactor?.fetchMovies(from: 0, count: 5, at: .xian)
    }
    
    func fetchedMovies(movies: Array<Movie>) {
        view?.displayMovies(movies: movies)
    }
}
