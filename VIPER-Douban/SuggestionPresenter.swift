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
    let top250Interactor = container.resolve(Top250InteractorProtocol.self)
    
    func fetchMovies() -> Observable<(InTheatreAndComingSoonMovies, Top250Movies)> {
        let inTheatreObservable = inTheatreInteractor!.fetchMovies(from: 0, count: 5, at: .xian).map { movies -> Array<DisplayMovie> in
            return self.mapMovieToDisplayMovie(movies: movies)
        }
        let comingSoonObservable = comingSoonInteractor!.fetchMovies(from: 0, count: 5, at: .xian).map { movies -> Array<DisplayMovie> in
            return self.mapMovieToDisplayMovie(movies: movies)
        }
        let top250Observable = top250Interactor!.fetchMovies(from: 0, count: 5).map { movies -> Array<DisplayMovie> in
            return self.mapMovieToDisplayMovie(movies: movies)
        }
        
        return Observable.combineLatest(inTheatreObservable, comingSoonObservable, top250Observable) { (inTheatre, comingSoon, top250) -> (InTheatreAndComingSoonMovies, Top250Movies) in
            (InTheatreAndComingSoonMovies(inTheatre: inTheatre, comingSoon: comingSoon), Top250Movies(movies: top250))
        }
    }
    
    private func mapMovieToDisplayMovie(movies: Array<Movie>) -> Array<DisplayMovie> {
        return movies.map({ movie -> DisplayMovie in
            let rating = movie.rating
            let star = rating.average * 5 / Float(rating.max - rating.min)
            return DisplayMovie(id: movie.id, imageUrl: movie.images.large, title: movie.title, star: star)
        })
    }
}
