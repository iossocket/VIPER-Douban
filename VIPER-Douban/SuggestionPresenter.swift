//
//  SuggestionPresenter.swift
//  VIPER-Douban
//
//  Created by XueliangZhu on 2/15/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import RxSwift
import IGListKit

class SuggestionPresenter: SuggestionPresenterProtocol {
    
    let inTheatreInteractor = container.resolve(InTheatreMovieInteractorProtocol.self)
    let comingSoonInteractor = container.resolve(ComingSoonMovieInteractorProtocol.self)
    
    func fetchMovies() -> Observable<InTheatreAndComingSoonMovies> {
        let inTheatreObservable = inTheatreInteractor!.fetchMovies(from: 0, count: 5, at: .xian).map { movies -> Array<DisplayMovie> in
            return movies.map({ movie -> DisplayMovie in
                DisplayMovie(id: movie.id, imageUrl: movie.images.large)
            })
        }
        let comingSoonObservable = comingSoonInteractor!.fetchMovies(from: 0, count: 5, at: .xian).map { movies -> Array<DisplayMovie> in
            return movies.map({ movie -> DisplayMovie in
                DisplayMovie(id: movie.id, imageUrl: movie.images.large)
            })
        }
        
        return Observable.combineLatest(inTheatreObservable, comingSoonObservable) { (inTheatre, comingSoon) -> InTheatreAndComingSoonMovies in
            InTheatreAndComingSoonMovies(inTheatre: inTheatre, comingSoon: comingSoon)
        }
    }
}
