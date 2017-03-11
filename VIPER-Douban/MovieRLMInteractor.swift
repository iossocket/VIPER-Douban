//
//  MovieRLMInteractor.swift
//  VIPER-Douban
//
//  Created by XueliangZhu on 3/7/17.
//  Copyright © 2017 ThoughtWorks. All rights reserved.
//

import RealmSwift

struct MovieRLMInteractor: MovieRLMInteractorProtocol {
    func saveMoviesToRealm(movies: Array<Movie>, type: MovieTypeEnum) -> Array<Movie> {
        let realm = try! Realm()
        let moviesRLM = movies.map { movie -> MovieRLM in
            MovieRLM(movie: movie, type: type)
        }
        try! realm.write {
            realm.add(moviesRLM, update: true)
        }
        return movies
    }
    
    func fetchMoviesFromRealm(type: MovieTypeEnum) -> Array<Movie> {
        let realm = try! Realm()
        let predicate = NSPredicate(format: "type = %@", type.rawValue)
        let movies = realm.objects(MovieRLM.self).filter(predicate)
        var arr = Array<Movie>()
        movies.forEach { item in
            arr.append(Movie(item))
        }
        return arr
    }
    
    func fetchMovieBy(_ id: String) -> Movie? {
        let realm = try! Realm()
        let predicate = NSPredicate(format: "id = %@", id)
        guard let movie = realm.objects(MovieRLM.self).filter(predicate).first else {
            return nil
        }
        return Movie(movie)
    }
}
