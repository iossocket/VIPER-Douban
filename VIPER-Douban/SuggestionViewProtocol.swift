//
//  SuggestionViewProtocol.swift
//  VIPER-Douban
//
//  Created by XueliangZhu on 2/16/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import Foundation

protocol SuggestionViewProtocol: class {
    var presenter: SuggestionPresenterProtocol? { get set }
    func displayMovies(movies: Array<Movie>)
}