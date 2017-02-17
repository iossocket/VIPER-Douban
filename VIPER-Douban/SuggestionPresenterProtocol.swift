//
//  SuggestionPresenterProtocol.swift
//  VIPER-Douban
//
//  Created by XueliangZhu on 2/15/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import Foundation

protocol SuggestionPresenterProtocol {
    
    var interactor: SuggestionInteractorProtocol? { get set }
    weak var view: SuggestionViewProtocol? { get set }
    
    func fetchMovies()
    func fetchedMovies(movies: Array<Movie>)
}
