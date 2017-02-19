//
//  SuggestionPresenter.swift
//  VIPER-Douban
//
//  Created by XueliangZhu on 2/15/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import Foundation
import RxSwift

class SuggestionPresenter: SuggestionPresenterProtocol {
    
    var interactor: InTheatreMovieInteractorProtocol?
    let disposeBag = DisposeBag()
    
    func fetchMovies() -> Observable<Array<Movie>> {
        interactor = InTheatreMovieInteractor()
        return interactor!.fetchMovies(from: 0, count: 5, at: .xian)
    }
}
