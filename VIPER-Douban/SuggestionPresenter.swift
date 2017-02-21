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

class DisplayMovie: NSObject, IGListDiffable {
    var id: String
    var imageUrl: String
    init(id: String, imageUrl: String) {
        self.id = id
        self.imageUrl = imageUrl
        super.init()
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return self
    }
    
    func isEqual(toDiffableObject object: IGListDiffable?) -> Bool {
        guard let other = object as? DisplayMovie else {
            return false
        }
        return self.id == other.id
    }
}

class InTheatreAndComingSoonMovies: NSObject, IGListDiffable {
    let inTheatre: Array<DisplayMovie>
    let comingSoon: Array<DisplayMovie>
    
    init(inTheatre: Array<DisplayMovie>, comingSoon: Array<DisplayMovie>) {
        self.inTheatre = inTheatre
        self.comingSoon = comingSoon
        super.init()
    }
    
    func diffIdentifier() -> NSObjectProtocol {
        return self
    }
    
    func isEqual(toDiffableObject object: IGListDiffable?) -> Bool {
        guard let other = object as? InTheatreAndComingSoonMovies else {
            return false
        }
        let selfId = self.inTheatre.reduce("") { (str, movie) -> String in
            str + movie.id
        }
        let otherId = other.inTheatre.reduce("") { (str, movie) -> String in
            str + movie.id
        }
        return selfId == otherId
    }
}
