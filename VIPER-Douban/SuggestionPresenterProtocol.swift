//
//  SuggestionPresenterProtocol.swift
//  VIPER-Douban
//
//  Created by XueliangZhu on 2/15/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import Foundation
import RxSwift

protocol SuggestionPresenterProtocol {
    
    var interactor: SuggestionInteractorProtocol? { get set }
    func fetchMovies() -> Observable<Array<Movie>>
}
