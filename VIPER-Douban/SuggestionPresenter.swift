//
//  SuggestionPresenter.swift
//  VIPER-Douban
//
//  Created by XueliangZhu on 2/15/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import RxSwift

class SuggestionPresenter: SuggestionPresenterProtocol {
    
    var inTheatreInteractor: InTheatreMovieInteractorProtocol?
    var comingSoonInteractor: ComingSoonMovieInteractorProtocol?
    let disposeBag = DisposeBag()
    
    func fetchMovies() -> Observable<(inTheatre: Array<Movie>, comingSoon: Array<Movie>)> {
        inTheatreInteractor = InTheatreMovieInteractor()
        comingSoonInteractor = ComingSoonMovieInteractor()
        let inTheatreObservable = inTheatreInteractor!.fetchMovies(from: 0, count: 5, at: .xian)
        let comingSoonObservable = comingSoonInteractor!.fetchMovies(from: 0, count: 5, at: .xian)
        
        return Observable.combineLatest(inTheatreObservable, comingSoonObservable) { (inTheatre, comingSoon) -> (inTheatre: Array<Movie>, comingSoon: Array<Movie>) in
            return (inTheatre, comingSoon)
        }
    }
}
